
SELECT q.DepartmentID, AVG(q.CalculatedSalary) AS AverageSalary
	FROM (
		SELECT DepartmentID,
			CASE
				WHEN DepartmentID = 1 THEN (Salary + 5000)
				ELSE Salary
			END AS CalculatedSalary

			FROM Employees
			WHERE Salary > 30000 AND ManagerID NOT IN (42)
		) AS q
	GROUP BY q.DepartmentID

--Select all employees who earn more than 30000 into a new table.
--Then delete all employees who have ManagerID = 42 (in the new table).
--Then increase the salaries of all employees with DepartmentID=1 by 5000.
--Finally, select the average salaries in each department.



SELECT *
	INTO EmplNewTable
FROM Employees
WHERE Salary > 30000

DELETE FROM EmplNewTable
WHERE ManagerID = 42

UPDATE EmplNewTable
	SET Salary += 5000
WHERE DepartmentID = 1

SELECT DepartmentID, AVG(Salary) AS AverageSalary
	FROM EmplNewTable
GROUP BY DepartmentID