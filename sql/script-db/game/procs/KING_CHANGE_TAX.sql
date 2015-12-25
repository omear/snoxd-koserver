CREATE PROCEDURE [KING_CHANGE_TAX]
	@byType tinyint,
	@byNation tinyint,
	@nKarusTax1	int, 
	@nKarusTax2	int,
	@nKarusTax3	int,
	@nElmoTax1	int,
	@nElmoTax2  int,
	@nElmoTax3  int
AS
IF @byType = 4
BEGIN
	UPDATE KING_SYSTEM
	SET byTerritoryTariff = @nKarusTax1
	WHERE byNation = @byNation
END
ELSE IF @byType = 2
BEGIN
	UPDATE KING_SYSTEM
	SET nTerritoryTax = @nKarusTax1
	WHERE byNation = @byNation
END
ELSE IF @byType = 5
BEGIN
	UPDATE KING_SYSTEM
	SET nTribute = @nKarusTax1
	WHERE byNation = @byNation
END
ELSE IF @byType = 6
BEGIN
	UPDATE KING_SYSTEM
	SET nTerritoryTax = @nKarusTax1, nTribute = @nKarusTax2, nNationalTreasury = @nKarusTax3
	WHERE byNation = 1

	UPDATE KING_SYSTEM
	SET nTerritoryTax = @nElmoTax1, nTribute = @nElmoTax2, nNationalTreasury = @nElmoTax3
	WHERE byNation = 2
END


