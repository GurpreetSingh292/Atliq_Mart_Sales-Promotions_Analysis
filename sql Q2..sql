SELECT COUNT(store_id) AS count_store , city 
FROM dim_stores
GROUP BY city
ORDER BY count_store DESC;