CREATE TABLE NotificationEmails
(
	Id INT PRIMARY KEY IDENTITY,
	Recipient INT NOT NULL,
	Subject NVARCHAR(50) NOT NULL,
	Body NVARCHAR(100)
)

GO

ALTER TABLE NotificationEmails
ADD CONSTRAINT FK_RecipientID_AccountID FOREIGN KEY (Recipient)
REFERENCES Accounts(ID)

GO

ALTER TABLE NotificationEmails
ALTER COLUMN Body NVARCHAR(MAX) NOT NULL


GO

CREATE TRIGGER tr_CreateNewEmailOnNewLogRecord
ON Logs FOR INSERT
AS

DECLARE @recipient INT = (SELECT TOP(1) AccountID FROM inserted);
DECLARE @oldSum MONEY = (SELECT TOP(1) OldSum FROM inserted);
DECLARE @newSum MONEY = (SELECT TOP(1) NewSum FROM inserted);
DECLARE @subject NVARCHAR(50) = 'Balance change for account: ' + CAST(@recipient AS VARCHAR(20));
DECLARE @body NVARCHAR(MAX) = 'On ' + CAST(GETDATE() AS VARCHAR(50)) + ' your balance was changed from ' + CAST(@oldSum AS VARCHAR(30)) + ' to ' + CAST(@newSum AS VARCHAR(30)) + '.';

INSERT INTO NotificationEmails (Recipient, Subject, Body)
	VALUES (@recipient, @subject, @body)


EXEC usp_TransferBetweenAccounts 3, 1, 1000