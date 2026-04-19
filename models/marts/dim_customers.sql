{{ config(
    materialized='table',
    engine='MergeTree()',
    order_by='(city, customer_age)'
) }}

select
    customer_age,
    city,
    avg(customer_rating) as avg_rating,
    count(*) as total_orders
from {{ ref('stg_customers') }}
group by customer_age, city