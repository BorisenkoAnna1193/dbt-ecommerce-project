
  
    
    

    create  table
      "dev"."main"."dim_customers__dbt_tmp"
  
    as (
      select
    customer_age,
    city,
    avg(customer_rating) as avg_rating,
    count(*) as total_orders
from "dev"."main"."stg_customers"
group by 1,2
    );
  
  