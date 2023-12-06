-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2023 at 08:11 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `Apt_Id` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Timing` varchar(9) NOT NULL,
  `status` enum('pending','decline','approve','completed') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`Apt_Id`, `Date`, `Timing`, `status`) VALUES
(25, '2022-08-17', '03:00 PM', 'completed'),
(26, '2022-08-10', '02:00 PM', 'completed'),
(27, '2022-09-01', '08:00 PM', 'pending'),
(28, '2022-09-01', '08:00 PM', 'approve'),
(29, '2022-09-03', '10:00 PM', 'pending'),
(30, '2022-09-03', '10:00 PM', 'pending'),
(31, '2022-09-08', '09:00 PM', 'decline'),
(32, '2022-09-03', '10:00 PM', 'pending'),
(33, '2023-01-19', '08:00 PM', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `bed`
--

CREATE TABLE `bed` (
  `B_Id` int(11) NOT NULL,
  `B_Categories` enum('ICU','Emergency','CCU','') NOT NULL,
  `B_Roomno` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `creates`
--

CREATE TABLE `creates` (
  `P_Id` int(11) NOT NULL,
  `R_Id` int(11) NOT NULL,
  `D_Id` int(11) NOT NULL,
  `A_Id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `creates`
--

INSERT INTO `creates` (`P_Id`, `R_Id`, `D_Id`, `A_Id`) VALUES
(9, 7, 6, 25),
(9, 8, 6, 26);

-- --------------------------------------------------------

--
-- Table structure for table `dept`
--

CREATE TABLE `dept` (
  `Dept_Id` int(11) NOT NULL,
  `Dept_Name` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Dept_Description` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `D_Id` int(11) NOT NULL,
  `D_Name` varchar(225) NOT NULL,
  `D_Address` varchar(225) NOT NULL,
  `Gender` enum('Male','Female','Others') NOT NULL,
  `DOB` date NOT NULL,
  `Specification` varchar(225) NOT NULL,
  `Photo` varchar(225) NOT NULL,
  `Contact` varchar(15) NOT NULL,
  `Days` set('Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday') NOT NULL,
  `Timing` varchar(225) NOT NULL,
  `UId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`D_Id`, `D_Name`, `D_Address`, `Gender`, `DOB`, `Specification`, `Photo`, `Contact`, `Days`, `Timing`, `UId`) VALUES
(6, 'Smriti', 'Syambhu', 'Female', '2002-02-05', 'Heart', 'C:\\\\Users\\\\MSI\\\\Desktop\\\\(TDS at source system Form)_page-0001.jpg', '9849012639', 'Sunday,Tuesday,Saturday', '2-6', 28);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `P_Id` int(11) NOT NULL,
  `P_Name` varchar(225) NOT NULL,
  `P_Address` varchar(225) NOT NULL,
  `Gender` enum('Male','Female','Others') NOT NULL,
  `DOB` date NOT NULL,
  `Contact` varchar(15) NOT NULL,
  `Disease` varchar(225) NOT NULL,
  `UId` int(11) NOT NULL,
  `Photo` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`P_Id`, `P_Name`, `P_Address`, `Gender`, `DOB`, `Contact`, `Disease`, `UId`, `Photo`) VALUES
(9, 'Swash', 'kdshskhf', 'Male', '2022-08-11', '45346456', 'kdshskhf', 43, 'C:\\\\Users\\\\MSI\\\\Desktop\\\\img3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `receptionist`
--

CREATE TABLE `receptionist` (
  `Rec_Id` int(11) NOT NULL,
  `Rec_Name` varchar(225) NOT NULL,
  `Rec_Address` varchar(225) NOT NULL,
  `DOB` date NOT NULL,
  `Contact` varchar(15) NOT NULL,
  `Photo` varchar(225) NOT NULL,
  `Shift` enum('Morning','Day','Night') NOT NULL,
  `Gender` enum('Male','Female','Others','') NOT NULL,
  `UId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `R_Id` int(11) NOT NULL,
  `Tablets` varchar(225) NOT NULL,
  `Descriptions` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`R_Id`, `Tablets`, `Descriptions`) VALUES
(7, 'niko', 'eat three times a day'),
(8, 'kdssnfk	', 'asdnkn');

-- --------------------------------------------------------

--
-- Table structure for table `serves`
--

CREATE TABLE `serves` (
  `D_Id` int(11) NOT NULL,
  `Apt_Id` int(11) NOT NULL,
  `P_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `serves`
--

INSERT INTO `serves` (`D_Id`, `Apt_Id`, `P_Id`) VALUES
(6, 25, 9),
(6, 26, 9),
(6, 28, 9),
(6, 30, 9),
(6, 31, 9),
(6, 32, 9),
(6, 33, 9);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `Staff_Id` int(11) NOT NULL,
  `Staff_Name` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Staff_Address` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DOB` date NOT NULL,
  `Contact` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Occupatation` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Gender` enum('Male','Female','Others','') NOT NULL,
  `Photo` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `U_Id` int(11) NOT NULL,
  `Username` varchar(225) NOT NULL,
  `Password` varchar(225) NOT NULL,
  `post` enum('Doctor','Patient','Admin','Receptionist') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`U_Id`, `Username`, `Password`, `post`) VALUES
(26, 'Rishiraj', '123', 'Admin'),
(28, 'Smriti', '123', 'Doctor'),
(43, 'Swash', '123', 'Patient'),
(44, 'Prasidha', '123', 'Doctor');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`Apt_Id`);

--
-- Indexes for table `bed`
--
ALTER TABLE `bed`
  ADD PRIMARY KEY (`B_Id`);

--
-- Indexes for table `creates`
--
ALTER TABLE `creates`
  ADD KEY `rep_FK` (`R_Id`),
  ADD KEY `Fk_patien` (`P_Id`),
  ADD KEY `FK_docto` (`D_Id`),
  ADD KEY `apoint_FK` (`A_Id`);

--
-- Indexes for table `dept`
--
ALTER TABLE `dept`
  ADD PRIMARY KEY (`Dept_Id`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`D_Id`),
  ADD KEY `FK_doctor` (`UId`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`P_Id`),
  ADD KEY `FK_patient` (`UId`);

--
-- Indexes for table `receptionist`
--
ALTER TABLE `receptionist`
  ADD PRIMARY KEY (`Rec_Id`),
  ADD KEY `FK_receptionist` (`UId`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`R_Id`);

--
-- Indexes for table `serves`
--
ALTER TABLE `serves`
  ADD KEY `FK_appointment` (`Apt_Id`),
  ADD KEY `FK_doc` (`D_Id`),
  ADD KEY `FK-pat` (`P_Id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`Staff_Id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`U_Id`),
  ADD UNIQUE KEY `Username` (`Username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `Apt_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `bed`
--
ALTER TABLE `bed`
  MODIFY `B_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `dept`
--
ALTER TABLE `dept`
  MODIFY `Dept_Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `D_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `P_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `receptionist`
--
ALTER TABLE `receptionist`
  MODIFY `Rec_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `R_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `Staff_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `U_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `creates`
--
ALTER TABLE `creates`
  ADD CONSTRAINT `FK_docto` FOREIGN KEY (`D_Id`) REFERENCES `doctor` (`D_Id`),
  ADD CONSTRAINT `Fk_patien` FOREIGN KEY (`P_Id`) REFERENCES `patient` (`P_Id`),
  ADD CONSTRAINT `apoint_FK` FOREIGN KEY (`A_Id`) REFERENCES `appointment` (`Apt_Id`),
  ADD CONSTRAINT `rep_FK` FOREIGN KEY (`R_Id`) REFERENCES `report` (`R_Id`);

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `FK_doctor` FOREIGN KEY (`UId`) REFERENCES `user` (`U_Id`);

--
-- Constraints for table `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `FK_patient` FOREIGN KEY (`UId`) REFERENCES `user` (`U_Id`);

--
-- Constraints for table `receptionist`
--
ALTER TABLE `receptionist`
  ADD CONSTRAINT `FK_receptionist` FOREIGN KEY (`UId`) REFERENCES `user` (`U_Id`);

--
-- Constraints for table `serves`
--
ALTER TABLE `serves`
  ADD CONSTRAINT `FK-pat` FOREIGN KEY (`P_Id`) REFERENCES `patient` (`P_Id`),
  ADD CONSTRAINT `FK_appointment` FOREIGN KEY (`Apt_Id`) REFERENCES `appointment` (`Apt_Id`),
  ADD CONSTRAINT `FK_doc` FOREIGN KEY (`D_Id`) REFERENCES `doctor` (`D_Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
