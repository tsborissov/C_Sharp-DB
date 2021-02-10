CREATE FUNCTION ufn_CalculateFutureValue (
	@sum DECIMAL(15, 4),
	@interestRate FLOAT,
	@numberOfYears INT)
RETURNS DECIMAL(15, 4)
AS
BEGIN
	RETURN @sum * POWER((1 + @interestRate), @numberOfYears);
END

GO

SELECT dbo.ufn_CalculateFutureValue(1000, 0.1, 5)

GO

DROP FUNCTION dbo.ufn_CalculateFutureValue