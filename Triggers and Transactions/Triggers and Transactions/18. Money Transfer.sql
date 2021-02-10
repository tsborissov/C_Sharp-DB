
CREATE PROC usp_TransferMoney (@SenderId INT, @ReceiverId INT, @Amount MONEY)
AS
BEGIN TRANSACTION

EXEC usp_WithdrawMoney @SenderId, @Amount
EXEC usp_DepositMoney @ReceiverId, @Amount

COMMIT

GO

SELECT * FROM Accounts

EXEC usp_TransferMoney 5, 1, 5000