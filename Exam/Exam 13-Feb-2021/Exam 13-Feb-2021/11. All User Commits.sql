
CREATE FUNCTION udf_AllUserCommits(@username VARCHAR(30))
RETURNS INT
AS
BEGIN
	RETURN (
	SELECT Count(*)
	FROM Users AS u
	JOIN Commits AS c ON c.ContributorId = u.Id
WHERE u.Username = @username
	)
END

GO

DECLARE @username VARCHAR(30) = 'UnderSinduxrein'

SELECT Count(*)
	FROM Users AS u
	JOIN Commits AS c ON c.ContributorId = u.Id
WHERE u.Username = @username


SELECT dbo.udf_AllUserCommits('UnderSinduxrein')