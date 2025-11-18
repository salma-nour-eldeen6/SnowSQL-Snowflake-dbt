{{ config(materialized='view') }}

WITH raw AS (
    SELECT *
    FROM {{ source('raw', 'raw_product_reviews') }}
)

SELECT
    review_id,
    product_id,
    customer_id,
    rating,
    review_text,
    review_date
FROM raw
WHERE rating BETWEEN 1 AND 5
