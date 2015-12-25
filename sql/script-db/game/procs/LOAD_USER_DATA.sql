CREATE PROCEDURE [LOAD_USER_DATA]
	@AccountID	varchar(21),
	@id			varchar(21),
	@nRet		smallint OUTPUT
AS
DECLARE @charid1 varchar(21), @charid2 varchar(21), @charid3 varchar(21)
BEGIN
	SET @nRet = 0
	SELECT @charid1 = ISNULL(strCharID1, ''), @charid2 = ISNULL(strCharID2, ''), @charid3 = ISNULL(strCharID3, '') FROM ACCOUNT_CHAR WHERE strAccountID = @AccountID
	IF @id NOT IN(@charid1, @charid2, @charid3)
		RETURN

	SELECT 
		Nation, Race, Class, HairRGB, Rank, Title, [Level], [Exp], Loyalty, 
		Face, City, Knights, Fame, Hp, Mp, Sp, Strong, Sta, Dex, Intel, Cha, 
		Authority, Points, Gold, [Zone], Bind, PX, PZ, PY, dwTime, 
		strSkill, strItem, strSerial, sQuestCount, strQuest, 
		MannerPoint, LoyaltyMonthly
	FROM 
		USERDATA 
	WHERE 
		strUserId = @id

	SET @nRet = @@ROWCOUNT
END
