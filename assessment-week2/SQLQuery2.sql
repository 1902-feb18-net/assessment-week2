Create database Iphone
drop table Product
Create Table Product(
	ID int NOT NULL PRIMARY KEY IDENTITY(1,1),
	Name varchar(50),
	Price float
)
drop table orders
Create Table Orders
(
	ID int identity(1,1),
	ProductID int not null,
	CustomerID int
	foreign key (productid) references Product(ID),
	foreign key (customerid) references customers(ID)
)

drop table customers
Create Table Customers
(
	ID int NOT NULL PRIMARY KEY IDENTITY(1,1),
	FirstName varchar(50),
	LastName varchar(50),
	CardNumber int
)

select *
from product
INSERT INTO Product(name,price)
 VALUES ('phone1',100);
 INSERT INTO Product(name,price)
 VALUES ('phone2',150);
 INSERT INTO Product(name,price)
 VALUES ('phone3',200);

 insert into orders (ProductID,CustomerID)
 values(1,1)


 INSERT INTO customers(FirstName,LastName,CardNumber)
 VALUES ('Tom','Brady',12345678);
 INSERT INTO customers(FirstName,LastName,CardNumber)
 VALUES ('Tony''Romo',12345890);
 INSERT INTO customers(FirstName,LastName,CardNumber)
 VALUES ('Waldo''Esqueda',54968712);


insert into product (name,price)
values('Iphone',200)

 INSERT INTO customers(FirstName,LastName,CardNumber)
 VALUES ('Tina','ESmith',54963212);

 select * from Customers

 insert into orders (ProductID,CustomerID)
 values(4,4)

 select *
 from orders
 where CustomerID = 4

 

 update product
 set Price = 250
 where name = 'Iphone'