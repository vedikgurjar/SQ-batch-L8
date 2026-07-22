create database assignment3;
use assignment3;

CREATE TABLE departments (
dept_id INT PRIMARY KEY,
dept_name VARCHAR(50),
location VARCHAR(50)
);
INSERT INTO departments VALUES
(10,'HR','Jaipur'),
(20,'IT','Bangalore'),
(30,'Finance','Mumbai'),
(40,'Marketing','Delhi'),
(50,'Legal','Pune');
CREATE TABLE employees (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(50),
dept_id INT,
salary INT,
city VARCHAR(50)
);
INSERT INTO employees VALUES
(101,'Amit',10,45000,'Jaipur'),
(102,'Bhavna',20,72000,'Bangalore'),
(103,'Chirag',20,68000,'Bangalore'),
(104,'Divya',30,55000,'Mumbai'),
(105,'Esha',NULL,39000,'Delhi'),
(106,'Farhan',40,61000,'Delhi'),
(107,'Gaurav',60,50000,'Kolkata'),
(108,'Hina',30,83000,'Mumbai');
CREATE TABLE projects (
proj_id INT PRIMARY KEY,
proj_name VARCHAR(50),
dept_id INT,
budget INT
);
INSERT INTO projects VALUES
(1,'Payroll Revamp',10,120000),
(2,'Cloud Migration',20,500000),
(3,'Mobile App',20,300000),
(4,'Audit Automation',30,250000),
(5,'Brand Refresh',40,180000),
(6,'Data Lake',70,400000);

select * from departments;
select * from employees;
select * from projects;

-- Q1. List each employee with their department name and location.

SELECT e.emp_id,
       e.emp_name,
       d.dept_name,
       d.location
FROM employees e
 JOIN departments d
ON e.dept_id = d.dept_id;

-- Q2. Show every project along with the name of the department that owns it.

SELECT p.proj_id,
       p.proj_name,
       d.dept_name,
       p.budget
FROM projects p
 JOIN departments d
ON p.dept_id = d.dept_id;

-- Q3. Show employee names together with the projects run by their own department.

SELECT e.emp_name,
       d.dept_name,
       p.proj_name
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id
INNER JOIN projects p
ON d.dept_id = p.dept_id;

-- Q4. List ALL employees with their department name; show NULL when the employee has no matching department.

SELECT e.emp_id,
       e.emp_name,
       e.dept_id,
       d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;

-- Q5. List ALL departments with their projects; departments with no project must still appear.

SELECT d.dept_id,
       d.dept_name,
       p.proj_name,
       p.budget
FROM departments d
LEFT JOIN projects p
ON d.dept_id = p.dept_id;

-- Q6. Find only those employees who do NOT belong to any valid department

SELECT e.emp_id,
       e.emp_name,
       e.dept_id
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id
WHERE d.dept_id IS NULL;

-- Q7. List ALL departments and any employees in them, using a RIGHT JOIN with employees on the left.

SELECT e.emp_name,
       d.dept_id,
       d.dept_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;

-- Q8. List ALL projects and the department that owns them, keeping projects that point to a missing department.

SELECT d.dept_name,
       p.proj_id,
       p.proj_name,
       p.dept_id
FROM departments d
RIGHT JOIN projects p
ON d.dept_id = p.dept_id;

-- Q9. Find departments that currently have NO employee assigned.

SELECT d.dept_id,
       d.dept_name,
       d.location
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id
WHERE e.emp_id IS NULL;

-- Q10. Produce every possible pairing of the Finance/Legal departments with employees earning above 70000.

SELECT e.emp_name,
       e.salary,
       d.dept_name
FROM employees e
CROSS JOIN departments d
WHERE d.dept_name IN ('Finance', 'Legal')
  AND e.salary > 70000;
 
 -- Q11. Pair every project having a budget of at least 400000 with every department located in Mumbai or Pune.

  select * from projects 
  cross join departments d 
  where budget>=400000 and location in ('mumbai', 'pune');
  
  -- Q12. How many total row combinations result from CROSS JOIN of employees and departments? Show the count.
SELECT COUNT(*) AS total_combinations
FROM employees
CROSS JOIN departments;

-- Q13. Show employees whose salary is greater than 60000
SELECT emp_id,
       emp_name,
       dept_id,
       salary,
       city
FROM employees
WHERE salary > 60000;

-- Q14. Show all employees based in Delhi or Mumbai.
SELECT emp_id,
       emp_name,
       salary,
       city
FROM employees
WHERE city IN ('Delhi', 'Mumbai');

-- Q15. Show employees whose dept_id is NULL (unassigned employees).

SELECT emp_id,
       emp_name,
       dept_id,
       salary
FROM employees
WHERE dept_id IS NULL;

-- Q16. Show departments located in Bangalore or Delhi
select dept_id, dept_name, location 
from departments
where location in ('Bangalore', 'Delhi');

-- Q17. Show departments whose dept_id is 30 or higher.

select dept_id, dept_name, location 
from departments
where dept_id >= 30;

-- Q19. Show projects with a budget between 200000 and 400000 (inclusive)

select proj_id, proj_name, dept_id, budget
from projects
where budget between 200000 and 400000;

-- Q20. Show all projects that belong to dept_id 20.
select * from projects 
where dept_id = 20;

-- Q21. Show projects whose name contains the word "a" and budget is under 300000

select proj_id, proj_name, budget
from projects
where proj_name like '%a%'
and budget < 300000;

-- Q22. Show employee name, department name, location and project name for all matching rows across all three tables.

select e.emp_name, 
d.dept_name,
d.location,
p.proj_name
from employees e
join departments d
on e.dept_id = d.dept_id
join projects p 
on d.dept_id = p.dept_id;

-- Q23. Show ALL employees, plus department and project details where available (keep employees even with no dept/project).

select e.emp_id,
e.emp_name,
d.dept_name,
d.location,
p.proj_name
from employees e
left join departments d
on e.dept_id = d.dept_id
left join projects p 
on d.dept_id = p.dept_id;

-- Q24. Show employees earning more than 60000 along with department and any project over 250000 budget.
select e.emp_name,
e.salary,
d.dept_name,
p.proj_name,
p.budget
from employees e
join departments d
on e.dept_id = d.dept_id
join projects p
on d.dept_id = p.dept_id
where e.salary > 60000
and p.budget > 250000;

-- Q25. List ALL departments with their employees and projects, including departments having neither.

select d.dept_id,
d.dept_name,
e.emp_name,
p.proj_name
from departments d
left join employees e
on d.dept_id = e.dept_id
left join projects p 
on d.dept_id = p.dept_id;

-- Q26. Show employees who work in a department located in Bangalore or Mumbai, along with the projects of that department.

select e.emp_name,
d.location,
p.proj_name
from employees e
left join departments d
on e.dept_id = d.dept_id
left join projects p
on d.dept_id = p.dept_id
where location in('bangalore', 'mumbai');

-- Q27. Pair employees who work in the same city (avoid duplicate pairs and self-pairing).

SELECT e1.emp_name AS employee_1,
       e2.emp_name AS employee_2,
       e1.city
FROM employees e1
JOIN employees e2
ON e1.city = e2.city
AND e1.emp_id < e2.emp_id;

-- Q28. Show every project along with employees of that department; keep projects with no employees.

SELECT p.proj_name,
       p.dept_id,
       e.emp_name
FROM projects p
LEFT JOIN employees e
ON p.dept_id = e.dept_id;