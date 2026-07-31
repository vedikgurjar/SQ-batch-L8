-- correlated subqueries

-- a correleted subquery is a type of subquery  also called as dependent  query 

-- In this the inner query depends on the outer query

-- In this the inner query runs multiple time for each row of outer query 

use corr_db;

create table orders1 (order_id int, name varchar(20), amount int);
insert into orders1 values (1, 'a', 100), (2, 'a', 200), (3, 'a', 300), (4, 'b', 480), (5, 'b', 300);

select * from orders1;

select order_id, name, amount from orders1
where name = 'a' and amount = (select max(amount) from orders1 where name = 'a');

select order_id, name, amount from orders1
as o_outer where amount = (select max(amount) from orders1 where name = o_outer.name);

select order_id, name, amount from orders1
where amount <all (select avg(amount) from orders1);

select order_id, name, amount from orders1 
where amount in(select max(amount) from orders1);

select name,amount from orders1 where name = 'a' 
order by amount desc;

 