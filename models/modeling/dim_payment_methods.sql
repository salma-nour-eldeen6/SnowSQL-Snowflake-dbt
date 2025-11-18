{{ config(materialized='table') }}

WITH src AS (
    SELECT DISTINCT
           payment_method AS payment_method_name,
           ROW_NUMBER() OVER (ORDER BY payment_method) AS payment_method_key
    FROM {{ ref('stg_orders') }}
)

SELECT *
FROM src
