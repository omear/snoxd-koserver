CREATE PROCEDURE [KING_UPDATE_ELECTION_SCHDULE]
	@byType		tinyint,
	@byNation	tinyint,
	@sYear		smallint,
	@byMonth	tinyint,
	@byDay		tinyint,
	@byHour		tinyint,
	@byMinute	tinyint
AS
IF @byType = 0
BEGIN
	UPDATE KING_SYSTEM SET byType=@byType, sYear=@sYear, byMonth=@byMonth, byDay=@byDay, byHour=@byHour, byMinute=@byMinute,
				 byImType = 0, sImYear=0, byImMonth=0, byImDay=0, byImHour=0, byImMinute=0, strKingName=null
	WHERE byNation = @byNation
END
ELSE
BEGIN
	UPDATE KING_SYSTEM SET byType=@byType, sYear=@sYear, byMonth=@byMonth, byDay=@byDay, byHour=@byHour, byMinute=@byMinute
	WHERE byNation = @byNation
END
