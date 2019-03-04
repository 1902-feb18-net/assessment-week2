


CREATE TABLE Products
(
Id int not null primary key,
Name varchar(255),
Price int,
);


CREATE TABLE Customers
(
Id int not null primary key,
Firstname Varchar(255),
Lastname Varchar(255),
CardNumber int,
);

CREATE TABLE Orders
(
Id int not null primary key,
ProductId int,
CustomerId int,
);

ALTER TABLE Orders
ADD CONSTRAINT
FK_Orders_CustomerId
FOREIGN KEY
(CustomerId)
REFERENCES
Customers
(Id);

ALTER TABLE Orders
ADD CONSTRAINT
FK_Orders_ProductId
FOREIGN KEY
(ProductId)
REFERENCES
Products
(Id);


---------
-----------------------------------
--add at least 3 records into each table

--add proudct IPHONE priced at $200
select *
from Products

INSERT INTO Products(Id, NAME, Price)
VALUES (3, 'IWatch', 600); 



--add customer Tina Smith
select *
from Customers

INSERT INTO Customers(Id, Firstname, Lastname, CardNumber)
VALUES (3, 'Bryan', 'Mora', 98765); 

--create order for Tina Smith
select *
from Orders

Insert into Orders(Id, ProductId, CustomerId)
Values(3, 2, 3)

--report all orders by Tina Smith
SELECT * FROM Orders
WHERE Id= 1; 


--report all revenue generated by sales of iphone
SELECT ProductId
FROM Products
INNER JOIN Orders
ON Products.Id = Orders.ProductId;

SELECT Price
FROM Products
INNER JOIN Orders
ON Products.Id = Orders.ProductId;

SELECT Customers.Id, COUNT(Orders.ProductId) AS NumberOfOrders
FROM (Orders
INNER JOIN Customers ON Orders.ProductId = Customers.Id)
GROUP BY LastName
HAVING COUNT(Orders.OrderID) > 10; 

--increase the price of Iphone to $250

UPDATE Products
SET Price = 250
WHERE Price = 200;




