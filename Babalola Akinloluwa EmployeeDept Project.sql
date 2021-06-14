--1.Return Employee record with highest salary
Select Top 1 * 

from Employee
Order by SAL DESC

--2.Return the highest salary in employee table
Select Top 1 SAL 

from Employee
Order by SAL DESC


--3.Return the 2nd highest salary from employee table
Select Top 1 
		SAL 
from Employee
WHERE SAL<(SELECT MAX(SAL) FROM EMPLOYEE)
Order by SAL DESC

--4.Select range of employee based on Id
Select 
		EMPNO as 'Employee ID',
		ENAME as 'Employee Name'
from Employee
where EMPNO between 7654 and 7900

--5.Return an employee with the highest salary and the employee's department
Select Top 1 ENAME as 'Employee Name',
			DNAME as 'Department Name'

from Employee
JOIN Dept on
Dept.DEPTNO = Employee.DEPTNO
Order by SAL DESC

--6.Return highest Salara, employee name, department name for each department 
Select Top 1 SAL AS 'Highest Salary',
			ENAME as 'Employee Name',
			DNAME as 'Department Name'
from Employee
JOIN Dept on
Dept.DEPTNO = Employee.DEPTNO
Order by SAL DESC

--Question 8-1: Enter a command with the column named DEPTINO mistakenly entered as DPTINO.
Select
		DEPTNO as DPTINO
from 
Dept

--Question 8-2: Position to line 1 (L1) of the current query.
--Question 8-3: Change DPTINO to DEPTINO.
Select
		DEPTNO as DEPTINO
from 
Dept

--Question 8-4: Execute the current SQL command.
--Question 8-5: List the contents of the SQL command buffer.
--Question 8-6: Add a new line to the current SQL query.
--Question 8-7:  Get a list of all the SQL and UFI commands. 
--Question 8-8: Get Help on the SQL clause SELECT.
