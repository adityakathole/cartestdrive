-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 06, 2021 at 06:06 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `car_test_drive`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchCompany` (IN `page` VARCHAR(30))  SELECT c.Car_id,Company,Model,Type,Price,Length,Width,Seating_capacity,Colour,Fuel,Mileage FROM CAR c, CAR_DESIGN cd WHERE c.Company = page AND c.Car_id = cd.Car_id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchMileage` (IN `page` INT(10))  SELECT c.Car_id,Company,Model,Type,Price,Length,Width,Seating_capacity,Colour,Fuel,Mileage FROM CAR c, CAR_DESIGN cd WHERE cd.Mileage >= page AND c.Car_id = cd.Car_id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchModel` (IN `page` VARCHAR(30))  SELECT c.Car_id,Company,Model,Type,Price,Length,Width,Seating_capacity,Colour,Fuel,Mileage FROM CAR c, CAR_DESIGN cd WHERE c.Model = page AND c.Car_id = cd.Car_id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchPrice` (IN `page` INT(10))  SELECT c.Car_id,Company,Model,Type,Price,Length,Width,Seating_capacity,Colour,Fuel,Mileage FROM CAR c, CAR_DESIGN cd WHERE c.Price <= page AND c.Car_id = cd.Car_id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchType` (IN `page` VARCHAR(30))  SELECT c.Car_id,Company,Model,Type,Price,Length,Width,Seating_capacity,Colour,Fuel,Mileage FROM CAR c, CAR_DESIGN cd WHERE c.Type = page AND c.Car_id = cd.Car_id$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin_login`
--

CREATE TABLE `admin_login` (
  `A_login_id` varchar(30) NOT NULL,
  `A_password` varchar(30) NOT NULL,
  `A_name` varchar(30) NOT NULL,
  `A_mobile` bigint(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_login`
--

INSERT INTO `admin_login` (`A_login_id`, `A_password`, `A_name`, `A_mobile`) VALUES
('root@gmail.com', 'root', 'root', 12345),
('admin@gmail.com', 'admin', 'admin', 12345);

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `Car_id` int(10) NOT NULL,
  `Company` varchar(30) NOT NULL,
  `Model` varchar(30) NOT NULL,
  `Type` varchar(30) NOT NULL,
  `Price` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`Car_id`, `Company`, `Model`, `Type`, `Price`) VALUES
(1, 'KIA', 'SELTOS', 'AUTOMATIC', 12),
(2, 'KIA', 'SPORTAGE', 'AUTOMATIC', 15),
(3, 'HONDA', 'HONDACITY', 'MANUAL', 9),
(4, 'HONDA', 'AMAZE', 'MANUAL', 11),
(5, 'HYUNDAI', 'CRETA', 'AUTOMATIC', 18);

-- --------------------------------------------------------

--
-- Table structure for table `car_design`
--

CREATE TABLE `car_design` (
  `Car_id` int(10) NOT NULL,
  `Length` int(10) NOT NULL,
  `Width` int(10) NOT NULL,
  `Seating_capacity` int(10) NOT NULL,
  `Colour` varchar(30) NOT NULL,
  `Fuel` varchar(30) NOT NULL,
  `Mileage` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `car_design`
--

INSERT INTO `car_design` (`Car_id`, `Length`, `Width`, `Seating_capacity`, `Colour`, `Fuel`, `Mileage`) VALUES
(1, 4315, 1800, 5, 'RED', 'DIESEL', 20),
(2, 4440, 1855, 5, 'BLACK', 'DIESEL', 11),
(3, 4440, 1495, 7, 'BLUE', 'DIESEL', 21),
(4, 4315, 1695, 5, 'WHITE', 'DIESEL', 25),
(5, 4270, 1780, 7, 'GREY', 'DIESEL', 17);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `Model` varchar(30) NOT NULL,
  `Rating` int(10) NOT NULL,
  `Comment` varchar(30) NOT NULL,
  `A_login_id` varchar(30) DEFAULT 'root@gmail.in',
  `U_login_id` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`Model`, `Rating`, `Comment`, `A_login_id`, `U_login_id`) VALUES
('CRETA', 3, 'NICE PICKUP', 'root@gmail.com', 'shreyash@gmail.com'),
('SPORTAGE', 4, 'DEFINITELY RECOMMANDABLE', 'root@gmail.com', 'aditya@gmail.com'),
('SPORTAGE', 4, ' IT WAS VERY COMFORTABLE', 'root@gmail.com', 'amit@gmail.com'),
('SELTOS', 4, 'RECOMMANDABLE', 'root@gmail.com', ' chaitanya@gmail.com'),
('HONDACITY', 2, 'NOT RECOMMANDABLE ', 'root@gmail.com', 'viraj@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `slot_location`
--

CREATE TABLE `slot_location` (
  `Slot_id` int(10) NOT NULL,
  `Location` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `slot_location`
--

INSERT INTO `slot_location` (`Slot_id`, `Location`) VALUES
(2, 'Akurdi'),
(1, 'Pimpri'),
(3, 'Chinchwad');

-- --------------------------------------------------------

--
-- Table structure for table `test_slot`
--

CREATE TABLE `test_slot` (
  `Slot_id` int(10) NOT NULL,
  `Car_id` int(10) NOT NULL,
  `Book_date` date NOT NULL,
  `Start_time` time NOT NULL,
  `End_time` time NOT NULL,
  `U_login_id` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `test_slot`
--

INSERT INTO `test_slot` (`Slot_id`, `Car_id`, `Book_date`, `Start_time`, `End_time`, `U_login_id`) VALUES
(1, 1, '2023-11-19', '10:00:00', '11:00:00', 'shreyash@gmail.com'),
(2, 3, '2023-11-19', '12:00:00', '01:00:00', 'rutuja@gmail.com'),
(3, 5, '2010-12-19', '03:00:00', '04:00:00', 'adi@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `user_login`
--

CREATE TABLE `user_login` (
  `U_login_id` varchar(30) NOT NULL,
  `U_password` varchar(30) NOT NULL,
  `U_name` varchar(30) NOT NULL,
  `U_mobile` bigint(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_login`
--

INSERT INTO `user_login` (`U_login_id`, `U_password`, `U_name`, `U_mobile`) VALUES
('shreyash@gmail.com', '12345', 'shreyash', 1951097),
('rutuja@gmail.com', '12345', 'rutuja', 1951088),
('chaitanya@gmail.com', '12345', 'chaitanya', 1951078),
('aditya@gmail.com', '12345', 'aditya', 1951096);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_login`
--
ALTER TABLE `admin_login`
  ADD PRIMARY KEY (`A_login_id`);

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`Car_id`);

--
-- Indexes for table `car_design`
--
ALTER TABLE `car_design`
  ADD PRIMARY KEY (`Car_id`),
  ADD KEY `Car_id` (`Car_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`Model`,`U_login_id`),
  ADD KEY `U_login_id` (`U_login_id`,`A_login_id`),
  ADD KEY `A_login_id` (`A_login_id`);

--
-- Indexes for table `slot_location`
--
ALTER TABLE `slot_location`
  ADD PRIMARY KEY (`Slot_id`),
  ADD KEY `Slot_id` (`Slot_id`);

--
-- Indexes for table `test_slot`
--
ALTER TABLE `test_slot`
  ADD PRIMARY KEY (`Slot_id`),
  ADD KEY `U_login_id` (`U_login_id`,`Car_id`),
  ADD KEY `Car_id` (`Car_id`);

--
-- Indexes for table `user_login`
--
ALTER TABLE `user_login`
  ADD PRIMARY KEY (`U_login_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `test_slot`
--
ALTER TABLE `test_slot`
  MODIFY `Slot_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
