CREATE PROCEDURE [LOAD_RENTAL_DATA]
	@strAccountID	varchar(21)
AS

DECLARE @current_time smalldatetime
SET @current_time = getutcdate()

SELECT strUserID, byRentalType, byRegType, nRentalIndex, nItemIndex, sDurability, nSerialNumber, nRentalMoney, sRentalTime, sDuringTime=datediff( n, timeRental, @current_time ), timeRental
FROM USER_RENTAL_ITEM
WHERE strAccountID = @strAccountID

DELETE FROM USER_RENTAL_ITEM 
WHERE strAccountID = @strAccountID and (byRentalType=2 or byRentalType=3) and sRentalTime< datediff( n, timeRental, @current_time ) 

UPDATE USER_RENTAL_ITEM
SET nRentalMoney = 0
WHERE strAccountID = @strAccountID and byRentalType=2 and nRentalMoney>0