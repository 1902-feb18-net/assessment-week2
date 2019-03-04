create DATABASE Assessment2;

GO
CREATE SCHEMA two;
GO

CREATE TABLE two.Orders (
	ID INT PRIMARY KEY IDENTITY,
	ProductID INT NOT NULL,
	CustomerID INT NOT NULL
);

CREATE TABLE two.Products (
	ID INT PRIMARY KEY IDENTITY,
	Name NVARCHAR(100) NOT NULL,
	Price DECIMAL(10,2) NOT NULL,
);

CREATE TABLE two.Customers (
	ID INT PRIMARY KEY IDENTITY,
	FirstName NVARCHAR(100) NOT NULL,
	LastName NVARCHAR(100) NOT NULL,
	CardNumber int NOT NULL
);

ALTER TABLE two.Orders ADD 
	CONSTRAINT FK_Orders_To_Products FOREIGN KEY (ProductID) REFERENCES two.Products (ID),
	CONSTRAINT FK_Orders_To_Customers FOREIGN KEY (ProductID) REFERENCES two.Customers (ID)

-- ADD three records into each table

INSERT INTO two.Products (Name, Price) VALUES 
	('IPad', 499.99),
	('Macbook Pro', 1999.99),
	('Mouse', 29.99)

INSERT INTO two.Customers (FirstName, LastName, CardNumber) VALUES 
	('Conrad', 'Troha', 123456789),
	('Jon', 'Snow', 789456123),
	('Bruce', 'Wayne', 456789123)

INSERT INTO two.Orders (ProductID, CustomerID) VALUES
	(1, 3),
	(2, 3),
	(1, 1)

-- ADD IPhone priced at $200
INSERT INTO two.Products (Name, Price) VALUES ('iPhone', 200.00);

-- ADD TINA SMITH
INSERT INTO two.Customers (FirstName,LastName, CardNumber) VALUES ('Tina', 'Smith', 45861379);

-- Create order for Tina Smith and iPhone
INSERT INTO two.Orders (ProductID, CustomerID) VALUES (4,4)

-- Insert More orders for Tina to test Report orders
INSERT INTO two.Orders (ProductID, CustomerID) VALUES (1,4), (2,4), (1,4)

-- Report all orders by Tina Smith
SELECT Orders.ID AS [Order Number], Customers.FirstName + ' ' + two.Customers.LastName AS [Customer Name],
	   Products.Name as [Product Name], Products.Price
FROM two.Orders 
	JOIN two.Products ON Orders.ProductID = two.Products.ID
	JOIN two.Customers ON Orders.CustomerID = Customers.ID
WHERE Customers.ID = (
	SELECT ID
	FROM two.Customers
	WHERE FirstName = 'Tina' AND LastName = 'Smith'
);

-- ADD More orders to test revenue generation
INSERT INTO two.Orders (ProductID, CustomerID) VALUES 
	(4, 1),
	(4, 2),
	(4, 3)

-- Report all revenue generated by sales of iPhone
SELECT SUM(p.Price) AS [iPhone Revenue]
FROM two.Products AS p
	JOIN two.Orders AS o ON p.ID = o.ProductID
WHERE o.ProductID = (
	SELECT ID
	FROM two.Products
	WHERE Name = 'iPhone'
)

-- Update price of iPhone to 250
UPDATE two.Products
SET Price = 250.00
WHERE ID = (
	SELECT ID
	FROM two.Products
	WHERE Name = 'iPhone'
)



SELECT * FROM two.Products
SELECT * FROM two.Customers
SELECT * FROM two.Orders