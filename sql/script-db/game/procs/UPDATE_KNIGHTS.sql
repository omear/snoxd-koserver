CREATE PROCEDURE [UPDATE_KNIGHTS]
	@nRet			smallint OUTPUT, 
	@Type			tinyint,
	@UserId 		varchar(21), 
	@KnightsIndex	smallint,
	@Domination		tinyint
AS
DECLARE @Row tinyint, @Members int, @UserMembers int, @KnightsNumber smallint
DECLARE @ViceChief_1 varchar(21), @ViceChief_2 varchar(21), @ViceChief_3 varchar(21)

	SET @Row = 0
	SET @KnightsNumber = 0

	SELECT @Row = COUNT(*) FROM KNIGHTS WHERE IDNum = @KnightsIndex

	-- If the user's not being removed from a clan, and the clan doesn't exist... reject the request.
	-- NOTE: The latter part of this check was added.
	IF @Row = 0 AND @Type NOT IN(19, 20, 23)
	BEGIN
		SET @nRet =  7
		RETURN
	END
  
	IF @Type = 18
	BEGIN
		SELECT @KnightsNumber = Knights FROM USERDATA WHERE strUserId = @UserId
		IF (@KnightsNumber <= 0)
		BEGIN
			SELECT TOP 1 @KnightsNumber = sIDNum FROM KNIGHTS_USER WHERE strUserID = @UserId
			IF (@KnightsNumber IS NOT NULL)
			BEGIN
				DELETE FROM KNIGHTS_USER WHERE strUserId = @UserId AND sIDNum = @KnightsNumber
				UPDATE KNIGHTS SET Members = (SELECT COUNT(*) FROM USERDATA WHERE Knights = @KnightsNumber) WHERE IDNum = @KnightsNumber
			END
		END
		
		IF EXISTS (SELECT strUserId FROM KNIGHTS_USER WHERE strUserId = @UserId)
		BEGIN
			SET @nRet =  5
			RETURN
		END
	END

	SELECT @Members = Members, @ViceChief_1=ViceChief_1, @ViceChief_2=ViceChief_2, @ViceChief_3=ViceChief_3 FROM KNIGHTS WHERE IDNum = @KnightsIndex
	IF @Type = 18
	BEGIN
		SELECT @UserMembers = COUNT(*) FROM USERDATA WHERE Knights = @KnightsIndex
		IF @Members >= 36 or @UserMembers >= 36 
		BEGIN
			SET @nRet =  8
			RETURN
		END
	END
	ELSE IF @Type NOT IN(19, 20, 23) AND @Members > 36
	BEGIN
		SET @nRet =  8
		RETURN
	END

	SELECT @Row = COUNT(*) FROM USERDATA WHERE strUserId = @UserId
	IF @Row = 0 
	BEGIN
		SET @nRet =  2
		RETURN
	END

--SELECT @ViceChief_1=ViceChief_1, @ViceChief_2=ViceChief_2, @ViceChief_3=ViceChief_3  FROM KNIGHTS WHERE IDNum = @KnightsIndex	

BEGIN TRAN	
	IF @Type = 18					-- JOIN
		BEGIN
        UPDATE KNIGHTS SET Members = Members + 1 WHERE IDNum = @KnightsIndex
        INSERT INTO KNIGHTS_USER ( sIDNum, strUserID  ) VALUES	 (@KnightsIndex,  @UserId )
        UPDATE USERDATA SET Knights=@KnightsIndex WHERE strUserId = @UserId
		END
	ELSE IF @Type = 19 or @Type = 20 or @Type = 23	-- WITHDRAW, REMOVE, REJECT
		BEGIN
			IF @Members <= 1
				UPDATE KNIGHTS SET Members = 1 WHERE IDNum = @KnightsIndex
			ELSE 
				UPDATE KNIGHTS SET Members = Members - 1 WHERE IDNum = @KnightsIndex
			DELETE FROM KNIGHTS_USER WHERE strUserID = @UserId
			IF @ViceChief_1 = @UserId
				UPDATE KNIGHTS SET ViceChief_1 = NULL WHERE IDNum = @KnightsIndex	
			IF @ViceChief_2 = @UserId
				UPDATE KNIGHTS SET ViceChief_2 = NULL WHERE IDNum = @KnightsIndex	
			IF @ViceChief_3 = @UserId
				UPDATE KNIGHTS SET ViceChief_3 = NULL WHERE IDNum = @KnightsIndex	
		END
	ELSE IF @Type = 25				-- Change Chief, ????? ??? ???? ????? ??? ??????? ??? ??? ???
		BEGIN
			UPDATE KNIGHTS SET Chief = @UserId WHERE IDNum = @KnightsIndex
			IF @ViceChief_1 = @UserId
				UPDATE KNIGHTS SET ViceChief_1 = NULL WHERE IDNum = @KnightsIndex	
			IF @ViceChief_2 = @UserId
				UPDATE KNIGHTS SET ViceChief_2 = NULL WHERE IDNum = @KnightsIndex	
			IF @ViceChief_3 = @UserId
				UPDATE KNIGHTS SET ViceChief_3 = NULL WHERE IDNum = @KnightsIndex	
		END
	ELSE IF @Type = 26				-- Change Vice Chief
		BEGIN
			IF @ViceChief_1 IS NOT NULL AND @ViceChief_2 IS NOT NULL AND @ViceChief_3 IS NOT NULL
			BEGIN
				IF  (LEN(@ViceChief_1) != 0 AND LEN(@ViceChief_2) != 0 AND LEN(@ViceChief_3) != 0)
				BEGIN
					SET @nRet =  8
					COMMIT TRAN
					RETURN
				END
			END

			IF @ViceChief_1 IS NULL OR LEN(@ViceChief_1) = 0
				UPDATE KNIGHTS SET ViceChief_1 = @UserId WHERE IDNum = @KnightsIndex
			ELSE IF @ViceChief_2 IS NULL OR LEN(@ViceChief_2) = 0
				UPDATE KNIGHTS SET ViceChief_2 = @UserId WHERE IDNum = @KnightsIndex
			ELSE IF @ViceChief_3 IS NULL OR LEN(@ViceChief_3) = 0
				UPDATE KNIGHTS SET ViceChief_3 = @UserId WHERE IDNum = @KnightsIndex
		END
--	ELSE IF @Type = 27				-- Change Officer
	--	UPDATE KNIGHTS SET ViceChief_2 = @UserId WHERE IDNum = @KnightsIndex

	IF @@ERROR <> 0
	BEGIN	 
		ROLLBACK TRAN 
		SET @nRet =  2
		RETURN
	END

	IF @Type = 20	-- REMOVE
	BEGIN
		UPDATE USERDATA SET Knights = -1, Fame = 0  WHERE strUserId = @UserId
		DELETE FROM KNIGHTS_USER WHERE strUserID = @UserId
	END

COMMIT TRAN
SET @nRet =  0