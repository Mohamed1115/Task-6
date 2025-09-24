-- Create a table named "Employees" with columns for ID (integer), Name (varchar), and Salary (decimal).

CREATE TABLE Employees (
    ID  INTEGER,
    Name  VARCHAR(50),
    Salary FLOAT
)
-- Add a new column named "Department" to the "Employees" table with data type varchar(50).
ALTER TABLE Employees ADD
    Department VARCHAR(50)
-- Remove the "Salary" column from the "Employees" table.

ALTER TABLE Employees DROP COLUMN SaLary
-- Rename the "Department" column in the "Employees" table to "DeptName". 
EXEC sp_rename'Employees.Department','DeptName','COLUMN'
-- Create a new table called "Projects" with columns for ProjectID (integer) and ProjectName (varchar).
CREATE TABLE Projects (
    ProjectID INTEGER,
    ProjectName VARCHAR(50)
)

ALTER TABLE Projects 
ALTER COLUMN ProjectID INTEGER NOT NULL;
-- Add a primary key constraint to the "Employees" table for the "ID" column.
ALTER TABLE Projects ADD CONSTRAINT ProjectID_pk  PRIMARY KEY (ProjectID) 

-- Create a foreign key relationship between the "Employees" table (referencing "ID") and the "Projects" table (referencing "ProjectID").

ALTER TABLE Employees ADD CONSTRAINT FK_Pr_Em FOREIGN KEY (ID) REFERENCES Projects(ProjectID) 

-- Remove the foreign key relationship between "Employees" and "Projects."
ALTER TABLE Employees drop CONSTRAINT FK_Pr_Em  

-- Add a unique constraint to the "Name" column in the "Employees" table.
ALTER TABLE Employees 
ADD CONSTRAINT UQ_Employees_Name UNIQUE (Name);

-- Create a table named "Customers" with columns for CustomerID (integer), FirstName (varchar), LastName (varchar), and Email (varchar), and Status (varchar).
CREATE TABLE Customers
(
    CustomerID INT PRIMARY KEY,               
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100),
    Status VARCHAR(20),       
)
-- Add a unique constraint to the combination of "FirstName" and "LastName" columns in the "Customers" table.
ALTER TABLE Customers ADD CONSTRAINT UQ_Customers_First_Last UNIQUE (FirstName, LastName)
-- Add a default value of 'Active' for the "Status" column in the "Customers" table, where the default value should be applied when a new record is inserted.
ALTER TABLE Customers
ADD CONSTRAINT DF_Customers_Status
DEFAULT 'Active' FOR Status
 
-- Create a table named "Orders" with columns for OrderID (integer), CustomerID (integer), OrderDate (datetime), and TotalAmount (decimal).
CREATE TABLE Orders
(
    OrderID INT PRIMARY KEY,                         
    CustomerID INT NOT NULL,                         
    OrderDate DATETIME ,            
    TotalAmount DECIMAL(10,2) NOT NULL,
    
)

-- Add a check constraint to the "TotalAmount" column in the "Orders" table to ensure that it is greater than zero.

ALTER TABLE Orders ADD
    CONSTRAINT TotalAmount_Positive CHECK (TotalAmount > 0)
-- Create a schema named "Sales" and move the "Orders" table into this schema.
CREATE SCHEMA Sales
ALTER SCHEMA Sales TRANSFER dbo.Orders;
-- Rename the "Orders" table to "SalesOrders."
EXEC sp_rename 'Sales.Orders', 'SalesOrders';