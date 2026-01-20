-- 1. Create a new database named 'myDatabase'

-- 2. Switch to the newly created database

-- 3. Create a 'students' table with columns: 
-- student_id (numeric, primary key), first_name (string), 
-- last_name (string), date_of_birth (date)

-- 4. Create a 'courses' table with columns: 
-- course_id (numeric, primary key, auto increment), 
-- course_name (string), credit_hours (numeric)

-- 5. Add a unique constraint to the course_name column 
-- in the 'courses' table

-- 6. Create a 'professors' table with columns: 
-- professor_id (numeric, primary key, auto increment), 
-- first_name (string), last_name (string), subject (string)

-- 7. Add a not null constraint to the subject column 
-- in the 'professors' table

-- 8. Create a 'classrooms' table with columns: 
-- classroom_id (numeric, primary key, auto increment), 
-- classroom_name (string), capacity (numeric)

-- 9. Add a check constraint to the capacity column in 
-- the 'classrooms' table such that capacity should be 
-- greater than 0

-- 10. Create a 'enrollment' table to track which student 
-- is taking which course. The table should have the following columns: enrollment_id (numeric, primary key, auto increment), student_id (reference to the students table), course_id (reference to the courses table)
