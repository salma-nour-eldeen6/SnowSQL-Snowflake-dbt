{% snapshot product_reviews_snapshot %}
{{
    config(
        target_schema='snapshots',
        unique_key='review_id',
        strategy='timestamp',
        updated_at='review_date'
    )
}}

SELECT
    review_id,
    product_id,
    customer_id,
    rating,
    review_text,
    review_date
FROM {{ ref('stg_product_reviews') }}

{% endsnapshot %}
