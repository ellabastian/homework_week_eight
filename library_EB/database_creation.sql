-- create database library; 

-- use library;
-- -- create table books (
-- -- book_id int not null auto_increment primary key,
-- -- title varchar(150) not null,
-- -- author_id int not null,
-- -- foreign key (author_id) 
-- -- references author(author_id),
-- -- year_published int not null
-- -- );

-- -- create table author (
-- -- author_id int not null auto_increment primary key,
-- -- first_name varchar(150) not null,
-- -- second_name varchar(150) not null);

-- -- insert into author(first_name, second_name)
-- -- values("F. Scott", "Fitzgerald"),
-- -- ("Dan", "Brown"),
-- -- ("E. L.", "Grey"),
-- -- ("J. K.", "Rowling"),
-- -- ("Stephanie", "Meyer");

-- select * from books;

-- insert into books(title, author_id, year_published)
-- values("The Great Gatsby", 1, 1925),
-- ("The Da Vinci Code", 2, 2003),
-- ("Fifty Shades of Grey", 3, 2011),
-- ("Harry Potter and the Goblet of Fire", 4, 2000),
-- ("New Moon", 5, 2006); 

-- create table customer_address (
-- address_id int not null auto_increment primary key,
-- address varchar(1500) not null);

-- insert into customer_address(address)
-- values("4 Mountain Drive, Essex, RM4 3JZ"),
-- ("6 Regents Street, London, W12 4EZ"),
-- ("23 Strafford Avenue, Essex, IG5 6JQ"),
-- ("54 Gordon Avenue, Southampton, SO15 $RQ");

-- select * from customer_info;

-- create table customer_info(
-- customer_id int not null auto_increment primary key,
-- first_name varchar(500) not null,
-- second_name varchar(500) not null,
-- address_id int not null,
-- foreign key (address_id)
-- references customer_address(address_id)
-- );

-- insert into customer_info(first_name, second_name, address_id)
-- values("Danielle", "Bastian", 2);

select * from books;

create table loans(
loan_id int not null auto_increment primary key,
customer_id int not null,
foreign key (customer_id)
references customer_info(customer_id),
book_id int not null,
foreign key (book_id)
references books(book_id),
loan_date date not null,
due_date date not null,
return_date date not null);

select * from loans;

insert into loans(customer_id, book_id, loan_date, due_date, return_date)
values(2, 1, 20220301, 20220422, null),
(1, 4, 20220110, 20220205, 20220204),
(3, 4, 20220202, 20220304, null);

create table fines(
fine_id int not null auto_increment primary key,
customer_id int not null,
foreign key (customer_id)
references customer_info(customer_id),
loan_id int not null,
foreign key (loan_id)
references loans(loan_id),
fine_date date not null,
fine_amount float(2) not null,
payment_date date
);

select * from fines;
insert into fines (customer_id, loan_id, fine_date, fine_amount, payment_date)
values(2, 1, 20220423, 1.20, null),
(3, 3, 20220305, 2.60, null);



