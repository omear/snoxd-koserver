CREATE PROCEDURE [KING_UPDATE_ELECTION_STATUS]
	@byType tinyint,
	@byNation tinyint
AS

UPDATE KING_SYSTEM SET byType = @byType WHERE byNation = @byNation

IF @byType = 1
BEGIN
	DELETE FROM KING_ELECTION_LIST WHERE byNation = @byNation
	DELETE FROM KING_BALLOT_BOX WHERE byNation = @byNation
	DELETE FROM KING_CANDIDACY_NOTICE_BOARD WHERE byNation = @byNation
END
ELSE IF @byType = 2
BEGIN
	DELETE FROM KING_ELECTION_LIST WHERE byType = 3 and byNation = @byNation
END
ELSE IF @byType = 7 OR @byType = 0
BEGIN
	DELETE FROM KING_ELECTION_LIST WHERE byType = 4 and byNation = @byNation
END
