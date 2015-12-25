CREATE PROCEDURE [UPDATE_BATTLE_HERO]
	@strCharID		varchar(21),
	@strNation		varchar(20),
	@strClass		varchar(30),
	@strAchievement	varchar(50),
	@nIndex			smallint
AS
DECLARE @nRet int

SELECT @nRet = COUNT(strUserID) FROM HERO_USER WHERE shIndex = @nIndex
IF @nRet = 0
	INSERT INTO HERO_USER ( strUserID, strNation, strClass, strAchievement, shIndex )
         	VALUES ( @strCharID, @strNation, @strClass, @strAchievement, @nIndex )
ELSE
	UPDATE HERO_USER SET strUserID = @strCharID, strNation = @strNation, strClass = @strClass, 
		strAchievement = @strAchievement WHERE shIndex = @nIndex

