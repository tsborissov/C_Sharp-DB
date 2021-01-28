SELECT FirstName, LastName 
	FROM Employees
	WHERE FirstName LIKE 'Sa%'



SELECT FirstName, LastName 
	FROM Employees
	WHERE LastName LIKE '%ei%'



SELECT FirstName
	FROM Employees
	WHERE DATEPART(YEAR, HireDate) BETWEEN 1995 AND 2005
	AND DepartmentID IN (3, 10)



SELECT FirstName, LastName
	FROM Employees
	WHERE JobTitle NOT LIKE '%engineer%'
	


SELECT Name
	FROM Towns
	WHERE LEN(Name) IN (5,6)
	ORDER BY Name ASC



SELECT *
	FROM Towns
	WHERE LEFT(Name, 1) LIKE '[MKBE]'
	ORDER BY Name ASC



SELECT *
	FROM Towns
	WHERE LEFT(Name, 1) NOT LIKE '[RBD]'
	ORDER BY Name ASC



CREATE VIEW V_EmployeesHiredAfter2000 AS
SELECT FirstName, LastName
	FROM Employees
	WHERE DATEPART(YEAR, HireDate) > 2000



SELECT *
	FROM V_EmployeesHiredAfter2000



SELECT FirstName, LastName
	FROM Employees
	WHERE LEN(LastName) = 5


SELECT EmployeeID, FirstName, LastName,	Salary, 
	DENSE_RANK() OVER (PARTITION BY Salary ORDER BY EmployeeID) AS [Rank]
		FROM Employees
			WHERE Salary BETWEEN 10000 AND 50000
		ORDER BY Salary DESC


SELECT * FROM (
	SELECT EmployeeID, FirstName, LastName,	Salary, 
		DENSE_RANK() OVER (PARTITION BY Salary ORDER BY EmployeeID) AS [Rank]
			FROM Employees
			WHERE Salary BETWEEN 10000 AND 50000
) AS Result
WHERE Rank = 2
ORDER BY Salary DESC


