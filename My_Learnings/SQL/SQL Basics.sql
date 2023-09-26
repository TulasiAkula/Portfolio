# select command is used to retrieve the data from the table

# select
# from 
# where
# group by
# having
# order by
# limit

select * 
from movies.actor;

select * from movies.country;

select 
ActorID
,FirstName
,DoB
,Gender
from movies.actor;
select CountryID,Country from movies.country;

select FilmID,Title,CertificateID from film where CertificateID = '1';

select FilmID,Title,CertificateID from film where CertificateID = '1' and CertificateID = '2';

select FilmID,Title,CertificateID,RunTimeMinutes from film where RunTimeMinutes <= 270 and RunTimeMinutes > 200;

select FilmID,Title,CertificateID,RunTimeMinutes from film where RunTimeMinutes between 200 and 270;

select FilmID,Title,CertificateID from film where CertificateID = '1' or CertificateID = '2';

select FilmID,Title,CertificateID from film where CertificateID in (1,2);

select FilmID,Title,CertificateID from film where BoxOfficeDollars > 1e9;

select FilmID,Title,CertificateID from film where BoxOfficeDollars < 1e9 and BoxOfficeDollars > 0;

select * from employees;

select * from employees.employees where status != 'Full Time';

select * from employees.employees where status <> 'Full Time';

select * from employees.employees where Status not in ('Full Time','Contract');

# Display the list of full time employees with salary more than 80000

select EmployeeID,First,Last,Salary from employees.employees where salary > 80000;

# Display the list of IPL players with DOB after 1999-1-1 and countryname = 1

select * from ipl.player where DOB > '1990-1-1' and Country_Name = '1';

# Display the list of all full time employees but only those contract employees with job rating 1

select EmployeeID,First,Last,Status,JobRating from employees.employees where Status = 'Full Time' or (Status = 'Contract' and JobRating = '1');

# Display the list of all employees with status other than full time or contract (Don't use IN)

select First,Last,Status from employees.employees where Status != "Full Time" and Status != "Contract";

# Like operator is used to match a pattern,contains filter

# % is used for Zero or no. of characters
# _ is used for single character.

select * 
from movies.film
where Title like "%star%";

select * 
from movies.film
where Title like 'star%';

select * 
from movies.film
where Title like "%star%" or Title like "%king&" or Title like "%Die%";

select * 
from movies.film
where Title like "%stars";

select * 
from movies.film
where Title like '__a%';

select * 
from movies.film
where Title like "_2%";

# Display the list of those venues not containing the word Stadium 

select * 
from ipl.venue
where Venue_Name not like '%stadium&';

# Display the list of player names containing the word Singh and Countryname = 1

select *
from ipl.player
where Player_Name like '%singh%' and Country_Name like '%1%';

# Display the list of films starting with D or H but ending with es

select *
from movies.film 
where Title like 'D%es' or Title like 'H%es';


# Display the list of films not containing the word star, lion or man

select *
from movies.film
where Title not like 'star' and Title not like 'lion' and Title not like 'man';


# Display the list of filme which are the second part od the films

# regexp (contains filter, used to match pattern)

# ^ starts with
# $ ends with 
# [] range of value
# | (or)

select *
from movies.film
where Title regexp 'star';

select *
from movies.film
where Title regexp '^star';

select *
from movies.film
where Title regexp 'stars$';

select *
from movies.film
where Title regexp 'Star|King|Dark';

select *
from movies.film
where Title not regexp 'Star';

select * 
from movies.film
where Title regexp '^Star|King$|Dark';

select *
from movies.film
where Title like 'Star%' or title like '%King' or title like '%Dark%';

select * 
from movies.film
where Title regexp '[XYZ]';

select * 
from movies.film
where Title regexp 'X|Y|Z';

select *
from movies.film
where Title regexp '[XYZ]$';

select *
from movies.film
where Title regexp '[V-Z]';

select *
from movies.film
where Title regexp '[0-9]';

select *
from movies.film
where Title not regexp '[0-9]';

select *
from movies.film
where Title not regexp '[A-Z]';

select * 
from ipl.player 
where Player_Name regexp '^D|^E|^F|^G|E$';

select *
from movies.film
where OscarWins > 0 and Title regexp '^A'; 

select *
from movies.film
where Title regexp 'Die$|[0-9]|^Star';

select 
Title
,BoxOfficeDollars
,Review
from movies.film
where BoxOfficeDollars is null;

select *
from movies.film
where Review is null or Review = 'Not seen it';

select
Title as Moviename
,BudgetDollars
,BoxOfficeDollars
,BoxOfficeDollars - BudgetDollars as Profitloss
from movies.film;

select
first
,last
,concat(First,' ',Last) as FullName
,Department
,Status
,Salary
from employees.employees;

select 
Title
,RunTimeMinutes
,RunTimeMinutes/60 as Hours
,round(RunTimeMinutes/60,1) as RHours
,floor(RunTimeMinutes/60) as FHours
,mod(RunTimeMinutes,60) as Minutes
from movies.film;

select 
Title
,RunTimeMinutes
,concat(Floor(RunTimeMinutes/60),'Hours',Mod(RunTimeMinutes,60),'Minutes') as Duration
from movies.film;

select 
Title
,RunTimeMinutes
from movies.film;

select
Title
,RunTimeMinutes
,RunTimeMinutes/60 as RHours
from movies.film;
 
 select
 Title
 ,RunTimeMinutes
 ,RunTimeMinutes/60 as RHours
 ,round(RunTimeMinutes/60,1) as RHours2
 from movies.film;
 
 select
 Title
 ,RunTimeMinutes
 ,RunTimeMinutes/60 as RHours
 ,round(RunTimeMinutes/60,1) as RHours2
 ,floor(RunTimeMinutes/60) as FHours
 ,mod(RunTimeMinutes,60) as Minutes
 from movies.film;
 
 select
 concat(First,' ',Last) as FullName
 ,status
 ,if(Status = 'Full Time','Permanent','Temporary') as EmpType
 from employees.employees;
 
  select
 concat(First,' ',Last) as FullName
 ,status
 ,if(Status = 'Full Time','Permanent','Temporary') as EmpType
 ,salary
 ,salary * 0.1 + salary as NewSalary
 from employees.employees;
 
 select
 concat(First,' ',Last) as FullName
 ,status
 ,JobRating
 ,salary
 ,if(status in ('Full Time' , 'contract') and Jobrating = 1, salary*1.1,Salary) as NewSalary
 from employees.employees;
 
 select
 concat(First,' ',Last) as FullName
 ,status
 ,jobrating
 ,salary
 ,if(Status = 'Full Time',salary*1.1,if(Status = 'Contract',salary*1.05,Salary)) as NewSalary
 from employees.employees;
 
 select
 Title
 ,OscarWins
 ,if(OscarWins = 0,'Average Film',if(OscarWins < 5,'Great Film','Classic Film')) as Oscar_Category
 from movies.film;
 select
 Title
 ,RunTimeMinutes
 ,if(RunTimeMinutes < 100,'Short Film',if(RunTimeMinutes < 160, 'Average Length Film','Long Length Film')) as Lengthtype
 from movies.film;
 
 select
 Title
 ,BoxOfficeDollars
 ,OscarWins
 ,if(BoxOfficeDollars > 1e9 and OscarWins > 0, 'Classic Blockbuster',if(BoxOfficeDollars > 1e9 and OscarWins = 0,'Blockbuster','Others')) as MovieType
 from movies.film;
 
 select
 concat(First,' ',Last) as FullName
 ,salary
 ,JobRating
 ,if(JobRating >= 4 , Salary*1.1,if(JobRating >=2,Salary*1.05,Salary)) as NewSalary
 from employees.employees;
 
 select
 Player_Id
 ,Player_Name
 ,DOB
 ,if(DOB > '1990-01-01','Young Player',if(DOB > '1980-1-1','Middle Aged Player','Old Player')) as PlayerType
 from ipl.player;
 
 select
 Title
 ,if(Title not regexp '[0-9]','Text Title',if(Title regexp '[0-9]' and '[A-Z]','AlphaNumeric Title','NumericTitle')) as TitleTyple
 from movies.film;
 
 # Case When
 
# case
# When Condition1 is true then Result1
# When Condition2 is true then Result2
# When Condition3 is true then Result3
# else result4
# End

select
concat(First,' ',Last) as FullName
,status 
,case
when Status = 'Full Time' then 'Permanent'
when Status = 'Contract' then 'Temporary'
else 'Terminated'
end as EmpType
from employees.employees ;

select
Title
,OscarWins
,case
when OscarWins = 0 then 'Average Film'
when OscarWins < 5 then 'Great Film'
else 'Classic Film'
end as FilmType
from movies.film;

select
concat(FirstName,' ',FamilyName) as FulName
,Dob
,Gender
,concat(case
when DOB < '1970-1-1' then 'Old '
when DOB < '1990-1-1' then 'Middle Aged '
else 'Young'
end, Gender,' Actor') as Actorage 
from movies.actor;

select
Title
,RunTimeMinutes
,case
when RunTimeMinutes < 100 then 'Short Film'
when RunTimeMinutes < 160 then 'Average Length Film'
else 'Long Film'
end as LengthType
from movies.film;

select
Title
,BoxOfficeDollars
,OscarWins
,case
when BoxOfficeDollars > 1e9 and OscarWins > 0 then 'Classic Blockbuster'
when BoxOfficeDollars > 1e9 and OscarWins = 0 then 'Blockbuster'
else 'Others'
end as FilmType
from movies.film;

select
concat(First,' ',Last) as FullName
,salary
,JobRating
,case
when JobRating >=4 then Salary*1.1
when JobRating >=2 then Salary*1.05
else Salary
end as NewSalary 
from employees.employees;

select 
Player_Name
,DOB
,case
when DOB > '1990-1-1' then 'Young Player'
when DOB > '1980-1-1' then 'Middle Aged Player'
else 'Old Player'
end as PlayerType
from ipl.player;

select
Title
,case
when Title not regexp '[0-9]' then 'Text Title' 
when Title regexp '[A-Z]' then 'Alpha Numeric Title'
else 'Numeric Title'
end as TitleType
from movies.film;

# Order by 
# order by clause is used to sort the data

select
concat(First,' ',Last) as FullName
,Status
,Salary
from employees.employees
Order by Salary 
Limit 10;

select 
Title
,BoxOfficeDollars
from movies.film
order by BoxOfficeDollars desc
Limit 15 ;

select 
concat(First,' ',Last) as FulName
,Status
,Salary
from employees.employees
order by Status, Salary desc;

select
concat(First,' ',Last) as FullName
,Status
,Salary
from employees.employees
Order by case
when Status = 'Full Time' then 1
when Status = 'Contract' then 2
when Status = 'Half-Time' then 3
else 4
end, Salary desc;

select 
concat(FirstName,' ',FamilyName) as FulName
,Gender
,DOB
from movies.actor
where Gender = 'Female' 
Order by DOB desc
Limit 5 ;

select
concat(First,' ',Last) as FullName
,Status
,Salary
from employees.employees
where Status = 'Full Time'
order by Salary desc 
Limit 5 ;

select
Title
from movies.film
order by case
when Title not regexp '[0-9]' then 1
when Title regexp '[A-Z]' then 2
else 3
end, Title;


# Aggregate functions - avg, max, min, sum, count

Select
Count(*) as Num_Of_Employees
from employees.employees;

select
Count(*) as Num_Of_Employees
from employees.employees
where Status = 'Full Time';

select
Count(*) as Num_Of_Employees
,Avg(Salary) as AvgSalary
,Max(Salary) as MaxSalary
from employees.employees;

select
Count(*) as Num_Of_Films
,Count(BoxOfficeDollars) as CountBO
,Count(OscarWins) as CountOS
from movies.film;

select 
Count(*) as CountNulls
from movies.film
where BoxOfficeDollars is null ;

select
Department 
,Count(*) as Num_Of_Employees
from employees.employees
group by Department ;

select
Department
,Status
,Count(*) as Num_Of_Employees
from employees.employees
group by Department, Status 
Order by Department;

select
case 
when BoxOfficeDollars > OscarWins then 'Hit Film'
else 'Flop Film'
end as MovieType
,Count(*) as Num_Of_Films
from movies.film
group by MovieType ;

select
GenreID
,case 
when BoxOfficeDollars > OscarWins then 'Hit Film'
else 'Flop Film'
end as MovieType
,Count(*) as Num_Of_Films
from movies.film
group by GenreID,MovieType
Order by GenreID ;


select
GenreID
,Count(case when BoxOfficeDollars > BudgetDollars then 'Hit Film' end ) as HitFilms
,Count(case when BoxOfficeDollars < BudgetDollars then 'Flop Film' end) as FlopFilms
,Count(case when BoxOfficeDollars is null or BudgetDollars is null then 1 end) as CountNulls
,Count(*) as Number_Of_Films
from movies.film
Group by GenreID ;

select
OscarWins
,count(*) as Num_Of_Films
from movies.film
group by OscarWins
Order by OscarWins desc;

select
GenreID
,count(*) as Num_Of_Films
,Avg(RunTimeMinutes) as AvgRunTime
from movies.film
group by GenreID;

select
FamilyName
,count(*) as Num_Of_Actors
from movies.actor
where FamilyName is not null
group by FamilyName
Order by Num_Of_Actors desc;


select
Title
,Count(*) as Num_Of_Films
from movies.film
group by Title
Having Num_Of_Films > 1
Order by Num_Of_Films desc;

select
Status
,JobRating
,Count(*) as Num_Of_Employees
from employees.employees
group by Status, JobRating
Order by Status;

select 
case 
when Title not regexp '[0-9]' then 'Text Title'
when Title regexp '[A-Z]' then 'AlphaNumeric Title'
else 'Numneric Title'
end as MovieType
,Count(*) as Num_Of_Films
from movies.film
group by MovieType;

select
Title
,OscarWins
from movies.film
where OscarWins = (select Max(OscarWins) from movies.film);

select
Title
,RunTimeMinutes
from movies.film
where RunTimeMinutes > (Select Avg(RunTimeMinutes) from movies.film);

select
concat(First,' ',Last) as FullName
,Salary
,Status
from employees.employees
where Status = 'Full Time' and Salary > (Select Avg(Salary) from employees.employees where Status = 'Full Time' group by Status);

select 
avg(Salary) as AvgSalary
from employees.employees
where Status = 'Full Time' 
group by Status;

select
concat(First,' ',Last) as FullName
,HireDate
from employees.employees
where HireDate = (select Max(HireDate) from employees.employees) or
HireDate = (select Min(HireDate) from employees.employees);

select
concat(First,' ',Last) as FullName
,Max(Salary) as MaxSalary
,Department
from employees.employees
group by Department;

select
Department
,Salary
,concat(First,' ',Last) as FullName
from employees.employees 
where (Department,Salary) in (Select Department,Max(Salary) as MaxSalary from employees.employees Group by Department);

# Top 2nd highest salary employee details

Select *
from ( 
select
concat(First,' ',Last) as FullName
,Salary
from employees.employees
Order by Salary desc
Limit 2) as Topn
Order by Salary asc
Limit 1;

# Top 2nd Highest Grossing Film (BoxOfficeDollars) Details

Select *
from (
Select
Title
,BoxOfficeDollars
from movies.film
Order by BoxOfficeDollars desc
Limit 2) as Top2
Order by BoxOfficeDollars asc
Limit 1;

select
concat(First,' ',Last) as FullName
,Salary
,Salary - (Select Avg(Salary) from employees.employees) as AvgDev
from employees.employees;



Create Database HR;

Use HR;

Create table Employee
( 
EmployeeID int primary key auto_increment 
,Employee varchar(500)
,HireDate datetime
,GenderID int
,DepartmentID int
,CityID int
,Phone char(10)
,Email varchar(500)
,Salary double
);

Create table Gender
(
GenderID int Primary key auto_increment 
,Gender varchar(500)
);

Create table City
(
CityId int Primary key auto_increment
,City varchar(500)
);

Create table Department
(
DepartmentID int Primary key auto_increment
,Department varchar(500)
);

Alter table Employee
Add constraint FK_Employee_GenderID
foreign key(GenderID) references Gender(GenderID) ;

Alter table Employee
Add constraint FK_Employee_DepartmentID
foreign key(DepartmentID) references Department(DepartmentID); 

Alter table Employee
Add constraint FK_Employee_CityID
foreign key(CityID) references City(CityID);


alter table Employee
Add constraint UK_Employee_Phone
unique(phone);

alter table Employee
Add constraint UK_Employee_Email
unique(email);

alter table Employee
Add constraint CK_Employee_Phone
Check(Length(Phone)=10 and Phone not regexp '[A-Z]');

alter table Employee
Add constraint CK_Employee_Email
Check(Email like '%@%');

Insert into Gender(Gender)
Values ('Male')
,('Female')
,('Transgender');

Insert into city(City)
Values ('Bangalore')
,('Hyderabad')
,('Mumbai')
,('Chennai');

Insert into Department(Department)
Values ('IT')
,('Sales')
,('Finance')
,('HR');

select * from Gender;

Insert into Employee
Values(default, 'Hitesh','2007-12-3',1,1,1,'7860349991','hitesh.analyst@gmail.com',40000)
,(default, 'Amith','2007-1-3',1,1,1,'7860349992','amith.analyst@gmail.com',30000)
,(default, 'Naresh','2007-12-3',1,1,2,'7860349993','naresh.analyst@gmail.com',40000)
,(default, 'Satish','2007-2-3',1,1,1,'7860349994','satish.analyst@gmail.com',40000);

select * from Employee;

Use movies; 

create table Starfilms as
Select * 
from movies.film
where Title regexp 'Star';

select * from Starfilms;

Insert into movies.starfilms
select * 
from movies.film 
where title regexp 'Dark';

select * from Starfilms;

Create table Filmcopy as 
Select * from movies.film;

Create table Empcopy as
Select * from employees.employees;

select * from Empcopy;

Update Empcopy
set Salary = 100000
where JobRating = 1 ;

Update Empcopy
set Salary = 150000
,Status = 'Full Time'
where Jobrating = 1;

select * from Empcopy;

Alter table Empcopy
add Emailn varchar(500);

Update Empcopy
Set Emailn = concat(First,'.',Last,'@gmail.com');

Select * from Empcopy ;

Update Empcopy
Set Salary = case
when Status = 'Full Time' then Salary*1.1
when Status = 'Contract' then Salary*1.05
else Salary
end ;

Select  salary, Status from Empcopy ;

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
