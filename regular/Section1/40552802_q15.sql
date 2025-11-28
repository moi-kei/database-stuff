--15

SELECT ROUND(SUM(
	CASE 
	WHEN SIGN(TIMEDIFF(TIMEDIFF(actual_delivery_time, order_date), "00:40:00")) = -1 THEN 1 
	ELSE 0 
	END
) / COUNT(*),2) "P" 
FROM orders 
WHERE DAYNAME(order_date) = 'Friday' AND (TIME(order_date) BETWEEN '18:30:00' AND '19:30:00');