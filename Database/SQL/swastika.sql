-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 08, 2017 at 11:01 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `swastika`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrator`
--

CREATE TABLE `administrator` (
  `AdminId` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `empId` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `administrator`
--

INSERT INTO `administrator` (`AdminId`, `username`, `password`, `empId`) VALUES
(1, 'jayce', 'jayce123', 1);

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `empId` int(5) NOT NULL,
  `AttendedDate` date NOT NULL,
  `In-Time` time NOT NULL,
  `Out-Time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`empId`, `AttendedDate`, `In-Time`, `Out-Time`) VALUES
(1, '2017-05-29', '06:30:00', '17:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `bedid`
--

CREATE TABLE `bedid` (
  `bedId` int(3) NOT NULL,
  `patientId` int(3) NOT NULL,
  `wardId` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bedid`
--

INSERT INTO `bedid` (`bedId`, `patientId`, `wardId`) VALUES
(1, 2, 4),
(2, 3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `docId` int(3) NOT NULL,
  `empId` int(5) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`docId`, `empId`, `username`, `password`) VALUES
(1, 1, 'Jayce', 'Jayce123'),
(2, 7, 'Micheal', 'Micheal123');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `empId` int(5) NOT NULL,
  `FName` varchar(45) NOT NULL,
  `LName` varchar(45) NOT NULL,
  `DOB` date NOT NULL,
  `gender` enum('M','F') NOT NULL,
  `NIC` varchar(10) NOT NULL,
  `address` varchar(60) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `imgPath` varchar(220) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`empId`, `FName`, `LName`, `DOB`, `gender`, `NIC`, `address`, `contact`, `imgPath`) VALUES
(1, 'Jayce ', 'Bernard', '1989-05-13', 'M', '891343358V', '743/25A Muwanhelwatte Road Malabe', '+94772105844', 'E:/SCS Second Year/SCS 2104 Programming 3/Assignments/Take_Home_Assignment2017/Meta data for sample data sets/Jayce-Bernard.png'),
(4, 'Annie', 'Swanson', '1997-05-09', 'F', '951345689V', '789/25A Thibirigasyaya', '+95478211360', 'E:/SCS Second Year/SCS 2104 Programming 3/Assignments/Take_Home_Assignment2017/Meta data for sample data sets/Annie-Swanson.png'),
(6, 'Matt', 'Bloom', '1993-06-18', 'M', '935678898V', '45/45A Washingtin DC', '071568944', 'E:/SCS Second Year/SCS 2104 Programming 3/Assignments/Take_Home_Assignment2017/Meta data for sample data sets/Matt-Bloom.png'),
(7, 'Micheal', 'Herera', '2017-06-20', 'M', '985465582V', '8787Szas', '0778945612', 'E:/SCS Second Year/SCS 2104 Programming 3/Assignments/Take_Home_Assignment2017/Meta data for sample data sets/Micheal-Hereara.png');

-- --------------------------------------------------------

--
-- Table structure for table `emp_payment`
--

CREATE TABLE `emp_payment` (
  `payslipId` int(4) NOT NULL,
  `empId` int(5) NOT NULL,
  `attended_days` int(11) DEFAULT NULL,
  `payment` int(11) DEFAULT NULL,
  `checkedBy` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `labtechnician`
--

CREATE TABLE `labtechnician` (
  `labTechId` int(3) NOT NULL,
  `empId` int(5) NOT NULL,
  `roomId` int(2) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `labtechnician`
--

INSERT INTO `labtechnician` (`labTechId`, `empId`, `roomId`, `username`, `password`) VALUES
(1, 6, 5, 'Matt', 'Matt123');

-- --------------------------------------------------------

--
-- Table structure for table `nurse`
--

CREATE TABLE `nurse` (
  `nurseId` int(3) NOT NULL,
  `empId` int(5) NOT NULL,
  `wardId` int(3) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nurse`
--

INSERT INTO `nurse` (`nurseId`, `empId`, `wardId`, `username`, `password`) VALUES
(2, 4, 0, 'Annie', 'Annie123');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patientId` int(3) NOT NULL,
  `FName` varchar(45) NOT NULL,
  `LName` varchar(45) NOT NULL,
  `gender` enum('M','F') DEFAULT NULL,
  `NIC` varchar(45) NOT NULL,
  `DOB` date NOT NULL,
  `address` varchar(60) NOT NULL,
  `guardianName` varchar(45) NOT NULL,
  `guardianContact` varchar(12) NOT NULL,
  `wardId` int(3) DEFAULT NULL,
  `admitDate` date NOT NULL,
  `consultDocId` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patientId`, `FName`, `LName`, `gender`, `NIC`, `DOB`, `address`, `guardianName`, `guardianContact`, `wardId`, `admitDate`, `consultDocId`) VALUES
(2, 'Nimesha ', 'Kalinga', 'M', '951358444V', '1995-08-13', '785/25A Kale Road Ragama	', 'Oshan Wick', '+94778922362', 4, '2017-05-11', 1),
(3, 'Anjana', 'Navarathna', 'M', '954689758V', '1995-06-21', '789/25A Kirulapona Ahalawela	', 'Milroy', '0772546988', 4, '2017-06-04', 1);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `paymentId` int(4) NOT NULL,
  `patientId` int(3) NOT NULL,
  `Stayed_days` int(11) DEFAULT NULL,
  `amountdue` int(11) NOT NULL,
  `paidAmount` int(11) NOT NULL,
  `paymentMethod` enum('Cash','CreditCard') NOT NULL,
  `balance` int(11) NOT NULL,
  `paidDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `prescriptionId` int(3) NOT NULL,
  `description` varchar(60) NOT NULL,
  `prescDocId` int(3) NOT NULL,
  `patientId` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `testId` int(4) NOT NULL,
  `testName` varchar(45) NOT NULL,
  `Description` varchar(45) NOT NULL,
  `prescDocId` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`testId`, `testName`, `Description`, `prescDocId`) VALUES
(3, 'CatScan', 'Not a cat', 1);

-- --------------------------------------------------------

--
-- Table structure for table `testing`
--

CREATE TABLE `testing` (
  `testId` int(4) NOT NULL,
  `patientId` int(3) NOT NULL,
  `labTechId` int(3) NOT NULL,
  `conductDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `testing`
--

INSERT INTO `testing` (`testId`, `patientId`, `labTechId`, `conductDate`) VALUES
(3, 2, 1, '2017-06-02');

-- --------------------------------------------------------

--
-- Table structure for table `ward`
--

CREATE TABLE `ward` (
  `wardId` int(3) NOT NULL,
  `wardName` varchar(45) NOT NULL,
  `bedCount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ward`
--

INSERT INTO `ward` (`wardId`, `wardName`, `bedCount`) VALUES
(0, 'Maternity', 60),
(1, 'Pediatrics', 30),
(2, 'Oncology', 30),
(3, 'Gynecologist', 40),
(4, 'General surgery', 70);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`AdminId`),
  ADD KEY `admin-emp_idx` (`empId`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`empId`);

--
-- Indexes for table `bedid`
--
ALTER TABLE `bedid`
  ADD PRIMARY KEY (`bedId`),
  ADD KEY `patient-Bed_idx` (`patientId`),
  ADD KEY `bed-ward_idx` (`wardId`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`docId`),
  ADD KEY `doc-emp_idx` (`empId`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`empId`),
  ADD UNIQUE KEY `NIC_UNIQUE` (`NIC`);

--
-- Indexes for table `emp_payment`
--
ALTER TABLE `emp_payment`
  ADD PRIMARY KEY (`payslipId`),
  ADD KEY `payment_empId-emp` (`empId`);

--
-- Indexes for table `labtechnician`
--
ALTER TABLE `labtechnician`
  ADD PRIMARY KEY (`labTechId`),
  ADD KEY `labTech-emp_idx` (`empId`);

--
-- Indexes for table `nurse`
--
ALTER TABLE `nurse`
  ADD PRIMARY KEY (`nurseId`),
  ADD KEY `nurse-emp_idx` (`empId`),
  ADD KEY `nurse-ward_idx` (`wardId`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patientId`),
  ADD UNIQUE KEY `NIC_UNIQUE` (`NIC`),
  ADD KEY `patient-ward_idx` (`wardId`),
  ADD KEY `patient-Consultant_idx` (`consultDocId`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`paymentId`),
  ADD KEY `payment-patient_idx` (`patientId`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`prescriptionId`),
  ADD KEY `presc-Doctor_idx` (`prescDocId`),
  ADD KEY `presc-patient_idx` (`patientId`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`testId`),
  ADD KEY `Test-Doc_idx` (`prescDocId`);

--
-- Indexes for table `testing`
--
ALTER TABLE `testing`
  ADD PRIMARY KEY (`testId`),
  ADD KEY `Test-Patient_idx` (`patientId`),
  ADD KEY `Test-LabTech_idx` (`labTechId`);

--
-- Indexes for table `ward`
--
ALTER TABLE `ward`
  ADD PRIMARY KEY (`wardId`),
  ADD UNIQUE KEY `wardId_UNIQUE` (`wardId`),
  ADD UNIQUE KEY `wardName_UNIQUE` (`wardName`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administrator`
--
ALTER TABLE `administrator`
  MODIFY `AdminId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `docId` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `empId` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `emp_payment`
--
ALTER TABLE `emp_payment`
  MODIFY `payslipId` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `labtechnician`
--
ALTER TABLE `labtechnician`
  MODIFY `labTechId` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `nurse`
--
ALTER TABLE `nurse`
  MODIFY `nurseId` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `patientId` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `paymentId` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `prescription`
--
ALTER TABLE `prescription`
  MODIFY `prescriptionId` int(3) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `testId` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `administrator`
--
ALTER TABLE `administrator`
  ADD CONSTRAINT `admin-emp` FOREIGN KEY (`empId`) REFERENCES `employee` (`empId`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendence-empId` FOREIGN KEY (`empId`) REFERENCES `employee` (`empId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bedid`
--
ALTER TABLE `bedid`
  ADD CONSTRAINT `bed-ward` FOREIGN KEY (`wardId`) REFERENCES `ward` (`wardId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `patient-Bed` FOREIGN KEY (`patientId`) REFERENCES `patient` (`patientId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `doc-emp` FOREIGN KEY (`empId`) REFERENCES `employee` (`empId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `emp_payment`
--
ALTER TABLE `emp_payment`
  ADD CONSTRAINT `payment_empId-emp` FOREIGN KEY (`empId`) REFERENCES `employee` (`empId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `labtechnician`
--
ALTER TABLE `labtechnician`
  ADD CONSTRAINT `labTech-emp` FOREIGN KEY (`empId`) REFERENCES `employee` (`empId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `nurse`
--
ALTER TABLE `nurse`
  ADD CONSTRAINT `nurse-emp` FOREIGN KEY (`empId`) REFERENCES `employee` (`empId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nurse-ward` FOREIGN KEY (`wardId`) REFERENCES `ward` (`wardId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `patient-Consultant` FOREIGN KEY (`consultDocId`) REFERENCES `doctor` (`docId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `patient-ward` FOREIGN KEY (`wardId`) REFERENCES `ward` (`wardId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment-patient` FOREIGN KEY (`patientId`) REFERENCES `patient` (`patientId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `prescription`
--
ALTER TABLE `prescription`
  ADD CONSTRAINT `presc-Doctor` FOREIGN KEY (`prescDocId`) REFERENCES `doctor` (`docId`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `presc-patient` FOREIGN KEY (`patientId`) REFERENCES `patient` (`patientId`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `test`
--
ALTER TABLE `test`
  ADD CONSTRAINT `Test-Doc` FOREIGN KEY (`prescDocId`) REFERENCES `doctor` (`docId`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `testing`
--
ALTER TABLE `testing`
  ADD CONSTRAINT `Test-LabTech` FOREIGN KEY (`labTechId`) REFERENCES `labtechnician` (`labTechId`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `Test-Patient` FOREIGN KEY (`patientId`) REFERENCES `patient` (`patientId`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `testing-Test` FOREIGN KEY (`testId`) REFERENCES `test` (`testId`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
