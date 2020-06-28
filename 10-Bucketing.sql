WITH user_revenues AS (
  SELECT
    -- Select the user IDs and the revenues they generate
    user_id,
    SUM (m.meal_price * o.order_quantity) AS revenue
  FROM meals AS m
  JOIN orders AS o
  ON m.meal_id = o.meal_id
  GROUP BY user_id)

SELECT
  -- Fill in the bucketing conditions
  CASE
    WHEN revenue < 150 THEN 'Low-revenue users'
    WHEN revenue < 300 THEN 'Mid-revenue users'
    ELSE 'High-revenue users'
  END AS revenue_group,
  COUNT (DISTINCT user_id) AS users
FROM user_revenues
GROUP BY revenue_group;


-- Store each user's count of orders in a CTE named user_orders
WITH user_orders AS (
  SELECT
    user_id,
    COUNT (DISTINCT order_id) AS orders
  FROM orders
  GROUP BY user_id)

SELECT
  -- Write the conditions for the three buckets
  CASE
    WHEN orders < 8 THEN 'Low-orders users'
    WHEN orders < 15 THEN 'Mid-orders users'
    ELSE 'High-orders users'
  END AS order_group,
  -- Count the distinct users in each bucket
  COUNT (DISTINCT user_id) AS users
FROM user_orders
GROUP BY order_group;



