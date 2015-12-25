CREATE PROCEDURE [KING_CANDIDACY_NOTICE_BOARD_PROC]
	@strUserID varchar(21),
	@sNoticeLen smallint, 
	@byNation tinyint, 
	@strNotice varbinary(1024)
AS
DECLARE  @nRet smallint
SELECT @nRet = COUNT(*) FROM KING_CANDIDACY_NOTICE_BOARD WHERE  strUserID = @strUserID
IF @nRet > 0
BEGIN
	UPDATE KING_CANDIDACY_NOTICE_BOARD
	SET sNoticeLen = @sNoticeLen,
	strNotice = @strNotice
	WHERE strUserID = @strUserID
END
ELSE
BEGIN
	INSERT INTO KING_CANDIDACY_NOTICE_BOARD (strUserID, byNation, sNoticeLen, strNotice )
	VALUES ( @strUserID, @byNation, @sNoticeLen, @strNotice )
END


