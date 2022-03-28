-- create database library;

use library;

/*
create table Author
(
-- column name datatype options null/not null
AuthorID int not null auto_increment primary key,
LastName varchar (200) not null,
FirstName varchar (200) not null
);

create table Book
(
-- column name datatype options null/not null
BookID int not null auto_increment primary key,
ISBN int not null,
AuthorID int not null,
foreign key (AuthorID) references Author(AuthorID),
Title varchar(200) not null,
PublicationYear int not null,
NoCopies int not null
);

create table Genre
(
-- column name datatype options null/not null
GenreID int not null auto_increment primary key,
Genre varchar(200) not null
);


create table BookGenre
(
-- column name datatype options null/not null
BookID int not null, 
GenreID int not null,
foreign key (BookID) references Book(BookID),
foreign key (GenreID) references Genre(GenreID)
);

create table Address
(
AddressID int not null auto_increment primary key,
Address varchar (300)
);

create table Member
(
-- column name datatype options null/not null
MemberID int not null auto_increment primary key,
LastName varchar (200) not null,
FirstName varchar (200) not null,
AddressID int not null,
foreign key (AddressID) references Address(AddressID),
JoinedDate int not null
);

create table Loan
(
-- column name datatype options null/not null
LoanID int not null auto_increment primary key,
MemberID int not null,
BookID int not null,
foreign key (MemberID) references Member(MemberID),
foreign key (BookID) references Book(BookID),
LoanDate int not null,
DueDate int not null,
ReturnDate int null
);

insert into Author(LastName, FirstName)
values('Brite', 'Poppy Z'),
('Gibson', 'William'),
('Morrison', 'Toni'),
('Kaur', 'Rupi'),
('Huxley', 'Aldous');


insert into Book (ISBN, AuthorID, Title, PublicationYear, NoCopies)
values (1-84356-028-1, 3, 'Beloved', 1987, 2),
(1-84356-028-1, 5, 'Brave New World', 1932, 4),
(1-84356-028-3, 1, 'Lost Souls', 1992, 1),
(1-84356-028-4, 4, 'Milk and Honey', 2014, 1),
(1-84356-028-6, 2, 'Neuromancer', 1984, 1);

*/

select *
from Author;

select *
from Book;

-- Joining Tables
-- inner join
select 
Book.Title,
Author.LastName, Author.FirstName
from
Book
inner join
Author
on
Book.AuthorID = Author.AuthorID

-- Stored Procedures


Learn MySQL: The Basics of MySQL Stored Procedures
January 8, 2021 by Nisarg Upadhyay
ApexSQL pricing
In this article, we are going to learn about the stored procedures in MySQL. In this article, I am covering the basics of the stored procedure that includes the following

Summary of MySQL Stored Procedure
Create a stored procedure using Query and MySQL workbench
Create a Parameterized stored procedure
Drop the Stored Procedure using query and MySQL workbench
The stored procedure is SQL statements wrapped within the CREATE PROCEDURE statement. The stored procedure may contain a conditional statement like IF or CASE or the Loops. The stored procedure can also execute another stored procedure or a function that modularizes the code.

Following are the benefits of a stored procedure:

Reduce the Network Traffic: Multiple SQL Statements are encapsulated in a stored procedure. When you execute it, instead of sending multiple queries, we are sending only the name and the parameters of the stored procedure
Easy to maintain: The stored procedure are reusable. We can implement the business logic within an SP, and it can be used by applications multiple times, or different modules of an application can use the same procedure. This way, a stored procedure makes the database more consistent. If any change is required, you need to make a change in the stored procedure only
Secure: The stored procedures are more secure than the AdHoc queries. The permission can be granted to the user to execute the stored procedure without giving permission to the tables used in the stored procedure. The stored procedure helps to prevent the database from SQL Injection
The syntax to create a MySQL Stored procedure is the following:

Create Procedure [Procedure Name] ([Parameter 1], [Parameter 2], [Parameter 3] )
Begin
SQL Queries..
End

In the syntax:

The name of the procedure must be specified after the Create Procedure keyword
After the name of the procedure, the list of parameters must be specified in the parenthesis. The parameter list must be comma-separated
The SQL Queries and code must be written between BEGIN and END keywords
To execute the store procedure, you can use the CALL keyword. Below is syntax:

CALL [Procedure Name] ([Parameters]..)

In the syntax:

The procedure name must be specified after the CALL keyword
If the procedure has the parameters, then the parameter values must be specified in the parenthesis
Let us create a basic stored procedure. For demonstration, I am using the sakila database.

Create a simple stored procedure
Suppose you want to populate the list of films. The output should contain film_id, title, description, release year, and rating column. The code of the procedure is the following:

DELIMITER //
CREATE PROCEDURE SearchBookByTitle
(IN TitleInput varchar (200))
BEGIN
select * from Book
where TitleInput = Title;
    
END //
    
DELIMITER ;

Call SearchBookByTitle ('Beloved')