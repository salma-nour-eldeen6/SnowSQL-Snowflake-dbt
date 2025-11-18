SELECT *
FROM {{ ref('dim_product_reviews') }}
WHERE review_text IS NULL OR TRIM(review_text) = ''
