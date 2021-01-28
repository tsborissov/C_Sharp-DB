SELECT TOP(50) 
	e.EmployeeID, 
	CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName, 	
	CONCAT(m.FirstName, ' ', m.LastName) AS ManagerName,
	d.Name AS DepartmentName
		FROM Employees AS e
		JOIN Departments AS d ON d.DepartmentID = e.DepartmentID
		JOIN Employees AS m ON m.EmployeeID = e.ManagerID
ORDER BY e.EmployeeID