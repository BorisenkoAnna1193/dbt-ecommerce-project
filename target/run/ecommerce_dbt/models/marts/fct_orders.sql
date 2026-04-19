
  
    
    
    
        
         


        insert into `default`.`fct_orders`
        ("order_id", "company", "city", "order_value", "delivery_time_min", "distance_km")

select
    toUInt64(order_id) as order_id,
    company,
    city,
    toFloat64(order_value) as order_value,
    toFloat64(delivery_time_min) as delivery_time_min,
    toFloat64(distance_km) as distance_km
from `default`.`int_orders_enriched`
  