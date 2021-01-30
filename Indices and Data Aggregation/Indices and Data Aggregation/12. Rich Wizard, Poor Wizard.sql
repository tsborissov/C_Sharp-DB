
--Host Wizard	Host Wizard Deposit	Guest Wizard	Guest Wizard Deposit

SELECT SUM(result.Difference) AS SumDifference
	FROM
		(SELECT *, (q.[Host Wizard Deposit] - q.[Guest Wizard Deposit]) AS [Difference]
			FROM
				(SELECT
					FirstName AS [Host Wizard],
					DepositAmount AS [Host Wizard Deposit],
					LEAD(FirstName, 1, NULL) OVER (ORDER BY Id) AS [Guest Wizard],
					LEAD(DepositAmount, 1, NULL) OVER (ORDER BY Id) AS [Guest Wizard Deposit]
				FROM WizzardDeposits
				) AS q
		) AS result
GO

SELECT SUM(h.DepositAmount - g.DepositAmount) AS SumDifference
	FROM WizzardDeposits AS h
	JOIN WizzardDeposits AS g ON g.Id = h.Id + 1
GO