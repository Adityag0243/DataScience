create database activity3;
use activity3;

CREATE TABLE employees (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50),
department VARCHAR(50),
salary INT,
hire_date DATE
);

INSERT INTO employees (name, department, salary, hire_date) VALUES
('Alice', 'Sales', 60000, '2019-06-15'),
('Bob', 'HR', 45000, '2021-03-12'),
('Charlie', 'Engineering', 72000, '2018-01-10'),
('David', 'Marketing', 50000, '2020-07-20'),
('Eve', 'Sales', 55000, '2018-09-30'),
('Frank', 'HR', 35000, '2020-02-25'),
('Grace', 'Design', 65000, '2017-11-05'),
('Hank', 'Engineering', 68000, '2020-08-22'),
('Ivy', 'Design', 70000, '2021-05-18'),
('Jack', 'Finance', 80000, '2016-12-01'),
('Kate', 'Sales', 50000, '2019-10-10'),
('Leo', 'IT', 75000, '2019-01-15'),
('Mia', 'Sales', 62000, '2022-01-01'),
('Nina', 'HR', 40000, '2023-06-10'),
('Oscar', 'Marketing', 58000, '2021-07-15'),
('Paul', 'Engineering', 90000, '2017-03-18'),
('Quinn', 'Design', 75000, '2019-04-25'),
('Rita', 'IT', 60000, '2021-10-20'),
('Sam', 'HR', 62000, '2022-11-30'),
('Tina', 'Finance', 42000, '2018-08-18');

select * 
from employees;

--  QUESTION 1    Given the following table employees with columns id, name, department,
-- salary, and hire_date, write a query to retrieve all employees who are either in the 'Sales'
-- department with a salary greater than 50000 or in the 'HR' department hired after January 1,2020.

select * 
from employees
WHERE  (department='Sales' and salary>50000) or  (department='HR' and hire_date > '2020-01-01');


-- Question 4: Write a query to retrieve all employees with salaries between 40000 and 60000,
-- excluding those in the 'Marketing' department, and order the result by hire_date descending
-- and salary ascending.

select * 
from employees
WHERE  salary between 40000 and 60000 and department!='Marketing'
order by hire_date desc , salary asc;


-- Question 5: Write a query to find employees who are either not in the 'Finance' department or
-- have a salary less than 30000, and then order the results first by department in ascending
-- order and then by name in descending order.

select * 
from employees
WHERE  salary<30000 or department='Finance'
order by department asc , name desc;


-- Question 6: Write a query to retrieve employees whose name starts with 'A', have been hired
-- after January 1, 2015, and order the results by their name in ascending order.

select * 
from employees
where name like 'A%' and hire_date > '2015-01-01'
order by name asc;


-- Question 7: Write a query to find employees who are in either the 'Engineering' department with
-- a salary less than 70000 or the 'Design' department with a salary greater than 60000, and order
-- the results by salary descending.

select * 
from employees
where (salary< 70000 and department='Engineering') or (salary > 60000 and department='Design')
order by salary desc;

-- Question 9: Given the following table projects with columns project_id, project_name,
-- start_date, and end_date, write a query to retrieve all projects that started before January
-- 1, 2022, or ended after December 31, 2022, and order the result by project_name in
-- descending order.

select *
from projects
where start_date < '2020-01-01' or end_date > '2020-12-31'
order by project_name desc;

-- Question 10: Write a query to find employees with a name ending with 'son', not in the 'IT'
-- department, and order the results first by salary in descending order and then by hire_date
-- in ascending order

select * 
from employees
where name like '%son' and department != 'IT'
order by salary desc, hire_date asc;


-- Question 11: Write a query to retrieve employees who were hired in the year 2021 and have a
-- salary greater than the average salary of all employees, and order the results by name in
-- ascending order.


select avg(salary)
from employees;

select * 
from employees
where year(hire_date)= 2021 and salary>60700.0000
order by name asc;

select * 
from employees
where year(hire_date)= 2021 and salary>(select avg(salary) from employees)
order by name asc;


















