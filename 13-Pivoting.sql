-- Import tablefunc
CREATE EXTENSION IF NOT EXISTS tablefunc;

SELECT * FROM CROSSTAB($$
  SELECT
    user_id,
    DATE_TRUNC('month', order_date) :: DATE AS delivr_month,
    SUM(meal_price * order_quantity) :: FLOAT AS revenue
  FROM meals
  JOIN orders ON meals.meal_id = orders.meal_id
 WHERE user_id IN (0, 1, 2, 3, 4)
   AND order_date < '2018-09-01'
 GROUP BY user_id, delivr_month
 ORDER BY user_id, delivr_month;
$$)
-- Select user ID and the months from June to August 2018
AS ct (user_id INT,
       "2018-06-01" FLOAT,
       "2018-07-01" FLOAT,
       "2018-08-01" FLOAT)
ORDER BY user_id ASC;


SELECT
  -- Select eatery and calculate total cost
  eatery,
  DATE_TRUNC('month', stocking_date) :: DATE AS delivr_month,
  SUM(meal_cost * stocked_quantity) :: FLOAT AS cost
FROM meals
JOIN stock ON meals.meal_id = stock.meal_id
-- Keep only the records after October 2018
WHERE DATE_TRUNC ('month', stocking_date) :: DATE > '2018-10-01'
GROUP BY eatery, delivr_month
ORDER BY eatery, delivr_month;


-- Import tablefunc
CREATE EXTENSION IF NOT EXISTS tablefunc;

SELECT * FROM CROSSTAB($$
  SELECT
    -- Select eatery and calculate total cost
    eatery,
    DATE_TRUNC('month', stocking_date) :: DATE AS delivr_month,
    SUM(meal_cost * stocked_quantity) :: FLOAT AS cost
  FROM meals
  JOIN stock ON meals.meal_id = stock.meal_id
  -- Keep only the records after October 2018
  WHERE DATE_TRUNC('month', stocking_date) > '2018-10-01'
  GROUP BY eatery, delivr_month
  ORDER BY eatery, delivr_month;
$$)

-- Select the eatery and November and December 2018 as columns
AS ct (eatery TEXT,
       "2018-11-01" FLOAT,
       "2018-12-01" FLOAT)
ORDER BY eatery ASC;



