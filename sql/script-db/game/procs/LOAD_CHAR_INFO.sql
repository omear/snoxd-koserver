CREATE PROCEDURE [LOAD_CHAR_INFO]
	@strUserID	varchar(21),
	@nRet	smallint OUTPUT
AS
SELECT Race, Class, HairRGB, [Level], Face, Zone, strItem FROM USERDATA WHERE strUserID = @strUserID
SELECT @@ROWCOUNT