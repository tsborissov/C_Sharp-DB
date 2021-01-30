USE Geography

-- CountryCode	MountainRange	PeakName	Elevation

SELECT c.CountryCode, m.MountainRange, p.PeakName, p.Elevation
	FROM MountainsCountries AS mc
	JOIN Countries AS c ON c.CountryCode = mc.CountryCode AND c.CountryCode = 'BG'
	JOIN Mountains AS m ON m.Id = mc.MountainId
	JOIN Peaks AS p ON p.MountainId = m.Id
WHERE p.Elevation > 2835
ORDER BY p.Elevation DESC