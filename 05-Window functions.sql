WITH reg_dates AS (
  SELECT
    user_id,
    MIN(order_date) AS reg_date
  FROM orders
  GROUP BY user_id)

SELECT
  -- Select the month and the registrations
  DATE_TRUNC ('month', reg_date) :: DATE AS delivr_month,
  COUNT (DISTINCT user_id) AS regs
FROM reg_dates
GROUP BY delivr_month
-- Order by month in ascending order
ORDER BY delivr_month; 


WITH reg_dates AS (
  SELECT
    user_id,
    MIN(order_date) AS reg_date
  FROM orders
  GROUP BY user_id),

  regs AS (
  SELECT
    DATE_TRUNC('month', reg_date) :: DATE AS delivr_month,
    COUNT(DISTINCT user_id) AS regs
  FROM reg_dates
  GROUP BY delivr_month)

SELECT
  -- Calculate the registrations running total by month
  delivr_month,
  regs,
  SUM(regs) OVER (ORDER BY delivr_month ASC) AS regs_rt
FROM regs
-- Order by month in ascending order
ORDER BY delivr_month ASC; 


WITH mau AS (
  SELECT
    DATE_TRUNC ('month', order_date) :: DATE AS delivr_month,
    COUNT (DISTINCT user_id) AS mau
  FROM orders
  GROUP BY delivr_month)

SELECT
  -- Select the month and the MAU
  mau,
  delivr_month,
  COALESCE (
    LAG (mau) OVER (ORDER BY delivr_month ASC),
  0) AS last_mau
FROM mau
-- Order by month in ascending order
ORDER BY delivr_month ASC;



