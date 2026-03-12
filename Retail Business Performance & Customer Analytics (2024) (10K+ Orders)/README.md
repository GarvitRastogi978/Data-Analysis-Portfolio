## Strategic Business Performance & Customer Analytics (2024 Dataset)

## 📌 Project Overview
This project involves a comprehensive end-to-end analysis of a retail business dataset containing **10,000+ rows**. The goal was to transform raw transactional data into actionable business intelligence using **SQL for deep-dive analysis and Excel for executive-level dashboarding**.

The analysis focuses on sales trends, profitability, and customer behavior (RFM) to provide strategic recommendations for the 2025 fiscal year.


## Project Link
Link: https://drive.google.com/drive/folders/104Odh1ef2K3bonWJtFtVwlWQLGr55dCk?usp=sharing


## 📊 Interactive Dashboard
<img width="1882" height="802" alt="Final Dashboard Image" src="https://github.com/user-attachments/assets/f6f73479-cbaa-440e-86e3-dd3718c169d2" />
Figure 1: Final Executive Dashboard developed in MS Excel.


## 🛠️ Tech Stack & Tools
- **Data Processing:** MS Excel for initial cleaning.
- **Database Analysis:** MS SQL Server (Complex Joins, CTEs, Window Functions).
- **Visualization:** MS Excel (Pivot Tables, Power Query, Dynamic Slicers).
- **Metrics:** KPI Tracking, RFM Analysis, MoM Growth.


## 🔍 Key Business Questions Addressed
1. **Sales Trends:** What are the peak revenue periods? (Found: July is the highest month; Sundays are the strongest days).
2. **Profitability:** Which categories drive the best margins? (Found: Home & Kitchen at 35.47%).
3. **Customer Loyalty:** What is our retention rate? (Found: 54% are one-time buyers; identified top 5% VIP customers).
4.** Operations:** What is the preferred payment method for the Corporate segment? (Found: Debit Card/COD dominance).


## 📁 Repository Contains
- **Data:** Contains the raw CSV dataset (10,000 rows).
- **SQL_Queries:** Includes .sql scripts for Sales Trends, KPI calculations, and RFM segmentation.
- **Dashboard:** The final .xlsx Excel Dashboard file.
- **Analysis_Report.pdf:** A summary of findings and recommendations.


## 🚀 SQL Analysis Examples
```
-- Calculating Month-over-Month (MoM) Revenue Growth
WITH MonthlySales AS (
    SELECT 
        FORMAT(Order_Date, 'yyyy-MM') AS [Month],
        SUM(Revenue) AS Total_Revenue
    FROM Business_Analytics_Dataset
    GROUP BY FORMAT(Order_Date, 'yyyy-MM')
)
SELECT 
    [Month],
    Total_Revenue,
    LAG(Total_Revenue) OVER (ORDER BY [Month]) AS Previous_Month_Revenue,
    ((Total_Revenue - LAG(Total_Revenue) OVER (ORDER BY [Month])) / 
      LAG(Total_Revenue) OVER (ORDER BY [Month])) * 100 AS MoM_Growth_Pct
FROM MonthlySales;
```


## 💡 Strategic Recommendations
- **Sunday Sales Push:** Increase marketing spend and digital ad targeting on weekends to capitalize on high Sunday traffic.
- **Customer Retention:** Launch a "Second Purchase" discount campaign targeting the 5,000+ one-time buyers to increase Frequency metrics.
- **Category Focus:** Expand inventory in Home & Kitchen as it yields the highest profit efficiency (35.5%).


## 📫 Contact
Garvit Rastogi
- **LinkedIn:** https://www.linkedin.com/in/garvit-rastogi/
- **Email:** garvitrastogi834@gmail.com

<!-- Portfolio: [Link to Portfolio if applicable] -->
