CREATE PROCEDURE [CHANGE_HAIR]
	@strAccountID	varchar(21),
	@strCharID		varchar(21),
	@bType			tinyint,
	@bFace			tinyint,
	@nHair			int,
	@nRet			tinyint output
AS
BEGIN
	SET @nRet = 1 -- failed

	-- Make sure the account/char combination exists
	IF (NOT EXISTS(SELECT strAccountID FROM ACCOUNT_CHAR WHERE strAccountID = @strAccountID AND @strCharID IN(strCharID1, strCharID2, strCharID3)))
		RETURN

	-- TO-DO: When we have more info on the type (and moreover, when this should be called)
	-- we'll implement better checks (as is, anyone can use this whenever they like).

	-- Update the hair/face data
	UPDATE USERDATA SET HairRGB = @nHair, Face = @bFace WHERE strUserID = @strCharID 
	SET @nRet = 0 -- succeeded
END
