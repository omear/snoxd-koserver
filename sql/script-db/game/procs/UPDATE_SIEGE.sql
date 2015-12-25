CREATE PROCEDURE [UPDATE_SIEGE]
	@sCastleIndex	smallint,
	@sKnightsIndex	smallint,
	@byWarType		tinyint,
	@byUpdateType	tinyint,
	@byWarDay		tinyint,
	@byWarTime		tinyint,
	@byWarMinute	tinyint
AS
IF @byUpdateType = 1
BEGIN
	UPDATE KNIGHTS_SIEGE_WARFARE SET sMasterKnights = @sKnightsIndex, bySiegeType = @byWarType, 
		byWarDay = @byWarDay, byWarTime = @byWarTime, byWarMinute = @byWarMinute,
		sChallengeList_1 = 0, sChallengeList_2 = 0, sChallengeList_3 = 0,
		sChallengeList_4 = 0, sChallengeList_5 = 0, sChallengeList_6 = 0,
		sChallengeList_7 = 0, sChallengeList_8 = 0, sChallengeList_9 = 0,
		sChallengeList_10 = 0
	 WHERE sCastleIndex = @sCastleIndex
END
ELSE IF @byUpdateType = 2
BEGIN
	UPDATE KNIGHTS_SIEGE_WARFARE SET bySiegeType = @byWarType, 
		byWarDay = @byWarDay, byWarTime = @byWarTime, byWarMinute = @byWarMinute,
		sChallengeList_1 = sMasterKnights, sChallengeList_2 = @sKnightsIndex, sChallengeList_3 = 0,
		sChallengeList_4 = 0, sChallengeList_5 = 0, sChallengeList_6 = 0,
		sChallengeList_7 = 0, sChallengeList_8 = 0, sChallengeList_9 = 0,	sChallengeList_10 = 0
	 WHERE sCastleIndex = @sCastleIndex
END