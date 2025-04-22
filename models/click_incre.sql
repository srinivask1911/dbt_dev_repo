{{ config(
    materialized='incremental',
    unique_key='click_id',
    incremental_strategy='merge',
    on_schema_change='append_new_columns'
) }}


with click_incre as (
    select
        click_id,
        user_id,
        ip_address,
        DATE(clicked_at) as click_day,
        COUNT(*) as click_count
    from {{ source('src_testdb', 'clicks') }}
    {% if is_incremental() %}
        where
            DATE(clicked_at) >= (select DATEADD(day, -1, MAX(click_day)) from {{ this }})
    {% endif %}
    group by click_id, user_id, click_day, ip_address
)

select *
from click_incre
