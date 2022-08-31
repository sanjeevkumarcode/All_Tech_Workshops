show databases;

create database sales1;

use sales1;

CREATE TABLE sales1(
order_id varchar(15) not null,
order_date varchar(15) not null,
ship_date varchar(15) not null,
ship_mode varchar(14) not null,
customer_name varchar(22) not null,
segment varchar(11) not null,
state varchar(36) not null,
country varchar(32) not null,
market VARCHAR(6) NOT NULL, 
region VARCHAR(14) NOT NULL, 
product_id VARCHAR(16) NOT NULL, 
category VARCHAR(15) NOT NULL, 
sub_category VARCHAR(11) NOT NULL, 
product_name VARCHAR(127) NOT NULL, 
sales DECIMAL(38, 0) NOT NULL, 
quantity DECIMAL(38, 0) NOT NULL, 
discount DECIMAL(38, 3) NOT NULL, 
profit DECIMAL(38, 8) NOT NULL, 
shipping_cost DECIMAL(38, 2) NOT NULL, 
order_priority VARCHAR(8) NOT NULL, 
`year` DECIMAL(38, 0) NOT NULL
);

select * from sales1;

set session sql_mode=' ';

load data infile
'D:\sales_data_final.csv'
into table sales1
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

select count(order_id) from sales1;

select str_to_date(order_date, '%m/%d/%y') from sales1;

alter table sales1
add column order_date_new date after order_date;

update sales1
set order_date_new = str_to_date(order_date,'%m/%d/%y');

set sql_safe_updates=0;

alter table sales1
add column ship_date_new date after ship_date;

update sales1
set ship_date_new = str_to_date(ship_date, '%m/%d/%y');

select * from sales1;

select * from sales1 where ship_date_new = '2020-01-05';

select * from sales1 where ship_date_new < '2020-01-05';

select now();

select curdate();

select curtime();

select date_sub(now(), interval 30 day);

select year(now());

select dayname('2022-08-28');

select month(order_date_new) from sales1;

select year, avg(sales) from sales1 group by year;

select *from sales1;

select * from sales1 limit 5;

select (SALES*discount+shipping_cost) as CTC from sales1;

SELECT discount, IF(DISCOUNT > 0 , 'no', 'yes' ) as dicount_flag from sales1;
