create database if not exists Student_Database_Management;
use Student_Database_Management;

-- Students Table
CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    email VARCHAR(100),
    phone VARCHAR(15)
);

-- Courses Table
CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100),
    course_description TEXT,
    credits INT
);

-- Enrollments Table
CREATE TABLE Enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    grade CHAR(1),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- 2.Insert Data

-- Insert Data into Students Table
INSERT INTO Students (first_name, last_name, date_of_birth, email, phone)
VALUES
('Karthik', 'Selvan', '2000-01-15', 'karthik.selvan@example.com', '1234567890'),
('Bharath', 'Kumar', '2001-05-22', 'Bharath.Kumar@example.com', '0987654321');

-- Insert Data into Courses Table
INSERT INTO Courses (course_name, course_description, credits)
VALUES
('Database Management', 'Introduction to relational databases.', 4),
('Web Development', 'Building modern web applications.', 3);

-- Insert Data into Enrollments Table
INSERT INTO Enrollments (student_id, course_id, grade)
VALUES
(1, 1, 'A'),
(1, 2, 'B'),
(2, 1, 'A');

-- 3.SQL Queries to Manage Records

-- Fetch All Students
SELECT * FROM Students;
-- Fetch All Courses
SELECT * FROM courses;
-- Fetch All Enrollments
SELECT * FROM enrollments;

-- Fetch Students Enrolled in a Specific Course
SELECT s.first_name, 
       s.last_name, 
       c.course_name, 
       e.grade
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE c.course_name = 'Database Management';

-- Fetch Courses Taken by a Specific Student
SELECT c.course_name, c.credits, e.grade
FROM Courses c
JOIN Enrollments e ON c.course_id = e.course_id
JOIN Students s ON e.student_id = s.student_id
WHERE s.first_name = 'karthik' AND s.last_name = 'selvan';

-- Update a Student’s Grade
UPDATE Enrollments
SET grade = 'A'
WHERE enrollment_id = 2;

-- Delete a Student Record
DELETE FROM Students
WHERE student_id = 2;

-- 4.Combining Data from Multiple Tables

-- Fetch Full Student Report (Combining All Tables)
SELECT 
    s.student_id, 
    s.first_name, 
    s.last_name, 
    c.course_name, 
    c.credits, 
    e.grade
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id;






