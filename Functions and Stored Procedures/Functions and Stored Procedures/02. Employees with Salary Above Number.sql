

CREATE PROC usp_GetEmployeesSalaryAboveNumber (@SalaryTreshold DECIMAL(18,4))
AS
	SELECT FirstName AS [First Name], LastName AS [Last Name]
		FROM Employees
	WHERE Salary >= @SalaryTreshold
GO

DROP PROC usp_GetEmployeesSalaryAboveNumber
GO

EXEC usp_GetEmployeesSalaryAboveNumber 48100