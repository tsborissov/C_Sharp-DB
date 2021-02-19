
SELECT TOP(5)
		rc.RepositoryId AS Id,
		r.Name,
		COUNT(*) AS Commits


	FROM RepositoriesContributors AS rc
	JOIN Repositories AS r ON r.Id = rc.RepositoryId
	JOIN Commits AS c ON c.RepositoryId = r.Id
GROUP BY rc.RepositoryId, r.Name
ORDER BY Commits DESC, rc.RepositoryId, r.Name