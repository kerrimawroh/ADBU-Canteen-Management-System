-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 11, 2025 at 03:41 PM
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `canteen`
--

-- --------------------------------------------------------

--
-- Table structure for table `beverages`
--

DROP TABLE IF EXISTS `beverages`;
CREATE TABLE IF NOT EXISTS `beverages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dish_name` varchar(100) NOT NULL,
  `description` text,
  `price` decimal(6,2) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `beverages`
--

INSERT INTO `beverages` (`id`, `dish_name`, `description`, `price`, `image`) VALUES
(1, 'Milk Tea', 'Hot brewed tea', 10.00, 'milk-tea.jpg'),
(2, 'Coffee', 'Hot brewed coffee', 15.00, 'coffee.jpg'),
(3, 'Red Tea', 'Tea without milk', 20.00, 'red-tea.jpg'),
(4, 'Juice', 'Chilled soft drink', 20.00, 'juice.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `breakfast`
--

DROP TABLE IF EXISTS `breakfast`;
CREATE TABLE IF NOT EXISTS `breakfast` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dish_name` varchar(100) NOT NULL,
  `description` text,
  `price` decimal(6,2) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `breakfast`
--

INSERT INTO `breakfast` (`id`, `dish_name`, `description`, `price`, `image`) VALUES
(1, 'Puri Sabji', 'Fried puris served with spiced potato curry', 30.00, 'poori.jpg'),
(2, 'Bread Omlette', 'Toasted bread with fluffy omelette', 25.00, 'bread.jpg'),
(3, 'Idli Sambar', 'Soft idlis with hot sambar', 30.00, 'idli.jpg'),
(4, 'Roti Sabji', 'Whole wheat roti with vegetable curry', 28.00, 'roti.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `lunch`
--

DROP TABLE IF EXISTS `lunch`;
CREATE TABLE IF NOT EXISTS `lunch` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dish_name` varchar(100) NOT NULL,
  `description` text,
  `price` decimal(6,2) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `lunch`
--

INSERT INTO `lunch` (`id`, `dish_name`, `description`, `price`, `image`) VALUES
(1, 'Chicken Thali', 'Rice, chicken curry, dal and salad', 80.00, 'chicken.jpg'),
(2, 'Veg Thali', 'Rice, seasonal veggies, dal and pickle', 60.00, 'veg.jpg'),
(3, 'Egg Thali', 'Rice, egg curry, dal and salad', 65.00, 'egg.jpg'),
(4, 'Fish Thali', 'Rice, fish curry, dal and salad', 85.00, 'fish.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
CREATE TABLE IF NOT EXISTS `reviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dish_id` int NOT NULL,
  `category` enum('breakfast','lunch','snacks','beverages') NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `rating` int DEFAULT NULL,
  `review_text` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `dish_id`, `category`, `user_name`, `rating`, `review_text`, `created_at`) VALUES
(1, 1, 'breakfast', 'mel', 1, 'gvchc', '2025-05-11 08:01:23'),
(2, 1, 'beverages', 'mel', 3, 'good', '2025-05-11 09:07:57'),
(3, 1, 'beverages', 'mel', 5, 'nice taste', '2025-05-11 09:11:02'),
(4, 1, 'breakfast', 'melo', 4, 'tasty', '2025-05-11 09:28:52'),
(5, 1, 'breakfast', 'Baphin', 3, 'Good food', '2025-05-11 10:27:43'),
(6, 2, 'breakfast', 'Baphin', 4, 'execlent taste', '2025-05-11 10:28:23'),
(7, 3, 'breakfast', 'Baphin', 4, 'like it', '2025-05-11 10:28:54'),
(8, 4, 'breakfast', 'Baphin', 4, 'roti is soft and nice', '2025-05-11 10:29:24'),
(9, 1, 'lunch', 'Baphin', 2, 'can be better', '2025-05-11 10:30:13'),
(10, 2, 'lunch', 'Baphin', 4, 'tasty', '2025-05-11 10:30:44'),
(11, 3, 'lunch', 'Baphin', 5, 'my favourite', '2025-05-11 10:31:29'),
(12, 4, 'lunch', 'Baphin', 1, 'fish can be better', '2025-05-11 10:32:01'),
(13, 1, 'snacks', 'Baphin', 4, 'good', '2025-05-11 10:32:48'),
(14, 2, 'snacks', 'Baphin', 4, 'nice an crispy', '2025-05-11 10:33:26'),
(15, 4, 'snacks', 'Baphin', 2, 'could be better', '2025-05-11 10:34:01'),
(16, 3, 'snacks', 'Baphin', 3, 'I like it', '2025-05-11 10:34:42'),
(17, 1, 'beverages', 'Baphin', 3, 'nice', '2025-05-11 10:35:37'),
(18, 2, 'beverages', 'Baphin', 4, 'keeps me awake', '2025-05-11 10:36:27'),
(19, 3, 'beverages', 'Baphin', 3, 'good', '2025-05-11 10:37:00'),
(20, 4, 'beverages', 'Baphin', 2, 'It\'s fine', '2025-05-11 10:37:42');

-- --------------------------------------------------------

--
-- Table structure for table `snacks`
--

DROP TABLE IF EXISTS `snacks`;
CREATE TABLE IF NOT EXISTS `snacks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dish_name` varchar(100) NOT NULL,
  `description` text,
  `price` decimal(6,2) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `snacks`
--

INSERT INTO `snacks` (`id`, `dish_name`, `description`, `price`, `image`) VALUES
(1, 'Momo', 'Steamed dumplings with spicy chutney', 40.00, 'momo.jpg'),
(2, 'Veg Pakodha', 'Crispy vegetable fritters', 25.00, 'veg-pakodha.jpg'),
(3, 'Chicken Pakodha', 'Fried chicken bites', 45.00, 'chicken-pakodha.jpg'),
(4, 'Roll', 'Stuffed wrap with vegetables or chicken', 35.00, 'roll.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`) VALUES
(1, 'mel', 'mel@gmail.com', '$2y$10$U87fb5sQ7QMWiNVkVLY1heet/4K214XRgTQ3UtTwliUL/uzwE5kEa'),
(2, 'melo', 'meel@gmail.com', '$2y$10$jZPYvhbblKSuEVo4zMDVbuJmDVjj.GprijtT3Y/Z.xAk2hfTT6Da.'),
(3, 'Kerrimeka', 'kerri1@gmail.com', '$2y$10$b8CFFiHdsis69IHXNSILJ.qNtT2RoccDl4fuRM2hnxu3c0hjEsYhG'),
(4, 'Baphin', 'baphin@gmail.com', '$2y$10$Nu4DgZxJUHTHoCgXPe6wHucR0OMd47Oi2hDNGuDJivkdY2jp.VE4y'),
(5, 'Prayri', 'Prayri@gmail.com', '$2y$10$.56y3IktCQJ9Ku6T.6Fd..smwCeYEctzvP.Ep/u11/ZOdvc.xSleq'),
(6, 'Lapyn', 'lapyn@gmail.com', '$2y$10$MNlpX2IFZ5HHw1aUMzeE6uXxaq9HbCwSqSHoYCWaMkNxVVYcKwfza'),
(7, 'Roz', 'Ro@gmail.com', '$2y$10$gubv/qOUTgX6lTNwZTCokOvx68XyfI0Vc08B3B1tILRu93zAlActu');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
