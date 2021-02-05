
USE SoftUni

GO

SELECT *
	FROM Departments
WHERE DepartmentID = 1

SELECT *
	FROM Employees AS e
	JOIN Departments AS d ON d.ManagerID = e.EmployeeID
WHERE d.DepartmentID = 1

DELETE 
	FROM Departments
WHERE DepartmentID = 1



SELECT *
	FROM EmployeesProjects
WHERE EmployeeID IN (SELECT EmployeeID FROM Employees WHERE DepartmentID = 1)

SELECT * FROM Employees WHERE DepartmentID = 1

SELECT * FROM Employees WHERE ManagerID IN (SELECT EmployeeID FROM Employees WHERE DepartmentID = 1)

SELECT *
	FROM Departments
WHERE ManagerID IN (SELECT EmployeeID FROM Employees WHERE DepartmentID = 1)


	SELECT *
		FROM Employees
WHERE EmployeeID IN (SELECT EmployeeID FROM Employees WHERE DepartmentID = 1)



---------------------------------------------------------------------------------
DROP PROC usp_DeleteEmployeesFromDepartment

GO


CREATE PROC usp_DeleteEmployeesFromDepartment (@departmentId INT)
AS
ALTER TABLE Departments
	ALTER COLUMN ManagerID INT NULL

	UPDATE Departments
		SET ManagerID = NULL
WHERE DepartmentID = @departmentId

	UPDATE Employees
		SET ManagerID = NULL
WHERE EmployeeID IN (SELECT EmployeeID FROM Employees WHERE DepartmentID = @departmentId)

	UPDATE Employees
		SET ManagerID = NULL
WHERE ManagerID IN (SELECT EmployeeID FROM Employees WHERE DepartmentID = @departmentId)
	
	DELETE FROM EmployeesProjects
WHERE EmployeeID IN (SELECT EmployeeID FROM Employees WHERE DepartmentID = @departmentId)

	DELETE FROM Employees
WHERE DepartmentID = @departmentId

	DELETE FROM Departments
WHERE DepartmentID = @departmentId

	SELECT Count(*)
		FROM Employees
WHERE DepartmentID = @departmentId

GO

----------------------------------------------------------------------------------------------

	SELECT *
		FROM Employees
WHERE DepartmentID = 1

	SELECT *
		FROM Departments
WHERE DepartmentID = 1

GO

EXEC usp_DeleteEmployeesFromDepartment 3