-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:4306
-- Generation Time: May 16, 2023 at 11:49 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vetclinic`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `appointment`
-- (See below for the actual view)
--
CREATE TABLE `appointment` (
`PATIENTID` smallint(3)
,`STAFFNAME` char(9)
);

-- --------------------------------------------------------

--
-- Table structure for table `billing`
--

CREATE TABLE `billing` (
  `PAYMENTID` smallint(3) NOT NULL,
  `LASTPAYMENTDATE` varchar(10) DEFAULT NULL,
  `PRICEPAID` char(9) DEFAULT NULL,
  `PAYMENTSTATUS` char(10) DEFAULT NULL,
  `PETNAME` char(9) DEFAULT NULL,
  `PaymentMethod` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `billing`
--

INSERT INTO `billing` (`PAYMENTID`, `LASTPAYMENTDATE`, `PRICEPAID`, `PAYMENTSTATUS`, `PETNAME`, `PaymentMethod`) VALUES
(165, '2021-10-05', 'NO', 'INCOMPLETE', 'OSCAR', NULL),
(175, '2020-12-12', 'YES', 'COMPLETE', 'LASSIE', 'Online'),
(187, '2022-03-15', 'YES', 'COMPLETE', 'SKY', 'CASH'),
(194, '2022-05-15', 'NO', 'INCOMPLETE', 'HANK', NULL),
(203, '2022-08-25', 'YES', 'COMPLETE', 'ROXY', 'CARD'),
(207, '2022-11-20', 'YES', 'COMPLETE', 'FLOPPY', 'CARD');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `FIRSTNAME` char(9) DEFAULT NULL,
  `LASTNAME` char(9) DEFAULT NULL,
  `PATIENTID` smallint(3) NOT NULL,
  `PET` char(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`FIRSTNAME`, `LASTNAME`, `PATIENTID`, `PET`) VALUES
('BRÍDÍN', 'HALPERT', 1, 'DOG'),
('MOSSIE', 'FITZMAURI', 2, 'HORSE'),
('ELIZABETH', 'FITZWILLI', 3, 'CAT'),
('EDWARD', 'BEESLEY', 4, 'HAMSTER'),
('SEAN', 'OREILLY', 5, 'PIG'),
('MICHAEL', 'SCOTT', 6, 'LLAMA'),
('BARRY', 'DUGGAN', 7, 'OWL');

-- --------------------------------------------------------

--
-- Table structure for table `pet`
--

CREATE TABLE `pet` (
  `PETNAME` char(9) NOT NULL,
  `ANIMALTYPE` char(9) DEFAULT NULL,
  `MEDICATION` char(9) DEFAULT NULL,
  `PATIENTID` smallint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pet`
--

INSERT INTO `pet` (`PETNAME`, `ANIMALTYPE`, `MEDICATION`, `PATIENTID`) VALUES
('FLOPPY', 'HAMSTER', 'ASTHMA', 4),
('HANK', 'PIG', 'BLOOD PRE', 5),
('LASSIE', 'DOG', 'HEART_CON', 1),
('OSCAR', 'CAT', 'BLINDNESS', 3),
('ROXY', 'LLAMA', 'EPILEPSY', 6),
('SKY', 'HORSE', 'CHOLESTER', 2);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `STAFFNO` smallint(4) NOT NULL,
  `STAFFNAME` char(9) DEFAULT NULL,
  `JOB` char(9) DEFAULT NULL,
  `PATIENTID` smallint(3) NOT NULL,
  `EmailAddress` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`STAFFNO`, `STAFFNAME`, `JOB`, `PATIENTID`, `EmailAddress`) VALUES
(103, 'LARRY FIT', 'VET', 1, '[emailprotected]'),
(104, 'JENNY DOY', 'VET', 2, '[emailprotected]'),
(105, 'EMMA WILS', 'NURSE', 3, 'emmawilson@gmail.com'),
(106, 'ROXANNE M', 'NURSE', 4, 'roxannem@gmail.com'),
(107, 'KEVIN WIL', 'NURSE', 5, 'kevinwilson@gmail.com'),
(108, 'ANGELA WA', 'VET', 6, '[emailprotected]');

-- --------------------------------------------------------

--
-- Structure for view `appointment`
--
DROP TABLE IF EXISTS `appointment`;

CREATE ALGORITHM=UNDEFINED DEFINER=`` SQL SECURITY DEFINER VIEW `appointment`  AS SELECT `staff`.`PATIENTID` AS `PATIENTID`, `staff`.`STAFFNAME` AS `STAFFNAME` FROM `staff` WHERE `staff`.`JOB` = 'VET''VET'  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`PAYMENTID`),
  ADD KEY `PETNAME` (`PETNAME`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`PATIENTID`),
  ADD KEY `indx_patientNAME` (`FIRSTNAME`);

--
-- Indexes for table `pet`
--
ALTER TABLE `pet`
  ADD PRIMARY KEY (`PETNAME`),
  ADD KEY `PATIENTID` (`PATIENTID`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`STAFFNO`),
  ADD KEY `PATIENTID` (`PATIENTID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `billing`
--
ALTER TABLE `billing`
  ADD CONSTRAINT `billing_ibfk_1` FOREIGN KEY (`PETNAME`) REFERENCES `pet` (`PETNAME`);

--
-- Constraints for table `pet`
--
ALTER TABLE `pet`
  ADD CONSTRAINT `pet_ibfk_1` FOREIGN KEY (`PATIENTID`) REFERENCES `patient` (`PATIENTID`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`PATIENTID`) REFERENCES `patient` (`PATIENTID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
