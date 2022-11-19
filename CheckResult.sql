use Library

exec GiveBookToUser 'asfsf@gmail.com', N'Самуил', N'Маршак', N'Багаж'

drop trigger AddCreateedDate
drop trigger AddExpiredDate

update Users
	set ExpiredDate = '2020-11-19'
	where Email = 'asfsf@gmail.com'

exec ReturnBook 'asfsf@gmail.com', N'Самуил', N'Маршак', N'Багаж'
exec ReturnBook 'asfskkk_f@tut.by', N'Энди', N'Уир', N'Марсианин'

update UserBooks
	set CreatedDate = '2022-11-19'
	where UserId = (select Id from Users where Email = 'asfsf@gmail.com')

exec ReturnBook 'asfsf@gmail.com', N'Джеффри', N'Рихтер', N'CLR via C#'