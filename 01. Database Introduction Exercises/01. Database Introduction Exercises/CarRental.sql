--Problem 14.	Car Rental Database


Create Database CarRental

Use CarRental


Create Table Categories
(
	Id SmallInt Primary Key,
	CategoryName VarChar(60) Not Null,
	DailyRate Numeric(8,2) Not Null,
	WeeklyRate Numeric(8,2) Not Null,
	MonthlyRate Numeric(8,2) Not Null,
	WeekendRate Numeric(8,2) Not Null
)

Insert Into Categories Values
(1, 'Cat A', 10.20, 66.30, 250.22, 22.22),
(2, 'Cat B', 8.20, 55.30, 200.22, 20.22),
(3, 'Cat C', 5.20, 30.30, 150.22, 12.22)


Create Table Cars
(
	Id SmallInt Primary Key,
	PlateNumber VarChar(10) Not Null,
	Manufacturer VarChar(50) Not Null,
	Model VarChar(50) Not Null,
	CarYear SmallInt Not Null,
	CategoryId SmallInt Not Null,
	Doors TinyInt Not Null,
	Picture VarChar(Max),
	Condition VarChar(20),
	Available Bit
)

Insert Into Cars Values
(1, 'AA1111A', 'Audi', 'A6', 2010, 1, 4, 'PathToPicture', 'Top', 1),
(2, 'BB22222', 'BMW', '530', 2012, 2, 5, 'PathToPicture', 'Top', 1),
(3, 'CC33333', 'Merc', 'E', 2010, 3, 4, 'PathToPicture', 'Top', 0)


Create Table Employees
(
	Id SmallInt Primary Key,
	FirstName VarChar(60) Not Null,
	LastName VarChar(60) Not Null,
	Title VarChar(50) Not Null,
	Notes VarChar(Max)
)

Insert Into Employees Values
(1, 'A', 'A', 'C', 'Notes'),
(2, 'B', 'B', 'F', Null),
(3, 'C', 'C', 'O', 'Notes')


Create Table Customers
(
	Id Int Primary Key,
	DriverLicenceNumber VarChar(60) Not Null,
	FullName VarChar(120) Not Null,
	Address VarChar(120) Not Null,
	City VarChar(60) Not Null,
	ZIPCode SmallInt Not Null,
	Notes VarChar(Max)
)

Insert Into Customers Values
(1, 'N111', 'A', 'A', 'A', 1111, 'Notes'),
(2, 'N222', 'B', 'B', 'B', 2222, 'Notes'),
(3, 'N333', 'C', 'C', 'C', 3333, Null)


Create Table RentalOrders
(
	Id Int Primary Key,
	EmployeeId SmallInt Not Null,
	CustomerId Int Not Null,
	CarId SmallInt Not Null,
	TankLevel Numeric(5,2) Not Null,
	KilometrageStart Numeric(10,3) Not Null,
	KilometrageEnd Numeric(10,3) Not Null,
	TotalKilometrage Numeric(10,3) Not Null,
	StartDate DateTime Not Null,
	EndDate DateTime Not Null,
	TotalDays SmallInt Not Null,
	RateApplied SmallInt Not Null,
	TaxRate SmallInt Not Null,
	OrderStatus VarChar(30) Not Null,
	Notes VarChar(Max)
)

Insert Into RentalOrders Values
(1, 1, 1, 1, 055.55, 0111111.111, 0111222.111, 111, '01/04/2021', '01/05/2021', 1, 10, 20, 'Completed', 'Notes'),
(2, 2, 2, 2, 100.00, 2.000, 3.000, 1, '01/04/2021', '01/05/2021', 1, 10, 20, 'Completed', 'Notes'),
(3, 3, 3, 3, 070.00, 111111.111, 111222.111, 111, '01/04/2021', '01/05/2021', 1, 10, 20, 'In Progress', Null)