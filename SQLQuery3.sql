SELECT * FROM pizza_sales
SELECT SUM(quantity) / COUNT(DISTINCT order_id) from pizza_sales