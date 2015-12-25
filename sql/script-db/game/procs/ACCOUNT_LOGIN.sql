-- Handles accounts logging into the game server
-- i.e. when selecting the server at the server list
--
-- Returns:
-- 0 on error
-- 1 to indicate no nation selected
-- 2/3 to indicate Karus/El Morad nation (respectively) has already been selected
CREATE PROCEDURE [dbo].[ACCOUNT_LOGIN]
	@AccountID	varchar(21),
	@Password	varchar(32),
	@nRet		smallint	OUTPUT
AS
DECLARE @pwd varchar(32), @strAuthority tinyint, @Nation tinyint, @CharNum int
BEGIN
	SET @nRet = 0
	SELECT @pwd = strPasswd, @strAuthority = strAuthority FROM [KN_Accounts].[dbo].[TB_USER] WHERE strAccountID = @AccountID
	IF (@@ROWCOUNT = 0 
		OR @strAuthority = 255 -- banned
		-- OR @pwd != @Password -- password check disabled for now
		) 
		RETURN

	SELECT @Nation = bNation, @CharNum = bCharNum FROM ACCOUNT_CHAR WHERE strAccountID = @AccountID
	IF @@ROWCOUNT = 0 OR @CharNum = 0
		SET @nRet = 1
	ELSE
		SET @nRet = @Nation + 1
END
