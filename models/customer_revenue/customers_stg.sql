{{ config(materialized='table') }}

SELECT
    CustomerID,
    FirstName,
    LastName,
    Country,
    Score,
    CONCAT(FirstName, '', Lastname) AS CustomerName
FROM
    {{ source('DATA_SCHEMA', 'CUSTOMERS') }} AS C