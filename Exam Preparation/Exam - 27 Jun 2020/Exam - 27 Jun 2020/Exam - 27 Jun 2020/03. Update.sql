SELECT *
	FROM Jobs
WHERE Status = 'Pending'

SELECT *
	FROM Jobs
WHERE MechanicId = 3

UPDATE Jobs 
	SET MechanicId = 3, Status = 'In Progress'
WHERE Status = 'Pending'
