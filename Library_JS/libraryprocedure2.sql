delimiter //

create procedure searchBorrowedBookbyID
(IN bookID int)
begin
select customer.first_name from loan
join Book on Book.book_id = loan.book_id
join customer on customer.library_card_id = loan.customer_id
where loan.book_id = bookID;
end //
delimiter ;



CALL searchBorrowedBookbyID(15);

