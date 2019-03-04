--create schema assessment
--drop table assessment.Customer
--drop table assessment.Product
--drop table assessment.Orders


--drop table.assessment.Customer
create table assessment.Customer (
	CustomerID int not null primary key identity(1,1),
	FirstName nvarchar(100) not null,
	LastName nvarchar(300) not null,
	CardNumber int not null,
	constraint CardNumber_Not_0 check (CardNumber > 0),
	constraint FirstName_Not_Empty check (FirstName != ''),
	constraint LastName_Empty check (LastName != '')
)



--drop table Assessment.Product
create table assessment.Product (
	ID int not null primary key identity(1,1),
	Name nvarchar(100) not null,
	Price money  not null,
	constraint Price_Not_0 check (Price > 0.00),
)




--drop table assessment.Orders
create table assessment.Orders (
	OrdersID int not null primary key identity(1,1),
	CustomerID int,
	ProductID int,
	constraint Fk_Orders_To_Customer Foreign Key (CustomerID) references assessment.Customer(CustomerID) on update cascade,
	constraint Fk_Orders_To_Product Foreign Key (CustomerID) references assessment.product(ID) on update cascade 
)



insert into assessment.Product(Name,Price) values 
		('Astonishing X-Men',4.99),
		('Justice League of America',4.99),
		('New Avengers',4.99),
		('Batman',4.99),
		('Amazing Spider-Man',4.99)


		
insert into assessment.Customer (FirstName, LastName, CardNumber) values
		('Rhonda','Rubio',65343467),
		('Lucy','Rubio',56732345),
		('Matt','Akers',79887434)


insert into assessment.Orders (CustomerID,ProductID) values 
		(1,4),
		(1,2),
		(3,5)


insert into assessment.Product(name, Price) values ('Iphone', 200.00)


insert into assessment.Customer(FirstName,LastName,CardNumber) values ('Tina', 'Smith', 34095498)


--hardcoded method
insert into assessment.Orders(CustomerID,ProductID) values
		(4,6)


select OrdersID
from assessment.Orders
where assessment.Orders.CustomerID in ( 
	select CustomerID
	from assessment.Customer
	where assessment.Customer.FirstName = 'Tina'
	)


select count(ProductID) * 200 As Total
from assessment.Orders
where assessment.Orders.ProductID  in ( 
	select ProductID
	from assessment.Product
	where ID = 6
	)



update assessment.Product
set Price = 250.00
where Name = 'Iphone'

