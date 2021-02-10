
/* Retrieve the following information about each trip:
•	Trip ID
•	Account Full Name
•	From – Account hometown
•	To – Hotel city
•	Duration – the duration between the arrival date and return date in days. If a trip is cancelled, the value is “Canceled”
Order the results by full name, then by Trip ID.
*/

	SELECT 
			t.Id,
			a.FirstName + ' ' + ISNULL(a.MiddleName + ' ', '') + a.LastName AS [Full Name],
			ac.Name AS [From],
			hc.Name AS [To],
			CASE
				WHEN t.CancelDate IS NOT NULL THEN 'Canceled'
				ELSE CONCAT(DATEDIFF(DAY, t.ArrivalDate, t.ReturnDate), ' days')
			END AS Duration
			
			
		FROM Accounts AS a
		JOIN Cities AS ac ON a.CityId = ac.Id
		JOIN AccountsTrips AS at ON at.AccountId = a.Id
		JOIN Trips AS t ON t.Id = at.TripId
		JOIN Rooms AS r ON r.Id = t.RoomId
		JOIN Hotels AS h ON h.Id = r.HotelId
		JOIN Cities AS hc ON hc.Id = h.CityId
	ORDER BY [Full Name] ASC, t.Id