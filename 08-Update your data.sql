-- Increase rental_rate by 0.5 in the film table
UPDATE film
SET rental_rate = rental_rate + 0.50 ;


-- Increase rental_rate by one dollar for R-rated movies
UPDATE film
SET rental_rate = rental_rate + 1
WHERE rating = 'R';


SELECT film_id 
FROM actor AS a
INNER JOIN film_actor AS f
   ON a.actor_id = f.actor_id
WHERE last_name IN ('WILLIS', 'CHASE', 'WINSLET', 'GUINESS', 'HUDSON');


UPDATE film
SET rental_rate = rental_rate - 1
WHERE film_id IN
  (SELECT film_id from actor AS a
   INNER JOIN film_actor AS f
      ON a.actor_id = f.actor_id
   WHERE last_name IN ('WILLIS', 'CHASE', 'WINSLET', 'GUINESS', 'HUDSON'));



