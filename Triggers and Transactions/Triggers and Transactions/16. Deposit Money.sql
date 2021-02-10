
CREATE PROC usp_DepositMoney (@AccountId INT, @MoneyAmount MONEY)
AS
BEGIN TRANSACTION

IF NOT EXISTS (SELECT * FROM Accounts WHERE Id = @AccountId)
BEGIN
	ROLLBACK;
	THROW 50001, 'Not existing account!', 1;
END

IF @MoneyAmount < 0
BEGIN
	ROLLBACK;
	THROW 50002, 'Not valid MoneyAmount!', 1;
END

UPDATE Accounts SET Balance += @MoneyAmount WHERE Id = @AccountId

COMMIT

SELECT * FROM Accounts WHERE Id = 1

EXEC usp_DepositMoney 1, 10000