-- Select all columns from the information_schema.columns table
SELECT *
FROM information_schema.columns;


SELECT table_name, column_name
FROM information_schema.columns
WHERE table_schema = 'public';


SELECT table_name, 
       STRING_AGG(column_name, ', ') AS columns
FROM information_schema.columns
WHERE table_schema = 'public'
GROUP BY table_name;


-- Create a new view called table_columns
CREATE VIEW table_columns AS
SELECT table_name, 
	   STRING_AGG(column_name, ', ') AS columns
FROM information_schema.columns
WHERE table_schema = 'public'
GROUP BY table_name;

-- Query the newly created view table_columns
SELECT *
FROM table_columns;


-- Calculate the average_length for each category
SELECT category, 
	   AVG(length) AS average_length
FROM film AS f
-- Join the tables film & category
INNER JOIN category AS c
  ON f.film_id = c.film_id
GROUP BY category
-- Sort the results in ascending order by length
ORDER BY average_length DESC;



