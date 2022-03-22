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

 
/*
Weather Observation Station 8
8) Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.
*/
SELECT DISTINCT(CITY) FROM STATION 
WHERE SUBSTRING(CITY,1,1) IN ('a','e','i','o','u') 
AND SUBSTRING(CITY,LENGTH(CITY),LENGTH(CITY)) IN ('a','e','i','o','u')


/*
Weather Observation Station 9
9) Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
*/
SELECT DISTINCT(CITY) FROM STATION 
WHERE SUBSTRING(CITY,1,1) NOT IN ('a','e','i','o','u')

/*
Weather Observation Station 10
10)Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.
*/
SELECT DISTINCT(CITY) FROM STATION
WHERE SUBSTRING(CITY,LENGTH(CITY),LENGTH(CITY)) NOT IN ('a','e','i','o','u')

/*
Weather Observation Station 10
11)Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.
*/
SELECT DISTINCT(CITY) FROM STATION
WHERE SUBSTRING(CITY,LENGTH(CITY),LENGTH(CITY)) NOT IN ('a','e','i','o','u')
OR SUBSTRING(CITY,1,1) NOT IN ('a','e','i','o','u')

/*
Weather Observation Station 11
12)Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.
*/
SELECT DISTINCT(CITY) FROM STATION
WHERE SUBSTRING(CITY,LENGTH(CITY),LENGTH(CITY)) NOT IN ('a','e','i','o','u')
AND SUBSTRING(CITY,1,1) NOT IN ('a','e','i','o','u')

/*
14) Weather Observation Station 14
Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 137.2345 .
Truncate your answer to 4 decimal places.
*/
SELECT ROUND(MAX(LAT_N),4) FROM STATION
WHERE LAT_N < 137.2345

/*
15) Weather Observation Station 15
--Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than 137.2345 . Truncate your answer to 4 decimal places.
*/
SELECT ROUND(LONG_W,4) FROM STATION 
WHERE LAT_N = (SELECT MAX(LAT_N) FROM STATION WHERE LAT_N < 137.2345)


/*
16) Weather Observation Station 16 
--Query the smallest Northern Latitude (LAT_N) from STATION that is greater than 38.7780 . Truncate your answer to 4 decimal places.
*/
SELECT ROUND(MIN(LAT_N), 4) FROM STATION 
WHERE LAT_N  > 38.7780

/*
17) Weather Observation Station 17
Query the Western Longitude (LONG_W) where the smallest Northern Latitude (LAT_N) in STATION is greater than 38.7780 . Round your answer to 4 decimal places.
*/
SELECT ROUND(LONG_W,4) FROM STATION 
WHERE  LAT_N = (SELECT MIN(LAT_N) FROM STATION WHERE LAT_N > 38.7780)

--End Easy Questions for Weather Observation Station--
