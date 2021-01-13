-- Problem 15.	Hotel Database

Create Database Hotel

Use Hotel

Create Table Employees
(
	Id Int Primary Key,
	FirstName VarChar(50) Not Null,
	LastName VarChar(50) Not Null,
	Title VarChar(50) Not Null,
	Notes VarChar(Max)
)

Insert Into Employees Values
(1, 'A', 'A', 'A', 'Notes'),
(2, 'B', 'B', 'B', 'Notes'),
(3, 'C', 'C', 'C', Null)

Create Table Customers
(
	AccountNumber Int Primary Key,
	FirstName VarChar(50) Not Null,
	LastName VarChar(50) Not Null,
	PhoneNumber VarChar(10) Not Null,
	EmergencyName VarChar(100) Not Null,
	EmergencyNumber VarChar(10) Not Null,
	Notes VarChar(Max)
)

Insert Into Customers Values
(1001, 'A', 'B', '1234567890', 'C', '1234567890', 'Notes'),
(1002, 'D', 'E', '1234567890', 'F', '1234567890', 'Notes'),
(1003, 'G', 'H', '1234567890', 'I', '1234567890', Null)


Create Table RoomStatus
(
	Id Int Primary Key,
	RoomStatus VarChar(20) Not Null,
	Notes VarChar(Max)
)

Insert Into RoomStatus Values
(1, 'A', 'Note'),
(2, 'B', Null),
(3, 'C', 'Note')

Create Table RoomTypes
(
	Id Int Primary Key,
	RoomType VarChar(20) Not Null,
	Notes VarChar(Max)
)

Insert Into RoomTypes Values
(1, 'A', 'Note'),
(2, 'B', Null),
(3, 'C', 'Note')


Create Table BedTypes
(
	Id Int Primary Key,
	BedType VarChar(20) Not Null,
	Notes VarChar(Max)
)

Insert Into BedTypes Values
(1, 'A', 'Note'),
(2, 'B', Null),
(3, 'C', 'Note')


Create Table Rooms
(
	Id Int Primary Key,
	RoomNumber VarChar(5) Not Null,
	RoomType Int Not Null,
	BedType Int Not Null,
	Rate Int,
	RoomStatus Int Not Null,
	Notes VarChar(Max)
)

Insert Into Rooms Values
(1, '1001', 1, 1, 10, 1, 'Notes'),
(2, '1002', 2, 2, Null, 2, 'Notes'),
(3, '1003', 3, 3, 10, 3, 'Notes')


Create Table Payments
(
	Id Int Primary Key,
	EmployeeId Int Not Null,
	PaymentDate Date Not Null,
	AccountNumber Int Not Null,
	FirstDateOccupied Date Not Null,
	LastDateOccupied Date Not Null,
	TotalDays Int Not Null,
	AmountCharged Decimal Not Null,
	TaxRate Int Not Null,
	TaxAmount Decimal Not Null,
	PaymentTotal Decimal Not Null,
	Notes VarChar(Max)
)

Insert Into Payments Values
(1, 1, '01/01/2021', 1, '01/04/2021', '01/05/2021', 1, 100.00, 20, 20.00, 120.00, 'Note'),
(2, 2, '01/01/2021', 2, '01/04/2021', '01/05/2021', 2, 10.00, 20, 2.00, 120.00, 'Note'),
(3, 2, '01/01/2021', 2, '01/04/2021', '01/05/2021', 3, 100.00, 20, 20.00, 120.00, Null)

UPDATE Payments
SET TaxRate *= 0.97

SELECT TaxRate FROM Payments

Create Table Occupancies
(
	Id Int Primary Key,
	EmployeeId Int Not Null,
	DateOccupied Date Not Null,
	AccountNumber Int Not Null,
	RoomNumber Int Not Null,
	RateApplied Int,
	PhoneCharge Decimal,
	Notes VarChar(Max)
)

Insert Into Occupancies Values
(1, 1, '01/01/2021', 1001, 1, 10, 22.22, Null),
(2, 3, '01/01/2021', 1003, 3, Null, Null, 'Note'),
(3, 2, '01/01/2021', 1002, 2, 7, Null, Null)

SELECT * FROM Occupancies

TRUNCATE TABLE Occupancies
