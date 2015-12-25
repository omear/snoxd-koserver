CREATE PROCEDURE [KING_IMPEACHMENT_REQUEST_ELECTION]
	@byType smallint,
	@byNation tinyint,
	@strUserID varchar(21)
AS
UPDATE KING_ELECTION_LIST SET nKnights = @byType WHERE strName = @strUserID and byType = 2
