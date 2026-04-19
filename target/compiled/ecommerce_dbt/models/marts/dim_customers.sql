

select
    customer_age,
    city,
    avg(customer_rating) as avg_rating,
    count(*) as total_orders
from `default`.`stg_customers`
group by customer_age, city