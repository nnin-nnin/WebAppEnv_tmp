CREATE DATABASE IF NOT EXISTS openedx CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE openedx;

CREATE TABLE IF NOT EXISTS auth_user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(150) NOT NULL UNIQUE,
    email VARCHAR(254) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    is_superuser TINYINT(1) DEFAULT 0,
    is_staff TINYINT(1) DEFAULT 0,
    is_active TINYINT(1) DEFAULT 1,
    first_name VARCHAR(150) DEFAULT '',
    last_name VARCHAR(150) DEFAULT '',
    date_joined DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS openedx_course (
    id INT AUTO_INCREMENT PRIMARY KEY,
    course_id VARCHAR(100) NOT NULL UNIQUE,
    title VARCHAR(255) NOT NULL,
    organization VARCHAR(100) NOT NULL,
    description TEXT,
    start_date DATE,
    pacing VARCHAR(50) DEFAULT 'self-paced'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS openedx_enrollment (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    course_id VARCHAR(100) NOT NULL,
    mode VARCHAR(50) DEFAULT 'audit',
    is_active TINYINT(1) DEFAULT 1,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES auth_user(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Seed Users
INSERT INTO auth_user (username, email, password, is_superuser, is_staff, is_active, first_name, last_name)
VALUES 
('admin', 'admin@example.com', 'AdminPassword123!', 1, 1, 1, 'System', 'Admin'),
('instructor', 'instructor@example.com', 'InstructorPassword123!', 0, 1, 1, 'Course', 'Instructor'),
('student', 'student@example.com', 'StudentPassword123!', 0, 0, 1, 'Jane', 'Student')
ON DUPLICATE KEY UPDATE password=VALUES(password);

-- Seed Courses
INSERT INTO openedx_course (course_id, title, organization, description, start_date, pacing)
VALUES
('course-v1:HarvardX+CS50+2026', 'CS50: Introduction to Computer Science', 'HarvardX', 'An introduction to the intellectual enterprises of computer science and the art of programming.', '2026-01-01', 'self-paced'),
('course-v1:MITx+6.00.1x+2026', 'Introduction to Computer Science and Programming Using Python', 'MITx', 'An introduction to computer science as a tool to solve real-world analytical problems using Python 3.', '2026-02-01', 'self-paced'),
('course-v1:MITx+6.002x+2026', 'Circuits and Electronics 1: Basic Circuit Analysis', 'MITx', 'Learn techniques that are foundational to the design of microchips used in smartphones and laptops.', '2026-03-01', 'self-paced'),
('course-v1:SecSys+SEC101+2026', 'Web Application Security & Penetration Testing', 'SecSys', 'Comprehensive hands-on training for discovering and remediating OWASP Top 10 vulnerabilities in modern web architectures.', '2026-01-15', 'self-paced'),
('course-v1:HarvardX+PH525.1x+2026', 'Data Science: R Basics', 'HarvardX', 'Build a foundation in R and learn how to wrangle, analyze, and visualize data.', '2026-02-15', 'self-paced')
ON DUPLICATE KEY UPDATE title=VALUES(title);

-- Seed Enrollments
INSERT INTO openedx_enrollment (user_id, course_id, mode, is_active)
SELECT u.id, 'course-v1:HarvardX+CS50+2026', 'verified', 1 FROM auth_user u WHERE u.username='admin'
ON DUPLICATE KEY UPDATE is_active=1;

INSERT INTO openedx_enrollment (user_id, course_id, mode, is_active)
SELECT u.id, 'course-v1:SecSys+SEC101+2026', 'verified', 1 FROM auth_user u WHERE u.username='admin'
ON DUPLICATE KEY UPDATE is_active=1;
