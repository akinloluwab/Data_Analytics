--1. Avg freight split by Shipcity
Select 
ShipCity,
 avg (Freight) as 'Average Freight' 
from Orders
group by ShipCity

--2. min freight split by Shipcountry
Select 
ShipCountry,
 min (Freight) as 'Minimum Freight' 
from Orders
group by ShipCountry

--3. Total number of orders split by Hire Month Year
Select 
DATENAME(MONTH, HireDate) as Month,
DATENAME(YEAR, HireDate) as Year,
count (orderid) 'Number of ID'
from Employees
join Orders on
Orders.EmployeeID = Employees.EmployeeID
group by DATENAME(MONTH, HireDate), DATENAME(YEAR, HireDate)

--4. Total number of orders split by Birth Year
Select 
DATENAME(Year, BirthDate) as 'Birth Year',
COUNT (OrderID) 'Total Number of Orders'
from Employees
join orders on
Orders.EmployeeID = Employees.EmployeeID
group by DATENAME(Year, BirthDate)

--5. Total number of orders split by Contact Name and Employee FirstName
Select 
FirstName,
ContactName,
count (OrderID) 'Total Number of Orders'
from Employees
join Orders on
Employees.EmployeeID = Orders.EmployeeID
join Customers on
Customers.CustomerID = Orders.CustomerID
group by FirstName, ContactName

--6. Total freight split by Ship Country and Order Year
Select
ShipCountry,
DATENAME(year,OrderDate) as 'Order Year',
sum(Freight) as 'Total Freight'
from Orders
group by ShipCountry,
DATENAME(year,OrderDate)

--7.List of Customer from Germany
Select 
ContactName
from Customers
where Country = 'Germany'

--8.List of Contact Name, City and Region of customers from Berlin
Select 
ContactName,
City,
Region
from Customers
where City = 'Berlin'

--9.List of employees with date of birth 30 August 1963
Select 
LastName + ' ' + FirstName as 'Employee Full Name'
from Employees
where BirthDate = '1963-08-30 00:00:00.000'

--10.List of employees with a title of courtesy of 'Mr.'
Select 
LastName + ' ' + FirstName as 'Employee Full Name'
from Employees
where TitleOfCourtesy = 'Mr.'

--11.Total number of orders breakdown by Ship Region.
Select
ShipRegion,
count (OrderID) 'Number of Orders'
from Orders
group by ShipRegion

--12.Total number of orders breakdown by Ship Country
Select
ShipCountry,
count (OrderID) 'Number of Orders'
from Orders
group by ShipCountry

--13.Total number of orders split by Ship Country and ShipName
Select
ShipCountry,
ShipName,
count (OrderID) 'Number of Orders'
from Orders
group by ShipCountry, ShipName

--14.Total number of orders split by product
Select 
ProductName,
count (OrderID) as 'Number of Orders'
from Products
join [Order Details] on
Products.ProductID = [Order Details].ProductID
group by ProductName

--15.Highest freight cost split by Ship Name. Arrange the Highest freight from highest to lowest.
Select 
ShipName as 'Ship Name',
Freight
from Orders
Order by Freight DESC

--16.Lowest freight cost split by Ship Country and Ship Name
Select 
ShipCountry as 'Ship Country',
ShipName as 'Ship Name',
min (Freight) 'Lowest Freight'
from Orders
group by ShipCountry, ShipName

--17.List of orders processed in Germany or Brazil. Also include orders processed in 15th Jun 1997.
Select 
ProductName as 'List of Orders',
Country
from Products
join [Order Details] on
Products.ProductID = [Order Details].ProductID
join Orders on
[Order Details].OrderID = Orders.OrderID
join Customers on 
Customers.CustomerID = Orders.CustomerID
where Country = 'Germany' or Country = 'Brazil' or OrderDate = '1997-06-15'

--18.Total freight cost split by Order Month
Select 
DATENAME(Month, OrderDate) as 'Order Month',
sum (Freight) 'Total Freight Cost'
from Orders
group by DATENAME(Month, OrderDate)

--19.AVG freight cost split by Shipped Month.
Select
Datename(Month, ShippedDate) as 'Shipped Month',
avg(Freight) 'Average Freight Cost'
from Orders
group by Datename(Month, ShippedDate)

--20. Total Sales split by ProductName
Select 
ProductName 'Product Name',
O.UnitPrice * Quantity as 'Total Sales'
from [Order Details] as O
join Products on
Products.ProductID = O.ProductID

--21. For all customers, please create a report that show total freight split by ship city
Select 
ContactName as 'Customers',
ShipCity 'Ship City',
Freight
from Orders
join Customers on
Customers.CustomerID = Orders.CustomerID

--22. For all customers, please create a report that show total freight split by ship city
Select 
ContactName as 'Customers',
ShipCity 'Ship City',
Freight
from Orders
join Customers on
Customers.CustomerID = Orders.CustomerID

--23. For all customers, please create a report that show total freight split by ship country
Select 
ContactName as 'Customers',
ShipCountry 'Ship Country',
Freight
from Orders
join Customers on
Customers.CustomerID = Orders.CustomerID

--24. For all customers, please create a report that show total freight split by order month
Select 
ContactName as 'Customers',
Datename(Month, OrderDate) 'Order Month',
Freight
from Orders
join Customers on
Customers.CustomerID = Orders.CustomerID

--25. For all customers, please create a report that show total freight split by ship region 
Select 
ContactName as 'Customers',
ShipRegion 'Ship Region',
Freight
from Orders
join Customers on
Customers.CustomerID = Orders.CustomerID


