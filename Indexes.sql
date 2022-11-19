use Library

create unique nonclustered index IX_UserId_BookId
on UserBooks(UserId asc, BookId asc)

create unique nonclustered index IX_Name_AuthorId
on Books(Name asc, AuthorId asc)

create unique nonclustered index IX_FirstName_LastName_Country
on Authors(FirstName asc, LastName asc, Country asc)