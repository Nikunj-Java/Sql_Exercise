/*

					Querying using SQL
    
*/

-- Selecting Columns

-- Write a query that shows the city in which 
-- each publisher resides.
SELECT city
FROM publishers;

-- What is the price that each title is being sold 
-- for, and how many copies have been sold of each?
SELECT price, ytd_sales
FROM titles;

-- Which cities have publishers in them 
-- (it’s ok for a city to appear more than once).
SELECT city
FROM publishers;

-- List all the information known about titles.
SELECT *
FROM titles;

-- Is every title sold for a different price 
-- to the other titles?

-- No, some are sold for the same price.



-- Expressions

-- Write a query that returns a simple address label 
-- for each store.  The format should be something like:
-- stor_name, stor_address, city, state, zip

SELECT stor_name + ", " + stor_address + ", "
       + city + ", " + state + ", " + zip
FROM stores;

-- Enhance your query to label the column appropriately; 
-- rewrite your query to use all three different syntaxes 
-- for accomplishing this.
SELECT stor_name  + ", " + stor_address + ", " + 
           city + ", " + state + ", " + zip 
           AS Address
FROM stores;

SELECT stor_name  + ", " + stor_address + ", " + 
            city + ", " + state + ", " + zip 
            Address
FROM stores;

SELECT stor_name  + ", " + stor_address + ", " + city + ", "+
		state + ", " + zip as Address
FROM stores;

-- Go back to your query that lists all publishers and 
-- their cities; change so that the "pub_name" column is 
-- instead called "Publisher Name", and upper case the "city" label also.
SELECT  pub_name as "Publisher Name"
           , upper(city) as "City"
FROM publishers;

-- List the price of all titles if they were increased by 10%.
SELECT title, price  * 1.1
FROM titles;

/*
	
				WHERE Clause
                
*/

-- Write a query that lists all business books 
-- (hint: look at the type column).
SELECT *
FROM titles
WHERE type="business";

-- Write a query that lists the title of those books 
-- that have sold more than 1000 copies.
SELECT *
FROM titles
WHERE ytd_sales > 1000;

-- Now modify the query to list those books that 
-- have sold between 100 and 500 copies.  Re-write 
-- this query to return the same results but using 
-- a different approach. 
SELECT *
FROM titles
WHERE ytd_sales >= 100 
AND ytd_sales <= 500;

SELECT *
FROM titles
WHERE ytd_sales BETWEEN 100 AND 500;

-- Find those authors that appear in the first half 
-- of the telephone book.  Write this in two ways, 
-- one of which should use a pattern matching function.
SELECT *
FROM authors
WHERE au_lname < "N";

SELECT *
FROM authors
WHERE au_lname LIKE "[A-M]%";

-- Are there any authors whose phone number does 
-- not conform to the American standard of "NNN NNN-NNNN"?  
-- Write a query to return them if so.
SELECT count(*)
FROM authors
WHERE phone NOT LIKE "[0-9][0-9][0-9] [0-9][0-9][0-9]- [0-9][0-9][0-9][0-9]";

-- Find those author(s) with a double-barrelled name.
SELECT *
FROM authors
WHERE au_lname LIKE "%-%";

-- Find those titles whose description includes the 
-- word 'computer'.  Capitalization is unimportant.
SELECT title
FROM titles
WHERE lower(notes) LIKE "%computer%";

-- Find all business books costing 19.99.
SELECT *
FROM titles
WHERE type="business"
AND price = 19.99;

-- Show those authors who live in Oakland, CA.
SELECT *
FROM authors
WHERE city="Oakland"
AND state="CA";

-- Find all cooking books (either modern or traditional) costing less than $12.  Write this query three different ways: using pattern matching, using OR, and then using a list.
SELECT *
FROM titles
WHERE type  LIKE "%cook";

SELECT *
FROM titles
WHERE type = "mod_cook"
      OR type = "trad_cook";

SELECT *
FROM titles
WHERE type IN ("mod_cook", "trad_cook");

-- Find those titles where there was no advance.
SELECT *
FROM titles
WHERE advance IS NULL;

-- What is the revenue of all titles to date?  If the price isn't set, then assume it will sell for $9.99.  If the ytd_sales aren't known, then assume 1000 copies.
SELECT title, (COALESCE(price, 9.99) * COALESCE(ytd_sales, 1000)) AS revenue
FROM titles;


-- Show those authors who live either in Oakland, CA or in Berkeley, CA.  Write this query in three different (but equivalent) ways.
SELECT * FROM authors
WHERE city IN ("Oakland", "Berkeley") AND state = "CA";

SELECT * FROM authors
WHERE (city = "Oakland" OR city = "Berkeley")
    AND state = "CA";

SELECT * FROM authors
WHERE city = "Oakland" AND state = "CA"
      OR city = "Berkeley" AND state = "CA";
      
/*

						Functions

*/

-- How many characters are in the descriptions of each title?
SELECT title, char_length(notes)
FROM titles;

-- What is your current user?
SELECT user();


-- Run the following:
CREATE TEMPORARY TABLE my_authors AS
SELECT CONCAT(au_fname, ", ", au_lname) as name
FROM authors;

-- Inspect the newly created my_authors table:
SELECT *
FROM my_authors;

-- Now write a query that extracts back out the author first and last names from the my_authors.name column.
SELECT 
SUBSTRING_INDEX(name, ',', 1) AS first_name,
SUBSTRING(SUBSTRING_INDEX(name, ',', -1), 2) AS last_name
FROM my_authors;

-- When done, remove the table using:
DROP TEMPORARY TABLE my_authors;



-- Estimate the total sales for each of the titles in a year's time.  However, since you haven't any better information, guess that the total sales will be somewhere between 2 and 4 times their current sales (have the SQL do the guessing …).
SELECT title, ytd_sales * 2 as lower_estimate, 
				ytd_sales * 4 as upper_estimate
FROM titles;

-- What's 7^3?
SELECT power(7,3);   -- is 343

-- Which authors have double-barrelled names? Don't use any pattern matching (ie LIKE) in your answer.
SELECT *
FROM authors
WHERE POSITION('-' IN au_lname) > 0; 

-- Find those titles whose description contains the word "Computer". Don't use pattern matching (ie LIKE) in your answer.
SELECT title
FROM titles
WHERE POSITION('Computer' IN notes) > 0 OR POSITION('computer' IN notes) > 0;

-- What's the time
SELECT CURTIME();

-- What's the time in New York right now? 
SELECT CONVERT_TZ(NOW(),'UTC','America/New_York');

-- Write a query that returns midnight for the current date. Make sure that the resultant column is a date, not a string.
SELECT CURDATE();

-- Write a query that returns a timestamp (eg for a logging message). The format should be yyyymmdd.hhmmss.
SELECT DATE_FORMAT(NOW(), '%Y%m%d.%H%i%s');

/*
						NULLs, CASE
                        
*/
 -- First write a query that lists just those states in which there is a store, making sure that there are no duplicates.
SELECT DISTINCT state FROM stores;

-- Now write a query that lists all stores and their state, but show the full name of each state rather than its simple abbreviation (eg "Washington" rather than "WA", "Oregon" rather than "OR").
SELECT stor_name, CASE state 
          WHEN "CA" THEN "California"
          WHEN "OR" THEN "Oregon"
          WHEN "WA" THEN "Washington"
          WHEN "MA" THEN "Massachussets"
          END  as state_name
FROM stores;



-- Create a table with some names in it
CREATE TEMPORARY TABLE names
SELECT 'Philip' AS fname, 'K' AS initials, 'Dick' AS lname
UNION SELECT 'Isaac', NULL, 'Asimov'
UNION SELECT NULL, NULL, 'Tolstoy';

-- Check the contents using:
SELECT * FROM names;

/*
Now, write a query that returns the authors name as it might appear in a library catalogue, eg:
"Dick, Philip K."
"Asimov, Isaac"
"Tolstoy"
Make sure that there are no extraneous spaces in the output.
*/

SELECT 
    CASE 
    WHEN lname IS NULL THEN fname
    WHEN fname IS NULL THEN lname
    ELSE CONCAT(lname, ', ', fname, IF(initials IS NOT NULL, CONCAT(' ', initials, '.'), ''))
    END AS 'Library Catalog'
FROM names;

-- When done, remove the table using 
DROP TEMPORARY TABLE IF EXISTS names;


/*
				Sorting and Grouping
                
*/

-- List the authors by the state that they live in.
SELECT state, au_lname, au_fname
FROM authors
ORDER by state;

-- List the titles by type.
SELECT *
FROM titles
ORDER BY type;

-- List those titles with the largest advance.  Don't bother to show titles with an advance less than $5000.
SELECT title_id, advance
FROM titles
WHERE advance > 5000
ORDER BY advance DESC;

/*
					UNIONs
                    
*/

-- Create a temporary table holding those stores in California:
DROP TEMPORARY TABLE IF EXISTS ca_stores;
CREATE TEMPORARY TABLE ca_stores SELECT * FROM stores WHERE state = 'CA';
-- Do the same for the other 3 states (WA, OR and MA).
DROP TEMPORARY TABLE IF EXISTS or_stores;
DROP TEMPORARY TABLE IF EXISTS ma_stores;
DROP TEMPORARY TABLE IF EXISTS wa_stores;
CREATE TEMPORARY TABLE or_stores SELECT * FROM stores WHERE state = 'OR';
CREATE TEMPORARY TABLE ma_stores SELECT * FROM stores WHERE state = 'MA';
CREATE TEMPORARY TABLE wa_stores SELECT * FROM stores WHERE state = 'WA';
-- Now write a query that combines the data back again.
SELECT * FROM ca_stores
UNION ALL
SELECT * FROM or_stores
UNION ALL
SELECT * FROM ma_stores
UNION ALL
SELECT * FROM wa_stores;

/*
					Grouping

*/


-- How many titles have each of the authors written?  Just the au_id is enough to identify the authors, not their name.
SELECT au_id, count(*)
FROM titleauthor
GROUP BY au_id;

-- How much total money has each of the publishers advanced?  Just the pub_id is enough to identify the publisher, not its name.
SELECT pub_id, sum(advance)
FROM titles
GROUP BY pub_id;

-- What's the average advance of each publisher?
SELECT pub_id, avg(advance)
FROM titles
GROUP BY pub_id;

-- Combine the last two queries to show both total advanced money and average advance for each publisher.
SELECT pub_id, sum(advance), avg(advance)
FROM titles
GROUP BY pub_id;

-- How many different (values of) advances have each of the publishers provided?
SELECT pub_id, COUNT(DISTINCT advance)
FROM titles
GROUP BY pub_id;

-- How many titles have each of the stores sold?  List the top sellers first.  Don't list those sellers that have sold less than 100 copies.
SELECT stor_id, sum(qty)
FROM sales
GROUP BY stor_id
HAVING sum(qty) >= 100;

-- Find those:
-- titles costing more than the average price.

SELECT title, price
FROM titles
HAVING price > avg(price);

-- titles costing more than the average of their type
SELECT type, title, price
FROM titles
GROUP BY type
HAVING price > avg(price);


/*

						Joins
                        
*/
-- List the titles of every sale in any store in California.
SELECT DISTINCT t.title 
FROM titles t
JOIN sales sd
ON t.title_id = sd.title_id
JOIN stores s
ON sd.stor_id = s.stor_id
WHERE s.state = 'CA';
 
-- How much total money has each of the publishers advanced?  Display the publisher's name rather than its pub_id.
SELECT p.pub_name, sum(t.advance)
  FROM publishers p
  JOIN titles t
    ON p.pub_id = t.pub_id
GROUP BY p.pub_id;

-- List the titles that each author has written.
SELECT a.au_lname, a.au_fname, t.title
  FROM authors a
  JOIN titleauthor ta
    ON a.au_id = ta.au_id
  JOIN titles t
    ON ta.title_id = t.title_id;
    

-- List those titles that have 2 or more co-authors, indicating how many co-authors there were.  Don't print out the author names.
SELECT t.title, count(*)
  FROM titles t
  JOIN titleauthor ta
    ON t.title_id = ta.title_id
GROUP BY t.title_id
HAVING count(*) >= 2;

-- How many titles have each of the authors written?  Identify authors by their first and last name (rather than just their au_id).  (Hint: use a group by).
SELECT a.au_fname, a.au_lname, count(*)
FROM authors a
JOIN titleauthor ta
ON a.au_id = ta.au_id
GROUP BY a.au_id;

-- List those stores that are in the same state as some other store.  Only print out stores once.
SELECT DISTINCT s.stor_name
  FROM stores s
  JOIN stores other
    ON s.state = other.state
   AND s.stor_id != other.stor_id;
   
-- Show the names of the authors that have had (at least) one of their books sold in California.  (Hint: using group by)
SELECT DISTINCT a.au_lname, a.au_fname
  FROM authors a
  JOIN titleauthor ta
    ON a.au_id = ta.au_id
  JOIN sales sd
    ON ta.title_id = sd.title_id
  JOIN stores s
    ON sd.stor_id = s.stor_id
WHERE s.state = "CA";

-- Write a query listing all the publishers along with the number of stores in their state.
SELECT p.pub_name, count(*)
  FROM publishers p
  JOIN stores s
    ON p.state = s.state
GROUP BY p.pub_id;

-- List those authors (if any) who live in the same city as a publisher of one of their books.
SELECT a.au_fname, a.au_lname
  FROM authors a
  JOIN publishers p
    ON a.state = p.state
  JOIN titles t
    ON p.pub_id = t.pub_id
  JOIN titleauthor ta
    ON t.title_id = ta.title_id
    AND ta.au_id = a.au_id;

-- List all pairs of authors that haven't written a book together.
SELECT a.au_id, a2.au_id
FROM authors a, authors a2
WHERE a.au_id < a2.au_id
AND NOT EXISTS (
SELECT 1
   FROM titleauthor ta1
   JOIN titleauthor ta2
     ON ta1.title_id = ta2.title_id
    JOIN
    (SELECT a.au_id as au1_id, a2.au_id as au2_id
        FROM authors a, authors a2 WHERE a.au_id < a2.au_id)
     AS aa
    ON ta1.au_id = aa.au1_id
AND ta2.au_id = aa.au2_id
AND aa.au1_id = a.au_id
AND aa.au2_id = a2.au_id);

-- For each state, find the store that has sold more titles than any other in that state.

SELECT s.state, s.stor_name, SUM(sa.qty) as sum_qty
FROM stores s
JOIN sales sa
ON s.stor_id = sa.stor_id
GROUP BY s.state, s.stor_name
HAVING SUM(sa.qty) = (
    SELECT MAX(sum_qty) 
    FROM (
        SELECT SUM(sa.qty) as sum_qty
        FROM sales sa
        GROUP BY sa.stor_id
    ) as max_sum_qty
);



/*

								Subqueries
                                
*/

-- Using a subquery, list those titles that have 2 or more co-authors, indicating how many co-authors there were.  Don't print out the author names.
SELECT * FROM (
  SELECT t.title, 
     (SELECT count(*)
       FROM titleauthor ta 
      WHERE t.title_id = ta.title_id) AS num_coauthors
  FROM titles t) as x
WHERE num_coauthors >=2;

-- Using a subquery, how many titles have each of the authors written?  Identify authors by their first and last name (rather than just their au_id) 
SELECT a.au_lname, a.au_fname, 
   (SELECT count(*) FROM titleauthor ta 
    WHERE a.au_id = ta.au_id) as num_titles
FROM authors a;

-- Using a subquery, show the names of the authors that have had (at least) one of their books sold in California.
SELECT a.au_lname, a.au_fname
  FROM authors a
  WHERE EXISTS (
     SELECT 1
      FROM titleauthor ta
      JOIN sales sd
        ON ta.title_id = sd.title_id
      JOIN stores s 
        ON sd.stor_id = s.stor_id
    WHERE s.state = "CA"
       AND a.au_id = ta.au_id);
	
-- Using a subquery, write a query listing all the publishers along with the number of stores in their state.
SELECT p.pub_name, 
   (SELECT count(s.stor_id) 
     FROM stores s
    WHERE s.state = p.state)
FROM publishers p;

-- List those stores that have no publisher in their state.
SELECT s.stor_name
FROM stores s
WHERE s.state NOT IN (SELECT p.state FROM publishers p);

-- Using derived tables (subquery in the FROM clause), return those books that cost most than the average for their particular type.
SELECT t.title, t.type, t.price, types.avg_price
FROM titles t
JOIN (
    SELECT type, avg(price) as avg_price 
       FROM titles 
     GROUP BY type) as types
ON t.type = types.type
AND t.price >= types.avg_price
