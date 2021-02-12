
SELECT *
	FROM Orders
WHERE OrderId = 19

SELECT *
	FROM OrderParts
WHERE OrderId = 19


DELETE FROM OrderParts WHERE OrderId = 19
DELETE FROM Orders WHERE OrderId = 19