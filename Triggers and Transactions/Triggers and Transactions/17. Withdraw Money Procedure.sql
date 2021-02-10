
CREATE PROC usp_WithdrawMoney (@AccountId INT, @MoneyAmount MONEY)
AS

BEGIN TRANSACTION

IF NOT EXISTS (SELECT Id FROM Accounts WHERE Id = @AccountId)
BEGIN
	ROLLBACK;
	THROW 50001, 'Invalid AccountID!', 1;
END

IF @MoneyAmount < 0
BEGIN
	ROLLBACK;
	THROW 50002, 'Invalid Amount!', 1;
END

IF (SELECT Balance FROM Accounts WHERE Id = @AccountId) < @MoneyAmount
BEGIN
	ROLLBACK;
	THROW 50003, 'Not enough funds!',1;
END


UPDATE Accounts SET Balance -=@MoneyAmount WHERE Id = @AccountId;

COMMIT

GO

SELECT * FROM Accounts WHERE Id = 5

EXEC usp_WithdrawMoney 5, 25000