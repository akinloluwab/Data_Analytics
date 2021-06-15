--1. Avg freight split by Shipcity
Select 
ShipCity,
Avg(Freight) as 'Average Freight'
from Orders
group by ShipCity

--2. Min freight split by ShipCountry
Select 
ShipCountry,
Min(Freight) as 'Minimum Freight'
from Orders
group by ShipCountry
--3. Total number of orders split by Hire Month Year
Select * from Orders
Select 
DATENAME(Month, HireDate) + ' ' + DATENAME(Year,HireDate) as Hiredate,
Count(OrderID) as 'Total Order'
from Orders
Join Employees on
Employees.EmployeeID = Orders.EmployeeID
group by DATENAME(Month, HireDate) + ' ' + DATENAME(Year,HireDate)

--4. Total number of orders split by birth year
Select * from Orders
Select * from Employees
Select 
count(OrderID) as 'Total Number of Orders',
DATENAME(Year, BirthDate) as 'Birth Year'
from
Orders
join Employees on
Employees.EmployeeID = Orders.EmployeeID
group by DATENAME(Year, BirthDate)
--5. Total number of orders split by Contact Name and Employee FirstName
Select * from Customers
Select * from Employees
Select
		FirstName,
		ContactName,
		Count(OrderID) as 'Total Orders'
from Orders
Join Employees on
	Orders.EmployeeID = Employees.EmployeeID
Join Customers on
Customers.CustomerID = Orders.CustomerID
Group by FirstName, ContactName
--6. Total Freight split by Ship Country and Order Year
Select 
		ShipCountry,
		Datename(Year,OrderDate) as 'Order Year',
		sum(Freight) as 'Total Freight'
from Orders
Group by ShipCountry,
		Datename(Year,OrderDate) 

--7. List of Customer from Germany
Select 
		ContactName,
		Country
from Customers

--8. List of Contact Name, City and Region of customers from Berlin
Select 
		ContactName,
		City,
		Region
from Customers
where city = 'berlin'

--9. List of employees with date of birth 30 August 1963
Select 
		LastName + ' ' + FirstName as Employee
from employees
where BirthDate = '1963-08-30 00:00:00.000'

--10. List of employees with a title of courtesy of 'Mr'
Select 
		LastName + ' ' + FirstName as Employee
from employees
where TitleOfCourtesy = 'Mr.'

--11. Total number of orders breakdown by ship region
Select 
		ShipRegion,
		count(OrderID) 'Total Number of Orders'
from orders
group by ShipRegion

--12. Total number of orders breakdown by Ship Country
Select 
		ShipCountry,
		COUNT(OrderID) as 'Total Number of Orders'
from  orders
Group by ShipCountry

--13. Total number of orders split by Ship Country and Ship Name
Select
		ShipCountry,
		ShipName,
		COUNT(OrderID) as 'Total Number of Orders'
from 
Orders
Group by ShipCountry, ShipName

--14. Total number of Orders split by Product
Select 
*
from
Orders
Select * from [Order Details]
Select * from Products
Select 
		Orders.OrderID,
		ProductName
from
Orders
join [Order Details] on
[Order Details].OrderID = Orders.OrderID
join Products on 
Products.ProductID = [Order Details].OrderID

--15. Highest freight cost split by Ship Name. Arrange the Highest freight from highest to lowest


--16. Lowest freight cost split by ship

--17. List of orders processed in Germany or Brazil. Also include orders processed on 15th June 1997
Select * from Orders
Select * from Customers

Select 
		OrderID,
		ShipCountry,
		OrderDate
from Orders
where ShipCountry in ('Germany', 'Brazil')
or OrderDate = '1997-06-15 00:00:00.000'


--18. Total Freight cost split by Order Month
select 
		DATENAME(Month, OrderDate) as 'Order Month',
		Sum(Freight) as 'Total Freight'
from Orders
group by DATENAME(Month, OrderDate)

--19. AVG freight cost split by shipped month
select 
		DATENAME(Month, ShippedDate) as 'Shipped Month',
		Avg(Freight) as 'Average Freight Cost'
from orders
group by DATENAME(Month, ShippedDate)

--20. Total Sales split by ProductName
Select * from [Order Details]
Select * from Products
Select 
		ProductName,
		sum([Order Details].UnitPrice*Quantity) as 'Total Sales'
from
[Order Details]
join Products on 
Products.ProductID = [Order Details].ProductID
group by ProductName

--21. For all customers, please create a report that show total freight split by ship city
Select * from Customers
Select * from Orders
Select
		ContactName,
		ShipCity,
		sum(Freight) as 'Total Freight'
from
Orders
join Customers on
Customers.CustomerID = Orders.CustomerID
group by ContactName, ShipCity
--22. For all customers, please create a report that show total freight split by ship city

--23. For all customers, please create a report that show total freight split by ship Country
Select
		ContactName,
		ShipCountry,
		sum(Freight) as 'Total Freight'
from
Orders
join Customers on
Customers.CustomerID = Orders.CustomerID
group by ContactName, ShipCountry
--24. For all customers, please create a report that show total freight split by order month
Select
		ContactName,
		DATENAME(Month,OrderDate) as 'Order Month',
		sum(Freight) as 'Total Freight'
from
Orders
join Customers on
Customers.CustomerID = Orders.CustomerID
group by ContactName, DATENAME(Month,OrderDate)
--25. For all customers, please create a report that show total freight split by ship region
Select
		ContactName,
		ShipRegion,
		sum(Freight) as 'Total Freight'
from
Orders
join Customers on
Customers.CustomerID = Orders.CustomerID
group by ContactName, ShipRegion
