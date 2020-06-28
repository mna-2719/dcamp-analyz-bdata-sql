SELECT title, description
FROM film AS f;


SELECT title, description
FROM film AS f
INNER JOIN language AS l
  ON f.language_id = l.language_id;


SELECT title, description
FROM film AS f
INNER JOIN language AS l
  ON f.language_id = l.language_id
WHERE name IN ('Italian', 'French')
  AND release_year = '2005' ;


SELECT first_name,
	   last_name,
       amount
FROM payment AS p
INNER JOIN customer AS c
  ON p.customer_id = c.customer_id
WHERE active = 'true'
ORDER BY amount DESC;


