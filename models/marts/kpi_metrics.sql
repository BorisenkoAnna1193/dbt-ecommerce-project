{{ config(
    materialized='table',
    engine='MergeTree()',
    order_by='(city, company)'
) }}

select
    city,
    company,
    count() as total_orders,
    avg(order_value) as avg_order_value,
    avg(delivery_time_min) as avg_delivery_time
from {{ ref('int_orders_enriched') }}
group by city, company