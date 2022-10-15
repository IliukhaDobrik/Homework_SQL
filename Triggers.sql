use Library

create or alter trigger AddCreateedDate
	on UserBooks
	after insert
	as update UserBooks
		set CreatedDate = getdate()
		where Id in (select Id from inserted);

create or alter trigger AddExpiredDate
	on Users
	after insert
	as update Users
		set ExpiredDate = getdate() + year(1)
		where Id in (select Id from inserted)

create or alter trigger AddAge
	on Users
	after insert, update
	as update Users
		set Age = DATEDIFF(month, getdate(), BirthDate) / 12
		where Id in (select Id from inserted)
