/* Profit Margin Analysis */

-- 1. Margin by Product Category
SELECT 
    Product_Category,
    SUM(Revenue) AS Total_Revenue,
    SUM(Profit) AS Total_Profit,
    (SUM(Profit) / SUM(Revenue)) * 100 AS Margin_Percentage
FROM [retail-sales]
GROUP BY Product_Category
ORDER BY Margin_Percentage DESC;

-- 2. Regional Profitability Analysis
SELECT 
    Region,
    SUM(Revenue) AS Total_Revenue,
    SUM(Profit) AS Total_Profit,
    (SUM(Profit) / SUM(Revenue)) * 100 AS Margin_Percentage
FROM [retail-sales]
GROUP BY Region
ORDER BY Margin_Percentage DESC;

-- 3. Identifying High-Margin Transactions
SELECT 
    Order_ID, 
    Product_Category, 
    Revenue, 
    Profit,
    (Profit / Revenue) * 100 AS Margin_Pct
FROM [retail-sales]
WHERE (Profit / Revenue) > 0.50
ORDER BY Margin_Pct DESC;

-- 4. Average Discount vs. Profit Margin
/* Checks if high discounts are significantly eroding margins */
SELECT 
    Product_Category,
    AVG(Discount_Rate) * 100 AS Avg_Discount_Pct,
    (SUM(Profit) / SUM(Revenue)) * 100 AS Margin_Pct
FROM [retail-sales]
GROUP BY Product_Category
ORDER BY Avg_Discount_Pct DESC;