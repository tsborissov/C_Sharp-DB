SELECT e.EmployeeID, 
		e.FirstName,
		CASE
			WHEN DATEPART(YEAR, p.StartDate) < 2005 THEN p.Name
			ELSE NULL
		END AS ProjectName
	FROM Employees AS e
	JOIN EmployeesProjects AS ep ON ep.EmployeeID = e.EmployeeID AND e.EmployeeID = 24
	JOIN Projects AS p ON p.ProjectID = ep.ProjectID