
  
    
    
    
        
         


        insert into `default`.`stg_customers`
        ("customer_id", "customer_age", "city", "customer_rating")select
    row_number() over () as customer_id,
    Customer_Age as customer_age,
    City as city,
    Customer_Rating as customer_rating
from `default`.`quick_commerce`
  