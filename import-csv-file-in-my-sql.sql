create database students_db;
use students_db;

create table students (
student_id int primary key,
student_name varchar(50),
age int,
city varchar(50),
course varchar(20),
marks int);

select * from students;
