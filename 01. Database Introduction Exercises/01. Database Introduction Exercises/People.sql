-- Problem 7. Create Table People

CREATE DATABASE DatabaseIntroduction

USE DatabaseIntroduction

--Using SQL query create table People with columns:
--•	Id – unique number for every person there will be no more than 231-1 people. (Auto incremented)
--•	Name – full name of the person will be no more than 200 Unicode characters. (Not null)
--•	Picture – image with size up to 2 MB. (Allow nulls)
--•	Height –  In meters. Real number precise up to 2 digits after floating point. (Allow nulls)
--•	Weight –  In kilograms. Real number precise up to 2 digits after floating point. (Allow nulls)
--•	Gender – Possible states are m or f. (Not null)
--•	Birthdate – (Not null)
--•	Biography – detailed biography of the person it can contain max allowed Unicode characters. (Allow nulls)
--Make Id primary key. Populate the table with only 5 records. Submit your CREATE and INSERT statements as Run queries & check DB.

CREATE TABLE People
(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	Name NVARCHAR(200) NOT NULL,
	Picture VARCHAR(MAX),
	Height NUMERIC(4,2),
	[Weight] NUMERIC(5,2),
	Gender CHAR(1) NOT NULL,
	CHECK (Gender in ('m', 'f')),
	Birthdate DATE NOT NULL,
	Biography NVARCHAR(MAX)
)

INSERT INTO People (Name, Picture, Height, [Weight], Gender, Birthdate, Biography)
VALUES
('First User', 'PathToPicture', 1.72, 86.44, 'm', '12/12/2001', 'First User Biography'),
('Second User', 'PathToPicture', 1.53, 86.44, 'f', '12/12/2002', 'Second User Biography'),
('Third User', 'PathToPicture', 1.99, 86.44, 'f', '12/12/2003', NULL),
('Fourth User', 'PathToPicture', 2.10, 86.44, 'm', '12/12/2004', 'Fourth User Biography'),
('Fifth User', 'PathToPicture', 1.88, 86.44, 'm', '12/12/2005', NULL)