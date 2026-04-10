
  
    
    

    create  table
      "dev"."main"."kpi_metrics__dbt_tmp"
  
    as (
      select
    city,
    company,
    count(order_id) as total_orders,
    avg(order_value) as avg_order_value,
    avg(delivery_time_min) as avg_delivery_time
from "dev"."main"."int_orders_enriched"
group by 1,2
    );
  
  