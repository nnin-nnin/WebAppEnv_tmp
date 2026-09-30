CREATE DATABASE IF NOT EXISTS `hospital` CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `hospital`;

-- Table structure for table `admin`
CREATE TABLE IF NOT EXISTS `admin` (
  `Username` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  PRIMARY KEY (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Seed administrator account
INSERT INTO `admin` (`Username`, `Password`) VALUES ('admin', 'AdminPassword123!')
ON DUPLICATE KEY UPDATE `Password`='AdminPassword123!';

-- Table structure for table `doctor`
CREATE TABLE IF NOT EXISTS `doctor` (
  `doctorID` varchar(50) NOT NULL,
  `dname` varchar(50) NOT NULL,
  `address` varchar(70) DEFAULT NULL,
  `phoneno` varchar(15) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `password` varchar(50) NOT NULL,
  `specilist` varchar(50) DEFAULT NULL,
  `dimage` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`doctorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Seed default doctor
INSERT INTO `doctor` (`doctorID`, `dname`, `address`, `phoneno`, `gender`, `password`, `specilist`, `dimage`)
VALUES ('doc@example.com', 'Dr. Smith', 'Medical Center Ave 101', '1234567890', 'Male', 'DocPassword123!', 'General Medicine', 'doc.jpg')
ON DUPLICATE KEY UPDATE `dname`=VALUES(`dname`);

-- Table structure for table `patient`
CREATE TABLE IF NOT EXISTS `patient` (
  `patientID` varchar(50) NOT NULL,
  `pname` varchar(50) NOT NULL,
  `age` float(5,1) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `address` varchar(70) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `password` varchar(50) NOT NULL,
  `pimage` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`patientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Seed default patient
INSERT INTO `patient` (`patientID`, `pname`, `age`, `gender`, `address`, `phone`, `password`, `pimage`)
VALUES ('patient@example.com', 'John Doe', 30.0, 'Male', 'Baker Street 221B', '9876543210', 'PatientPassword123!', 'patient.jpg')
ON DUPLICATE KEY UPDATE `pname`=VALUES(`pname`);

-- Table structure for table `report`
CREATE TABLE IF NOT EXISTS `report` (
  `reportID` varchar(50) NOT NULL,
  `patientID` varchar(50) NOT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `reportf` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`reportID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table structure for table `appointment`
CREATE TABLE IF NOT EXISTS `appointment` (
  `patientID` varchar(50) NOT NULL,
  `doctorID` varchar(50) NOT NULL,
  `app_no` varchar(50) NOT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  PRIMARY KEY (`doctorID`, `app_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table structure for table `history`
CREATE TABLE IF NOT EXISTS `history` (
  `patientID` varchar(50) NOT NULL,
  `doctorID` varchar(50) NOT NULL,
  `details` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table structure for table `docdays`
CREATE TABLE IF NOT EXISTS `docdays` (
  `doctorID` varchar(50) NOT NULL,
  `days` varchar(100) NOT NULL,
  `time` time DEFAULT NULL,
  PRIMARY KEY (`doctorID`, `days`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table structure for table `feedback`
CREATE TABLE IF NOT EXISTS `feedback` (
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
