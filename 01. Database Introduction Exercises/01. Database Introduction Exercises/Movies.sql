--Problem 13.	Movies Database

CREATE DATABASE Movies

Use Movies

Create Table Directors
(
	Id Int Primary Key,
	DirectorName NVarChar(100) Not Null,
	Notes NVarChar(Max)
)

Insert Into Directors Values
(1, 'First Director', 'Some Notes'),
(2, 'Second Director', Null),
(3, 'Third Director', 'Some Notes'),
(4, 'Fourth Director', Null),
(5, 'Fifth Director', 'Some Notes')

Create Table Genres
(
	Id Int Primary Key,
	GenreName NVarChar(50) Not Null,
	Notes NVarChar(Max)
)

Insert Into Genres Values
(1, 'Genre 1', Null),
(2, 'Genre 2', 'Genre 2 Notes'),
(3, 'Genre 3', Null),
(4, 'Genre 4', 'Genre 4 Notes'),
(5, 'Genre 5', Null)

Create Table Categories
(
	Id Int Primary Key,
	CategoryName NVarChar(100) Not Null,
	Notes NVarChar(Max)
)


Insert Into Categories Values
(1, 'Category 1', 'Notes'),
(2, 'Category 2', 'Notes'),
(3, 'Category 3', 'Notes'),
(4, 'Category 4', 'Notes'),
(5, 'Category 5', Null)


Create Table Movies
(
	Id Int Primary Key,
	Title NVarChar(200) Not Null,
	DirectorID Int Not Null,
	CopyrightYear Int Not Null,
	Length Int Not Null,
	GenreId Int Not Null,
	CategoryId Int Not Null,
	Rating Int,
	Notes NVarChar(Max)
)

Insert Into Movies Values
(1, 'Movie 1', 5, 1992, 120, 5, 5, 10, 'Notes'),
(2, 'Movie 2', 4, 1993, 60, 4, 4, Null, 'Notes'),
(3, 'Movie 3', 3, 1994, 25, 3, 3, 3, Null),
(4, 'Movie 4', 2, 1995, 180, 2, 2, 7, 'Notes'),
(5, 'Movie 5', 1, 1996, 127, 1, 1, 4, 'Notes')

DROP DATABASE Movies