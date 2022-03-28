select * from loan
join Book on Book.book_id = loan.book_id
join customer on customer.library_card_id = loan.customer_id
where loan.book_id = 15;