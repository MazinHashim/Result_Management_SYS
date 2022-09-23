-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 23, 2022 at 05:33 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `certificate_result_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrator`
--

CREATE TABLE `administrator` (
  `id` int(10) NOT NULL,
  `username` varchar(50) NOT NULL,
  `userpass` varchar(50) NOT NULL,
  `conf_time` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `administrator`
--

INSERT INTO `administrator` (`id`, `username`, `userpass`, `conf_time`) VALUES
(1, 'admin', 'admin', '2021-04-01 11:07');

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `exam_id` int(11) NOT NULL,
  `std_id` int(10) NOT NULL,
  `sub_id` int(10) NOT NULL,
  `std_degree` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `results`
--

INSERT INTO `results` (`exam_id`, `std_id`, `sub_id`, `std_degree`) VALUES
(2, 19, 13, 48),
(10, 23, 13, 99),
(14, 19, 15, 55),
(15, 23, 15, 20);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(10) NOT NULL,
  `std_name` varchar(80) NOT NULL,
  `age` int(10) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `mother_name` varchar(80) NOT NULL,
  `std_school` varchar(100) NOT NULL,
  `state` varchar(30) NOT NULL,
  `sitting_num` bigint(50) NOT NULL,
  `ssn_num` bigint(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `std_name`, `age`, `gender`, `mother_name`, `std_school`, `state`, `sitting_num`, `ssn_num`) VALUES
(19, 'Mazin Hashim Ahmed Mahjoub', 17, 'Male', 'Hanan Ameen', 'Abdo Almon3im Hassona', 'Sinja', 153681, 11954561616156489),
(23, 'Samar Musa Mohmmed Ibrahim', 17, 'Female', 'Salwa Ahmed Adel', 'Jabra Schools', 'Khartoum', 189515, 1195456561672663);

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` int(10) NOT NULL,
  `subject_name` varchar(50) NOT NULL,
  `full_degree` int(10) NOT NULL,
  `exam_date` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `subject_name`, `full_degree`, `exam_date`) VALUES
(13, 'Mathimatics', 100, '10-03-2022'),
(15, 'Computer Sciences', 100, '10-05-2022');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`exam_id`),
  ADD KEY `std_id_FK` (`std_id`),
  ADD KEY `exam_id_FK` (`sub_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `std_name` (`std_name`),
  ADD UNIQUE KEY `sitting_num` (`sitting_num`),
  ADD UNIQUE KEY `ssn_num` (`ssn_num`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administrator`
--
ALTER TABLE `administrator`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `results`
--
ALTER TABLE `results`
  MODIFY `exam_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `results`
--
ALTER TABLE `results`
  ADD CONSTRAINT `exam_id_FK` FOREIGN KEY (`sub_id`) REFERENCES `subjects` (`id`),
  ADD CONSTRAINT `std_id_FK` FOREIGN KEY (`std_id`) REFERENCES `students` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
