
  
    
    
    
        
         


        insert into `default`.`stg_delivery`
        ("order_id", "delivery_time_min", "distance_km", "delivery_rating")select
    Order_ID as order_id,
    Delivery_Time_Min as delivery_time_min,
    Distance_Km as distance_km,
    Delivery_Partner_Rating as delivery_rating
from `default`.`quick_commerce`
  