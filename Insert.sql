use Library

insert into Authors
values  (default, N'Михаил', N'Булгаков', N'Россия', '1891-5-15'),
		(default, N'Лев', N'Толстой', N'Россия', '1910-9-9'),
		(default, N'Джон', N'Толкин', N'ЮАР', '1892-1-3'),
		(default, N'Самуил', N'Маршак', N'Россия', '1887-11-3'),
		(default, N'Бьёрн', N'Страуструп', N'Дания', '1950-12-30'),
		(default, N'Джеймс', N'Гослинг', N'Канада', '1955-5-19'),
		(default, N'Джеффри', N'Рихтер', N'США', '1964-7-27'),
		(default, N'Энди', N'Уир', N'США', '1972-6-16')	

--delete from Authors
--dbcc checkident('Authors', reseed, 0)

insert into Books
values  (default, N'Мастер и Маргарита',
	    (select Id from Authors where FirstName = N'Михаил' and LastName = N'Булгаков'),
		1967),
		(default, N'Собачье сердце',
	    (select Id from Authors where FirstName = N'Михаил' and LastName = N'Булгаков'),
		1925),
		(default, N'Война и мир',
	    (select Id from Authors where FirstName = N'Лев' and LastName = N'Толстой'),
		1865),
		(default, N'Детстчво',
	    (select Id from Authors where FirstName = N'Лев' and LastName = N'Толстой'),
		1852),
		(default, N'Властелин колец',
	    (select Id from Authors where FirstName = N'Джон' and LastName = N'Толкин'),
		1954),
		(default, N'Боевульф',
	    (select Id from Authors where FirstName = N'Джон' and LastName = N'Толкин'),
		2014),
		(default, N'Багаж',
	    (select Id from Authors where FirstName = N'Самуил' and LastName = N'Маршак'),
		1926),
		(default, N'Дизайн и эволюция C++',
	    (select Id from Authors where FirstName = N'Бьёрн' and LastName = N'Страуструп'),
		1994),
		(default, N'JavaTM',
	    (select Id from Authors where FirstName = N'Джеймс' and LastName = N'Гослинг'),
		1994),
		(default, N'CLR via C#',
	    (select Id from Authors where FirstName = N'Джеффри' and LastName = N'Рихтер'),
		1994),
		(default, N'Марсианин',
	    (select Id from Authors where FirstName = N'Энди' and LastName = N'Уир'),
		1994)

--delete from Books
--dbcc checkident('Books', reseed, 0)
		
insert into Users
values  (default, N'Илья', N'Добринский', 'asfsf@gmail.com', '2002-5-8', null, N'Казинца', null),
        (default, N'Дима', N'Иванов', 'asfdjksllsf@gmail.com', '2003-6-6', null, N'Большой тростинец', null),
        (default, N'Даша', N'Семенцова', 'asf@mail.ru', '2003-5-14', null, N'Тимирязьева', null),
        (default, N'Катя', N'Смирнова', 'asfskkk_f@tut.by', '2002-8-13', null, N'Казинца', null)

--delete from Users
--dbcc checkident('Users', reseed, 0)

insert into UserBooks
values  (default, 
		(select Id from Users where FirstName = N'Илья' and LastName = N'Добринский'),
		(select Id from Books where Name = N'CLR via C#'),
		NULL),
        (default, 
		(select Id from Users where FirstName = N'Илья' and LastName = N'Добринский'),
		(select Id from Books where Name = N'Дизайн и эволюция C++'),
		NULL),
        (default, 
		(select Id from Users where FirstName = N'Даша' and LastName = N'Семенцова'),
		(select Id from Books where Name = N'Мастер и Маргарита'),
		NULL),
        (default, 
		(select Id from Users where FirstName = N'Дима' and LastName = N'Иванов'),
		(select Id from Books where Name = N'JavaTM'),
		NULL),
        (default, 
		(select Id from Users where FirstName = N'Катя' and LastName = N'Смирнова'),
		(select Id from Books where Name = N'Марсианин'),
		NULL)