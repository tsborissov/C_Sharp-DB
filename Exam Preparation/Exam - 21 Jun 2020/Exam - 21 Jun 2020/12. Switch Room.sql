CREATE PROC usp_SwitchRoom(@TripId INT, @TargetRoomId INT)
AS
DECLARE @CurrentRoomHotelId INT
DECLARE @TargetRoomHotelId INT

DECLARE @BedsNeeded INT
DECLARE @TargetRoomBeds INT

SET @CurrentRoomHotelId =
	(SELECT r.HotelId
			FROM Trips AS t
			JOIN Rooms AS r ON t.RoomId = r.Id
	WHERE t.Id = @TripId)

SET @TargetRoomHotelId =
	(SELECT HotelId
			FROM Rooms
	WHERE Id = @TargetRoomId)

IF (@CurrentRoomHotelId != @TargetRoomHotelId)
	THROW 50001, 'Target room is in another hotel!', 1

SET @BedsNeeded = 
	(SELECT COUNT(*)
			FROM AccountsTrips
	WHERE TripId = @TripId)

SET @TargetRoomBeds =
	(SELECT Beds
			FROM Rooms
	WHERE Id = @TargetRoomId)

IF (@BedsNeeded > @TargetRoomBeds)
	THROW 50002, 'Not enough beds in target room!', 1

	UPDATE Trips 
		SET RoomId = @TargetRoomId
WHERE Id = @TripId

GO


EXEC usp_SwitchRoom 10, 7

EXEC usp_SwitchRoom 10, 8

EXEC usp_SwitchRoom 10, 11

SELECT RoomId FROM Trips WHERE Id = 10
