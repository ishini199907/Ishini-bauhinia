-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 13, 2023 at 07:04 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bahunia-db`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(30) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `image_path` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `description`, `image_path`, `status`, `delete_flag`, `date_created`) VALUES
(7, 'CARNAGE', 'Be Relentless', NULL, 1, 0, '2023-12-04 19:39:02'),
(8, 'FOA', 'Your Style, Your Statement, Our Fashion', NULL, 1, 0, '2023-12-04 19:42:13'),
(9, 'PEPPER ST.', 'Style that Empowers, Trends that Transcend', NULL, 1, 0, '2023-12-04 19:58:21'),
(10, 'Moose', 'Unleash Your Imagination, Wear Your Passion', NULL, 1, 0, '2023-12-04 20:03:06'),
(11, 'CROCODILE', 'Fashion that Speaks Louder than Words', NULL, 1, 0, '2023-12-04 20:06:29'),
(12, 'Other', '', NULL, 1, 0, '2023-12-05 15:40:00');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `inventory_id` int(30) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `client_id`, `inventory_id`, `price`, `quantity`, `date_created`) VALUES
(35, 6, 31, 4500, 1, '2023-12-07 22:38:40'),
(39, 8, 51, 3250, 2, '2023-12-08 00:44:33'),
(51, 11, 32, 1600, 1, '2023-12-13 11:28:25');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `category` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `description`, `status`, `delete_flag`, `date_created`) VALUES
(15, 'Women', 'Women\'s apparel encompasses a wide array of clothing choices, including dresses, tops, bottoms, and more. BAUHINIA offers fashionable and comfortable options for women of all ages.', 1, 0, '2023-12-03 10:59:33'),
(16, 'Men', 'This category includes a diverse range of clothing items designed for men, featuring the latest trends and styles. From casual wear to formal attire, men can explore a variety of options.', 1, 0, '2023-12-03 11:08:12'),
(17, 'Accessories', 'Complementing the clothing range, the accessories category offers items like handbags, scarves, hats, and more. Customers can find the perfect add-ons to enhance their overall look.', 1, 0, '2023-12-03 11:09:36'),
(18, 'Workwear', 'Providing professional attire for the workplace, this category includes a range of formal clothing options for men and women. Customers can dress confidently for business settings', 1, 1, '2023-12-03 11:10:19'),
(19, 'Kids ', 'A specially curated collection for children, featuring trendy and age-appropriate clothing. Parents can find a variety of outfits for infants, toddlers, and young kids.', 1, 0, '2023-12-03 11:20:03');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(30) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` text NOT NULL,
  `default_delivery_address` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `firstname`, `lastname`, `gender`, `contact`, `email`, `password`, `default_delivery_address`, `status`, `delete_flag`, `date_created`) VALUES
(3, 'Ishini', 'Amarasighe', 'Female', '078451254', 'ishini@gmail.com', '25f9e794323b453885f5181f1b624d0b', '122 Kithulampitiya Galle', 1, 0, '2023-12-02 17:00:16'),
(4, 'Isuri', 'Manaharani', 'Female', '0718745676', 'isuri@gamail.com', '46f94c8de14fb36680850768ff1b7f2a', 'kalegana', 1, 0, '2023-12-03 11:41:23'),
(5, 'Ifadha', 'Imaran', 'Female', '0785678923', 'ifadha@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Galle', 1, 0, '2023-12-04 22:07:30'),
(6, 'Rusiru', 'Salwathura', 'Male', '0713826971', 'rusirusalwathura@icloud.com', '3ada6e17535c6e8e5494f0c13934a4e5', '8/1, Wiskam Rd, Galle', 1, 0, '2023-12-07 11:28:49'),
(7, 'Tharusha', 'Mendis', 'Female', '0715412541', 'tharusha@gmail.com', '25f9e794323b453885f5181f1b624d0b', '123 Hikkaduwa', 1, 0, '2023-12-07 22:46:21'),
(8, 'Amila', 'Dananjaya', 'Male', '0784512451', 'amila120@gmail.com', '25f9e794323b453885f5181f1b624d0b', 'Hinatigala Galle', 1, 0, '2023-12-08 00:43:05'),
(9, 'Ishan', 'Amarasuriya', 'Male', '0147845121', 'ishan@gmail.com', '25f9e794323b453885f5181f1b624d0b', 'Kaluthra', 1, 0, '2023-12-08 00:46:03'),
(10, 'Sachintha', 'Umayanga', 'Male', '0764452125', 'sachinthaumayanga3@gmail.com', 'ceeaa43463df660d72818c36b1ec5b61', 'Hikkaduwa', 1, 0, '2023-12-08 13:11:09'),
(11, 'Senudhi', 'Lithara', 'Female', '0718235073', 'senudhi@123', '4b47e5014a0b39039a3b4ae9caa36552', 'Galle', 1, 0, '2023-12-13 11:27:57');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(30) NOT NULL,
  `variant` text NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` double NOT NULL,
  `price` float NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `variant`, `product_id`, `quantity`, `price`, `date_created`, `date_updated`) VALUES
(17, 'S', 12, 10, 1290, '2023-12-07 10:22:13', NULL),
(18, 'M', 12, 10, 1290, '2023-12-07 10:22:53', NULL),
(19, 'L', 12, 10, 1290, '2023-12-07 10:23:24', NULL),
(20, 'S', 18, 7, 4495, '2023-12-07 10:24:38', NULL),
(21, 'M', 18, 9, 4495, '2023-12-07 10:24:58', NULL),
(22, 'L', 18, 5, 4495, '2023-12-07 10:25:40', NULL),
(23, 'S', 17, 6, 8495, '2023-12-07 10:27:44', NULL),
(24, 'M', 17, 15, 8495, '2023-12-07 10:28:10', NULL),
(25, 'L', 17, 12, 8495, '2023-12-07 10:28:33', NULL),
(26, 'S', 11, 8, 2490, '2023-12-07 10:29:28', NULL),
(27, 'M', 11, 18, 2490, '2023-12-07 10:29:54', NULL),
(28, 'L', 11, 11, 2490, '2023-12-07 10:30:20', NULL),
(29, 'S', 6, 5, 4500, '2023-12-07 10:30:54', NULL),
(30, 'M', 6, 9, 4500, '2023-12-07 10:31:14', NULL),
(31, 'L', 6, 7, 4500, '2023-12-07 10:31:30', NULL),
(32, 'S', 20, 17, 1600, '2023-12-07 10:33:35', NULL),
(33, 'M', 20, 16, 1600, '2023-12-07 10:34:26', NULL),
(34, 'L', 20, 12, 1600, '2023-12-07 10:34:50', NULL),
(35, 'Universal', 21, 25, 2950, '2023-12-07 10:40:41', NULL),
(36, 'S', 15, 14, 3450, '2023-12-07 10:41:43', NULL),
(37, 'M', 15, 19, 3450, '2023-12-07 10:42:11', NULL),
(38, 'L', 15, 12, 3450, '2023-12-07 10:42:32', NULL),
(39, 'Universal', 22, 17, 5990, '2023-12-07 10:43:30', NULL),
(40, 'Universal', 25, 13, 6990, '2023-12-07 10:45:04', NULL),
(41, 'EURO 40', 24, 16, 5250, '2023-12-07 10:48:08', NULL),
(42, 'FREE SIZE', 27, 14, 1680, '2023-12-07 10:50:12', NULL),
(43, 'Universal', 28, 22, 9995, '2023-12-07 10:51:25', NULL),
(44, 'S', 16, 4, 3750, '2023-12-07 10:52:28', NULL),
(45, 'M', 16, 8, 3750, '2023-12-07 10:52:46', NULL),
(46, 'L', 16, 5, 3750, '2023-12-07 10:53:02', NULL),
(47, 'S', 9, 9, 2690, '2023-12-07 10:53:46', NULL),
(48, 'M', 9, 15, 2690, '2023-12-07 10:54:02', NULL),
(49, 'L', 9, 10, 2690, '2023-12-07 10:56:19', NULL),
(50, 'S', 10, 14, 3250, '2023-12-07 10:56:52', NULL),
(51, 'M', 10, 16, 3250, '2023-12-07 10:57:20', NULL),
(52, 'L', 10, 11, 3250, '2023-12-07 10:57:50', NULL),
(53, 'S', 30, 20, 3790, '2023-12-07 10:59:38', NULL),
(54, 'M', 30, 26, 3790, '2023-12-07 10:59:58', NULL),
(55, 'L', 30, 17, 3790, '2023-12-07 11:00:29', NULL),
(56, 'S', 31, 12, 3690, '2023-12-07 11:02:01', NULL),
(57, 'M', 31, 15, 3690, '2023-12-07 11:02:23', NULL),
(58, 'L', 31, 20, 3690, '2023-12-07 11:02:42', NULL),
(59, 'S', 29, 15, 3690, '2023-12-07 11:03:47', NULL),
(60, 'M', 29, 12, 3690, '2023-12-07 11:04:41', NULL),
(61, 'L', 29, 10, 3690, '2023-12-07 11:05:06', NULL),
(62, 'S', 5, 10, 4500, '2023-12-07 11:05:41', NULL),
(63, 'M', 5, 15, 4500, '2023-12-07 11:06:07', NULL),
(64, 'L', 5, 12, 4500, '2023-12-07 11:06:27', NULL),
(65, 'S', 19, 12, 2990, '2023-12-07 11:07:20', NULL),
(66, 'M', 19, 15, 2990, '2023-12-07 11:07:56', NULL),
(67, 'L', 19, 10, 2990, '2023-12-07 11:08:42', NULL),
(68, 'S', 8, 15, 4380, '2023-12-07 11:09:46', NULL),
(69, 'M', 8, 15, 4380, '2023-12-07 11:10:17', NULL),
(70, 'L', 8, 12, 4380, '2023-12-07 11:10:52', NULL),
(71, 'S', 14, 16, 8995, '2023-12-07 11:12:27', NULL),
(72, 'M', 14, 17, 8995, '2023-12-07 11:12:48', NULL),
(73, 'L', 14, 12, 8995, '2023-12-07 11:13:06', NULL),
(74, 'Universal', 23, 4, 5500, '2023-12-07 11:18:12', NULL),
(75, 'S', 13, 12, 8495, '2023-12-07 11:18:53', NULL),
(76, 'M', 13, 15, 8495, '2023-12-07 11:19:12', NULL),
(77, 'L', 13, 12, 8495, '2023-12-07 11:19:37', NULL),
(78, 'S', 7, 14, 3980, '2023-12-07 11:21:01', NULL),
(79, 'M', 7, 15, 3980, '2023-12-07 11:21:20', NULL),
(80, 'L', 7, 9, 3980, '2023-12-07 11:21:37', NULL),
(81, 'FREE SIZE', 26, 4, 6900, '2023-12-07 11:22:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(30) NOT NULL,
  `ref_code` varchar(100) NOT NULL,
  `client_id` int(30) NOT NULL,
  `delivery_address` text NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `order_type` tinyint(1) NOT NULL COMMENT '1= pickup,2= deliver',
  `amount` double NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '0 = pending,\r\n1= Packed,\r\n2 = Out for Delivery,\r\n3=Delivered,\r\n4=cancelled',
  `paid` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `ref_code`, `client_id`, `delivery_address`, `payment_method`, `order_type`, `amount`, `status`, `paid`, `date_created`, `date_updated`) VALUES
(46, '20231200001', 6, '8/1, Wiskam Rd, Galle', 'cod', 0, 9000, 0, 0, '2023-12-07 22:38:57', NULL),
(47, '20231200002', 6, '8/1, Wiskam Rd, Galle', 'cod', 0, 4500, 0, 0, '2023-12-07 22:39:11', NULL),
(48, '20231200003', 7, '123 Hikkaduwa', 'cod', 0, 1600, 0, 0, '2023-12-07 22:46:46', NULL),
(49, '20231200004', 7, '123 Hikkaduwa', 'cod', 0, 3690, 0, 0, '2023-12-08 00:13:24', NULL),
(50, '20231200005', 8, 'Hinatigala Galle', 'cod', 0, 8995, 0, 0, '2023-12-08 00:44:02', NULL),
(51, '20231200006', 8, 'Hinatigala Galle', 'cod', 0, 8995, 0, 0, '2023-12-08 00:44:04', NULL),
(52, '20231200007', 8, 'Hinatigala Galle', 'cod', 0, 6500, 0, 0, '2023-12-08 00:44:49', NULL),
(53, '20231200008', 9, 'Kaluthra', 'cod', 0, 4500, 0, 0, '2023-12-08 00:46:29', NULL),
(54, '20231200009', 9, 'Kaluthra', 'cod', 0, 4500, 0, 0, '2023-12-08 00:46:32', NULL),
(55, '20231200010', 9, 'Kaluthra', 'cod', 0, 8495, 0, 0, '2023-12-08 00:46:58', NULL),
(56, '20231200011', 9, 'Kaluthra', 'cod', 0, 3980, 0, 0, '2023-12-08 00:47:23', NULL),
(57, '20231200012', 9, 'Kaluthra', 'cod', 0, 10500, 0, 0, '2023-12-08 00:47:53', NULL),
(58, '20231200013', 9, 'Kaluthra', 'cod', 0, 8995, 0, 0, '2023-12-08 00:48:15', NULL),
(59, '20231200014', 9, 'Kaluthra', 'cod', 0, 4495, 0, 0, '2023-12-08 00:48:43', NULL),
(60, '20231200015', 9, 'Kaluthra', 'cod', 0, 8495, 0, 0, '2023-12-08 00:49:05', NULL),
(61, '20231200016', 10, 'Hikkaduwa', 'cod', 0, 5640, 0, 0, '2023-12-08 13:14:44', NULL),
(62, '20231200017', 10, 'Hikkaduwa', 'cod', 0, 3450, 0, 0, '2023-12-08 13:16:08', NULL),
(63, '20231200018', 10, 'Hikkaduwa', 'cod', 0, 3450, 0, 0, '2023-12-08 13:16:18', NULL),
(64, '20231200019', 10, 'Hikkaduwa', 'cod', 0, 3450, 0, 0, '2023-12-08 13:16:19', NULL),
(65, '20231200020', 10, 'Hikkaduwa', 'cod', 0, 3450, 0, 0, '2023-12-08 13:16:20', NULL),
(66, '20231200021', 10, 'Hikkaduwa', 'cod', 0, 3450, 0, 0, '2023-12-08 13:16:21', NULL),
(67, '20231200022', 10, 'Hikkaduwa', 'cod', 0, 2990, 0, 1, '2023-12-08 13:16:48', '2023-12-13 11:29:52');

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `inventory_id` int(30) NOT NULL,
  `quantity` int(30) NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_list`
--

INSERT INTO `order_list` (`id`, `order_id`, `inventory_id`, `quantity`, `price`, `total`) VALUES
(85, 48, 20, 1, 1600, 1600),
(86, 49, 29, 1, 3690, 3690),
(92, 55, 17, 1, 8495, 8495),
(94, 57, 24, 2, 5250, 10500),
(96, 59, 18, 1, 4495, 4495),
(105, 67, 19, 1, 2990, 2990);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(30) NOT NULL,
  `brand_id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `name` varchar(250) NOT NULL,
  `specs` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `brand_id`, `category_id`, `name`, `specs`, `status`, `delete_flag`, `date_created`) VALUES
(5, 7, 16, 'Prime Performance Tee ', '&lt;p data-mce-fragment=&quot;1&quot; style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(49, 49, 49); font-family: Inter, sans-serif;&quot;&gt;&lt;span data-mce-fragment=&quot;1&quot; style=&quot;font-weight: var(--font-body-bold-weight);&quot;&gt;Made For Training. Made For Life&lt;/span&gt;&lt;/p&gt;&lt;ul data-mce-fragment=&quot;1&quot; style=&quot;margin: var(--s-line-height) 0; color: rgb(49, 49, 49); font-family: Inter, sans-serif;&quot;&gt;&lt;li data-mce-fragment=&quot;1&quot; style=&quot;margin-bottom: calc(var(--s-line-height) / 2);&quot;&gt;Carnage logo front Centered, Minimal Be Relentless logo at the back&lt;/li&gt;&lt;li data-mce-fragment=&quot;1&quot; style=&quot;margin-bottom: calc(var(--s-line-height) / 2);&quot;&gt;Tapered to enhance the look of your physique&amp;nbsp;&lt;/li&gt;&lt;li data-mce-fragment=&quot;1&quot; style=&quot;margin-bottom: calc(var(--s-line-height) / 2);&quot;&gt;Contrast Back Panel&lt;/li&gt;&lt;li data-mce-fragment=&quot;1&quot; style=&quot;margin-bottom: calc(var(--s-line-height) / 2);&quot;&gt;High-Quality Dry Fit Fabric&lt;/li&gt;&lt;li data-mce-fragment=&quot;1&quot; style=&quot;margin-bottom: calc(var(--s-line-height) / 2);&quot;&gt;Lightweight, Moist Wicking, Comfortable Fabric&lt;/li&gt;&lt;li data-mce-fragment=&quot;1&quot; style=&quot;margin-bottom: calc(var(--s-line-height) / 2);&quot;&gt;Intended for those hard-hitting Training sessions / Can be worn outdoors too as lifestyle Wear.&lt;/li&gt;&lt;/ul&gt;', 1, 0, '2023-12-04 20:18:15'),
(6, 7, 16, 'Core Oversize Tee', '&lt;p data-mce-fragment=&quot;1&quot; style=&quot;margin-top: var(--s-line-height); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(49, 49, 49); font-family: Inter, sans-serif;&quot;&gt;The Perfect Everyday Tee.&amp;nbsp;&lt;br&gt;&lt;span data-mce-fragment=&quot;1&quot;&gt;&amp;nbsp;Made with Premium Organic Cotton and Recycle Polyester Material&lt;/span&gt;&lt;br data-mce-fragment=&quot;1&quot;&gt;&lt;/p&gt;&lt;ul data-mce-fragment=&quot;1&quot; style=&quot;margin: var(--s-line-height) 0; color: rgb(49, 49, 49); font-family: Inter, sans-serif;&quot;&gt;&lt;li data-mce-fragment=&quot;1&quot; style=&quot;margin-bottom: calc(var(--s-line-height) / 2);&quot;&gt;Carnage&amp;nbsp;Cracked Logo&lt;/li&gt;&lt;li data-mce-fragment=&quot;1&quot; style=&quot;margin-bottom: calc(var(--s-line-height) / 2);&quot;&gt;Organic Cotton&lt;/li&gt;&lt;li data-mce-fragment=&quot;1&quot; style=&quot;margin-bottom: calc(var(--s-line-height) / 2);&quot;&gt;For training or Lifestyle wear&lt;/li&gt;&lt;li data-mce-fragment=&quot;1&quot; style=&quot;margin-bottom: calc(var(--s-line-height) / 2);&quot;&gt;Intended to Be Oversized.&lt;/li&gt;&lt;li data-mce-fragment=&quot;1&quot; style=&quot;margin-bottom: calc(var(--s-line-height) / 2);&quot;&gt;Manufactured by Sri Lanka\\\\\\\\\\\\\\\'s number 1 Apparel innovation hu&lt;/li&gt;&lt;/ul&gt;', 1, 0, '2023-12-04 20:22:28'),
(7, 8, 16, 'Titus Tee', '&lt;p style=&quot;margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-size: 15px; line-height: calc(var(--font-body-line-height-scale) * 1.6); text-rendering: optimizelegibility; word-spacing: 0.001em; font-feature-settings: &amp;quot;kern&amp;quot;; font-kerning: normal; color: rgb(21, 21, 21); font-family: Prompt, sans-serif;&quot;&gt;A 3D Embroidery Logo Gives This Extremely Oversized Tee A Very Unique Feature.&lt;br&gt;Crew Neck&lt;br&gt;Extremely Oversized Fit&lt;br&gt;Made In 230 GSM Cotton Fabric&lt;br&gt;Style with the Titus jogger for a cool aesthetic look&lt;/p&gt;', 1, 0, '2023-12-04 20:32:30'),
(8, 8, 16, 'Rhodes Tee', '&lt;p&gt;&lt;span style=&quot;color: rgb(21, 21, 21); font-family: Prompt, sans-serif; font-size: 15px;&quot;&gt;Basic chic and casual piece to wear on repeat, alone or layered&lt;/span&gt;&lt;br style=&quot;color: rgb(21, 21, 21); font-family: Prompt, sans-serif; font-size: 15px;&quot;&gt;&lt;span style=&quot;color: rgb(21, 21, 21); font-family: Prompt, sans-serif; font-size: 15px;&quot;&gt;Soft and ultra-comfortable fabric&lt;/span&gt;&lt;br style=&quot;color: rgb(21, 21, 21); font-family: Prompt, sans-serif; font-size: 15px;&quot;&gt;&lt;span style=&quot;color: rgb(21, 21, 21); font-family: Prompt, sans-serif; font-size: 15px;&quot;&gt;An exceptionally comfortable, minimalist sweater tee that\\\\\\\\\\\\\\\'s perfect for layering under jackets&lt;/span&gt;&lt;br style=&quot;color: rgb(21, 21, 21); font-family: Prompt, sans-serif; font-size: 15px;&quot;&gt;&lt;span style=&quot;color: rgb(21, 21, 21); font-family: Prompt, sans-serif; font-size: 15px;&quot;&gt;Mock neck&lt;/span&gt;&lt;br style=&quot;color: rgb(21, 21, 21); font-family: Prompt, sans-serif; font-size: 15px;&quot;&gt;&lt;span style=&quot;color: rgb(21, 21, 21); font-family: Prompt, sans-serif; font-size: 15px;&quot;&gt;Fine knit in a blend of organic cotton.&lt;/span&gt;&lt;br style=&quot;color: rgb(21, 21, 21); font-family: Prompt, sans-serif; font-size: 15px;&quot;&gt;&lt;span style=&quot;color: rgb(21, 21, 21); font-family: Prompt, sans-serif; font-size: 15px;&quot;&gt;Embroidered logo on front&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, 0, '2023-12-04 20:35:15'),
(9, 9, 16, 'Oversized Tee', 'IN THIS OVERSIZED TEE, YOU\\\\\\\\\\\\\\\'LL BE ALL ABOUT COMFORT ALL DAY. THE LARGE STYLE MAKES IT VERY COMFORTABLE TO WEAR, WHETHER YOU\\\\\\\\\\\\\\\'RE OUT DOING ERRANDS OR SPENDING THE WEEKEND AWAY FROM IT ALL. A RIBBED CREWNECK AND SOFT COTTON PROVIDE BASIC DETAILS THAT CUE UP COMFORT. GET YOURS AT PEPPER ST. NOW!!', 1, 0, '2023-12-04 20:43:00'),
(10, 9, 16, 'Performance Polo', '&lt;p&gt;THIS POLO PROVIDES OUTSTANDING BREATHABILITY AND ENHANCED 4-WAY STRETCH FOR ULTIMATE COMFORT IN ANY ACTIVITY&lt;br&gt;&lt;/p&gt;', 1, 0, '2023-12-04 21:08:58'),
(11, 10, 16, 'Comfort Fit Polo T-Shirt', '&lt;p&gt;About the fabric&lt;/p&gt;&lt;p&gt;Fabric composition: 100% Cotton&lt;/p&gt;&lt;p&gt;Fabric pattern: Solid&lt;/p&gt;', 1, 0, '2023-12-04 21:14:03'),
(12, 10, 16, 'Athleisure Crew Neck T-Shirt', '&lt;p&gt;About the fabric&lt;/p&gt;&lt;p&gt;Fabric composition: 100% Polyester&lt;/p&gt;&lt;p&gt;Fabric pattern: Solid&lt;/p&gt;', 1, 0, '2023-12-04 21:19:16'),
(13, 11, 16, 'SUPIMA POLO-DOVE-SLIM FIT', '&lt;p&gt;DOVE Casual Polo&lt;/p&gt;&lt;p&gt;Fit: Slim Fit, model (height 6\\\\\\\\\\\\\\\') wearing size 16\\\\\\\\\\\\\\\'\\\\\\\\\\\\\\\' Composition and Care:55% Supima Cott 40% Polyester 5% Spandex&lt;/p&gt;&lt;p&gt;machine-washable and wash dark colors separately&lt;/p&gt;', 1, 0, '2023-12-04 21:26:03'),
(14, 11, 16, 'SLIM FIT LONG SLEEVES-FORMAL SHIRTS', '&lt;p&gt;Steel GreyFormal Shirts&lt;/p&gt;&lt;p&gt;Fit: Slim Fit, model (height 6\\\\\\\\\\\\\\\') wearing size 16\\\\\\\\\\\\\\\'\\\\\\\\\\\\\\\' Composition and Care:100% COTT&lt;/p&gt;&lt;p&gt;machine-washable and wash dark colours separately&lt;/p&gt;', 1, 0, '2023-12-04 21:30:55'),
(15, 7, 15, 'ESSENTIAL ITALIC SWEAT SHIRT', '&lt;p&gt;Carnage Essential&amp;nbsp; Italic Sweat Shirt&lt;/p&gt;&lt;p&gt;Introducing our All new Essential Tee made out of signature Terry Fabric for that Well perfected Fit.&amp;nbsp; Mid weight fabric&lt;/p&gt;&lt;p&gt;Regular Fit&lt;/p&gt;&lt;p&gt;Signature Cotton Spandex Fabric for that perfect smoothness and Stretch&lt;/p&gt;&lt;p&gt;Can be worn as Lifestyle or training wear&lt;/p&gt;&lt;p&gt;Minimal Branding with Carnage italic embroidery logo&lt;/p&gt;', 1, 0, '2023-12-05 10:30:48'),
(16, 7, 15, 'J.N.T.D RELAXED TEE', '&lt;p&gt;J.N.T.D | CARNAGE CLUB | ESTD 2022&lt;/p&gt;&lt;p&gt;&quot;The JNTD collection is a reminder to embrace the journey, to remember that its the journey that leads to Rewarding Destinations. May it be your fitness journey, Career or Family, it\\\\\\\'ll always be the journey , not the Destination&quot;&lt;/p&gt;&lt;p&gt;Relaxed Fit -&amp;nbsp; ( Right in the middle of Oversized Fit and Fitted Tee)&lt;/p&gt;&lt;p&gt;Made from our Signature Interlock fabric&lt;/p&gt;&lt;p&gt;(same fabric used for our popular Desire Oversize Tees)&lt;/p&gt;&lt;p&gt;Can be Styled as Active and Lifestyle wear both&lt;/p&gt;&lt;p&gt;220 GSM Fabric&lt;/p&gt;&lt;p&gt;Front Carnage Italic logo | Back JNTD wording&lt;/p&gt;', 1, 0, '2023-12-05 10:39:12'),
(17, 11, 15, 'CASUAL POLO-BRIGHT WHITE-SLIM FIT', '&lt;p&gt;Bright White Casual Polo&lt;/p&gt;&lt;p&gt;Fit: Slim Fit, model (height 5.6\\\\\\\\\\\\\\\') wearing size small Composition and Care:71% COTTON 25% POLYESTER 4% LYCRA&lt;/p&gt;&lt;p&gt;machine-washable and wash dark colors separately&lt;/p&gt;', 1, 0, '2023-12-05 10:55:17'),
(18, 11, 15, 'CASUAL CREWNECK-LAVENDER-SLIM FIT', '&lt;p&gt;Cream Casual Crewneck&lt;/p&gt;&lt;p&gt;Fit: Slim Fit, model (height 6\\\\\\\\\\\\\\\') wearing size 16\\\\\\\\\\\\\\\'\\\\\\\\\\\\\\\' Composition and Care:76% MODAL 19% POLYESTER 4% LYCRA&lt;/p&gt;&lt;p&gt;machine-washable and wash dark colors separately&lt;/p&gt;', 1, 0, '2023-12-05 11:01:24'),
(19, 9, 15, 'PROJECT PEPPER TEE', '&lt;p&gt;FIGHT IN STYLE WITH THE PROJECT PEPPER OVERSIZED T-SHIRT. THE GRAPHIC PATTERN ON THE CHEST IS KEPT BASIC, AND IT\\\\\\\\\\\\\\\'S FINISHED WITH AN EXTRA WIDE CREW NECKLINE AND DROPPED SHOULDERS FOR INCREASED COMFORT. WHAT\\\\\\\\\\\\\\\'S NOT TO LOVE ABOUT A PRODUCT THAT COMBINES QUALITY AND STYLE&lt;br&gt;&lt;/p&gt;', 1, 0, '2023-12-05 11:07:33'),
(20, 9, 15, 'ESSENTIAL CROP - COTTON', '&lt;p&gt;CLEAN AND COMFORTABLE. FOR DAYS WHEN YOU NEED TO LOOK EFFORTLESSLY GROOMED. A SLIM-FITTING CROP THAT LOOKS GREAT WITH YOUR FAVORITE TROUSER OR STRAIGHT DENIM. DRESS IT UP WITH JEWELRY AND A STILETTO HEEL OR DOWN WITH A CHUNKY SNEAKER AND A DAD HAT.&lt;br&gt;&lt;/p&gt;', 1, 0, '2023-12-05 12:37:47'),
(21, 7, 17, 'ESSENTIAL HAT', '&lt;p&gt;EVERY DAY HAT&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;6 Panel&amp;nbsp;&lt;/p&gt;&lt;p&gt;Adjustable Buckle at the back&lt;/p&gt;&lt;p&gt;Sturdy and solidly built&amp;nbsp;&lt;/p&gt;', 1, 0, '2023-12-05 15:02:00'),
(22, 7, 17, 'EVERYDAY CROSS BODY BAG', '&lt;p&gt;EVERYDAY CROSS BODY BAG&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Yes we did it! We made that perfect everyday bag to carry around all your essentials.&lt;/p&gt;&lt;p&gt;We made sure to use the finest materials and accessories to make sure these bags are one worthy investment.&lt;/p&gt;&lt;p&gt;So no more forgetting your essentials, The most compact Stylish bags are here from us.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Premium nylon + 210D polyester lining Material&lt;/p&gt;&lt;p&gt;logo webbed in as black on black minimal branding&lt;/p&gt;&lt;p&gt;Durable locking system&lt;/p&gt;&lt;p&gt;Highest Quality Metal + nylon Zippers&lt;/p&gt;&lt;p&gt;Comfortable and adjustable Strap&lt;/p&gt;&lt;p&gt;Multiple ways to Style&lt;/p&gt;&lt;p&gt;5 compartments to put literally all your essentials in one go&lt;/p&gt;', 1, 0, '2023-12-05 15:08:47'),
(23, 7, 17, 'STATEMENT NECKLACE - BLAZING BLACK', '&lt;p&gt;COLLECTION 001&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;STATMENT NECKLACE -&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;A representation of our mission and Dedication to Be Better, Everyday.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Stainless steel chain&lt;/p&gt;&lt;p&gt;Black Plating&lt;/p&gt;&lt;p&gt;Stainless Steel Clasp&lt;/p&gt;&lt;p&gt;Slogan engraved&lt;/p&gt;', 1, 0, '2023-12-05 15:13:57'),
(24, 7, 17, 'FEATHERLIGHT SLIDES - JET BLACK', '&lt;p&gt;CARNAGE&amp;nbsp; FEATHER-LIGHT SLIDES&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Extremely light weight&lt;/p&gt;&lt;p&gt;Durable&lt;/p&gt;&lt;p&gt;Added Internal Padding for Comfort&lt;/p&gt;&lt;p&gt;Black on Black Branding&lt;/p&gt;&lt;p&gt;Soft sole for comfort&lt;/p&gt;', 1, 0, '2023-12-05 15:15:29'),
(25, 8, 17, 'F.O.A UTILITY BAG', '&lt;p&gt;&lt;span style=&quot;color: rgb(21, 21, 21); font-family: Prompt, sans-serif; font-size: 15px; word-spacing: 0.015px;&quot;&gt;Are you tired of constantly juggling your everyday essentials in your pockets or a bulky bag? Look no further! The F.O.A Utility Bag is designed with your convenience in mind.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, 0, '2023-12-05 15:21:45'),
(26, 8, 17, 'X TECH DUFFLE BAG', '&lt;p&gt;Introducing the X Tech Duffle Bag, the ultimate companion for your active lifestyle and everyday adventures. This stylish and functional duffle bag is meticulously crafted with convenience in mind, offering a perfect blend of versatility and practicality.&lt;br&gt;&lt;/p&gt;', 1, 0, '2023-12-05 15:25:09'),
(27, 8, 17, 'FOA LINER SOCK - 3 PACK', '&lt;p&gt;LINER SOCKS, 3 PAIRS IN A PACK&lt;/p&gt;&lt;p&gt;EASY WEAR; EASY PERFORMANCE.&lt;/p&gt;&lt;p&gt;F.O.A Liner Socks support your feet through every step and jump they take, while still providing a snug and comfortable fit that lasts.&lt;/p&gt;&lt;p&gt;Whatever your style , these are essential edition to your kit .&lt;/p&gt;&lt;p&gt;- Ankle height&lt;/p&gt;&lt;p&gt;- Rib from mid-foot to calf&lt;/p&gt;&lt;p&gt;- stretch material to foot&lt;/p&gt;&lt;p&gt;- F.O.A logo to top of foot&lt;/p&gt;&lt;p&gt;- 65Cotton, Nylon 17% Elastane 5%&lt;/p&gt;&lt;p&gt;One size fits all&lt;/p&gt;', 1, 0, '2023-12-05 15:27:25'),
(28, 11, 17, 'FORMAL BELT - BLACK', '&lt;p&gt;Crocodile leather accessories are made of premium genuine leather&lt;/p&gt;&lt;p&gt;which completes your peculiar requirement and the perfect accent at the same time&lt;/p&gt;', 1, 0, '2023-12-05 15:32:28'),
(29, 12, 19, 'Pinkabuds Printed Short', '', 1, 0, '2023-12-05 15:40:39'),
(30, 12, 19, 'Pinkabelle Black Shorts', '', 1, 0, '2023-12-05 15:42:23'),
(31, 12, 19, 'Pinkabuds Brown Shorts', '', 1, 0, '2023-12-05 15:43:40');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `total_amount` double NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `order_id`, `total_amount`, `date_created`) VALUES
(9, 48, 1600, '2023-12-07 22:46:46'),
(10, 49, 3690, '2023-12-08 00:13:24'),
(11, 55, 8495, '2023-12-08 00:46:58'),
(12, 57, 10500, '2023-12-08 00:47:53'),
(13, 59, 4495, '2023-12-08 00:48:43'),
(14, 67, 2990, '2023-12-08 13:16:48');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'System - BAUHINIA  '),
(6, 'short_name', 'BAUHINIA '),
(11, 'logo', 'uploads/logo-1702176147.png?v=1702176147'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/cover-1701939454.png?v=1701939464');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'D. L. I. ', 'Amarasinghe ', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/avatars/1.jpg?v=1702001088', NULL, 1, '2021-01-20 14:02:37', '2023-12-08 07:34:48');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inventory_id` (`inventory_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inventory_id` (`inventory_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand_id` (`brand_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
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
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_list`
--
ALTER TABLE `order_list`
  ADD CONSTRAINT `order_list_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_list_ibfk_2` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
