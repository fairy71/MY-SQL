CREATE DATABASE library_db;
USE library_db;

CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150),
    author VARCHAR(100),
    genre VARCHAR(50),
    publication_year INT,
    available_copies INT DEFAULT 1
);

CREATE TABLE members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    join_date DATE
);

CREATE TABLE issue_records (
    issue_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    member_id INT,
    issue_date DATE,
    return_date DATE,
    status ENUM('Issued', 'Returned') DEFAULT 'Issued',
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);
