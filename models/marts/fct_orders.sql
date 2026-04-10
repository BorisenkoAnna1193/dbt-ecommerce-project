select
    order_id,
    company,
    city,
    order_value,
    delivery_time_min,
    distance_km
from {{ ref('int_orders_enriched') }}