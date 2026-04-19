
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select delivery_time_min
from `default`.`stg_delivery`
where delivery_time_min is null



  
  
    ) dbt_internal_test