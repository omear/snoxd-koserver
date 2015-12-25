CREATE PROCEDURE [RANK_KNIGHTS]
AS

DECLARE @KnightsIndex smallint, @SumLoyalty int
DECLARE @Knights_1 smallint, @Knights_2 smallint, @Knights_3 smallint, @Knights_4 smallint, @Knights_5 smallint

UPDATE KNIGHTS SET Points=0
SET NOCOUNT ON

DECLARE job1 CURSOR FOR
SELECT IDNum FROM KNIGHTS

OPEN job1
FETCH NEXT FROM job1
INTO @KnightsIndex
WHILE @@fetch_status = 0 
BEGIN
	SELECT @SumLoyalty = SUM(Loyalty) FROM USERDATA WHERE Knights = @KnightsIndex AND City <> 255 AND Authority <> 0
	IF @SumLoyalty <> 0
		UPDATE KNIGHTS SET Points = @SumLoyalty WHERE IDNum = @KnightsIndex

	FETCH NEXT FROM job1
	INTO @KnightsIndex
END
CLOSE job1
DEALLOCATE job1
SET NOCOUNT OFF

-- ranking 
UPDATE KNIGHTS SET Ranking=0 WHERE Ranking>0

-- ranking procedure call
EXEC KNIGHTS_RATING_UPDATE 

SELECT @Knights_1 = shIndex FROM KNIGHTS_RATING WHERE nRank=1
SELECT @Knights_2 = shIndex FROM KNIGHTS_RATING WHERE nRank=2
SELECT @Knights_3 = shIndex FROM KNIGHTS_RATING WHERE nRank=3
SELECT @Knights_4 = shIndex FROM KNIGHTS_RATING WHERE nRank=4
SELECT @Knights_5 = shIndex FROM KNIGHTS_RATING WHERE nRank=5

UPDATE KNIGHTS SET Ranking=1 WHERE IDNum=@Knights_1
UPDATE KNIGHTS SET Ranking=2 WHERE IDNum=@Knights_2
UPDATE KNIGHTS SET Ranking=3 WHERE IDNum=@Knights_3
UPDATE KNIGHTS SET Ranking=4 WHERE IDNum=@Knights_4
UPDATE KNIGHTS SET Ranking=5 WHERE IDNum=@Knights_5