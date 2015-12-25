CREATE PROCEDURE [DELETE_KNIGHTS]
	@nRet			smallint OUTPUT,
	@knightsindex		smallint
AS
DECLARE @Row int
SELECT @Row = COUNT(*) FROM KNIGHTS WHERE IDNum = @knightsindex
IF @Row = 0
BEGIN
	SET @nRet = 7
	RETURN
END

BEGIN TRAN
	DELETE FROM KNIGHTS WHERE IDNum = @knightsindex
	DELETE FROM KNIGHTS_USER WHERE sIDNum = @knightsindex

	IF @@ERROR <> 0
	BEGIN
		ROLLBACK TRAN
		SET @nRet = 7
		RETURN 
	END

	UPDATE USERDATA SET Knights = 0, Fame = 0 WHERE Knights = @knightsindex
COMMIT TRAN
SET @nRet = 0

