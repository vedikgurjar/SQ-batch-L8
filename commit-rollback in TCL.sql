create database tcldb2;
use tcldb2;

create table tcldb2.test(id int, name varchar(20));

insert into tcldb2.test values(10,'vedik');
select * from tcldb2.test;

select @@autocommit; -- by default autocommet is 1 mean file will be automatically save 

start transaction;
insert into tcldb2.test values(19,'kunal');

select * from tcldb2.test;-- <<--- two rows here
commit; -- you save the change in the database

start transaction;
insert into tcldb2.test values(20,'japan');
insert into tcldb2.test values(21,'korea');
rollback; -- to revert the two lines inserted
select * from tcldb2.test;

start transaction;
insert into tcldb2.test values(22,'jaipur');
update tcldb2.test set name = 'abacas';
rollback; -- to revert the two lines inserted
select * from tcldb2.test;

-- set sql_safe_updates = 0;

-- drop table tcldb2.test;

start transaction;
insert into tcldb2.test values(23,'kota');
delete from tcldb2.test;
rollback; -- to revert the two lines inserted
select * from tcldb2.test;

