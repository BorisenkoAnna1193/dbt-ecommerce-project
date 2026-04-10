select
    customer_age,
    city,
    avg(customer_rating) as avg_rating,
    count(*) as total_orders
from "dev"."main"."stg_customers"
group by 1,2