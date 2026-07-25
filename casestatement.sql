use world;
select name, indepyear, ifnull(indepyear, 0) from country;
select name, indepyear, lifeexpectancy, coalesce(indepyear, lifeexpectancy, name) from country;

-- case statement

-- if(condition, true, false)
-- if(condition,true,  if(condition2, true2, false))
select name, population, indepyear,
 if(indepyear>1947, 'After india', 'Before india independence') from country;
 
select name, population, indepyear,
if (indepyear>1947, 'After india',
if(indepyear>1920, 'just before india', 'before india independence')) from country;

select name, population, indepyear,
case
    when indepyear > 1947  then 'after 1947'
    when indepyear>=1919 then 'only after 1919'
    else 'else condition'
end from country;


select name, continent, population,
case
    when population between 200000 and 500000 then 'average populatiopn'
    when population > 500000  then 'large population'
    else 'small population'
end
from country;

-- print the continent name and the no of countries with the category of the continent column 
-- if no. of countries small continent  15 se jyada agerage scale continent 10 se jyada small 25 se large scale continent

select continent, count(*),
case 
    when count(*) > 15 then 'average scale continent'
    when count(*) > 10 then 'small continent'
    when count(*) > 25 then 'large continent'
end
from country 
group by continent;