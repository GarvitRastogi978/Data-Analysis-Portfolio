/* FULL HIGH LEVEL KPIs Findings */

-- 1. Total Revenue
SELECT SUM(Revenue) AS Total_Revenue FROM [retail-sales]

-- 2. Total Profit
SELECT SUM(Profit) AS Total_Profit FROM [retail-sales]

-- 3. Overall Profit Margin
SELECT (SUM(Profit) / SUM(Revenue)) * 100 AS Overall_Profit_Margin_Pct FROM [retail-sales]

-- 4. Total Orders
SELECT COUNT(DISTINCT Order_ID) AS Total_Orders FROM [retail-sales]

-- 5. Total Quantity Sold
SELECT SUM(Quantity) AS Total_Quantity_Sold FROM [retail-sales]

-- 6. Average Order Value (AOV)
SELECT AVG(Revenue) AS AOV FROM [retail-sales]

-- 7. Unique Customers
SELECT COUNT(DISTINCT Customer_ID) AS Unique_Customers FROM [retail-sales]

-- 8. Average Discount Rate
SELECT AVG(Discount_Rate) * 100 AS Average_Discount_Pct FROM [retail-sales]

--EXT	RA ADVANCE KPIs
-- 9. Performance by Customer Segment
/* Which segment (Consumer, Corporate, or Home Office) is driving the most value. */
SELECT 
    Customer_Segment,
    COUNT(Order_ID) AS Order_Count,
    SUM(Revenue) AS Total_Revenue,
    SUM(Profit) AS Total_Profit,
    (SUM(Profit) / SUM(Revenue)) * 100 AS Margin_Pct
FROM [retail-sales]
GROUP BY Customer_Segment
ORDER BY Total_Revenue DESC;

-- 10. Regional Performance (KPI Ranking)
/* Ranking regions by their contribution to the total profit. */
SELECT 
    Region,
    SUM(Revenue) AS Total_Revenue,
    SUM(Profit) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity_Sold,
    DENSE_RANK() OVER (ORDER BY SUM(Profit) DESC) AS Profit_Rank
FROM [retail-sales]
GROUP BY Region;

-- 11. Payment Method Utilization
/* A KPI to track how customers prefer to pay, which can affect transaction costs. */
SELECT 
    Payment_Method,
    COUNT(*) AS Transaction_Count,
    SUM(Revenue) AS Total_Revenue,
    (CAST(COUNT(*) AS FLOAT) / (SELECT COUNT(*) FROM [retail-sales])) * 100 AS Usage_Pct
FROM [retail-sales]
GROUP BY Payment_Method
ORDER BY Usage_Pct DESC;