Create Database SoftUni

Use SoftUni



Create Table Towns
(
	Id Int Identity(1,1) Not Null,
	Name VarChar(60) Not Null,
	Constraint PK_TownId Primary Key (Id)
)

Insert Into Towns (Name) Values
('Sofia'), 
('Plovdiv'),
('Varna'),
('Burgas')

Select * From Towns


Create Table Addresses
(
	Id Int Identity(1,1) Not Null,
	AddressText VarChar(120) Not Null,
	TownId Int Not Null,
	Constraint PK_AddressId Primary Key (Id),
	Constraint FK_TownId Foreign Key (TownId) References Towns(Id)
)


Create Table Departments
(
	Id Int Identity(1,1) Not Null,
	Name VarChar(50) Not Null,
	Constraint PK_DepartmentId Primary Key (Id)
)

Insert Into Departments (Name) Values
('Engineering'),
('Sales'),
('Marketing'),
('Software Development'),
('Quality Assurance')

Select * From Departments

Create Table Employees
(
	Id Int Identity(1,1) Not Null,
	FirstName VarChar(50) Not Null,
	MiddleName VarChar(50) Not Null,
	LastName VarChar(50) Not Null,
	JobTitle VarChar(20) Not Null,
	DepartmentId Int Not Null,
	HireDate Date Not Null,
	Salary Decimal Not Null,
	AddressId Int,
	Constraint PK_EmployeeId Primary Key (Id),
	Constraint FK_DepartmentId Foreign Key (DepartmentId) References Departments(Id),
	Constraint FK_AddressId Foreign Key (AddressId) References Addresses(Id)
)

Insert Into Employees (FirstName, MiddleName, LastName, JobTitle, DepartmentId, HireDate, Salary)
Values
('Ivan', 'Ivanov', 'Ivanov', '.NET Developer', 4, '02/01/2013', 3500.00),
('Petar', 'Petrov', 'Petrov',	'Senior Engineer',	1,	'03/02/2004', 4000.00),
('Maria', 'Petrova', 'Ivanova',	'Intern',	5,	'08/28/2016',	525.25),
('Georgi', 'Teziev', 'Ivanov',	'CEO',	2,	'12/09/2007',	3000.00),
('Peter', 'Pan', 'Pan',	'Intern',	3,	'08/28/2016',	599.88)

Select * From Towns Order By Name Asc
Select * From Departments Order By Name Asc
Select * From Employees Order By Salary Desc

UPDATE Employees
SET Salary *= 1.1

SELECT Salary FROM Employees
