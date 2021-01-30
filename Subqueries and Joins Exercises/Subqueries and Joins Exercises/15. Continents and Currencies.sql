
USE Geography

SELECT *
	FROM (
		SELECT ContinentCode, CurrencyCode, COUNT(CurrencyCode) AS CurrencyUsage,
				DENSE_RANK() OVER (PARTITION BY ContinentCode ORDER BY COUNT(CurrencyCode) DESC) AS [Rank]
			FROM Countries
		GROUP BY ContinentCode, CurrencyCode
		) AS q
	ORDER BY ContinentCode, CurrencyUsage DESC

SELECT ContinentCode, CurrencyCode
	FROM Countries
ORDER BY ContinentCode


	SELECT q.ContinentCode, q.CurrencyCode, q.CurrencyUsage FROM
		(SELECT
			ContinentCode,
			CurrencyCode,
			COUNT(CurrencyCode) AS CurrencyUsage,
			DENSE_RANK() OVER (PARTITION BY ContinentCode ORDER BY COUNT(CurrencyCode) DESC) AS [Rank]
				FROM Countries
		GROUP BY ContinentCode, CurrencyCode) AS q
WHERE q.CurrencyUsage > 1 AND q.Rank = 1
ORDER BY q.ContinentCode, q.CurrencyUsage DESC