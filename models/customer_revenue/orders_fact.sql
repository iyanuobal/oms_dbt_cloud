SELECT
    O.CustomerID,
    O.SalesPersonID,
    O.StatusDesc,
    O.StatusCD,
    COUNT(DISTINCT O.OrderID) AS OrderCount,
    SUM(O.TotalPrice) AS Revenue
FROM
    {{ ref('orders_stg') }} AS O  
JOIN
    {{ ref('products_stg') }} AS P ON O.ProductID = P.ProductID
GROUP BY O.CustomerID, O.SalesPersonID, O.StatusDesc, O.StatusCD
