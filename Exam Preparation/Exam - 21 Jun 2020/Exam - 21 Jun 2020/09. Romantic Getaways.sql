
-- Find all accounts, which have had one or more trips to a hotel in their hometown.
-- Order them by the trips count (descending), then by Account ID.


	SELECT
			a.Id,
			a.Email,
			ac.Name AS City,
			COUNT(*) AS Trips
			
		FROM AccountsTrips AS at
		JOIN Accounts AS a ON at.AccountId = a.Id
		JOIN Cities AS ac ON a.CityId = ac.Id
		JOIN Trips AS t ON at.TripId = t.Id
		JOIN Rooms AS r ON t.RoomId = r.Id
		JOIN Hotels AS h ON r.HotelId = h.Id
		JOIN Cities AS hc ON h.CityId = hc.Id
	WHERE t.CancelDate IS NULL AND ac.Id = hc.Id
	GROUP BY a.Id, a.Email, ac.Name
ORDER BY Trips DESC, a.Id ASC