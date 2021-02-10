-- Select all cities with the count of hotels in them.
-- Order them by the hotel count (descending), then by city name.
-- Do not include cities, which have no hotels in them.

	SELECT c.Name AS City, COUNT(*) AS Hotels
		FROM Hotels AS h
		JOIN Cities AS c ON h.CityId = c.Id
	GROUP BY c.Id, c.Name
ORDER BY Hotels DESC, c.Name