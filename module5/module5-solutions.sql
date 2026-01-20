USE pubs;

-- 1. Inner join authors with titleauthor based on au_id. 
--    (MySQL default JOIN is inner. Explicit use 
--    of INNER JOIN also valid.)
SELECT * FROM authors 
JOIN titleauthor 
ON authors.au_id = titleauthor.au_id;

-- 2. Inner join titles with publishers and show 
--    only titles, price, and publisher name. 
SELECT titles.title, titles.price, publishers.pub_name 
FROM titles 
JOIN publishers 
ON titles.pub_id = publishers.pub_id;

-- 3. Inner join titles with publishers, and show 
--    the average price of books for each publisher.
SELECT publishers.pub_name, AVG(titles.price) 
FROM titles 
JOIN publishers 
ON titles.pub_id = publishers.pub_id 
GROUP BY publishers.pub_id;

-- 4. Inner join authors with titles and show 
--    only authors' names and titles' names. 
--    Hint: use your query solution from question 1 
--    to get started.
SELECT authors.au_fname, authors.au_lname, titles.title 
FROM authors 
JOIN titleauthor 
ON authors.au_id = titleauthor.au_id 
JOIN titles 
ON titleauthor.title_id = titles.title_id;

-- 5. Retrieve the title_id, number of authors  
--    of any titles with multiple authors.
SELECT titleauthor.title_id, 
       COUNT(authors.au_id) AS num_authors
FROM authors 
JOIN titleauthor 
ON authors.au_id = titleauthor.au_id 
GROUP BY titleauthor.title_id
HAVING num_authors > 1;


-- 6. Edit the previous query to find the 
--    name of the title that has multiple authors. 
SELECT titles.title, 
       COUNT(authors.au_id) AS num_authors
FROM authors 
JOIN titleauthor ON authors.au_id = titleauthor.au_id  
JOIN titles ON titleauthor.title_id = titles.title_id 
GROUP BY titleauthor.title_id 
HAVING num_authors >1;

-- 7. There are authors who have not published yet.
--    In other words, there are authors who do not
--    have titles.
--
-- 7a. Use titles, titleauthor, authors tables and what you  
--     know about LEFT and RIGHT joins to retrieve the au_id, 
--     au_lname, au_fname values of authors who have not
--     published
SELECT a.au_id, a.au_lname, a.au_fname
FROM titles t
JOIN titleauthor ta ON ta.title_id = t.title_id 
RIGHT JOIN authors a ON a.au_id = ta.au_id  
WHERE t.title is NULL;

-- 7b. (discussion point): how does relational database is
--     engineered to prevent the deletion of rows in the 
--     titles and authors tables where the title_id and
--     au_id is referenced in the titleauthor table?
--     (answer): foreign key constraints on titleauthor.title_id. 
--     titleauthor.au_id. This is explained in module 6.

