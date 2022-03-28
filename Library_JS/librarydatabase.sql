create database library;
use library;

create table Book(
	book_id int not null auto_increment primary key,
    title varchar(100) not null,
    author int not null,
    foreign key (author) references Author(author_id),
    publication_year int,
    copies_owned int);
    
create table Author(
author_id int not null auto_increment primary key,
first_name varchar(50) not null,
last_name varchar(50) not null);

create table BookAuthor(
	book_id int not null,
    author_id int not null,
	foreign key (book_id) references Book(book_id),
    foreign key (author_id) references Author(author_id));
    
create table customer(
	library_card_id int not null auto_increment primary key,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    join_date varchar(15) not null,
    status varchar(15) not null);
    
create table loan(
	loan_transaction_id int not null auto_increment primary key,
    book_id int not null,
    customer_id int not null,
    foreign key (book_id) references Book(book_id),
    foreign key (customer_id) references Customer(library_card_id),
	loan_date varchar(15) not null
    );
    
create table fine(
	fine_id int not null auto_increment primary key,
    customer_id int not null,
    loan_id int not null,
    foreign key (customer_id) references Customer(library_card_id),
    foreign key (loan_id) references loan(loan_transaction_id),
    fine_date varchar(15) null,
    fine_amount int null);

select * from book;

insert into book(title, author, publication_year, copies_owned)
values('Anna Karenina', 1, 1878, 12),
('Madame Bovary', 2, 1856, 3),
('War and Peace', 1, 1869, 433),
('The Great Gatsby', 3, 1925, 54),
('Lolita', 4, 1955, 106),
('Middlemarch', 5, 1871, 34),
('The Adventures of Huckleberry Finn', 6, 1884, 23),
('The Stories of Anton Chekhov', 7, 1932, 43),
('In Search of Lost Time', 8, 1913, 7);

insert into author(first_name, last_name)
values('Leo', 'Tolstoy'),
('Gustave', 'Flaubert'),
('F.Scott', 'Fitzgerald'),
('Vladimir', 'Nabokov'),
('George', 'Eliot'),
('Mark', 'Twain'),
('Anton', 'Chekhov'),
('Marcel', 'Proust');

select * from author

select * from BookAuthor

insert into customer(first_name, last_name, join_date, status)
values('Liam', 'Smith', '09/01/2003', 'Closed'),
('Oliver', 'Johnson', '01/10/2020', 'Active'),
('Ava', 'Williams', '12/04/1998', 'Active'),
('William', 'Brown', '22/04/2021', 'Active'),
('Isabella', 'Jones', '13/11/2005', 'Closed'),
('Amelia', 'Garcia', '17/08/2018', 'Active');

insert into loan(book_id, customer_id, loan_date)
values(11, 3, '05/01/2020'),
(16, 1, '13/11/2021'),
(15, 6, '30/01/2022'),
(12, 4, '12/02/2022');

select * from loan


