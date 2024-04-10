# sql-programming

## << Case Insensitive >>

```sql
SELECT * FROM Customers;
SELECT CustomerName, City FROM Customers;
```

```sql
SELECT DISTINCT Country FROM Customers;
SELECT COUNT(DISTINCT Country) FROM Customers;
```

```sql
SELECT * FROM Customers WHERE Country = 'Mexico';
SELECT * FROM Customers WHERE CustomerId = 1;
SELECT * FROM Customers WHERE CustomerId > 80;
```

```sql
--	=       Equal
--	>       Greater than
--	<       Less than
--	>=      Greater than or equal
--	<=      Less than or equal
--	<>      Not equal. Note: In some versions of SQL this operator may be written as !=
--	BETWEEN Between a certain range
--	LIKE    Search for a pattern
--	IN      To specify multiple possible values for a column
```

```sql
SELECT * FROM Products ORDER BY Price;
SELECT * FROM Products ORDER BY Price DESC;
SELECT * FROM Products ORDER BY ProductName;
SELECT * FROM Products ORDER BY ProductName DESC;
SELECT * FROM Customers ORDER BY Country, CustomerName;
SELECT * FROM Customers ORDER BY Country ASC, CustomerName DESC;
```

```sql
--  Select all customers from Spain that starts with the letter 'G'
SELECT * FROM Customers WHERE Country = 'Spain' AND CustomerName LIKE 'G%';
--  Select all fields from Customers where Country is "Germany" AND City is "Berlin" AND PostalCode is higher than 12000
SELECT * FROM Customers WHERE Country = 'Germany' AND City = 'Berlin' AND PostalCode > 12000;
--  Select all customers from Spain that starts with a "G" or an "R
SELECT * FROM Customers WHERE Country = 'Spain' AND (CustomerName LIKE 'G%' OR CustomerName LIKE 'R%');
--  Select all customers that either are from Spain and starts with either "G", or starts with the letter "R"
SELECT * FROM Customers WHERE Country = 'Spain' AND CustomerName LIKE 'G%' OR CustomerName LIKE 'R%';
```

```sql
--  Select all customers from Germany or Spain
SELECT * FROM Customers WHERE Country = 'Germany' OR Country = 'Spain';
--  Select all fields from Customers where either City is "Berlin", CustomerName starts with the letter "G" or Country is "Norway"
SELECT * FROM Customers WHERE City = 'Berlin' OR CustomerName LIKE 'G%' OR Country = 'Norway';
--  Select all Spanish customers that starts with either "G" or "R"
SELECT * FROM Customers WHERE Country = 'Spain' AND (CustomerName LIKE 'G%' OR CustomerName LIKE 'R%');
--  Select all customers that either are from Spain and starts with either "G", or starts with the letter "R"
SELECT * FROM Customers WHERE Country = 'Spain' AND CustomerName LIKE 'G%' OR CustomerName LIKE 'R%';
```

```sql
--  Select only the customers that are NOT from Spain
SELECT * FROM Customers WHERE NOT Country = 'Spain';
--  Select customers that does not start with the letter 'A'
SELECT * FROM Customers WHERE CustomerName NOT LIKE 'A%';
--  Select customers with a customerId not between 10 and 60
SELECT * FROM Customers WHERE CustomerId NOT BETWEEN 10 AND 60;
--  Select customers that are not from Paris or London
SELECT * FROM Customers WHERE City NOT IN ('Paris', 'London');
--  Select customers with a CustomerId not greater than 50
SELECT * FROM Customers WHERE NOT CustomerId > 50;
SELECT * FROM Customers WHERE CustomerId !> 50;
--  Select customers with a CustomerId not less than 50
SELECT * FROM Customers WHERE NOT CustomerId < 50;
SELECT * FROM Customers WHERE CustomerId !< 50;
```

```sql
INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES ('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway');

INSERT INTO Customers (CustomerName, City, Country)
VALUES ('Cardinal', 'Stavanger', 'Norway');

INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES
('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway'),
('Greasy Burger', 'Per Olsen', 'Gateveien 15', 'Sandnes', '4306', 'Norway'),
('Tasty Tee', 'Finn Egan', 'Streetroad 19B', 'Liverpool', 'L1 0AA', 'UK');
```

```sql
SELECT CustomerName, ContactName, [Address] FROM Customers WHERE [Address] IS NULL;
SELECT CustomerName, ContactName, [Address] FROM Customers WHERE [Address] IS NOT NULL;
```

```sql
UPDATE Customers SET ContactName = 'Alfred Schmidt', City= 'Frankfurt' WHERE CustomerId = 1;
UPDATE Customers SET ContactName = 'Juan' WHERE Country = 'Mexico';
UPDATE Customers SET ContactName = 'Juan';
```

```sql
DELETE FROM Customers WHERE CustomerName = 'Alfreds Futterkiste';
DELETE FROM Customers;
DROP TABLE Customers;
```

```sql
SELECT TOP 3 * FROM Customers;
SELECT TOP 50 PERCENT * FROM Customers;
SELECT TOP 3 * FROM Customers WHERE Country='Germany';
SELECT TOP 3 * FROM Customers ORDER BY CustomerName DESC;
```

```sql
--  The most commonly used SQL aggregate functions are:

--  MIN()       returns the smallest value within the selected column
--  MAX()       returns the largest value within the selected column
--  COUNT()     returns the number of rows in a set
--  SUM()       returns the total sum of a numerical column
--  AVG()       returns the average value of a numerical column

--  Aggregate functions ignore null values (except for COUNT()).
```

```sql
SELECT MIN(Price) FROM Products;
SELECT MAX(Price) FROM Products;
SELECT MIN(Price) AS SmallestPrice FROM Products;
SELECT CategoryId, MIN(Price) AS SmallestPrice FROM Products GROUP BY CategoryId;
```

```sql
SELECT COUNT(*) FROM Products;
--  You can specify a column name instead of the asterix symbol (*).
--  If you specify a column name instead of (*), NULL values will not be counted.
--  Find the number of products where the ProductName is not null
SELECT COUNT(ProductName) FROM Products;
--  Find the number of products where Price is higher than 20
SELECT COUNT(ProductId) FROM Products WHERE Price > 20;
--  How many different prices are there in the Products table
SELECT COUNT(DISTINCT Price) FROM Products;
--  Name the column "Number of records"
SELECT COUNT(*) AS [Number of records] FROM Products;
SELECT CategoryId, COUNT(*) AS [Number of records] FROM Products GROUP BY CategoryId;
```

```sql
SELECT SUM(Quantity) FROM OrderDetails;
SELECT SUM(Quantity) FROM OrderDetails WHERE ProductId = 11;
SELECT SUM(Quantity) AS Total FROM OrderDetails;
SELECT OrderId, SUM(Quantity) AS [Total Quantity] FROM OrderDetails GROUP BY OrderId;
SELECT SUM(Quantity * 10) FROM OrderDetails;

SELECT SUM(Price * Quantity) FROM OrderDetails 
LEFT JOIN Products ON OrderDetails.ProductId = Products.ProductId;
```

```sql
--  NULL values are ignored.
SELECT AVG(Price) FROM Products;
SELECT AVG(Price) FROM Products WHERE CategoryId = 1;
SELECT AVG(Price) AS [Average Price] FROM Products;
SELECT * FROM Products WHERE Price > (SELECT AVG(Price) FROM Products);
SELECT CategoryId, AVG(Price) AS AveragePrice FROM Products GROUP BY CategoryId;
```

```sql
SELECT * FROM Customers WHERE CustomerName LIKE 'a%';
SELECT * FROM Customers WHERE city LIKE 'L_nd__';
SELECT * FROM Customers WHERE city LIKE '%L%';
SELECT * FROM Customers WHERE CustomerName LIKE 'La%';
SELECT * FROM Customers WHERE CustomerName LIKE 'a%' OR CustomerName LIKE 'b%';
SELECT * FROM Customers WHERE CustomerName LIKE '%a';
SELECT * FROM Customers WHERE CustomerName LIKE 'b%s';
SELECT * FROM Customers WHERE CustomerName LIKE '%or%';
SELECT * FROM Customers WHERE CustomerName LIKE 'a__%';
SELECT * FROM Customers WHERE CustomerName LIKE '_r%';
SELECT * FROM Customers WHERE Country LIKE 'Spain';
```

```sql
--	%	Represents zero or more characters
--	_	Represents a single character
--	[]	Represents any single character within the brackets
--	^	Represents any character not in the brackets
--	-	Represents any single character within the specified range
```

```sql
SELECT * FROM Customers WHERE CustomerName LIKE 'a%';
SELECT * FROM Customers WHERE CustomerName LIKE '%es';
SELECT * FROM Customers WHERE CustomerName LIKE '%mer%';
SELECT * FROM Customers WHERE City LIKE '_ondon';
SELECT * FROM Customers WHERE City LIKE 'L___on';
SELECT * FROM Customers WHERE CustomerName LIKE '[bsp]%';
SELECT * FROM Customers WHERE CustomerName LIKE '[^bsp]%';
SELECT * FROM Customers WHERE CustomerName LIKE '[a-f]%';
SELECT * FROM Customers WHERE CustomerName LIKE 'a__%';
SELECT * FROM Customers WHERE CustomerName LIKE '_r%';
SELECT * FROM Customers WHERE Country LIKE 'Spain';
```

```sql
SELECT * FROM Customers WHERE Country IN ('Germany', 'France', 'UK');
SELECT * FROM Customers WHERE Country NOT IN ('Germany', 'France', 'UK');
SELECT * FROM Customers WHERE CustomerId IN (SELECT CustomerId FROM Orders);
SELECT * FROM Customers WHERE CustomerId NOT IN (SELECT CustomerId FROM Orders);
```

```sql
SELECT * FROM Products WHERE Price BETWEEN 10 AND 20;
SELECT * FROM Products WHERE Price NOT BETWEEN 10 AND 20;
SELECT * FROM Products WHERE Price BETWEEN 10 AND 20 AND CategoryId IN (1,2,3);

SELECT * FROM Products
WHERE ProductName BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni'
ORDER BY ProductName;

SELECT * FROM Products
WHERE ProductName BETWEEN 'Carnarvon Tigers' AND 'Chef Anton''s Cajun Seasoning'
ORDER BY ProductName;

SELECT * FROM Products
WHERE ProductName NOT BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni'
ORDER BY ProductName;

SELECT * FROM Orders WHERE OrderDate BETWEEN '1996-07-01' AND '1996-07-31';
```

```sql
SELECT CustomerId AS Id, CustomerName AS Customer FROM Customers;
SELECT ProductName AS [My Great Products] FROM Products;
SELECT ProductName AS "My Great Products" FROM Products;

SELECT CustomerName, [Address] + ', ' + PostalCode + ' ' + City + ', ' + Country AS [Address] 
FROM Customers;

SELECT CustomerName, CONCAT([Address],', ',PostalCode,', ',City,', ',Country) AS [Address] 
FROM Customers;

SELECT * FROM Customers AS Persons;

SELECT o.OrderId, o.OrderDate, c.CustomerName
FROM Customers AS c, Orders AS o
WHERE c.CustomerName = 'Around the Horn' AND c.CustomerId = o.CustomerId;

SELECT Orders.OrderId, Orders.OrderDate, Customers.CustomerName
FROM Customers, Orders
WHERE Customers.CustomerName = 'Around the Horn' AND Customers.CustomerId = Orders.CustomerId;
```

```sql
SELECT ProductId, ProductName, CategoryName
FROM Products
INNER JOIN Categories ON Products.CategoryId = Categories.CategoryId;

SELECT Products.ProductId, Products.ProductName, Categories.CategoryName
FROM Products
INNER JOIN Categories ON Products.CategoryId = Categories.CategoryId;

--  JOIN == INNER JOIN

SELECT Products.ProductId, Products.ProductName, Categories.CategoryName
FROM Products
JOIN Categories ON Products.CategoryId = Categories.CategoryId;

SELECT Orders.OrderId, Customers.CustomerName, Shippers.ShipperName
FROM Orders
INNER JOIN Customers ON Orders.CustomerId = Customers.CustomerId
INNER JOIN Shippers ON Orders.ShipperId = Shippers.ShipperId;
```

```sql
SELECT Customers.CustomerName, Orders.OrderId
FROM Customers
LEFT JOIN Orders ON Customers.CustomerId = Orders.CustomerId
ORDER BY Customers.CustomerName;
```

```sql
SELECT Customers.CustomerName, Orders.OrderId
FROM Customers
LEFT JOIN Orders ON Customers.CustomerId = Orders.CustomerId
WHERE Orders.CustomerId IS NULL
ORDER BY Customers.CustomerName;
```

```sql
SELECT Orders.OrderId, Employees.LastName, Employees.FirstName
FROM Orders
RIGHT JOIN Employees ON Orders.EmployeeId = Employees.EmployeeId
ORDER BY Orders.OrderId;
```

```sql
SELECT Orders.OrderId, Employees.LastName, Employees.FirstName
FROM Orders
RIGHT JOIN Employees ON Orders.EmployeeId = Employees.EmployeeId
WHERE Orders.EmployeeId IS NULL
ORDER BY Orders.OrderId;
```

```sql
SELECT Customers.CustomerName, Orders.OrderId
FROM Customers
FULL OUTER JOIN Orders ON Customers.CustomerId = Orders.CustomerId
ORDER BY Customers.CustomerName;
```

```sql
SELECT A.CustomerName AS CustomerName1, B.CustomerName AS CustomerName2, A.City
FROM Customers A, Customers B
WHERE A.CustomerId <> B.CustomerId
AND A.City = B.City
ORDER BY A.City;
```

```sql
--  The UNION operator selects only distinct values by default. To allow duplicate values, use UNION ALL
SELECT City FROM Customers
UNION
SELECT City FROM Suppliers
ORDER BY City;

SELECT City FROM Customers
UNION ALL
SELECT City FROM Suppliers
ORDER BY City;

SELECT City, Country FROM Customers WHERE Country='Germany'
UNION
SELECT City, Country FROM Suppliers WHERE Country='Germany'
ORDER BY City;

SELECT City, Country FROM Customers WHERE Country='Germany'
UNION ALL
SELECT City, Country FROM Suppliers WHERE Country='Germany'
ORDER BY City;

SELECT 'Customer' AS Type, ContactName, City, Country FROM Customers
UNION
SELECT 'Supplier', ContactName, City, Country FROM Suppliers;
```

```sql
SELECT Country, COUNT(CustomerId) AS Customers FROM Customers GROUP BY Country;

SELECT Country, COUNT(CustomerId) AS Customers FROM Customers
GROUP BY Country
ORDER BY COUNT(CustomerId) DESC;

SELECT Shippers.ShipperName, COUNT(Orders.OrderId) AS NumberOfOrders FROM Orders
LEFT JOIN Shippers ON Orders.ShipperId = Shippers.ShipperId
GROUP BY ShipperName;
```

```sql
SELECT Country, COUNT(CustomerId) AS Customers
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerId) > 5;

SELECT Country, COUNT(CustomerId) AS Customers
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerId) > 5
ORDER BY COUNT(CustomerId) DESC;

SELECT Employees.LastName, COUNT(Orders.OrderId) AS NumberOfOrders
FROM Orders
INNER JOIN Employees ON Orders.EmployeeId = Employees.EmployeeId
GROUP BY LastName
HAVING COUNT(Orders.OrderId) > 10;

SELECT Employees.LastName, COUNT(Orders.OrderId) AS NumberOfOrders
FROM Orders
INNER JOIN Employees ON Orders.EmployeeId = Employees.EmployeeId
WHERE LastName = 'Davolio' OR LastName = 'Fuller'
GROUP BY LastName
HAVING COUNT(Orders.OrderId) > 25;
```

```sql
SELECT SupplierName
FROM Suppliers
WHERE EXISTS (
    SELECT ProductName FROM Products 
    WHERE Products.SupplierId = Suppliers.supplierId AND Price < 20
);

SELECT SupplierName
FROM Suppliers
WHERE EXISTS (
    SELECT ProductName FROM Products 
    WHERE Products.SupplierId = Suppliers.supplierId AND Price = 22
);
```

```sql
SELECT ProductName
FROM Products
WHERE ProductId = ANY(
    SELECT ProductId
    FROM OrderDetails
    WHERE Quantity = 10
);

SELECT ProductName
FROM Products
WHERE ProductId = ANY(
    SELECT ProductId
    FROM OrderDetails
    WHERE Quantity > 99
);

SELECT ProductName
FROM Products
WHERE ProductId = ANY(
    SELECT ProductId
    FROM OrderDetails
    WHERE Quantity > 1000
);

SELECT ALL ProductName
FROM Products;

SELECT ProductName
FROM Products
WHERE ProductId = ALL(
    SELECT ProductId
    FROM OrderDetails
    WHERE Quantity = 10
);
```

```sql
SELECT OrderId, Quantity,
CASE
    WHEN Quantity > 30 THEN 'The quantity is greater than 30'
    WHEN Quantity = 30 THEN 'The quantity is 30'
    ELSE 'The quantity is under 30'
END AS QuantityText
FROM OrderDetails;

SELECT CustomerName, City, Country
FROM Customers
ORDER BY(
    CASE 
        WHEN City IS NULL THEN Country
        ELSE City
    END
);
```

```sql
SELECT ProductName, UnitPrice * (UnitsInStock + ISNULL(UnitsOnOrder, 0))
FROM Products;

SELECT ProductName, UnitPrice * (UnitsInStock + COALESCE(UnitsOnOrder, 0))
FROM Products;
```

```sql
--  SQL Bitwise Operators
--  &	    Bitwise AND
--  |	    Bitwise OR
--  ^	    Bitwise exclusive OR

--  SQL Comparison Operators
--  =	    Equal to	
--  >	    Greater than	
--  <	    Less than	
--  >=	    Greater than or equal to	
--  <=	    Less than or equal to	
--  <>	    Not equal to

--  SQL Compound Operators
--  +=	    Add equals
--  -=	    Subtract equals
--  *=	    Multiply equals
--  /=	    Divide equals
--  %=	    Modulo equals
--  &=	    Bitwise AND equals
--  ^=	    Bitwise exclusive equals
--  |=	    Bitwise OR equals

--  SQL Logical Operators
--  ALL		TRUE if all of the subquery values meet the condition	
--  AND		TRUE if all the conditions separated by AND is TRUE	
--  ANY		TRUE if any of the subquery values meet the condition	
--  BETWEEN	TRUE if the operand is within the range of comparisons	
--  EXISTS	TRUE if the subquery returns one or more records	
--  IN		TRUE if the operand is equal to one of a list of expressions	
--  LIKE	TRUE if the operand matches a pattern	
--  NOT		Displays a record if the condition(s) is NOT TRUE	
--  OR		TRUE if any of the conditions separated by OR is TRUE	
--  SOME	TRUE if any of the subquery values meet the condition
```