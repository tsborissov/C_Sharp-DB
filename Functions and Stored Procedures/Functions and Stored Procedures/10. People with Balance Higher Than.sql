--usp_GetHoldersWithBalanceHigherThan (@AccountsBalanceTreshold MONEY)

SELECT *
	FROM AccountHolders

SELECT *
	FROM Accounts

GO

CREATE PROC usp_GetHoldersWithBalanceHigherThan (@AccountsBalanceTreshold MONEY)
AS
SELECT ah.FirstName AS [First Name], ah.LastName AS [Last Name]
	FROM AccountHolders AS ah
	JOIN 
		(SELECT ah.ID, SUM(Balance) AS [BalanceTotal]
			FROM AccountHolders AS ah
			JOIN Accounts AS a ON a.AccountHolderId = ah.Id
		GROUP BY ah.Id) AS q ON q.Id = ah.Id
	WHERE q.BalanceTotal > @AccountsBalanceTreshold
ORDER BY ah.FirstName, ah.LastName
 

GO

EXEC usp_GetHoldersWithBalanceHigherThan 10000