-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 24, 2021 at 11:55 PM
-- Server version: 8.0.25-0ubuntu0.21.04.1
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `food_oms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `is_delete` varchar(5) NOT NULL DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `is_delete`) VALUES
(1, 'Main Dish', 'false'),
(2, 'Beverrage', 'false'),
(3, 'Dessert', 'false'),
(4, 'Cold', 'false'),
(5, 'Hot', 'false'),
(9, 'Snack', 'true'),
(10, 'Goreng', 'false'),
(11, 'Kuah', 'false');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone_number` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `phone_number`) VALUES
(1, 'Dimas Subaktianto', '087653647765'),
(2, 'M. Hafiz', '087532648811'),
(3, 'Eka Saputra', '089534767832'),
(4, 'M. Rasyid', '081255348765'),
(5, 'Ikhsanul Fahmy', '082177664839');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `price` int DEFAULT '0',
  `is_delete` varchar(5) NOT NULL DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `price`, `is_delete`) VALUES
(1, 'Nasi Goreng Ayam 2', 18000, 'false'),
(2, 'Martabak Mesir', 15000, 'false'),
(3, 'Ayam Geprek', 12000, 'false'),
(4, 'Mie Goreng Seafood', 2000, 'false'),
(5, 'Dadar Gulung', 10000, 'false'),
(6, 'Teh Es', 5000, 'false'),
(7, 'Jus Jeruk', 10000, 'false'),
(8, 'Kentang Goreng', 17000, 'false'),
(9, 'Sosis Goreng', 20000, 'false'),
(10, 'Es Cappucino', 12000, 'false'),
(13, 'susu coklat', 34000, 'true'),
(14, 'Sayur Asem', 3000, 'false'),
(15, 'Sayur Lodeh 2', 20000, 'true'),
(16, 'Sayur Lodeh', 12000, 'true'),
(17, 'Ayam Penyet Jumbo', 25000, 'true'),
(18, 'Ayam Rica Rica', 2000, 'false'),
(19, 'Ifumi', 20000, 'true');

-- --------------------------------------------------------

--
-- Table structure for table `item_categories`
--

CREATE TABLE `item_categories` (
  `id` int NOT NULL,
  `item_id` int NOT NULL,
  `category_id` int NOT NULL,
  `is_delete` varchar(5) NOT NULL DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `item_categories`
--

INSERT INTO `item_categories` (`id`, `item_id`, `category_id`, `is_delete`) VALUES
(10, 1, 1, 'false'),
(11, 2, 1, 'false'),
(12, 3, 1, 'false'),
(13, 4, 1, 'false'),
(14, 5, 3, 'false'),
(15, 6, 2, 'false'),
(16, 7, 2, 'false'),
(17, 8, 1, 'false'),
(18, 9, 1, 'true'),
(19, 10, 2, 'false'),
(20, 13, 1, 'true'),
(21, 14, 1, 'true'),
(22, 15, 1, 'true'),
(23, 16, 1, 'true'),
(24, 17, 1, 'true'),
(25, 17, 10, 'true'),
(26, 17, 1, 'true'),
(27, 17, 10, 'true'),
(28, 17, 1, 'true'),
(29, 17, 9, 'true'),
(30, 17, 10, 'true'),
(31, 17, 9, 'true'),
(32, 17, 10, 'true'),
(33, 17, 9, 'true'),
(34, 17, 10, 'true'),
(35, 14, 1, 'true'),
(36, 14, 11, 'true'),
(37, 14, 1, 'true'),
(38, 14, 2, 'true'),
(39, 14, 11, 'true'),
(40, 14, 2, 'false'),
(41, 14, 11, 'false'),
(42, 9, 1, 'false'),
(43, 9, 5, 'false'),
(44, 9, 10, 'false'),
(45, 18, 1, 'true'),
(46, 18, 5, 'true'),
(47, 18, 11, 'true'),
(48, 18, 1, 'true'),
(49, 18, 11, 'true'),
(50, 18, 1, 'true'),
(51, 18, 11, 'true'),
(52, 18, 11, 'true'),
(53, 18, 1, 'false'),
(54, 18, 11, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `customer_id` int NOT NULL,
  `order_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `order_date`) VALUES
(1, 1, '2021-07-17'),
(2, 3, '2021-07-16'),
(3, 2, '2021-07-17'),
(4, 4, '2021-07-16'),
(5, 5, '2021-07-15');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `item_id` int NOT NULL,
  `quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `item_id`, `quantity`) VALUES
(1, 1, 1, 2),
(2, 1, 5, 2),
(3, 1, 7, 2),
(7, 2, 3, 2),
(8, 2, 8, 1),
(9, 2, 10, 2),
(10, 3, 2, 1),
(11, 3, 3, 1),
(12, 3, 6, 2),
(13, 4, 8, 2),
(14, 4, 4, 2),
(15, 5, 7, 2),
(16, 5, 1, 2),
(17, 5, 5, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone_number` (`phone_number`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_categories`
--
ALTER TABLE `item_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `item_id` (`item_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `item_categories`
--
ALTER TABLE `item_categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `item_categories`
--
ALTER TABLE `item_categories`
  ADD CONSTRAINT `item_categories_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  ADD CONSTRAINT `item_categories_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
