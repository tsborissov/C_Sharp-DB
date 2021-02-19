
-- Delete repository "Softuni-Teamwork" in repository contributors and issues



DECLARE @targetRepositoryId INT = (SELECT Id FROM Repositories WHERE Name = 'Softuni-Teamwork')
DECLARE @targetCommitId INT = (SELECT Id FROM Commits WHERE RepositoryId = @targetRepositoryId)

DELETE
	FROM Files
WHERE CommitId = @targetCommitId

DELETE
	FROM Commits
WHERE RepositoryId = @targetRepositoryId

DELETE
	FROM Issues
WHERE RepositoryId = @targetRepositoryId

DELETE
	FROM RepositoriesContributors
WHERE RepositoryId = @targetRepositoryId

DELETE
	FROM Repositories
WHERE Id = @targetRepositoryId


GO

DECLARE @targetRepositoryId INT = (SELECT Id FROM Repositories WHERE Name = 'Softuni-Teamwork')
DECLARE @targetCommitId INT = (SELECT Id FROM Commits WHERE RepositoryId = @targetRepositoryId)
DECLARE @targetFileId INT = (SELECT ParentId From Files WHERE CommitId = @targetCommitId)


SELECT *
	FROM Repositories
WHERE Id = @targetRepositoryId

SELECT *
	FROM Commits
WHERE RepositoryId = @targetRepositoryId

SELECT *
	FROM Issues
WHERE RepositoryId = @targetRepositoryId

SELECT *
	FROM RepositoriesContributors
WHERE RepositoryId = @targetRepositoryId

SELECT *
	FROM Files
WHERE CommitId = @targetCommitId

SELECT *
	FROM Issues
WHERE RepositoryId = @targetRepositoryId