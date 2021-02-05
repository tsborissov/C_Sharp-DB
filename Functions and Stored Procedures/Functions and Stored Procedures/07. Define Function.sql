USE SoftUni

GO

DECLARE @setOfLetters NVARCHAR(MAX) = 'oistmiha'
DECLARE @Word NVARCHAR(MAX) = 'Sofia'
DECLARE @WordLength INT = LEN(@Word)
DECLARE @CurrentLetter CHAR(1)
DECLARE @isComprised BIT

WHILE (@WordLength > 0)
BEGIN
	SET @CurrentLetter = SUBSTRING(@Word,@WordLength,1)
	IF (@setOfLetters LIKE '%' + @CurrentLetter + '%')
		BEGIN
			SET @isComprised = 1
		END
	ELSE
		BEGIN
			SET @isComprised = 0
			BREAK
		END

	SET @WordLength -= 1
END

SELECT @WordLength
SELECT @isComprised

GO

CREATE FUNCTION ufn_IsWordComprised(@setOfLetters NVARCHAR(MAX), @Word NVARCHAR(MAX))
RETURNS BIT
AS
BEGIN
	DECLARE @WordLength INT = LEN(@Word);
	DECLARE @CurrentLetter CHAR(1);
	DECLARE @isComprised BIT;

	WHILE (@WordLength > 0)
	BEGIN
		SET @CurrentLetter = SUBSTRING(@Word,@WordLength,1);
		IF (@setOfLetters LIKE '%' + @CurrentLetter + '%')
			BEGIN
				SET @isComprised = 1;
			END
		ELSE
			BEGIN
				SET @isComprised = 0;
				BREAK;
			END
	
		SET @WordLength -= 1;
	END

	RETURN @isComprised;
END

GO

DROP FUNCTION dbo.ufn_IsWordComprised

GO

SELECT dbo.ufn_IsWordComprised ('oistmiahf', 'Sofia')

GO

CREATE FUNCTION ufn_IsWordComprised_ver2 (@setOfLetters NVARCHAR(MAX), @Word NVARCHAR(MAX))
RETURNS BIT
AS
BEGIN
	DECLARE @Counter INT = 1;
	DECLARE @CurrentLetter CHAR(1);

	WHILE (@Counter <= LEN(@Word))
	BEGIN
		SET @CurrentLetter = SUBSTRING(@Word, @Counter, 1);
		IF (CHARINDEX(@CurrentLetter, @setOfLetters) = 0)
			RETURN 0;
		SET @Counter +=1
	END

	RETURN 1;
END

GO


SELECT dbo.ufn_IsWordComprised_ver2('oistmihf', 'Sofia')