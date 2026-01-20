/*

	Reading Data - using Select
                
*/


-- Exercise 1: Retrieve all columns from the authors table


-- Exercise 2: Retrieve the au_lname and au_fname columns from the authors table


-- Exercise 3: Retrieve the title and price columns from the titles table


-- Exercise 4: Retrieve the pub_name column from the publishers table


-- Exercise 5: Retrieve the stor_name and city columns from the stores table


/*

	Controlling which Columns are Returned - column names
                
*/


-- Exercise 1: Retrieve the author ID and last name as 'Author ID' 
-- and 'Last Name', respectively, from the authors table


-- Exercise 2: Retrieve the title ID as 'ID' and price as 
-- 'Cost' from the titles table


-- Exercise 3: Retrieve the publisher name as 'Publisher Name' 
-- from the publishers table


-- Exercise 4: Retrieve the store name as 'Name' and city as 
-- 'Location' from the stores table


-- Exercise 5: Retrieve the job description as 'Job Title' 
-- from the jobs table


/*

	Control which Rows are Returned using LIMIT
                
*/


-- Exercise 1: Retrieve the first 5 rows from the authors table


-- Exercise 2: Retrieve the top 10 titles from the titles table


-- Exercise 3: Retrieve the first 3 publishers from the publishers table


-- Exercise 4: Retrieve the first 5 stores from the stores table


-- Exercise 5: Retrieve the first 10 jobs from the jobs table


/*

	Control which Rows are Returned using DISTINCT

*/

-- Exercise 1: Retrieve distinct author IDs from the titleauthor table


-- Exercise 2: Retrieve distinct titles from the titles table


-- Exercise 3: Retrieve distinct publisher names from the publishers table


-- Exercise 4: Retrieve distinct store names from the stores table


-- Exercise 5: Retrieve distinct job descriptions from the jobs table


/*

	Control which Rows are Returned using WHERE
                    
*/

-- Exercise 1: Retrieve authors with a contract status of 
-- '1' from the authors table


-- Exercise 2: Retrieve titles with a price greater than 
-- 50 from the titles table


-- Exercise 3: Retrieve publishers located in 'New York' 
-- from the publishers table


-- Exercise 4: Retrieve stores with a zip code of '10001' 
-- from the stores table


-- Exercise 5: Retrieve jobs with a max_lvl greater than 
-- or equal to 5 from the jobs table



/*
						
	SQL Comparison Operators
                        
*/

-- Exercise 1: Retrieve authors with an au_id equal to '1002' 
-- from the authors table


-- Exercise 2: Retrieve titles with a price not equal to 
-- 10 from the titles table


-- Exercise 3: Retrieve titles with a price greater than 
-- 20 from the titles table


-- Exercise 4: Retrieve titles with a price less than 15 
-- from the titles table


-- Exercise 5: Retrieve titles with a price greater than 
-- or equal to 50 from the titles table



/*

	SQL Logical Operators
                        
*/

-- Exercise 1: Retrieve authors with a contract status of '1' 
-- and a city of 'New York' from the authors table


-- Exercise 2: Retrieve titles with a price less than 10 or 
-- greater than 100 from the titles table


-- Exercise 3: Retrieve titles that are not published by 
-- 'Algodata Infosystems' from the titles table

-- Exercise 4: Retrieve authors with a contract status of 
-- '0' or a city of 'Chicago' from the authors table


-- Exercise 5: Retrieve authors with a contract status of 
-- '1' and not living in 'New York' from the authors table



/*

	Pattern Matching Operators
                        
*/



-- Exercise 2: Retrieve titles with a title containing 'SQL' 
-- from the titles table


-- Exercise 3: Retrieve publishers located in either 'New York' 
-- or 'California' from the publishers table


-- Exercise 4: Retrieve stores with a stor_name starting 
-- with 'Book%' from the stores table


-- Exercise 5: Retrieve authors with a last name ending 
-- with 'son' from the authors table



/*

	NULL Comparison Operators
                        
*/

-- Exercise 1: Retrieve authors with a phone number that is 
-- null from the authors table


-- Exercise 2: Retrieve titles with a notes column that is 
-- not null from the titles table


-- Exercise 3: Retrieve authors with a city that is null 
-- or an empty string from the authors table


-- Exercise 4: Retrieve titles with a price that is not 
-- null from the titles table


-- Exercise 5: Retrieve authors with a contract status 
-- that is null from the authors table



/*

	Chain multiple WHERE operators
                            
*/

-- Exercise 1: Retrieve authors with a contract status of 
-- '1' and a city of 'New York' from the authors table


-- Exercise 2: Retrieve titles with a price less than 20 
-- and published by 'Algodata Infosystems' (pub_id: 1389) 
-- from the titles table


-- Exercise 3: Retrieve titles with a price less than 10 
-- or greater than 100 and not published by 
-- 'Algodata Infosystems' (pub_id: 1389) from the titles table


-- Exercise 4: Retrieve authors with a contract status 
-- of '0' or a city of 'Chicago' and a state of 'IL' 
-- from the authors table


-- Exercise 5: Retrieve authors with a contract status 
-- of '1' and a city of 'New York' or 'Chicago' from 
-- the authors table


/*

	Order the Result Set
                    
*/

-- Exercise 1: Retrieve authors from the authors table 
-- ordered by last name in ascending order


-- Exercise 2: Retrieve titles from the titles table 
-- ordered by price in descending order


-- Exercise 3: Retrieve publishers from the publishers 
-- table ordered by city in ascending order and pub_name 
-- in descending order


-- Exercise 4: Retrieve stores from the stores table 
-- ordered by state in descending order and stor_name 
-- in ascending order


-- Exercise 5: Retrieve jobs from the jobs table ordered 
-- by max_lvl in ascending order and min_lvl in descending order


/*
	SQL Aliases
                            
*/

-- Exercise 2: Retrieve titles with their prices as 'Cost' 
-- from the titles table


-- Exercise 3: Retrieve publishers with their names as 
-- 'Publisher' from the publishers table


-- Exercise 4: Retrieve stores with their names as 
-- 'Store Name' and cities as 'Location' from the stores table


-- Exercise 5: Retrieve jobs with their descriptions as 
-- 'Job Description' from the jobs table


/*
 
	Basic Mathematical Operations 

*/

-- Exercise 1: Calculate the total sales quantity and 
-- amount for each store

-- Exercise 2: Calculate the profit margin (advance - price) 
-- for each title

-- Exercise 3: Calculate the royalty amount for each title 

                    

