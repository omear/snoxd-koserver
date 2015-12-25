CREATE PROCEDURE [KING_CANDIDACY_RECOMMEND]
	@CharID_1	varchar(21),
	@CharID_2	varchar(21),
	@nNation	tinyint,
	@nRet		smallint OUTPUT
AS
DECLARE @nNationValue tinyint, @nKnights smallint

SELECT * FROM KING_ELECTION_LIST WHERE  strName = @CharID_2 and byType = 4
IF @@ROWCOUNT <> 0
BEGIN
	SET @nRet = -5
	RETURN
END

SELECT @nNationValue = Nation, @nKnights = Knights FROM USERDATA WHERE  strUserId = @CharID_2
IF @@ROWCOUNT = 0
BEGIN
	SET @nRet = -1
	RETURN
END

IF @nNationValue <> @nNation
BEGIN
	SET @nRet = -4
	RETURN
END

DELETE FROM KING_ELECTION_LIST WHERE strName = @CharID_1 and byType = 3
IF @@ROWCOUNT = 0
begin 
	SET @nRet = -3
	return
end

INSERT INTO KING_ELECTION_LIST (byType, byNation, nKnights, strName, nMoney )
	VALUES ( 4, @nNation, @nKnights, @CharID_2, 0 )

SET @nRet =  @nKnights


