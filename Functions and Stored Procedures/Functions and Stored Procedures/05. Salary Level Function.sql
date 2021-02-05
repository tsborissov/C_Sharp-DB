
DECLARE @Salary DECIMAL(18,4) = 50001

SELECT
	CASE
		WHEN @Salary < 30000 THEN 'Low'
		WHEN @Salary <= 50000 THEN 'Average'
		ELSE 'High'
	END AS [Salary Level]

GO

CREATE FUNCTION ufn_GetSalaryLevel (@Salary DECIMAL(18,4))
RETURNS VARCHAR(7)
AS
BEGIN
	DECLARE @Result VARCHAR(7);

	IF (@Salary < 30000)
	BEGIN
		SET @Result = 'Low'
	END
	ELSE IF (@Salary <= 50000)
	BEGIN
		SET @Result = 'Average'
	END
	ELSE IF (@Salary > 50000)
	BEGIN
		SET @Result = 'High'
	END

	RETURN @Result
END

GO

SELECT Salary, dbo.ufn_GetSalaryLevel_ver2 (Salary) AS [Salary Level]
	FROM Employees

GO


CREATE FUNCTION ufn_GetSalaryLevel_ver2 (@Salary DECIMAL(18,4))
RETURNS VARCHAR(7)
AS
BEGIN

DECLARE @Result VARCHAR(7)

SET @Result = (
	CASE
		WHEN @Salary < 30000 THEN 'Low'
		WHEN @Salary BETWEEN 30000 AND 50000 THEN 'Average'
		WHEN @Salary > 50000 THEN 'High'
	END)

RETURN @Result

END

GO