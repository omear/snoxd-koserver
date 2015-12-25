CREATE PROCEDURE [MAIL_BOX_GET_ITEM]
	@strRecipientID	varchar(21),
	@nLetterID		int
AS
BEGIN
	-- Retrieve the item
	SELECT 
		nItemID, sCount, sDurability, nCoins, nSerialNum
	FROM MAIL_BOX
	WHERE 
		id = @nLetterID AND 
		strRecipientID = @strRecipientID 
		AND bStatus = 1
	
	-- Mark letter as read/items obtained
	UPDATE 
		MAIL_BOX 
	SET 
		bStatus = 2
	WHERE 
		id = @nLetterID AND 
		strRecipientID = @strRecipientID 
END