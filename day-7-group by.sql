use world;
select distinct(continent) from country;

select continent from country group by continent;

select continent, count(name) from country group by continent ;

select * from country where continent = 'North america';

select count(name) from country where continent = 'North america';

select count(name) from country where continent = 'Asia';

select name, count(name) from country group by name;

select * from city;

select count(name) from city where district = 'Zuid-Holland';

select district, count(name) from city group by district;

select district, count(name), sum(population) from city group by district;

select count(name) from city group by countrycode;

select countrycode, count(name) from city group by countrycode;

select * from country;

select count(name), count(code), count(continent), count(indepyear) from country;

-- count() do not count the null values
-- count() unique no. of values ko count karta hai

-- Q1 count the no. of country which have the lifeexpectancy from 70.1 to 83.5

SELECT COUNT(Name) FROM country
WHERE LifeExpectancy BETWEEN 70.1 AND 83.5;

-- Q2 get the total population of the country who got their independence after 1990

SELECT count(name), SUM(Population) FROM country
WHERE IndepYear >= 1990;

-- Q3 count the no. of countries which are not slaved by any other community

SELECT COUNT(Name) FROM country
WHERE IndepYear IS NULL;

-- 2nd method of Q3
select count(name) - count(indepyear) from country;

-- Q4 get the total countries and the total surface area for each region

SELECT Region, COUNT(Name), SUM(SurfaceArea) FROM country
GROUP BY Region;

-- Q5 get the total countries and each continent
 
SELECT Continent, COUNT(Name) FROM country
GROUP BY Continent;

-- Q6 get the total country for each region for each continent   

SELECT Continent, Region, COUNT(Name) FROM country
GROUP BY Continent, Region;


