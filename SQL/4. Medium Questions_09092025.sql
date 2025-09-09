SELECT * FROM Worker;
 
--1. duplicate values

select salary, count(*) as duplicate from worker
group by salary
having count(*)>1;

--2. odd rows

select WORKER_ID, salary from worker where WORKER_ID % 2 = 0 ;

--3. clone a table

select * into worker_clone from worker;
select * from worker_clone;

--4. intersecting two tables

select * from worker_clone intersect select * from Worker;

--5. top 3 rows in desc

SELECT TOP 3 * FROM Worker order by WORKER_ID desc;

--6. 2nd highest salary

select max(salary) from worker where salary not in ( select max(salary) from worker);

--7. department wise salary

select DEPARTMENT, sum(salary) as total_salary from worker
group by DEPARTMENT;

--8. table structure

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'worker' ;

select * from worker;

--9. datetime practise

SELECT DATENAME(YEAR, GETDATE())        AS 'Year';        
SELECT DATENAME(QUARTER, GETDATE())     AS 'Quarter';     
SELECT DATENAME(MONTH, GETDATE())       AS 'Month Name';       
SELECT DATENAME(DAYOFYEAR, GETDATE())   AS 'DayOfYear';   
SELECT DATENAME(DAY, GETDATE())         AS 'Day';         
SELECT DATENAME(WEEK, GETDATE())        AS 'Week';        
SELECT DATENAME(WEEKDAY, GETDATE())     AS 'Day of the Week';     
SELECT DATENAME(HOUR, GETDATE())        AS 'Hour';        

--10. highest salary first_name wise

select FIRST_NAME, max(salary) max_salary from worker
group by FIRST_NAME
having max(salary) > 11000;

--11. top 3 max salary & minimal > 11000

select top 3 FIRST_NAME, max(salary) max_salary from worker
group by FIRST_NAME
having max(salary) > 11000
order by max_salary desc;

--12. top 2 min salary

select top 2 first_name, min(salary) as min_salary from worker
group by first_name
order by min_salary asc;

-- 13. Divide salary in min, medium and high using case

select FIRST_NAME,
case
when salary < 110000 then 'Low'
when salary < 180000 then 'medium'
else 'high'
END AS salary_range
FROM worker;

--14. index practical 

select * from worker where salary > 120000;

create index index_name on worker(salary);
drop index index_name on worker;

select * from worker where salary > 120000;

--15. describe table

select * From INFORMATION_SCHEMA.COLUMNS Where TABLE_NAME = 'worker';

--16. union & union all

select * from Worker
union 
select * from worker_clone2;

select * from Worker
union all
select * from worker_clone2;

--17. joins

select * from Worker as a left join worker_clone2 as b
on a.salary= b.salary;

select * from Worker as a right join worker_clone2 as b
on a.salary= b.salary;

select * from Worker as a inner join worker_clone2 as b
on a.salary= b.salary;

select * from Worker as a full join worker_clone2 as b
on a.salary= b.salary;










































