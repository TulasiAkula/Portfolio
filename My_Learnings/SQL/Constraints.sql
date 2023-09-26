Use Learnings;

-- UNIQUE Constraint

create table unique_table (
custid int unique,
custname varchar(20),
age int,
city varchar(50))

insert into unique_table values (1000,'Sai',30,'Delhi');
select * from unique_table;

insert into unique_table values (1000,'Vivek',30,'Hyderabad');    -- Error since there is a duplicate value for custid
insert into unique_table values (1001,'Vivek',30,'Hyderabad');
select * from unique_table;
insert into unique_table (custname,age,city) values('Raj',40,'Chennai');
insert into unique_table (custname,age,city) values('Arjun',27,'Bangalore');
select * from unique_table;

-- CHECK Constraint

create table check_table (
custid int,
custname varchar(20),
age int check (age>15 and age<70),
city varchar(50));

insert into check_table values (001,'Bantu',35,'Hyderabad');
select * from check_table;
insert into check_table values (002,'Arha',12,'Chennai'); -- Error because age value is <15
insert into check_table values (003,'Guna',50,'Bangalore');
insert into check_table values (001,'Bantu',75,'Hyderabad');  -- Error because age value is >70

select * from check_table;

delete from check_table where custname='Bantu';

select * from check_table;

-- DEFAULT Constraint 

create table default_table(
custid int,
custname varchar(50),
age int,
city varchar(20) default 'Hyderabad');

insert into default_table values(1000,'Mani',45,'Hyderabad');

select * from default_table;

insert into default_table (custid,custname,age) values(1001,'Vijju',33); -- City is not provided so by default Hyderabad is filled instead of NULL Value.

select * from default_table;

Use Learnings;

-- NOT NULL Constraint

create table nn_table(
custid int NOT NULL,
custname varchar(20),
city varchar(100),
age int);

insert into nn_table values(1000,'Hardik','Mumbai',35);
 select * from nn_table;
insert into nn_table (custname,age,city) values ('Bholu',25,'Jaipur');   -- Error since there is no value for custid
insert into nn_table (custid) values (1001);
select * from nn_table;

create table nn_unique_table(
custid int not null unique,
custname varchar(20),
age int,
city varchar(50));

insert into nn_unique_table values (1000,'Karthick',50,'Delhi');
select * from nn_unique_table;
insert into nn_unique_table (custname,age,city) values ('Priya',30,'Chennai'); -- Error since custid is not having a value
insert into nn_unique_table values (1000,'Priya',30,'Chennai'); -- Error since custid 1000 already exists duplicate entries not allowed
insert into nn_unique_table values (1001,'Sahithi',40,'Hyderabad');
select * from nn_unique_table;

-- PRIMARY KEY Constraint

create table pk_table(
empid int primary key,
empname varchar(20),
gender char(1),
age int,
city varchar(50));

insert into pk_table values(1000,'Harish','F',25,'Mumbai');
select * from pk_table;
insert into pk_table values(1000,'Vijay','M',30,'Delhi'); -- Error since empid 1000 is already exists
insert into pk_table(empid,empname,age) values(1001,'Vijay',30);
select * from pk_table;
insert into pk_table(empname,age,city,gender) values('Arun',30,'Jharkhand','M');   -- Error since empid is not specified
insert into pk_table(empid,empname,age,city,gender) values(1002,'Arun',30,'Jharkhand','M');
select * from pk_table;

create table customer_table(
cust_id int primary key,
custname varchar(50),
gender char(1),
age int,
city varchar(20));

select * from customer_table;

create table order_table(
order_id int primary key,
cust_id int,
product_name varchar(100),
amount decimal(20,2),
foreign key (cust_id) references customer_table(cust_id));

insert into customer_table values (1000,'Nani','M',30,'Hyderabad'),(1001,'Muni','M',45,'Chennai'),(1002,'Malini','F',33,'Tenali');
select * from customer_table;

insert into order_table values (1,1000,'Mobile',25000.20);
select * from order_table;
insert into order_table values (2,1003,'Desktop',55000); -- Error since 1003 is not present in the parent table
insert into order_table values (2,1002,'Desktop',55000); 
select * from order_table;
insert into order_table values (3,1001,'Laptop',60000.50); 
select * from order_table;



create table employee_table(
Emp_id int primary key,
Empname varchar(50),
Gender char(1),
Experience int,
Age int check (age>21 and age<=60),
Salary int,
City varchar(50),
Designation varchar(30));

insert into employee_table values (100,'Dharani','F',2,25,40000,'Chennai','Developer'),
(101,'Ishan','M',3,30,50000,'Hyderabad','Lead'),
(102,'Murali','M',4,40,40000,'Chennai','Manager'),
(103,'Priya','F',5,35,70000,'Pune','Architect'),
(104,'Srujana','F',5,35,65000,'Pune','Delivery Manager'),
(105,'Karthik','M',6,30,60000,'Bangalore','Manager'),
(106,'Bala','M',8,50,90000,'Pune','Director'),
(107,'Megha','F',7,38,80000,'Bangalore','Lead'),
(108,'Krishna','M',10,40,100000,'Pune','Director'),
(109,'Raji','F',1,25,25000,'Hyderabad','Architect');

select * from employee_table;

alter table employee_table add column Country varchar(10) default 'India';
select * from employee_table;
select sum(Salary) from employee_table;
select max(Salary) from employee_table;
select min(Salary) from employee_table;
select count(*) from employee_table where city='Hyderabad';
select * from employee_table where Salary>50000;
update employee_table set Salary=100000 where city='Chennai';
select * from employee_table;
delete from employee_table where city='Pune';
select * from employee_table;














