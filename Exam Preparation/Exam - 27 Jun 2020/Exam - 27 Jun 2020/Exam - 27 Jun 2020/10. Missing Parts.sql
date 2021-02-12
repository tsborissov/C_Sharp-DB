/*
List all parts that are needed for active jobs (not Finished) without sufficient quantity in stock
and in pending orders (the sum of parts in stock and parts ordered is less than the required quantity).
Order them by part ID (ascending).

Required columns:
•	Part ID
•	Description
•	Required – number of parts required for active jobs
•	In Stock – how many of the part are currently in stock
•	Ordered – how many of the parts are expected to be delivered (associated with order that is not Delivered)
*/


	SELECT p.PartId, p.Description, SUM(pn.Quantity) AS [Required], SUM(p.StockQty) AS [In Stock], SUM(op.Quantity) AS [Ordered]
		FROM PartsNeeded AS pn
		JOIN Jobs AS j ON j.JobId = pn.JobId
		JOIN Parts AS p ON p.PartId = pn.PartId
		JOIN OrderParts AS op ON op.PartId = p.PartId
	WHERE j.Status != 'Finished' AND pn.Quantity > p.StockQty
	GROUP BY p.PartId, p.Description
ORDER BY p.PartId
