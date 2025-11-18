{{ config(materialized='view') }}

WITH raw AS (
    SELECT *
    FROM {{ source('raw', 'raw_orders') }}
)

SELECT
    order_id,
    customer_id,
    order_date,
    total_amount,
    payment_method,
    shipping_country
FROM raw
WHERE order_id IS NOT NULL
