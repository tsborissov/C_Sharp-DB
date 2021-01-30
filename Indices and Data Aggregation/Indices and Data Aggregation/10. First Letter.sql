
USE Gringotts


		SELECT LEFT(FirstName, 1) AS FirstLetter --, COUNT(*) AS [Count]
			FROM WizzardDeposits
		WHERE DepositGroup = 'Troll Chest'
	GROUP BY LEFT(FirstName, 1)
ORDER BY FirstLetter ASC

--	SELECT DISTINCT LEFT(FirstName, 1) AS FirstLetter
--		FROM WizzardDeposits
--	WHERE DepositGroup = 'Troll Chest'
--ORDER BY FirstLetter