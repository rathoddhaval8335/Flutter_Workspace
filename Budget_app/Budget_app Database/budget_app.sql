-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 11, 2025 at 07:36 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `budget_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `fd_amount_exp`
--

CREATE TABLE `fd_amount_exp` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `cat_icon` varchar(255) NOT NULL,
  `cat_name` varchar(255) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `note` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fd_amount_exp`
--

INSERT INTO `fd_amount_exp` (`id`, `userid`, `cat_icon`, `cat_name`, `amount`, `note`, `date`) VALUES
(4, 4, '58856', 'shopping ', '500', 'bbb', '2025-10-10');

-- --------------------------------------------------------

--
-- Table structure for table `fd_amount_income`
--

CREATE TABLE `fd_amount_income` (
  `income_id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `cat_icon` varchar(255) NOT NULL,
  `cat_name` varchar(255) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `note` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fd_amount_income`
--

INSERT INTO `fd_amount_income` (`income_id`, `userid`, `cat_icon`, `cat_name`, `amount`, `note`, `date`) VALUES
(4, 2, '58328', 'hbhbbh', '500', 'afd', '10 Oct');

-- --------------------------------------------------------

--
-- Table structure for table `fd_budget`
--

CREATE TABLE `fd_budget` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `cat_name` varchar(255) NOT NULL,
  `cat_icon` varchar(255) NOT NULL,
  `remaining` varchar(255) NOT NULL,
  `budget` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fd_budget`
--

INSERT INTO `fd_budget` (`id`, `userid`, `cat_id`, `cat_name`, `cat_icon`, `remaining`, `budget`) VALUES
(1, 2, 9, 'gggg', '58381', '2000', '2000'),
(2, 2, 4, 'uuhh', '58279', '2000', '2000'),
(3, 4, 6, 'shopping ', '58856', '200', '200'),
(4, 2, 0, 'Monthly Budget', '0', '2000', '2000');

-- --------------------------------------------------------

--
-- Table structure for table `fd_expense_cat`
--

CREATE TABLE `fd_expense_cat` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `cat_icon` varchar(255) NOT NULL,
  `cat_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fd_expense_cat`
--

INSERT INTO `fd_expense_cat` (`id`, `userid`, `cat_icon`, `cat_name`) VALUES
(1, 2, '58866', 'avx'),
(2, 2, '58389', 'ttffg'),
(4, 2, '58279', 'uuhh'),
(6, 4, '58856', 'shopping '),
(7, 4, '58381', 'abc'),
(9, 2, '58381', 'gggg'),
(10, 2, '57997', 'ubbu'),
(11, 2, '58856', 'inmomk'),
(12, 2, '58381', 'ghgh');

-- --------------------------------------------------------

--
-- Table structure for table `fd_income_cat`
--

CREATE TABLE `fd_income_cat` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `cat_icon` varchar(255) NOT NULL,
  `cat_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fd_income_cat`
--

INSERT INTO `fd_income_cat` (`id`, `userid`, `cat_icon`, `cat_name`) VALUES
(2, 2, '58279', 'salary'),
(3, 2, '58328', 'hbhbbh');

-- --------------------------------------------------------

--
-- Table structure for table `fd_register`
--

CREATE TABLE `fd_register` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `mobile_no` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fd_register`
--

INSERT INTO `fd_register` (`id`, `name`, `email`, `password`, `mobile_no`) VALUES
(1, 'dhaval', 'fd@gmail.com', '7417410', '7984912360'),
(2, 'dhaval', 'fd12@gmail.com', '741741', '8523697410'),
(3, 'rahul', 'rj@gmail.com', '789789', '7894561230'),
(4, 'virat', 'vk@gmail.com', '789789', '8520741963'),
(5, 'rohit', 'rs@gmail.com', '852852', '8989898520'),
(6, 'delete', 'tg@gmail.com', '789789', '7410852963'),
(7, 'Dj', 'Dj@gmail.com', '789789', '8523697410'),
(8, 'fd', 'fd123345@gmail.com', '789789', '7894561230'),
(9, 'Dhaval Rathod', 'dhaval12@gmail.com', '456456', '7894561230'),
(10, 'ab', 'ab12@gmail.com', '741236', '74123698520'),
(11, 'abc', 'abc123@gmail.com', '741741', '8528529630'),
(12, 'xyz', 'xyz@gmail.com', '741741', '8523697410'),
(13, 'efg', 'efg12@gmail.com', '789789', '7412369850'),
(14, 'Rathod Dhaval', 'dj13@gmail.com', '567567', '8965412370'),
(15, 'abc', 'abc1234@gmail.com', '987987', '9874563210');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fd_amount_exp`
--
ALTER TABLE `fd_amount_exp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fd_amount_income`
--
ALTER TABLE `fd_amount_income`
  ADD PRIMARY KEY (`income_id`);

--
-- Indexes for table `fd_budget`
--
ALTER TABLE `fd_budget`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fd_expense_cat`
--
ALTER TABLE `fd_expense_cat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fd_income_cat`
--
ALTER TABLE `fd_income_cat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fd_register`
--
ALTER TABLE `fd_register`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fd_amount_exp`
--
ALTER TABLE `fd_amount_exp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `fd_amount_income`
--
ALTER TABLE `fd_amount_income`
  MODIFY `income_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `fd_budget`
--
ALTER TABLE `fd_budget`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `fd_expense_cat`
--
ALTER TABLE `fd_expense_cat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `fd_income_cat`
--
ALTER TABLE `fd_income_cat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `fd_register`
--
ALTER TABLE `fd_register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
