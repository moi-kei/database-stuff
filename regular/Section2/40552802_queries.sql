--a review summany for the restaurant Solti withing the last 4 wekks of data available

SELECT name "reastaurant", 
ROUND(SUM(food_quality_rating) / SUM(CASE WHEN food_quality_rating IS NULL THEN 0 ELSE 5 END),2)* 5 "Average food quality rating", 
ROUND(SUM(delivery_rating) / SUM(CASE WHEN delivery_rating IS NULL THEN 0 ELSE 5 END),2)* 5 "Average delivery rating",
ROUND(SUM(satisfaction_rating) / SUM(CASE WHEN satisfaction_rating IS NULL THEN 0 ELSE 5 END),2)* 5 "Average overall satisfaction rating"
FROM review 
INNER JOIN orders ON (review.id=orders.id)
INNER JOIN restaurant ON (restaurant_id=restaurant.id)
WHERE name = "Solti"
AND DATEDIFF("2021-06-30", order_date) <= 28
GROUP BY name;

--bsummary for rider id 285 within the last 10 days on data available

SELECT first_name, last_name, rider.id "rider id",
ROUND(SUM(delivery_rating) / SUM(CASE WHEN delivery_rating IS NULL THEN 0 ELSE 5 END),2)* 5 "Average delivery rating in the last 10 days"
FROM review
INNER JOIN orders ON (order_id=orders.id)
INNER JOIN rider ON (rider_id=rider.id)
INNER JOIN users ON (rider.user_id=users.id)
WHERE rider.id = 285
AND DATEDIFF("2021-06-30", order_date) <= 10
GROUP BY rider.id, first_name, last_name;

