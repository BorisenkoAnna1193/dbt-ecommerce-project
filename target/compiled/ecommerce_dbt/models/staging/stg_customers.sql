select
    row_number() over () as customer_id,
    Customer_Age as customer_age,
    City as city,
    Customer_Rating as customer_rating
from "dev"."main"."quick_commerce"