{{ config(materialized='table') }}

WITH src AS (
    SELECT DISTINCT
           order_date AS full_date,
           EXTRACT(DAYOFWEEK FROM order_date) AS day_of_week,
           EXTRACT(MONTH FROM order_date) AS month,
           EXTRACT(QUARTER FROM order_date) AS quarter,
           EXTRACT(YEAR FROM order_date) AS year
    FROM {{ ref('stg_orders') }}
),
with_key AS (
    SELECT *,
           ROW_NUMBER() OVER (ORDER BY full_date) AS date_key
    FROM src
)

SELECT
    date_key,
    full_date,
    day_of_week,
    month,
    quarter,
    year
FROM with_key
