{% snapshot orders_snapshot %}

    {{
        config(
            target_schema='snapshots',
            unique_key='order_id',
            strategy='timestamp',
            updated_at='last_updated',
            invalidate_hard_deletes=true
        )
    }}

    SELECT
        order_id,
        customer_id,
        order_amount,
        order_status,
        last_updated
    FROM {{ source('src_testdb', 'orders') }}

{% endsnapshot %}