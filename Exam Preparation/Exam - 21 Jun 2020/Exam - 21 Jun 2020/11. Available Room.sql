/*
Create a user defined function, named udf_GetAvailableRoom(@HotelId, @Date, @People), that receives a hotel ID, a desired date, 
and the count of people that are going to be signing up.

The total price of the room can be calculated by using this formula:
•	(HotelBaseRate + RoomPrice) * PeopleCount

The function should find a suitable room in the provided hotel, based on these conditions:
•	The room must not be already occupied. A room is occupied if the date the customers want 
to book is between the arrival and return dates of a trip to that room and the trip is not canceled.
•	The room must be in the provided hotel.
•	The room must have enough beds for all the people.

If any rooms in the desired hotel satisfy the customers’ conditions, find the highest priced room (by total price) of all of them
and provide them with that room.

The function must return a message in the format:
•	“Room {Room Id}: {Room Type} ({Beds} beds) - ${Total Price}”

If no room could be found, the function should return “No rooms available”.
*/

CREATE FUNCTION udf_GetAvailableRoom(@HotelId INT, @Date DATE, @People INT)
RETURNS NVARCHAR(MAX)
AS
BEGIN
DECLARE @Result NVARCHAR(MAX)

SET @Result = 
	(SELECT TOP(1)
			'Room ' + CONVERT(NVARCHAR, r.Id) + ': ' + 
			r.Type + ' (' + 
			CONVERT(NVARCHAR, r.Beds) + ' beds) - $' +
			CONVERT(NVARCHAR, (h.BaseRate + r.Price) * @People)

		FROM Rooms AS r
		JOIN Hotels AS h ON r.HotelId = h.Id
	WHERE r.HotelId = @HotelId AND r.Beds >= @People
		AND NOT EXISTS (SELECT * 
							FROM Trips AS t
						WHERE t.RoomId = r.Id 
						AND @Date BETWEEN t.ArrivalDate AND t.ReturnDate
						AND t.CancelDate IS NULL)
		
	ORDER BY (h.BaseRate + r.Price) * @People DESC)
	
IF (@Result IS NULL) SET @Result = 'No rooms available'

RETURN @Result

END

SELECT dbo.udf_GetAvailableRoom(112, '2011-12-17', 2)

SELECT dbo.udf_GetAvailableRoom(94, '2015-07-26', 3)