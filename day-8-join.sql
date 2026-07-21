use world;
select * from city;
select * from country;
select city.name, city.countrycode from city;
select country.name, country.code from country;

select city.name, city.countrycode, country.continent from city join country
where city.countrycode=country.code
and city.name = 'Amsterdam';

select c.name, c.population,
cn.name,cn.population from city as c
join country as cn
where c.countrycode = cn.code;

select c.id, c.name, c.countrycode, cty.code, cty.name from city as c 
join country as cty
on c.countrycode=cty.code;

-- cross join/ cartesian join
 select c.id, c.name, c.countrycode, cty.code, cty.name from city as c
 cross join country as cty;
 
 select c.id, c.name, c.countrycode, cty.code, cty.name from city as c
join country as cty;

select count(*) from city; -- > 4079
select count(*) from country; -- > 239 

select count(*) from city as c
join country as cty;
