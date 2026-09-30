CREATE DATABASE IF NOT EXISTS `hostel_management_system` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `hostel_management_system`;

DROP TABLE IF EXISTS `Application`;
DROP TABLE IF EXISTS `Message`;
DROP TABLE IF EXISTS `Hostel_Manager`;
DROP TABLE IF EXISTS `Student`;
DROP TABLE IF EXISTS `Room`;
DROP TABLE IF EXISTS `Hostel`;

CREATE TABLE `Hostel` (
  `Hostel_id` int(10) NOT NULL AUTO_INCREMENT,
  `Hostel_name` varchar(255) NOT NULL,
  `current_no_of_rooms` varchar(255) DEFAULT NULL,
  `No_of_rooms` varchar(255) DEFAULT NULL,
  `No_of_students` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Hostel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

INSERT INTO `Hostel` (`Hostel_id`, `Hostel_name`, `current_no_of_rooms`, `No_of_rooms`, `No_of_students`) VALUES
(1, 'A', NULL, '400', NULL),
(2, 'B', NULL, '400', NULL),
(3, 'C', NULL, '400', NULL),
(4, 'D', NULL, '400', NULL),
(5, 'E', NULL, '400', NULL),
(6, 'F', NULL, '400', NULL);

CREATE TABLE `Room` (
  `Room_id` int(10) NOT NULL AUTO_INCREMENT,
  `Hostel_id` int(10) NOT NULL,
  `Room_No` int(10) NOT NULL,
  `Allocated` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`Room_id`),
  KEY `Hostel_id` (`Hostel_id`),
  CONSTRAINT `Room_ibfk_1` FOREIGN KEY (`Hostel_id`) REFERENCES `Hostel` (`Hostel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `Room` (`Room_id`, `Hostel_id`, `Room_No`, `Allocated`) VALUES
(1, 1, 101, 1),
(2, 1, 102, 0),
(3, 1, 103, 0),
(4, 1, 104, 0),
(5, 2, 201, 0),
(6, 2, 202, 0);

CREATE TABLE `Student` (
  `Student_id` varchar(255) NOT NULL,
  `Fname` varchar(255) NOT NULL,
  `Lname` varchar(255) NOT NULL,
  `Mob_no` varchar(255) NOT NULL,
  `Dept` varchar(255) NOT NULL,
  `Year_of_study` varchar(255) NOT NULL,
  `Pwd` longtext NOT NULL,
  `Hostel_id` int(10) DEFAULT NULL,
  `Room_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`Student_id`),
  KEY `Hostel_id` (`Hostel_id`),
  KEY `Room_id` (`Room_id`),
  CONSTRAINT `Student_ibfk_1` FOREIGN KEY (`Hostel_id`) REFERENCES `Hostel` (`Hostel_id`),
  CONSTRAINT `Student_ibfk_2` FOREIGN KEY (`Room_id`) REFERENCES `Room` (`Room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `Student` (`Student_id`, `Fname`, `Lname`, `Mob_no`, `Dept`, `Year_of_study`, `Pwd`, `Hostel_id`, `Room_id`) VALUES
('B160497CS', 'Prajwal', 'Ghoradkar', '09757318791', 'CSE', '3', '$2y$10$6VLlOHcoaj4t.R0biFJmW.EsNcw7wsYFEk3CRzq9MnklMIxwc5vhG', 1, 1);

CREATE TABLE `Hostel_Manager` (
  `Hostel_man_id` int(10) NOT NULL AUTO_INCREMENT,
  `Username` varchar(255) NOT NULL,
  `Fname` varchar(255) NOT NULL,
  `Lname` varchar(255) NOT NULL,
  `Mob_no` varchar(255) NOT NULL,
  `Hostel_id` int(10) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Pwd` LONGTEXT NOT NULL,
  `Isadmin` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`Hostel_man_id`),
  UNIQUE (`Username`),
  KEY `Hostel_id` (`Hostel_id`),
  CONSTRAINT `Hostel_Manager_ibfk_1` FOREIGN KEY (`Hostel_id`) REFERENCES `Hostel` (`Hostel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `Hostel_Manager` (`Hostel_man_id`, `Username`, `Fname`, `Lname`, `Mob_no`, `Hostel_id`, `Email`, `Pwd`, `Isadmin`) VALUES
(1, 'admin', 'System', 'Administrator', '9999999999', 1, 'admin@example.com', '$2y$10$6VLlOHcoaj4t.R0biFJmW.EsNcw7wsYFEk3CRzq9MnklMIxwc5vhG', 1),
(2, 'manager1', 'Hostel', 'Manager', '8888888888', 1, 'manager@example.com', '$2y$10$6VLlOHcoaj4t.R0biFJmW.EsNcw7wsYFEk3CRzq9MnklMIxwc5vhG', 0);

CREATE TABLE `Application` (
  `Application_id` int(100) NOT NULL AUTO_INCREMENT,
  `Student_id` varchar(255) NOT NULL,
  `Hostel_id` int(10) NOT NULL,
  `Application_status` tinyint(1) DEFAULT NULL,
  `Room_No` int(10) DEFAULT NULL,
  `Message` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Application_id`),
  KEY `Student_id` (`Student_id`),
  KEY `Hostel_id` (`Hostel_id`),
  CONSTRAINT `Application_ibfk_1` FOREIGN KEY (`Student_id`) REFERENCES `Student` (`Student_id`),
  CONSTRAINT `Application_ibfk_2` FOREIGN KEY (`Hostel_id`) REFERENCES `Hostel` (`Hostel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `Application` (`Application_id`, `Student_id`, `Hostel_id`, `Application_status`, `Room_No`, `Message`) VALUES
(1, 'B160497CS', 1, 1, 101, 'I am a handicapped, so I would like to have a room at ground floor ');

CREATE TABLE `Message` (
  `msg_id` int(10) NOT NULL AUTO_INCREMENT,
  `sender_id` varchar(255) DEFAULT NULL,
  `receiver_id` varchar(255) DEFAULT NULL,
  `hostel_id` int(10) DEFAULT NULL,
  `subject_h` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `msg_date` varchar(255) DEFAULT NULL,
  `msg_time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`msg_id`),
  KEY `hostel_id` (`hostel_id`),
  CONSTRAINT `Message_ibfk_1` FOREIGN KEY (`hostel_id`) REFERENCES `Hostel` (`Hostel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `Message` (`msg_id`, `sender_id`, `receiver_id`, `hostel_id`, `subject_h`, `message`, `msg_date`, `msg_time`) VALUES
(1, 'B160497CS', '1', 1, 'Ground Floor Request', 'Ground floor room request', '2026-09-30', '10:00 AM');
