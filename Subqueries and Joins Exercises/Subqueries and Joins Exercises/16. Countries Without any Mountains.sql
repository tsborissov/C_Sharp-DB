
SELECT *
	FROM Countries


SELECT COUNT(*) AS [Count] FROM
		(SELECT mc.MountainId
			FROM MountainsCountries AS mc
			RIGHT JOIN Countries AS c ON c.CountryCode = mc.CountryCode
		WHERE mc.MountainId IS NULL) AS q
