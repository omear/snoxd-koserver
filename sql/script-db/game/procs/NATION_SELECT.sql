CREATE PROCEDURE [NATION_SELECT]
	@nRet		smallint	OUTPUT,
	@AccountID 	varchar(21),
	@Nation	tinyint
AS

DECLARE @Row tinyint
BEGIN TRAN	

	SELECT @Row = COUNT(*) FROM  ACCOUNT_CHAR  WHERE strAccountID = @AccountID
	IF @Row = 0
		INSERT INTO ACCOUNT_CHAR (strAccountID, bNation ) VALUES (@AccountID, @Nation)
	ELSE
		UPDATE ACCOUNT_CHAR SET bNation = @Nation WHERE strAccountID = @AccountID AND bCharNum = 0
		 
	SELECT @Row = COUNT(*) FROM  WAREHOUSE  WHERE strAccountID = @AccountID
	IF @Row = 0	
		INSERT INTO WAREHOUSE ( strAccountID ) VALUES (@AccountID)

	IF @@ERROR <> 0
	BEGIN	 
		ROLLBACK TRAN 
		SET @nRet =  -2	
		RETURN
	END
	
COMMIT TRAN
SET @nRet =  1

