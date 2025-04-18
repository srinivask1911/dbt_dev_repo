{{
    config(
        materialized="table", tags=["daily", "final"], database="T01", schema="TS02"
    )
}}

with
final_sales as (
    select
        INITCAP(customer_name) as customer_name,
        CASE 
        WHEN {{ order_date_column }} LIKE '[0-1][0-9]-[0-1][0-9]-[0-9][0-9]' THEN 
            TRY_TO_DATE({{ order_date_column }}, 'MM-DD-YY')         -- 12-03-23
        WHEN {{ order_date_column }} LIKE '[0-9][0-9][0-9][0-9]/[0-1][0-9]/[0-3][0-9]' THEN 
            TRY_TO_DATE({{ order_date_column }}, 'YYYY/MM/DD')       -- 2023/03/12
        WHEN {{ order_date_column }} LIKE '[0-1][0-9]/[0-3][0-9]/[0-9][0-9][0-9][0-9]' THEN 
            TRY_TO_DATE({{ order_date_column }}, 'MM/DD/YYYY')       -- 03/15/2023
        ELSE 
            TRY_TO_DATE({{ order_date_column }})                     -- Fallback for any other format
    END AS order_date,
        INITCAP(item) as items,
        CAST(REGEXP_REPLACE(amount, '[^0-9]', '') as int) as amount
    from {{ ref("stg_sales") }}

)

select *
from final_sales
