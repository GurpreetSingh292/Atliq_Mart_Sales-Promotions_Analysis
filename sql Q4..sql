WITH cte1 AS(
SELECT *,(IF
          (promo_type = "BOGOF",`quantity_sold(after_promo)` * 2 ,`quantity_sold(after_promo)`)) as qsap
FROM fact_events 
JOIN dim_campaigns USING(campaign_id)
JOIN dim_products USING (product_code)
WHERE campaign_name = "Diwali" ),

cte2 AS(
SELECT 
campaign_name, category,
((SUM(qsap) - SUM(`quantity_sold(before_promo)`))/SUM(`quantity_sold(before_promo)`)) * 100 AS `ISU%`
 FROM cte1 
 GROUP BY category 
 )
 
 SELECT campaign_name, category, `ISU%`, RANK() OVER(ORDER BY `ISU%`DESC) AS `ISU%_Rank` 
 FROM cte2