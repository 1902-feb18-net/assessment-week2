CREATE SCHEMA Stores;
GO

CREATE TABLE Stores.Products (
	ID INT NOT NULL PRIMARY KEY IDENTITY, 
	Name NVARCHAR(200) NOT NULL,
	Price DECIMAL(10,2) NOT NULL,
);

CREATE TABLE Stores.Customers (
	ID INT NOT NULL PRIMARY KEY IDENTITY, 
	Firstname NVARCHAR(200) NOT NULL,
	Lastname NVARCHAR(200) NOT NULL,
	CardNumber BIGINT NOT NULL,
);

CREATE TABLE Stores.Orders (
	ID INT NOT NULL PRIMARY KEY IDENTITY,
	ProductID INT NOT NULL,
	CustomerID INT NOT NULL,
	CONSTRAINT FK_Order_Product FOREIGN KEY (ProductID) REFERENCES Stores.Products (ID),
	CONSTRAINT FK_Order_Customer FOREIGN KEY (CustomerID) REFERENCES Stores.Customers (ID)
);

--DROP TABLE Stores.Orders;
--DROP TABLE Stores.Customers;

INSERT INTO Stores.Products (Name, Price) VALUES
	('Uranium', 70.34),
	('Plutonium', 55.34),
	('Argon', 902.45);

INSERT INTO Stores.Customers (Firstname, Lastname, Cardnumber) VALUES
	('Bob', 'Jim', 4325897483920754),
	('Yours', 'Truly', 1239487089317489),
	('Unequivocally', 'Eccentric', 8032917543891407);

INSERT INTO Stores.Orders (ProductID, CustomerID) VALUES
	(1, 3),
	(2, 2),
	(3, 1);

INSERT INTO Stores.Products (Name, Price) VALUES
	('iPhone', 200.00);

SELECT *
FROM Stores.Products;

INSERT INTO Stores.Customers (Firstname, Lastname, Cardnumber) VALUES
	('Tina', 'Smith', 0132467865898699);

SELECT *
FROM Stores.Customers;

