SELECT 
		q.CountryName,
		q.DisributorName

	FROM (	
	SELECT 
			c.Name AS CountryName,
			d.Name AS DisributorName,
			COUNT(*) AS Count,
			RANK() OVER (PARTITION BY c.Name ORDER BY COUNT(*) DESC) AS Rank
			
		FROM Countries AS c
		JOIN Distributors AS d ON d.CountryId = c.Id
		JOIN Ingredients AS i ON i.DistributorId = d.Id
	GROUP BY c.Name, d.Name) AS q
WHERE q.Rank = 1
ORDER BY q.CountryName, q.DisributorName