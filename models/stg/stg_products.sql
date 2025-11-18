{{ config(materialized='view') }}

WITH raw AS (
    SELECT *
    FROM {{ source('raw', 'raw_products') }}
)

SELECT
    product_id,
    product_name,
    category,
    price,
    stock_quantity,
    brand
FROM raw
WHERE product_id IS NOT NULL
