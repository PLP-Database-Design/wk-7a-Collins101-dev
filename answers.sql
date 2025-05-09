-- Question 1

-- Transform the ProductDetail table into 1NF 
SELECT 
    pd.OrderID,
    pd.CustomerName,
    TRIM(p) AS Product
FROM 
    ProductDetail pd
CROSS JOIN 
    UNNEST(STRING_TO_ARRAY(pd.Products, ',')) AS p;


-- Question 2

-- Decompose the table into two tables to achieve 2NF

-- Table 1: Orders (OrderID, CustomerName)
SELECT DISTINCT 
    OrderID, 
    CustomerName
FROM 
    OrderDetails;

-- Table 2: OrderProducts (OrderID, Product, Quantity)
SELECT 
    OrderID, 
    Product, 
    Quantity
FROM 
    OrderDetails;
