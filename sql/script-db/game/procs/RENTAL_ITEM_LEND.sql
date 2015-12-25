CREATE PROCEDURE [RENTAL_ITEM_LEND]
	@AccountID		varchar(21),
	@CharID			varchar(21),
	@nRentalIndex	int,
	@nItemNumber	int,
	@nRet			smallint OUTPUT
AS
DECLARE @sDurability smallint, @nSerialNumber bigint
DECLARE @bItemType tinyint, @bItemClass tinyint, @sRentalTime smallint, @nMoney int, @LenderCharID varchar(21), @LenderAccountID varchar(21)
DECLARE @timeLend smalldatetime, @timeRegister smalldatetime
SET @timeLend = GETUTCDATE()

SELECT @sDurability=sDurability, @nSerialNumber=nSerialNumber, @bItemType=byItemType, @bItemClass=byClass, 
       @sRentalTime=sRentalTime, @nMoney=nRentalMoney, @LenderCharID=strLenderCharID, @LenderAccountID=strLenderAcID, @timeRegister=timeRegister
FROM RENTAL_ITEM 
WHERE nRentalIndex = @nRentalIndex and nItemIndex = @nItemNumber

IF @bItemType = 0
BEGIN
	SET @nRet =  -5
	RETURN
END

INSERT INTO 
RENTAL_ITEM_LIST ( nRentalIndex, nItemIndex, sDurability, nSerialNumber, byItemType, byClass, sRentalTime, nRentalMoney, strLenderCharID, strLenderAcID, strBorrowerCharID, strBorrowerAcID, timeLender, timeRegister ) 
VALUES	 (@nRentalIndex, @nItemNumber, @sDurability, @nSerialNumber, @bItemType, @bItemClass, @sRentalTime, @nMoney, @LenderCharID, @LenderAccountID, @CharID, @AccountID, @timeLend, @timeLend )

DELETE FROM RENTAL_ITEM WHERE nRentalIndex = @nRentalIndex and nItemIndex = @nItemNumber

INSERT INTO 
USER_RENTAL_ITEM ( strUserID, strAccountID, byRentalType, nRentalIndex, nItemIndex, sDurability, nSerialNumber, nRentalMoney, sRentalTime, sDuringTime, timeRental, timeRegister ) 
VALUES	         ( @CharID,   @AccountID,   3,           @nRentalIndex, @nItemNumber, @sDurability, @nSerialNumber, 0, 	      @sRentalTime, @sRentalTime, @timeLend, @timeRegister )

UPDATE USER_RENTAL_ITEM
SET byRentalType=2, nRentalMoney = @nMoney, timeRental = @timeLend
WHERE strAccountID = @LenderAccountID and nRentalIndex = @nRentalIndex

SET @nRet =  1
