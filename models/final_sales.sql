{{
    config(
        materialized="table", tags=["daily", "final"], database="T01", schema="TS02"
    )
}}

with
final_sales as (
    select
        INITCAP(customer_name) as customer_name,
        TRY_TO_DATE(order_date) AS order_date,
        INITCAP(item) as items,
        CAST(REGEXP_REPLACE(amount, '[^0-9]', '') as int) as amount
    from {{ ref("stg_sales") }}
    where order_date is not null

)

select *
from final_sales
