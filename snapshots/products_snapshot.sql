{% snapshot products_snapshot %}
{{
    config(
        target_schema='snapshots',
        unique_key='product_id',
        strategy='timestamp',
        updated_at='price'
    )
}}

SELECT
    product_id,
    product_name,
    category,
    brand,
    price,
    stock_quantity
FROM {{ ref('stg_products') }}

{% endsnapshot %}
