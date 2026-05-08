with source as (

    select *
    from {{ source('forma_active', 'products') }}

),

cleaned as (

    select
        *,
        row_number() over (
            partition by product_id
            order by product_id
        ) as rn
    from source
    where product_id is not null

)

select
    product_id,
    variant_id,
    title,
    price
from cleaned
where rn = 1