-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 30, 2026 at 06:44 AM
-- Server version: 8.2.0
-- PHP Version: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
CREATE TABLE IF NOT EXISTS `carts` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `carts_user_id_foreign` (`user_id`),
  KEY `carts_product_id_foreign` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `category_image`, `created_at`, `updated_at`) VALUES
(1, 'Electronics', 'images/carousel/electronics.jpg', '2025-11-19 23:34:55', '2025-11-19 23:34:55'),
(2, 'Clothing', 'images/carousel/fashion.jpg', '2025-11-19 23:34:55', '2025-11-19 23:34:55'),
(3, 'Home & Kitchen', 'images/carousel/home_kitchen.jpg', '2025-11-19 23:34:55', '2025-11-19 23:34:55'),
(4, 'Books', 'images/carousel/books.jpg', '2025-11-19 23:34:55', '2025-11-19 23:34:55'),
(5, 'Beauty', 'images/carousel/beauty.jpg', '2025-11-19 23:34:55', '2025-11-19 23:34:55'),
(6, 'Sports', 'images/carousel/toys.jpg', '2025-11-19 23:34:55', '2025-11-19 23:34:55');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2025_10_30_092245_add_phone_to_users_table', 1),
(6, '2025_10_31_071118_create_categories_table', 1),
(7, '2025_10_31_093237_create_products_table', 1),
(8, '2025_10_31_093238_create_product_images_table', 1),
(9, '2025_11_04_104257_add_additional_fields_to_categories_table', 1),
(10, '2025_11_04_110634_drop_additional_fields_from_categories_table', 1),
(11, '2025_11_06_110536_create_carts_table', 1),
(12, '2025_11_10_044649_add_quantity_to_carts_table', 1),
(13, '2025_11_11_053221_create_orders_table', 1),
(14, '2025_11_11_071248_add_total_and_payment_method_to_orders_table', 1),
(15, '2025_11_11_071318_create_order_items_table', 1),
(16, '2025_11_11_102829_make_product_id_nullable_in_orders_table', 1),
(17, '2025_11_14_065539_drop_product_id_from_orders_table', 1),
(18, '2025_11_14_093903_add_transaction_id_to_orders_table', 1),
(19, '2025_11_20_042918_add_is_active_to_products_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rec_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `total` decimal(10,2) NOT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'in-progress',
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `name`, `phone`, `rec_address`, `total`, `payment_method`, `transaction_id`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Soha Mansab', '03208306536', 'B-122 gulshan Karachi', 40.00, 'stripe', NULL, 'paid', 1, '2024-01-19 23:36:08', '2025-11-19 23:36:08'),
(2, 'Soha Mansab', '03208306536', 'B-122 gulshan Karachi', 2882.00, 'stripe', NULL, 'paid', 1, '2023-11-20 04:06:07', '2025-11-20 04:06:07'),
(3, 'Soha Mansab', '03208306536', 'B-122 gulshan Karachi', 9405.00, 'cash_on_delivery', NULL, 'pending', 1, '2025-07-20 04:08:06', '2025-11-20 04:08:06'),
(4, 'Soha Mansab', '03208306536', 'B-122 gulshan Karachi', 8213.00, 'cash_on_delivery', NULL, 'pending', 1, '2021-11-20 04:13:30', '2025-11-20 04:13:30'),
(5, 'Soha Mansab', '03208306536', 'B-122 gulshan Karachi', 3680.00, 'cash_on_delivery', NULL, 'pending', 1, '2025-11-20 04:15:53', '2025-11-20 04:15:53'),
(6, 'Soha Mansab', '03208306536', 'B-122 gulshan Karachi', 44.00, 'cash_on_delivery', NULL, 'pending', 1, '2025-11-20 04:36:41', '2025-11-20 04:36:41');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
CREATE TABLE IF NOT EXISTS `order_items` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  KEY `order_items_product_id_foreign` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2, 20.00, '2025-11-19 23:36:08', '2025-11-19 23:36:08'),
(2, 2, 2, 6, 400.00, '2025-11-20 04:06:07', '2025-11-20 04:06:07'),
(3, 2, 8, 4, 49.00, '2025-11-20 04:06:07', '2025-11-20 04:06:07'),
(4, 2, 17, 13, 22.00, '2025-11-20 04:06:07', '2025-11-20 04:06:07'),
(5, 3, 15, 10, 99.00, '2025-11-20 04:08:06', '2025-11-20 04:08:06'),
(6, 3, 12, 21, 35.00, '2025-11-20 04:08:06', '2025-11-20 04:08:06'),
(7, 3, 10, 2, 460.00, '2025-11-20 04:08:06', '2025-11-20 04:08:06'),
(8, 3, 17, 9, 22.00, '2025-11-20 04:08:06', '2025-11-20 04:08:06'),
(9, 3, 2, 4, 400.00, '2025-11-20 04:08:06', '2025-11-20 04:08:06'),
(10, 3, 18, 15, 56.00, '2025-11-20 04:08:06', '2025-11-20 04:08:06'),
(11, 3, 3, 17, 36.00, '2025-11-20 04:08:06', '2025-11-20 04:08:06'),
(12, 3, 25, 27, 130.00, '2025-11-20 04:08:06', '2025-11-20 04:08:06'),
(13, 4, 10, 17, 460.00, '2025-11-20 04:13:30', '2025-11-20 04:13:30'),
(14, 4, 6, 7, 19.00, '2025-11-20 04:13:30', '2025-11-20 04:13:30'),
(15, 4, 17, 5, 22.00, '2025-11-20 04:13:30', '2025-11-20 04:13:30'),
(16, 4, 9, 5, 30.00, '2025-11-20 04:13:30', '2025-11-20 04:13:30'),
(17, 5, 10, 8, 460.00, '2025-11-20 04:15:53', '2025-11-20 04:15:53'),
(18, 6, 20, 2, 22.00, '2025-11-20 04:36:41', '2025-11-20 04:36:41');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(10,2) NOT NULL,
  `demand` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Available','Unavailable') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Available',
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `products_category_id_foreign` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `demand`, `status`, `category_id`, `created_at`, `updated_at`, `is_active`) VALUES
(1, 'T-shirt', 'shirts', 20.00, 'Hot Selling', 'Available', 2, '2025-11-19 23:35:27', '2025-11-19 23:44:50', 1),
(2, 'Watch', 'Latest Watch', 400.00, 'Hot Selling', 'Available', 1, '2025-11-19 23:48:13', '2025-11-19 23:48:13', 1),
(3, 'Calvin Klein', 'Zoe Top Zip Chain Crossbody', 36.00, 'Hot Selling', 'Available', 5, '2025-11-20 00:18:04', '2025-11-20 00:18:04', 1),
(4, 'Crossbody Bag', 'Vegan Leather Purse Anti Theft Multi Pockets with Wide Adjustable Strap Shoulder Handbag RFID Trendy', 29.00, 'Hot Selling', 'Available', 5, '2025-11-20 00:25:54', '2025-11-20 00:25:54', 1),
(5, 'Glycolic Acid', 'The Ordinary 7% Exfoliating Toner, Brightening and Smoothing Daily Toner for More Even-Looking Skin Tone', 17.88, 'Hot Selling', 'Available', 5, '2025-11-20 00:27:27', '2025-11-20 00:27:27', 1),
(6, 'Hydrogel Mask', 'BIODANCE Bio-Collagen Real Deep Mask', 19.00, 'Hot Selling', 'Available', 5, '2025-11-20 00:30:37', '2025-11-20 00:30:37', 1),
(7, 'Vaseline', 'Glazed and Glisten Golden Hour Body Gel Oil Glow Vanilla Cocoa Shimmering', 8.57, 'Standard', 'Available', 5, '2025-11-20 00:37:00', '2025-11-20 00:59:35', 1),
(8, 'Mini Projector', 'Mini Projector for iPhone', 49.00, 'Hot Selling', 'Available', 1, '2025-11-20 00:41:33', '2025-11-20 00:41:33', 1),
(9, 'Wireless Charging', 'Wireless Charging Station: 15W Magnetic Fast Charger Stand for iPhone 17-12 Pro Max & Apple Watch Ultra Series & AirPods with Mushroom Light - Ideal for Nightstand & Bedside & Travel', 30.00, 'Standard', 'Available', 1, '2025-11-20 00:45:48', '2025-11-20 00:45:48', 1),
(10, 'Samsung 75-Inch Class QLED', 'Samsung 75-Inch Class QLED Q7F Series Samsung Vision AI Smart TV (2025 Model, 75Q7F) Quantum HDR, Object Tracking Sound Lite, Q4 AI Gen1 Processor, 4K upscaling, Gaming Hub', 460.00, 'Hot Selling', 'Available', 1, '2025-11-20 00:52:47', '2025-11-20 00:52:47', 1),
(11, 'Fleece Jacket', 'Baby Girls Boys\' Winter Fleece Jackets With Hooded Toddler Cotton Dress Warm Lined Coat Outer Clothing', 22.00, 'Standard', 'Available', 2, '2025-11-20 00:55:50', '2025-11-20 00:55:50', 1),
(12, 'Baby  Fleece', 'Baby Steens Mt Ii Fleece', 35.00, 'Standard', 'Available', 2, '2025-11-20 00:57:13', '2025-11-20 00:57:48', 1),
(13, 'Winter Jacket', 'The Children\'s Place Baby Boys\' and Toddler Heavy 3 in 1 Winter Jacket, Wind Water-Resistant Shell, Fleece Inner', 25.00, 'Standard', 'Available', 2, '2025-11-20 00:58:54', '2025-11-20 00:58:54', 1),
(14, 'Side Table', 'VASAGLE LILEA Collection - Side Table with Charging Station', 44.00, 'Standard', 'Available', 3, '2025-11-20 01:04:20', '2025-11-20 01:04:20', 1),
(15, 'Plant Stand Indoor', 'Plant Stand Indoor with Grow Lights - 62\"', 99.00, 'Standard', 'Available', 3, '2025-11-20 01:07:12', '2025-11-20 02:32:10', 1),
(16, 'Wall Mirror', 'FICTOR Irregular Asymmetrical Wall Mirror, 36\" x 24\" Modern Decorative Mirror for Entryway, Bathroom, Bedroom, Living Room, Dining Room', 75.00, 'Standard', 'Available', 3, '2025-11-20 01:11:06', '2025-11-20 01:11:06', 1),
(17, 'Laundry Hamper', 'YOUDENOVA Woven Rope Laundry Hamper, 58L Tall Luandry Basket, Baby Nursery Hamper for Blanket Storage in Bedroom-Large-Pink', 22.00, 'Hot Selling', 'Available', 3, '2025-11-20 01:12:29', '2025-11-20 01:12:29', 1),
(18, 'Gemini and Mercury', 'Gemini and Mercury Remastered', 56.00, 'Standard', 'Available', 4, '2025-11-20 01:18:21', '2025-11-20 01:18:21', 1),
(19, 'Apollo Remastered', 'Apollo Remastered: The Ultimate Photographic Record Hardcover – October 25, 2022', 58.00, 'Standard', 'Available', 4, '2025-11-20 01:19:00', '2025-11-20 01:19:00', 1),
(20, 'Nasa', 'October 25, 2022', 22.00, 'Standard', 'Available', 4, '2025-11-20 01:21:39', '2025-11-20 01:21:39', 1),
(21, 'Archives of NASA', 'The Planets: Photographs from the Archives of NASA Hardcover – November 7, 2017', 33.00, 'Standard', 'Available', 4, '2025-11-20 01:22:54', '2025-11-20 01:22:54', 1),
(22, 'Soccer Ball', 'Leather Soccer Ball with Pump - Professional Youth Training Ball', 22.00, 'Standard', 'Available', 6, '2025-11-20 01:29:51', '2025-11-20 01:29:51', 1),
(23, 'Punching Bag', 'Punching Bag for Ages 3 4 5 6 7 8+ Years Old Kids, Boxing Bag Set Toy with Boxing Gloves, Height Adjustable Punching Bag, Sport Toy for Boys & Girls, Ideal Christmas Birthday Gift for Kids', 30.00, 'Standard', 'Available', 6, '2025-11-20 01:32:16', '2025-11-20 01:32:16', 1),
(24, 'Arcade Basketball', 'JOYIN Arcade Basketball Game Set with 4 Balls and Hoop for Kids 3 to 12 Years Old Indoor Outdoor Sport Play - Easy Set Up - Air Pump Included - Ideal for Competition', 42.00, 'Standard', 'Available', 6, '2025-11-20 01:33:24', '2025-11-20 01:33:24', 1),
(25, 'Bike Helmet', 'Bike Helmet 3 Sizes for Teenager Kids Youth Adults,Bavilk Skateboard Helmet Adjustable Multi-Sport Bicycle Cycling Scooter Roller Skate Inline Skating Rollerblading for Girls Boys Women Men Teen', 130.00, 'Standard', 'Available', 6, '2025-11-20 01:34:42', '2025-11-20 02:35:18', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
CREATE TABLE IF NOT EXISTS `product_images` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` bigint UNSIGNED NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_images_product_id_foreign` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `url`, `alt`, `created_at`, `updated_at`) VALUES
(12, 1, '1763615428_b6.jpg', 'T-shirt', '2025-11-20 00:10:28', '2025-11-20 00:10:28'),
(2, 2, '1763614093_Apple watch.jpg', 'Watch', '2025-11-19 23:48:13', '2025-11-19 23:48:13'),
(3, 2, '1763614093_apple watch-.jpg', 'Watch', '2025-11-19 23:48:13', '2025-11-19 23:48:13'),
(4, 2, '1763614093_applew - Copy.jpg', 'Watch', '2025-11-19 23:48:13', '2025-11-19 23:48:13'),
(5, 2, '1763614093_Apple-Watch.jpg', 'Watch', '2025-11-19 23:48:13', '2025-11-19 23:48:13'),
(7, 1, '1763615185_b2.jpg', 'T-shirt', '2025-11-20 00:06:25', '2025-11-20 00:06:25'),
(8, 1, '1763615185_b3.jpg', 'T-shirt', '2025-11-20 00:06:25', '2025-11-20 00:06:25'),
(9, 1, '1763615185_b5.jpg', 'T-shirt', '2025-11-20 00:06:25', '2025-11-20 00:06:25'),
(13, 3, '1763615884_1.jpg', 'Calvin Klein', '2025-11-20 00:18:04', '2025-11-20 00:18:04'),
(14, 3, '1763615884_2.jpg', 'Calvin Klein', '2025-11-20 00:18:04', '2025-11-20 00:18:04'),
(18, 4, '1763616354_7.jpg', 'Crossbody Bag', '2025-11-20 00:25:54', '2025-11-20 00:25:54'),
(17, 4, '1763616354_6.jpg', 'Crossbody Bag', '2025-11-20 00:25:54', '2025-11-20 00:25:54'),
(19, 5, '1763616447_8.jpg', 'Glycolic Acid', '2025-11-20 00:27:27', '2025-11-20 00:27:27'),
(20, 5, '1763616447_9.jpg', 'Glycolic Acid', '2025-11-20 00:27:27', '2025-11-20 00:27:27'),
(21, 6, '1763616637_10.jpg', 'Hydrogel Mask', '2025-11-20 00:30:37', '2025-11-20 00:30:37'),
(22, 6, '1763616637_11.jpg', 'Hydrogel Mask', '2025-11-20 00:30:37', '2025-11-20 00:30:37'),
(23, 7, '1763617020_12.jpg', 'Vaseline', '2025-11-20 00:37:00', '2025-11-20 00:37:00'),
(24, 7, '1763617020_13.jpg', 'Vaseline', '2025-11-20 00:37:00', '2025-11-20 00:37:00'),
(25, 7, '1763617020_14.jpg', 'Vaseline', '2025-11-20 00:37:00', '2025-11-20 00:37:00'),
(26, 8, '1763617293_15.jpg', 'Mini Projector', '2025-11-20 00:41:33', '2025-11-20 00:41:33'),
(27, 8, '1763617293_16.jpg', 'Mini Projector', '2025-11-20 00:41:34', '2025-11-20 00:41:34'),
(28, 8, '1763617294_17.jpg', 'Mini Projector', '2025-11-20 00:41:34', '2025-11-20 00:41:34'),
(29, 9, '1763617548_18.jpg', 'Wireless Charging', '2025-11-20 00:45:48', '2025-11-20 00:45:48'),
(30, 10, '1763617967_19.jpg', 'Samsung 75-Inch Class QLED', '2025-11-20 00:52:47', '2025-11-20 00:52:47'),
(31, 10, '1763617967_21.jpg', 'Samsung 75-Inch Class QLED', '2025-11-20 00:52:47', '2025-11-20 00:52:47'),
(32, 11, '1763618150_22.jpg', 'Fleece Jacket', '2025-11-20 00:55:50', '2025-11-20 00:55:50'),
(35, 13, '1763618334_25.jpg', 'Winter Jacket', '2025-11-20 00:58:54', '2025-11-20 00:58:54'),
(34, 12, '1763618233_23.jpg', 'Baby  Fleece', '2025-11-20 00:57:13', '2025-11-20 00:57:13'),
(36, 14, '1763618660_26.jpg', 'Side Table', '2025-11-20 01:04:20', '2025-11-20 01:04:20'),
(37, 15, '1763618832_27.jpg', 'Plant Stand Indoor', '2025-11-20 01:07:12', '2025-11-20 01:07:12'),
(38, 16, '1763619066_29.jpg', 'Wall Mirror', '2025-11-20 01:11:06', '2025-11-20 01:11:06'),
(39, 17, '1763619149_rob.jpg', 'Laundry Hamper', '2025-11-20 01:12:29', '2025-11-20 01:12:29'),
(40, 18, '1763619501_11c.jpg', 'Gemini and Mercury', '2025-11-20 01:18:21', '2025-11-20 01:18:21'),
(41, 19, '1763619540_11b.jpg', 'Apollo Remastered', '2025-11-20 01:19:00', '2025-11-20 01:19:00'),
(42, 20, '1763619699_book5.jpg', 'Nasa', '2025-11-20 01:21:39', '2025-11-20 01:21:39'),
(43, 21, '1763619774_book7.jpg', 'Archives of NASA', '2025-11-20 01:22:54', '2025-11-20 01:22:54'),
(44, 21, '1763619774_book9.jpg', 'Archives of NASA', '2025-11-20 01:22:54', '2025-11-20 01:22:54'),
(45, 21, '1763619774_book10.jpg', 'Archives of NASA', '2025-11-20 01:22:54', '2025-11-20 01:22:54'),
(46, 22, '1763620191_ball1.jpg', 'Soccer Ball', '2025-11-20 01:29:51', '2025-11-20 01:29:51'),
(47, 23, '1763620336_s1.jpg', 'Punching Bag', '2025-11-20 01:32:16', '2025-11-20 01:32:16'),
(48, 24, '1763620404_aec.jpg', 'Arcade Basketball', '2025-11-20 01:33:24', '2025-11-20 01:33:24'),
(49, 25, '1763620482_bike.jpg', 'Bike Helmet', '2025-11-20 01:34:42', '2025-11-20 01:34:42');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `email_verified_at`, `password`, `remember_token`, `is_admin`, `created_at`, `updated_at`) VALUES
(1, 'Soha Mansab', 'sohamansab@gmail.com', '03208306536', NULL, '$2y$12$xJXy1owGUBQPI9nM6A2M9OsZh4xuyw5WY3yH6UvCd1Gw.t02o9Ay6', NULL, 1, '2025-11-19 23:31:01', '2025-11-19 23:31:01'),
(2, 'Asma aslam', 'aslamasma@gmail.com', '03208306531', NULL, '$2y$12$y79MEbnevcXyw06GByByCeMuQE2BM0OHPWlOS2/sWuOlKochSGdvW', NULL, 0, '2025-11-19 23:37:00', '2025-11-20 02:25:27'),
(3, 'Maida Saeed', 'maidasaeed311@gmail.com', '03208306533', NULL, '$2y$12$6V.eEDKpAeXWmuDtgmFzbeeKGLzdSJnosZ5n171JaWMXvZ780oziy', NULL, 0, '2025-11-19 23:46:47', '2025-11-20 02:23:00');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
