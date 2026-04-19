-- tests/no_negative_values.sql
select *
from `default`.`stg_orders`
where order_value < 0