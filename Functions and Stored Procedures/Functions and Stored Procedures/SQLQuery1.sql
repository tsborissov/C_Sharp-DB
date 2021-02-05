
DECLARE @Counter INT = 0;

WHILE (@Counter <= 10)
BEGIN
	SELECT @Counter;
	SET @Counter += 1;
END

