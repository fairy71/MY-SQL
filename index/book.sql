CREATE DATABASE library_db;
USE library_db;

CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    department VARCHAR(50),
    year INT
);
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    author VARCHAR(100),
    category VARCHAR(100),
    total_copies INT DEFAULT 1,
    available_copies INT DEFAULT 1
);
INSERT INTO students (name, email, department, year)
VALUES
('Aman Verma', 'aman@gmail.com', 'CSE', 2),
('Neha Singh', 'neha@gmail.com', 'IT', 3);

INSERT INTO books (title, author, category, total_copies, available_copies)
VALUES
('Clean Code', 'Robert C. Martin', 'Programming', 5, 5),
('Data Structures', 'Mark Weiss', 'CS', 3, 3);
INSERT INTO issue_records (student_id, book_id, issue_date)
VALUES (1, 2, CURDATE());

UPDATE books
SET available_copies = available_copies - 1
WHERE book_id = 2;
UPDATE issue_records
SET return_date = CURDATE(), status = 'Returned'
WHERE issue_id = 1;

UPDATE books
SET available_copies = available_copies + 1
WHERE book_id = 2;
SELECT s.name, b.title, i.issue_date
FROM issue_records i
JOIN students s ON i.student_id = s.student_id
JOIN books b ON i.book_id = b.book_id
WHERE i.status = 'Issued';

SELECT b.title, COUNT(*) AS issue_count
FROM issue_records i
JOIN books b ON i.book_id = b.book_id
GROUP BY b.title
ORDER BY issue_count DESC;
