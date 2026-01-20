/*
	MySQL  String Functions

*/

-- 1. Find all authors whose first name starts with 'A'. Use the LEFT() function.


-- 2. List all authors by their initials. Use the CONCAT() and LEFT() functions.

-- 3. Find all authors whose phone numbers have '415' as the area code. Use the SUBSTRING() function.

-- 4. Convert the first name of authors to lower case. Use the LOWER() function.

-- 5. Find the length of the first names of all authors. Use the CHAR_LENGTH() function.

-- 6. Find all authors whose last name contains 'er'. Use the LOCATE() function.

-- 7. Reverse the order of the first and last names of all authors. Use the CONCAT() and REVERSE() functions.


/*

				MySQL Date and Time Functions
			
*/

-- Exercise 1: Find the current date.

-- Exercise 2: Find out how many days have passed since the start of the year.

-- Exercise 3: Display the hire date of employees in the format 'YYYY-MM-DD'.

-- Exercise 4: List all employees who were hired in the month of December, regardless of the year.

-- Exercise 5: Find out how many days ago each employee was hired.

-- Exercise 6: Display the order date of each sale in the format 'YYYY-MM-DD'.

-- Exercise 7: List all sales made in the first quarter of any year.

-- Exercise 8: Find out how many days ago each sale was made.

-- Exercise 9: Display today's date and time in the format 'YYYY-MM-DD HH:MM:SS'.



/*

					MySQL Aggregate Functions

*/

-- Exercise 1: Count the total number of authors.

-- Exercise 2: Find the average price of all titles.

-- Exercise 3: Find the minimum and maximum advance given for any title.

-- Exercise 4: Calculate the total sales for each store.

-- Exercise 5: Find out the number of titles published by each publisher.

-- Exercise 6: Find out the total number of employees working for each publisher.

-- Exercise 7: Calculate the total royalties paid for each title.

-- Exercise 8: Find the author who has written the most books.

-- Exercise 9: For each publisher, calculate the average price of the books they publish.

-- Exercise 10: Find the total number of orders for each book.

/*

				MySQL Control Flow Functions

*/

-- Exercise 1: Use IF() to classify the titles into expensive (price > 20) and cheap (otherwise).

-- Exercise 2: Use CASE to classify authors based on their state.

-- Exercise 3: Use IFNULL to replace NULL in address column with 'No Address Provided' in authors table.

-- Exercise 4: Use NULLIF to replace 'UNKNOWN' with NULL in phone column in authors table.

-- Exercise 5: Use COALESCE to find the first non-null values of address, city, and state in authors table.

-- Exercise 6: Use IF() to classify the sales into High (qty > 100), Medium (qty between 50 and 100) and Low (otherwise).

-- Exercise 7: Use CASE to give a rating to the titles based on their price.

-- Exercise 8: Use IFNULL() to classify publishers based on their location. If the state is NULL replace it with 'UNKNOWN'.

-- Exercise 9: Use NULLIF to replace 'UNKNOWN' with NULL in phone column in authors table and then use COALESCE to replace NULL with 'No Phone Provided'.

-- Exercise 10: Use CASE to classify the authors based on their contract status. If contract = 1, they are 'Contracted', otherwise 'Non-contracted'.

