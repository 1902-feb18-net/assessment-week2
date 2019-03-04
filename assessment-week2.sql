--create database
Create Database assessmentweek2;
GO

--switch to asssessmentweek2 database

--create tables
Create Table Products(
  ID int Not Null Unique Identity,
  Name nvarchar(255) Not Null,
  Price Money Not Null,
  Constraint productsPK Primary Key (ID)
)

Create Table Customers(
  ID int Not Null Unique Identity,
  Firstname nvarchar(255) Not Null,
  Lastname nvarchar(255) Not Null,
  CardNumber nchar(16), --cards are 16 digits
  Constraint customersPK Primary Key (ID)
)

Create Table Orders(
  ID int Not Null Unique Identity,
  ProductID int Not Null,
  CustomerID int Not Null,
  Constraint orders_productsFK Foreign Key (ProductID) References Products (ID),
  Constraint orders_customersFK Foreign Key (CustomerID) References Customers (ID)
)

GO

--add at least 3 records into each table
Insert into Products (Name, Price) Values ('product1', 5.00);
Insert into Products (Name, Price) Values ('product2', 10.00);
Insert into Products (Name, Price) Values ('product3', 15.00);
Select * From Products;

Insert into Customers (Firstname, Lastname, CardNumber) Values ('FN1', 'LN1', '0000000000000000');
Insert into Customers (Firstname, Lastname, CardNumber) Values ('FN2', 'LN2', '0000000000000001');
Insert into Customers (Firstname, Lastname, CardNumber) Values ('FN3', 'LN3', '0000000000000002');
Select * From Customers;

Insert into Orders (ProductID, CustomerID) Values (1,1);
Insert into Orders (ProductID, CustomerID) Values (1,2);
Insert into Orders (ProductID, CustomerID) Values (2,1);
Select * From Orders;


--add Iphone at $200
Insert into Products (Name, Price) Values ('Iphone', 200);
Select Price From Products Where Name ='Iphone';

--add customer Tina Smith
Insert into Customers (Firstname, Lastname, CardNumber) Values ('Tina', 'Smith', '0000000000000003');

Select * From Customers Where Firstname = 'Tina' AND Lastname = 'Smith';

--create order Tina Smith bought Iphone
Insert into Orders (ProductID, CustomerID) 
 Values ( (Select ID From Products Where Name = 'Iphone'), 
 (Select ID From Customers Where Firstname = 'Tina' AND Lastname = 'Smith') );

 Select * From Orders;

 --Report all orders by Tina Smith
 --Could join to products on ProductID = Products.ID to get product name, but not required
 Select ProductID, CustomerID, Firstname, Lastname, CardNumber From Orders JOIN Customers ON Orders.CustomerID = Customers.ID Where Firstname = 'Tina' AND Lastname = 'Smith';

 --Report all revenue from Iphone sales
 --Note no quantity field means that each order is exactly one product, no multiplication needed
 Select Sum(Price) AS [Total Revenue] From Orders JOIN Products ON Orders.ProductID = Products.ID 
 Where Name = 'Iphone';

 --increase price of iphone to 250
 --note this changes the revenue of past orders!
 Update Products Set Price = 250 Where Name ='Iphone';
 Select Price From Products Where Name ='Iphone';