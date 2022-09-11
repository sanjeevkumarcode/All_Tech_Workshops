show databases;

use sales_db;

show tables;

select *from customers order by Age desc;

# LIMIT

select Customer_Name, Age  from customers order by Age desc limit 1;

select Customer_Name, Age  from customers order by Age desc limit 1,1;

select Customer_Name, Age  from customers order by Age desc limit 2;

select Customer_Name, Age  from customers order by Age desc limit 1,2;

select * from customers order by Age desc limit 2,2;

select * from customers order by Age desc limit 2 , 1;

select * from customers  order by Age desc limit 3, 1;

select * from customers order by Age desc limit 4 , 1;

select * from customers  order by Age desc limit 5 , 1;

select * from customers order by Age desc limit 6 , 1;

select * from customers order by Age desc limit 3, 3;

select * from customers  order by Age desc limit 3;

select * from customers order by Age desc limit 2, 3;

select * from customers;

#CASE

select  Age, Country,
CASE 
WHEN Age >= 30 THEN
"You are ready for marriage"
WHEN Age = 30 THEN
"You are also ready for marriage"
ELSE
"You have to wait for marriage"
END AS Jai_Shree_Ram
from customers;

# Index

create index sanjeev_index
on  customers(age);

# View

create view sanjeev_view as
select * from customers;

# Procedure

DELIMITER &&
CREATE PROCEDURE SANJEEV_PROCEDURE1()
BEGIN 
SELECT AGE FROM customers;
END &&

CALL SANJEEV_PROCEDURE1;

set session sql_mode=' ';

update customers set Customer_Name = case 
when Customer_Name = 'ALEX AVILA' then 'reinforcement learing'
end ;
