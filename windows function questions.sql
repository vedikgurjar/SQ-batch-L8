use windows10db;

CREATE TABLE employee_sales (
    sale_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department VARCHAR(50),
    sale_date DATE,
    sales_amount DECIMAL(10,2)
);



INSERT INTO employee_sales
    (sale_id, employee_name, department, sale_date, sales_amount)
VALUES
    (1,  'Alice', 'Electronics', '2026-01-05', 1200.00),
    (2,  'Bob',   'Electronics', '2026-01-08', 1800.00),
    (3,  'Alice', 'Electronics', '2026-01-15', 1500.00),
    (4,  'Charlie','Electronics','2026-01-20', 1800.00),
    (5,  'Bob',   'Electronics', '2026-01-25', 2200.00),

    (6,  'David', 'Furniture',   '2026-01-03', 2500.00),
    (7,  'Emma',  'Furniture',   '2026-01-10', 1800.00),
    (8,  'David', 'Furniture',   '2026-01-18', 3000.00),
    (9,  'Frank', 'Furniture',   '2026-01-22', 1800.00),
    (10, 'Emma',  'Furniture',   '2026-01-28', 3200.00),

    (11, 'George','Clothing',    '2026-01-04', 900.00),
    (12, 'Helen', 'Clothing',    '2026-01-09', 1400.00),
    (13, 'George','Clothing',    '2026-01-16', 1100.00),
    (14, 'Helen', 'Clothing',    '2026-01-21', 1400.00),
    (15, 'Ian',   'Clothing',    '2026-01-27', 2000.00);
    
    -- Find the total sales of each department and display the department, employee name, sales amount, and the total sales of that department for every employee. 
select employee_name, department, sales_amount,
sum(sales_amount) over(partition by department) as total_department_sales
from employee_sales;

-- Find the average sales amount of each department and display the department, employee name, sales amount, and the average sales of that department for every employee.
SELECT employee_name, department, sales_amount,
AVG(sales_amount) OVER(PARTITION BY department) AS avg_department_sales
FROM employee_sales;
    
-- difference between sale and department average
select employee_name, department, sales_amount,
avg(sales_amount) over(partition by department) as department_average,
round(sales_amount) - avg(sales_amount) over(partition by department) as difference
from employee_sales;
 
-- department sales as a percentage of overall sales calculate the total sales for each department and the overall company sales using 

select department, SUM(sales_amount) as department_sales,
sum(sum(sales_amount)) over() as overall_sales,
round(sum(sales_amount) / sum(sum(sales_amount)) over() * 100, 2) as percentage_of_overall_sales
FROM employee_sales
group by department;

-- calculate each department 's percentage of company sales using the previous concept, calculate department total / company total * 100

select department, sum(sales_amount) as department_total,
sum(sum(sales_amount)) over() as company_total,
round(sum(sales_amount) / SUM(SUM(sales_amount)) over() * 100, 2) as department_percentage
from employee_sales
group by department;

/*
--  Multiple aggregate windows together For every sale, display:
 • Department total
• Department average
• Department minimum
• Department maximum
*/

select employee_name, department, sales_amount,
sum(sales_amount) over(partition by department) as department_total,
avg(sales_amount) over(partition by department) as department_average,
min(sales_amount) over(PARTITION BY department) as department_minimum,
max(sales_amount) OVER(partition by department) as department_maximum
from employee_sales;