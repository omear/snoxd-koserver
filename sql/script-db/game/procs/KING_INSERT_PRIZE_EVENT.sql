CREATE PROCEDURE [KING_INSERT_PRIZE_EVENT]
	@byType tinyint,
	@byNation tinyint,
	@nAmount int,
	@strUserID varchar(21)
AS
UPDATE KING_SYSTEM SET nNationalTreasury = nNationalTreasury - @nAmount WHERE byNation = @byNation
