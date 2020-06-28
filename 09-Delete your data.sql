-- Delete films that cost most than 25 dollars
DELETE FROM film
WHERE replacement_cost > 25;


-- Identify the film_id of all films that have a rating of R or NC-17
SELECT film_id
FROM film
WHERE rating = 'R' OR rating = 'NC-17';


-- Use the list of film_id values to DELETE all R & NC-17 rated films from inventory.
DELETE FROM inventory
WHERE film_id IN (
  SELECT film_id FROM film
  WHERE rating IN ('R', 'NC-17')
);

-- Delete records from the `film` table that are either rated as R or NC-17.
DELETE FROM film
WHERE rating IN ('R', 'NC-17');



