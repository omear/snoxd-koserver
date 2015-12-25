CREATE PROCEDURE [MAIL_BOX_SEND]
	@strSenderID	varchar(21),
	@strRecipientID	varchar(21),
	@strSubject		varchar(31),
	@strMessage		varchar(128),
	@bType			tinyint,
	@nItemID		int,
	@sCount			smallint,
	@sDurability	smallint,
	@nSerialNum		bigint,
	@bRet			tinyint OUTPUT
AS
BEGIN
	IF (NOT EXISTS(SELECT strUserID FROM USERDATA WHERE strUserID = @strRecipientID))
	BEGIN
		SET @bRet = -1
		RETURN
	END
	
	-- NOTE: -2 seems to be too many letters.
	
	INSERT INTO MAIL_BOX 
		(strSenderID, strRecipientID, strSubject, strMessage,
		 bType, nItemID, sCount, sDurability, nSerialNum)
	VALUES
		(@strSenderID, @strRecipientID, @strSubject, @strMessage,
		 @bType, @nItemID, @sCount, @sDurability, @nSerialNum)
		 
	SET @bRet = 1
END