
SELECT CountryCode, COUNT(*) AS MountainRanges
	FROM MountainsCountries AS mc
WHERE CountryCode IN ('BG', 'RU', 'US')
GROUP BY CountryCode