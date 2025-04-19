{{ config( materialized = 'view') }}

select 
CUSTOMER_NAME,
coalesce(order_date, 'Unknown') as order_date,
items,
amount
from {{ ref('final_sales')}}