/*

Create a user defined function (udf_GetCost) that receives a job’s ID
and returns the total cost of all parts that were ordered for it.
Return 0 if there are no orders.

Parameters:
•	JobId

*/

CREATE FUNCTION udf_GetCost (@jobId INT)
RETURNS DECIMAL(15,2)
AS
BEGIN

DECLARE @Result DECIMAL(15,2)

SET @Result =
			(
				SELECT SUM(op.Quantity * p.Price) AS [Result]
					FROM Jobs AS j
					JOIN Orders AS o ON o.JobId = j.JobId
					JOIN OrderParts AS op ON op.OrderId = o.OrderId
					JOIN Parts AS p ON p.PartId = op.PartId
				WHERE j.JobId = @jobId
			GROUP BY j.JobId
			)

RETURN ISNULL(@Result, 0)

END



GO



SELECT dbo.udf_GetCost(3)

GO
	SELECT j.JobId, SUM(op.Quantity * p.Price) AS [Result]
		FROM Jobs AS j
		JOIN Orders AS o ON o.JobId = j.JobId
		JOIN OrderParts AS op ON op.OrderId = o.OrderId
		JOIN Parts AS p ON p.PartId = op.PartId
	WHERE j.JobId = 3
GROUP BY j.JobId



	SELECT *, (op.Quantity * p.Price) AS [Result]
		FROM Jobs AS j
		JOIN Orders AS o ON o.JobId = j.JobId
		JOIN OrderParts AS op ON op.OrderId = o.OrderId
		JOIN Parts AS p ON p.PartId = op.PartId
	--WHERE j.JobId = 1
ORDER BY j.JobId, o.OrderId

	SELECT *
		FROM PartsNeeded