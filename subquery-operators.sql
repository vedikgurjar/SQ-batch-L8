use corr_db;
select * from employee_c;
select salary from employee_c 
where salary in (select salary from employee_c where name = 'a');

select * from employee_c 
where salary in (100, 300);

-- in operator and any operator are equally same 

select salary from employee_c 
where salary =any (select salary from employee_c where name = 'a');

select * from employee_c 
where salary > 100 or salary > 300;

select salary from employee_c 
where salary >any (select salary from employee_c where name = 'a');

select salary from employee_c 
where salary <any (select salary from employee_c where name = 'a');

select salary from employee_c 
where salary >all (select salary from employee_c where name = 'a');
