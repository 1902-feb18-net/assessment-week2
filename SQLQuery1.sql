-- create db
CREATE DATABASE StoredDb;

GO
-- create schema
CREATE SCHEMA StoredDb;
GO

-- create tables
CREATE TABLE StoredDb.Products  
   (
   ID INT PRIMARY KEY NOT NULL,  
   Name NVARCHAR(100) NOT NULL,  
   Price Money NOT NULL
)  
GO  

CREATE TABLE StoredDb.Orders  
   (
   ID INT PRIMARY KEY NOT NULL,  
   ProductID INT NOT NULL,
   CustomerID INT NOT NULL
)  

GO
CREATE TABLE StoredDb.Customers  
   (
   ID INT PRIMARY KEY NOT NULL,  
   Firstname NVARCHAR(50) NOT NULL,
   Lastname NVARCHAR(50) NOT NULL,
   CardNumber INT NOT NULL
)  

-- add FK
ALTER TABLE StoredDB.Orders
	ADD CONSTRAINT FK_Order_Product_ID FOREIGN KEY (ProductID) REFERENCES StoredDB.Products(ID);

ALTER TABLE StoredDB.Orders
	ADD CONSTRAINT FK_Order_Customer_ID FOREIGN KEY (CustomerID) REFERENCES StoredDB.Customers(ID);

-- insert values
INSERT StoredDb.Products(ID, Name, Price)
	VALUES(1, 'IPhone', 200.00);
INSERT StoredDb.Products(ID, Name, Price)
	VALUES(2, 'Android', 300.00);
INSERT StoredDb.Products(ID, Name, Price)
	VALUES(3, 'Goggle', 150.00);

INSERT StoredDb.Customers(ID, Firstname, Lastname, CardNumber)
	VALUES(1, 'Tina', 'Smith', 1234567);
INSERT StoredDb.Customers(ID, Firstname, Lastname, CardNumber)
	VALUES(2, 'Lina', 'Mith', 2234567);
INSERT StoredDb.Customers(ID, Firstname, Lastname, CardNumber)
	VALUES(3, 'Dina', 'With', 3234567);

INSERT StoredDb.Orders(ID, ProductID, CustomerID)
	VALUES(1, 1, 1);
INSERT StoredDb.Orders(ID, ProductID, CustomerID)
	VALUES(2, 2, 1);
INSERT StoredDb.Orders(ID, ProductID, CustomerID)
	VALUES(3, 3, 1);
INSERT StoredDb.Orders(ID, ProductID, CustomerID)
	VALUES(4, 1, 1);
INSERT StoredDb.Orders(ID, ProductID, CustomerID)
	VALUES(4, 1, 2);

SELECT * FROM StoredDb.Orders;