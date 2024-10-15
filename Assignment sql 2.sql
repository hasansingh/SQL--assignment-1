/*Que1: Examine these two rows from an employee table:
empid emp_name designation
------- ----------- -------------
12330 Scott Manager
10012 King CEO
Write a query to display the rows like this:
PROFILE
----------
Scott is a Manager
King is a CEO*/
select CONCAT(emp_name, ' is a ', designation) as PROFILE
from employee_table;
/*Que2: Write a query to Find out the total number of characters
in the names of each customer from the Customer table.*/
select customer_name, length(customer_name) as name_length
from Customer;
/*Que3: Write a query to display the content of the customer table
having customer names in capital only.*/
select * from Customer
where customer_name = upper(customer_name);
/*Que4: From the employees table(Employee_id, Name, Hire_date, Resignation_date)
Write a query to get the total number of days employees have worked in the company
(including the holidays as well).*/
select Employee_id, name, DATEDIFF(Resignation_date, Hire_date) as Total_Working_Days
from employees;
/*Que5: From the Employees table(employee_id,name,email,phone,salary),
write a SQL query to find those employees who earn above 35000
or the fifth character in their phone number is 9.*/
select * from Employees
where salary > 35000 or substring(phone, 5, 1) = '9';
/*Que6: The EMPLOYEE table has a column JOIN_DATE of data type DATE,
containing the date the employee joined the company.
Write a query to display details of employees where JOIN_DATE is within the last 24 months*/
select * from EMPLOYEE
where JOIN_DATE >= DATE_SUB(CURDATE(), INTERVAL 24 month);
--Que7: Write a query to get the details of all customers whose name starts with ‘an$’.
select * from customers
where customer_name like 'an$%';
--Que8: Write a query to get the round up salaries of each employee.
select Employee_id, name, ceil(salary) as RoundedSalary
from Employees;
/*Que9: From the EMPLOYEES table, write a SQL query to find the employees
who have joined after 2018 Return first_name,join_date, salary.*/
select first_name, join_date, salary
from EMPLOYEES
where join_date > '2018-01-01';
--Que10: Write the correct syntax of to_char function
select to_char(date_column, 'YYYY-MM-DD') as formatted_date
from table_name;