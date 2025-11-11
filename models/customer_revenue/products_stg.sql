{{ config(materialized='table') }}
SELECT  
    ProductID,
    Product,
    Category,
    Price
FROM
    {{ source('DATA_SCHEMA', 'PRODUCTS') }}