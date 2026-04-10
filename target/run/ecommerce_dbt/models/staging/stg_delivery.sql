
  
  create view "dev"."main"."stg_delivery__dbt_tmp" as (
    select
    Order_ID as order_id,
    Delivery_Time_Min as delivery_time_min,
    Distance_Km as distance_km,
    Delivery_Partner_Rating as delivery_rating
from "dev"."main"."quick_commerce"
  );
