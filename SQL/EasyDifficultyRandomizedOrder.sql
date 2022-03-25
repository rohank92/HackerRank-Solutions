/*
Query the Name of any student in STUDENTS who scored higher than Marks. Order your output by the last three characters of each name. 
If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.
ALL THE FOLLOWING QUERIES ARE VALID EVEN IF YOU SELECT MYSQL. 
I was under the impression SUBSTR was in MYSQL and SUBSTRING was used in MySQL Server 
*/
SELECT NAME FROM STUDENTS 
WHERE MARKS > 75 
ORDER BY SUBSTR(NAME,LENGTH(NAME)-2,3) asc , ID asc;

SELECT NAME FROM STUDENTS 
WHERE MARKS > 75 
ORDER BY SUBSTRING(NAME,LENGTH(NAME)-2,3) asc , ID asc;

SELECT NAME FROM STUDENTS 
WHERE MARKS > 75 
ORDER BY RIGHT(NAME,3) asc , ID asc;


-- Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.
SELECT name FROM Employee
ORDER BY name


--Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than $2000 per month who have been employees for less than months. Sort your result by ascending employee_id.
SELECT name FROM Employee 
WHERE salary > 2000 AND months < 10
ORDER BY employee_id asc

-- Query a count of the number of cities in CITY having a Population larger than 100,000.
SELECT COUNT(NAME) FROM CITY
WHERE POPULATION > 100000

--Query the total population of all cities in CITY where District is California. 
SELECT SUM(POPULATION) FROM CITY
WHERE DISTRICT = 'California'

--Query the average population of all cities in CITY where District is California. 
SELECT AVG(POPULATION) FROM CITY
WHERE DISTRICT = 'California'

--Query the average population for all cities in CITY, rounded DOWN to the nearest integer.
-- (round up and round down) 
SELECT ROUND(AVG(POPULATION)) FROM CITY

--Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.
SELECT SUM(POPULATION) FROM CITY 
WHERE COUNTRYCODE = 'JPN'

--Query the difference between the maximum and minimum populations in CITY.
SELECT MAX(POPULATION) - MIN(POPULATION) FROM CITY

/*
Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, but did not realize her keyboard's '0' key was broken until after completing the calculation. She wants your help finding the difference between her miscalculation (using salaries with any zeros removed), and the actual average salary.

Write a query calculating the amount of error (i.e.: actual - miscalculated average monthly salaries), and round it up to the next integer.
*/
SELECT  CEIL(AVG(SALARY) - AVG(REPLACE(Salary,'0',''))) FROM EMPLOYEES


/*
We define an employee's total earnings to be their monthly salary X months worked, and the maximum total earnings to be the maximum total earnings for any employee in the 'Employee' table. Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. Then print these values as 2 space-separated integers.
*/
-- debug : max (months*salary) = 108064
--SELECT MAX(months*salary) , COUNT(employee_id) FROM EMPLOYEE
--SELECT MAX(months*salary) , COUNT(employee_id) FROM EMPLOYEE WHERE months*salary=108064

SELECT MAX(months*salary) , COUNT(employee_id) FROM EMPLOYEE
WHERE months*salary = (SELECT MAX(months * salary) FROM EMPLOYEE)


/*
Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.
Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
*/
SELECT SUM(CITY.POPULATION) FROM CITY JOIN COUNTRY ON (CITY.countrycode=COUNTRY.code)
WHERE COUNTRY.CONTINENT='Asia'

/*
Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.
Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
*/
SELECT CITY.NAME FROM CITY JOIN COUNTRY ON (CITY.COUNTRYCODE = COUNTRY.CODE)
WHERE CONTINENT = 'Africa'


/*
Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their respective average city populations (CITY.Population) rounded down to the nearest integer.
Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
*/
SELECT COUNTRY.continent, FLOOR(AVG(CITY.POPULATION)) 
FROM CITY JOIN COUNTRY ON (CITY.countrycode = COUNTRY.code)
--ERROR 1140 (42000) at line 1: In aggregated query without GROUP BY, expression #1 of SELECT list contains nonaggregated column 'COUNTRY.continent'; this is incompatible with sql_mode=only_full_group_by

SELECT COUNTRY.continent, FLOOR(AVG(CITY.POPULATION)) 
FROM CITY JOIN COUNTRY ON (CITY.countrycode = COUNTRY.code)
GROUP BY country.continent
-- what Join would solve this without a group by ? 

