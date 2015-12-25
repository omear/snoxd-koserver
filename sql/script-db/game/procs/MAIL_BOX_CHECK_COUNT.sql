CREATE PROCEDURE [dbo].[MAIL_BOX_CHECK_COUNT]
	@strRecipientID varchar(21),
	@bCount tinyint OUTPUT
AS
SELECT TOP 12 @bCount = COUNT(*)
FROM MAIL_BOX
WHERE 
	strRecipientID = @strRecipientID AND
	-- Unread letter
	bStatus = 1 AND
	-- Letter is not deleted
	bDeleted = 0