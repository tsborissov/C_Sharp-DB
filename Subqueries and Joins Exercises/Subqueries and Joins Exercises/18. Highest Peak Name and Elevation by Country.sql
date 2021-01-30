
SELECT TOP(5) q.CountryName, q.[Highest Peak Name], q.[Highest Peak Elevation], q.Mountain 

FROM (
		SELECT
			c.CountryName,

				CASE
					WHEN p.PeakName IS NULL THEN '(no highest peak)'
					ELSE p.PeakName
			END AS [Highest Peak Name],

				CASE
					WHEN p.Elevation IS NULL THEN 0
					ELSE p.Elevation
			END AS [Highest Peak Elevation],

				CASE
					WHEN m.MountainRange IS NULL THEN '(no mountain)'
					ELSE m.MountainRange
			END AS [Mountain],

			DENSE_RANK() OVER (PARTITION BY c.CountryCode ORDER BY p.Elevation DESC) AS [Rank]


			FROM MountainsCountries AS mc
			RIGHT JOIN Countries AS c ON c.CountryCode = mc.CountryCode
			LEFT JOIN Mountains AS m ON m.Id = mc.MountainId
			LEFT JOIN Peaks AS p ON p.MountainId = m.Id 
			
			) AS q

	WHERE q.Rank = 1
	ORDER BY q.CountryName, q.[Highest Peak Name]

