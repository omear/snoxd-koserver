CREATE PROCEDURE [RENTAL_ITEM_DESTORY]
	@AccountID		varchar(21),	
	@CharID			varchar(21),
	@nItemNumber	int,
	@nRentalIndex	int,
	@nDurability	smallint,
	@nRet			smallint OUTPUT
AS
DELETE FROM USER_RENTAL_ITEM WHERE strAccountID = @AccountID AND nItemIndex = @nItemNumber
EXEC RENTAL_ITEM_DURABILITY_UPDATE @nRentalIndex, @nDurability
SET @nRet =  1
