-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 29, 2025 at 05:53 PM
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
-- Database: `coffee_shop_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`, `email`, `created_at`) VALUES
(1, 'admin', '$2a$10$XZq8QjH7XvLZ3rF5.M5JG.xPj5kH9aK7Z8Kx0Z6YM7X0Z1Z2Z3Z4Z', 'admin@coffeeshop.com', '2025-12-21 17:11:54');

-- --------------------------------------------------------

--
-- Table structure for table `coffee_items`
--

CREATE TABLE `coffee_items` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `coffee_items`
--

INSERT INTO `coffee_items` (`id`, `name`, `description`, `price`, `image_url`, `created_at`, `updated_at`) VALUES
(1, 'Espresso', 'Rich and bold Italian espresso shot', 2.50, 'https://images.unsplash.com/photo-1510591509098-f4fdc6d0ff04', '2025-12-21 17:11:54', '2025-12-21 17:11:54'),
(2, 'Cappuccino', 'Espresso with steamed milk and foam', 3.50, 'https://images.unsplash.com/photo-1572442388796-11668a67e53d', '2025-12-21 17:11:54', '2025-12-21 17:11:54'),
(3, 'Latte', 'Smooth espresso with steamed milk', 4.00, 'https://images.unsplash.com/photo-1461023058943-07fcbe16d735', '2025-12-21 17:11:54', '2025-12-21 17:11:54'),
(4, 'Americano', 'Espresso diluted with hot water', 3.00, 'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd', '2025-12-21 17:11:54', '2025-12-21 17:11:54'),
(5, 'Mocha', 'Chocolate-flavored espresso with milk', 4.50, 'https://images.unsplash.com/photo-1578314675249-a6910f80cc4e', '2025-12-21 17:11:54', '2025-12-21 17:11:54');

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_messages`
--

INSERT INTO `contact_messages` (`id`, `name`, `email`, `message`, `created_at`) VALUES
(1, 'John Doe', 'john@example.com', 'I love your coffee! Do you offer catering services?', '2025-12-21 17:11:54'),
(2, 'Jane Smith', 'jane@example.com', 'What are your opening hours on weekends?', '2025-12-21 17:11:54');

-- --------------------------------------------------------

--
-- Table structure for table `dessert_items`
--

CREATE TABLE `dessert_items` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dessert_items`
--

INSERT INTO `dessert_items` (`id`, `name`, `description`, `price`, `image_url`, `created_at`, `updated_at`) VALUES
(1, 'Chocolate Cake', 'Rich chocolate layer cake with ganache', 5.50, 'https://images.unsplash.com/photo-1578985545062-69928b1d9587', '2025-12-21 17:11:54', '2025-12-21 17:11:54'),
(2, 'Cheesecake', 'Creamy New York style cheesecake', 6.00, 'https://images.unsplash.com/photo-1533134486753-c833f0ed4866', '2025-12-21 17:11:54', '2025-12-21 17:11:54'),
(3, 'Tiramisu', 'Classic Italian coffee-flavored dessert', 5.00, 'https://images.unsplash.com/photo-1571877227200-a0d98ea607e9', '2025-12-21 17:11:54', '2025-12-21 17:11:54'),
(4, 'Croissant', 'Buttery flaky French pastry', 3.50, 'https://images.unsplash.com/photo-1555507036-ab1f4038808a', '2025-12-21 17:11:54', '2025-12-21 17:11:54'),
(5, 'Brownie', 'Fudgy chocolate brownie with walnuts', 4.00, 'https://images.unsplash.com/photo-1607920591413-4ec007e70023', '2025-12-21 17:11:54', '2025-12-21 17:11:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `coffee_items`
--
ALTER TABLE `coffee_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dessert_items`
--
ALTER TABLE `dessert_items`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `coffee_items`
--
ALTER TABLE `coffee_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `dessert_items`
--
ALTER TABLE `dessert_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
