--1
SELECT COUNT(food_item.id) "count (*)" 
FROM food_item 
INNER JOIN restaurant ON (food_item.restaurant_id = restaurant.id) 
WHERE restaurant.name = 'Dine Thyme';

--2
SELECT name, COUNT(payment_method_id) "orders" 
FROM orders 
INNER JOIN payment_method ON (payment_method_id = payment_method.id) 
GROUP BY name;

--3
SELECT COUNT(DISTINCT last_name) "moonlighters" 
FROM rider 
INNER JOIN users ON (rider.user_id = users.id) 
INNER JOIN employee ON (users.id = employee.user_id);

--4
SELECT name 
FROM food_item 
WHERE price > 
(
	SELECT price 
	FROM food_item 
	WHERE name = 'Grilled Tamarind Duck Breast'
) 
AND price < 
(
	SELECT price 
	FROM food_item 
	WHERE name = 'Gnocchi alla Sorrentina'
);
							
--5
SELECT ROUND(SUM(quantity)/COUNT(DISTINCT order_id)) "items" 
FROM order_item;

--6
SELECT first_name, last_name, COUNT(orders.id) 
FROM orders 
INNER JOIN rider ON (rider_id = rider.id) 
INNER JOIN users ON (rider.user_id = users.id) 
GROUP BY first_name, last_name, rider_id 
ORDER BY COUNT(orders.id) 
DESC 
LIMIT 3;

--7
SELECT restaurant.name "restaurant", A.name "item", price
FROM food_item A 
JOIN restaurant ON (restaurant_id =restaurant.id)
WHERE 10 < ALL
(
	SELECT price 
	FROM food_item 
	WHERE restaurant_id = A.restaurant_id
);

--8

--9
SELECT restaurant.name "restaurant", food_item.name "item" 
FROM restaurant 
INNER JOIN food_item ON (restaurant.id = restaurant_id) 
LEFT JOIN order_item ON (food_item.id = food_item_id) 
WHERE food_item_id IS null;

--10
SELECT CONCAT(ROUND(SUM(
	CASE WHEN estimated_delivery_time >= actual_delivery_time THEN 1 
	ELSE 0 
	END
) *100 / COUNT(*),2), "%") "on time" 
FROM orders INNER JOIN restaurant ON (restaurant_id = restaurant.id) 
WHERE name LIKE 'Chennai%';

--11
SELECT id "order_id", 
(
	SELECT SUM(price * quantity) 
	FROM order_item 
	INNER JOIN food_item ON ( food_item_id = food_item.id) 
	WHERE order_id = A.id
) "items total",
CASE 
	WHEN total_price-delivery_charge >= 30 THEN '0'
	WHEN total_price-delivery_charge < 30 AND total_price-delivery_charge >= 20 THEN '1'
	WHEN total_price-delivery_charge < 20 AND total_price-delivery_charge >= 10 THEN '2'
	ELSE '3'
END "delivery", 
total_price - delivery_charge "total", delivery_charge "stored delivery charge", total_price "stored total"
FROM orders A
WHERE (total_price-delivery_charge >= 30 AND delivery_charge != 0) 
OR (total_price-delivery_charge < 30 AND total_price-delivery_charge >= 20 AND delivery_charge != 1) 
OR (total_price-delivery_charge < 20 AND total_price-delivery_charge >= 10 AND delivery_charge !=2) 
OR (total_price-delivery_charge < 10 AND delivery_charge != 3);

--12
SELECT DAYNAME(order_date) AS day,
SUM(CASE WHEN TIME(order_date) BETWEEN '11:00:00' AND '11:59:59' THEN 1 ELSE 0 END) "1100",
SUM(CASE WHEN TIME(order_date) BETWEEN '12:00:00' AND '12:59:59' THEN 1 ELSE 0 END) "1200",
SUM(CASE WHEN TIME(order_date) BETWEEN '13:00:00' AND '13:59:59' THEN 1 ELSE 0 END) "1300",
SUM(CASE WHEN TIME(order_date) BETWEEN '14:00:00' AND '14:59:59' THEN 1 ELSE 0 END) "1400",
SUM(CASE WHEN TIME(order_date) BETWEEN '15:00:00' AND '15:59:59' THEN 1 ELSE 0 END) "1500",
SUM(CASE WHEN TIME(order_date) BETWEEN '16:00:00' AND '16:59:59' THEN 1 ELSE 0 END) "1600",
SUM(CASE WHEN TIME(order_date) BETWEEN '17:00:00' AND '17:59:59' THEN 1 ELSE 0 END) "1700",
SUM(CASE WHEN TIME(order_date) BETWEEN '18:00:00' AND '18:59:59' THEN 1 ELSE 0 END) "1800",
SUM(CASE WHEN TIME(order_date) BETWEEN '19:00:00' AND '19:59:59' THEN 1 ELSE 0 END) "1900",
SUM(CASE WHEN TIME(order_date) BETWEEN '20:00:00' AND '20:59:59' THEN 1 ELSE 0 END) "2000",
SUM(CASE WHEN TIME(order_date) BETWEEN '21:00:00' AND '21:59:59' THEN 1 ELSE 0 END) "2100"
FROM orders
GROUP BY day
UNION
SELECT 
CASE 
	WHEN DAYNAME(order_date) = '' THEN "All Days" 
	ELSE "All days" 
END AS Total,
SUM(CASE WHEN TIME(order_date) BETWEEN '11:00:00' AND '11:59:59' THEN 1 ELSE 0 END) "1100",
SUM(CASE WHEN TIME(order_date) BETWEEN '12:00:00' AND '12:59:59' THEN 1 ELSE 0 END) "1200",
SUM(CASE WHEN TIME(order_date) BETWEEN '13:00:00' AND '13:59:59' THEN 1 ELSE 0 END) "1300",
SUM(CASE WHEN TIME(order_date) BETWEEN '14:00:00' AND '14:59:59' THEN 1 ELSE 0 END) "1400",
SUM(CASE WHEN TIME(order_date) BETWEEN '15:00:00' AND '15:59:59' THEN 1 ELSE 0 END) "1500",
SUM(CASE WHEN TIME(order_date) BETWEEN '16:00:00' AND '16:59:59' THEN 1 ELSE 0 END) "1600",
SUM(CASE WHEN TIME(order_date) BETWEEN '17:00:00' AND '17:59:59' THEN 1 ELSE 0 END) "1700",
SUM(CASE WHEN TIME(order_date) BETWEEN '18:00:00' AND '18:59:59' THEN 1 ELSE 0 END) "1800",
SUM(CASE WHEN TIME(order_date) BETWEEN '19:00:00' AND '19:59:59' THEN 1 ELSE 0 END) "1900",
SUM(CASE WHEN TIME(order_date) BETWEEN '20:00:00' AND '20:59:59' THEN 1 ELSE 0 END) "2000",
SUM(CASE WHEN TIME(order_date) BETWEEN '21:00:00' AND '21:59:59' THEN 1 ELSE 0 END) "2100"
FROM orders
GROUP BY Total
ORDER BY 
CASE
	WHEN day = 'Monday' THEN 1
	WHEN day = 'Tuesday' THEN 2
	WHEN day = 'Wednesday' THEN 3
	WHEN day = 'Thursday' THEN 4
	WHEN day = 'Friday' THEN 5
	WHEN day = 'Saturday' THEN 6
	WHEN day = 'Sunday' THEN 7
	WHEN day = 'All days' THEN 8
END ASC;

--13
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

--14

--15
SELECT ROUND(SUM(
	CASE 
	WHEN SIGN(TIMEDIFF(TIMEDIFF(actual_delivery_time, order_date), "00:40:00")) = -1 THEN 1 
	ELSE 0 
	END
) / COUNT(*),2) "P" 
FROM orders 
WHERE DAYNAME(order_date) = 'Friday' AND (TIME(order_date) BETWEEN '18:30:00' AND '19:30:00');
