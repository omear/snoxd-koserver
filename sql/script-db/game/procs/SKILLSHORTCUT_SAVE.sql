CREATE PROCEDURE [SKILLSHORTCUT_SAVE]
	@strCharID		varchar(21),
	@nCount			smallint,
	@strSkillData	varchar(260)
AS
SELECT strCharID FROM USERDATA_SKILLSHORTCUT where strCharID = @strCharID
IF (@@ROWCOUNT = 0)
BEGIN
	INSERT INTO USERDATA_SKILLSHORTCUT
	VALUES(@strCharID, @nCount, @strSkillData)
END
ELSE
BEGIN
	UPDATE USERDATA_SKILLSHORTCUT
	SET nCount = @nCount, strSkillData = @strSkillData
	WHERE strCharID = @strCharID
END