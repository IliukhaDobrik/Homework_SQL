create database Library

use Library

create table Authors
(
	Id int not null identity primary key,
	FirstName nvarchar(50) not null,
	LastName nvarchar(50) not null,
	Country nvarchar(100) not null,
	BirthDate date not null check (BirthDate<=getdate())
)

create table Books
(
	Id int not null identity primary key,
	Name nvarchar(100) not null,
	AuthorId int not null references Authors (Id) on delete cascade,
	Year int not null check (Year<=year(getdate()))
)

create table Users
(
	Id int not null identity primary key,
	FirstName nvarchar(50) not null,
	LastName nvarchar(50) not null,
	Email nvarchar(100) not null unique,
	BirthDate date not null check(BirthDate<=getdate()),
	Age int not null check(Age >0 and Age <=120),
	Address nvarchar(100) not null,
	ExpiredDate date not null
)

create table UserBooks
(
	Id int not null identity primary key,
	UserId int not null references Users (Id) on delete cascade,
	BookId int not null references Books (Id) on delete cascade,
	CreatedDate date not null
)