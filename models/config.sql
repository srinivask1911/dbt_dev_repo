{{ config(materialized = 'table') }}    -- It'll goining to store as table

{{ config(materialized = 'view') }}     -- It'll goining to store as view

{{ config(materialized = 'incremental') }}  -- It'll goining to store as incremental base


{{ config(
    materialized = 'table',
    database = 'T01',
    schema = 'TS01',
    tags = ['daily','weekly','monthly'],
    cluster_by = ['city']
    ) }}