
  
    
    
    
        
         


        insert into `default`.`stg_orders`
        ("order_id", "company", "city", "order_value", "items_count", "product_category", "payment_method", "discount_applied")select
    Order_ID as order_id,
    Company as company,
    City as city,
    Order_Value as order_value,
    Items_Count as items_count,
    Product_Category as product_category,
    Payment_Method as payment_method,
    Discount_Applied as discount_applied
from `default`.`quick_commerce`
  