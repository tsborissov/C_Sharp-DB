/*
Your task is to create a user defined procedure (usp_PlaceOrder) which accepts job ID, part serial number and   
quantity and creates an order with the specified parameters. If an order already exists for the given job that 
and the order is not issued (order’s issue date is NULL), add the new product to it. If the part is already listed
in the order, add the quantity to the existing one.
When a new order is created, set it’s IssueDate to NULL.
Limitations:
•	An order cannot be placed for a job that is Finished; error message ID 50011 "This job is not active!"
•	The quantity cannot be zero or negative; error message ID 50012 "Part quantity must be more than zero!"
•	The job with given ID must exist in the database; error message ID 50013 "Job not found!"
•	The part with given serial number must exist in the database ID 50014 "Part not found!"
If any of the requirements aren’t met, rollback any changes to the database you’ve made and throw an exception
with the appropriate message and state 1. 
Parameters:
•	JobId
•	Part Serial Number
•	Quantity

*/

-- DROP PROC usp_PlaceOrder

GO

CREATE PROC usp_PlaceOrder (@jobId INT, @serialNumber VARCHAR(50), @quantity INT)
AS
BEGIN TRANSACTION

IF (@quantity <= 0)
BEGIN
	ROLLBACK;
	THROW 50012, 'Part quantity must be more than zero!', 1;
END

IF (NOT EXISTS(SELECT * FROM Jobs WHERE JobId = @jobId))
BEGIN
	ROLLBACK;
	THROW 50013, 'Job not found!', 1;
END

DECLARE @targetJobStatus VARCHAR(11)  = (SELECT Status FROM Jobs WHERE JobId = @jobId)

IF (@targetJobStatus = 'Finished')
BEGIN
	ROLLBACK;
	THROW 50011, 'This job is not active!', 1;
END

DECLARE @targetPartId INT = (SELECT PartId FROM Parts WHERE SerialNumber = @serialNumber)

IF (@targetPartId IS NULL)
BEGIN
	ROLLBACK;
	THROW 50014, 'Part not found!', 1;
END


DECLARE @targetOrderId INT = (SELECT OrderId FROM Orders WHERE JobId = @jobId AND IssueDate IS NULL);

IF (@targetOrderId IS NULL)
	BEGIN
		INSERT INTO Orders (JobId, IssueDate)
		VALUES (@jobId, NULL)
	
		SET @targetOrderId = (SELECT OrderId FROM Orders WHERE JobId = @jobId AND IssueDate IS NULL);
	
		INSERT INTO OrderParts (OrderId, PartId, Quantity)
		VALUES (@targetOrderId, @targetPartId, @quantity)
	END
ELSE
	BEGIN
		IF (EXISTS (SELECT * FROM OrderParts WHERE PartId = @targetPartId))
			BEGIN
				UPDATE OrderParts
					SET Quantity += @quantity
				WHERE OrderId = @targetOrderId AND PartId = @targetPartId
			END
		ELSE
			BEGIN
				INSERT INTO OrderParts (OrderId, PartId, Quantity)
				VALUES (@targetOrderId, @targetPartId, @quantity)
			END
	END

COMMIT

GO

SELECT * FROM Orders WHERE JobId = 51 AND IssueDate IS NULL



DECLARE @err_msg AS NVARCHAR(MAX);
BEGIN TRY
  EXEC usp_PlaceOrder 1, 'ZeroQuantity', 0
END TRY

BEGIN CATCH
  SET @err_msg = ERROR_MESSAGE();
  SELECT @err_msg
END CATCH
