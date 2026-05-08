select *
from (
    select *,
           row_number() over (partition by customer_id order by first_order desc) as rn
    from customers
) t
where rn = 1