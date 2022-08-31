create database dress_data;
use dress_data;

create table if not exists dress(
`Dress_ID` varchar(30),	
`Style`	varchar(30),	
`Price`	varchar(30),	
`Rating`	varchar(30),	
`Size`	varchar(30),	
`Season`	varchar(30),	
`NeckLine`	varchar(30),	
`SleeveLength` varchar(30),		
`waiseline`	varchar(30),	
`Material`	varchar(30),	
`FabricType`	varchar(30),	
`Decoration`	varchar(30),	
`Pattern Type` varchar(30),		
`Recommendation` varchar(30))	

select * from dress;

# BULK LOADING DATA FROM FILE

LOAD DATA INFILE  
'D:/AttributeDataSet.csv'
into table dress
FIELDS TERMINATED by ','
ENCLOSED by '"'
lines terminated by '\n'
IGNORE 1 ROWS;

create table if not exists test(
test_id int auto_increment,
test_name varchar(30),
test_mailid varchar(30),
test_address varchar(30),
primary key (test_id));

select *from test1;

insert into test1 values (1,'sanjeev','sanjeev80@gmail.com','patna');

insert into test1 values (2,'sudhanshu','sudhanshu@gmail.com','bagalore'),  (3,'satyam','satyham0@gmail.com','bihar'),
(4,'santosh','santosh@gmail.com','mumbai');

create table if not exists test2(
test_id int auto_increment,
test_name varchar(30),
test_mailid varchar(30),
test_address varchar(30),
primary key (test_id));

insert into test2(test_name,test_mailid, test_address) values 
('sudhanshu','sudhanshu@gmail.com','bagalore'),  
('satyam','satyham0@gmail.com','bihar'),
('santosh','santosh@gmail.com','mumbai');

select * from test2;

#USING CHECK

create table if not exists test3(
test_id int ,
test_name varchar(30),
test_mailid varchar(30),
test_address varchar(30),
test_salary int check (test_salary>10000));

insert into test3 values 
(1,'sudhanshu','sudhanshu@gmail.com','bagalore',31000),  
(2,'satyam','satyham0@gmail.com','bihar',20002),
(3,'santosh','santosh@gmail.com','mumbai',12000);

create table if not exists test4(
test_id int ,
test_name varchar(30) CHECK (test_name='sanjeev'),
test_mailid varchar(30),
test_address varchar(30),
test_salary int );

insert into test4 values 
(1,'sanjeev','sudhanshu@gmail.com','bagalore',31000),  
(2,'sanjeev','satyham0@gmail.com','bihar',20002),
(3,'sanjeev','santosh@gmail.com','mumbai',12000);

select *from test4;

create table if not exists test6(
test_id int not null default 0,
test_name varchar(30) CHECK (test_name='sanjeev'),
test_mailid varchar(30),
test_address varchar(30),
test_salary int check(test_salary>1000));

insert into test6 ( test_name, test_mailid, test_address, test_salary)
values ('sanjeev','sudhanshu@gmail.com','bagalore',31000),  
('sanjeev','satyham0@gmail.com','bihar',20002),
('sanjeev','santosh@gmail.com','mumbai',12000);

select *from test6;

create table if not exists test7(
test_id int not null default 0,
test_name varchar(30),
test_mailid varchar(30) unique,
test_address varchar(30) check (test_address = 'bangalore'),
test_salary int check(test_salary>10000));

insert into test7 ( test_name, test_mailid, test_address, test_salary)
values ('sanjeev','sudhanshu@gmail.com','bagalore',31000),  
('sanjeev','satyham0@gmail.com','bangalore',20000),
('santosh','santosh@gmail.com','bangalore',12000);

create table if not exists test8(
test_id int not null default 0,
test_name varchar(30),
test_mailid varchar(30) unique,
test_address varchar(30) check (test_address = 'bangalore'),
test_salary int check(test_salary>10000));

insert into test8(test_name,test_mailid,test_address,test_salary)
values ('sanjeev','sudhanshu@gmail.com','bangalore',31000);

select *from test8;

create table if not exists test9(
test_id int not null auto_increment,
test_name varchar(30) not null default 'unknown',
test_mailid varchar(30) unique not null,
test_address varchar(30) check (test_address = 'bangalore'),
test_salary int check (test_salary>10000) not null,
primary key (test_id));

insert into test9(test_id,test_name,test_mailid,test_address,test_salary)
values (100, 'sanjeev','sudhanshu@gmail.com','bangalore',31000);

select *from test9;



