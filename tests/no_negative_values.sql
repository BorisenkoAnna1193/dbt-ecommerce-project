-- tests/no_negative_values.sql
select *
from {{ ref('stg_orders') }}
where order_value < 0