-- 1. Create a new database named 'myDatabase'
CREATE DATABASE myDatabase;

-- 2. Switch to the newly created database
USE myDatabase;

-- 3. Create a 'students' table with columns: 
-- student_id (numeric, primary key), 
-- first_name (string), last_name (string), date_of_birth (date)
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE
);

-- 4. Create a 'courses' table with columns: 
-- course_id (numeric, primary key, auto increment), 
-- course_name (string), credit_hours (numeric)
CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(50),
    credit_hours INT
);

-- 5. Add a unique constraint to the course_name column 
-- in the 'courses' table
ALTER TABLE courses 
ADD CONSTRAINT UC_Course UNIQUE (course_name);

-- 6. Create a 'professors' table with columns: 
-- professor_id (numeric, primary key, auto increment), 
-- first_name (string), last_name (string), subject (string)
CREATE TABLE professors (
    professor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    subject VARCHAR(50)
);

-- 7. Add a not null constraint to the subject column 
-- in the 'professors' table
ALTER TABLE professors MODIFY subject VARCHAR(50) NOT NULL;

-- 8. Create a 'classrooms' table with columns: 
-- classroom_id (numeric, primary key, auto increment), 
-- classroom_name (string), capacity (numeric)
CREATE TABLE classrooms (
    classroom_id INT AUTO_INCREMENT PRIMARY KEY,
    classroom_name VARCHAR(50),
    capacity INT
);

-- 9. Add a check constraint to the capacity column in 
-- the 'classrooms' table such that capacity should be 
-- greater than 0
ALTER TABLE classrooms 
ADD CONSTRAINT CHK_Classrooms_Capacity CHECK (capacity > 0);

-- 10. Create a 'enrollment' table to track which student 
-- is taking which course. The table should have the following columns: enrollment_id (numeric, primary key, auto increment), student_id (reference to the students table), course_id (reference to the courses table)
CREATE TABLE enrollment (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
