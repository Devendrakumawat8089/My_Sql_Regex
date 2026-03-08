show databases;
use sakila;
show tables;

select * from actor;
select first_name from actor;
select * from actor where first_name like '%A';
select distinct first_name from actor;
select * from actor where first_name in('NICK','ED');
select first_name , replace(first_name , 'A' , '@@') from actor;
select * ,trim(both 'K' from first_name) from actor;
select * from payment;
select sum(amount) as total_amount , count(payment_id) as payment , count(customer_id) as customer , count(staff_id) as staff , count(rental_id) as rental from payment;
select amount , sum(amount) , count(amount) from payment group by amount order by amount asc;

select current_date(); -- Returns Current Date
select current_time(); -- Returns Current Time
select current_timestamp(); -- Returns Current Date & time
use sakila;
select year(payment_date) from payment;
select month(payment_date) from payment;
select day(payment_date) from payment;

select extract(week from now()); -- current Week
select datediff(now() , payment_date) from payment;
select datediff('2023-06-05' , '2023-06-01'); -- 4
