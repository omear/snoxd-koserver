CREATE PROCEDURE [UPDATE_SIEGE_CHALLENGER]
	@sCastleIndex		smallint,
	@strChallengerList	varchar(50)
AS
UPDATE KNIGHTS_SIEGE_WARFARE SET strChallengeList = @strChallengerList WHERE sCastleIndex = @sCastleIndex