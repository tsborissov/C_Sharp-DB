
SELECT MIN(a.AverageSalary)
	FROM
	(
		SELECT DepartmentID, AVG(Salary) AS AverageSalary
			FROM Employees
	GROUP BY DepartmentID
	) AS a


SELECT MIN(c.CountPerManager) AS MinEmployeesPerManager, MAX(c.CountPerManager) AS MaxEmployeesPerManager, AVG(c.CountPerManager) AS AverageEmployeesPerManager
	FROM
	(
		SELECT ManagerID, COUNT(*) AS CountPerManager
			FROM Employees
	GROUP BY ManagerID
	) AS c

	
