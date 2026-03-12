/* Sales Trend Analysis */

-- 1. Monthly Sales Trend & MoM Growth
/* Calculating the total revenue per month and uses the LAG() window function to calculate 
       the Month-over-Month (MoM) Growth Percentage */
WITH MonthlySales AS (
    SELECT 
        FORMAT(Order_Date, 'yyyy-MMMM') AS [Month],
        SUM(Revenue) AS Total_Revenue
    FROM [retail-sales]
    GROUP BY FORMAT(Order_Date, 'yyyy-MMMM')
)
SELECT 
    [Month],
    Total_Revenue,
    LAG(Total_Revenue) OVER (ORDER BY [Month]) AS Previous_Month_Revenue,
    ((Total_Revenue - LAG(Total_Revenue) OVER (ORDER BY [Month])) / 
      LAG(Total_Revenue) OVER (ORDER BY [Month])) * 100 AS MoM_Growth_Pct
FROM MonthlySales
ORDER BY Total_Revenue DESC;


-- 2. Quarterly Sales Performance
/* Aggregating sales by calendar quarters */
SELECT 
    'Q' + CAST(DATEPART(QUARTER, Order_Date) AS VARCHAR) + ' ' + CAST(YEAR(Order_Date) AS VARCHAR) AS [Quarter],
    SUM(Revenue) AS Total_Revenue,
    COUNT(Order_ID) AS Total_Orders
FROM [retail-sales]
GROUP BY DATEPART(QUARTER, Order_Date), YEAR(Order_Date)
ORDER BY YEAR(Order_Date), DATEPART(QUARTER, Order_Date);


-- 3. Sales by Day of the Week
/* Identifying which day of the week generates the most revenue. */
SELECT 
    DATENAME(WEEKDAY, Order_Date) AS [Day_of_Week],
    SUM(Revenue) AS Total_Revenue,
    AVG(Revenue) AS Average_Order_Value
FROM [retail-sales]
GROUP BY DATENAME(WEEKDAY, Order_Date), DATEPART(WEEKDAY, Order_Date)
ORDER BY DATEPART(WEEKDAY, Order_Date);