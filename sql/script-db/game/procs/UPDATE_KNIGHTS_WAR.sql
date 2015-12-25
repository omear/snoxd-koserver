CREATE PROCEDURE [UPDATE_KNIGHTS_WAR]
	@byType		tinyint,
	@shWhite	smallint,
	@shBlue		smallint
AS
DECLARE @strWhiteName char(21), @strBlueName char(21)
IF @byType = 1
BEGIN
	SELECT @strWhiteName = IDName FROM KNIGHTS WHERE IDNum = @shWhite
	SELECT @strBlueName = IDName FROM KNIGHTS WHERE IDNum = @shBlue
	UPDATE KNIGHTS SET nWarEnemyID = @shBlue, strEnemyName = @strBlueName WHERE IDNum = @shWhite
	UPDATE KNIGHTS SET nWarEnemyID = @shWhite, strEnemyName = @strWhiteName WHERE IDNum = @shBlue
END
ELSE IF @byType = 2
BEGIN
	UPDATE KNIGHTS SET byOldWarResult = 2, nLose = nLose+1, nWarEnemyID = 0 WHERE IDNum = @shWhite	-- lose team
	UPDATE KNIGHTS SET byOldWarResult = 1, nVictory = nVictory+1, nWarEnemyID = 0 WHERE IDNum = @shBlue	-- victory team
END