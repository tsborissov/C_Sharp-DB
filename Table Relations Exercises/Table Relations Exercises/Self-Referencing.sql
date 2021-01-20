CREATE DATABASE TeachersManagers

USE TeachersManagers

CREATE TABLE Teachers
(
	TeacherID INT PRIMARY KEY IDENTITY(101,1),
	Name VARCHAR(50) NOT NULL,
	ManagerID INT,

	CONSTRAINT FK_TeacherID_ManagerID
	FOREIGN KEY (ManagerID)
	REFERENCES Teachers(TeacherID)
)

INSERT INTO Teachers VALUES
('John', NULL),
('Maya', 106),
('Silvia', 106),
('Ted',	105),
('Mark', 101),
('Greta', 101)


SELECT * FROM Teachers
