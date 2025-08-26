create table emp(
emp_id int,
emp_name varchar(20),
department_id int,
salary int,
manager_id int,
emp_age int);

select * from emp;
insert into emp
values
(1, 'Ankit', 100,10000, 4, 39),
(2, 'Mohit', 100, 15000, 5, 48),
(3, 'Vikas', 100, 10000,4,37),
(4, 'Rohit', 100, 5000, 2, 16),
(5, 'Mudit', 200, 12000, 6,55),
(6, 'Agam', 200, 12000,2, 14),
(7, 'Sanjay', 200, 9000, 2,13),
(8, 'Ashish', 200,5000,2,12),
(9, 'Mukesh',300,6000,6,51),
(10, 'Rakesh',300,7000,6,50);
select * from emp;
#find duplicates in a table 
select department_id,count(*), MAX(emp_id) from emp group by department_id having count(*) >= 1; 
insert into emp values 
(1, 'Ankit', 100,10000, 4, 39),
(10, 'Rakesh',300,7000,6,50);
select * from emp;
select emp_id,count(*) from emp group by emp_id having count(*) > 1; 
#delete duplicates 
-- with cte as (select *, ROW_NUMBER() over(PARTITION BY emp_id ORDER BY emp_id) as rn from emp) delete from cte where rn > 1;
DELETE FROM emp
WHERE emp_id IN (
  SELECT emp_id FROM (
    SELECT emp_id, ROW_NUMBER() OVER (PARTITION BY emp_id ORDER BY emp_id) AS rn
    FROM emp
  ) AS temp
  WHERE rn > 1
);
ROLLBACK;
select * from emp;
insert into emp values 
(1, 'Ankit', 100,10000, 4, 39),
(10, 'Rakesh',300,7000,6,50);
select * from emp;
create table emp1 (emp_id int,emp_name varchar(20),
department_id int, 
salary int ,
manager_id int);

insert into emp1 values (1,'Ankit',100,10000 ,4),
(2,'Mohit',100,15000,5),
(3,'Vikas',100,10000 ,4),
(4,'Rohit',100,5000 ,2),
(5,'Mudit',200,12000 ,6),
(6,'Agam',200,12000 ,2),
(7,'Sanjay',200,9000,2),
(8,'Ashish',200,5000 ,2);
select * from emp1;
select emp_name,manager_id from emp
UNION ALL
select emp_name,manager_id from emp1;

create table emp_target(
emp_id int,
emp_name varchar(20),
department_id int,
salary int,
manager_id int,
emp_age int);

insert into emp
values
(1, 'Ankit', 100,10000, 4, 39),
(2, 'Mohit', 100, 15000, 5, 48),
(3, 'Vikas', 100, 10000,4,37),
(4, 'Rohit', 100, 5000, 2, 16),
(5, 'Mudit', 200, 12000, 6,55),
(6, 'Agam', 200, 12000,2, 14),
(7, 'Sanjay', 200, 9000, 2,13),
(8, 'Ashish', 200,5000,2,12),
(9, 'Mukesh',300,6000,6,51),
(10, 'Rakesh',300,7000,6,50);

select * from emp
INTERSECT 
select * from emp_target;
select count(*) from emp
INTERSECT
select count(*) from emp_target;
select * from emp;
use pizzahouse;
show tables;





