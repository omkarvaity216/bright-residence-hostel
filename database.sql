-- MySQL Database Schema for Bright Residence Hostel  

CREATE TABLE students (  
    student_id INT AUTO_INCREMENT PRIMARY KEY,  
    name VARCHAR(100) NOT NULL,  
    email VARCHAR(100) UNIQUE NOT NULL,  
    phone_number VARCHAR(15),  
    date_of_birth DATE,  
    enrollment_date DATETIME DEFAULT CURRENT_TIMESTAMP  
);  

CREATE TABLE rooms (  
    room_id INT AUTO_INCREMENT PRIMARY KEY,  
    room_number VARCHAR(10) UNIQUE NOT NULL,  
    room_type ENUM('single', 'double', 'suite') NOT NULL,  
    capacity INT NOT NULL,  
    price DECIMAL(10, 2) NOT NULL,  
    availability BOOLEAN DEFAULT TRUE  
);  

CREATE TABLE fee_structure (  
    fee_id INT AUTO_INCREMENT PRIMARY KEY,  
    description VARCHAR(255),  
    amount DECIMAL(10, 2) NOT NULL  
);  

CREATE TABLE fees (  
    fee_record_id INT AUTO_INCREMENT PRIMARY KEY,  
    student_id INT,  
    fee_id INT,  
    due_date DATE,  
    paid BOOLEAN DEFAULT FALSE,  
    FOREIGN KEY (student_id) REFERENCES students(student_id),  
    FOREIGN KEY (fee_id) REFERENCES fee_structure(fee_id)  
);  

CREATE TABLE room_allocation (  
    allocation_id INT AUTO_INCREMENT PRIMARY KEY,  
    student_id INT,  
    room_id INT,  
    allocation_date DATETIME DEFAULT CURRENT_TIMESTAMP,  
    FOREIGN KEY (student_id) REFERENCES students(student_id),  
    FOREIGN KEY (room_id) REFERENCES rooms(room_id)  
);  

CREATE TABLE staff (  
    staff_id INT AUTO_INCREMENT PRIMARY KEY,  
    name VARCHAR(100) NOT NULL,  
    role VARCHAR(50),  
    email VARCHAR(100) UNIQUE,  
    phone_number VARCHAR(15)  
);  

CREATE TABLE visitor_logs (  
    visitor_id INT AUTO_INCREMENT PRIMARY KEY,  
    visitor_name VARCHAR(100) NOT NULL,  
    visit_date DATETIME DEFAULT CURRENT_TIMESTAMP,  
    student_id INT,  
    FOREIGN KEY (student_id) REFERENCES students(student_id)  
);  

CREATE TABLE bookings (  
    booking_id INT AUTO_INCREMENT PRIMARY KEY,  
    student_id INT,  
    room_id INT,  
    booking_date DATETIME DEFAULT CURRENT_TIMESTAMP,  
    check_in_date DATE NOT NULL,  
    check_out_date DATE NOT NULL,  
    FOREIGN KEY (student_id) REFERENCES students(student_id),  
    FOREIGN KEY (room_id) REFERENCES rooms(room_id)  
);  

CREATE TABLE users (  
    user_id INT AUTO_INCREMENT PRIMARY KEY,  
    username VARCHAR(50) UNIQUE NOT NULL,  
    password_hash VARCHAR(255) NOT NULL,  
    role ENUM('admin', 'staff', 'student') NOT NULL  
);  

-- Add additional constraints, indexes, and relationships as necessary  
