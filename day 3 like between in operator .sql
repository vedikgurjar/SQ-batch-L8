use world;
show tables;
 
 select * from city;
 
select district, population, district, population+1900 from city;

select district, population from city where name = 'kabul';

select name, district, population, countrycode from city where countrycode = 'ind' and population > 2000000;

select * from city where population = 4399819 or population = 2964638;

select * from city where population in 


-- like operator


select * from city where name like '%a';

select * from city where name like '%a%';


select name, population from city where name like '%e%';
select name, population from city where name like '%b_'; 
select name, population from city where name like '_a%r_';
select name, population from city where name like '%aa%';
select name, population from city where name like '%_e_e_e';


