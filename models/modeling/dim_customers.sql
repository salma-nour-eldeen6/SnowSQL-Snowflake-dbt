{{ config(materialized='table') }}

WITH src AS (
    SELECT *,
           ROW_NUMBER() OVER (ORDER BY customer_id) AS customer_key
    FROM {{ ref('stg_customers') }}
)

SELECT
    customer_key,
    customer_id,
    name,
    email,
    gender,
    signup_date,
    country
FROM src
