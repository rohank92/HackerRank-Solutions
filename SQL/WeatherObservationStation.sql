--Language: MySQL

--1) Weather Observation Station 1
--Query a list of CITY and STATE from the STATION table. 
SELECT CITY,STATE FROM STATION

--2) Weather Observation Station 2
--Query the following two values from the STATION table:
--The sum of all values in LAT_N rounded to a scale of 2 decimal places.
--The sum of all values in LONG_W rounded to a scale of 2 decimal places.
SELECT ROUND(SUM(LAT_N),2), ROUND(SUM(LONG_W),2) FROM STATION

--3) Weather Observation Station 3
--Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer. 
SELECT DISTINCT(CITY) FROM STATION WHERE ID%2=0


--4) Weather Observation Station 4
--Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table. 
SELECT COUNT(CITY) - COUNT(DISTINCT(CITY)) FROM STATION 

--5) Weather Observation Station 5
--Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically. 
SELECT CITY, LENGTH(CITY) FROM STATION 
ORDER BY LENGTH(CITY) ASC, CITY
LIMIT 1;

SELECT CITY, LENGTH(CITY) FROM STATION 
ORDER BY LENGTH(CITY) DESC, CITY
LIMIT 1;


--6) Weather Observation Station 6
--Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.
SELECT DISTINCT(CITY) FROM STATION 
WHERE LEFT(CITY,1) LIKE 'a'
OR LEFT(CITY,1) LIKE 'e'
OR LEFT(CITY,1) LIKE 'i'
OR LEFT(CITY,1) LIKE 'o'
OR LEFT(CITY,1) LIKE 'u'

--7) Weather Observation Station 7
--Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.
SELECT DISTINCT(CITY) FROM STATION 
WHERE LOWER(CITY) LIKE '%a'
OR LOWER(CITY) LIKE '%e'
OR LOWER(CITY) LIKE '%i'
OR LOWER(CITY) LIKE '%o'
OR LOWER(CITY) LIKE '%u'

 
