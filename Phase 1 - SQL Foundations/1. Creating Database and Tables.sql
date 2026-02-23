-- Create database
CREATE DATABASE OnlineStore;
-- Use the database
USE OnlineStore;
-- Creating the first table "Customers"
CREATE TABLE Customers(
CustomerID INT PRIMARY KEY,
FirstName NVARCHAR (50) NOT NULL,
LastName NVARCHAR (50) NOT NULL,
Email NVARCHAR (100) UNIQUE NOT NULL,
JoinDate DATE
);
-- Creating the second table "Products"
CREATE TABLE Products(
ProductID INT PRIMARY KEY,
ProductName NVARCHAR (100) NOT NULL,
Category NVARCHAR (50),
CostPrice DECIMAL (10,2),
SellingPrice DECIMAL (10,2),
UnitsSold INT,
UnitsinStock INT,
TotalRevenue AS (UnitsSold * SellingPrice) PERSISTED
);
-- Creating the third table "Orders"
CREATE TABLE Orders(
OrderID INT PRIMARY KEY,
CustomerID INT,
OrderDate DATE,
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
-- Creating the fourth table "OrderedItems"
CREATE TABLE OrderedItems (
OrderedItemsID INT PRIMARY KEY,
OrderID INT,
ProductID INT,
Quantity INT,
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);