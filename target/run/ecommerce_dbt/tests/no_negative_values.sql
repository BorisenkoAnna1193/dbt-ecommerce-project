
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  -- tests/no_negative_values.sql
select *
from `default`.`stg_orders`
where order_value < 0
  
  
    ) dbt_internal_test