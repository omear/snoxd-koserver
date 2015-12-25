CREATE PROCEDURE [KING_UPDATE_NOAH_OR_EXP_EVENT]
	@byType tinyint,
	@byNation tinyint,
	@byAmount tinyint,
	@byDay tinyint,
	@byHout tinyint,
	@byMinute tinyint,
	@sDurationTime	smallint
AS
IF @byType = 1
BEGIN
	UPDATE KING_SYSTEM
	SET byNoahEvent = @byAmount, byNoahEvent_Day = @byDay, byNoahEvent_Hour = @byHout, 
		byNoahEvent_Minute = @byMinute, sNoahEvent_Duration = @sDurationTime
	WHERE byNation = @byNation
END
ELSE IF @byType = 2
BEGIN
	UPDATE KING_SYSTEM
	SET byExpEvent = @byAmount, byExpEvent_Day = @byDay, byExpEvent_Hour = @byHout, 
		byExpEvent_Minute = @byMinute, sExpEvent_Duration = @sDurationTime
	WHERE byNation = @byNation
END