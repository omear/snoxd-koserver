CREATE PROCEDURE [KING_IMPEACHMENT_ELECTION]
	@byResult		tinyint,
	@byNation		tinyint,
	@strAccountID	varchar(21),
	@strCharID		varchar(21),
	@nRet			smallint OUTPUT
AS
DECLARE  @nRow smallint

SELECT @nRow = COUNT(*) FROM KING_BALLOT_BOX WHERE  strAccountID = @strAccountID
IF @nRow > 0
BEGIN
	SET @nRet = -3
	RETURN
END

IF @byResult = 1
BEGIN
	INSERT INTO KING_BALLOT_BOX (strAccountID, strCharID, byNation, strCandidacyID )
		VALUES ( @strAccountID, @strCharID, @byNation, 'Y' )
END
ELSE IF @byResult = 2
BEGIN
	INSERT INTO KING_BALLOT_BOX (strAccountID, strCharID, byNation, strCandidacyID )
		VALUES ( @strAccountID, @strCharID, @byNation, 'N' )
END

SET @nRet =  1