-- windows function are the function which are use to perform the calculation or set of rows 
-- these calculation are done in relation with the current row 
-- windows function do not collabs the data like group by
-- over() => set of rows define karnaa
 
 create database windows10db;
 use windows10db;
 
 create table employees(id int, name varchar(20), dept varchar(20), salary int);
 insert into employees values(1,'a', 'hr', 100), (2, 'b', 'hr', 200), (3, 'c', 'marketing', 300), (4, 'd', 'marketing', '400'), (5, 'e', 'hr', 500);
 
 select sum(salary) from employees; -- aggregate
 select dept, sum(salary) from employees;-- error  (without group by koi aur column select nhi ho sakta)
 
 select dept, sum(salary) from employees group by dept;-- total salary by dept
 select dept, name, sum(salary) from employees group by dept; -- name is not in group by
 
 select dept, name, sum(salary) from employees group by dept, name;-- name is not in group by
 
 select *, (select sum(salary) from employees) from employees;
 
 -- select *, (select sum(salary) from employees where employees ;

-- over() => set of rows define karna
 select *, sum(salary) over(),
max(salary) over() from employees;
 
 select *, sum(salary) over(), sum(salary) over() - salary as difference from employees;
 
 -- partition by() => hisse kr deta h group by ki tarah bs collab ni krta
  select *, sum(salary) over(), sum(salary) over(partition by dept) from employees;
 
 select *, sum(salary) over(partition by name) from employees;
 
 