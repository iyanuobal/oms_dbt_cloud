{{ config(materialized='table') }}
SELECT 
    OrderID,
    OrderDate,
    ProductID,
    CustomerID,
    SalesPersonID,
    Sales,
    Quantity * Sales AS TotalPrice,
    OrderStatus AS StatusCD,
    CASE 
        WHEN OrderStatus = 'Delivered' THEN 'Completed'
        WHEN OrderStatus = 'Shipped' THEN 'In Progress'
        ELSE NULL
    END AS StatusDesc
FROM
    {{ source('DATA_SCHEMA', 'ORDERS') }} 