/*

	Reading Data - using Select
                
*/


-- Exercise 1: Retrieve all columns from the authors table
SELECT * FROM authors;

-- Exercise 2: Retrieve the au_lname and au_fname columns 
-- from the authors table
SELECT au_lname, au_fname FROM authors;

-- Exercise 3: Retrieve the title and price columns from 
-- the titles table
SELECT title, price FROM titles;

-- Exercise 4: Retrieve the pub_name column from the 
-- publishers table
SELECT pub_name FROM publishers;

-- Exercise 5: Retrieve the stor_name and city columns 
-- from the stores table
SELECT stor_name, city FROM stores;

/*

	Controlling which Columns are Returned - column names
                
*/


-- Exercise 1: Retrieve the author ID and last name as 
-- 'Author ID' and 'Last Name', respectively, from the 
-- authors table
SELECT au_id AS 'Author ID', au_lname AS 'Last Name' 
FROM authors;

-- Exercise 2: Retrieve the title ID as 'ID' and price 
-- as 'Cost' from the titles table
SELECT title_id AS 'ID', price AS 'Cost' 
FROM titles;

-- Exercise 3: Retrieve the publisher name as 'Publisher Name' 
-- from the publishers table
SELECT pub_name AS 'Publisher Name' 
FROM publishers;

-- Exercise 4: Retrieve the store name as 'Name' and city 
-- as 'Location' from the stores table
SELECT stor_name AS 'Name', city AS 'Location' 
FROM stores;

-- Exercise 5: Retrieve the job description as 'Job Title' 
-- from the jobs table
SELECT job_desc AS 'Job Title' 
FROM jobs;

/*

	Control which Rows are Returned using LIMIT
                
*/


-- Exercise 1: Retrieve the first 5 rows from the authors table
SELECT * FROM authors LIMIT 5;

-- Exercise 2: Retrieve the top 10 titles from the titles table
SELECT * FROM titles LIMIT 10;

-- Exercise 3: Retrieve the first 3 publishers from the publishers table
SELECT * FROM publishers LIMIT 3;

-- Exercise 4: Retrieve the first 5 stores from the stores table
SELECT * FROM stores LIMIT 5;

-- Exercise 5: Retrieve the first 10 jobs from the jobs table
SELECT * FROM jobs LIMIT 10;

/*

	Control which Rows are Returned using DISTINCT

*/

-- Exercise 1: Retrieve distinct author IDs from the 
-- titleauthor table
SELECT DISTINCT au_id FROM titleauthor;

-- Exercise 2: Retrieve distinct titles from the titles table
SELECT DISTINCT title FROM titles;

-- Exercise 3: Retrieve distinct publisher names from 
-- the publishers table
SELECT DISTINCT pub_name FROM publishers;

-- Exercise 4: Retrieve distinct store names from the 
-- stores table
SELECT DISTINCT stor_name FROM stores;

-- Exercise 5: Retrieve distinct job descriptions from 
-- the jobs table
SELECT DISTINCT job_desc FROM jobs;

/*

	Control which Rows are Returned using WHERE
                    
*/

-- Exercise 1: Retrieve authors with a contract status 
-- of '1' from the authors table
SELECT * FROM authors WHERE contract = 1;

-- Exercise 2: Retrieve titles with a price greater 
-- than 50 from the titles table
SELECT * FROM titles WHERE price > 50;

-- Exercise 3: Retrieve publishers located in 'New York' 
-- from the publishers table
SELECT * FROM publishers WHERE city = 'New York';

-- Exercise 4: Retrieve stores with a zip code of '10001' 
-- from the stores table
SELECT * FROM stores WHERE zip = '10001';

-- Exercise 5: Retrieve jobs with a max_lvl greater 
-- than or equal to 5 from the jobs table
SELECT * FROM jobs WHERE max_lvl >= 5;


/*
						
	SQL Comparison Operators
                        
*/

-- Exercise 1: Retrieve authors with an au_id equal to '1002' 
-- from the authors table
SELECT * FROM authors WHERE au_id = '1002';

-- Exercise 2: Retrieve titles with a price not equal to 10 
-- from the titles table
SELECT * FROM titles WHERE price <> 10;

-- Exercise 3: Retrieve titles with a price greater than 
-- 20 from the titles table
SELECT * FROM titles WHERE price > 20;

-- Exercise 4: Retrieve titles with a price less than 15 
-- from the titles table
SELECT * FROM titles WHERE price < 15;

-- Exercise 5: Retrieve titles with a price greater than 
-- or equal to 50 from the titles table
SELECT * FROM titles WHERE price >= 50;


/*

	SQL Logical Operators
                        
*/

-- Exercise 1: Retrieve authors with a contract status of '1' 
-- and a city of 'New York' from the authors table
SELECT * FROM authors WHERE contract = 1 AND city = 'New York';

-- Exercise 2: Retrieve titles with a price less than 10 
-- or greater than 100 from the titles table
SELECT * FROM titles WHERE price < 10 OR price > 100;

-- Exercise 3: Retrieve titles that are not published 
-- by 'Algodata Infosystems' from the titles table
SELECT * FROM titles 
WHERE pub_id NOT IN (SELECT pub_id FROM publishers WHERE pub_name = 'Algodata Infosystems');

-- Exercise 4: Retrieve authors with a contract status 
-- of '0' or a city of 'Chicago' from the authors table
SELECT * FROM authors WHERE contract = 0 OR city = 'Chicago';

-- Exercise 5: Retrieve authors with a contract status 
-- of '1' and not living in 'New York' from the authors table
SELECT * FROM authors WHERE contract = 1 AND city != 'New York';


/*

	Pattern Matching Operators
                        
*/

-- Exercise 1: Retrieve authors with a last name starting 
-- with 'S' from the authors table
SELECT * FROM authors WHERE au_lname LIKE 'S%';

-- Exercise 2: Retrieve titles with a title containing 
-- 'SQL' from the titles table
SELECT * FROM titles WHERE title LIKE '%SQL%';

-- Exercise 3: Retrieve publishers located in either 
-- 'New York' or 'California' from the publishers table
SELECT * FROM publishers 
WHERE city IN ('New York', 'California');

-- Exercise 4: Retrieve stores with a stor_name starting 
-- with 'Book%' from the stores table
SELECT * FROM stores WHERE stor_name LIKE 'Book%';

-- Exercise 5: Retrieve authors with a last name 
-- ending with 'son' from the authors table
SELECT * FROM authors WHERE au_lname LIKE '%son';


/*

	NULL Comparison Operators
                        
*/

-- Exercise 1: Retrieve authors with a phone number that 
-- is null from the authors table
SELECT * FROM authors WHERE phone IS NULL;

-- Exercise 2: Retrieve titles with a notes column that 
-- is not null from the titles table
SELECT * FROM titles WHERE notes IS NOT NULL;

-- Exercise 3: Retrieve authors with a city that is 
-- null or an empty string from the authors table
SELECT * FROM authors WHERE city IS NULL OR city = '';

-- Exercise 4: Retrieve titles with a price that is 
-- not null from the titles table
SELECT * FROM titles WHERE price IS NOT NULL;

-- Exercise 5: Retrieve authors with a contract status 
-- that is null from the authors table
SELECT * FROM authors WHERE contract IS NULL;


/*

	Chain multiple WHERE operators
                            
*/

-- Exercise 1: Retrieve authors with a contract status 
-- of '1' and a city of 'New York' from the authors table
SELECT * FROM authors 
WHERE contract = 1 AND city = 'New York';

-- Exercise 2: Retrieve titles with a price less than 
-- 20 and published by 'Algodata Infosystems' (pub_id: 1389)   from the titles table
SELECT * FROM titles 
WHERE price < 20 AND pub_id = 1389;

-- Exercise 3: Retrieve titles with a price less than 10 
-- or greater than 100 and not published 
-- by 'Algodata Infosystems' (pub_id: 1389) 
-- from the titles table
SELECT * FROM titles 
WHERE (price < 10 OR price > 100) AND pub_id != 1389;

-- Exercise 4: Retrieve authors with a contract status 
-- of '0' or a city of 'Chicago' and a state of 'IL' 
-- from the authors table
SELECT * FROM authors 
WHERE (contract = 0 OR city = 'Chicago') AND state = 'IL';

-- Exercise 5: Retrieve authors with a contract status 
-- of '1' and a city of 'New York' or 'Chicago' from 
-- the authors table
SELECT * FROM authors 
WHERE contract = 1 AND (city = 'New York' OR city = 'Chicago');


/*

							Order the Result Set
                    
*/

-- Exercise 1: Retrieve authors from the authors table ordered by last name in ascending order
SELECT * FROM authors ORDER BY au_lname ASC;

-- Exercise 2: Retrieve titles from the titles table ordered by price in descending order
SELECT * FROM titles ORDER BY price DESC;

-- Exercise 3: Retrieve publishers from the publishers table ordered by city in ascending order and pub_name in descending order
SELECT * FROM publishers ORDER BY city ASC, pub_name DESC;

-- Exercise 4: Retrieve stores from the stores table ordered by state in descending order and stor_name in ascending order
SELECT * FROM stores ORDER BY state DESC, stor_name ASC;

-- Exercise 5: Retrieve jobs from the jobs table ordered by max_lvl in ascending order and min_lvl in descending order
SELECT * FROM jobs ORDER BY max_lvl ASC, min_lvl DESC;

/*
							SQL Aliases
                            
*/

-- Exercise 2: Retrieve titles with their prices as 'Cost' from the titles table
SELECT price AS 'Cost' FROM titles;

-- Exercise 3: Retrieve publishers with their names as 'Publisher' from the publishers table
SELECT pub_name AS 'Publisher' FROM publishers;

-- Exercise 4: Retrieve stores with their names as 'Store Name' and cities as 'Location' from the stores table
SELECT stor_name AS 'Store Name', city AS 'Location' FROM stores;

-- Exercise 5: Retrieve jobs with their descriptions as 'Job Description' from the jobs table
SELECT job_desc AS 'Job Description' FROM jobs;

/*
 
						Basic Mathematical Operations 

*/

-- Exercise 1: Calculate the total sales quantity and amount for each store
SELECT stor_id, qty AS total_quantity, (qty * price) AS total_amount
FROM sales, titles
WHERE sales.title_id = titles.title_id;

-- Exercise 2: Calculate the profit margin (advance - price) for each title
SELECT title_id, (advance - price) AS profit_margin
FROM titles;


-- Exercise 3: Calculate the royalty amount for each title 
SELECT title_id, (ytd_sales * royalty) AS royalty_amount
FROM titles;

                    

