-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 09, 2022 at 10:14 PM
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
-- Database: `ecomm`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `product_id`, `user_id`) VALUES
(26, 2, 1),
(27, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `img` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `title`, `img`) VALUES
(1, 'Computer', 'https://images.twinkl.co.uk/tw1n/image/private/t_630/u/ux/pc_ver_1.png'),
(2, 'Clothes', 'https://5.imimg.com/data5/ANDROID/Default/2020/12/GB/FH/MN/69548664/6f29894b37fb92b0c5bd3f855be56d34-jpg-500x500.jpg'),
(3, 'Grocery', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQl9OtGVNk01f2-KT23qMM1WeimV3eKQrFH82f3zQ0mAUnnWJ7XuKg8Jvk-ZyhDyUrlUow&usqp=CAU'),
(4, 'Games', 'data:image/jpeg;base64,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'),
(5, 'Others', 'http://cdn.shopify.com/s/files/1/0566/7684/3689/collections/1_164f9cc9-6a4e-4cf8-9ee4-04f3d8716a35_1200x1200.png?v=1621705128');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` varchar(100) NOT NULL,
  `date_time` datetime DEFAULT current_timestamp(),
  `state` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `address`, `date_time`, `state`) VALUES
(1, 3, '6th of october city', '2022-06-29 11:23:48', 1),
(2, 1, '6TH of October City, Egypt', '2022-06-29 11:25:43', 2),
(3, 3, '6TH of October City, Egypt', '2022-06-29 11:28:15', 0),
(4, 1, '6TH of October City, Egypt', '2022-07-09 22:03:05', 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `quantity`) VALUES
(1, 1, 7, 3),
(2, 1, 8, 5),
(3, 2, 1, 1),
(4, 2, 3, 2),
(5, 2, 7, 1),
(6, 3, 1, 1),
(7, 3, 3, 2),
(8, 3, 7, 2),
(9, 4, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `details` varchar(150) NOT NULL,
  `img` text DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `price` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `details`, `img`, `category_id`, `price`) VALUES
(1, 'Keyboard 88', 'Keyboard Hp High Quality', 'https://eg.jumia.is/unsafe/fit-in/300x300/filters:fill(white)/product/51/304662/1.jpg?2475', 1, 150),
(2, 'Router 1000', 'Zyxel Wireless N300 Home Router', 'https://eg.jumia.is/unsafe/fit-in/300x300/filters:fill(white)/product/67/668072/1.jpg?5767', 1, 100),
(3, 'Lenovo IdeaPad', 'Lenovo IdeaPad 3 15ADA6 Gaming Laptop - AMD Ryzen 5 3500U – 8GB – 512 SSD - AMD Radeon RX Vega 8 Graphics - 15.6-inch FHD – DOS – Arctic Grey – Englis', 'https://eg.jumia.is/unsafe/fit-in/300x300/filters:fill(white)/product/12/304662/1.jpg?2950', 1, 110),
(4, 'Gaming Mouse', 'Yafox G10 High Performance 6D Gaming Mouse - 1600DPI - Red', 'https://eg.jumia.is/unsafe/fit-in/300x300/filters:fill(white)/product/04/638152/1.jpg?0263', 1, 200),
(6, 'حقيبة ظهر للكمبيوتر', 'Force حقيبة ظهر للكمبيوتر المحمول مقاس 14 بوصة للجنسين - أسود', 'https://eg.jumia.is/unsafe/fit-in/300x300/filters:fill(white)/product/49/316702/1.jpg?3762', 1, 752),
(7, 'أرز مصري', 'Aldoha أرز مصري 5 ك', 'https://eg.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/44/060512/1.jpg?8237', 3, 25),
(8, 'Abu Auf Medium', 'Abu Auf Medium Turkish Coffee – 250 gm', 'https://eg.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/94/324532/1.jpg?2436', 3, 70);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `password` varchar(32) NOT NULL,
  `img` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstName`, `lastName`, `email`, `phone`, `password`, `img`) VALUES
(1, 'Ahmed', 'Mostafa', 'ahmed@gmail.com', '01113207046', '12345', NULL),
(3, 'Ahmed', 'Mostafa', 'admin@gmail.com', '01090468714', '12345', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_email` (`email`),
  ADD UNIQUE KEY `uq_phone` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_products_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
