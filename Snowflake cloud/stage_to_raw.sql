USE WAREHOUSE WH_ETL;

USE DATABASE ECOM;
USE SCHEMA RAW;

CREATE OR REPLACE FILE FORMAT PARQUET_FMT
TYPE = 'PARQUET';

COPY INTO raw_customers_variant
FROM @ecom_stage/customers.parquet
FILE_FORMAT = (FORMAT_NAME = 'PARQUET_FMT');

COPY INTO raw_products_variant
FROM @ecom_stage/products.parquet
FILE_FORMAT = (FORMAT_NAME = 'PARQUET_FMT');

COPY INTO raw_orders_variant
FROM @ecom_stage/orders.parquet
FILE_FORMAT = (FORMAT_NAME = 'PARQUET_FMT');

COPY INTO raw_order_items_variant
FROM @ecom_stage/order_items.parquet
FILE_FORMAT = (FORMAT_NAME = 'PARQUET_FMT');

COPY INTO raw_product_reviews_variant
FROM @ecom_stage/product_reviews.parquet
FILE_FORMAT = (FORMAT_NAME = 'PARQUET_FMT');
 

-- Customers
CREATE OR REPLACE TABLE raw_customers (
    customer_id INT,
    name STRING,
    email STRING,
    gender STRING,
    signup_date DATE,
    country STRING
)
AS
SELECT
    data:customer_id::INT AS customer_id,
    data:name::STRING AS name,
    data:email::STRING AS email,
    data:gender::STRING AS gender,
    data:signup_date::DATE AS signup_date,
    data:country::STRING AS country
FROM raw_customers_variant;

-- Products
CREATE OR REPLACE TABLE raw_products (
    product_id INT,
    product_name STRING,
    category STRING,
    price FLOAT,
    stock_quantity INT,
    brand STRING
)
AS
SELECT
    data:product_id::INT AS product_id,
    data:product_name::STRING AS product_name,
    data:category::STRING AS category,
    data:price::FLOAT AS price,
    data:stock_quantity::INT AS stock_quantity,
    data:brand::STRING AS brand
FROM raw_products_variant;

-- Orders
CREATE OR REPLACE TABLE raw_orders (
    order_id INT,
    customer_id INT,
    order_date DATE,
    total_amount FLOAT,
    payment_method STRING,
    shipping_country STRING
)
AS
SELECT
    data:order_id::INT AS order_id,
    data:customer_id::INT AS customer_id,
    data:order_date::DATE AS order_date,
    data:total_amount::FLOAT AS total_amount,
    data:payment_method::STRING AS payment_method,
    data:shipping_country::STRING AS shipping_country
FROM raw_orders_variant;

-- Order Items
CREATE OR REPLACE TABLE raw_order_items (
    order_item_id INT,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price FLOAT
)
AS
SELECT
    data:order_item_id::INT AS order_item_id,
    data:order_id::INT AS order_id,
    data:product_id::INT AS product_id,
    data:quantity::INT AS quantity,
    data:unit_price::FLOAT AS unit_price
FROM raw_order_items_variant;

-- Product Reviews
S
SELECT
    data:review_id::INT AS review_id,
    data:product_id::INT AS product_id,
    data:customer_id::INT AS customer_id,
    data:rating::INT AS rating,
    data:review_text::STRING AS review_text,
    data:review_date::DATE AS review_date
FROM raw_product_reviews_variant;

 
SELECT COUNT(*) AS customers_count FROM raw_customers;
SELECT COUNT(*) AS products_count FROM raw_products;
SELECT COUNT(*) AS orders_count FROM raw_orders;
SELECT COUNT(*) AS order_items_count FROM raw_order_items;
SELECT COUNT(*) AS product_reviews_count FROM raw_product_reviews;
