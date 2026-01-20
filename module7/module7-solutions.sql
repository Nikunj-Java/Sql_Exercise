USE pubs;

/*
	MySQL  String Functions

*/

-- 1. Find all authors whose first name starts with 'A'. 
-- Use the LEFT() function.
SELECT * FROM authors 
WHERE LEFT(au_fname, 1) = 'A';

-- 2. List all authors by their initials. Use the CONCAT() 
-- and LEFT() functions.
SELECT CONCAT(LEFT(au_fname, 1), '.', LEFT(au_lname, 1), '.') as Initials 
FROM authors;

-- 3. Find all authors whose phone numbers have '415' 
-- as the area code. Use the SUBSTRING() function.
SELECT * FROM authors 
WHERE SUBSTRING(phone, 1, 3) = '415';

-- 4. Convert the first name of authors to lower case. 
-- Use the LOWER() function.
SELECT LOWER(au_fname) FROM authors;

-- 5. Find the length of the first names of all authors. 
-- Use the CHAR_LENGTH() function.
SELECT au_fname, CHAR_LENGTH(au_fname) as length FROM authors;

-- 6. Find all authors whose last name contains 'er'. 
-- Use the LOCATE() function.
SELECT * FROM authors 
WHERE LOCATE('er', au_lname) > 0;

-- 7. Reverse the order of the first and last names of 
-- all authors. Use the CONCAT() and REVERSE() functions.
SELECT CONCAT(REVERSE(au_lname), ' ', REVERSE(au_fname)) as Reversed_Name 
FROM authors;


/*

	MySQL Date and Time Functions
			
*/

-- Exercise 1: Find the current date.
SELECT CURDATE();

-- Exercise 2: Find out how many days have passed since 
-- the start of the year.
SELECT DATEDIFF(CURDATE(), CONCAT(YEAR(CURDATE()),'-01-01'));

-- Exercise 3: Display the hire date of employees in 
-- the format 'YYYY-MM-DD'.
SELECT emp_id, 
       CONCAT(LEFT(hire_date, 4), '-', MID(hire_date, 5, 2), '-', RIGHT(hire_date, 2)) AS formatted_date FROM employee;

-- Exercise 4: List all employees who were hired in 
-- the month of December, regardless of the year.
SELECT * FROM employee 
WHERE MID(hire_date, 5, 2) = '12';

-- Exercise 5: Find out how many days ago each employee 
-- was hired.
SELECT emp_id, 
       DATEDIFF(CURDATE(), 
                CONCAT(LEFT(hire_date, 4), 
                       '-', MID(hire_date, 5, 2), 
                       '-', RIGHT(hire_date, 2))) AS days_since_hired 
FROM employee;

-- Exercise 6: Display the order date of each sale in 
-- the format 'YYYY-MM-DD'.
SELECT ord_num, CONCAT(LEFT(ord_date, 4), '-', MID(ord_date, 5, 2), '-', RIGHT(ord_date, 2)) AS formatted_date FROM sales;

-- Exercise 7: List all sales made in the first quarter 
-- of any year.
SELECT * FROM sales WHERE MID(ord_date, 5, 2) IN ('01', '02', '03');

-- Exercise 8: Find out how many days ago each sale was made.
SELECT ord_num, DATEDIFF(CURDATE(), CONCAT(LEFT(ord_date, 4), '-', MID(ord_date, 5, 2), '-', RIGHT(ord_date, 2))) AS days_since_sale FROM sales;

-- Exercise 9: Display today's date and time in the format 'YYYY-MM-DD HH:MM:SS'.
SELECT NOW();


/*

	MySQL Aggregate Functions

*/

-- Exercise 1: Count the total number of authors.
SELECT COUNT(*) FROM authors;

-- Exercise 2: Find the average price of all titles.
SELECT AVG(price) FROM titles;

-- Exercise 3: Find the minimum and maximum advance given 
-- for any title.
SELECT MIN(advance), MAX(advance) FROM titles;

-- Exercise 4: Calculate the total sales for each store.
SELECT stor_id, SUM(qty) as total_sales 
FROM sales 
GROUP BY stor_id;

-- Exercise 5: Find out the number of titles published 
-- by each publisher.
SELECT pub_id, COUNT(*) as total_titles 
FROM titles 
GROUP BY pub_id;

-- Exercise 6: Find out the total number of employees 
-- working for each publisher.
SELECT pub_id, COUNT(*) as total_employees FROM employee 
GROUP BY pub_id;

-- Exercise 7: Calculate the total royalties paid for each title.
SELECT title_id, SUM(royaltyper) as total_royalties 
FROM titleauthor 
GROUP BY title_id;

-- Exercise 8: Find the author who has written the most books.
SELECT au_id, COUNT(*) as total_books 
FROM titleauthor 
GROUP BY au_id 
ORDER BY total_books DESC 
LIMIT 1;

-- Exercise 9: For each publisher, calculate the average 
-- price of the books they publish.
SELECT pub_id, AVG(price) as avg_price 
FROM titles 
GROUP BY pub_id;

-- Exercise 10: Find the total number of orders for each book.
SELECT title_id, COUNT(*) as total_orders 
FROM sales 
GROUP BY title_id;

/*

	MySQL Control Flow Functions

*/

-- Exercise 1: Use IF() to classify the titles into 
-- expensive (price > 20) and cheap (otherwise).
SELECT title_id, title, 
       IF(price > 20, 'Expensive', 'Cheap') as price_category 
FROM titles;

-- Exercise 2: Use CASE to classify authors based on their state.
SELECT au_id, au_fname, au_lname, 
       CASE 
           WHEN state = 'CA' THEN 'California'
           WHEN state = 'TX' THEN 'Texas'
           ELSE 'Other'
       END as location 
FROM authors;

-- Exercise 3: Use IFNULL to replace NULL in address column 
-- with 'No Address Provided' in authors table.
SELECT au_id, au_fname, au_lname, 
       IFNULL(address, 'No Address Provided') as address 
FROM authors;

-- Exercise 4: Use NULLIF to replace 'UNKNOWN' with NULL in phone column in authors table.
SELECT au_id, au_fname, au_lname, 
       NULLIF(phone, 'UNKNOWN') as phone 
FROM authors;

-- Exercise 5: Use COALESCE to find the first non-null 
-- values of address, city, and state in authors table.
SELECT au_id, au_fname, au_lname, 
       COALESCE(address, city, state) as location_info 
FROM authors;

-- Exercise 6: Use IF() to classify the sales into 
-- High (qty > 100), Medium (qty between 50 and 100) 
-- and Low (otherwise).
SELECT ord_num, ord_date, title_id, 
       IF(qty > 100, 'High', IF(qty > 50, 'Medium', 'Low')) as sales_category 
FROM sales;

-- Exercise 7: Use CASE to give a rating to the titles 
-- based on their price.
SELECT title_id, title, 
       CASE 
           WHEN price > 30 THEN 'Expensive'
           WHEN price > 20 THEN 'Moderate'
           ELSE 'Cheap'
       END as price_rating 
FROM titles;

-- Exercise 8: Use IFNULL() to classify publishers based 
-- on their location. If the state is NULL replace it with 'UNKNOWN'.
SELECT pub_id, pub_name, 
       IFNULL(state, 'UNKNOWN') as location 
FROM publishers;

-- Exercise 9: Use NULLIF to replace 'UNKNOWN' with NULL 
-- in phone column in authors table and then use 
-- COALESCE to replace NULL with 'No Phone Provided'.
SELECT au_id, au_fname, au_lname, 
       COALESCE(NULLIF(phone, 'UNKNOWN'), 'No Phone Provided') as phone 
FROM authors;

-- Exercise 10: Use CASE to classify the authors based 
-- on their contract status. If contract = 1, 
-- they are 'Contracted', otherwise 'Non-contracted'.
SELECT au_id, au_fname, au_lname, 
       CASE 
            WHEN contract = 1 THEN 'Contracted' 
            ELSE 'Non-contracted' 
       END as contract_status 
FROM authors;

