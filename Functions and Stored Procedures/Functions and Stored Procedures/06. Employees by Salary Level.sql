
DECLARE @TargetSalaryLevel VARCHAR(7) = 'Low'


SELECT FirstName, LastName, Salary, dbo.ufn_GetSalaryLevel(Salary)
	FROM Employees
WHERE dbo.ufn_GetSalaryLevel(Salary) = @TargetSalaryLevel

GO


CREATE PROC usp_EmployeesBySalaryLevel (@TargetSalaryLevel VARCHAR(7))
AS
BEGIN
		SELECT FirstName, LastName
			FROM Employees
	WHERE dbo.ufn_GetSalaryLevel(Salary) = @TargetSalaryLevel
END

GO

EXEC usp_EmployeesBySalaryLevel 'Low'

GO