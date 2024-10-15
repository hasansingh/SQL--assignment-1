/*Que2: We would like to find the average salary of employees grouped by department.
But only return those groups with an average salary weight larger than 1000.*/
select department, avg(salary) as average_salary
from employees
group by department
having avg(salary) > 1000;
/*Que3: Get The running total of salaries of Employees from employee table
(employee_id, name, join_date,salary) ordering by the joining date of employee*/
select employee_id, name, join_date, salary,
sum(salary) over (order by join_date) as running_total
from employee
order by join_date;
/*Que4: In an Entrance exam students 10 will be selected, Write a query to rank the students
according
to their marks (students having same marks should be ranked as same)
The Students table contains(Student_id, Student_name, Roll_number_Marks)*/
select Student_id, Student_name, Roll_number_Marks,
rank() over (order by Roll_number_Marks desc) as rank
from Students
limit 10;
/*Que5: In the above question the criteria of selection has changed and now the students
ranked
up to 10 will be selected i.e. we can have more than 10 students.
Write a query to get the desired output.*/
select Student_id, Student_name, Roll_number_Marks, rank
from (
select Student_id, Student_name, Roll_number_Marks,
row_number() over (order by Roll_number_Marks desc) as rank
FROM Students
) AS RankedStudents
WHERE Rank <= 10;
/*Que6: We have a stock data which is updated daily We predict the daily stock price
using the lag(1)criteria Write a qwerty to get the lag(1) value from the Stocks table(date,price)*/
select date, price, lag(price) over (order by date) as lag_value
from Stocks;
/*Que7: From the Employees table(employee_id, name, hire_date, department, salary)
Write a query to get the employee data along with the total salary as “total_sal” of their
department.*/
select employee_id, name, hire_date, department, salary,
sum(salary) over (partition by department) as total_sal
from Employees;
/*Que8: From the Employees table(employee_id, name, hire_date, department, salary)
Write a query to get the employee data along with the max salary as “max_salary” of their
department.*/
select employee_id, name, hire_date, department, salary,
max(salary) over (partition by department) as max_salary
from Employees;
/*Que9: From the Employees table(employee_id, name, hire_date, department, salary)
Write a query to get the employee data along with the average salary
as “avg_salary” of their department.*/
select employee_id, name, hire_date, department, salary,
avg(salary) over (partition by department) as avg_salary
from Employees;
--Que10: Write the correct syntax of the NTILE function and also state the use of this function
ntile(n) over (partition by partition_expression order by sort_expression)