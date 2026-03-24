-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 15, 2025 at 03:45 PM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `skidb`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `cart_items`
--

CREATE TABLE `cart_items` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `gender` enum('m','f','unisex') DEFAULT 'unisex'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `parent_id`, `gender`) VALUES
(1, 'Mężczyźni', 'mezczyzni', NULL, 'm'),
(4, 'Kobiety', 'kobiety', NULL, 'f'),
(11, 'Odzież', 'odziez-m', 1, 'm'),
(12, 'Snowboard', 'snowboard-m', 1, 'm'),
(13, 'Narty', 'narty-m', 1, 'm'),
(14, 'Akcesoria', 'akcesoria-m', 1, 'm'),
(41, 'Odzież', 'odziez-f', 4, 'f'),
(42, 'Snowboard', 'snowboard-f', 4, 'f'),
(43, 'Narty', 'narty-f', 4, 'f'),
(44, 'Akcesoria', 'akcesoria-f', 4, 'f'),
(70, 'Kurtki', 'kurtki-m', 11, 'm'),
(71, 'Bluzy', 'bluzy-m', 11, 'm'),
(72, 'Odzież termiczna', 'odziez-termiczna-m', 11, 'm'),
(73, 'Skarpety', 'skarpetki-m', 11, 'm'),
(74, 'Snowboards', 'snowboards-m', 12, 'm'),
(75, 'Bindings', 'bindings-m', 12, 'm'),
(76, 'Buty snowboardowe', 'buty-snowboard-m', 12, 'm'),
(77, 'Narty', 'narty-m2', 13, 'm'),
(78, 'Kijki', 'kijki-m', 13, 'm'),
(79, 'Buty narciarskie', 'buty-narciarskie-m', 13, 'm'),
(80, 'Kaski', 'kaski-m', 14, 'm'),
(81, 'Gogle', 'gogle-m', 14, 'm'),
(82, 'Rękawice', 'rekawice-m', 14, 'm'),
(83, 'Kurtki', 'kurtki-f', 41, 'f'),
(84, 'Bluzy', 'bluzy-f', 41, 'f'),
(85, 'Odzież termiczna', 'odziez-termiczna-f', 41, 'f'),
(86, 'Skarpety', 'skarpetki-f', 41, 'f'),
(87, 'Snowboards', 'snowboards-f', 42, 'f'),
(88, 'Bindings', 'bindings-f', 42, 'f'),
(89, 'Buty snowboardowe', 'buty-snowboard-f', 42, 'f'),
(90, 'Narty', 'narty-f2', 43, 'f'),
(91, 'Kijki', 'kijki-f', 43, 'f'),
(92, 'Buty narciarskie', 'buty-narciarskie-f', 43, 'f'),
(93, 'Kaski', 'kaski-f', 44, 'f'),
(94, 'Gogle', 'gogle-f', 44, 'f'),
(95, 'Rękawice', 'rekawice-f', 44, 'f');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `invoices`
--

CREATE TABLE `invoices` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `invoice_number` varchar(50) NOT NULL,
  `issued_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `order_id`, `invoice_number`, `issued_at`) VALUES
(1, 1, 'FV-20251215-1', '2025-12-15 15:10:07');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `status` enum('pending','paid','shipped','cancelled') DEFAULT 'pending',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total_price`, `status`, `created_at`, `updated_at`) VALUES
(1, 17, 1599.98, 'shipped', '2025-12-15 15:10:07', '2025-12-15 15:40:35');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT 1,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `price`) VALUES
(1, 1, 5, 1, 399.99),
(2, 1, 28, 1, 1199.99);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(11) DEFAULT 0,
  `category_id` int(11) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `stock`, `category_id`, `image_url`) VALUES
(4, 'Kurtka Męska X', 'Ciepła kurtka na zimę i snowboard', 499.99, 20, 70, 'kurtka (1).jpg'),
(5, 'Kurtka Męska Y', 'Lekka kurtka sportowa', 399.99, 15, 70, 'kurtka (2).jpg'),
(6, 'Kurtka Męska Z', 'Profesjonalna kurtka narciarska', 699.99, 10, 70, 'kurtka (3).jpg'),
(7, 'Kurtka Damska A', 'Ciepła i elegancka kurtka zimowa', 499.99, 20, 83, 'kurtka (4).jpg'),
(8, 'Kurtka Damska B', 'Lekka kurtka sportowa damska', 399.99, 15, 83, 'kurtka (5).jpg'),
(9, 'Kurtka Damska C', 'Profesjonalna kurtka narciarska damska', 699.99, 10, 83, 'kurtka (6).jpg'),
(10, 'Bluza Męska X', 'Ciepła bluza sportowa', 199.99, 25, 71, 'bluza (4).jpg'),
(11, 'Bluza Męska Y', 'Bluza narciarska z kapturem', 249.99, 20, 71, 'bluza (5).jpg'),
(12, 'Bluza Męska Z', 'Lekka bluza treningowa', 179.99, 30, 71, 'bluza (6).jpg'),
(13, 'Bluza Damska A', 'Ciepła bluza sportowa dla kobiet', 199.99, 25, 84, 'bluza (1).jpg'),
(14, 'Bluza Damska B', 'Bluza narciarska damska', 249.99, 20, 84, 'bluza (2).jpg'),
(15, 'Bluza Damska C', 'Lekka bluza treningowa damska', 179.99, 30, 84, 'bluza (3).jpg'),
(16, 'Bielizna Termiczna Męska X', 'Ciepła bielizna na zimę', 99.99, 40, 72, 'termo (1).jpg'),
(17, 'Bielizna Termiczna Męska Y', 'Oddychająca bielizna sportowa', 89.99, 35, 72, 'termo (2).jpg'),
(18, 'Bielizna Termiczna Męska Z', 'Profesjonalna bielizna narciarska', 129.99, 30, 72, 'termo (3).jpg'),
(19, 'Bielizna Termiczna Damska A', 'Ciepła bielizna damska', 99.99, 40, 85, 'termo (4).jpg'),
(20, 'Bielizna Termiczna Damska B', 'Oddychająca bielizna sportowa', 89.99, 35, 85, 'termo (5).jpg'),
(21, 'Bielizna Termiczna Damska C', 'Profesjonalna bielizna narciarska', 129.99, 30, 85, 'termo (6).jpg'),
(22, 'Skarpety Męskie X', 'Ciepłe skarpety na narty i snowboard', 39.99, 50, 73, 'skiety (1).jpg'),
(23, 'Skarpety Męskie Y', 'Oddychające skarpety do sportów zimowych', 29.99, 40, 73, 'skiety (2).jpg'),
(24, 'Skarpety Męskie Z', 'Wysokiej jakości wełniane skarpety zimowe', 49.99, 30, 73, 'skiety (3).jpg'),
(25, 'Skarpety Damskie A', 'Ciepłe i wygodne skarpety na zimę', 39.99, 50, 86, 'skiety (4).jpg'),
(26, 'Skarpety Damskie B', 'Oddychające skarpety damskie do sportów zimowych', 29.99, 40, 86, 'skiety (5).jpg'),
(27, 'Skarpety Damskie C', 'Miękkie i ciepłe skarpety wełniane', 49.99, 30, 86, 'skiety (6).jpg'),
(28, 'Snowboard Męski X', 'Deska snowboardowa dla początkujących', 1199.99, 10, 74, 'snowboard (1).jpg'),
(29, 'Snowboard Męski Y', 'Deska snowboardowa średniozaawansowana', 1499.99, 8, 74, 'snowboard (2).jpg'),
(30, 'Snowboard Męski Z', 'Profesjonalna deska snowboardowa', 1999.99, 5, 74, 'snowboard (3).jpg'),
(31, 'Snowboard Damski A', 'Deska snowboardowa damska dla początkujących', 1199.99, 10, 87, 'snowboard (4).jpg'),
(32, 'Snowboard Damski B', 'Deska snowboardowa damska średniozaawansowana', 1499.99, 8, 87, 'snowboard (5).jpg'),
(33, 'Snowboard Damski C', 'Profesjonalna deska snowboardowa damska', 1999.99, 5, 87, 'snowboard (6).jpg'),
(34, 'Bindings Męskie X', 'Wiązania snowboardowe męskie', 399.99, 20, 75, 'bindings (1).jpg'),
(35, 'Bindings Męskie Y', 'Wiązania średniozaawansowane', 499.99, 15, 75, 'bindings (2).jpg'),
(36, 'Bindings Męskie Z', 'Profesjonalne wiązania', 699.99, 10, 75, 'bindings (3).jpg'),
(37, 'Bindings Damskie A', 'Wiązania snowboardowe damskie', 399.99, 20, 88, 'bindings (4).jpg'),
(38, 'Bindings Damskie B', 'Wiązania damskie średniozaawansowane', 499.99, 15, 88, 'bindings (5).jpg'),
(39, 'Bindings Damskie C', 'Profesjonalne wiązania damskie', 699.99, 10, 88, 'bindings (6).jpg'),
(40, 'Buty Snowboard Męskie X', 'Buty snowboardowe męskie wygodne', 599.99, 15, 76, 'butys (1).jpg'),
(41, 'Buty Snowboard Męskie Y', 'Buty średniozaawansowane', 699.99, 12, 76, 'butys (2).jpg'),
(42, 'Buty Snowboard Męskie Z', 'Buty profesjonalne', 899.99, 8, 76, 'butys (3).jpg'),
(43, 'Buty Snowboard Damskie A', 'Buty snowboardowe damskie wygodne', 599.99, 15, 89, 'butys (4).jpg'),
(44, 'Buty Snowboard Damskie B', 'Buty damskie średniozaawansowane', 699.99, 12, 89, 'butys (5).jpg'),
(45, 'Buty Snowboard Damskie C', 'Buty damskie profesjonalne', 899.99, 8, 89, 'butys (6).jpg'),
(46, 'Narty Męskie X', 'Narty dla początkujących', 999.99, 10, 77, 'narty (1).jpg'),
(47, 'Narty Męskie Y', 'Narty średniozaawansowane', 1499.99, 8, 77, 'narty (2).jpg'),
(48, 'Narty Męskie Z', 'Profesjonalne narty', 1999.99, 5, 77, 'narty (3).jpg'),
(49, 'Narty Damskie A', 'Narty damskie dla początkujących', 999.99, 10, 90, 'narty (4).jpg'),
(50, 'Narty Damskie B', 'Narty damskie średniozaawansowane', 1499.99, 8, 90, 'narty (5).jpg'),
(51, 'Narty Damskie C', 'Profesjonalne narty damskie', 1999.99, 5, 90, 'narty (6).jpg'),
(52, 'Kijki Męskie X', 'Kijki narciarskie lekkie', 49.99, 30, 78, 'kijki (1).jpg'),
(53, 'Kijki Męskie Y', 'Kijki średniozaawansowane', 79.99, 20, 78, 'kijki (2).jpg'),
(54, 'Kijki Męskie Z', 'Profesjonalne kijki', 129.99, 10, 78, 'kijki (3).jpg'),
(55, 'Kijki Damskie A', 'Kijki narciarskie lekkie', 49.99, 30, 91, 'kijki (4).jpg'),
(56, 'Kijki Damskie B', 'Kijki średniozaawansowane', 79.99, 20, 91, 'kijki (5).jpg'),
(57, 'Kijki Damskie C', 'Profesjonalne kijki', 129.99, 10, 91, 'kijki (6).jpg'),
(58, 'Buty Narciarskie Męskie X', 'Wygodne buty narciarskie męskie', 699.99, 15, 79, 'butyn (1).jpg'),
(59, 'Buty Narciarskie Męskie Y', 'Buty średniozaawansowane', 899.99, 12, 79, 'butyn (2).jpg'),
(60, 'Buty Narciarskie Męskie Z', 'Profesjonalne buty narciarskie', 1199.99, 8, 79, 'butyn (3).jpg'),
(61, 'Buty Narciarskie Damskie A', 'Wygodne buty narciarskie damskie', 699.99, 15, 92, 'butyn (4).jpg'),
(62, 'Buty Narciarskie Damskie B', 'Buty damskie średniozaawansowane', 899.99, 12, 92, 'butyn (5).jpg'),
(63, 'Buty Narciarskie Damskie C', 'Profesjonalne buty narciarskie damskie', 1199.99, 8, 92, 'butyn (6).jpg'),
(64, 'Kaski Męskie X', 'Kask narciarski męski lekki', 199.99, 25, 80, 'kaski (1).jpg'),
(65, 'Kaski Męskie Y', 'Kask średniozaawansowany', 299.99, 20, 80, 'kaski (2).jpg'),
(66, 'Kaski Męskie Z', 'Profesjonalny kask narciarski', 399.99, 15, 80, 'kaski (3).jpg'),
(67, 'Kaski Damskie A', 'Kask damski lekki', 199.99, 25, 93, 'kaski (4).jpg'),
(68, 'Kaski Damskie B', 'Kask damski średniozaawansowany', 299.99, 20, 93, 'kaski (5).jpg'),
(69, 'Kaski Damskie C', 'Profesjonalny kask damski', 399.99, 15, 93, 'kaski (6).jpg'),
(70, 'Gogle Męskie X', 'Gogle narciarskie męskie', 149.99, 30, 81, 'gogle (1).jpg'),
(71, 'Gogle Męskie Y', 'Gogle średniozaawansowane', 249.99, 20, 81, 'gogle (2).jpg'),
(72, 'Gogle Męskie Z', 'Profesjonalne gogle', 349.99, 15, 81, 'gogle (3).jpg'),
(73, 'Gogle Damskie A', 'Gogle damskie', 149.99, 30, 94, 'gogle (4).jpg'),
(74, 'Gogle Damskie B', 'Gogle średniozaawansowane damskie', 249.99, 20, 94, 'gogle (5).jpg'),
(75, 'Gogle Damskie C', 'Profesjonalne gogle damskie', 349.99, 15, 94, 'gogle (6).jpg'),
(76, 'Rękawice Męskie X', 'Rękawice narciarskie męskie', 69.99, 40, 82, 'rekawice (1).jpg'),
(77, 'Rękawice Męskie Y', 'Rękawice średniozaawansowane', 149.99, 25, 82, 'rekawice (2).jpg'),
(78, 'Rękawice Męskie Z', 'Profesjonalne rękawice', 249.99, 15, 82, 'rekawice (3).jpg'),
(79, 'Rękawice Damskie A', 'Rękawice damskie', 69.99, 40, 95, 'rekawice (4).jpg'),
(80, 'Rękawice Damskie B', 'Rękawice średniozaawansowane damskie', 149.99, 25, 95, 'rekawice (5).jpg'),
(81, 'Rękawice Damskie C', 'Profesjonalne rękawice damskie', 249.99, 15, 95, 'rekawice (6).jpg');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(500) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('user','admin') DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password_hash`, `role`) VALUES
(1, 'Admin', 'Admin', 'admin@example.com', 'admin', 'admin'),
(14, 'Jan', 'Kowalski', 'jan@example.com', 'password123', 'user'),
(15, 'Anna', 'Nowak', 'anna@example.com', 'password123', 'user'),
(17, 'Mariusz', 'Pudzianowski', 'koksik@example.com', 'Pudziano', 'user'),
(19, 'Jakub', 'Jakubiec', 'Kartofela@example.com', 'Skarpetki12', 'user');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indeksy dla tabeli `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indeksy dla tabeli `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_id` (`order_id`),
  ADD UNIQUE KEY `invoice_number` (`invoice_number`);

--
-- Indeksy dla tabeli `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeksy dla tabeli `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indeksy dla tabeli `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
