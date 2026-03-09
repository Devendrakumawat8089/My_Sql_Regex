use world;
show tables;
select * from country;
-- 09/02/2026
select name , continent ,population from country;
select continent ,sum(population) from country group by continent;
-- jis column pr group by krte hai usko hi select me likhte hai 
select count(name) ,continent, sum(Population) from country group by Continent , Region;

select count(*) , IndepYear from country group by IndepYear;
-- find out how many countrys got indepens for each year in each continent 
-- for subgrouping
select continent ,IndepYear, count(name) from country group by continent, IndepYear ;

-- where hamesha group by se phele lagega
select continent , count(*) as total_country from country where total_coountry>30 group by continent;
-- where caluse usi column pr apply krta hai jo table me exixt krta hai 
-- where clause executed first
-- where clause generaly / jyadatar are not used on aggregate functions 

-- having --> is used to filter the rows based on aggregate functions (count(*)) 
-- having clause bina group by ke use nhi hota 
-- having group by ke bad lagega 
-- group by --> having 

-- what is the diff btw group by  & having .
select continent , count(*) as total_country from country group by continent having total_country > 30 ;

-- to find the continent name and avg(population) only for those continent where avg(population) > 500000

select continent , avg(population) as average from country group by continent having average > 500000;

-- get me the avg(population) , total number of country 'sum(name)" , for each goverment from only for the countries get the indept after 1890 and atleast four countries

select GovernmentForm , avg(population) , count(name) as count from country where IndepYear > 1890  group by  GovernmentForm having count >= 4;

-- having --> jb aggregate functions pr work kre 



use world;

select * from country;

-- super key --> sare posible keys 

/*
					normalization 
						|
                        |
                        |
					   1NF
                       |
                       2NF
*/
