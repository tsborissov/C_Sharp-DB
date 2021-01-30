
SELECT TOP(10) e.FirstName, e.LastName, e.DepartmentID
	FROM Employees AS e

	JOIN (
			SELECT DepartmentID, AVG(Salary) AS AverageSalary
				FROM Employees
			GROUP BY DepartmentID) AS a ON a.DepartmentID = e.DepartmentID

WHERE e.Salary > a.AverageSalary
ORDER BY e.DepartmentID


	SELECT TOP(10) e.FirstName, e.LastName, e.DepartmentID
		FROM Employees AS e
	WHERE e.Salary > (SELECT AVG(Salary) FROM Employees WHERE DepartmentID = e.DepartmentID)
ORDER BY DepartmentID