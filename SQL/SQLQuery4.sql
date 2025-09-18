SELECT * FROM pizza_sales

--Daily Trend
SELECT DATENAME(DW, order_date) as order_day, COUNT(DISTINCT order_id) AS Total_orders
from pizza_sales
GROUP BY DATENAME(DW, order_date)

--Hourly Trend
SELECT DATEPART(HOUR, order_time) AS order_hours, COUNT(DISTINCT order_id) AS Total_orders
from pizza_sales
GROUP BY DATEPART(HOUR, order_time)
ORDER BY order_hours ASC

--Ratio of Pizza Sales category wise
SELECT pizza_category, SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS Percentage_of_Total_Sales
from pizza_sales
GROUP BY pizza_category


--Ratio of Pizza Sales size wise
SELECT pizza_size, CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS decimal(10,2)) AS Percentage_of_Total_Sales 
from pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size ASC

--Total Pizza Sales Category-wise
SELECT pizza_category, SUM(quantity) as Total_Pizzas_Sold
FROM pizza_sales
GROUP BY pizza_category

--Top 5 Bestsellers in Pizza
SELECT TOP 5 pizza_name, SUM(quantity) as Total_Pizzas_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizzas_Sold DESC


--Top 5 Worstsellers in Pizza
SELECT TOP 5 pizza_name, SUM(quantity) as Total_Pizzas_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizzas_Sold ASC

