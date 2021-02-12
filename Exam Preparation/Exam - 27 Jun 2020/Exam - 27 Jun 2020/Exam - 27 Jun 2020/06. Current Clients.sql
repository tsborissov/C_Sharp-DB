

DECLARE @CurrentDate DATE = '2017-04-24'

	SELECT
			c.FirstName + ' ' + c.LastName AS Client,
			DATEDIFF(DAY, j.IssueDate, @CurrentDate) AS [Days going],
			j.Status

		FROM Jobs AS j
		JOIN Clients AS c ON j.ClientId = c.ClientId
WHERE j.Status != 'Finished'
ORDER BY [Days going] DESC, c.ClientId ASC