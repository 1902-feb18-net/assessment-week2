--create schema assessment
drop table assessment.Customer
drop table assessment.Product
drop table assessment.Orders


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
	Total money,
	CustomerID int not null,
	OrderTime Datetime2 default(CURRENT_TIMESTAMP),
	constraint Fk_Orders_To_Customer Foreign Key (CustomerID) references Comic.Customer(CustomerID) on update cascade 
)





