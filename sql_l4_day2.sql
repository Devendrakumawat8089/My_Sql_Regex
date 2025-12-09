show databases;

CREATE database regex_l4;
show databases; 
use regex_l4; -- to see the output we're use SELECT Statement.

-- comments (-- , /* */)

select database(); -- to see the current database

show tables; -- display  tables 

create table devendra_2(salary int , age int  );
show tables;

-- information of a table describe / desc
describe devendra_2;

/*
to see database 
show databases;
-- to print current current database 
select database();
-- to work with database 
use database_name;
-- to see tables
show tables_name;
-- to create table
create table table_name(column , datatype);
-- table (description) --  to see the column name and datatype 
describe table_name;
*/

-- DQL -- DATA QUERY LANGUAGE 

use world;
show tables;
select * from city;
