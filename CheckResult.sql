use Library

exec GiveBookToUser 'asfsf@gmail.com', N'������', N'������', N'�����'

drop trigger AddCreateedDate
drop trigger AddExpiredDate

update Users
	set ExpiredDate = '2020-11-19'
	where Email = 'asfsf@gmail.com'

exec ReturnBook 'asfsf@gmail.com', N'������', N'������', N'�����'
exec ReturnBook 'asfskkk_f@tut.by', N'����', N'���', N'���������'

update UserBooks
	set CreatedDate = '2022-11-19'
	where UserId = (select Id from Users where Email = 'asfsf@gmail.com')

exec ReturnBook 'asfsf@gmail.com', N'�������', N'������', N'CLR via C#'