delimiter $$

create procedure GetCustomer()
begin
select
first_name,
second_name
from
customer_info
order by first_name;
end$$

delimiter ;


    
    
		