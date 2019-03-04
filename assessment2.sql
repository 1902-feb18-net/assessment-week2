CREATE DATABASE Assessment2;

CREATE TABLE Products(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(50),
Price DECIMAL(8,2));

CREATE TABLE Customers(
Id INT PRIMARY KEY IDENTITY,
FirstName NVARCHAR(100),
LastName NVARCHAR(100),
CardNumber INT);

DROP TABLE Orders
CREATE TABLE Orders(
Id INT PRIMARY KEY IDENTITY, --Diagram had no primary key but this made more sense
ProductID INT FOREIGN KEY REFERENCES Products(Id),
CustomerID INT FOREIGN KEY REFERENCES Customers(Id));

INSERT INTO Customers (FirstName, LastName, CardNumber) VALUES
('Lee', 'Marshall', 14),
('Conrad', 'Troha', 10),
('John', 'Marshall', 7);

INSERT INTO Products (Name, Price) VALUES
('Galaxy 8', 150.00),
('G5', 200),
('1 X', 50);

INSERT INTO Orders (ProductID, CustomerID) VALUES
(1,3),
(2,1),
(3,2);

INSERT INTO Products (Name, Price) VALUES
('IPhone', 200);

INSERT INTO Customers (FirstName, LastName, CardNumber) VALUES
('Tina', 'Smith', 18);

INSERT INTO Orders (ProductID, CustomerID) VALUES
((SELECT Id FROM Customers WHERE FirstName = 'Tina' AND LastName = 'Smith'),
(SELECT Id FROM Products WHERE Name = 'IPhone'));

SELECT * FROM Orders WHERE CustomerID =
(SELECT Id FROM Customers WHERE FirstName = 'Tina' AND LastName = 'Smith')

SELECT Products.Price, COUNT(Orders.Id WHERE ProductID =(SELECT Id FROM Products WHERE Name = 'IPhone'))
FROM Products, Orders;

UPDATE Products
SET Price = 250
WHERE Name = 'IPhone';