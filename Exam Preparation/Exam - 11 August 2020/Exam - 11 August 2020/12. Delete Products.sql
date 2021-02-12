
CREATE TRIGGER tr_DeleteProduct
ON Products
INSTEAD OF DELETE
AS
	DELETE FROM Feedbacks
		WHERE ProductId IN (SELECT Id FROM deleted)

	DELETE FROM ProductsIngredients
		WHERE ProductId IN (SELECT Id FROM deleted)

	DELETE FROM	Products
		WHERE Id = (SELECT Id FROM deleted)
GO


DECLARE @TargetId INT = 1

SELECT * FROM Feedbacks WHERE ProductId = @TargetId
SELECT * FROM ProductsIngredients WHERE ProductId = @TargetId
SELECT * FROM Products WHERE Id = @TargetId

DELETE FROM Products WHERE Id = 8