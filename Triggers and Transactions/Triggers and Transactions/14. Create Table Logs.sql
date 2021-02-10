CREATE TABLE Logs
	(
		LogID INT PRIMARY KEY IDENTITY,
		AccountID INT FOREIGN KEY REFERENCES Accounts(Id) NOT NULL,
		OldSum MONEY NOT NULL,
		NewSum MONEY NOT NULL
	)

GO

ALTER TABLE Logs
ADD [Date] DATETIME

GO


ALTER TRIGGER tr_AddToLogsOnAccountChanges
ON Accounts FOR UPDATE
AS

DECLARE @accountId INT = (SELECT Id FROM inserted)
DECLARE @oldSum MONEY = (SELECT Balance FROM deleted)
DECLARE @newSum MONEY = (SELECT Balance FROM inserted)


INSERT INTO Logs (AccountID, OldSum, NewSum, [Date])
	VALUES(@accountId, @oldSum, @newSum, GETDATE())

GO

CREATE PROC usp_TransferBetweenAccounts (@FromId INT, @ToId INT, @Amount MONEY)
AS

BEGIN TRANSACTION

IF NOT EXISTS(SELECT * FROM Accounts WHERE Id = @FromId)
BEGIN
	ROLLBACK;
	THROW 50001, 'Not existing account to withdraw from!', 1;
END

IF NOT EXISTS(SELECT * FROM Accounts WHERE Id = @ToId)
BEGIN
	ROLLBACK;
	THROW 50002, 'Not existing account to transfer to!', 1;
END

IF ((SELECT Balance FROM Accounts WHERE Id = @FromId) < @Amount)
BEGIN
	ROLLBACK;
	THROW 50003, 'Not enough amount!', 1;
END

UPDATE Accounts SET Balance -= @Amount WHERE Id = @FromId;
UPDATE Accounts SET Balance += @Amount WHERE Id = @ToId;

COMMIT

GO

EXEC usp_TransferBetweenAccounts 3, 1, 1000