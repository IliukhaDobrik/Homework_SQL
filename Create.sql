create database Library

use Library

create table Authors
(
	Id uniqueidentifier primary key default newid(),
	FirstName nvarchar(50) not null,
	LastName nvarchar(50) not null,
	Country nvarchar(100) not null,
	BirthDate date not null check (BirthDate<=getdate())
)

create table Books
(
	Id uniqueidentifier primary key default newid(),
	Name nvarchar(100) not null,
	AuthorId uniqueidentifier not null references Authors (Id) on delete cascade,
	Year int not null check (Year<=year(getdate()))
)

create table Users
(
	Id uniqueidentifier primary key default newid(),
	FirstName nvarchar(50) not null,
	LastName nvarchar(50) not null,
	Email nvarchar(100) not null unique,
	BirthDate date not null check(BirthDate<=getdate()),
	Age int null,
	Address nvarchar(100) not null,
	ExpiredDate date null
)

create table UserBooks
(
	Id uniqueidentifier primary key default newid(),
	UserId uniqueidentifier not null references Users (Id) on delete cascade,
	BookId uniqueidentifier not null references Books (Id) on delete cascade,
	CreatedDate date null
)