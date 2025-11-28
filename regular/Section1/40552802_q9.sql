--9
SELECT restaurant.name "restaurant", food_item.name "item" 
FROM restaurant 
INNER JOIN food_item ON (restaurant.id = restaurant_id) 
LEFT JOIN order_item ON (food_item.id = food_item_id) 
WHERE food_item_id IS null;