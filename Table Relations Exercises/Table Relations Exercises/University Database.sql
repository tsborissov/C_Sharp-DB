CREATE DATABASE University

USE University

CREATE TABLE Subjects
(
	SubjectID INT PRIMARY KEY IDENTITY,
	SubjectName VARCHAR(30) NOT NULL
)

CREATE TABLE Majors
(
	MajorID INT PRIMARY KEY IDENTITY,
	Name VARCHAR(50) NOT NULL
)

CREATE TABLE Students
(
	StudentID INT PRIMARY KEY IDENTITY,
	StudentNumber CHAR(10) NOT NULL,
	StudentName VARCHAR(50) NOT NULL,
	MajorID INT FOREIGN KEY REFERENCES Majors(MajorID)
)

CREATE TABLE Agenda
(
	StudentID INT FOREIGN KEY REFERENCES Students(StudentID),
	SubjectID INT FOREIGN KEY REFERENCES Subjects(SubjectID),

	CONSTRAINT PK_Student_Subject
	PRIMARY KEY (StudentID, SubjectID)
)

CREATE TABLE Payments
(
	PaymentID INT PRIMARY KEY IDENTITY,
	PaymentDate DateTime NOT NULL,
	PaymentAmmount DECIMAL(15,2) NOT NULL,
	StudentID INT FOREIGN KEY REFERENCES Students(StudentID)
)