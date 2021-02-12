
SELECT 
		d.Name AS DistributorName,
		i.Name AS IngredientName,
		af.ProductName,
		af.AverageRate

	FROM
	(
		SELECT 
				p.Id AS ProductId,
				p.Name AS ProductName,
				AVG(f.Rate) AS AverageRate

			FROM Products AS p
			JOIN Feedbacks AS f ON f.ProductId = p.Id
		GROUP BY p.Id, p.Name
	) AS af

	JOIN ProductsIngredients AS pin ON pin.ProductId = af.ProductId
	JOIN Ingredients AS i ON i.Id = pin.IngredientId
	JOIN Distributors AS d ON d.Id = i.DistributorId
WHERE af.AverageRate BETWEEN 5 AND 8
ORDER BY d.Name, i.Name, af.ProductName
