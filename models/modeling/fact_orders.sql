{{ config(materialized='table') }}

WITH order_items_stg AS (
    SELECT *
    FROM {{ ref('stg_order_items') }}
),
orders_stg AS (
    SELECT *
    FROM {{ ref('stg_orders') }}
),
joined AS (
    SELECT 
        oi.order_item_id AS order_item_key,
        o.order_id,
        c.customer_key,
        p.product_key,
        d.date_key AS order_date_key,
        pm.payment_method_key,
        oi.quantity,
        oi.unit_price,
        oi.quantity * oi.unit_price AS total_amount
    FROM order_items_stg oi
    JOIN orders_stg o ON oi.order_id = o.order_id
    JOIN {{ ref('dim_customers') }} c ON o.customer_id = c.customer_id
    JOIN {{ ref('dim_products') }} p ON oi.product_id = p.product_id
    JOIN {{ ref('dim_date') }} d ON o.order_date = d.full_date
    JOIN {{ ref('dim_payment_methods') }} pm ON o.payment_method = pm.payment_method_name
)

SELECT * FROM joined
