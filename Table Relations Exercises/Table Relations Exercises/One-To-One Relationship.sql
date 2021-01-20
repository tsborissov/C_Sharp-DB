CREATE DATABASE PersonsPassports

USE PersonsPassports

--PersonID	FirstName	Salary	PassportID

--PassportID	PassportNumber

CREATE TABLE Passports
(
	PassportID INT PRIMARY KEY IDENTITY(101, 1),
	PassportNumber CHAR(8) NOT NULL
)


CREATE TABLE Persons
(
	PersonID INT PRIMARY KEY IDENTITY,
	FirstName NVARCHAR(100) NOT NULL,
	Salary DECIMAL(8,2),
	PassportID INT UNIQUE,
	-- PassportID INT UNIQUE FOREIGH KEY REFERENCES Passports(PassportID)
	
	CONSTRAINT FK_Persons_Passports
	FOREIGN KEY (PassportID)
	REFERENCES Passports(PassportID)
)

INSERT INTO Passports VALUES
('N34FG21B'),
('K65LO4R7'),
('ZE657QP2')

INSERT INTO Persons VALUES
('Roberto', 43300.00,	102),
('Tom', 56100.00, 103),
('Yana', 60200.00, 101)


SELECT Persons.FirstName, Persons.Salary, Passports.PassportNumber FROM
	Persons 
	JOIN Passports
	ON Passports.PassportID=Persons.PassportID

SELECT * FROM
	Passports 
	JOIN Persons
	ON Passports.PassportID=Persons.PassportID