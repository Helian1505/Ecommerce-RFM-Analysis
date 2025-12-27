WITH user_orders AS(
  --Items in orders
  SELECT
    oi.user_id,
    oi.order_id,
    DATE(oi.created_at)AS order_date,
    SUM(oi.sale_price) AS order_value
  FROM `bigquery-public-data.thelook_ecommerce.order_items` AS oi
  INNER JOIN `bigquery-public-data.thelook_ecommerce.orders` AS o 
    ON oi.order_id = o.order_id
  WHERE o.status NOT IN ('Cancelled','Returned')
  GROUP BY 1,2,3
),

user_summary AS (
  SELECT 
    uo.user_id,
    u.country, -- Country by users
    u.gender,  -- Genders
    MAX(uo.order_date) AS last_purchase_date,
    COUNT(DISTINCT uo.order_id) AS frequency,
    SUM(uo.order_value) AS monetary
  FROM user_orders uo
  INNER JOIN `bigquery-public-data.thelook_ecommerce.users` u ON uo.user_id = u.id
  GROUP BY 1, 2, 3
),

rfm_scores AS (
  SELECT *,
    --NTILE divide in 5 groups
    --in Recency, the lowest is the better thats why order by desc so the lowest scores 5
    NTILE(5) OVER(ORDER BY recency DESC) AS r_score,
    NTILE(5) OVER(ORDER BY recency ASC) AS f_score,
    NTILE(5) OVER(ORDER BY recency ASC) AS m_score,
  FROM (
    SELECT * ,
    DATE_DIFF(MAX(last_purchase_date)OVER(),last_purchase_date,DAY) AS recency
    FROM user_summary
  )
)
SELECT
  *,
  -- Score total (average)
  ROUND((r_score+f_score+m_score)/3,1) AS total_score,
  --Assign the business segment.
  CASE
    WHEN (r_score+f_score+m_score)/3 >= 4.5 THEN 'Champions'
    WHEN (r_score+f_score+m_score)/3 >= 3.5 THEN 'Loyal Customers'
    WHEN (r_score+f_score+m_score)/3 >= 2.5 THEN 'Potential Loyalists'
    WHEN r_score <= 2 THEN 'At Risk / Hibernating'
    ELSE 'About to Sleep'
  END AS customer_segment
  FROM rfm_scores
  ORDER BY total_score DESC;