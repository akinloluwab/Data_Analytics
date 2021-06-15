--1. List of Customer from the United Kingdom.
Select 
		ContactName,
		Country
from Customers

--2. List of orders processed in June 1996.
Select 
		DateName(MONTH,OrderDate) + ' ' + Datename(Year,OrderDate),
		sum(OrderID)
from Orders
where DateName(MONTH,OrderDate) = 'June' and Datename(Year,OrderDate) = '1996'
group by DateName(MONTH,OrderDate) + ' ' + Datename(Year,OrderDate)

--3. List of Products greater than $250.00
Select 
		ProductName,
		UnitPrice
from Products
where UnitPrice > 250

--4. List of orders shipped via 3
Select 
		OrderID,
		ShipVia
from Orders
where ShipVia  = 3


--5. List of orders processed within 25th Dec 1996 to 25th Dec 1997
Select 
		OrderID,
		Orderdate
from Orders
where Orderdate  between '1996-12-25 00:00:00.000' and '1997-12-25 00:00:00.000'


--6. Create a report that shows the company name, contact name and fax number of all customers that have a fax number.
Select 
		CompanyName,
		ContactName,
		Fax
from Customers
where fax is not null

--7. Create a report that shows the city, company name, and contact name of all customers who are in cities that begin with "A" or "B". Sort
-- by contact name in descending order.
Select 
		City,
		CompanyName,
		ContactName
from Customers
where city like '[AB]%'
Order by  ContactName desc

--8. Create a report showing the first and last name of all employees whose last names start with a letter between "J" and "M".
Select 
		FirstName,
		LastName
from Employees
where LastName like '[JM]%'

--9. Create a report showing the title of courtesy and the first and last name of all employees whose title of courtesy is "Mrs." or "Ms."
Select 
		TitleOfCourtesy,
		FirstName,
		LastName
from Employees
where TitleOfCourtesy in ('Mrs.','Ms.')

--10. Create a report showing the title of courtesy and the first and last name of all employees whose title of courtesy begins with "M".
Select 
		TitleOfCourtesy,
		FirstName,
		LastName
from Employees
where TitleOfCourtesy like 'M%'

--11. Create a report showing the title of courtesy and the first and last name of all employees whose title of courtesy begins with "M" and 
-- is followed by any character and a period(.).
Select 
		TitleOfCourtesy,
		FirstName,
		LastName
from Employees
where TitleOfCourtesy like 'M_.%'

--12. Create a report showing the title of courtesy and the first and last name of all employees whose title of courtesy is not "Ms." or "Mrs.".
Select 
		TitleOfCourtesy,
		FirstName,
		LastName
from Employees
where TitleOfCourtesy != 'Ms.' and TitleOfCourtesy != 'Mrs.'

--13. Create a report that shows the first and last names and birth date of all employees born in the 1950s.
Select 
		TitleOfCourtesy,
		FirstName,
		LastName
from Employees
where DATENAME(year,birthdate) between 1950 and 1959

--14. Create a report that shows the product name and supplier id for all products supplied by Exotic Liquids, Grandma Kelly's Homestead, and Tokyo
--Traders. Hint: you will need to first do a separate SELECT on the Suppliers table to find the supplier ids of these three companies.
Select * from Suppliers
Select 
		ProductName,
		SupplierID
from Products
where SupplierID in (1,2,3)



--15. Create a report that shows the shipping postal code, order id, and order date for all orders with a ship postal code beginning with "02389".
Select 
		ShipPostalCode,
		OrderID,
		OrderDate
from Orders
where ShipPostalCode like '02389%'


--16. Current Product list
Select * from Products
where UnitsInStock > 0

--17. List of customer from Germany
Select 
		CustomerID,
		ContactName
from Customers
where Country = 'Germany'

--18. List of Contact Name, City and Region of customers from Berlin
Select 
		ContactName,
		City,
		Region
from Customers
where City = 'Berlin'

--19. List of employees with date of birth 30 August 1963
Select 
		EmployeeID,
		LastName + ' ' + FirstName as 'Employee Name'
from Employees
where BirthDate = '1963-08-30 00:00:00.000'

--20. List of employees with a title of courtesy of 'Mr.'
Select 
		EmployeeID,
		LastName + ' ' + FirstName as 'Employee Name'
from Employees
where TitleOfCourtesy = 'Mr.'

--21. Total Freight split by Employee FullName
Select 
		sum(Freight),
		LastName + ' ' + FirstName as 'Employee Name'
from Orders
Join Employees on 
Employees.EmployeeID = Orders.OrderID
group by LastName + ' ' + FirstName