{% snapshot order_items_snapshot %}
{{
    config(
        target_schema='snapshots',
        unique_key='order_item_id',
        strategy='timestamp',
        updated_at='unit_price'
    )
}}

SELECT
    order_item_id,
    order_id,
    product_id,
    quantity,
    unit_price
FROM {{ ref('stg_order_items') }}

{% endsnapshot %}
