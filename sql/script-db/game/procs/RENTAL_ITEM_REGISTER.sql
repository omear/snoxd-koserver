CREATE PROCEDURE [RENTAL_ITEM_REGISTER]
	@charID			varchar(21),	
	@AccountID		varchar(21),
	@sRentalTime	smallint,
	@nItemID		int,
	@sDurability	smallint,
	@nMoney			int,
	@bGameBangType	tinyint,
	@bItemType		tinyint,
	@bItemClass		tinyint,
	@nSerialNumber 	bigint,
	@nRet_Index   	int OUTPUT,
	@nRet			smallint OUTPUT
AS

DECLARE @Row tinyint, @nRentalIndex int
DECLARE @timeRegister smalldatetime
SET @Row = 0
SET @nRet_Index  = -1
SET @timeRegister = GETUTCDATE()

SELECT @Row = COUNT(*) FROM RENTAL_ITEM WHERE nItemIndex = @nItemID and strLenderAcID = @AccountID 
IF @Row > 0
BEGIN
	SET @nRet =  -9
	RETURN
END

BEGIN TRAN	

	INSERT INTO 
	RENTAL_ITEM ( nItemIndex, sDurability, nSerialNumber, byRegType, byItemType, byClass, sRentalTime, nRentalMoney, strLenderCharID, strLenderAcID ) 
	VALUES	 (@nItemID, @sDurability, @nSerialNumber, @bGameBangType, @bItemType, @bItemClass, @sRentalTime, @nMoney, @charID, @AccountID )
	
	IF @@ERROR <> 0
	BEGIN	 
		ROLLBACK TRAN 
		SET @nRet =  -16
		RETURN
	END

	SELECT @nRentalIndex = nRentalIndex FROM RENTAL_ITEM WHERE nItemIndex = @nItemID and strLenderAcID = @AccountID 

	INSERT INTO 
	USER_RENTAL_ITEM ( strUserID, strAccountID, byRentalType, byRegType, nRentalIndex, nItemIndex, sDurability, nSerialNumber, nRentalMoney, sRentalTime, sDuringTime, timeRegister ) 
	VALUES	         ( @charID, @AccountID, 1, @bGameBangType, @nRentalIndex, @nItemID, @sDurability, @nSerialNumber, @nMoney,  @sRentalTime, @sRentalTime, @timeRegister )

	IF @@ERROR <> 0
	BEGIN	 
		ROLLBACK TRAN 
		SET @nRet =  -17
		RETURN
	END

	SET @nRet_Index  = @nRentalIndex

COMMIT TRAN
SET @nRet =  1