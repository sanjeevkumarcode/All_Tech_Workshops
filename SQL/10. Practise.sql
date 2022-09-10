###############################################################

-- Project : Using SQL String Functions to Clean Data.

###############################################################
-- Task One: Introduction
-- In this task, we will create new tables; the customers
-- and sales tables in the database
###############################################################

create database  if not exists sales_db;
use sales_db;

-- 1.1: Create the customers table

CREATE TABLE customers
(
    Customer_ID CHAR(8) PRIMARY KEY,
	Bracket_cust_id CHAR(10),
    Customer_Name VARCHAR(255),
    Segment VARCHAR(255),
    Age INT,
	Country VARCHAR(255),
	City VARCHAR(255),
	State VARCHAR(255),
    Postal_Code INT,
	Region VARCHAR(255)
);

-- Loading the data into customer table

load data infile
'D:\Sales.csv'
into table customers
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

-- 1.2: Create the sales table

CREATE TABLE sales
(
Order_line varchar(255),
Order_ID varchar(255),
Order_Date varchar(255),
Ship_Date varchar(255),
Ship_Mode varchar(255),
Customer_ID varchar(255),
Product_ID varchar(255),
Sales varchar(255),
Quantity varchar(255),
Discount varchar(255),
Profit varchar(255)
);

-- Loading the data into sales table.

load data infile
'D:\sales.csv'
into table sales
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

-- 1.3: Retrieve data from the customers and sales tables.
select * from sales;
select * from customers;


#############################
-- Task Two: LENGTH, LEFT, RIGHT
-- In this task, we will use the LENGTH function to return the 
-- length of a specified string, expressed as the number of characters.
-- In addition, we will use the LEFT/RIGHT functions to pull a certain number of characters 
-- from the left or right side of a string and present them as a separate string
#############################


-- 2.1: Retrieve the length of the customer_id column.
SELECT Customer_ID, length(Customer_ID) from customers;

-- 2.2: Retrieve a list of the customer group of all customers.
select distinct left(customer_id,2) as Customer_grp, customer_id 
from customers;

-- 2.3: Retrieve a list of the customer number of all customers.
select distinct right(customer_id,5) as Customer_grp,customer_id 
from customers;

-- 2.4: Retrieve the length of the customer_id column.
SELECT customer_id, LENGTH(customer_id)
FROM customers;

-- 2.5: Retrieve a list of the customer group of all customers.
select distinct left(customer_id,2) as Customer_grp,customer_id 
from customers;


#############################
-- Task Three: UPPER & LOWER 
-- In this task, we will use the UPPER and LOWER functions to convert all 
-- characters in the specified string to uppercase or lowercase.
#############################


-- 3.1: Change Data-Cleaning-Project to uppercase letters.
select upper('Data-Cleaning-Project');

-- 3.2: Change Data-Cleaning-Project to lowercase letters.
select lower("Data-Cleaning-Project");

-- 3.3: Retrieve the details of the first employee.
select * from customers;
select *, Customer_ID as Ham_HAi_Na from customers  where Customer_ID = 'AA-10315';

-- Start a transaction.
Begin;

-- 3.4: Change the first name of the first employee to uppercase letters.
update customers 
set Customer_Name = upper(Customer_Name)
where Customer_ID = 'AA-10315';

-- Rollback to the previous step.
ROLLBACK;

select * from customers;


##########################################################
-- Task Four: REPLACE
-- In this task, we will learn how to use the 
-- REPLACE function to replace all occurrences of a specified string
##########################################################


-- 4.3: Retrieve data from the customers table.
SELECT * FROM customers;

-- 4.4: Change United States to US in the country column of the customers table.
select distinct country,replace(country,'United States','US') as Abr_Country
from customers;

select replace(country, 'United States', 'US'), country from customers;
select * from customers;


#############################
-- Task Five: TRIM, RTRIM, LTRIM
-- In this task, we will use the TRIM functions to remove
-- all specified characters either parts of a string
#############################


-- 5.1: Trim the word Data-Cleaning-Project.
select trim(leading ' ' from ' Data-Cleaning-Project ');

-- 5.2: Trim the word Data-Cleaning-Project.
select trim(trailing ' ' from ' Data-Cleaning-Project ');

-- 5.3: Trim the word Data-Cleaning-Project.
select trim(both ' ' from ' Data-Cleaning-Project ');

-- 5.4: Trim the word Data-Cleaning-Project.
select trim(' Data-Cleaning-Project ');

-- 5.5: Right trim the word Data-Cleaning-Project.
select rtrim(' Data-Cleaning-Project ');


-- 5.6: Left trim the word Data-Cleaning-Project.
select ltrim(' Data-Cleaning-Project ');

-- 5.7: Retrieve data from the customers table.
SELECT * FROM customers;


#############################
-- Task Six: Concatenation
-- In this task, we will learn how to join or
-- concatenate two or more strings together
#############################


-- 6.1: Create a new column called Full_Name from the city and state of customers.
select first_name||' '||last_name as Full_Name from employees;
select city||''||state as Full_Name from customers;

-- 6.2: Create a new column called Address from the city, state, and country of customers.
select city||', '||state||', '||country as Address from customers;

-- 6.3: Create a column called desc_age from the customers name and age.
select segment||' is '||age||' old' as desc_age from customers;


#############################
-- Task Seven: SUBSTRING
-- In this task, we will learn how to
-- extract a substring from a string
#############################


-- 7.1: Retrieve data from the customers table.
SELECT * FROM customers;

-- 7.2: Retrieve the IDs, names, and groups of customers.
-- Hint: Use the customer_id column.
select customer_id,customer_name,substring(customer_id,1,2) as Customer_group,
substring(customer_id for 2) as Customer_group from customers;

-- 7.3: Retrieve the IDs, names of customers in the customer group 'AB'.
select customer_id,customer_name,substring(customer_id,1,2) as Customer_group,
substring(customer_id for 2) as Customer_group from customers
where substring(customer_id,1,2) = 'AB'

-- 7.4: Retrieve the IDs, names, and customer number of customers in the customer group 'AB'.
select customer_id,customer_name,substring(customer_id,4,5) as Customer_ID
 from customers
where substring(customer_id,1,2) = 'AB'

-- 7.5: Retrieve the year of birth for all employees.
select birth_date,substring(cast(birth_date as char(10)),1,4) from employees


#############################
-- Task Eight: String Aggregation
-- In this task, we will learn how to use string aggregation 
-- to join strings together, separated by delimiter
#############################


-- 8.1: Retrieve data from the dept_emp table.
SELECT * FROM dept_emp;

-- 8.2: Retrieve a list of all department numbers for different employees.
select emp_no,STRING_AGG(dept_no,';')
from dept_emp
group by emp_no;

-- 8.3: Retrieve data from the sales table.
SELECT * FROM sales;

-- 8.4: Retrieve a list of all products that were ordered by a customer from the sales table.
SELECT customer_id,string_agg(product_id,';') FROM sales
group by customer_id;


#############################
-- Task Nine: COALESCE
-- In this task, we will learn how to use COALESCE
-- to fill null values with actual values
#############################


-- 9.1: Retrieve data from the departments_dup table.
SELECT coalesce(dept_no,dept_name) as CoalesceDeptNo,dept_no,dept_name,
coalesce(dept_name,dept_no) as CoalesceDeprtName
FROM departments_dup;

-- 9.2: Replace all missing department number with its department name.


-- 9.3: Change every missing department number to 'No Department Number' and
-- every missing department name to 'No Department Name' respectively.
SELECT dept_no, dept_name,
COALESCE(dept_no, 'No Department Number') AS New_dept_no,
COALESCE(dept_name, 'No Department Name') AS new_dept_name
FROM departments_dup
ORDER BY dept_no;

-- 9.4: Replace a missing country with the city, state or No Address.
select distinct coalesce(country,city,state,'No Address'),
country,city,state
from customers
order by 2;

SELECT * FROM customers;