{{
    config( materialized = 'table')
}}

select *  from {{ source('src_testdb','sales') }}



