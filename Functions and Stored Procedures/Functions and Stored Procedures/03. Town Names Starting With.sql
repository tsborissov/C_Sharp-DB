
USE SoftUni

DROP PROC usp_GetTownsStartingWith
GO

CREATE PROC usp_GetTownsStartingWith (@StartingString VARCHAR(MAX))
AS
	SELECT Name AS [Town]
		FROM Towns
	WHERE Name LIKE @StartingString + '%'
GO

EXEC usp_GetTownsStartingWith 'b'


DECLARE @StartingString VARCHAR(10) = 'B'

SELECT *
	FROM Towns
	WHERE NAME LIKE @StartingString +'%'