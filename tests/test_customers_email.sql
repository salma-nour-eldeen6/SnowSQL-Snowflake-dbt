SELECT *
FROM {{ ref('dim_customers') }}
WHERE email NOT LIKE '%@%'
