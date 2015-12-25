CREATE PROCEDURE [KING_IMPEACHMENT_RESULT]
	@byNation	tinyint,
	@nTotalMan	smallint OUTPUT,
	@nAgreeMan	smallint OUTPUT
AS
SELECT @nTotalMan = COUNT(*) FROM KING_BALLOT_BOX WHERE  byNation = @byNation
SELECT @nAgreeMan = COUNT(*) FROM KING_BALLOT_BOX WHERE  strCandidacyID = 'Y'