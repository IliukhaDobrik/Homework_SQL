use Library

insert into Authors
values  (default, N'������', N'��������', N'������', '1891-5-15'),
		(default, N'���', N'�������', N'������', '1910-9-9'),
		(default, N'����', N'������', N'���', '1892-1-3'),
		(default, N'������', N'������', N'������', '1887-11-3'),
		(default, N'�����', N'����������', N'�����', '1950-12-30'),
		(default, N'������', N'�������', N'������', '1955-5-19'),
		(default, N'�������', N'������', N'���', '1964-7-27'),
		(default, N'����', N'���', N'���', '1972-6-16')	

--delete from Authors
--dbcc checkident('Authors', reseed, 0)

insert into Books
values  (default, N'������ � ���������',
	    (select Id from Authors where FirstName = N'������' and LastName = N'��������'),
		1967),
		(default, N'������� ������',
	    (select Id from Authors where FirstName = N'������' and LastName = N'��������'),
		1925),
		(default, N'����� � ���',
	    (select Id from Authors where FirstName = N'���' and LastName = N'�������'),
		1865),
		(default, N'��������',
	    (select Id from Authors where FirstName = N'���' and LastName = N'�������'),
		1852),
		(default, N'��������� �����',
	    (select Id from Authors where FirstName = N'����' and LastName = N'������'),
		1954),
		(default, N'��������',
	    (select Id from Authors where FirstName = N'����' and LastName = N'������'),
		2014),
		(default, N'�����',
	    (select Id from Authors where FirstName = N'������' and LastName = N'������'),
		1926),
		(default, N'������ � �������� C++',
	    (select Id from Authors where FirstName = N'�����' and LastName = N'����������'),
		1994),
		(default, N'JavaTM',
	    (select Id from Authors where FirstName = N'������' and LastName = N'�������'),
		1994),
		(default, N'CLR via C#',
	    (select Id from Authors where FirstName = N'�������' and LastName = N'������'),
		1994),
		(default, N'���������',
	    (select Id from Authors where FirstName = N'����' and LastName = N'���'),
		1994)

--delete from Books
--dbcc checkident('Books', reseed, 0)
		
insert into Users
values  (default, N'����', N'����������', 'asfsf@gmail.com', '2002-5-8', null, N'�������', null),
        (default, N'����', N'������', 'asfdjksllsf@gmail.com', '2003-6-6', null, N'������� ���������', null),
        (default, N'����', N'���������', 'asf@mail.ru', '2003-5-14', null, N'�����������', null),
        (default, N'����', N'��������', 'asfskkk_f@tut.by', '2002-8-13', null, N'�������', null)

--delete from Users
--dbcc checkident('Users', reseed, 0)

insert into UserBooks
values  (default, 
		(select Id from Users where FirstName = N'����' and LastName = N'����������'),
		(select Id from Books where Name = N'CLR via C#'),
		NULL),
        (default, 
		(select Id from Users where FirstName = N'����' and LastName = N'����������'),
		(select Id from Books where Name = N'������ � �������� C++'),
		NULL),
        (default, 
		(select Id from Users where FirstName = N'����' and LastName = N'���������'),
		(select Id from Books where Name = N'������ � ���������'),
		NULL),
        (default, 
		(select Id from Users where FirstName = N'����' and LastName = N'������'),
		(select Id from Books where Name = N'JavaTM'),
		NULL),
        (default, 
		(select Id from Users where FirstName = N'����' and LastName = N'��������'),
		(select Id from Books where Name = N'���������'),
		NULL)