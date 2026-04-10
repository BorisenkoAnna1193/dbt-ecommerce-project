
  
    
    

    create  table
      "dev"."main"."fct_orders__dbt_tmp"
  
    as (
      select
    order_id,
    company,
    city,
    order_value,
    delivery_time_min,
    distance_km
from "dev"."main"."int_orders_enriched"
    );
  
  