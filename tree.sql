CREATE DATABASE student_db;
USE student_db;

CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    age INT,
    city VARCHAR(50)
);

INSERT INTO students (name, email, age, city) VALUES
('Aman', 'aman@gmail.com', 20, 'Delhi'),
('Simran', 'simran@gmail.com', 22, 'Mumbai');


SELECT * FROM students;

UPDATE students
SET city = 'Chandigarh'
WHERE id = 1;


DELETE FROM students
WHERE id = 2;


import mysql.connector

db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="student_db"
)

cursor = db.cursor()

# Insert record
def add_student(name, email, age, city):
    query = "INSERT INTO students (name, email, age, city) VALUES (%s, %s, %s, %s)"
    values = (name, email, age, city)
    cursor.execute(query, values)
    db.commit()
    print("Student Added Successfully!")

# Read all records
def get_students():
    cursor.execute("SELECT * FROM students")
    result = cursor.fetchall()
    for row in result:
        print(row)

# Update record
def update_city(student_id, new_city):
    query = "UPDATE students SET city=%s WHERE id=%s"
    values = (new_city, student_id)
    cursor.execute(query, values)
    db.commit()
    print("City Updated!")

# Delete record
def delete_student(student_id):
    query = "DELETE FROM students WHERE id=%s"
    cursor.execute(query, (student_id,))
    db.commit()
    print("Student Deleted!")


# Test the functions
add_student("Rahul", "rahul@gmail.com", 24, "Punjab")
get_students()
update_city(1, "Noida")
delete_student(3)
