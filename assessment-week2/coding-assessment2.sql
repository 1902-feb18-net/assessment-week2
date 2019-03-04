CREATE SCHEMA CA

CREATE TABLE CA.Customers (
    CustomerID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
    FirtName nvarchar(100) NOT NULL,
	LastName nvarchar(100) NOT NULL,
	CardNumer nvarchar(100) UNIQUE NOT NULL
);

CREATE TABLE CA.Products (
    ProductID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
    ProductName nvarchar(100) UNIQUE NOT NULL,
	Price decimal(7,2) NOT NULL,
);

CREATE TABLE CA.Orders (
    OrderID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
    ProductID int NOT NULL,
	CustomerID int NOT NULL,
	constraint fk_Customer foreign key (CustomerID) references CA.Customers (CustomerID),
	constraint fk_Product foreign key (ProductID) references CA.Products (ProductID),
	CONSTRAINT UC_Order UNIQUE (ProductID,CustomerID),
);


INSERT INTO CA.Customers (FirtName, LastName, CardNumer)
VALUES ('Daniel', 'Rendon', '854-895-469');

INSERT INTO CA.Customers (FirtName, LastName, CardNumer)
VALUES ('Alejandro', 'Sosa', '432-544-275');

INSERT INTO CA.Customers (FirtName, LastName, CardNumer)
VALUES ('Richard', 'Brown', '235-655-333');

INSERT INTO CA.Customers (FirtName, LastName, CardNumer)
VALUES ('Tina', 'Smith', '255-615-323');

INSERT INTO CA.Products (ProductName, Price)
VALUES ('Iphone', 800);

INSERT INTO CA.Products (ProductName, Price)
VALUES ('Samsung', 600);

INSERT INTO CA.Products (ProductName, Price)
VALUES ('Charger', 50);

INSERT INTO CA.Orders (ProductID, CustomerID)
VALUES (1, 2);

INSERT INTO CA.Orders (ProductID, CustomerID)
VALUES (3, 3);

INSERT INTO CA.Orders (ProductID, CustomerID)
VALUES (2, 1);

INSERT INTO CA.Orders (ProductID, CustomerID)
VALUES (1, 4);

SELECT * FROM CA.Customers as CU
join CA.Orders AS ORD 
ON CU.CustomerID = ORD.CustomerID
join CA.Products as PRO
on ORD.ProductID = PRO.ProductID
Where FirtName = 'Tina'
and LastName = 'Smith'

SELECT SUM(Price) 
FROM CA.Products as PRO
join CA.Orders as ORD on PRO.ProductID = ORD.ProductID
where ProductName = 'Iphone'
Group By Price 


update CA.Products
set Price = 250
where ProductName = 'Iphone'

select * from CA.Customers
select * from CA.Products
select *  from CA.Orders


