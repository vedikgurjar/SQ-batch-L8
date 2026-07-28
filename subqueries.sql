-- subqueries --> query within a query

create database corr_db;
use corr_db;
create table employee_c (id int, name varchar(20), salary int);
insert into employee_c values (1, 'a', 100), (2, 'b', 350), (3, 'c', 400), (4, 'd', 380);

-- hightest salary kya hai

select max(salary) from employee_c;
select * from employee_c where salary=400;

select min(salary) from employee_c; 
select * from employee_c 
where salary = 100;

-- Nested query
select * from employee_c where salary = ( select min(salary) from employee_c);

-- subquery with the maximum salary
select * from employee_c where salary = ( select max(salary) from employee_c);

insert into employee_c values(5, 'aman', 250);

select * from employee_c where salary =( select salary from employee_c where name = 'b');

select * from employee_c where salary > (select avg(salary) from employee_c);

-- questions 
use world;
select * from city;
 
-- get the name of city where the district of their city is same for the city 'abudhabi'
select name from city
where district = (select District from city where Name = 'Abu Dhabi');

-- get all the columns from their city table where the population is the maximum
select * from city
where Population = (select max(Population) from city);

-- get the district and the name of the city where the country code is same for 'herat' 
select district, name from city
where countrycode = ( select countrycode from city where name = 'herat');

-- get the district, city and the population for all the countries where 'ambsterdam' and sort this data by the population
SELECT District, Name, Population FROM city
where countrycode = (select countrycode from city where Name = 'Amsterdam')
order by Population; 


