{% snapshot customers_snapshot %}
{{
    config(
        target_schema='snapshots',
        unique_key='customer_id',
        strategy='timestamp',
        updated_at='signup_date'
    )
}}

SELECT
    customer_id,
    name,
    email,
    gender,
    signup_date,
    country
FROM {{ ref('stg_customers') }}

{% endsnapshot %}
