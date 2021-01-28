	SELECT CountryName, IsoCode
		FROM Countries
		WHERE LEN(CountryName) - LEN(REPLACE(CountryName, 'a', '')) >= 3
ORDER BY IsoCode



	SELECT PeakName, RiverName, LOWER(CONCAT(LEFT(PeakName, LEN(PeakName) - 1), RiverName)) AS Mix
		FROM Peaks, Rivers
	WHERE RIGHT(PeakName, 1) = LEFT(RiverName, 1)
ORDER BY Mix