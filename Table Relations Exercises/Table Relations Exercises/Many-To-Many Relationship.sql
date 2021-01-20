CREATE DATABASE StudentsExams

USE StudentsExams

CREATE TABLE Students
(
	StudentID INT PRIMARY KEY IDENTITY,
	Name VARCHAR(100)
)

CREATE TABLE Exams
(
	ExamID INT PRIMARY KEY IDENTITY(101,1),
	Name VARCHAR(100)
)

CREATE TABLE StudentsExams
(
	StudentID INT FOREIGN KEY REFERENCES Students(StudentID),
	ExamID INT FOREIGN KEY REFERENCES Exams(ExamID),

	CONSTRAINT PK_Student_Exam
	PRIMARY KEY(StudentID, ExamID)

	--CONSTRAINT FK_Students_StudentsExams
	--FOREIGN KEY (StudentID)
	--REFERENCES Students(StudentID),

	--CONSTRAINT FK_Exams_StudentsExams
	--FOREIGN KEY (ExamID)
	--REFERENCES Exams(ExamID)
)

INSERT INTO Students VALUES
('Mila'),                                      
('Toni'),
('Ron')

INSERT INTO Exams VALUES
('SpringMVC'),
('Neo4j'),
('Oracle 11g')

INSERT INTO StudentsExams VALUES
(1, 101),
(1, 102),
(2, 101),
(3, 103),
(2, 102),
(2, 103)


SELECT * FROM Students

SELECT * FROM Exams

SELECT * FROM StudentsExams

SELECT Students.Name, Exams.Name FROM
Students
INNER JOIN StudentsExams
ON Students.StudentID = StudentsExams.StudentID
INNER JOIN Exams
ON StudentsExams.ExamID = Exams.ExamID
WHERE Exams.Name = 'Oracle 11g'