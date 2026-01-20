USE pubs;

/*
	INSERT
*/

-- Exercise 1
-- Insert a new store with the following values:
-- Store ID: '9000', Name: 'Books Galore', 
-- Address: '123 Main St.', City: 'Anytown', State: 'NY', 
-- Zip: '12345'
INSERT INTO stores 
VALUES ('9000', 'Books Galore', '123 Main St.', 'Anytown', 'NY', '12345');

-- Exercise 2
-- Insert a new employee with the following values:
-- Employee ID: 'XYZ123', First Name: 'John', Middle Initial: 'D', Last Name: 'Smith',
-- Job ID: 6, Manager ID: 215, Department ID: '9952', Birthdate: '19800101'
INSERT INTO employee 
VALUES ('XYZ123', 'John', 'D', 'Smith', 6, 215, '9952', '19800101');

-- Exercise 3
-- Insert a new sale with the following values:
-- Store ID: '7066', Product ID: 'XYZ789', Sale Date: '20230621', 
-- Quantity: 10, Terms: 'Net 30', Royalty ID: 'PS2091'
INSERT INTO sales 
VALUES ('7066', 'XYZ789', '20230621', 10, 'Net 30', 'PS2091');

-- Ecercise 4
-- Insert a new discount with the following values:
-- Discount Type: 'Bundle Discount', Store ID: NULL, 
-- Min Quantity: 100, Max Quantity: 1000, Percentage: 8.5
INSERT INTO discounts 
VALUES ('Bundle Discount', NULL, 100, 1000, 8.5);

-- Ecercise 5
-- Insert a new roysched with the following values:
-- Royalty ID: 'BU1032', Min Quantity: 5000, Max Quantity: 10000, Percentage: 15
INSERT INTO roysched VALUES ('BU1032', 5000, 10000, 15);

/*

	UPDATE
                                    
	For the update/delete exercises:
                                    
	Preferences -> SQL Editor and deselect the "Safe Updates" 
                   option
                                    
	or run
                                    
	SET SQL_SAFE_UPDATES = 0;
                                    
*/



SET SQL_SAFE_UPDATES = 0;


-- Exercise 1: Update job level of all employees to 20 where 
-- current job level is less than 100
UPDATE employee 
SET job_lvl = 20 
WHERE job_lvl < 100;


-- Exercise 2: Update the advance of the title 'Secrets 
-- of Silicon Valley' to 10000
UPDATE titles 
SET advance = 10000 
WHERE title = 'Secrets of Silicon Valley';

-- Exercise 3: Change all authors living in 'Oakland' city 
-- to 'San Francisco'
UPDATE authors 
SET city = 'San Francisco' 
WHERE city = 'Oakland';

-- Exercise 4: Update the store address to '1234 New Street' 
-- for the store named 'News & Brews'
UPDATE stores 
SET stor_address = '1234 New Street' 
WHERE stor_name = 'News & Brews';


-- Exercise 5: Increase the price of all titles by 10%
UPDATE titles 
SET price = price * 1.1;

-- Exercise 6: Update the royalty of the title with 
-- title_id 'BU1032' to 15
UPDATE titles 
SET royalty = 15 
WHERE title_id = 'BU1032';


-- Exercise 7: Update the city and country of the publisher 
-- with pub_id '0736' to 'Los Angeles' and 'USA'
UPDATE publishers 
SET city = 'Los Angeles', country = 'USA' 
WHERE pub_id = '0736';

-- Exercise 8: Change the type of all 'business' books 
-- to 'economy'
UPDATE titles 
SET type = 'economy' 
WHERE type = 'business';

-- Exercise 9: Set the phone number of all authors with 
-- last name 'Smith' to '123-456-7890'
UPDATE authors 
SET phone = '123-456-7890' 
WHERE au_lname = 'Smith';

-- Exercise 10: Increase the discount by 5% for all the 
-- discounts in store with stor_id '8042'
UPDATE discounts 
SET discount = discount + 5 
WHERE stor_id = '8042';



/*

	DELETE
                                    
*/

-- 1. Delete authors with first name starting with 'A' 
-- and living in 'Berkeley'
DELETE FROM authors 
WHERE au_fname LIKE 'A%' AND city = 'Berkeley';

-- 2. Delete all authors from cities starting with 'S'
DELETE FROM authors 
WHERE city LIKE 'S%';

-- 3. Delete authors whose last name ends with 'l' and 
-- live in 'Palo Alto'
DELETE FROM authors 
WHERE au_lname LIKE '%l' AND city = 'Palo Alto';

-- 4. Delete all authors from 'Berkeley' or 'Oakland'
DELETE FROM authors 
WHERE city IN ('Berkeley', 'Oakland');

-- 5. Delete all books with type 'business' and price 
-- greater than 15.00
DELETE FROM titles
WHERE type = 'business' AND price > 15.00;
