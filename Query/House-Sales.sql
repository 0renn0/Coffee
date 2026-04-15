SELECT * FROM house_sales;

SELECT Region, 
    ROUND(SUM(Daily_Revenue_KES), 2) AS Daily_Revenue,
    ROUND(AVG(Average_Order_Value_KES), 0) AS Avg_Order
FROM house_sales GROUP BY Region ORDER BY Daily_Revenue DESC;

SELECT Branch, 
    ROUND(SUM(Daily_Revenue_KES) / SUM(Marketing_Spend_KES), 2) AS Marketing_ROI
FROM house_sales GROUP BY Branch ORDER BY Marketing_ROI DESC LIMIT 10;

SELECT Branch, 
    ROUND(AVG(Daily_Revenue_KES / Number_of_Employees), 2) AS Revenue_Per_Staff
FROM sales GROUP BY Branch ORDER BY Revenue_Per_Staff DESC LIMIT 5;

SELECT DATE_FORMAT(Date, '%Y-%m') AS Month, 
    ROUND(SUM(Daily_Revenue_KES), 2) AS Total_Monthly_Revenue,
    SUM(Number_of_Customers_Per_Day) AS Total_Customers
FROM house_sales GROUP BY Month ORDER BY Total_Monthly_Revenue DESC LIMIT 5;

SELECT DATE_FORMAT(Date, '%Y-%m') AS Month, 
    SUM(Number_of_Customers_Per_Day) AS Total_Customers,
    ROUND(SUM(Daily_Revenue_KES), 2) AS Total_Monthly_Revenue
FROM house_sales GROUP BY Month ORDER BY Total_Customers DESC limit 10;

SELECT Branch, 
    ROUND(AVG(Number_of_Customers_Per_Day), 0) AS Avg_Daily_Customers
FROM house_sales GROUP BY Branch ORDER BY Avg_Daily_Customers DESC  ;

SELECT Branch, 
    ROUND(AVG(Location_Foot_Traffic),2) AS Avg_Foot_Traffic,
    ROUND(AVG(Daily_Revenue_KES),2) AS Avg_Daily_Revenue
FROM house_sales WHERE Location_Foot_Traffic > 500
GROUP BY Branch HAVING Avg_Daily_Revenue > 200000 ORDER BY Avg_Daily_Revenue DESC;