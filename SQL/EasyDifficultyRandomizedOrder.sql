/*
Query the Name of any student in STUDENTS who scored higher than Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.
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

/*
Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.
*/
SELECT name FROM Employee
ORDER BY name

/*
Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than $2000 per month who have been employees for less than months. Sort your result by ascending employee_id.
*/
SELECT name FROM Employee 
WHERE salary > 2000 AND months < 10
ORDER BY employee_id asc