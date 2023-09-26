CREATE DATABASE Cars;

-- Load the database into the Table 

USE Cars;

-- Read the data 

SELECT * from cars_table;           

-- How many records are present in the cars_table?

SELECT count(*) as TotalRecords 
FROM cars_table;       									-- 7927 records

-- How many cars that are available in the year 2023 ?

SELECT year, count(*) as TotalCars
FROM cars_table 
WHERE year = 2023;						-- 6 Cars

-- How many cars are available in 2020,2021,2022 ?

SELECT year, count(*) as TotalCars
FROM cars_table 
WHERE year IN (2020,2021,2022) GROUP BY year;          -- 2020: 74, 2021: 7, 2022: 7

-- Write a query to get Total of all cars by every year

SELECT year, count(*) as TotalCars
FROM cars_table
GROUP BY year;

-- How many Diesel cars are available in the year 2020?

SELECT year, fuel, count(*) as Total_Cars 
FROM cars_table
WHERE year = 2020 AND fuel = "Diesel";                   -- 20 Cars

-- How many Diesel cars are available in the year 2020?

SELECT year, fuel, count(*) as Total_Cars 				 
FROM cars_table
WHERE year = 2020 AND fuel = "PETROL";					-- 51 Cars

-- Write a query to print all the fuel cars (Diesel,Petrol,CNG) that comes all by the year.

SELECT year, fuel, count(*) as Total_Cars
FROM cars_table
WHERE FUEL IN ("Diesel","Petrol","CNG")
GROUP BY year;

-- There are more than 100 cars present in the given years, among those which year is having more than 100 cars ?

SELECT year, count(*)  as TotalCars
FROM cars_table
GROUP BY year
HAVING count(*)>100
ORDER BY TotalCars DESC;

-- All cars details between the year 2015 and 2023

SELECT * 
FROM cars_table
WHERE year BETWEEN 2015 AND 2018;