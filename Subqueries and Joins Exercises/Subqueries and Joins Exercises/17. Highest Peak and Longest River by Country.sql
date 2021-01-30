
SELECT cr.CountryCode, MAX(r.Length) AS LongestRiverLength
	FROM CountriesRivers AS cr
	RIGHT JOIN Rivers AS r ON r.Id = cr.RiverId
	GROUP BY cr.CountryCode

SELECT mc.CountryCode, MAX(p.Elevation) AS HighestPeakElevation
	FROM Mountains AS m
	JOIN MountainsCountries AS mc ON mc.MountainId = m.Id
	JOIN Peaks AS p ON p.MountainId = m.Id
	GROUP BY mc.CountryCode

SELECT TOP(5) c.CountryName, hp.HighestPeakElevation, lr.LongestRiverLength
	FROM Countries AS c
	LEFT JOIN
			(
				SELECT mc.CountryCode, MAX(p.Elevation) AS HighestPeakElevation
					FROM Mountains AS m
					JOIN MountainsCountries AS mc ON mc.MountainId = m.Id
					JOIN Peaks AS p ON p.MountainId = m.Id
					GROUP BY mc.CountryCode
			) AS hp ON hp.CountryCode = c.CountryCode
	LEFT JOIN
			(
				SELECT cr.CountryCode, MAX(r.Length) AS LongestRiverLength
					FROM CountriesRivers AS cr
					RIGHT JOIN Rivers AS r ON r.Id = cr.RiverId
					GROUP BY cr.CountryCode
			) AS lr ON lr.CountryCode = c.CountryCode
ORDER BY hp.HighestPeakElevation DESC, lr.LongestRiverLength DESC, c.CountryName ASC