CREATE PROCEDURE [KING_UPDATE_ELECTION_LIST]
	@byDBType tinyint,
	@byType tinyint,
	@byNation tinyint,
	@nKnights smallint,
	@nAmount int,
	@strUserID varchar(21)
AS
IF @byDBType = 1
BEGIN
	INSERT INTO KING_ELECTION_LIST (byType, byNation, nKnights, strName, nMoney )
	VALUES ( @byType, @byNation, @nKnights, @strUserID, @nAmount )
END
ELSE IF @byDBType = 2
BEGIN
	DELETE FROM KING_ELECTION_LIST
	WHERE byType = @byType and strName = @strUserID
END

IF @byType = 1
BEGIN
	SELECT TOP 1 @strUserID = strUserId FROM USERDATA WHERE strUserId = @strUserID
	UPDATE KING_SYSTEM SET strKingName = @strUserID WHERE byNation = @byNation
END


