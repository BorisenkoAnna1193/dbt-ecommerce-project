
  
    
    
    
        
         


        insert into `default`.`kpi_metrics`
        ("city", "company", "total_orders", "avg_order_value", "avg_delivery_time")

select
    city,
    company,
    count() as total_orders,
    avg(order_value) as avg_order_value,
    avg(delivery_time_min) as avg_delivery_time
from `default`.`int_orders_enriched`
group by city, company
  