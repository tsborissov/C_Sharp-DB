USE Diablo

GO

CREATE FUNCTION ufn_CashInUsersGames (@GameName VARCHAR(MAX))
RETURNS TABLE
AS
RETURN
(
SELECT SUM(Cash) AS SumCash
	FROM
		(
		SELECT 
			ug.Cash, 
			g.Id, 
			g.Name, 
			ROW_NUMBER() OVER (PARTITION BY g.ID ORDER BY ug.Cash DESC) AS RowNumber
			FROM UsersGames AS ug
			JOIN Games AS g ON g.Id = ug.GameId
		 WHERE g.Name = @GameName
		) AS q
WHERE q.RowNumber % 2 = 1
)

GO

SELECT * FROM ufn_CashInUsersGames('Love in a mist')