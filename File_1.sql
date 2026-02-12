/* 
SQL (Structured Query Language) is used to:
											Store data
											Retrieve data
											Update data
											Delete data
											Manage databases
															--> It works with Relational Databases.
2️ What is a Database? 
	--> DBMS (Database Management System) is software that is used to store, manage, retrieve, and manipulate data in an organized way.
1. Entity --> Real-world object jiska data store hota hai
2. Attribute (Columns) --> Entity ki properties

*/ 

show databases; 
-- to check the avalivable tables in database 

create database dev743 ; 
-- to create a database. 

use dev743; 
-- to enter the database 

show tables; 
-- to show the tables in database 

create table Student(sid int , name char(10)); show tables;

 use sakila; 
show tables; 
-- explain the table structure by usign (desc / describe) 
describe actor;
-- select column_name from table_name 
select * from actor ; 
-- access all colums select First_name from actor ; 
-- access only first colums 
select first_name , actor_id , actor_id * 10 from actor; 
-- select * from table where condition; c
 select * from actor where actor_id = 3 ;
 select * from actor where actor_id > 3 ; 
 select * from actor where actor_id != 3 ;
 select * from actor where first_name = 'NICK'; 
 select * from actor where first_name > 'A'; 
 select * from actor where actor_id > 3 and actor_id <7;
 select * from actor where actor_id > 3 or actor_id =5; 
 
select first_name from actor where actor_id=3;

select * from actor where actor_id > 2 or actor_id <7;
-- betweem op range of values 
select * from actor where actor_id between 2 and 7;

-- in operator --> specific value ko check krta hai 
select * from actor where actor_id = 2 or actor_id =7 or actor_id = 9;
select * from actor where actor_id in (2,9);
select * from actor where first_name in ('nick' , 'ed');
select * from actor where first_name not in ('nick' , 'ed'); -- > oposite if not in 

-- Like Operator --> Pattern Ko Search Krna...
-- Keyword --> % (Zero Or More Characters)
-- A% --> A 1,2,3,4,5,6............alter

select * from actor where first_name like 'A%';
select * from actor where first_name like 'ED%';
select * from actor where first_name like '%ED';
select * from actor where first_name like '%A';
select * from actor where first_name like '%A%';
select * from actor where first_name like '%R%R%';

-- keyword --> underscore (_) --> Only One Character. 
select * from actor where first_name like '__';
select * from actor where first_name like 'A_%';
select * from actor where first_name like '%R_';
-- Q1. get names where first char is c and second last char is a
select * from actor where first_name like 'C%A_';
-- Q2.name must contian 2 'a' in between
select * from actor where first_name like '%A%A%A%';
-- Q3 .get names where last 3rd char is d
select * from actor where first_name like '%D___';
-- Q4.names must coantin aa 
select * from actor where first_name like '%AA%';
-- Q5  get names where there are atleast 5 chars
select * from actor where first_name like '_____';

-- Functions
-- Block of code --> Redable and Reusable
-- Pre-defined Functions -- > Scaler Function 
-- Scaler Functions --> Applied for each row and result will be Give for each row
-- String character , Numbers , Dates 
-- String Related Fucntions--> 
select lower(First_name), upper(First_name) , last_name from actor ;
-- Important Functions --> concat()
-- concat() --> "Hello" + "World" --> concat("Hello"+"world") --> 2 string ko / 2 colums ko jodta hai 
select first_name , last_name , concat("Mr",'_',first_name ,'_', last_name) as Concat from actor;

-- extract me all the data first_name + last_name = 'EDCHASE' 
select first_name , last_name  from actor where concat(first_name , last_name) = 'EDCHASE';
select *  from actor where concat(first_name , last_name) LIKE '%A';
select *  from actor where concat(first_name , last_name) LIKE '%A%A%';

-- concat_ws()
select *  , concat_ws('_' ,'MR', first_name , last_name) from actor;

-- substr() --> kuch part access krna --> like python slicing
-- substr --> extract kuch position ko (extract data basis of position) 

select first_name , last_name , substr(last_name,1) from actor;
select first_name , last_name , substr(last_name,-2) from actor;  -- last ke 2 char return krega 
select first_name , last_name , substr(last_name,2,4) from actor;  --  2 --> 4 cahr from front 

select *, substr(first_name,1,1) from actor where substr(first_name , 1,1) ='A';

-- replace() --> 
use sakila;
select * from actor;
select * , concat(first_name , last_name) from actor;
select * from actor where actor_id > 3 ;

select * , substr(first_name , 1,1) from actor;


-- TRIM() --> trim(select , value) --> only for testing purpose
select trim('    aman    ');
select trim(both 'a' from 'amana');
-- trim() --> it will remove white_spaces from left and right both
select "Abhishek";
select char_length("devendra");

select char_length(trim('    abhi'));

-- char_length() --> it will be return the length of the characters 
select char_length('Devendra'); -- 8

select trim(both 'a' from 'aaamamamammaaaa');

select replace('aman' ,'a' , 'd'); -- replace 

select first_name, trim(both 'E' from first_name) from actor; -- 
-- lpad /rpad --> (left pading / right pading)
select lpad('Value' , 7 ,'@') ;

-- concat() ,substr(), trim() , lpad() , rpad() , char_length()

-- Number Function --> Round() --> values ko roundoff krna --> mtlb --> 10.99 --> 11 / 9.4 --> 9 

select round(25.66);
select round(23.68,-1);
select 25.66 , round(25.66); -- 26 -- puri value ko round off krega
select 23.68 , round(23.68) , round(23.68,-1);
-- round(23.68,-1) --> upper tens place / lower tens place.
-- truncate --> values ko extract krna --> roundoff nhi krta
select round(14.896,2) , truncate(14.685,1); -- it's not work on -

select floor(5.99999); -- lowe value me convert krta hai 
select ceil(5.99999); -- upper value me convert krke return krta hai 

-- distinct() --> duplicates ko remove krta hai sirif unique values  ko return krta hai 
-- distict function will you all unique value from the column ;
use sakila;
select distinct(first_name) from actor;
select count(distinct(first_name)) from actor;
 -- count --> rows 
 

select extract(week from now()) ;
select extract(month from now()) ;
select now(); -- 2026-02-06 09:49:21

-- extract , string_to_date() , 
use sakila;

select * ,month(payment_date) from payment where month(payment_date)='5';
select * ,year(payment_date) from payment where year(payment_date)='2006';

-- milti row Functions (Aggregate Functions --> which will be used for calculation

select distinct customer_id from payment;
select distinct(customer_id) , amount from payment;
-- combunation of amount and staff id should be unique 
-- sum() , count() , max() , min() , average(). 
select sum(amount) , count(amount) , max(amount) from payment;

select count(payment_id) , count(*) from payment;

select count(*) from payment where month(payment_date) = '5' or month(payment_date) = '6';
-- i need to find total amount and the number of tranjaction , done for the amount greather than 5 $ and after march month 

select sum(amount) , count(payment_id) from payment where amount > 5 and month(payment_date) >3 ;
-- kisi bhi agreegate functions ke sath koi or column select nhi kr skhte

use sakila;
select * from payment;

-- Group by -- Same Values Ko Ek sath Ektha Kr dega

select staff_id from payment group by staff_id;
select payment_id from payment group by payment_id;
select  customer_id from payment group by customer_id;
select customer_id , sum(amount) ,count(*) from payment group by customer_id;
select staff_id , sum(amount) ,count(*) from payment group by staff_id;
select payment_id , count(*) , sum(amount) from payment group by  payment_id ;
-- you have to find how many time each amount value is visable 
select amount , count(*)  from payment group by amount;
-- try to get total amount the maxium amount value and the total tranjaction done by each customer 
select customer_id ,sum(amount) , max(amount) ,count(*) from payment group by customer_id ;
-- you have to find out the total amount spend by each staff along with  the number of customer they have serve  only after the a pyment id 9 

select staff_id , sum(amount) ,  max(amount) , count(customer_id) from  payment where payment_id > 9  group by staff_id;
-- you have to find the toal amount spent the avg amount spend , the number of tranjaction 
select * from payment;
select month(payment_date) ,  sum(amount) , avg(amount) ,count(*) from payment  group by month(payment_date);
-- sum , avg , max amount done for first week of each month for may june and july 
select month(payment_date),sum(amount) , max(amount) , avg(amount) from payment where month(payment_date) in (5,6,7) ;
select month(payment_date) , sum(amount) ,max(amount) , avg(amount) from payment where month(payment_date) in (5,6,7) and day(payment_date) between 7 and 14 group by month(payment_date);

show databases;
use world;
show tables;
select * from country;