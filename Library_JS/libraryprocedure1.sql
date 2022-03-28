delimiter //

create procedure searchAuthorByFirstName
(IN author_name varchar(50))
begin
select * from Author
where first_name = author_name; 
end //
delimiter ;

CALL searchAuthorByFirstName('Leo')