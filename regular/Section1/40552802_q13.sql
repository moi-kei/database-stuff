--12
SELECT post_code, first_name, last_name, count(*) "orders", 
ROUND(SUM(total_price)/
(
	SELECT COUNT(DISTINCT DATE(order_date)) 
	FROM orders 
	INNER JOIN users ON (customer_id = users.id) 
	WHERE A.id = customer_id
),2) AS `average daily spend`
FROM orders 
INNER JOIN users A ON (customer_id = A.id) 
INNER JOIN address ON (customer_id = address.user_id) 
WHERE post_code = 
(
	SELECT post_code from orders 
	INNER JOIN address ON (delivery_address_id = address.id) 
	GROUP BY post_code 
	ORDER BY COUNT(*) DESC 
	LIMIT 1
)
GROUP BY first_name, last_name, post_code, A.id
ORDER BY `average daily spend` DESC;