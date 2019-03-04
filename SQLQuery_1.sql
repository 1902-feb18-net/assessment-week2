CREATE TABLE Products(
    ProductId INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    ProductName NVARCHAR(100),
    Price FLOAT
);

CREATE TABLE Orders(
    OrderId INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    ProductId INT NOT NULL,
    CustomerId INT NOT NULL
);

CREATE TABLE Customers(
    CustomerId INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(100) NOT NULL,
    LastName NVARCHAR(100) NOT NULL,
    CardNumber NVARCHAR(16) 
);

ALTER TABLE Orders ADD
    CONSTRAINT FK_ProductId FOREIGN KEY (ProductId) REFERENCES Products(ProductId),
    CONSTRAINT FK_CustomerId FOREIGN KEY (CustomerId) REFERENCES CUSTOMERS(CustomerId);


INSERT INTO Products (ProductName,Price) VALUES ('Soap', 5.99);
INSERT INTO Products (ProductName,Price) VALUES ('Towel', 10.99);
INSERT INTO Products (ProductName,Price) VALUES ('Detergent', 8.99);

INSERT INTO Orders (ProductId,CustomerId) VALUES (1, 1);
INSERT INTO Orders (ProductId,CustomerId) VALUES (2, 2);
INSERT INTO Orders (ProductId,CustomerId) VALUES (3, 3);

INSERT INTO Customers (FirstName, LastName, CardNumber) VALUES ('Diana', 'Juarez', 1234987645678907);
INSERT INTO Customers (FirstName, LastName, CardNumber) VALUES ('Jack', 'Rewis', 1234987645672145);
INSERT INTO Customers (FirstName, LastName, CardNumber) VALUES ('Ari', 'Juarez', 1234987645677845);

INSERT INTO Products (ProductName,Price) VALUES ('iPhone', 200);

INSERT INTO Customers (FirstName, LastName) VALUES ('Tina', 'Smith');

INSERT INTO Orders(ProductId, CustomerId) VALUES (4,4);

SELECT * FROM Customers AS c
    JOIN Orders AS o ON c.CustomerId = o.CustomerId
    WHERE c.CustomerId = 4;

SELECT * FROM Orders AS o
    JOIN Products AS p ON o.ProductId = p.ProductId
    WHERE o.ProductId = 4;

UPDATE Products 
SET Price=250
WHERE ProductId = 4;

