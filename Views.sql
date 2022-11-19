use Library

create or alter view UserInfo
as 
	select  U.Id as UserId, 
			U.FirstName + ' ' + U.LastName as UserFullName,
			U.Age as UserAge,
			A.FirstName + ' ' + A.LastName as AuthorFullName,
			B.Name as BookName,
			B.Year as BookYear
	from UserBooks UB
			join Users U on UB.UserId = U.Id
			join Books B on UB.BookId = B.Id
			join Authors A on B.AuthorId = A.Id