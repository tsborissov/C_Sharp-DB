
USE Diablo

GO

SELECT *
	FROM UserGameItems AS ugi
	JOIN UsersGames AS ug ON ug.GameId = ugi.UserGameId
	JOIN Items as i ON i.Id = ugi.ItemId
WHERE i.MinLevel > ug.Level

GO

CREATE TRIGGER tr_PreventInsertingItemsAboveSpecifiedLevel
ON UserGameItems 
INSTEAD OF INSERT
AS

DECLARE @itemId INT = (SELECT ItemId FROM inserted)
DECLARE @userGameID INT = (SELECT UserGameId FROM inserted)

DECLARE @itemLevel INT = (SELECT MinLevel FROM Items WHERE Id = @itemId)
DECLARE @userGameLevel INT = (SELECT [Level] FROM UsersGames WHERE Id = @userGameID)

IF (@userGameLevel >= @itemLevel)
BEGIN
	INSERT INTO UserGameItems (ItemId, UserGameId)
		VALUES (@itemId, @userGameID)
END

GO

SELECT *
	FROM UserGameItems
WHERE ItemId = 2 AND UserGameId = 6

SELECT *
	FROM UsersGames
WHERE Id = 38

SELECT *
	FROM Items
WHERE Id = 2

INSERT INTO UserGameItems (ItemId, UserGameId)
	VALUES (2, 6)