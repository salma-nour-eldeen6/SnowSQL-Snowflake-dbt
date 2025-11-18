{{ config(materialized='table') }}

WITH src AS (
    SELECT *,
           ROW_NUMBER() OVER (ORDER BY product_id) AS product_key
    FROM {{ ref('stg_products') }}
)

SELECT
    product_key,
    product_id,
    product_name,
    category,
    brand,
    price
FROM src
