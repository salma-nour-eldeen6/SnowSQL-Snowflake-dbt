{{ config(materialized='view') }}

WITH raw AS (
    SELECT *
    FROM {{ source('raw', 'raw_customers') }}
)

SELECT
    customer_id,
    name,
    email,
    gender,
    signup_date,
    country
FROM raw
WHERE email IS NOT NULL
