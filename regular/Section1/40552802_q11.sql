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
total_price - delivery_charge "total", delivery_charge "stored delivery", total_price "stored total"
FROM orders A
WHERE (total_price-delivery_charge >= 30 AND delivery_charge != 0) 
OR (total_price-delivery_charge < 30 AND total_price-delivery_charge >= 20 AND delivery_charge != 1) 
OR (total_price-delivery_charge < 20 AND total_price-delivery_charge >= 10 AND delivery_charge !=2) 
OR (total_price-delivery_charge < 10 AND delivery_charge != 3);