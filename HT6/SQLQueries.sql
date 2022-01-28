-- 1.1.1.
SELECT TOP (1000) [OrderID]
      ,[ShippedDate]
      ,[ShipVia]
FROM [Northwind].[dbo].[Orders]
WHERE ShippedDate > = '1998-05-06' and ShipVia >= 2

--1.1.2.
SELECT   [Orders].[OrderID],
CASE 
  WHEN ShippedDate is NULL then 'Not Shipped' 
  when ShippedDate is not null then CONVERT(varchar(10),ShippedDate,103)
     end as 'not shipped'
FROM [Northwind].[dbo].[Orders]

-- 1.2.1.
SELECT ContactName, Country 
FROM Customers
WHERE Country in ('USA', 'Canada')
ORDER BY ContactName, Country

-- 1.2.2.
SELECT ContactName, Country 
FROM Customers
WHERE NOT Country in ('USA', 'Canada')
ORDER BY ContactName

--1.3.1. 
SELECT Distinct [Order Details].[OrderID]
  FROM [Northwind].[dbo].[Order Details]
  WHERE Quantity BETWEEN 3 AND 10

-- 1.3.2. 
  SELECT TOP (1000) [CustomerID]
      ,[Country]
FROM [Northwind].[dbo].[Customers]
WHERE Country BETWEEN 'b' AND 'h' 
ORDER BY Country

--1.4.1.
SELECT TOP (1000) [ProductID]
      ,[ProductName]
      FROM [Northwind].[dbo].[Products]
WHERE ProductName LIKE 'cho_olade'

--2.1.1.
SELECT SUM(UnitPrice*Quantity-Discount) AS 'Totals'
FROM [Northwind].[dbo].[Order Details] 

-- 2.1.2. 
SELECT COUNT( ShippedDate)  
FROM [Northwind].[dbo].[Orders] 

-- 2.2.1.
SELECT year(OrderDate) as 'Year', count(OrderID) as 'Total'
FROM [Northwind].[dbo].[Orders] 
GROUP BY year(OrderDate) 

SELECT Count(OrderID) as 'Quantity'
FROM Orders

---2.2.2.
SELECT 
Orders.EmployeeID as [Seller], Count(CustomerID) as [Amount], 
CONCAT(Employees.LastName, Employees.FirstName) as [Name]
FROM Orders
JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
GROUP BY Orders.EmployeeID, CONCAT(Employees.LastName, Employees.FirstName)
ORDER BY Amount Desc

--2.3.1.
Select Employees.FirstName
From Region
left Join Territories on Region.RegionID = Territories.RegionID
left Join EmployeeTerritories on Territories.TerritoryID = EmployeeTerritories.TerritoryID 
left Join Employees on EmployeeTerritories.EmployeeID = Employees.EmployeeID 
Where Region.RegionID = 2

--2.3.2.
SELECT [Northwind].[dbo].[Customers].[ContactName], 
      (SELECT COUNT(*) FROM [Northwind].[dbo].[Orders] 
	  WHERE Customers.CustomerID = Orders.CustomerID) AS 'CustomerOrders'
       FROM  [Northwind].[dbo].[Customers]
       ORDER BY CustomerOrders ASC

