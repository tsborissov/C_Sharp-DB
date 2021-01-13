--Problem 8.	Create Table Users

--Using SQL query create table Users with columns:
--•	Id – unique number for every user. There will be no more than 263-1 users. (Auto incremented)
--•	Username – unique identifier of the user will be no more than 30 characters (non Unicode). (Required)
--•	Password – password will be no longer than 26 characters (non Unicode). (Required)
--•	ProfilePicture – image with size up to 900 KB. 
--•	LastLoginTime
--•	IsDeleted – shows if the user deleted his/her profile. Possible states are true or false.
--Make Id primary key. Populate the table with exactly 5 records. Submit your CREATE and INSERT statements as Run queries & check DB.

CREATE DATABASE DatabaseIntroduction

USE DatabaseIntroduction


CREATE TABLE Users
(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	Username VARCHAR(30) NOT NULL,
	[Password] VARCHAR(26) NOT NULL,
	ProfilePicture VARCHAR(MAX),
	LastLoginTime DATETIME,
	IsDeleted VARCHAR(5),
	CHECK (IsDeleted in('true', 'false'))
)


INSERT INTO Users VALUES
('firstUserName', 'pass1', 'PathToPicture', '12/12/2020 13:33:33','false'),
('secondUserName', 'pass2', 'PathToPicture', '11/11/2020 13:33:33','false'),
('thirdUserName', 'pass3', 'PathToPicture', '10/10/2020 13:33:33','false'),
('fourthUserName', 'pass4', 'PathToPicture', '12/12/2020 14:44:44','false'),
('fifthUserName', 'pass5', 'PathToPicture', '12/12/2020 13:33:33','true')

ALTER TABLE Users
DROP CONSTRAINT PK__Users__3214EC07327DE213

ALTER TABLE Users
ADD CONSTRAINT PK__Id__Username PRIMARY KEY (Id, Username);

ALTER TABLE Users
ADD CONSTRAINT CHK_PasswordLength CHECK (LEN([Password]) >= 5)

INSERT INTO Users (Username, [Password], ProfilePicture, IsDeleted)
VALUES ('anotherUserName', 'pass6', 'PathToPicture','true')

SELECT * FROM Users

DELETE FROM Users
WHERE Id = 8

ALTER TABLE Users
ADD CONSTRAINT DF_DateTime
DEFAULT GETDATE() FOR LastLoginTime

ALTER TABLE Users
DROP CONSTRAINT PK__Id__Username

ALTER Table Users
Add Constraint PK__Id Primary Key (Id)

Alter Table Users
Add Constraint CHK__UsernameLength CHECK (LEN(Username) >= 3)

INSERT INTO Users (Username, [Password], ProfilePicture, IsDeleted)
VALUES ('ano', 'pass6', 'PathToPicture','true')

SELECT * FROM Users

ALTER DATABASE DatabaseIntroduction SET OFFLINE

DROP DATABASE DatabaseIntroduction