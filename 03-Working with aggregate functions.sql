SELECT active, 
       COUNT(payment_id) AS num_transactions, 
       AVG(amount) AS avg_amount, 
       SUM(amount) AS total_amount
FROM payment AS p
INNER JOIN customer AS c
  ON p.customer_id = c.customer_id
GROUP BY active;


SELECT name, 
	STRING_AGG(title, ',') AS film_titles
FROM film AS f
INNER JOIN language AS l
  ON f.language_id = l.language_id
WHERE release_year = '2010'
  AND rating = 'G'
GROUP BY name;



