select *
from (
    select *,
           row_number() over (partition by order_id order by created_at desc) as rn
    from orders
) t
where rn = 1