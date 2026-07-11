-- numeric functions
select lifeexpectancy, round(lifeexpectancy) from country;

select 34.58, round(134.3);
select 76.69, round(76.269, 1);

select 76.369, round(76.361, 2);

-- roundoff to nearest 10, 100,1000

select 9, round(132, -1);
select 9, round(13.2, -2);

--  -2 -> 1
select 13.2, round(53.2, -2);
select 252.2, round(252.2, -3);
select 254.2, round(7654, -3);

select round(34.857, 1), truncate(34.857,1), mod(3,5);
select floor(34.99999999), ceil(34.0000001);
select abs(10.1111), abs(-10.12312312);