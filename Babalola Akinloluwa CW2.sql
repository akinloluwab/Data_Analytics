
--1. Write a query to list Order ID, ContactName, CompanyName and Customer City
Select * from Orders
Select * from Customers
Select 
		OrderID,
		ContactName,
		CompanyName,
		City as 'Customer City'
from Orders
Join Customers on
Customers.CustomerID = Orders.CustomerID

--2. Write a query to return a list of Countries with 10 or more customers
Select * from Customers
Select 
		ContactName,
		count(Country)
from
Customers
group by ContactName
having count(Country) > 9

--3. Write a query to Count Number of Customers by Country for USA, France & Venezuela
Select 
		Country,
		COUNT(Country) as 'Number of Customers'
from 
Customers
where Country in ('USA', 'France', 'Venezuela')
group by Country
Order by COUNT(Country) desc

--5. Write a query to list the Customers whose Region is not blank
Select * from Customers
Select
		ContactName,
		Region
from
Customers
Where Region is not null

--6. Write a query to list all customer with ContactTitle is owner
Select
		ContactName
		
from
Customers
where ContactTitle = 'Owner'

--7. Write a query to list Total Sales by Employee
Select * from Employees
Select * from [Order Details]
Select * from Orders

Select
	    [Order Details].OrderID,
		LastName + ' ' + FirstName as 'Employee Name',
		round(sum((UnitPrice*Quantity)*(1-Discount)),2) as TotalSales
from [Order Details]
Join Orders on
      [Order Details].OrderID=Orders.OrderID
Join Employees on
      Orders.EmployeeID=Employees.EmployeeID
Group by  [Order Details].OrderID,LastName + ' ' + FirstName



--8. Write a query to list all customer with ContactTitle is owner
Select 
		ContactName
from Customers
where ContactTitle = 'Owner'

--9. Write a query to Products by Categories where the Product is not discontinued
Select 
ProductID,
CategoryID, 
UnitsInStock
from Products
where Discontinued > 0

Select * from Products
Where discontinued > 0

--10. Write a query to return Orders by Subtotal
Select
		OrderID,
		SUM(UnitPrice*Quantity) as SubTotal
from [Order Details]
group by OrderID


--11. Write a query to return Alphabetical list of Products
Select 
ProductName
from Products
Order by ProductName ASC
--12. Write a query to return Total Sales by year
Select * 
from
Orders
Select * from [Order Details]

Select 
		Orders.OrderID,
		Datename(Year,OrderDate) as Year,
		round(SUM((UnitPrice*Quantity)*(1-Discount)),2) as 'Total Sales'
		
from [Order Details]
Join Orders on
Orders.OrderID = [Order Details].OrderID
Group by Datename(Year,OrderDate), Orders.OrderID


--13. Write a query to return Orders by SubTotal greater than 1000
Select
		OrderID,
		SUM(UnitPrice*Quantity) as SubTotal
from [Order Details]
group by OrderID
having SUM(UnitPrice*Quantity) > 1000
--14. Write a query to return Total Sales by year

--15. Total Sales split by CustomerName
Select * from [Order Details]
Select * from Customers

--16. Total Freight split by Employee FullName

Select * from Employees
Select * from Orders
Select
		LastName + ' ' + FirstName as 'Employee Full Name',
		Sum(Freight)
from
Orders
join Employees on
Employees.EmployeeID = Orders.OrderID
group by LastName + ' ' + FirstName
--17. Total Number of orders split by customers. Only display customers that placed an orders
Select * from Orders
Select * from Customers
Select 
		ContactName,
		count(OrderID) as 'Number of Customers'
from Orders
Join Customers on
Customers.CustomerID = Orders.CustomerID
Group by ContactName
having count(OrderID) > 0
--18. List of customers whether or not they placed an hour
Select 
		ContactName
from Customers
--19. Total number of order split by customer type
-- Customer Type is defined using the below transformation rule
	--Freight less than or equal to 500 is deemed as standard customers
	--Freight more than 500 is deemed as corporate customers
Select 
		OrderID,
		Freight as 'Total Freight',

		Case
			when Freight > 500 then 'Corporate Customers'
			Else 'Standard Customers'
		End As 'Customer Type'
from Orders
