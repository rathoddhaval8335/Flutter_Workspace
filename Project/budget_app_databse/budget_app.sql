-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 13, 2025 at 08:11 AM
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
-- Table structure for table `fd_admin`
--

CREATE TABLE `fd_admin` (
  `id` int(11) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `pass` varchar(100) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fd_admin`
--

INSERT INTO `fd_admin` (`id`, `admin_name`, `pass`, `create_at`) VALUES
(1, 'dhaval', '$2y$10$UKUv9vzGdfXoJLp0hOKNmeFsKHycywamO.q0UhuwpQn/IiJ5rkO1K', '2025-10-12 13:04:26');

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
(4, 4, '58856', 'shopping ', '500', 'bbb', '2025-10-10'),
(15, 2, '58389', 'ttffg', '500', 'ad', '2025-11-20'),
(16, 2, '58389', 'ttffg', '8000', 'sadf', '2025-11-13'),
(17, 2, '58866', 'avx', '500', 'asdf', '2025-10-12'),
(18, 2, '58866', 'avx', '5000', 'ads', '2025-10-12'),
(19, 2, '58279', 'uuhh', '500', 'asd', '2025-12-10'),
(20, 2, '58389', 'ttffg', '500', 'asd', '2026-01-15'),
(21, 2, '58856', 'inmomk', '800', 'qsawd', '2026-01-31'),
(22, 2, '58279', 'uuhh', '500', 'sad', '2025-10-12'),
(23, 2, '57997', 'ubbu', '4000', '', '2025-10-12'),
(24, 2, '58856', 'inmomk', '200', '2wqdef', '2025-09-17'),
(25, 2, '58279', 'uuhh', '200', 'wdef', '2025-09-18'),
(26, 2, '58007', 'flight', '5000', 'fligkt', '2026-01-14');

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
(7, 2, '58279', 'salary', '2000', 'ad', '2025-11-06'),
(8, 2, '58328', 'hbhbbh', '8000', 'asd', '2025-10-12'),
(9, 2, '58279', 'salary', '8110', 'wqe', '2026-03-18'),
(10, 2, '58328', 'hbhbbh', '840', 'wde', '2026-05-08'),
(11, 2, '58328', 'hbhbbh', '400', 'sd', '2025-10-12'),
(12, 2, '58279', 'salary', '4100', 'd', '2025-10-12'),
(13, 2, '58279', 'salary', '10000', '', '2026-01-06');

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
  `budget` varchar(255) NOT NULL,
  `month` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fd_budget`
--

INSERT INTO `fd_budget` (`id`, `userid`, `cat_id`, `cat_name`, `cat_icon`, `remaining`, `budget`, `month`) VALUES
(3, 4, 6, 'shopping ', '58856', '-300', '200', 'Oct 2025'),
(5, 2, 2, 'ttffg', '58389', '5000', '5000', 'Oct 2025'),
(6, 2, 0, 'Monthly Budget', '0', '10000', '10000', 'Oct 2025'),
(7, 2, 9, 'gggg', '58381', '2000', '2000', 'Nov 2025'),
(8, 2, 2, 'ttffg', '58389', '11500', '20000', 'Nov 2025'),
(9, 2, 0, 'Monthly Budget', '0', '50000', '50000', 'Nov 2025');

-- --------------------------------------------------------

--
-- Table structure for table `fd_category`
--

CREATE TABLE `fd_category` (
  `id` int(11) NOT NULL,
  `cat_name` varchar(100) DEFAULT NULL,
  `cat_icon` varchar(100) DEFAULT NULL,
  `cat_type` varchar(50) DEFAULT NULL,
  `create_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fd_category`
--

INSERT INTO `fd_category` (`id`, `cat_name`, `cat_icon`, `cat_type`, `create_at`) VALUES
(1, 'a', '58136', 'Expense', '2025-10-12 17:24:38'),
(3, 'salary', '57548', 'Income', '2025-10-12 17:59:51'),
(4, 'adfv', '59122', 'Expense', '2025-10-12 18:03:34'),
(5, 'wdfkn', '58965', 'Expense', '2025-10-12 18:03:57');

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
(12, 2, '58381', 'ghgh'),
(13, 2, '58007', 'flight');

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
(3, 2, '58328', 'hbhbbh'),
(5, 4, '59122', 'saaa');

-- --------------------------------------------------------

--
-- Table structure for table `fd_register`
--

CREATE TABLE `fd_register` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `password` varchar(255) NOT NULL,
  `mobile_no` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fd_register`
--

INSERT INTO `fd_register` (`id`, `name`, `email`, `profile_image`, `created_at`, `password`, `mobile_no`) VALUES
(1, 'dhaval', 'fd@gmail.com', NULL, '2025-10-12 16:45:58', '7417410', '7984912360'),
(2, 'Dhaval ', 'fd123@gmail.com', 'uploads/1760290437_scaled_Screenshot_2025-10-06-16-44-16-96.jpg', '2025-10-12 16:45:58', '741741', '8523665470'),
(3, 'rahul', 'rj@gmail.com', NULL, '2025-10-12 16:45:58', '789789', '7894561230'),
(4, 'virat', 'vk@gmail.com', NULL, '2025-10-12 16:45:58', '742742', '8520741963'),
(5, 'rohit', 'rs@gmail.com', NULL, '2025-10-12 16:45:58', '852852', '8989898520'),
(6, 'delete', 'tg@gmail.com', NULL, '2025-10-12 16:45:58', '567567', '7410852963'),
(7, 'Dj', 'Dj@gmail.com', NULL, '2025-10-12 16:45:58', '789789', '8523697410'),
(8, 'fd', 'fd123345@gmail.com', NULL, '2025-10-12 16:45:58', '789789', '7894561230'),
(9, 'Dhaval Rathod', 'dhaval12@gmail.com', NULL, '2025-10-12 16:45:58', '456456', '7894561230'),
(10, 'ab', 'ab12@gmail.com', NULL, '2025-10-12 16:45:58', '741236', '74123698520'),
(11, 'abc', 'abc123@gmail.com', NULL, '2025-10-12 16:45:58', '741741', '8528529630'),
(12, 'xyz', 'xyz@gmail.com', NULL, '2025-10-12 16:45:58', '741741', '8523697410'),
(14, 'Rathod Dhaval', 'dj13@gmail.com', NULL, '2025-10-12 16:45:58', '567567', '8965412370'),
(16, 'jj', 'ja@gmail.com', NULL, '2025-10-12 18:04:39', '898989', '6546546547');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fd_admin`
--
ALTER TABLE `fd_admin`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `fd_category`
--
ALTER TABLE `fd_category`
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
-- AUTO_INCREMENT for table `fd_admin`
--
ALTER TABLE `fd_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fd_amount_exp`
--
ALTER TABLE `fd_amount_exp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `fd_amount_income`
--
ALTER TABLE `fd_amount_income`
  MODIFY `income_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `fd_budget`
--
ALTER TABLE `fd_budget`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `fd_category`
--
ALTER TABLE `fd_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `fd_expense_cat`
--
ALTER TABLE `fd_expense_cat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `fd_income_cat`
--
ALTER TABLE `fd_income_cat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `fd_register`
--
ALTER TABLE `fd_register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
