
CREATE PROC usp_SearchForFiles(@fileExtension VARCHAR(30))
AS
SELECT
		Id,
		Name,
		CONCAT(Size, 'KB') AS Size

	FROM Files
WHERE Name Like '%' + @fileExtension
ORDER BY Id ASC, Name ASC, Size DESC



GO

DECLARE @fileExtension VARCHAR(30) = 'txt'

SELECT
		Id,
		Name,
		CONCAT(Size, 'KB') AS Size

	FROM Files
WHERE Name Like '%' + @fileExtension
ORDER BY Id ASC, Name ASC, Size DESC


EXEC usp_SearchForFiles 'txt'