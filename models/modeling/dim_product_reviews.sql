{{ config(materialized='table') }}

WITH src AS (
    SELECT *,
           ROW_NUMBER() OVER (ORDER BY review_id) AS review_key
    FROM {{ ref('stg_product_reviews') }} pr
    JOIN {{ ref('dim_products') }} p ON pr.product_id = p.product_id
    JOIN {{ ref('dim_customers') }} c ON pr.customer_id = c.customer_id
)

SELECT
    review_key,
    review_id,
    product_key,
    customer_key,
    rating,
    review_text,
    review_date
FROM src
