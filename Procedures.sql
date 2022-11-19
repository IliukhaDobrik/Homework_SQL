create or alter procedure DeleteUsersByExpiredDate 
as
begin
	declare @UsersWithBooks table
	(
		Id uniqueidentifier,
		FullName nvarchar(100),
		BookName nvarchar(50)
	)

	insert into @UsersWithBooks
		select UserId,
			UserFullName,
			BookName
		from UserInfo
			join 
				(select * from Users
				 where ExpiredDate < getdate()) as ExpiredUsers
			on UserInfo.UserId = ExpiredUsers.Id

	declare @CurrentUserId uniqueidentifier
	declare @CurrentUserFullName nvarchar(100)
	declare @CurrentUserBookName nvarchar(50)

	while exists (select * from @UsersWithBooks)
	begin
		select top(1)
			@CurrentUserId = Id,
			@CurrentUserFullName = FullName,
			@CurrentUserBookName = BookName
		from @UsersWithBooks

		if (@CurrentUserBookName is not null)
			print concat(@CurrentUserFullName, ' ', 'still has', ' ', @CurrentUserBookName)
		else 
			delete from Users 
			where Id = @CurrentUserId

		delete from @UsersWithBooks 
		where Id = @CurrentUserId
	end
end

create or alter procedure GiveBookToUser
	@UserEmail nvarchar(50),
	@AuthorFirstName nvarchar(50),
	@AuthorLastName nvarchar(50),
	@BookName nvarchar(50)
as
begin
	declare @UserId uniqueidentifier
	declare @BookId uniqueidentifier
	declare @AuthorId uniqueidentifier

	set @UserId = (select Id from Users where Email = @UserEmail)
	if (@UserId is null)
	begin
		print 'User not found!'
		return
	end

	set @AuthorId = (select Id from Authors 
					 where FirstName = @AuthorFirstName and LastName = @AuthorLastName)
	if (@AuthorId is null)
	begin
		print 'Author not found!'
		return
	end
	
	set @BookId = (select Id from Books where Name = @BookName and AuthorId = @AuthorId)
	if (@BookId is null)
	begin
		print 'Book not found!'
		return
	end

	if (@BookId = any(select BookId from UserBooks
					  where UserId = @UserId))
	begin
		print 'User already has this book'
		return
	end

	if (exists(select * from UserBooks
			   where BookId = @BookId))
	begin
		print 'This book already given to another user'
		return
	end

	insert into UserBooks values (default, @UserId, @BookId, null, null)
end

	insert into UserBooks values (default, @UserId, @BookId, null)
end

create or alter procedure ChangeUser
	@Email nvarchar(50),
	@BookId uniqueidentifier
as
begin
	declare @UserId uniqueidentifier
	declare @CreatedDate date

	set @UserId = (select Id from Users where Email = @Email)	
	set @CreatedDate = (select CreatedDate from UserBooks where BookId = @BookId)

	if (@UserId is null)
	begin
		print 'User not found'
		return
	end

	update UserBooks
		set ToCharge = dbo.GetCharge(@CreatedDate, null)
		where UserId = @UserId
end

create or alter procedure ReturnBook
	@Email nvarchar(50),
	@AuthorFirstName nvarchar(50),
	@AuthorLastName nvarchar(50),
	@BookName nvarchar(50)
as
begin
	declare @UserId uniqueidentifier
	declare @BookId uniqueidentifier
	declare @AuthorId uniqueidentifier
	declare @ChargeValue money

	set @UserId = (select Id from Users where Email = @Email)
	if (@UserId is null)
	begin
		print 'User not found!'
		return
	end

	set @AuthorId = (select Id from Authors 
					 where FirstName = @AuthorFirstName and LastName = @AuthorLastName)
	if (@AuthorId is null)
	begin
		print 'Author not found!'
		return
	end
	
	set @BookId = (select Id from Books where Name = @BookName and AuthorId = @AuthorId)
	if (@BookId is null)
	begin
		print 'Book not found!'
		return
	end

	exec ChangeUser @Email, @BookId

	set @ChargeValue = (select ToCharge from UserBooks 
						where UserId = @UserId and BookId = @BookId);

	print concat('User charge is', ' ', @ChargeValue);

	delete from UserBooks where UserId = @UserId and BookId = @BookId;
end