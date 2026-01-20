
-- 1. Count all authors
SELECT COUNT(*) FROM authors;

-- 2. Calculate the average price of all titles
SELECT AVG(price) FROM titles;

-- 3. Count authors per city
SELECT city, COUNT(*) 
FROM authors 
GROUP BY city;

-- 4. Count titles per type
SELECT type, COUNT(*) 
FROM titles 
GROUP BY type;

-- 5. Count authors per state having more than 1 author
SELECT state, COUNT(*) 
FROM authors 
GROUP BY state 
HAVING COUNT(*) > 1;

-- 6. Find the maximum price of titles per type, having 
-- maximum price greater than 15
SELECT type, MAX(price) 
FROM titles 
GROUP BY type 
HAVING MAX(price) > 15;

-- 7. Find the minimum price of titles per type, having 
-- minimum price less than 20
SELECT type, MIN(price) 
FROM titles 
GROUP BY type 
HAVING MIN(price) < 20;

-- 8. Count publishers per country having more than 1 publisher
SELECT country, COUNT(*) 
FROM publishers 
GROUP BY country 
HAVING COUNT(*) > 1;

-- 9. Find the average price of titles per type where 
-- the advance is greater than 5000 and sort them in descending order
SELECT type, AVG(price) 
FROM titles 
WHERE advance > 5000 
GROUP BY type 
ORDER BY AVG(price) DESC;

-- 10. Find the minimum and maximum price of titles per 
-- type, where the type has more than 2 titles and the 
-- average price is greater than 15
SELECT type, MIN(price), MAX(price) 
FROM titles 
GROUP BY type 
HAVING COUNT(*) > 2 AND AVG(price) > 15;

-- 11. Count publishers per country having more than 
-- 2 publishers and where the country name starts with 'U'
SELECT country, COUNT(*) 
FROM publishers 
WHERE country LIKE 'U%' 
GROUP BY country 
HAVING COUNT(*) > 2;


