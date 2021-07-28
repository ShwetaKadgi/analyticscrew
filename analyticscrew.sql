-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 03, 2021 at 05:35 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.1.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `analyticscrew`
--

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `id` int(10) UNSIGNED NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL,
  `username` varchar(45) NOT NULL,
  `tasks` varchar(500) NOT NULL,
  `dates` date NOT NULL DEFAULT current_timestamp(),
  `time` time NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`id`, `userid`, `username`, `tasks`, `dates`, `time`) VALUES
(1, 1, 'admin', 'View dataset', '2021-05-26', '16:14:32'),
(2, 1, 'admin', 'Logged In', '2021-05-26', '16:14:32'),
(3, 1, 'admin', 'Logged In', '2021-05-26', '16:14:32'),
(4, 1, 'admin', 'Viewed Dataset', '2021-05-26', '16:14:32'),
(5, 1, 'admin', 'Checked for new requests', '2021-05-26', '16:14:32'),
(6, 1, 'admin', 'Accepted new users', '2021-05-26', '16:14:32'),
(7, 1, 'admin', 'Checked for new requests', '2021-05-26', '16:14:32'),
(8, 1, 'admin', 'Logged out', '2021-05-26', '16:14:32'),
(9, 8, 'sakib', 'Logged In', '2021-05-26', '16:14:32'),
(10, 8, 'sakib', 'Viewed Dataset', '2021-05-26', '16:14:32'),
(11, 8, 'sakib', 'Logged out', '2021-05-26', '16:14:32'),
(12, 1, 'admin', 'Logged In', '2021-05-26', '16:14:32'),
(13, 1, 'admin', 'Logged out', '2021-05-26', '16:15:58'),
(14, 8, 'sakib', 'Logged In', '2021-05-26', '16:16:06'),
(15, 8, 'sakib', 'Logged out', '2021-05-26', '16:16:35'),
(16, 9, 'demo', 'Logged In', '2021-05-26', '16:16:43'),
(17, 9, 'demo', 'Logged out', '2021-05-26', '16:18:20'),
(18, 1, 'admin', 'Logged In', '2021-05-26', '16:23:07'),
(19, 12, '', 'Registered as new user', '2021-05-26', '17:20:28'),
(20, 1, 'admin', 'Logged In', '2021-05-26', '17:42:58'),
(21, 1, 'admin', 'Checked for new requests', '2021-05-26', '17:43:03'),
(22, 1, 'admin', 'Accepted new users', '2021-05-26', '17:43:15'),
(23, 1, 'admin', 'Checked for new requests', '2021-05-26', '17:43:15'),
(24, 1, 'admin', 'Viewed Dataset', '2021-05-26', '17:45:48'),
(25, 1, 'admin', 'Logged out', '2021-05-26', '17:50:12'),
(26, 1, 'admin', 'Logged In', '2021-05-27', '15:32:53'),
(27, 1, 'admin', 'Viewed Dataset', '2021-05-27', '15:42:41'),
(28, 1, 'admin', 'Viewed Dataset', '2021-05-27', '15:45:47'),
(29, 1, 'admin', 'Viewed Dataset', '2021-05-27', '15:49:59'),
(30, 1, 'admin', 'Viewed Dataset', '2021-05-27', '15:50:35'),
(31, 1, 'admin', 'Checked for new requests', '2021-05-27', '15:58:28'),
(32, 1, 'admin', 'Logged out', '2021-05-27', '15:58:52'),
(33, 13, 'testing3', 'Registered as new user', '2021-05-27', '15:59:34'),
(34, 14, 'testing4', 'Registered as new user', '2021-05-27', '15:59:57'),
(35, 1, 'admin', 'Logged In', '2021-05-27', '16:00:18'),
(36, 1, 'admin', 'Checked for new requests', '2021-05-27', '16:00:23'),
(37, 1, 'admin', 'Accepted new users', '2021-05-27', '16:05:05'),
(38, 1, 'admin', 'Checked for new requests', '2021-05-27', '16:05:05'),
(39, 1, 'admin', 'Viewed Dataset', '2021-05-27', '16:07:14'),
(40, 1, 'admin', 'Checked for new requests', '2021-05-27', '16:07:18'),
(41, 1, 'admin', 'Accepted new users', '2021-05-27', '16:09:28'),
(42, 1, 'admin', 'Checked for new requests', '2021-05-27', '16:09:29'),
(43, 1, 'admin', 'Logged out', '2021-05-27', '16:17:28'),
(44, 8, 'sakib', 'Logged In', '2021-05-27', '16:19:39'),
(45, 8, 'sakib', 'Logged out', '2021-05-27', '16:22:04'),
(46, 15, 'sasasa', 'Registered as new user', '2021-05-28', '17:23:13'),
(47, 1, 'admin', 'Logged In', '2021-05-28', '17:23:20'),
(48, 1, 'admin', 'Checked for new requests', '2021-05-28', '17:23:24'),
(49, 1, 'admin', 'Rejected new user sasasa', '2021-05-28', '17:27:23'),
(50, 1, 'admin', 'Checked for new requests', '2021-05-28', '17:27:23'),
(51, 1, 'admin', 'Logged out', '2021-05-28', '17:34:38'),
(52, 16, 'adad', 'Registered as new user', '2021-05-28', '17:49:28'),
(53, 1, 'admin', 'Logged In', '2021-05-28', '17:49:52'),
(54, 1, 'admin', 'Checked for new requests', '2021-05-28', '17:50:00'),
(55, 1, 'admin', 'Checked for new requests', '2021-05-28', '17:51:09'),
(56, 1, 'admin', 'Rejected new user adad', '2021-05-28', '17:51:16'),
(57, 1, 'admin', 'Checked for new requests', '2021-05-28', '17:51:16'),
(58, 1, 'admin', 'Logged out', '2021-05-28', '17:51:22'),
(59, 17, 'fgfg', 'Registered as new user', '2021-05-28', '17:54:29'),
(60, 1, 'admin', 'Logged In', '2021-05-28', '17:54:50'),
(61, 1, 'admin', 'Checked for new requests', '2021-05-28', '17:54:56'),
(62, 1, 'admin', 'Rejected new user fgfg', '2021-05-28', '17:55:00'),
(63, 1, 'admin', 'Checked for new requests', '2021-05-28', '17:55:00'),
(64, 1, 'admin', 'Logged out', '2021-05-28', '17:55:05'),
(65, 1, 'admin', 'Logged In', '2021-05-29', '16:03:14'),
(66, 1, 'admin', 'Viewed Dataset', '2021-05-29', '16:03:29'),
(67, 1, 'admin', 'Checked for new requests', '2021-05-29', '16:03:43'),
(68, 1, 'admin', 'Logged out', '2021-05-29', '16:04:05'),
(69, 8, 'sakib', 'Logged In', '2021-05-29', '16:04:13'),
(70, 8, 'sakib', 'Viewed Dataset', '2021-05-29', '16:04:42'),
(71, 8, 'sakib', 'Logged out', '2021-05-29', '16:04:56'),
(72, 1, 'admin', 'Logged In', '2021-05-30', '13:01:47'),
(73, 1, 'admin', 'Logged out', '2021-05-30', '13:05:45'),
(74, 18, 'user1', 'Registered as new user', '2021-05-30', '13:08:14'),
(75, 1, 'admin', 'Logged In', '2021-05-30', '13:08:37'),
(76, 1, 'admin', 'Checked for new requests', '2021-05-30', '13:08:42'),
(77, 1, 'admin', 'Rejected new user user1', '2021-05-30', '13:08:54'),
(78, 1, 'admin', 'Checked for new requests', '2021-05-30', '13:08:55'),
(79, 1, 'admin', 'Viewed Dataset', '2021-05-30', '13:09:00'),
(80, 1, 'admin', 'Logged out', '2021-05-30', '13:09:43'),
(81, 19, 'user2', 'Registered as new user', '2021-05-30', '13:10:22'),
(82, 1, 'admin', 'Logged In', '2021-05-30', '13:10:28'),
(83, 1, 'admin', 'Checked for new requests', '2021-05-30', '13:10:31'),
(84, 1, 'admin', 'Accepted new user user2', '2021-05-30', '13:10:36'),
(85, 1, 'admin', 'Checked for new requests', '2021-05-30', '13:10:36'),
(86, 1, 'admin', 'Logged out', '2021-05-30', '13:10:41'),
(87, 19, 'user2', 'Logged In', '2021-05-30', '13:10:50'),
(88, 19, 'user2', 'Logged out', '2021-05-30', '13:10:59'),
(89, 1, 'admin', 'Logged In', '2021-06-03', '20:23:09'),
(90, 1, 'admin', 'Predicted Behavior for Sakib Patel', '2021-06-03', '20:31:36'),
(91, 1, 'admin', 'Logged out', '2021-06-03', '20:33:51'),
(92, 1, 'admin', 'Logged In', '2021-06-03', '20:34:00');

-- --------------------------------------------------------

--
-- Table structure for table `predictionhistory`
--

CREATE TABLE `predictionhistory` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `allocateddays` varchar(100) NOT NULL,
  `completeddays` varchar(100) NOT NULL,
  `appraisal` varchar(100) NOT NULL,
  `ontime` varchar(10) NOT NULL,
  `complaints` varchar(10) NOT NULL,
  `joiningdate` varchar(100) NOT NULL,
  `behavior` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `predictionhistory`
--

INSERT INTO `predictionhistory` (`id`, `userid`, `name`, `allocateddays`, `completeddays`, `appraisal`, `ontime`, `complaints`, `joiningdate`, `behavior`) VALUES
(1, 1, 'sakib', '4', '5', '5', 'Yes', '0', '1-2-2012', 'Good'),
(2, 1, 'Sakib Patel', '600', '400', '5', 'Yes', '1', '2012-06-08', 'Excellent');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `isadmin` varchar(45) NOT NULL DEFAULT '0',
  `isverified` int(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `isadmin`, `isverified`) VALUES
(1, 'admin', 'qwerty', '1', 1),
(8, 'sakib', 'qwerty', '0', 1),
(9, 'demo', 'qwerty', '0', 1),
(13, 'testing3', 'qwerty', '0', 1),
(14, 'testing4', 'qwerty', '0', 1),
(17, 'fgfg', 'qwerty', '0', 2),
(18, 'user1', 'qwerty', '0', 2),
(19, 'user2', 'qwerty', '0', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `predictionhistory`
--
ALTER TABLE `predictionhistory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `predictionhistory`
--
ALTER TABLE `predictionhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
