-- tests/no_negative_values.sql
select *
from "dev"."main"."stg_orders"
where order_value < 0