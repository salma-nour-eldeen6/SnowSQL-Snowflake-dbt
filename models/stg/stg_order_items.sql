{{ config(materialized='view') }}

WITH raw AS (
    SELECT *
    FROM {{ source('raw', 'raw_order_items') }}
)

SELECT
    order_item_id,
    order_id,
    product_id,
    quantity,
    unit_price
FROM raw
WHERE quantity > 0
