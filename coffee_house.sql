-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 29, 2025 at 05:52 PM
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
-- Database: `coffee_house`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(120) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `email`, `password_hash`, `created_at`) VALUES
(1, 'nagham', 'nagham12@gmail.com', '$2b$10$S9QvWRPFz1V9WU5raMGbeezYf33e6Dl0.DeXw9GY7k6HEVfqCd9mG', '2025-12-28 13:06:31');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `menu_type` enum('coffee','dessert') NOT NULL,
  `name` varchar(120) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image_key` varchar(120) DEFAULT NULL,
  `is_available` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `menu_type`, `name`, `price`, `image_key`, `is_available`, `created_at`, `updated_at`) VALUES
(1, 'coffee', 'Espresso', 4.00, 'espresso', 1, '2025-12-27 22:57:24', '2025-12-27 22:57:24'),
(2, 'coffee', 'Cappuccino', 5.00, 'cappuccino', 1, '2025-12-27 22:57:24', '2025-12-27 22:57:24'),
(5, 'coffee', 'Strawberry Milkshake', 5.00, 'strawberry', 1, '2025-12-27 22:57:24', '2025-12-28 16:20:16'),
(9, 'coffee', 'Avocado Cocktail', 6.00, 'avocado', 1, '2025-12-27 22:57:24', '2025-12-27 22:57:24'),
(10, 'coffee', 'Caramel Frappe', 6.00, 'caramel', 1, '2025-12-27 22:57:24', '2025-12-27 22:57:24'),
(11, 'dessert', 'Chocolate Cake', 4.00, 'cake', 1, '2025-12-27 22:57:24', '2025-12-27 22:57:24'),
(12, 'dessert', 'Donut', 3.00, 'donut', 1, '2025-12-27 22:57:24', '2025-12-27 22:57:24'),
(13, 'dessert', 'Brownie', 2.00, 'brownie', 1, '2025-12-27 22:57:24', '2025-12-27 22:57:24'),
(14, 'dessert', 'Lotus Cake', 4.00, 'lotuscake', 1, '2025-12-27 22:57:24', '2025-12-27 22:57:24'),
(15, 'dessert', 'Crepe', 7.00, 'crepe', 1, '2025-12-27 22:57:24', '2025-12-27 22:57:24'),
(16, 'dessert', 'Tiramisu', 3.00, 'tiramisu', 1, '2025-12-27 22:57:24', '2025-12-27 22:57:24'),
(17, 'dessert', 'Cinnamon Rolls', 5.00, 'cinnamonrolls', 1, '2025-12-27 22:57:24', '2025-12-27 22:57:24'),
(18, 'dessert', 'Cupcake', 2.00, 'cupcake', 1, '2025-12-27 22:57:24', '2025-12-27 22:57:24'),
(19, 'dessert', 'Panna Cota', 6.00, 'pannacota', 1, '2025-12-27 22:57:24', '2025-12-27 22:57:24'),
(20, 'dessert', 'Lemon Tart', 5.00, 'lemontart', 1, '2025-12-27 22:57:24', '2025-12-27 22:57:24'),
(22, 'coffee', 'latte', 5.00, 'latte', 1, '2025-12-28 16:31:14', '2025-12-28 16:31:14'),
(23, 'coffee', 'latte', 3.00, 'latte', 1, '2025-12-29 15:39:25', '2025-12-29 15:39:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_items_menu_type` (`menu_type`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
