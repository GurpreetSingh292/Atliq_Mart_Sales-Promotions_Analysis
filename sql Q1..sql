SELECT DISTINCT(dp.product_name), fe.base_price
FROM fact_events AS fe
LEFT JOIN dim_products AS dp
ON fe.product_code = dp.product_code
WHERE promo_type = 'BOGOF' AND base_price > 500 ;  