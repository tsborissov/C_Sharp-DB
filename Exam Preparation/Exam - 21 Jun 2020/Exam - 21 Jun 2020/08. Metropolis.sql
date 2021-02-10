
-- Find the top 10 cities, which have the most registered accounts in them. Order them by the count of accounts (descending).

	SELECT TOP(10)
			c.Id,
			c.Name AS City,
			c.CountryCode AS Country,
			COUNT(*) AS Accounts

		FROM Accounts AS a
		JOIN Cities AS c ON a.CityId = c.Id
	GROUP BY c.Id, c.Name, c.CountryCode
ORDER BY Accounts DESC