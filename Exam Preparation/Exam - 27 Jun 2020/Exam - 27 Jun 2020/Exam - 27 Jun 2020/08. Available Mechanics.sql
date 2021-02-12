

	SELECT DISTINCT m.FirstName + ' ' + m.LastName AS Available, m.MechanicId
		FROM Mechanics AS m
		LEFT JOIN Jobs AS j ON m.MechanicId = j.MechanicId
	WHERE j.JobId IS NULL OR m.MechanicId
		NOT IN (SELECT MechanicId FROM Jobs WHERE Status != 'Finished' AND MechanicId IS NOT NULL)
ORDER BY m.MechanicId