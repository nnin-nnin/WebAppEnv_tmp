CREATE DATABASE IF NOT EXISTS `advocate1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `advocate1`;

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT 'Admin',
  `email` varchar(255) DEFAULT 'admin@example.com',
  `photo` varchar(255) DEFAULT '74advdp.png',
  `status` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `admin` (`id`, `username`, `password`, `name`, `email`, `photo`, `status`) VALUES
(1, 'admin', 'c944bfbf3c6f9928cd75a71f2cd2fc0ed9b6e672e9f4324d39fc42eb337ef8e0', 'Admin', 'admin@example.com', '74advdp.png', 0);

DROP TABLE IF EXISTS `clients`;
CREATE TABLE `clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `dob` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `clients` (`id`, `name`, `gender`, `dob`, `email`, `mobile`, `address`, `status`) VALUES
(1, 'John Doe', 'Male', '1990-01-01', 'john@example.com', '1234567890', '123 Main St', 0);

DROP TABLE IF EXISTS `case_types`;
CREATE TABLE `case_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `case_types` (`id`, `name`, `status`) VALUES
(1, 'Civil', 0),
(2, 'Criminal', 0);

DROP TABLE IF EXISTS `court`;
CREATE TABLE `court` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `court` (`id`, `name`, `status`) VALUES
(1, 'High Court', 0),
(2, 'District Court', 0);

DROP TABLE IF EXISTS `case_stage`;
CREATE TABLE `case_stage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `case_stage` (`id`, `name`, `status`) VALUES
(1, 'Initial Hearing', 0),
(2, 'Evidence', 0);

DROP TABLE IF EXISTS `legel_acts`;
CREATE TABLE `legel_acts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `act_name` varchar(255) NOT NULL,
  `status` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `legel_acts` (`id`, `act_name`, `status`) VALUES
(1, 'IPC 302', 0),
(2, 'CPC Section 9', 0);

DROP TABLE IF EXISTS `case_register`;
CREATE TABLE `case_register` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `case_no` varchar(255) NOT NULL,
  `client_name` int(11) NOT NULL,
  `court` int(11) NOT NULL,
  `case_type` int(11) NOT NULL,
  `case_stage` int(11) NOT NULL,
  `legel_acts` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `filling_date` varchar(50) DEFAULT NULL,
  `hearing_date` varchar(50) DEFAULT NULL,
  `opposite_lawyer` varchar(255) DEFAULT NULL,
  `total_fees` varchar(50) DEFAULT NULL,
  `unpaid` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `case_register` (`id`, `title`, `case_no`, `client_name`, `court`, `case_type`, `case_stage`, `legel_acts`, `description`, `filling_date`, `hearing_date`, `opposite_lawyer`, `total_fees`, `unpaid`, `status`) VALUES
(1, 'Property Dispute', 'CS-2024-001', 1, 1, 1, 1, 1, 'Sample case description', '2024-01-01', '2024-06-01', 'Smith & Co', '5000', '1000', 0);
