
  
  create view "dev"."main"."int_orders_enriched__dbt_tmp" as (
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
from "dev"."main"."stg_orders" o
left join "dev"."main"."stg_delivery" d
    on o.order_id = d.order_id
  );
