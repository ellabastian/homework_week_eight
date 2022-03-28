use library;

-- join tables 
select *
from Book
join
author
on book.author = author.author_id;

