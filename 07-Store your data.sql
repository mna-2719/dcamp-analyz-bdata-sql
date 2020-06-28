-- Create a new table called oscars
CREATE TABLE oscars (
    title VARCHAR,
    award VARCHAR
);


-- Create a new table called oscars
CREATE TABLE oscars (
    title VARCHAR,
    award VARCHAR
);

-- Insert the data into the oscars table
INSERT INTO oscars (title, award)
VALUES
('TRANSLATION SUMMER', 'Best Film'),
('DORADO NOTTING', 'Best Film'),
('MARS ROMAN', 'Best Film'),
('CUPBOARD SINNERS', 'Best Film'),
('LONELY ELEPHANT', 'Best Film');


-- Create a new table called oscars
CREATE TABLE oscars (
    title VARCHAR,
    award VARCHAR
);

-- Insert the data into the oscars table
INSERT INTO oscars (title, award)
VALUES
('TRANSLATION SUMMER', 'Best Film'),
('DORADO NOTTING', 'Best Film'),
('MARS ROMAN', 'Best Film'),
('CUPBOARD SINNERS', 'Best Film'),
('LONELY ELEPHANT', 'Best Film');

-- Confirm the table was created and is populated
SELECT * 
FROM oscars;


SELECT *
FROM film
WHERE rating = 'G' OR rating = 'PG';


-- Create a new table named family_films using this query
CREATE TABLE family_films AS
SELECT *
FROM film
WHERE rating IN ('G', 'PG');



