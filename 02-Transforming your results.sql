SELECT LOWER (title) AS title, 
  rental_rate AS original_rate, 
  rental_rate * 0.5 AS sale_rate 
FROM film
-- Filter for films prior to 2006
WHERE release_year < '2006';


SELECT payment_date,
  EXTRACT(DAY FROM payment_date) AS payment_day 
FROM payment;


SELECT payment_date,
  EXTRACT (YEAR FROM payment_date) AS payment_year 
FROM payment;


SELECT payment_date,
  EXTRACT (HOUR FROM payment_date) AS payment_hour 
FROM payment;


