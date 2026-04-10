-- int_orders_enriched.sql
select
    o.order_id,
    o.company,
    o.city,
    o.order_value,
    o.product_category,
    o.payment_method,
    d.delivery_time_min,
    d.distance_km,
    d.delivery_rating
from {{ ref('stg_orders') }} o
left join {{ ref('stg_delivery') }} d
    on o.order_id = d.order_id