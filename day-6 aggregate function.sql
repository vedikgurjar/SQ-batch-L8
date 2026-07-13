use world;
select distinct(name) from country;

select count(name), count(distinct(name)) from country;

select count(continent), count(distinct(name)) from country;

select count(population), sum(population), avg(population) from country;

select count(surfacearea), sum(surfacearea), max(surfacearea) from country;

select count(continent), max(continent), min(continent) from country;

-- population  => non-aggregated column
-- count(population) => aggregated function
 
select population, count(population) from country;

select avg(population) from country;

select population, replace(population, 1,4) from country;

select avg(population), avg (replace(population,0, '') )from country;

select avg( replace( population, 0, '') ) from country;

-- data sort karna. (order by clause) 
select name, continent, region, population from country
order by population,name;

select name, continent, region, population from country
order by continent;

-- region ascending order sort
-- in each region we sort the data based on population in descending order

select name, continent, region, population from country
order by region, population desc;