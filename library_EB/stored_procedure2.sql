delimiter $$

create procedure GetCustomerFine()
begin
select customer_info.first_name, customer_info.second_name,
fines.fine_date, fines.fine_amount, fines.payment_date
from customer_info
join fines on fines.customer_id = customer_info.customer_id
order by fine_amount;
end$$

delimiter ;

call GetCustomerFine()
