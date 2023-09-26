Use employees;

select * from employees;

select * from employees where Department='Manufacturing';

select * from employees where Department='Manufacturing' and Status='Full Time';

select * from employees where Department='Manufacturing' and Status='Full Time';

select * from employees where Department='Manufacturing' and Status='Full Time' and Salary>20000;

select EmployeeID,First,Last,Department,Status,Salary from employees where Department='Manufacturing' and Status='Full Time' and Salary>30000;

select * from employees;

select * from employees where Department='Account Management' or JobRating=5;

select * from employees where Department in ('IT','Sales','Marketing');

select * from employees where Department != 'Manufacturing';

select count(*) from employees;

select count(*) from employees where Department='Manufacturing';

select max(Salary) from employees;

select min(Salary) from employees;

select max(salary), min(salary) from employees;

select avg(Salary) from employees;

select sum(Salary) from employees;

select * from employees where Status Not in ('Full Time', 'Half-Time');

select distinct(Status)  from employees;

select distinct(Department) from employees;

select count(distinct(Department)) from employees;

select distinct(First) from employees;

select count(First) from employees;

select * from learnings;

-- ALTER Statement 

insert into customer values(1001,'Tulasi',21,'F','Bangalore',current_date());

insert into customer values(1002,'Rajesh',23,'M','Vijayanagaram','1999-08-10'),
(1003,'Subhan',24,'M','Nandyala','1998-04-24'),
(1004,'Arif',24,'M','Machilipatnam','1999-04-27'),
(1005,'Nagesh',25,'M','Bandar','2000-05-17'),
(1006,'Sharu',21,'F','Vizag','2000-10-12'),
(1007,'Chandu',22,'F','Tanuku','2001-06-23'),
(1008,'Pavithra',21,'F','Chithoor','2000-03-25'),
(1009,'Sandhya',22,'F','Chennai','1999-11-30');

select * from customer;

alter table customer add column country varchar(20);

select * from customer;

update customer set country='India';

select * from customer;

alter table customer drop date_of_birth;

select * from customer;

desc customer;

alter table customer modify column custname varchar(50);

desc customer;

alter table customer rename column city to Location;

select * from customer; 

