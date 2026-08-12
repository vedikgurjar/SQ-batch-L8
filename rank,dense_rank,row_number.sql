-- rank() ==> skip krr deta h jese same number h 1,2,2 to ye last wale 2 ko 3 hi manega 4 aayega agla no.
-- dense_rank()==> isme same value hone pr skip nahi hoti
-- row_number ==> unique no. assign karta h s
use windows10db;

select employee_id, employee_name, location, sales_amount, salary,
rank() over(partition by location order by salary desc),
dense_rank() over(partition by location order by salary desc) from employee_performance;

select employee_id, employee_name, location, sales_amount, salary,
rank() over(partition by location order by sales_amount desc),
dense_rank() over(partition by location order by sales_amount desc) from employee_performance;

