	
	SELECT e.FirstName, e.LastName, t.Name
		FROM Employees AS e
		JOIN Addresses AS a ON a.AddressID = e.AddressID
		JOIN Towns AS t on t.TownID = a.TownID
WHERE t.Name = 'Sofia'

GO


CREATE PROC usp_GetEmployeesFromTown  (@Town NVARCHAR(MAX))
AS
	SELECT e.FirstName AS [First Name], e.LastName AS [Last Name]
		FROM Employees AS e
		JOIN Addresses AS a ON a.AddressID = e.AddressID
		JOIN Towns AS t on t.TownID = a.TownID
	WHERE t.Name = @Town
GO

EXEC usp_GetEmployeesFromTown 'Sofia'