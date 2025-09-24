-- Select all columns from the "Employees" table.
SELECT * FROM Employees 

-- Select only the "Name" and "Salary" columns from the "Employees" table.
SELECT Name FROM Employees
-- Select distinct values of the "DeptName" column from the "Employees" table.
SELECT DISTINCT DeptName FROM Employees
-- Select the top 5 records from the "Employees" table.
SELECT TOP 5 * FROM Employees
-- Select all records from the "Employees" table, ordered by the "Salary" column in descending order.
SELECT * FROM Employees ORDER BY Salary 
-- Select the first 10 records from the "Employees" table, starting from the third record.
SELECT * FROM Employees
ORDER BY ID   OFFSET 2 ROWS FETCH NEXT 10 ROWS ONLY
-- Select the average salary from the "Employees" table. (search on it)
SELECT AVG(SaLary) as Average_Salary FROM Employees
-- Select the maximum and minimum salaries from the "Employees" table. (search on it)
SELECT MAX(SaLary) as MAX_Salary,MIN(SaLary) as MIN_Salary FROM Employees
-- Select the top 3 highest salaries from the "Employees" table.
SELECT TOP 3 * FROM Employees ORDER BY Salary DESC
-- Select all records from the "Employees" table, ordered by "Name" in ascending order.
SELECT * FROM Employees ORDER BY Name 
-- Select the first 5 records from the "Employees" table, starting from the second record, ordered by "Salary" in descending order.
SELECT * FROM Employees
ORDER BY Salary DESC   OFFSET 2 ROWS FETCH NEXT 5 ROWS ONLY
-- Select the sum of all salaries from the "Employees" table. (search on it)
SELECT SUM(SaLary) as Sum_Salary FROM Employees
-- Select records from the "Employees" table where the "Salary" is between 40000 and 60000, ordered by "Salary" in ascending order.
SELECT * FROM Employees
WHERE Salary > 40000 AND SaLary < 60000 ORDER BY SaLary