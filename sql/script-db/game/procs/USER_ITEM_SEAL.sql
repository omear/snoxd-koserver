CREATE PROCEDURE [USER_ITEM_SEAL]
	@strAccountID		varchar(21),
	@strUserID		varchar(21),
	@strPasswd		varchar(8),
	@nItemSerial		bigint,
	@nItemID		int,
	@bSealType		tinyint,
	@bDoSeal		bit,
	@nRet			smallint OUTPUT
AS
DECLARE @strSealPasswd varchar(8)
BEGIN

	SET @nRet = 2 --Default error : "Item Sealing failed."

	SELECT @strSealPasswd = strSealPassword FROM TB_USER WHERE strAccountID = @strAccountID
	IF @strSealPasswd <> @strPasswd
	BEGIN
		SET @nRet = 4 --"Invalid Citizen Registration number"
		RETURN
	END
	ELSE
	BEGIN
		IF @bDoSeal = 1			--If we are sealing
			INSERT INTO SEALED_ITEMS (strAccountID, strUserID, nItemSerial, nItemID, bSealType) VALUES (@strAccountID, @strUserID, @nItemSerial, @nItemID, @bSealType)
		ELSE IF @bDoSeal = 0	--If we are unsealing
			DELETE FROM SEALED_ITEMS WHERE nItemSerial = @nItemSerial AND strAccountID = @strAccountID AND strUserID = @strUserID AND nItemID = @nItemID

		SET @nRet = 1 -- "Success!"
	END
END
