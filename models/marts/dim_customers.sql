select
    customer_age,
    city,
    avg(customer_rating) as avg_rating,
    count(*) as total_orders
from {{ ref('stg_customers') }}
group by 1,2