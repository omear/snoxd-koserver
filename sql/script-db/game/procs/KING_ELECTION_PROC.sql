CREATE PROCEDURE [KING_ELECTION_PROC]
	@strAccountID	varchar(21),
	@strCharID		varchar(21),
	@byNation		tinyint,
	@strCandidacyID	varchar(21),
	@nRet			smallint OUTPUT
AS
DECLARE @nRow smallint
SELECT @nRow = count(strAccountID) FROM KING_BALLOT_BOX WHERE  strAccountID = @strAccountID
IF @nRow > 0
BEGIN
	SET @nRet = -3
	RETURN
END

DECLARE @Level int
SELECT @Level = [Level] FROM USERDATA WHERE strUserID = @strCharID
IF @Level < 40
BEGIN
    SET @nRet = -3
    RETURN
END

INSERT INTO KING_BALLOT_BOX (strAccountID, strCharID, byNation, strCandidacyID )
	VALUES ( @strAccountID, @strCharID, @byNation, @strCandidacyID )

UPDATE KING_ELECTION_LIST SET nMoney = nMoney+1 
WHERE  byType = 4 and strName = @strCandidacyID

SET @nRet =  1