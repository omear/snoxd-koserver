CREATE PROCEDURE [RENTAL_ITEM_DURABILITY_UPDATE]
	@nRentalIndex  int,
	@nDurability   int
AS
DECLARE @LenderCharID varchar(21), @LenderAccountID varchar(21)

SELECT @LenderCharID = strLenderCharID, @LenderAccountID = strLenderAcID
FROM RENTAL_ITEM_LIST 
WHERE nRentalIndex = @nRentalIndex

UPDATE USER_RENTAL_ITEM
SET sDurability = @nDurability
WHERE strAccountID = @LenderAccountID AND nRentalIndex = @nRentalIndex