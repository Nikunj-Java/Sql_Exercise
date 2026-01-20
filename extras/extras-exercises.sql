/*

	Querying using SQL
    
*/

-- Selecting Columns

-- Write a query that shows the city in which each publisher 
-- resides.


-- What is the price that each title is being sold for, 
-- and how many copies have been sold of each?


-- Which cities have publishers in them (it’s ok for a city 
-- to appear more than once).


-- List all the information known about titles.


-- Is every title sold for a different price to the other titles?

-- No, some are sold for the same price.



/*

	Expressions
                    
*/

-- Write a query that returns a simple address label for each store.  
-- The format should be something like:
-- stor_name, stor_address, city, state, zip



-- Enhance your query to label the column appropriately; 
-- rewrite your query to use all three different syntaxes 
-- for accomplishing this.



-- Go back to your query that lists all publishers and 
-- their cities; change so that the "pub_name" column is 
-- instead called "Publisher Name", and upper case 
-- the "city" label also.



-- List the price of all titles if they were increased by 10%.


/*
	
	WHERE Clause
                
*/

-- Write a query that lists all business books 
-- (hint: look at the type column).


-- Write a query that lists the title of those books that 
-- have sold more than 1000 copies.


-- Now modify the query to list those books that have sold 
-- between 100 and 500 copies.  Re-write this query to return 
-- the same results but using a different approach. 


-- Find those authors that appear in the first half of the 
-- telephone book.  Write this in two ways, one of which should 
-- use a pattern matching function.


-- Are there any authors whose phone number does not conform 
-- to the American standard of "NNN NNN-NNNN"?  
-- Write a query to return them if so.


-- Find those author(s) with a double-barrelled name.


-- Find those titles whose description includes the word 
-- 'computer'.  Capitalization is unimportant.


-- Find all business books costing 19.99.


-- Show those authors who live in Oakland, CA.


-- Find all cooking books (either modern or traditional) 
-- costing less than $12.  Write this query three different ways: using pattern matching, using OR, and then using a list.


-- Find those titles where there was no advance.


-- What is the revenue of all titles to date?  If the price 
-- isn't set, then assume it will sell for $9.99.  
-- If the ytd_sales aren't known, then assume 1000 copies.


-- Show those authors who live either in Oakland, CA or 
-- in Berkeley, CA.  Write this query in three different 
-- (but equivalent) ways.


      
/*

	Functions

*/

-- How many characters are in the descriptions of each title?


-- What is your current user?


-- Run the following:


-- Inspect the newly created my_authors table:


-- Now write a query that extracts back out the author first 
-- and last names from the my_authors.name column.


-- When done, remove the table using:


-- Estimate the total sales for each of the titles in a year's 
-- time.  However, since you haven't any better information, 
-- guess that the total sales will be somewhere between 2 
-- and 4 times their current sales (have the SQL do the 
-- guessing …).


-- What's 7^3?


-- Which authors have double-barrelled names? Don't use 
-- any pattern matching (ie LIKE) in your answer.


-- Find those titles whose description contains the word 
-- "Computer". Don't use pattern matching (ie LIKE) in 
-- your answer.


-- What's the time


-- What's the time in New York right now? 


-- Write a query that returns midnight for the current date. 
-- Make sure that the resultant column is a date, not a string.


-- Write a query that returns a timestamp (eg for a logging 
-- message). The format should be yyyymmdd.hhmmss.


/*
	NULLs, CASE
                        
*/
 -- First write a query that lists just those states in which 
 -- there is a store, making sure that there are no duplicates.


-- Now write a query that lists all stores and their state, 
-- but show the full name of each state rather than its 
-- simple abbreviation (eg "Washington" rather than "WA", 
-- "Oregon" rather than "OR").


-- Create a table with some names in it


-- Check the contents using:


/*
Now, write a query that returns the authors name as it might 
appear in a library catalogue, eg:
"Dick, Philip K."
"Asimov, Isaac"
"Tolstoy"
Make sure that there are no extraneous spaces in the output.
*/


-- When done, remove the table using 
-- DROP TEMPORARY TABLE IF EXISTS names;


/*
	Sorting and Grouping
                
*/

-- List the authors by the state that they live in.


-- List the titles by type.


-- List those titles with the largest advance.  Don't bother 
-- to show titles with an advance less than $5000.


/*
	UNIONs
                    
*/

-- Create a temporary table holding those stores in California

-- Do the same for the other 3 states (WA, OR and MA).

-- Now write a query that combines the data back again.



/*
	Grouping

*/


-- How many titles have each of the authors written?  
-- Just the au_id is enough to identify the authors, 
-- not their name.


-- How much total money has each of the publishers advanced?  
-- Just the pub_id is enough to identify the publisher, 
-- not its name.


-- What's the average advance of each publisher?


-- Combine the last two queries to show both total advanced 
-- money and average advance for each publisher.


-- How many different (values of) advances have each of the 
-- publishers provided?


-- How many titles have each of the stores sold?  List the 
-- top sellers first.  Don't list those sellers that have 
-- sold less than 100 copies.


-- Find those:
-- titles costing more than the average price.



-- titles costing more than the average of their type



/*

	Joins
                        
*/
-- List the titles of every sale in any store in California.

 
-- How much total money has each of the publishers advanced?  
-- Display the publisher's name rather than its pub_id.


-- List the titles that each author has written.

    

-- List those titles that have 2 or more co-authors, indicating 
-- how many co-authors there were.  
-- Don't print out the author names.


-- How many titles have each of the authors written?  
-- Identify authors by their first and last name (rather 
-- than just their au_id).  (Hint: use a group by).


-- List those stores that are in the same state as some other 
-- store.  Only print out stores once.


-- Show the names of the authors that have had (at least) 
-- one of their books sold in California.  (Hint: using group by)


-- Write a query listing all the publishers along with 
-- the number of stores in their state.


-- List those authors (if any) who live in the same city 
-- as a publisher of one of their books.


-- List all pairs of authors that haven't written a book 
-- together.


-- For each state, find the store that has sold more titles 
-- than any other in that state.


/*

								Subqueries
                                
*/

-- Using a subquery, list those titles that have 2 or more co-authors, indicating how many co-authors there were.  Don't print out the author names.


-- Using a subquery, how many titles have each of the authors written?  Identify authors by their first and last name (rather than just their au_id) 


-- Using a subquery, show the names of the authors that have had (at least) one of their books sold in California.

	
-- Using a subquery, write a query listing all the publishers along with the number of stores in their state.


-- List those stores that have no publisher in their state.


-- Using derived tables (subquery in the FROM clause), return those books that cost most than the average for their particular type.

