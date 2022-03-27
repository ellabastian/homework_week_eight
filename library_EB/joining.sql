use library;

select * from books;
select * from author;

select 
books.title,
author.first_name, author.second_name
from
books
inner join
author
on
books.author_id = author.author_id

