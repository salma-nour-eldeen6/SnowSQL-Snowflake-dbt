{% snapshot orders_snapshot %}
{{
    config(
        target_schema='snapshots',
        unique_key='order_id',
        strategy='timestamp',
        updated_at='order_date'
    )
}}

SELECT
    order_id,
    customer_id,
    order_date,
    total_amount,
    payment_method,
    shipping_country
FROM {{ ref('stg_orders') }}

{% endsnapshot %}
