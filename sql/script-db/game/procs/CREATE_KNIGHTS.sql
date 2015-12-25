CREATE PROCEDURE [CREATE_KNIGHTS]
	@nRet		smallint OUTPUT, 
	@index 		smallint,
	@nation		tinyint,
	@community	tinyint,
	@strName 	varchar(21), 
	@strChief	varchar(21)
AS
DECLARE @Row tinyint
SET @Row = 0
SELECT @Row = COUNT(*) FROM KNIGHTS WHERE IDNum = @index or  IDName = @strName

IF @Row > 0 or @index = 0
BEGIN
	SET @nRet =  3
	RETURN
END

BEGIN TRAN	

	INSERT INTO KNIGHTS ( IDNum, Nation, Flag, IDName, Chief  ) 
	VALUES	 (@index, @nation, @community, @strName, @strChief )

	INSERT INTO KNIGHTS_USER ( sIDNum, strUserID  ) 
	VALUES	 (@index,  @strChief )
	
	IF @@ERROR <> 0
	BEGIN	 
		ROLLBACK TRAN 
		SET @nRet =  6
		RETURN
	END

COMMIT TRAN
SET @nRet =  0

