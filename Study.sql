--	<< Case Insensitive >>

--	SELECT * FROM Customers;
--	SELECT CustomerName, City FROM Customers;

--	SELECT DISTINCT Country FROM Customers;
--	SELECT COUNT(DISTINCT Country) FROM Customers;

--	SELECT * FROM Customers WHERE Country = 'Mexico';
--	SELECT * FROM Customers WHERE CustomerID = 1;
--	SELECT * FROM Customers WHERE CustomerID > 80;

--	=		Equal
--	>		Greater than
--	<		Less than
--	>=		Greater than or equal
--	<=		Less than or equal
--	<>		Not equal. Note: In some versions of SQL this operator may be written as !=
--	BETWEEN	Between a certain range
--	LIKE	Search for a pattern
--	IN		To specify multiple possible values for a column

--	SELECT * FROM Products ORDER BY Price;
--	SELECT * FROM Products ORDER BY Price DESC;
--	SELECT * FROM Products ORDER BY ProductName;
--	SELECT * FROM Products ORDER BY ProductName DESC;
--	SELECT * FROM Customers ORDER BY Country, CustomerName;
--	SELECT * FROM Customers ORDER BY Country ASC, CustomerName DESC;

--Select all customers from Spain that starts with the letter 'G'
--	SELECT * FROM Customers WHERE Country = 'Spain' AND CustomerName LIKE 'G%';
--Select all fields from Customers where Country is "Germany" AND City is "Berlin" AND PostalCode is higher than 12000
--	SELECT * FROM Customers WHERE Country = 'Germany' AND City = 'Berlin' AND PostalCode > 12000;
--Select all customers from Spain that starts with a "G" or an "R
--	SELECT * FROM Customers WHERE Country = 'Spain' AND (CustomerName LIKE 'G%' OR CustomerName LIKE 'R%');
--Select all customers that either are from Spain and starts with either "G", or starts with the letter "R"
--	SELECT * FROM Customers WHERE Country = 'Spain' AND CustomerName LIKE 'G%' OR CustomerName LIKE 'R%';

--Select all customers from Germany or Spain
--	SELECT * FROM Customers WHERE Country = 'Germany' OR Country = 'Spain';
--Select all fields from Customers where either City is "Berlin", CustomerName starts with the letter "G" or Country is "Norway"
--	SELECT * FROM Customers WHERE City = 'Berlin' OR CustomerName LIKE 'G%' OR Country = 'Norway';
--Select all Spanish customers that starts with either "G" or "R"
--	SELECT * FROM Customers WHERE Country = 'Spain' AND (CustomerName LIKE 'G%' OR CustomerName LIKE 'R%');
--Select all customers that either are from Spain and starts with either "G", or starts with the letter "R"
--	SELECT * FROM Customers WHERE Country = 'Spain' AND CustomerName LIKE 'G%' OR CustomerName LIKE 'R%';

--Select only the customers that are NOT from Spain
--	SELECT * FROM Customers WHERE NOT Country = 'Spain';
--Select customers that does not start with the letter 'A'
--	SELECT * FROM Customers WHERE CustomerName NOT LIKE 'A%';
--Select customers with a customerID not between 10 and 60
--	SELECT * FROM Customers WHERE CustomerID NOT BETWEEN 10 AND 60;
--Select customers that are not from Paris or London
--	SELECT * FROM Customers WHERE City NOT IN ('Paris', 'London');
--Select customers with a CustomerId not greater than 50
--	SELECT * FROM Customers WHERE NOT CustomerID > 50;
--	SELECT * FROM Customers WHERE CustomerID !> 50;
--Select customers with a CustomerID not less than 50
--	SELECT * FROM Customers WHERE NOT CustomerId < 50;
--	SELECT * FROM Customers WHERE CustomerId !< 50;

/*
INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES ('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway');

INSERT INTO Customers (CustomerName, City, Country)
VALUES ('Cardinal', 'Stavanger', 'Norway');

INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES
('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway'),
('Greasy Burger', 'Per Olsen', 'Gateveien 15', 'Sandnes', '4306', 'Norway'),
('Tasty Tee', 'Finn Egan', 'Streetroad 19B', 'Liverpool', 'L1 0AA', 'UK');
*/

--	SELECT CustomerName, ContactName, [Address] FROM Customers WHERE [Address] IS NULL;
--	SELECT CustomerName, ContactName, [Address] FROM Customers WHERE [Address] IS NOT NULL;

--	UPDATE Customers SET ContactName = 'Alfred Schmidt', City= 'Frankfurt' WHERE CustomerID = 1;
--	UPDATE Customers SET ContactName = 'Juan' WHERE Country = 'Mexico';
--	UPDATE Customers SET ContactName='Juan';

--	DELETE FROM Customers WHERE CustomerName = 'Alfreds Futterkiste';
--  DELETE FROM Customers;
--	DROP TABLE Customers;

--	SELECT TOP 3 * FROM Customers;
--	SELECT TOP 50 PERCENT * FROM Customers;
--	SELECT TOP 3 * FROM Customers WHERE Country='Germany';
--	SELECT TOP 3 * FROM Customers ORDER BY CustomerName DESC;

/*
The most commonly used SQL aggregate functions are:

MIN() - returns the smallest value within the selected column
MAX() - returns the largest value within the selected column
COUNT() - returns the number of rows in a set
SUM() - returns the total sum of a numerical column
AVG() - returns the average value of a numerical column
Aggregate functions ignore null values (except for COUNT()).
*/

--	SELECT MIN(Price) FROM Products;
--	SELECT MAX(Price) FROM Products;
--	SELECT MIN(Price) AS SmallestPrice FROM Products;
--	SELECT CategoryID, MIN(Price) AS SmallestPrice FROM Products GROUP BY CategoryID;

--	SELECT COUNT(*) FROM Products;
--You can specify a column name instead of the asterix symbol (*).
--If you specify a column name instead of (*), NULL values will not be counted.
--Find the number of products where the ProductName is not null
--	SELECT COUNT(ProductName) FROM Products;
--Find the number of products where Price is higher than 20
--	SELECT COUNT(ProductID) FROM Products WHERE Price > 20;
--How many different prices are there in the Products table
--	SELECT COUNT(DISTINCT Price) FROM Products;
--Name the column "Number of records"
--	SELECT COUNT(*) AS [Number of records] FROM Products;
--	SELECT CategoryID, COUNT(*) AS [Number of records] FROM Products GROUP BY CategoryID;

--	SELECT SUM(Quantity) FROM OrderDetails;
--	SELECT SUM(Quantity) FROM OrderDetails WHERE ProductId = 11;
--	SELECT SUM(Quantity) AS Total FROM OrderDetails;
--	SELECT OrderID, SUM(Quantity) AS [Total Quantity] FROM OrderDetails GROUP BY OrderID;
--	SELECT SUM(Quantity * 10) FROM OrderDetails;
--	SELECT SUM(Price * Quantity) FROM OrderDetails 
--	LEFT JOIN Products ON OrderDetails.ProductID = Products.ProductID;

--NULL values are ignored.
--	SELECT AVG(Price) FROM Products;
--	SELECT AVG(Price) FROM Products WHERE CategoryID = 1;
--	SELECT AVG(Price) AS [Average Price] FROM Products;
--	SELECT * FROM Products WHERE Price > (SELECT AVG(Price) FROM Products);
--	SELECT CategoryID, AVG(Price) AS AveragePrice FROM Products GROUP BY CategoryID;

--	SELECT * FROM Customers WHERE CustomerName LIKE 'a%';
--	SELECT * FROM Customers WHERE city LIKE 'L_nd__';
--	SELECT * FROM Customers WHERE city LIKE '%L%';
--	SELECT * FROM Customers WHERE CustomerName LIKE 'La%';
--	SELECT * FROM Customers WHERE CustomerName LIKE 'a%' OR CustomerName LIKE 'b%';
--	SELECT * FROM Customers WHERE CustomerName LIKE '%a';
--	SELECT * FROM Customers WHERE CustomerName LIKE 'b%s';
--	SELECT * FROM Customers WHERE CustomerName LIKE '%or%';
--	SELECT * FROM Customers WHERE CustomerName LIKE 'a__%';
--	SELECT * FROM Customers WHERE CustomerName LIKE '_r%';
--	SELECT * FROM Customers WHERE Country LIKE 'Spain';

--	%	Represents zero or more characters
--	_	Represents a single character
--	[]	Represents any single character within the brackets
--	^	Represents any character not in the brackets
--	-	Represents any single character within the specified range

--	SELECT * FROM Customers WHERE CustomerName LIKE 'a%';
--	SELECT * FROM Customers WHERE CustomerName LIKE '%es';
--	SELECT * FROM Customers WHERE CustomerName LIKE '%mer%';
--	SELECT * FROM Customers WHERE City LIKE '_ondon';
--	SELECT * FROM Customers WHERE City LIKE 'L___on';
--	SELECT * FROM Customers WHERE CustomerName LIKE '[bsp]%';
--	SELECT * FROM Customers WHERE CustomerName LIKE '[^bsp]%';
--	SELECT * FROM Customers WHERE CustomerName LIKE '[a-f]%';
--  SELECT * FROM Customers WHERE CustomerName LIKE 'a__%';
--	SELECT * FROM Customers WHERE CustomerName LIKE '_r%';
--	SELECT * FROM Customers WHERE Country LIKE 'Spain';

--	SELECT * FROM Customers WHERE Country IN ('Germany', 'France', 'UK');
--	SELECT * FROM Customers WHERE Country NOT IN ('Germany', 'France', 'UK');
--	SELECT * FROM Customers WHERE CustomerID IN (SELECT CustomerID FROM Orders);
--	SELECT * FROM Customers WHERE CustomerID NOT IN (SELECT CustomerID FROM Orders);

--	SELECT * FROM Products WHERE Price BETWEEN 10 AND 20;
--	SELECT * FROM Products WHERE Price NOT BETWEEN 10 AND 20;
--	SELECT * FROM Products WHERE Price BETWEEN 10 AND 20 AND CategoryID IN (1,2,3);
--	SELECT * FROM Products
--	WHERE ProductName BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni'
--	ORDER BY ProductName;
--	SELECT * FROM Products
--	WHERE ProductName BETWEEN 'Carnarvon Tigers' AND 'Chef Anton''s Cajun Seasoning'
--	ORDER BY ProductName;
--	SELECT * FROM Products
--	WHERE ProductName NOT BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni'
--	ORDER BY ProductName;
--	SELECT * FROM Orders WHERE OrderDate BETWEEN '1996-07-01' AND '1996-07-31';

--	SELECT CustomerID AS Id, CustomerName AS Customer FROM Customers;
--	SELECT ProductName AS [My Great Products] FROM Products;
--	SELECT ProductName AS "My Great Products" FROM Products;
--	SELECT CustomerName, [Address] + ', ' + PostalCode + ' ' + City + ', ' + Country AS [Address] FROM Customers;
--	SELECT CustomerName, CONCAT([Address],', ',PostalCode,', ',City,', ',Country) AS [Address] FROM Customers;
--	SELECT * FROM Customers AS Persons;
--	SELECT o.OrderID, o.OrderDate, c.CustomerName
--	FROM Customers AS c, Orders AS o
--	WHERE c.CustomerName = 'Around the Horn' AND c.CustomerID = o.CustomerID;
--	SELECT Orders.OrderID, Orders.OrderDate, Customers.CustomerName
--	FROM Customers, Orders
--	WHERE Customers.CustomerName='Around the Horn' AND Customers.CustomerID=Orders.CustomerID;

--	SELECT ProductID, ProductName, CategoryName
--	FROM Products
--	INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID;
--	SELECT Products.ProductID, Products.ProductName, Categories.CategoryName
--	FROM Products
--	INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID;
--JOIN == INNER JOIN
--	SELECT Products.ProductID, Products.ProductName, Categories.CategoryName
--	FROM Products
--	JOIN Categories ON Products.CategoryID = Categories.CategoryID;
--	SELECT Orders.OrderID, Customers.CustomerName, Shippers.ShipperName
--	FROM Orders
--	INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
--	INNER JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID;

--SELECT Customers.CustomerName, Orders.OrderID
--FROM Customers
--LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
--ORDER BY Customers.CustomerName;

--SELECT Customers.CustomerName, Orders.OrderID
--FROM Customers
--LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
--WHERE Orders.CustomerID IS NULL
--ORDER BY Customers.CustomerName;

--SELECT Orders.OrderID, Employees.LastName, Employees.FirstName
--FROM Orders
--RIGHT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
--ORDER BY Orders.OrderID;

--SELECT Orders.OrderID, Employees.LastName, Employees.FirstName
--FROM Orders
--RIGHT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
--WHERE Orders.EmployeeID IS NULL
--ORDER BY Orders.OrderID;

--SELECT Customers.CustomerName, Orders.OrderID
--FROM Customers
--FULL OUTER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
--ORDER BY Customers.CustomerName;

--SELECT A.CustomerName AS CustomerName1, B.CustomerName AS CustomerName2, A.City
--FROM Customers A, Customers B
--WHERE A.CustomerID <> B.CustomerID
--AND A.City = B.City
--ORDER BY A.City;

--The UNION operator selects only distinct values by default. To allow duplicate values, use UNION ALL
--SELECT City FROM Customers
--UNION
--SELECT City FROM Suppliers
--ORDER BY City;
--SELECT City FROM Customers
--UNION ALL
--SELECT City FROM Suppliers
--ORDER BY City;
--SELECT City, Country FROM Customers WHERE Country='Germany'
--UNION
--SELECT City, Country FROM Suppliers WHERE Country='Germany'
--ORDER BY City;
--SELECT City, Country FROM Customers WHERE Country='Germany'
--UNION ALL
--SELECT City, Country FROM Suppliers WHERE Country='Germany'
--ORDER BY City;
--SELECT 'Customer' AS Type, ContactName, City, Country FROM Customers
--UNION
--SELECT 'Supplier', ContactName, City, Country FROM Suppliers;

--SELECT Country, COUNT(CustomerID) AS Customers FROM Customers GROUP BY Country;
--SELECT Country, COUNT(CustomerID) AS Customers FROM Customers
--GROUP BY Country
--ORDER BY COUNT(CustomerID) DESC;
--SELECT Shippers.ShipperName, COUNT(Orders.OrderID) AS NumberOfOrders FROM Orders
--LEFT JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID
--GROUP BY ShipperName;

--SELECT Country, COUNT(CustomerID) AS Customers
--FROM Customers
--GROUP BY Country
--HAVING COUNT(CustomerID) > 5;
--SELECT Country, COUNT(CustomerID) AS Customers
--FROM Customers
--GROUP BY Country
--HAVING COUNT(CustomerID) > 5
--ORDER BY COUNT(CustomerID) DESC;
--SELECT Employees.LastName, COUNT(Orders.OrderID) AS NumberOfOrders
--FROM Orders
--INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
--GROUP BY LastName
--HAVING COUNT(Orders.OrderID) > 10;
--SELECT Employees.LastName, COUNT(Orders.OrderID) AS NumberOfOrders
--FROM Orders
--INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
--WHERE LastName = 'Davolio' OR LastName = 'Fuller'
--GROUP BY LastName
--HAVING COUNT(Orders.OrderID) > 25;

--SELECT SupplierName
--FROM Suppliers
--WHERE EXISTS (SELECT ProductName FROM Products WHERE Products.SupplierID = Suppliers.supplierID AND Price < 20);
--SELECT SupplierName
--FROM Suppliers
--WHERE EXISTS (SELECT ProductName FROM Products WHERE Products.SupplierID = Suppliers.supplierID AND Price = 22);

--SELECT ProductName
--FROM Products
--WHERE ProductID = ANY
--  (SELECT ProductID
--  FROM OrderDetails
--  WHERE Quantity = 10);
--SELECT ProductName
--FROM Products
--WHERE ProductID = ANY(
--SELECT ProductID
--FROM OrderDetails
--WHERE Quantity > 99);
--SELECT ProductName
--FROM Products
--WHERE ProductID = ANY
--  (SELECT ProductID
--  FROM OrderDetails
--  WHERE Quantity > 1000);
--SELECT ALL ProductName
--FROM Products;
--SELECT ProductName
--FROM Products
--WHERE ProductID = ALL
--  (SELECT ProductID
--  FROM OrderDetails
--  WHERE Quantity = 10);
--SELECT OrderID, Quantity,
--CASE
--    WHEN Quantity > 30 THEN 'The quantity is greater than 30'
--    WHEN Quantity = 30 THEN 'The quantity is 30'
--    ELSE 'The quantity is under 30'
--END AS QuantityText
--FROM OrderDetails;
--SELECT CustomerName, City, Country
--FROM Customers
--ORDER BY
--(CASE
--    WHEN City IS NULL THEN Country
--    ELSE City
--END);

--SELECT ProductName, UnitPrice * (UnitsInStock + ISNULL(UnitsOnOrder, 0))
--FROM Products;
--SELECT ProductName, UnitPrice * (UnitsInStock + COALESCE(UnitsOnOrder, 0))
--FROM Products;

--SQL Arithmetic Operators
--+	Add	
---	Subtract	
--*	Multiply	
--/	Divide	
--%	Modulo

--SQL Bitwise Operators
--&	Bitwise AND
--|	Bitwise OR
--^	Bitwise exclusive OR

--SQL Comparison Operators
--=	Equal to	
-->	Greater than	
--<	Less than	
-->=	Greater than or equal to	
--<=	Less than or equal to	
--<>	Not equal to

--SQL Compound Operators
--+=	Add equals
---=	Subtract equals
--*=	Multiply equals
--/=	Divide equals
--%=	Modulo equals
--&=	Bitwise AND equals
--^=	Bitwise exclusive equals
--|=	Bitwise OR equals

--SQL Logical Operators
--ALL		TRUE if all of the subquery values meet the condition	
--AND		TRUE if all the conditions separated by AND is TRUE	
--ANY		TRUE if any of the subquery values meet the condition	
--BETWEEN	TRUE if the operand is within the range of comparisons	
--EXISTS	TRUE if the subquery returns one or more records	
--IN		TRUE if the operand is equal to one of a list of expressions	
--LIKE		TRUE if the operand matches a pattern	
--NOT		Displays a record if the condition(s) is NOT TRUE	
--OR		TRUE if any of the conditions separated by OR is TRUE	
--SOME		TRUE if any of the subquery values meet the condition
