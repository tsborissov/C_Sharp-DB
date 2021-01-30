	
	SELECT DISTINCT q.DepartmentID, q.Salary AS ThirdHighestSalary
		FROM
			(SELECT DepartmentID, Salary,
				DENSE_RANK() OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) AS SalaryRank
				FROM Employees
			) AS q
WHERE q.SalaryRank = 3

	
