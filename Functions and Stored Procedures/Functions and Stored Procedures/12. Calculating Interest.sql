USE Bank

GO

SELECT *
	FROM AccountHolders

SELECT *
	FROM Accounts


GO

CREATE PROC usp_CalculateFutureValueForAccount (@accountID INT, @InterestRate FLOAT)
AS

DECLARE @Period INT = 5;

SELECT 
		a.Id, 
		ah.FirstName AS [First Name], 
		ah.LastName AS [Last Name], 
		a.Balance AS [Current Balance],
		dbo.ufn_CalculateFutureValue (a.Balance, @InterestRate, @Period) AS [Balance in 5 years]
	FROM Accounts AS a
	JOIN AccountHolders AS ah ON ah.Id = a.AccountHolderId
WHERE a.Id = @accountID

EXEC usp_CalculateFutureValueForAccount 1, 0.1