
-- 1. Inner join authors with titleauthor based on au_id. 
--    (MySQL default JOIN is inner. Explicit use 
--    of INNER JOIN also valid.)

-- 2. Inner join titles with publishers and show 
--    only titles, price, and publisher name.  

-- 3. Inner join titles with publishers, and show 
--    the average price of books for each publisher.

-- 4. Inner join authors with titles and show 
--    only authors' names and titles' names. 
--    Hint: use your query solution from question 1 
--    to get started.

-- 5. Retrieve the title_id, number of authors  
--    of any titles with multiple authors.

-- 6. Edit the previous query to find the 
--    name of the title that has multiple authors.

-- 7. There are authors who have not published yet.
--    In other words, there are authors who do not
--    have titles.
--
-- 7a. Use titles, titleauthor, authors tables and what you  
--     know about LEFT and RIGHT joins to retrieve the au_id, 
--     au_lname, au_fname values of authors who have not
--     published

-- 7b. (discussion point): how does relational database is
--     engineered to prevent the deletion of rows in the 
--     titles and authors tables where the title_id and
--     au_id is referenced in the titleauthor table?
--     (answer): foreign key constraints on titleauthor.title_id. 
--     titleauthor.au_id. This is explained in module 6.
