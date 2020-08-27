-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 21, 2020 at 04:47 AM
-- Server version: 5.7.24
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bongobitan`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `user_name`, `password`, `identity`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'admin', 'admin', '$2y$10$1cnuYfO0QvfAPx4PWvgofOuQv4Kpmcvoz4RmY/khFHIFLHLh9uD/i', '$2y$10$GgZA9SYE.t8KIAnTVmOFAeoZjYXueYHa3oxN98TDsrf69ONI2JE8e', 'SrQZTHRGcCUZUch2OA25fMbWpExSYg5UHGpW8jQzj2NCVOqSaNaHyeLPYNhm', '2020-07-29 02:54:13', '2020-07-29 02:54:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_infos`
--

CREATE TABLE `admin_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `par_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-08-19 15:34:04', '2020-08-19 15:33:33', '2020-08-19 15:34:04'),
(2, 1, '2020-08-20 07:02:50', '2020-08-19 15:41:55', '2020-08-20 07:02:50'),
(3, 2, '2020-08-19 15:43:29', '2020-08-19 15:42:55', '2020-08-19 15:43:29'),
(4, 1, '2020-08-20 07:35:05', '2020-08-20 07:33:43', '2020-08-20 07:35:05'),
(5, 1, '2020-08-20 10:24:56', '2020-08-20 10:22:36', '2020-08-20 10:24:56'),
(6, 2, '2020-08-20 10:24:36', '2020-08-20 10:24:18', '2020-08-20 10:24:36'),
(7, 1, '2020-08-20 10:39:15', '2020-08-20 10:38:22', '2020-08-20 10:39:15'),
(8, 1, '2020-08-20 10:39:45', '2020-08-20 10:39:24', '2020-08-20 10:39:45'),
(9, 1, '2020-08-20 10:43:46', '2020-08-20 10:42:44', '2020-08-20 10:43:46'),
(10, 1, '2020-08-20 11:40:17', '2020-08-20 11:39:45', '2020-08-20 11:40:17');

-- --------------------------------------------------------

--
-- Table structure for table `cart_products`
--

CREATE TABLE `cart_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cart` bigint(20) UNSIGNED NOT NULL,
  `product` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart_products`
--

INSERT INTO `cart_products` (`id`, `cart`, `product`, `quantity`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 87, 1, NULL, '2020-08-19 15:33:33', '2020-08-19 15:33:33'),
(2, 1, 79, 1, NULL, '2020-08-19 15:33:40', '2020-08-19 15:33:40'),
(3, 2, 86, 1, NULL, '2020-08-19 15:41:55', '2020-08-19 15:41:55'),
(4, 3, 87, 1, NULL, '2020-08-19 15:42:55', '2020-08-19 15:42:55'),
(5, 3, 85, 1, NULL, '2020-08-19 15:43:03', '2020-08-19 15:43:03'),
(6, 2, 87, 1, NULL, '2020-08-20 07:02:35', '2020-08-20 07:02:35'),
(7, 4, 87, 1, NULL, '2020-08-20 07:33:43', '2020-08-20 07:33:43'),
(8, 4, 86, 1, NULL, '2020-08-20 07:34:47', '2020-08-20 07:34:47'),
(9, 4, 83, 1, NULL, '2020-08-20 07:34:57', '2020-08-20 07:34:57'),
(10, 5, 87, 1, NULL, '2020-08-20 10:22:36', '2020-08-20 10:22:36'),
(11, 5, 86, 1, NULL, '2020-08-20 10:22:49', '2020-08-20 10:22:49'),
(12, 5, 85, 1, NULL, '2020-08-20 10:23:37', '2020-08-20 10:23:37'),
(13, 6, 87, 1, NULL, '2020-08-20 10:24:18', '2020-08-20 10:24:18'),
(14, 6, 85, 1, NULL, '2020-08-20 10:24:27', '2020-08-20 10:24:27'),
(15, 7, 85, 1, NULL, '2020-08-20 10:38:22', '2020-08-20 10:38:22'),
(16, 7, 79, 1, NULL, '2020-08-20 10:39:07', '2020-08-20 10:39:07'),
(17, 8, 87, 1, NULL, '2020-08-20 10:39:24', '2020-08-20 10:39:24'),
(18, 8, 85, 1, NULL, '2020-08-20 10:39:32', '2020-08-20 10:39:32'),
(19, 8, 79, 1, NULL, '2020-08-20 10:39:38', '2020-08-20 10:39:38'),
(20, 9, 87, 1, NULL, '2020-08-20 10:42:44', '2020-08-20 10:42:44'),
(21, 9, 83, 1, NULL, '2020-08-20 10:43:40', '2020-08-20 10:43:40'),
(22, 10, 87, 1, NULL, '2020-08-20 11:39:45', '2020-08-20 11:39:45'),
(23, 10, 82, 1, NULL, '2020-08-20 11:40:07', '2020-08-20 11:40:07');

-- --------------------------------------------------------

--
-- Table structure for table `cart_product_options`
--

CREATE TABLE `cart_product_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cart_product` bigint(20) UNSIGNED NOT NULL,
  `option_parent` bigint(20) UNSIGNED NOT NULL,
  `option` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `parent`, `created_at`, `updated_at`) VALUES
(1, 'electornic', NULL, '2020-07-27 18:54:49', '2020-07-27 18:54:49'),
(2, 'garments', NULL, '2020-07-27 18:54:56', '2020-07-27 18:54:56'),
(3, 'mobile', 1, '2020-07-27 18:55:08', '2020-07-27 18:55:08'),
(4, 'television', 1, '2020-07-27 18:55:18', '2020-07-27 18:55:18'),
(5, 'smar tv', 4, '2020-07-27 18:55:35', '2020-07-27 18:55:35'),
(6, 'men', 2, '2020-07-27 18:56:05', '2020-07-27 18:56:05'),
(7, 'woman', 2, '2020-07-27 18:56:15', '2020-07-27 18:56:15');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(22, '2020_07_06_024717_create_product_images_table', 1),
(93, '2014_10_12_000000_create_users_table', 2),
(94, '2014_10_12_100000_create_password_resets_table', 2),
(95, '2019_08_19_000000_create_failed_jobs_table', 2),
(96, '2019_12_14_000001_create_personal_access_tokens_table', 2),
(97, '2020_06_26_120050_laratrust_setup_tables', 2),
(98, '2020_06_26_122756_create_admins_table', 2),
(99, '2020_06_26_122856_create_admin_infos_table', 2),
(100, '2020_06_26_161532_create_seller_requests_table', 2),
(101, '2020_06_29_052250_create_sellers_table', 2),
(102, '2020_06_30_025323_create_shops_table', 2),
(103, '2020_06_30_025503_create_shop_locations_table', 2),
(104, '2020_06_30_103858_create_shop_location_banners_table', 2),
(105, '2020_06_30_104042_create_shop_banners_table', 2),
(106, '2020_07_04_161427_create_categories_table', 2),
(107, '2020_07_05_051359_create_products_table', 2),
(108, '2020_07_05_051415_create_product_shops_table', 2),
(109, '2020_07_05_051430_create_product_details_table', 2),
(110, '2020_07_05_051515_create_product_options_table', 2),
(111, '2020_07_05_051524_create_product_option_details_table', 2),
(112, '2020_07_06_024149_create_product_tags_table', 2),
(113, '2020_07_06_024344_create_product_categories_table', 2),
(114, '2020_07_26_071349_create_product_shop_locations_table', 2),
(115, '2020_07_29_121644_create_product_option_images_table', 2),
(116, '2020_08_04_142043_create_product_images_table', 2),
(117, '2020_08_08_152410_create_carts_table', 2),
(118, '2020_08_08_184729_create_cart_products_table', 2),
(119, '2020_08_08_191728_create_cart_product_options_table', 2),
(120, '2020_08_09_214428_create_orders_table', 2),
(121, '2020_08_10_112929_create_order_products_table', 2),
(122, '2020_08_10_114941_create_order_product_options_table', 2),
(123, '2020_08_10_120337_create_order_product_statuses_table', 2),
(124, '2020_08_10_133528_create_user_addresses_table', 2),
(125, '2020_08_10_133912_create_order_addresses_table', 2),
(126, '2020_08_14_121034_create_user_product_clicks_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user` bigint(20) UNSIGNED NOT NULL,
  `cart` bigint(20) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `url`, `user`, `cart`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'jR-4ef8a942-e9ea-43bf-98cf-fe129f82ba5b', 1, 1, 0, NULL, '2020-08-19 15:34:04', '2020-08-19 15:34:04'),
(2, 'k5-67d312df-208b-4098-8bbb-3880d40808cc', 2, 3, 0, NULL, '2020-08-19 15:43:29', '2020-08-19 15:43:29'),
(3, 'l5-3eef6655-fb3f-437d-a69d-178ef7ee6ad1', 1, 2, 0, NULL, '2020-08-20 07:02:50', '2020-08-20 07:02:50'),
(4, 'mO-e112f082-c36b-4c35-a39d-7fad97c2b8ad', 1, 4, 0, NULL, '2020-08-20 07:35:05', '2020-08-20 07:35:05'),
(5, 'nR-25dc2be9-88a3-4e52-af07-5178fa9daa5b', 2, 6, 0, NULL, '2020-08-20 10:24:36', '2020-08-20 10:24:36'),
(6, 'oj-c6e75b03-086f-4c24-a6bc-e45353523205', 1, 5, 0, NULL, '2020-08-20 10:24:55', '2020-08-20 10:24:56'),
(7, 'p2-97c1617f-6848-4f2c-ac41-eb5d3bd1530f', 1, 7, 0, NULL, '2020-08-20 10:39:14', '2020-08-20 10:39:15'),
(8, 'q2-c14c71f2-3386-4826-938a-d4c34a1aa5fd', 1, 8, 0, NULL, '2020-08-20 10:39:45', '2020-08-20 10:39:45'),
(9, 'rE-8c3fc239-9795-4ca8-a232-263d13517a0a', 1, 9, 0, NULL, '2020-08-20 10:43:46', '2020-08-20 10:43:46'),
(10, 'vm-da9fa821-da76-4abb-b0c7-107d8fcfc08e', 1, 10, 0, NULL, '2020-08-20 11:40:16', '2020-08-20 11:40:16');

-- --------------------------------------------------------

--
-- Table structure for table `order_addresses`
--

CREATE TABLE `order_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order` bigint(20) UNSIGNED NOT NULL,
  `address` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_addresses`
--

INSERT INTO `order_addresses` (`id`, `order`, `address`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2020-08-19 15:34:04', '2020-08-19 15:34:04'),
(2, 3, 1, '2020-08-20 07:02:50', '2020-08-20 07:02:50'),
(3, 4, 1, '2020-08-20 07:35:05', '2020-08-20 07:35:05'),
(4, 5, 2, '2020-08-20 10:24:36', '2020-08-20 10:24:36'),
(5, 6, 1, '2020-08-20 10:24:56', '2020-08-20 10:24:56'),
(6, 7, 1, '2020-08-20 10:39:15', '2020-08-20 10:39:15'),
(7, 8, 1, '2020-08-20 10:39:45', '2020-08-20 10:39:45'),
(8, 9, 1, '2020-08-20 10:43:46', '2020-08-20 10:43:46'),
(9, 10, 1, '2020-08-20 11:40:17', '2020-08-20 11:40:17');

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `offer` int(10) UNSIGNED DEFAULT NULL,
  `total_price` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`id`, `product`, `quantity`, `offer`, `total_price`, `created_at`, `updated_at`) VALUES
(22, 22, 2, NULL, 134000, '2020-08-12 13:55:09', '2020-08-12 13:55:09'),
(23, 22, 1, NULL, 67000, '2020-08-13 16:01:21', '2020-08-13 16:01:21'),
(24, 21, 2, 20, 1939, '2020-08-13 16:01:21', '2020-08-13 16:01:21'),
(25, 24, 1, NULL, 3020, '2020-08-14 05:46:26', '2020-08-14 05:46:26'),
(26, 25, 1, NULL, 12000, '2020-08-18 16:50:18', '2020-08-18 16:50:18'),
(27, 24, 1, NULL, 2020, '2020-08-18 16:50:18', '2020-08-18 16:50:18'),
(28, 87, 1, NULL, 600, '2020-08-19 15:34:04', '2020-08-19 15:34:04'),
(29, 79, 1, NULL, 1500, '2020-08-19 15:34:04', '2020-08-19 15:34:04'),
(30, 87, 1, NULL, 600, '2020-08-19 15:43:29', '2020-08-19 15:43:29'),
(31, 85, 1, NULL, 600, '2020-08-19 15:43:29', '2020-08-19 15:43:29'),
(32, 86, 1, NULL, 600, '2020-08-20 07:02:50', '2020-08-20 07:02:50'),
(33, 87, 1, NULL, 600, '2020-08-20 07:02:50', '2020-08-20 07:02:50'),
(34, 87, 1, NULL, 600, '2020-08-20 07:35:05', '2020-08-20 07:35:05'),
(35, 86, 1, NULL, 600, '2020-08-20 07:35:05', '2020-08-20 07:35:05'),
(36, 83, 1, NULL, 600, '2020-08-20 07:35:05', '2020-08-20 07:35:05'),
(37, 87, 1, NULL, 600, '2020-08-20 10:24:36', '2020-08-20 10:24:36'),
(38, 85, 1, NULL, 600, '2020-08-20 10:24:36', '2020-08-20 10:24:36'),
(39, 87, 1, NULL, 600, '2020-08-20 10:24:56', '2020-08-20 10:24:56'),
(40, 86, 1, NULL, 600, '2020-08-20 10:24:56', '2020-08-20 10:24:56'),
(41, 85, 1, NULL, 600, '2020-08-20 10:24:56', '2020-08-20 10:24:56'),
(42, 85, 1, NULL, 600, '2020-08-20 10:39:15', '2020-08-20 10:39:15'),
(43, 79, 1, NULL, 1500, '2020-08-20 10:39:15', '2020-08-20 10:39:15'),
(44, 87, 1, NULL, 600, '2020-08-20 10:39:45', '2020-08-20 10:39:45'),
(45, 85, 1, NULL, 600, '2020-08-20 10:39:45', '2020-08-20 10:39:45'),
(46, 79, 1, NULL, 1500, '2020-08-20 10:39:45', '2020-08-20 10:39:45'),
(47, 87, 1, NULL, 600, '2020-08-20 10:43:46', '2020-08-20 10:43:46'),
(48, 83, 1, NULL, 600, '2020-08-20 10:43:46', '2020-08-20 10:43:46'),
(49, 87, 1, NULL, 600, '2020-08-20 11:40:17', '2020-08-20 11:40:17'),
(50, 82, 1, NULL, 1500, '2020-08-20 11:40:17', '2020-08-20 11:40:17');

-- --------------------------------------------------------

--
-- Table structure for table `order_product_options`
--

CREATE TABLE `order_product_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_product` bigint(20) UNSIGNED NOT NULL,
  `option` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_product_options`
--

INSERT INTO `order_product_options` (`id`, `order_product`, `option`, `created_at`, `updated_at`) VALUES
(25, 22, 50, '2020-08-12 13:55:09', '2020-08-12 13:55:09'),
(26, 22, 54, '2020-08-12 13:55:09', '2020-08-12 13:55:09'),
(27, 22, 57, '2020-08-12 13:55:09', '2020-08-12 13:55:09'),
(28, 23, 50, '2020-08-13 16:01:21', '2020-08-13 16:01:21'),
(29, 23, 54, '2020-08-13 16:01:21', '2020-08-13 16:01:21'),
(30, 23, 57, '2020-08-13 16:01:21', '2020-08-13 16:01:21'),
(31, 25, 59, '2020-08-14 05:46:26', '2020-08-14 05:46:26'),
(32, 26, 60, '2020-08-18 16:50:18', '2020-08-18 16:50:18'),
(33, 27, 58, '2020-08-18 16:50:18', '2020-08-18 16:50:18');

-- --------------------------------------------------------

--
-- Table structure for table `order_product_statuses`
--

CREATE TABLE `order_product_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order` bigint(20) UNSIGNED NOT NULL,
  `seller` bigint(20) UNSIGNED NOT NULL,
  `product` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_product_statuses`
--

INSERT INTO `order_product_statuses` (`id`, `order`, `seller`, `product`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 87, 0, '2020-08-19 15:34:04', '2020-08-19 15:34:04'),
(2, 1, 1, 79, 0, '2020-08-19 15:34:04', '2020-08-19 15:34:04'),
(3, 2, 1, 87, 0, '2020-08-19 15:43:29', '2020-08-19 15:43:29'),
(4, 2, 1, 85, 0, '2020-08-19 15:43:29', '2020-08-19 15:43:29'),
(5, 3, 1, 86, 0, '2020-08-20 07:02:50', '2020-08-20 07:02:50'),
(6, 3, 1, 87, 0, '2020-08-20 07:02:50', '2020-08-20 07:02:50'),
(7, 4, 1, 87, 0, '2020-08-20 07:35:05', '2020-08-20 07:35:05'),
(8, 4, 1, 86, 0, '2020-08-20 07:35:05', '2020-08-20 07:35:05'),
(9, 4, 1, 83, 0, '2020-08-20 07:35:05', '2020-08-20 07:35:05'),
(10, 5, 1, 87, 0, '2020-08-20 10:24:36', '2020-08-20 10:24:36'),
(11, 5, 1, 85, 0, '2020-08-20 10:24:36', '2020-08-20 10:24:36'),
(12, 6, 1, 87, 0, '2020-08-20 10:24:56', '2020-08-20 10:24:56'),
(13, 6, 1, 86, 0, '2020-08-20 10:24:56', '2020-08-20 10:24:56'),
(14, 6, 1, 85, 0, '2020-08-20 10:24:56', '2020-08-20 10:24:56'),
(15, 7, 1, 85, 0, '2020-08-20 10:39:15', '2020-08-20 10:39:15'),
(16, 7, 1, 79, 0, '2020-08-20 10:39:15', '2020-08-20 10:39:15'),
(17, 8, 1, 87, 0, '2020-08-20 10:39:45', '2020-08-20 10:39:45'),
(18, 8, 1, 85, 0, '2020-08-20 10:39:45', '2020-08-20 10:39:45'),
(19, 8, 1, 79, 0, '2020-08-20 10:39:45', '2020-08-20 10:39:45'),
(20, 9, 1, 87, 0, '2020-08-20 10:43:46', '2020-08-20 10:43:46'),
(21, 9, 1, 83, 0, '2020-08-20 10:43:46', '2020-08-20 10:43:46'),
(22, 10, 1, 87, 0, '2020-08-20 11:40:17', '2020-08-20 11:40:17'),
(23, 10, 1, 82, 0, '2020-08-20 11:40:17', '2020-08-20 11:40:17');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'create-users', 'Create Users', 'Create Users', '2020-08-19 15:11:37', '2020-08-19 15:11:37'),
(2, 'read-users', 'Read Users', 'Read Users', '2020-08-19 15:11:37', '2020-08-19 15:11:37'),
(3, 'update-users', 'Update Users', 'Update Users', '2020-08-19 15:11:37', '2020-08-19 15:11:37'),
(4, 'delete-users', 'Delete Users', 'Delete Users', '2020-08-19 15:11:37', '2020-08-19 15:11:37'),
(5, 'create-payments', 'Create Payments', 'Create Payments', '2020-08-19 15:11:37', '2020-08-19 15:11:37'),
(6, 'read-payments', 'Read Payments', 'Read Payments', '2020-08-19 15:11:37', '2020-08-19 15:11:37'),
(7, 'update-payments', 'Update Payments', 'Update Payments', '2020-08-19 15:11:37', '2020-08-19 15:11:37'),
(8, 'delete-payments', 'Delete Payments', 'Delete Payments', '2020-08-19 15:11:37', '2020-08-19 15:11:37'),
(9, 'read-profile', 'Read Profile', 'Read Profile', '2020-08-19 15:11:37', '2020-08-19 15:11:37'),
(10, 'update-profile', 'Update Profile', 'Update Profile', '2020-08-19 15:11:37', '2020-08-19 15:11:37');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(9, 2),
(10, 2),
(9, 3),
(10, 3),
(9, 4),
(10, 4);

-- --------------------------------------------------------

--
-- Table structure for table `permission_user`
--

CREATE TABLE `permission_user` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_user`
--

INSERT INTO `permission_user` (`permission_id`, `user_id`, `user_type`) VALUES
(1, 1, 'App\\Admin'),
(2, 1, 'App\\Admin'),
(3, 1, 'App\\Admin'),
(4, 1, 'App\\Admin'),
(5, 1, 'App\\Admin'),
(6, 1, 'App\\Admin'),
(7, 1, 'App\\Admin'),
(8, 1, 'App\\Admin'),
(9, 1, 'App\\Admin'),
(10, 1, 'App\\Admin');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `url` char(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `seller` bigint(20) UNSIGNED NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `offerPrice` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `offerStart` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `offerEnd` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `offerType` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `offerStatus` tinyint(1) NOT NULL DEFAULT '0',
  `offerMinimumBuy` tinyint(4) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `url`, `name`, `price`, `seller`, `description`, `active`, `offerPrice`, `offerStart`, `offerEnd`, `offerType`, `offerStatus`, `offerMinimumBuy`, `deleted_at`, `created_at`, `updated_at`) VALUES
(21, 'R7C0-cb2c4522-e6df-4dca-b7fd-c595945012c3', 'mobile', 1212.00, 1, '<p>.tracking-tighter</p><p>The quick brown fox jumped over the lazy dog.</p><p>.tracking-tight</p><p>T<strong>he quick brown fox jumped over the lazy dog.</strong></p><p><strong>.tracking-normal</strong></p><p><strong>The quick brown fox jumped over the lazy dog.</strong></p><p><strong>.tracking-wide</strong></p><p><strong>The quick brown fox jumped over the lazy dog.</strong></p><p><strong>.tracking-wider</strong></p><p><strong>The quick brown fox jumped over the lazy dog.</strong></p><p>.tracking-widest</p><p>The quick brown fox jumped over the lazy dog.</p>', 1, 20, NULL, NULL, 'percent', 1, 2, NULL, '2020-08-06 01:03:17', '2020-08-06 01:03:30'),
(22, 'VKFk-1fc391f0-9f5f-4e24-a226-717d02d3d9ae', 'Television', 50000.00, 1, '<h2>What is Lorem Ipsum?</h2><p class=\"ql-align-justify\"><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><h2>Why do we use it?</h2><p class=\"ql-align-justify\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p><p><br></p><h2>Where does it come from?</h2><p class=\"ql-align-justify\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p class=\"ql-align-justify\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p><h2>Where can I get some?</h2><p class=\"ql-align-justify\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p><p><br></p>', 1, 50, '2020-08-06 01:25:00', '2020-08-10 12:00:00', 'percent', 1, 1, NULL, '2020-08-06 02:24:42', '2020-08-06 13:23:03'),
(23, 'W0HX-4fc7f9f7-528e-410b-ac54-c9d214c1c717', 'swater', 2000.00, 1, '<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel<strong>, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidun<u>t. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam se</u></strong><u>mper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc, quis gravida magna mi a libero. Fusce vulp</u>utate eleifend sapien. Vestibulum purus quam, scelerisque ut, mollis sed, nonummy id, metus. Nullam accumsan<em> lorem in dui. Cras ultricies mi eu turpis hendrerit fringilla. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In ac dui quis mi consectetuer lacinia. Nam pretium turpis et arcu. Duis arcu tortor, suscipit eget, imperdiet nec, imperdiet iaculis, ipsum. Sed aliquam ultrices mauris. Integer ante arcu, accumsan a, consectetuer eget, posuere ut, mauris. Praesent adipiscing. Phasellus ullamcorper ipsum rutrum nunc. Nunc nonummy metus</em>. Vestibulum volutpat pretium libero. Cras id dui. Aenean ut eros et nisl sagittis vestibulum. Nullam nulla eros, ultricies sit amet, nonummy id, imperdiet <span style=\"background-color: rgb(250, 204, 204);\">feugiat, pede. Sed lectus. Donec mollis hendrerit risus. Phasellus nec sem in justo pellentesque facilisis. Etiam imperdiet imperdiet orci. Nunc nec neque. Phasellus leo dolor, tempus non, auctor et, hendrerit quis, nisi. Curabitur ligula sapien, tincidunt non, euismod vitae, posuere imperdiet, leo. Maecenas malesuada. Pra</span>esent congue erat at massa. Sed cursus turpis vitae tortor. Donec posuere vulputate arcu. Phasellus accumsan cursus velit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed aliquam, nisi quis porttitor congue, elit erat euismod orci, ac</p><p><br></p>', 1, 50, '2020-08-06 22:25:00', '2020-08-08 12:00:00', 'percent', 1, 2, NULL, '2020-08-06 03:05:21', '2020-08-06 03:05:37'),
(24, 'X9ID-abb5dbeb-8e68-4800-9dfb-f336d2a7bc45', 'mouse', 2020.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-13 23:44:14', '2020-08-13 23:44:50'),
(25, 'YDSp-6233c20f-00a8-49a9-8d57-95d7fdbc50fe', 'Xiomi', 12000.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-18 10:39:20', '2020-08-18 10:39:45'),
(26, 'ZKT8-a4dc03ac-6a54-4b7c-9e73-3072b0501d53', 'Samsung Electronics Galaxy Note 20 Ultra 5G', 120000.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-18 11:37:36', '2020-08-18 11:37:52'),
(27, '1OUB-efca7442-150c-461a-9e68-d8e4cc9290ec', 'Samsung Galaxy S20 Ultra 5G', 120000.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-18 11:41:29', '2020-08-18 11:41:49'),
(28, '2mcZ-c4dd7452-7f9a-460d-82b0-433341e3216d', 'LG V60 ThinQ', 100000.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-18 11:44:12', '2020-08-18 11:44:36'),
(29, '3Df9-e9e828d2-5645-468e-8c05-6047487e538f', 'OnePlus 8 Pro', 90000.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-18 11:47:08', '2020-08-18 11:47:22'),
(30, '4Zh9-98f5e1af-99a8-4c1a-abaa-aae42119bb85', 'Galaxy Note10 Plus 256GB', 80000.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-18 11:49:16', '2020-08-18 11:50:25'),
(31, '5Pip-b19021c9-3362-4225-98e9-97ac4b36bae7', 'iPhone 11 Pro', 130000.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-18 11:53:01', '2020-08-18 11:53:15'),
(32, '6Es0-93565412-1337-4da4-94a2-b5f71be569a2', 'Google Pixel 3a XL', 60000.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-18 11:55:51', '2020-08-18 11:55:59'),
(33, '75tV-951dc443-8075-4d18-a653-9afe8f848789', 'iPhone 11', 120000.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-18 11:57:34', '2020-08-18 11:57:44'),
(34, '84uP-acbd61bc-ff96-42b2-ae16-1bee3a04311b', 'Google Pixel 4 XL 64GB', 70000.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-18 11:59:27', '2020-08-18 11:59:42'),
(35, '90CN-1eaacb0b-dfeb-4f94-b301-bf89bbff0385', 'iPhone SE', 50000.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-18 12:01:21', '2020-08-18 12:02:07'),
(36, '0JFg-148759a3-403b-4eac-b5db-5e77002b7765', 'Xiaomi Mi 9X', 28000.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-18 12:05:30', '2020-08-18 12:06:15'),
(37, 'gwHw-b13e4508-0a75-419b-972e-bcfed5dfe88f', 'Xiaomi Redmi K20', 30000.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-18 12:07:37', '2020-08-18 12:08:54'),
(38, 'jXIG-6a5185a6-85e9-448d-9716-ebed1c616b0c', 'Xiaomi Mi 9T', 30000.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-18 12:11:29', '2020-08-18 12:11:41'),
(39, 'kGSX-c6b9d9bb-1919-4179-b3d7-1db927bc1c27', 'Realme C3', 10000.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-18 12:14:10', '2020-08-18 12:14:32'),
(40, 'lzTP-b8bbeee5-0013-42ad-812c-c3944320fbac', 'Realme X 8GB RAM 128GB', 40000.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-18 12:16:40', '2020-08-18 12:16:50'),
(41, 'mBUP-2ae14bf4-2605-4037-82d0-30dd23c50418', 'TCL 32S327 32 Inch 1080p Roku Smart LED TV', 70000.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-18 12:20:14', '2020-08-18 12:20:23'),
(42, 'nMc3-5b18b0d7-a8fc-4cb5-9a33-4f823ccf281f', 'LG 22LJ4540 TV 22 Inch 1080p IPS LED', 20000.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-18 12:22:03', '2020-08-18 12:22:46'),
(43, 'opfP-ffb15f8d-a3f9-4353-bd0f-c6484007234d', 'Supersonic SC 1911 19 Inch 1080p LED Widescreen HDTV', 12000.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-18 12:23:56', '2020-08-18 12:24:18'),
(44, 'pYwhO-fe238574-0a21-4df2-bdd1-d613f44e07bc', 'Samsung Electronics UN32M4500BFXZA 720P Smart LED TV 32', 20000.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-18 12:25:38', '2020-08-18 12:25:53'),
(45, 'qxxik-0d77728b-d109-40da-a684-d5de0b5d3ac5', 'LG 32LM570BPUA 32 Class 720p Smart LED HD TV', 25000.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-18 12:27:09', '2020-08-18 12:27:29'),
(46, 'rk0sn-10c2eff0-2e3a-4f5c-ac55-3257e649b74c', 'Samsung Electronics UN32N5300AFXZA 32 1080p Smart LED TV', 40000.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-18 12:28:47', '2020-08-18 12:29:07'),
(47, 'v2otL-01b63992-db42-448c-907a-938bbdf4a279', 'LG OLED55B9PUA B9 Series', 200000.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-18 12:31:47', '2020-08-18 12:32:00'),
(48, 'wpVuV-58eacbe2-2acb-467a-84ce-e259ee26719a', 'Samsung QN65Q900RBFXZA', 300000.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-18 12:33:31', '2020-08-18 12:33:40'),
(49, 'xk6CR-6265cc66-21c2-4834-8d7e-b7637ceb6890', 'Sony XBR85Z9G Smart Master Series', 400000.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-18 12:34:38', '2020-08-18 12:34:51'),
(50, 'yP9F2-cf29c2d1-944d-4ca7-aa9d-fe021ba56cc3', 'LG 28LM430BPU 28 Class HD LED TV', 25000.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-18 12:36:20', '2020-08-18 12:36:43'),
(51, 'zpXHw-4c13b76f-62dc-4c35-9971-a07591f512d4', 'Hoodie', 600.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-18 23:50:37', '2020-08-18 23:51:06'),
(52, 'ADmIl-e90864ab-9935-4a1f-99d7-a09bce04f332', 'Supreme Wears Hoodie', 600.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-18 23:52:20', '2020-08-18 23:52:37'),
(53, 'BB8SR-d5be4110-d783-422a-b060-359980cf005d', 'Supreme Wears Hoodie', 600.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-18 23:53:48', '2020-08-18 23:54:24'),
(54, 'DkwTJ-979e1ed2-7c26-4524-8459-541856e2a037', 'Supreme Wears Hoodie', 600.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-19 00:03:40', '2020-08-19 00:04:02'),
(55, 'ER6U0-dc4c9fb0-07a1-4202-80a7-24b4e3d889ea', 'Linen Heart Motive Saree', 5000.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-19 00:05:53', '2020-08-19 00:06:10'),
(56, 'G6ghO-83135bd6-f71d-4449-b592-ba069522a4d2', 'Linen by Linen Heart Motive Saree Black', 5000.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-19 00:07:49', '2020-08-19 00:07:58'),
(57, 'J6ziA-017a978e-9b8b-45e9-a948-1f37505513ae', 'Oprea Benarosi Saree', 4500.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-19 00:09:13', '2020-08-19 00:09:24'),
(58, 'Kr9hM-f61eaab2-e216-4658-ad27-723d02f1d06e', 'Oprea Benarosi Saree', 4500.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-19 00:10:11', '2020-08-19 00:10:21'),
(59, 'L9Bhw-1998dda8-e504-4cc3-a9d1-cc42987032ed', 'Oprea Benarosi Saree Pakistani', 5000.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-19 00:11:26', '2020-08-19 00:11:37'),
(60, 'M8Ksk-f78b869a-7431-4f5a-9f13-3ac9ae151b60', 'Oprea Benarosi Saree Pakistani', 5000.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-19 00:12:27', '2020-08-19 00:12:44'),
(61, 'NkGtP-e981961b-5998-4686-b4cd-69c6f0d2f702', 'Supreme Wears Jacket J20', 1500.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-19 00:14:26', '2020-08-19 00:14:44'),
(62, 'OYkuZ-a6c1b129-a298-4540-8a80-239ab2faa0ac', 'Supreme Wears Jacket J21', 1500.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-19 00:15:51', '2020-08-19 00:16:00'),
(63, 'PNpCN-2e056e6c-9857-4a8f-8759-8447c82d50b5', 'Supreme Wears Jacket J23', 1500.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-19 00:17:09', '2020-08-19 00:17:19'),
(64, 'QW2Fl-a56c0da1-eb04-4676-9661-c58b88396a8b', 'Supreme Wears Jacket J24', 1500.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-19 00:18:22', '2020-08-19 00:19:32'),
(65, 'R67S0-6edb3d12-301c-4860-a5bc-bf57b2f191f4', 'Supreme Wears Jacket J25', 1500.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-19 00:23:02', '2020-08-19 00:23:12'),
(66, 'VOKIk-6a1b0e71-3064-43ba-af58-150c0e0f5c06', 'Oprea Benarosi Saree Pakistani', 5000.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-19 00:24:19', '2020-08-19 00:24:38'),
(67, 'W60UX-35f4f203-8b80-497e-b9ce-afa11ea7d4ad', 'Oprea Benarosi Saree Pakistani', 5000.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-19 00:25:37', '2020-08-19 00:25:49'),
(68, 'XD9cD-fedb6aa9-ec3d-476b-961a-1d7c5454e7f9', 'Oprea Benarosi Saree Pakistani', 5000.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-19 00:26:43', '2020-08-19 00:26:55'),
(69, 'YEDcp-f7048ae3-6e9b-4e9e-a0dc-0844dac656ad', 'Manipuri Handloomed Saree', 4000.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-19 00:32:43', '2020-08-19 00:32:52'),
(70, 'Z6Kh8-514117c4-7b17-4998-b02c-1dac49ff90d8', 'Designer Jamdani Saree', 6000.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-19 00:33:57', '2020-08-19 00:34:05'),
(71, '1wOfB-bd0c5687-1abe-41c1-b9ce-6a33e948c7fe', 'Designer joomsaree Saree', 6000.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-19 00:36:39', '2020-08-19 00:36:48'),
(72, '2kmhZ-43816cb3-6912-43b5-92b3-da4dabb8ece4', 'Supreme Wears Tshirt', 300.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-19 00:39:19', '2020-08-19 00:39:44'),
(73, '31DI9-a5254f3b-ea0a-4900-8944-507831d6a94d', 'Supreme Wears Tshirt FT02', 300.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-19 00:41:14', '2020-08-19 00:41:30'),
(74, '4xZs9-d47226f0-6acb-4b60-9053-4cdbc1e427b8', 'Supreme Wears Tshirt FT03', 300.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-19 00:42:58', '2020-08-19 00:43:13'),
(75, '5yPtp-ff488570-967c-466d-b233-335b4ee80a8b', 'Supreme Wears Tshirt FT04', 300.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-19 00:46:40', '2020-08-19 00:46:54'),
(76, '68Eu0-3fc62a2f-6a3b-47b6-945f-ecd8af6c8965', 'Supreme Wears Tshirt FT02', 300.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-19 00:47:46', '2020-08-19 00:48:00'),
(77, '735TV-7bc8bf74-61e7-4e8d-bc4a-16c0df9d1b46', 'Supreme Wears Tshirt FT05', 300.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-19 00:49:03', '2020-08-19 00:49:38'),
(78, '824cP-87b6fa53-80c7-4ba5-98c9-6452132b8c0b', 'Supreme Wears Tshirt FT06', 300.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-19 00:51:08', '2020-08-19 00:51:17'),
(79, '9r0HN-f357cb49-a5d3-4d43-b19d-bed8a8799b7d', 'Supreme Wears Jacket J26', 1500.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-19 00:53:04', '2020-08-19 00:53:23'),
(80, '0RJIg-27624a62-a676-4873-886b-9d71e5318936', 'Supreme Wears Jacket J27', 1500.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-19 00:54:18', '2020-08-19 00:54:30'),
(81, 'gJwCw-067d930d-b8ba-4b6f-9b97-9f6bfce6d3e8', 'Supreme Wears Jacket J28', 1500.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-19 00:55:31', '2020-08-19 00:55:43'),
(82, 'jRXcG-1262e247-90dd-43fd-8373-9c37a56ada32', 'Supreme Wears Jacket J30', 1500.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-19 00:56:33', '2020-08-19 00:56:41'),
(83, 'kRGfX-462c9447-f049-4eaa-a760-4552d8c6e068', 'Supreme Wears Hoodie H020', 600.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-19 00:57:51', '2020-08-19 00:58:03'),
(84, 'lYzcP-55baaa33-62f7-4680-9917-71ef635e7bbe', 'Supreme Wears Hoodie H021', 600.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-19 00:58:52', '2020-08-19 00:59:03'),
(85, 'mZBfP-f8bee163-ecd5-49bb-bfd6-9219698d03c4', 'Supreme Wears Hoodie H035', 600.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-19 01:00:14', '2020-08-19 01:00:33'),
(86, 'n5Mt3-2864d772-6f8b-49fe-bbb9-1582041cdd9d', 'Supreme Wears Hoodie H036', 600.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-19 01:01:22', '2020-08-19 01:02:08'),
(87, 'o2pHP-aaa941c1-9cff-45ec-96e0-d5318efb7f38', 'Supreme Wears Hoodie', 600.00, 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-19 01:03:01', '2020-08-19 01:03:24');

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category` bigint(20) UNSIGNED NOT NULL,
  `product` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `category`, `product`, `created_at`, `updated_at`) VALUES
(60, 1, 21, '2020-08-06 01:03:17', '2020-08-06 01:03:17'),
(61, 3, 21, '2020-08-06 01:03:17', '2020-08-06 01:03:17'),
(62, 4, 21, '2020-08-06 01:03:17', '2020-08-06 01:03:17'),
(63, 5, 21, '2020-08-06 01:03:17', '2020-08-06 01:03:17'),
(64, 1, 22, '2020-08-06 02:24:42', '2020-08-06 02:24:42'),
(65, 3, 22, '2020-08-06 02:24:42', '2020-08-06 02:24:42'),
(66, 4, 22, '2020-08-06 02:24:42', '2020-08-06 02:24:42'),
(67, 5, 22, '2020-08-06 02:24:42', '2020-08-06 02:24:42'),
(68, 2, 23, '2020-08-06 03:05:21', '2020-08-06 03:05:21'),
(69, 6, 23, '2020-08-06 03:05:21', '2020-08-06 03:05:21'),
(70, 7, 23, '2020-08-06 03:05:21', '2020-08-06 03:05:21'),
(71, 2, 24, '2020-08-13 23:44:14', '2020-08-13 23:44:14'),
(72, 6, 24, '2020-08-13 23:44:14', '2020-08-13 23:44:14'),
(73, 7, 24, '2020-08-13 23:44:14', '2020-08-13 23:44:14'),
(74, 3, 25, '2020-08-18 10:39:21', '2020-08-18 10:39:21'),
(75, 1, 25, '2020-08-18 10:39:21', '2020-08-18 10:39:21'),
(76, 3, 26, '2020-08-18 11:37:36', '2020-08-18 11:37:36'),
(77, 1, 26, '2020-08-18 11:37:36', '2020-08-18 11:37:36'),
(78, 3, 27, '2020-08-18 11:41:31', '2020-08-18 11:41:31'),
(79, 1, 27, '2020-08-18 11:41:31', '2020-08-18 11:41:31'),
(80, 3, 28, '2020-08-18 11:44:13', '2020-08-18 11:44:13'),
(81, 1, 28, '2020-08-18 11:44:13', '2020-08-18 11:44:13'),
(82, 3, 29, '2020-08-18 11:47:09', '2020-08-18 11:47:09'),
(83, 1, 29, '2020-08-18 11:47:09', '2020-08-18 11:47:09'),
(84, 3, 30, '2020-08-18 11:49:17', '2020-08-18 11:49:17'),
(85, 1, 30, '2020-08-18 11:49:17', '2020-08-18 11:49:17'),
(86, 3, 31, '2020-08-18 11:53:02', '2020-08-18 11:53:02'),
(87, 1, 31, '2020-08-18 11:53:02', '2020-08-18 11:53:02'),
(88, 3, 32, '2020-08-18 11:55:51', '2020-08-18 11:55:51'),
(89, 1, 32, '2020-08-18 11:55:51', '2020-08-18 11:55:51'),
(90, 3, 33, '2020-08-18 11:57:34', '2020-08-18 11:57:34'),
(91, 1, 33, '2020-08-18 11:57:34', '2020-08-18 11:57:34'),
(92, 3, 34, '2020-08-18 11:59:28', '2020-08-18 11:59:28'),
(93, 1, 34, '2020-08-18 11:59:28', '2020-08-18 11:59:28'),
(94, 3, 35, '2020-08-18 12:01:22', '2020-08-18 12:01:22'),
(95, 1, 35, '2020-08-18 12:01:22', '2020-08-18 12:01:22'),
(96, 3, 36, '2020-08-18 12:05:30', '2020-08-18 12:05:30'),
(97, 1, 36, '2020-08-18 12:05:30', '2020-08-18 12:05:30'),
(98, 3, 37, '2020-08-18 12:07:37', '2020-08-18 12:07:37'),
(99, 1, 37, '2020-08-18 12:07:37', '2020-08-18 12:07:37'),
(100, 3, 38, '2020-08-18 12:11:29', '2020-08-18 12:11:29'),
(101, 1, 38, '2020-08-18 12:11:29', '2020-08-18 12:11:29'),
(102, 3, 39, '2020-08-18 12:14:10', '2020-08-18 12:14:10'),
(103, 1, 39, '2020-08-18 12:14:10', '2020-08-18 12:14:10'),
(104, 3, 40, '2020-08-18 12:16:40', '2020-08-18 12:16:40'),
(105, 1, 40, '2020-08-18 12:16:40', '2020-08-18 12:16:40'),
(106, 4, 41, '2020-08-18 12:20:14', '2020-08-18 12:20:14'),
(107, 5, 41, '2020-08-18 12:20:14', '2020-08-18 12:20:14'),
(108, 1, 41, '2020-08-18 12:20:14', '2020-08-18 12:20:14'),
(109, 4, 42, '2020-08-18 12:22:03', '2020-08-18 12:22:03'),
(110, 5, 42, '2020-08-18 12:22:03', '2020-08-18 12:22:03'),
(111, 1, 42, '2020-08-18 12:22:03', '2020-08-18 12:22:03'),
(112, 4, 43, '2020-08-18 12:23:57', '2020-08-18 12:23:57'),
(113, 5, 43, '2020-08-18 12:23:57', '2020-08-18 12:23:57'),
(114, 1, 43, '2020-08-18 12:23:57', '2020-08-18 12:23:57'),
(115, 4, 44, '2020-08-18 12:25:38', '2020-08-18 12:25:38'),
(116, 5, 44, '2020-08-18 12:25:38', '2020-08-18 12:25:38'),
(117, 1, 44, '2020-08-18 12:25:38', '2020-08-18 12:25:38'),
(118, 4, 45, '2020-08-18 12:27:10', '2020-08-18 12:27:10'),
(119, 5, 45, '2020-08-18 12:27:10', '2020-08-18 12:27:10'),
(120, 1, 45, '2020-08-18 12:27:10', '2020-08-18 12:27:10'),
(121, 4, 46, '2020-08-18 12:28:48', '2020-08-18 12:28:48'),
(122, 5, 46, '2020-08-18 12:28:48', '2020-08-18 12:28:48'),
(123, 1, 46, '2020-08-18 12:28:48', '2020-08-18 12:28:48'),
(124, 4, 47, '2020-08-18 12:31:48', '2020-08-18 12:31:48'),
(125, 5, 47, '2020-08-18 12:31:48', '2020-08-18 12:31:48'),
(126, 1, 47, '2020-08-18 12:31:48', '2020-08-18 12:31:48'),
(127, 4, 48, '2020-08-18 12:33:32', '2020-08-18 12:33:32'),
(128, 5, 48, '2020-08-18 12:33:32', '2020-08-18 12:33:32'),
(129, 1, 48, '2020-08-18 12:33:32', '2020-08-18 12:33:32'),
(130, 4, 49, '2020-08-18 12:34:39', '2020-08-18 12:34:39'),
(131, 5, 49, '2020-08-18 12:34:39', '2020-08-18 12:34:39'),
(132, 1, 49, '2020-08-18 12:34:39', '2020-08-18 12:34:39'),
(133, 4, 50, '2020-08-18 12:36:20', '2020-08-18 12:36:20'),
(134, 5, 50, '2020-08-18 12:36:20', '2020-08-18 12:36:20'),
(135, 1, 50, '2020-08-18 12:36:20', '2020-08-18 12:36:20'),
(136, 6, 51, '2020-08-18 23:50:38', '2020-08-18 23:50:38'),
(137, 2, 51, '2020-08-18 23:50:38', '2020-08-18 23:50:38'),
(138, 6, 52, '2020-08-18 23:52:20', '2020-08-18 23:52:20'),
(139, 2, 52, '2020-08-18 23:52:20', '2020-08-18 23:52:20'),
(140, 6, 53, '2020-08-18 23:53:48', '2020-08-18 23:53:48'),
(141, 2, 53, '2020-08-18 23:53:48', '2020-08-18 23:53:48'),
(142, 6, 54, '2020-08-19 00:03:41', '2020-08-19 00:03:41'),
(143, 2, 54, '2020-08-19 00:03:41', '2020-08-19 00:03:41'),
(144, 7, 55, '2020-08-19 00:05:54', '2020-08-19 00:05:54'),
(145, 2, 55, '2020-08-19 00:05:54', '2020-08-19 00:05:54'),
(146, 7, 56, '2020-08-19 00:07:49', '2020-08-19 00:07:49'),
(147, 2, 56, '2020-08-19 00:07:49', '2020-08-19 00:07:49'),
(148, 7, 57, '2020-08-19 00:09:14', '2020-08-19 00:09:14'),
(149, 2, 57, '2020-08-19 00:09:14', '2020-08-19 00:09:14'),
(150, 7, 58, '2020-08-19 00:10:12', '2020-08-19 00:10:12'),
(151, 2, 58, '2020-08-19 00:10:12', '2020-08-19 00:10:12'),
(152, 7, 59, '2020-08-19 00:11:27', '2020-08-19 00:11:27'),
(153, 2, 59, '2020-08-19 00:11:27', '2020-08-19 00:11:27'),
(154, 7, 60, '2020-08-19 00:12:28', '2020-08-19 00:12:28'),
(155, 2, 60, '2020-08-19 00:12:28', '2020-08-19 00:12:28'),
(156, 6, 61, '2020-08-19 00:14:27', '2020-08-19 00:14:27'),
(157, 2, 61, '2020-08-19 00:14:27', '2020-08-19 00:14:27'),
(158, 6, 62, '2020-08-19 00:15:51', '2020-08-19 00:15:51'),
(159, 2, 62, '2020-08-19 00:15:51', '2020-08-19 00:15:51'),
(160, 6, 63, '2020-08-19 00:17:10', '2020-08-19 00:17:10'),
(161, 2, 63, '2020-08-19 00:17:10', '2020-08-19 00:17:10'),
(162, 6, 64, '2020-08-19 00:18:23', '2020-08-19 00:18:23'),
(163, 2, 64, '2020-08-19 00:18:23', '2020-08-19 00:18:23'),
(164, 6, 65, '2020-08-19 00:23:03', '2020-08-19 00:23:03'),
(165, 2, 65, '2020-08-19 00:23:03', '2020-08-19 00:23:03'),
(166, 7, 66, '2020-08-19 00:24:19', '2020-08-19 00:24:19'),
(167, 2, 66, '2020-08-19 00:24:20', '2020-08-19 00:24:20'),
(168, 7, 67, '2020-08-19 00:25:38', '2020-08-19 00:25:38'),
(169, 2, 67, '2020-08-19 00:25:38', '2020-08-19 00:25:38'),
(170, 7, 68, '2020-08-19 00:26:43', '2020-08-19 00:26:43'),
(171, 2, 68, '2020-08-19 00:26:43', '2020-08-19 00:26:43'),
(172, 7, 69, '2020-08-19 00:32:44', '2020-08-19 00:32:44'),
(173, 2, 69, '2020-08-19 00:32:44', '2020-08-19 00:32:44'),
(174, 7, 70, '2020-08-19 00:33:57', '2020-08-19 00:33:57'),
(175, 2, 70, '2020-08-19 00:33:57', '2020-08-19 00:33:57'),
(176, 7, 71, '2020-08-19 00:36:39', '2020-08-19 00:36:39'),
(177, 2, 71, '2020-08-19 00:36:39', '2020-08-19 00:36:39'),
(178, 6, 72, '2020-08-19 00:39:19', '2020-08-19 00:39:19'),
(179, 2, 72, '2020-08-19 00:39:19', '2020-08-19 00:39:19'),
(180, 6, 73, '2020-08-19 00:41:15', '2020-08-19 00:41:15'),
(181, 2, 73, '2020-08-19 00:41:15', '2020-08-19 00:41:15'),
(182, 6, 74, '2020-08-19 00:42:58', '2020-08-19 00:42:58'),
(183, 2, 74, '2020-08-19 00:42:58', '2020-08-19 00:42:58'),
(184, 6, 75, '2020-08-19 00:46:40', '2020-08-19 00:46:40'),
(185, 2, 75, '2020-08-19 00:46:40', '2020-08-19 00:46:40'),
(186, 6, 76, '2020-08-19 00:47:46', '2020-08-19 00:47:46'),
(187, 2, 76, '2020-08-19 00:47:46', '2020-08-19 00:47:46'),
(188, 6, 77, '2020-08-19 00:49:04', '2020-08-19 00:49:04'),
(189, 2, 77, '2020-08-19 00:49:04', '2020-08-19 00:49:04'),
(190, 6, 78, '2020-08-19 00:51:08', '2020-08-19 00:51:08'),
(191, 2, 78, '2020-08-19 00:51:08', '2020-08-19 00:51:08'),
(192, 6, 79, '2020-08-19 00:53:04', '2020-08-19 00:53:04'),
(193, 2, 79, '2020-08-19 00:53:04', '2020-08-19 00:53:04'),
(194, 6, 80, '2020-08-19 00:54:19', '2020-08-19 00:54:19'),
(195, 2, 80, '2020-08-19 00:54:19', '2020-08-19 00:54:19'),
(196, 6, 81, '2020-08-19 00:55:31', '2020-08-19 00:55:31'),
(197, 2, 81, '2020-08-19 00:55:31', '2020-08-19 00:55:31'),
(198, 6, 82, '2020-08-19 00:56:34', '2020-08-19 00:56:34'),
(199, 2, 82, '2020-08-19 00:56:34', '2020-08-19 00:56:34'),
(200, 6, 83, '2020-08-19 00:57:51', '2020-08-19 00:57:51'),
(201, 2, 83, '2020-08-19 00:57:51', '2020-08-19 00:57:51'),
(202, 6, 84, '2020-08-19 00:58:52', '2020-08-19 00:58:52'),
(203, 2, 84, '2020-08-19 00:58:52', '2020-08-19 00:58:52'),
(204, 6, 85, '2020-08-19 01:00:14', '2020-08-19 01:00:14'),
(205, 2, 85, '2020-08-19 01:00:14', '2020-08-19 01:00:14'),
(206, 6, 86, '2020-08-19 01:01:22', '2020-08-19 01:01:22'),
(207, 2, 86, '2020-08-19 01:01:22', '2020-08-19 01:01:22'),
(208, 6, 87, '2020-08-19 01:03:01', '2020-08-19 01:03:01'),
(209, 2, 87, '2020-08-19 01:03:01', '2020-08-19 01:03:01');

-- --------------------------------------------------------

--
-- Table structure for table `product_details`
--

CREATE TABLE `product_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product`, `image`, `active`, `created_at`, `updated_at`) VALUES
(61, 21, '5kIQAUry92068240515967190085f2bffa0ae8c6.png', 1, '2020-08-05 13:03:28', '2020-08-05 13:03:28'),
(62, 21, '0BPYHSWu161785295515967190095f2bffa10cd9a.png', 1, '2020-08-05 13:03:29', '2020-08-05 13:03:29'),
(63, 21, 'YEFJ53hW165484447215967190095f2bffa17cd64.png', 1, '2020-08-05 13:03:29', '2020-08-05 13:03:29'),
(64, 21, 'Y8makwWJ140817350715967190105f2bffa214983.jpeg', 1, '2020-08-05 13:03:30', '2020-08-05 13:03:30'),
(65, 22, 'cPYjcu4X47265121015967238935f2c12b553f6d.png', 1, '2020-08-05 14:24:53', '2020-08-05 14:24:53'),
(66, 22, '2F3WORmf173109890015967238935f2c12b5a296a.jpeg', 1, '2020-08-05 14:24:53', '2020-08-05 14:24:53'),
(67, 22, 'bOux4EzK139335852215967238935f2c12b5d970c.png', 1, '2020-08-05 14:24:53', '2020-08-05 14:24:53'),
(68, 22, 'b8fpvXrv198133948115967242445f2c141437dd5.png', 1, '2020-08-05 14:30:44', '2020-08-05 14:30:44'),
(69, 23, 'RvuugcwA53042203915967263355f2c1c3f967a4.png', 1, '2020-08-05 15:05:35', '2020-08-05 15:05:35'),
(70, 23, 'GEP8nLIn194508495315967263365f2c1c400bb22.jpeg', 1, '2020-08-05 15:05:36', '2020-08-05 15:05:36'),
(71, 23, 'cyg81RhF197635565515967263365f2c1c403d79d.jpeg', 1, '2020-08-05 15:05:36', '2020-08-05 15:05:36'),
(72, 24, 'rLduAYQX201281263315973838895f3624d10d725.png', 1, '2020-08-13 23:44:49', '2020-08-13 23:44:49'),
(73, 24, '8SnKxV55182149615115973838895f3624d19ef6b.png', 1, '2020-08-13 23:44:49', '2020-08-13 23:44:49'),
(74, 24, 'YFLm7HJU51098591815973838905f3624d210778.png', 1, '2020-08-13 23:44:50', '2020-08-13 23:44:50'),
(75, 25, 's68keDOT160257738915977687855f3c04516446e.jpeg', 1, '2020-08-18 10:39:45', '2020-08-18 10:39:45'),
(76, 26, 'w4n9gzGL170539536115977722715f3c11efe881a.jpeg', 1, '2020-08-18 11:37:51', '2020-08-18 11:37:51'),
(77, 27, 'zKAZ19U056536574815977725095f3c12dd7dc0a.jpeg', 1, '2020-08-18 11:41:49', '2020-08-18 11:41:49'),
(78, 28, 'nBMJ2N9W9591255915977726765f3c1384a3293.jpeg', 1, '2020-08-18 11:44:36', '2020-08-18 11:44:36'),
(79, 29, 'cToSaidD134243424315977728415f3c1429c541e.png', 1, '2020-08-18 11:47:21', '2020-08-18 11:47:21'),
(80, 30, 'R6i2PjUO151275418815977730255f3c14e13a97b.jpeg', 1, '2020-08-18 11:50:25', '2020-08-18 11:50:25'),
(81, 31, 'lijZ1D6E196331499515977731945f3c158ac227d.jpeg', 1, '2020-08-18 11:53:14', '2020-08-18 11:53:14'),
(82, 32, 'Eh0YvO9E82054582815977733595f3c162f32ea1.jpeg', 1, '2020-08-18 11:55:59', '2020-08-18 11:55:59'),
(83, 33, 'JJRLYf9980812293615977734635f3c1697e12a4.png', 1, '2020-08-18 11:57:43', '2020-08-18 11:57:43'),
(84, 34, 'AGhSOVMl30610174415977735825f3c170e0704b.jpeg', 1, '2020-08-18 11:59:42', '2020-08-18 11:59:42'),
(85, 35, '1pL9GwDP203120146415977737265f3c179edc4fc.png', 1, '2020-08-18 12:02:06', '2020-08-18 12:02:06'),
(86, 36, 'adl0sEBO27128218515977739745f3c1896c254e.jpeg', 1, '2020-08-18 12:06:14', '2020-08-18 12:06:14'),
(87, 37, 'p88yCMhc17017770115977741345f3c1936aa685.jpeg', 1, '2020-08-18 12:08:54', '2020-08-18 12:08:54'),
(88, 38, 'kRhiAn2Z11532718915977743015f3c19dd76a9b.jpeg', 1, '2020-08-18 12:11:41', '2020-08-18 12:11:41'),
(89, 39, 'IFQm1Sg214150015715977744715f3c1a87d9a8d.jpeg', 1, '2020-08-18 12:14:31', '2020-08-18 12:14:31'),
(90, 40, 'JfMWKvqb133168980515977746105f3c1b1255ab7.jpeg', 1, '2020-08-18 12:16:50', '2020-08-18 12:16:50'),
(91, 41, 'cfQBZNCG34183081015977748235f3c1be76521a.jpeg', 1, '2020-08-18 12:20:23', '2020-08-18 12:20:23'),
(92, 42, 'v4A0y6Xe27729516815977749665f3c1c765ef92.jpeg', 1, '2020-08-18 12:22:46', '2020-08-18 12:22:46'),
(93, 43, 'cbIFUNbY138335206715977750575f3c1cd1ce5cf.jpeg', 1, '2020-08-18 12:24:17', '2020-08-18 12:24:17'),
(94, 44, 'dIYBmK8r172342385015977751535f3c1d314fcb3.jpeg', 1, '2020-08-18 12:25:53', '2020-08-18 12:25:53'),
(95, 45, 'HQvXUu2s168333404815977752485f3c1d90d72b4.jpeg', 1, '2020-08-18 12:27:28', '2020-08-18 12:27:28'),
(96, 46, 'fKPB282953000544415977753475f3c1df380b87.jpeg', 1, '2020-08-18 12:29:07', '2020-08-18 12:29:07'),
(97, 47, 'QjcIOVHR133917624615977755205f3c1ea050730.jpeg', 1, '2020-08-18 12:32:00', '2020-08-18 12:32:00'),
(98, 48, 'aJPRd99w91459622015977756205f3c1f0486df5.jpeg', 1, '2020-08-18 12:33:40', '2020-08-18 12:33:40'),
(99, 49, 'R0vz8ZzB75552347215977756915f3c1f4b5c470.jpeg', 1, '2020-08-18 12:34:51', '2020-08-18 12:34:51'),
(100, 50, '8iTwnkmJ144928778915977758035f3c1fbb7213f.jpeg', 1, '2020-08-18 12:36:43', '2020-08-18 12:36:43'),
(101, 51, 'KZ0hCseO152293576715978162655f3cbdc99c17e.jpeg', 1, '2020-08-18 23:51:05', '2020-08-18 23:51:05'),
(102, 52, '4cnAGipL201227836415978163565f3cbe24c53f1.jpeg', 1, '2020-08-18 23:52:36', '2020-08-18 23:52:36'),
(103, 53, '9jB2y1Xl32722692515978164645f3cbe900ba90.jpeg', 1, '2020-08-18 23:54:24', '2020-08-18 23:54:24'),
(104, 54, 'qvEUAEFR27004648415978170415f3cc0d1b0158.jpeg', 1, '2020-08-19 00:04:01', '2020-08-19 00:04:01'),
(105, 55, 'Ec8rDz8h133438952115978171705f3cc15249de0.jpeg', 1, '2020-08-19 00:06:10', '2020-08-19 00:06:10'),
(106, 56, 'HKalZW1i129392333615978172785f3cc1be2f94d.jpeg', 1, '2020-08-19 00:07:58', '2020-08-19 00:07:58'),
(107, 57, 'F4iJMgwq19843963015978173645f3cc214340f9.jpeg', 1, '2020-08-19 00:09:24', '2020-08-19 00:09:24'),
(108, 58, 'qEEO6TxF198174312615978174215f3cc24db0388.jpeg', 1, '2020-08-19 00:10:21', '2020-08-19 00:10:21'),
(109, 59, '1QO9tqPw154427667715978174965f3cc298d7e09.jpeg', 1, '2020-08-19 00:11:36', '2020-08-19 00:11:36'),
(110, 60, 'YNEi8Ena97530679515978175645f3cc2dc824df.jpeg', 1, '2020-08-19 00:12:44', '2020-08-19 00:12:44'),
(111, 61, 'XyiYkvHw102837875315978176845f3cc3547a02d.jpeg', 1, '2020-08-19 00:14:44', '2020-08-19 00:14:44'),
(112, 62, 'V5GSrFLd137803258215978177605f3cc3a03134b.jpeg', 1, '2020-08-19 00:16:00', '2020-08-19 00:16:00'),
(113, 63, '9QoQKXsP160612921315978178395f3cc3ef21bdc.jpeg', 1, '2020-08-19 00:17:19', '2020-08-19 00:17:19'),
(114, 64, 'BlZGftNk31216895015978179725f3cc47480cf6.jpeg', 1, '2020-08-19 00:19:32', '2020-08-19 00:19:32'),
(115, 65, 'N2L7qYyq143669980515978181925f3cc55083b91.jpeg', 1, '2020-08-19 00:23:12', '2020-08-19 00:23:12'),
(116, 66, '9yBxiXo376264931915978182785f3cc5a692f66.jpeg', 1, '2020-08-19 00:24:38', '2020-08-19 00:24:38'),
(117, 67, '2QLNB2xI26826049015978183495f3cc5ed83b78.jpeg', 1, '2020-08-19 00:25:49', '2020-08-19 00:25:49'),
(118, 68, 'iXHh6k4C130129886415978184155f3cc62f0820a.jpeg', 1, '2020-08-19 00:26:55', '2020-08-19 00:26:55'),
(119, 69, 'YQ3cvUB7175632444815978187725f3cc794188e1.jpeg', 1, '2020-08-19 00:32:52', '2020-08-19 00:32:52'),
(120, 70, 'oB6DCXjQ112444125515978188445f3cc7dcf2c9e.jpeg', 1, '2020-08-19 00:34:04', '2020-08-19 00:34:04'),
(121, 71, 'eXtVn49c119075493215978190085f3cc8802187f.jpeg', 1, '2020-08-19 00:36:48', '2020-08-19 00:36:48'),
(122, 72, 'ddXb03l9193408034715978191835f3cc92fcab89.jpeg', 1, '2020-08-19 00:39:43', '2020-08-19 00:39:43'),
(123, 73, 'fxERypZK82152473515978192905f3cc99a4b91d.jpeg', 1, '2020-08-19 00:41:30', '2020-08-19 00:41:30'),
(124, 74, 'qhAN6G7j20327675115978193935f3cca016f782.jpeg', 1, '2020-08-19 00:43:13', '2020-08-19 00:43:13'),
(125, 75, 'w2qoMJ6T146077466515978196145f3ccade47e2a.jpeg', 1, '2020-08-19 00:46:54', '2020-08-19 00:46:54'),
(126, 76, 'xdBFDdbq169873493315978196805f3ccb200ae62.jpeg', 1, '2020-08-19 00:48:00', '2020-08-19 00:48:00'),
(128, 77, 'LzpD7R5c13684328815978198105f3ccba2cc720.jpeg', 1, '2020-08-19 00:50:10', '2020-08-19 00:50:10'),
(129, 78, 'avehSg2Y203229896615978198765f3ccbe4c3ba5.jpeg', 1, '2020-08-19 00:51:16', '2020-08-19 00:51:16'),
(130, 79, 'IYHHDs8A82736368815978200025f3ccc62bcff6.jpeg', 1, '2020-08-19 00:53:22', '2020-08-19 00:53:22'),
(131, 80, 'lf7jKRB991261463115978200705f3ccca60d7a7.jpeg', 1, '2020-08-19 00:54:30', '2020-08-19 00:54:30'),
(132, 81, 'fLw6haB2120961516415978201425f3ccceee3df2.jpeg', 1, '2020-08-19 00:55:42', '2020-08-19 00:55:42'),
(133, 82, 'n5g4Iqnu171061823615978202015f3ccd293f05e.jpeg', 1, '2020-08-19 00:56:41', '2020-08-19 00:56:41'),
(134, 83, 'LjR1YTdo164637114915978202835f3ccd7b77b90.jpeg', 1, '2020-08-19 00:58:03', '2020-08-19 00:58:03'),
(135, 84, 'nLDdK8l9192703473815978203435f3ccdb784fec.jpeg', 1, '2020-08-19 00:59:03', '2020-08-19 00:59:03'),
(136, 85, 'xyq8RQwL102541499515978204325f3cce10e4858.jpeg', 1, '2020-08-19 01:00:32', '2020-08-19 01:00:32'),
(137, 86, 'EJ3qr6Td54881298115978205285f3cce7075b22.jpeg', 1, '2020-08-19 01:02:08', '2020-08-19 01:02:08'),
(138, 87, 'VBHywcTi98362614715978206045f3ccebc2eb96.jpeg', 1, '2020-08-19 01:03:24', '2020-08-19 01:03:24');

-- --------------------------------------------------------

--
-- Table structure for table `product_options`
--

CREATE TABLE `product_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_options`
--

INSERT INTO `product_options` (`id`, `product`, `name`, `created_at`, `updated_at`) VALUES
(33, 22, 'bundle', '2020-08-06 02:31:43', '2020-08-06 02:31:43'),
(34, 22, 'color', '2020-08-06 02:34:26', '2020-08-06 02:34:26'),
(35, 22, 'size', '2020-08-06 02:40:25', '2020-08-06 02:40:25'),
(36, 24, 'color', '2020-08-13 23:45:24', '2020-08-13 23:45:24'),
(37, 25, 'color', '2020-08-18 10:40:11', '2020-08-18 10:40:11'),
(38, 26, 'color', '2020-08-18 11:38:27', '2020-08-18 11:38:27'),
(39, 27, 'color', '2020-08-18 11:42:06', '2020-08-18 11:42:06'),
(40, 28, 'color', '2020-08-18 11:44:49', '2020-08-18 11:44:49'),
(41, 29, 'color', '2020-08-18 11:47:44', '2020-08-18 11:47:44'),
(42, 30, 'color', '2020-08-18 11:50:40', '2020-08-18 11:50:40'),
(43, 31, 'color', '2020-08-18 11:53:26', '2020-08-18 11:53:26'),
(44, 32, 'color', '2020-08-18 11:56:07', '2020-08-18 11:56:07'),
(45, 33, 'color', '2020-08-18 11:57:53', '2020-08-18 11:57:53'),
(46, 34, 'color', '2020-08-18 11:59:56', '2020-08-18 11:59:56'),
(47, 35, 'color', '2020-08-18 12:01:38', '2020-08-18 12:01:38'),
(48, 36, 'color', '2020-08-18 12:06:24', '2020-08-18 12:06:24'),
(49, 37, 'color', '2020-08-18 12:07:50', '2020-08-18 12:07:50'),
(50, 38, 'color', '2020-08-18 12:11:56', '2020-08-18 12:11:56'),
(51, 39, 'color', '2020-08-18 12:14:42', '2020-08-18 12:14:42'),
(52, 54, 'color', '2020-08-19 00:04:13', '2020-08-19 00:04:13'),
(53, 56, 'color', '2020-08-19 00:08:06', '2020-08-19 00:08:06');

-- --------------------------------------------------------

--
-- Table structure for table `product_option_details`
--

CREATE TABLE `product_option_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `option` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_option_details`
--

INSERT INTO `product_option_details` (`id`, `option`, `name`, `price`, `created_at`, `updated_at`) VALUES
(50, 33, 'television + speaker', 12000.00, '2020-08-06 02:31:43', '2020-08-06 02:31:43'),
(51, 33, 'television', NULL, '2020-08-06 02:31:43', '2020-08-06 02:31:43'),
(52, 33, 'television + land', 2000.00, '2020-08-06 02:31:43', '2020-08-06 02:31:43'),
(53, 34, 'blue', 2000.00, '2020-08-06 02:34:26', '2020-08-06 02:34:26'),
(54, 34, 'pink', NULL, '2020-08-06 02:34:26', '2020-08-06 02:34:26'),
(55, 34, 'white', 1000.00, '2020-08-06 02:34:26', '2020-08-06 02:34:26'),
(56, 35, '55\"', NULL, '2020-08-06 02:40:25', '2020-08-06 02:40:25'),
(57, 35, '58\"', 5000.00, '2020-08-06 02:40:25', '2020-08-06 02:40:25'),
(58, 36, 'red', NULL, '2020-08-13 23:45:24', '2020-08-13 23:45:24'),
(59, 36, 'blue', 1000.00, '2020-08-13 23:45:24', '2020-08-13 23:45:24'),
(60, 37, 'Blue', NULL, '2020-08-18 10:40:11', '2020-08-18 10:40:11'),
(61, 38, 'Mystic Black', NULL, '2020-08-18 11:38:28', '2020-08-18 11:38:28'),
(62, 39, 'Black', NULL, '2020-08-18 11:42:07', '2020-08-18 11:42:07'),
(63, 40, 'Black', NULL, '2020-08-18 11:44:49', '2020-08-18 11:44:49'),
(64, 41, 'Onyx Black', NULL, '2020-08-18 11:47:45', '2020-08-18 11:47:45'),
(65, 42, 'Aura Glow', NULL, '2020-08-18 11:50:40', '2020-08-18 11:50:40'),
(66, 43, 'Gray', NULL, '2020-08-18 11:53:26', '2020-08-18 11:53:26'),
(67, 44, 'Black', NULL, '2020-08-18 11:56:07', '2020-08-18 11:56:07'),
(68, 45, 'Black', NULL, '2020-08-18 11:57:53', '2020-08-18 11:57:53'),
(69, 46, 'White', NULL, '2020-08-18 11:59:56', '2020-08-18 11:59:56'),
(70, 47, 'Black', NULL, '2020-08-18 12:01:38', '2020-08-18 12:01:38'),
(71, 48, 'Blue', NULL, '2020-08-18 12:06:25', '2020-08-18 12:06:25'),
(72, 49, 'Blue', NULL, '2020-08-18 12:07:50', '2020-08-18 12:07:50'),
(73, 50, 'Blue', NULL, '2020-08-18 12:11:56', '2020-08-18 12:11:56'),
(74, 50, 'Black', NULL, '2020-08-18 12:11:56', '2020-08-18 12:11:56'),
(75, 51, 'Red', NULL, '2020-08-18 12:14:42', '2020-08-18 12:14:42'),
(76, 52, 'Blue', NULL, '2020-08-19 00:04:13', '2020-08-19 00:04:13'),
(77, 53, 'Black', NULL, '2020-08-19 00:08:06', '2020-08-19 00:08:06');

-- --------------------------------------------------------

--
-- Table structure for table `product_option_images`
--

CREATE TABLE `product_option_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `option_details` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_option_images`
--

INSERT INTO `product_option_images` (`id`, `option_details`, `image`, `created_at`, `updated_at`) VALUES
(63, 50, 'n0RzU5FY144311013115967248405f2c1668432fd.jpeg', '2020-08-06 02:40:40', '2020-08-06 02:40:40'),
(64, 51, 'Pqjs2uCJ136788480515967248435f2c166bf3eee.png', '2020-08-06 02:40:44', '2020-08-06 02:40:44'),
(65, 52, '0JPkRNnw117941097815967248475f2c166f6508f.png', '2020-08-06 02:40:47', '2020-08-06 02:40:47'),
(66, 53, 'WQxQ7A7L114118940215967248535f2c16755491a.png', '2020-08-06 02:40:53', '2020-08-06 02:40:53'),
(67, 54, 'x1Dc0NpF119453211215967248565f2c1678b287e.jpeg', '2020-08-06 02:40:56', '2020-08-06 02:40:56'),
(68, 55, 'RhsoXMZ989567613115967248615f2c167dc0ae1.jpeg', '2020-08-06 02:41:01', '2020-08-06 02:41:01'),
(69, 56, 'k76gd4BQ156145126715967248655f2c1681c4b16.png', '2020-08-06 02:41:05', '2020-08-06 02:41:05'),
(70, 57, 'F4YnLL1k170968416415967248705f2c1686c19b3.jpeg', '2020-08-06 02:41:10', '2020-08-06 02:41:10'),
(71, 58, 'ip9xGs2t121147415015973839365f3625001b1ca.png', '2020-08-13 23:45:36', '2020-08-13 23:45:36'),
(72, 59, 'gRTDQvNF185055783815973839485f36250cb9669.png', '2020-08-13 23:45:48', '2020-08-13 23:45:48'),
(73, 60, 'co1jHEe0167089352015977688265f3c047ac2fe8.jpeg', '2020-08-18 10:40:26', '2020-08-18 10:40:26');

-- --------------------------------------------------------

--
-- Table structure for table `product_shops`
--

CREATE TABLE `product_shops` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product` bigint(20) UNSIGNED NOT NULL,
  `shop` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_shops`
--

INSERT INTO `product_shops` (`id`, `product`, `shop`, `deleted_at`, `created_at`, `updated_at`) VALUES
(24, 21, 1, NULL, '2020-08-06 01:03:17', '2020-08-06 01:03:17'),
(25, 22, 2, NULL, '2020-08-06 02:24:42', '2020-08-06 02:24:42'),
(26, 23, 1, NULL, '2020-08-06 03:05:21', '2020-08-06 03:05:21'),
(27, 24, 2, NULL, '2020-08-13 23:44:14', '2020-08-13 23:44:14'),
(28, 25, 3, NULL, '2020-08-18 10:39:21', '2020-08-18 10:39:21'),
(29, 26, 1, NULL, '2020-08-18 11:37:36', '2020-08-18 11:37:36'),
(30, 27, 1, NULL, '2020-08-18 11:41:32', '2020-08-18 11:41:32'),
(31, 28, 1, NULL, '2020-08-18 11:44:13', '2020-08-18 11:44:13'),
(32, 29, 1, NULL, '2020-08-18 11:47:09', '2020-08-18 11:47:09'),
(33, 29, 2, NULL, '2020-08-18 11:47:09', '2020-08-18 11:47:09'),
(34, 29, 3, NULL, '2020-08-18 11:47:09', '2020-08-18 11:47:09'),
(35, 30, 1, NULL, '2020-08-18 11:49:17', '2020-08-18 11:49:17'),
(36, 30, 2, NULL, '2020-08-18 11:49:17', '2020-08-18 11:49:17'),
(37, 30, 3, NULL, '2020-08-18 11:49:17', '2020-08-18 11:49:17'),
(38, 31, 1, NULL, '2020-08-18 11:53:02', '2020-08-18 11:53:02'),
(39, 31, 2, NULL, '2020-08-18 11:53:02', '2020-08-18 11:53:02'),
(40, 31, 3, NULL, '2020-08-18 11:53:02', '2020-08-18 11:53:02'),
(41, 32, 1, NULL, '2020-08-18 11:55:51', '2020-08-18 11:55:51'),
(42, 32, 2, NULL, '2020-08-18 11:55:51', '2020-08-18 11:55:51'),
(43, 32, 3, NULL, '2020-08-18 11:55:52', '2020-08-18 11:55:52'),
(44, 33, 1, NULL, '2020-08-18 11:57:34', '2020-08-18 11:57:34'),
(45, 33, 2, NULL, '2020-08-18 11:57:35', '2020-08-18 11:57:35'),
(46, 33, 3, NULL, '2020-08-18 11:57:35', '2020-08-18 11:57:35'),
(47, 34, 1, NULL, '2020-08-18 11:59:28', '2020-08-18 11:59:28'),
(48, 34, 2, NULL, '2020-08-18 11:59:28', '2020-08-18 11:59:28'),
(49, 34, 3, NULL, '2020-08-18 11:59:28', '2020-08-18 11:59:28'),
(50, 35, 1, NULL, '2020-08-18 12:01:22', '2020-08-18 12:01:22'),
(51, 35, 2, NULL, '2020-08-18 12:01:22', '2020-08-18 12:01:22'),
(52, 35, 3, NULL, '2020-08-18 12:01:23', '2020-08-18 12:01:23'),
(53, 36, 1, NULL, '2020-08-18 12:05:30', '2020-08-18 12:05:30'),
(54, 36, 2, NULL, '2020-08-18 12:05:30', '2020-08-18 12:05:30'),
(55, 36, 3, NULL, '2020-08-18 12:05:31', '2020-08-18 12:05:31'),
(56, 37, 1, NULL, '2020-08-18 12:07:37', '2020-08-18 12:07:37'),
(57, 37, 2, NULL, '2020-08-18 12:07:37', '2020-08-18 12:07:37'),
(58, 37, 3, NULL, '2020-08-18 12:07:37', '2020-08-18 12:07:37'),
(59, 38, 1, NULL, '2020-08-18 12:11:29', '2020-08-18 12:11:29'),
(60, 38, 2, NULL, '2020-08-18 12:11:30', '2020-08-18 12:11:30'),
(61, 38, 3, NULL, '2020-08-18 12:11:30', '2020-08-18 12:11:30'),
(62, 39, 1, NULL, '2020-08-18 12:14:11', '2020-08-18 12:14:11'),
(63, 39, 2, NULL, '2020-08-18 12:14:11', '2020-08-18 12:14:11'),
(64, 40, 1, NULL, '2020-08-18 12:16:40', '2020-08-18 12:16:40'),
(65, 41, 1, NULL, '2020-08-18 12:20:15', '2020-08-18 12:20:15'),
(66, 42, 2, NULL, '2020-08-18 12:22:03', '2020-08-18 12:22:03'),
(67, 43, 3, NULL, '2020-08-18 12:23:57', '2020-08-18 12:23:57'),
(68, 44, 2, NULL, '2020-08-18 12:25:38', '2020-08-18 12:25:38'),
(69, 45, 3, NULL, '2020-08-18 12:27:10', '2020-08-18 12:27:10'),
(70, 46, 2, NULL, '2020-08-18 12:28:48', '2020-08-18 12:28:48'),
(71, 47, 3, NULL, '2020-08-18 12:31:48', '2020-08-18 12:31:48'),
(72, 48, 3, NULL, '2020-08-18 12:33:32', '2020-08-18 12:33:32'),
(73, 49, 3, NULL, '2020-08-18 12:34:39', '2020-08-18 12:34:39'),
(74, 50, 3, NULL, '2020-08-18 12:36:20', '2020-08-18 12:36:20'),
(75, 51, 1, NULL, '2020-08-18 23:50:38', '2020-08-18 23:50:38'),
(76, 52, 1, NULL, '2020-08-18 23:52:20', '2020-08-18 23:52:20'),
(77, 53, 2, NULL, '2020-08-18 23:53:48', '2020-08-18 23:53:48'),
(78, 54, 2, NULL, '2020-08-19 00:03:41', '2020-08-19 00:03:41'),
(79, 55, 3, NULL, '2020-08-19 00:05:54', '2020-08-19 00:05:54'),
(80, 56, 3, NULL, '2020-08-19 00:07:49', '2020-08-19 00:07:49'),
(81, 57, 3, NULL, '2020-08-19 00:09:14', '2020-08-19 00:09:14'),
(82, 58, 3, NULL, '2020-08-19 00:10:12', '2020-08-19 00:10:12'),
(83, 59, 3, NULL, '2020-08-19 00:11:27', '2020-08-19 00:11:27'),
(84, 60, 2, NULL, '2020-08-19 00:12:28', '2020-08-19 00:12:28'),
(85, 61, 2, NULL, '2020-08-19 00:14:27', '2020-08-19 00:14:27'),
(86, 62, 2, NULL, '2020-08-19 00:15:52', '2020-08-19 00:15:52'),
(87, 63, 2, NULL, '2020-08-19 00:17:10', '2020-08-19 00:17:10'),
(88, 64, 2, NULL, '2020-08-19 00:18:23', '2020-08-19 00:18:23'),
(89, 65, 2, NULL, '2020-08-19 00:23:03', '2020-08-19 00:23:03'),
(90, 66, 3, NULL, '2020-08-19 00:24:20', '2020-08-19 00:24:20'),
(91, 67, 3, NULL, '2020-08-19 00:25:38', '2020-08-19 00:25:38'),
(92, 68, 3, NULL, '2020-08-19 00:26:43', '2020-08-19 00:26:43'),
(93, 69, 3, NULL, '2020-08-19 00:32:44', '2020-08-19 00:32:44'),
(94, 70, 3, NULL, '2020-08-19 00:33:57', '2020-08-19 00:33:57'),
(95, 71, 3, NULL, '2020-08-19 00:36:39', '2020-08-19 00:36:39'),
(96, 72, 1, NULL, '2020-08-19 00:39:19', '2020-08-19 00:39:19'),
(97, 73, 1, NULL, '2020-08-19 00:41:15', '2020-08-19 00:41:15'),
(98, 74, 1, NULL, '2020-08-19 00:42:58', '2020-08-19 00:42:58'),
(99, 75, 1, NULL, '2020-08-19 00:46:41', '2020-08-19 00:46:41'),
(100, 76, 1, NULL, '2020-08-19 00:47:46', '2020-08-19 00:47:46'),
(101, 77, 1, NULL, '2020-08-19 00:49:04', '2020-08-19 00:49:04'),
(102, 78, 1, NULL, '2020-08-19 00:51:08', '2020-08-19 00:51:08'),
(103, 79, 3, NULL, '2020-08-19 00:53:04', '2020-08-19 00:53:04'),
(104, 80, 3, NULL, '2020-08-19 00:54:19', '2020-08-19 00:54:19'),
(105, 81, 3, NULL, '2020-08-19 00:55:31', '2020-08-19 00:55:31'),
(106, 82, 3, NULL, '2020-08-19 00:56:34', '2020-08-19 00:56:34'),
(107, 83, 3, NULL, '2020-08-19 00:57:51', '2020-08-19 00:57:51'),
(108, 84, 3, NULL, '2020-08-19 00:58:52', '2020-08-19 00:58:52'),
(109, 85, 3, NULL, '2020-08-19 01:00:14', '2020-08-19 01:00:14'),
(110, 86, 3, NULL, '2020-08-19 01:01:22', '2020-08-19 01:01:22'),
(111, 87, 3, NULL, '2020-08-19 01:03:01', '2020-08-19 01:03:01');

-- --------------------------------------------------------

--
-- Table structure for table `product_shop_locations`
--

CREATE TABLE `product_shop_locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_shop` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `stock` tinyint(1) NOT NULL DEFAULT '0',
  `location` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_shop_locations`
--

INSERT INTO `product_shop_locations` (`id`, `product_shop`, `quantity`, `stock`, `location`, `created_at`, `updated_at`) VALUES
(54, 24, 122, 1, 1, '2020-08-06 01:03:17', '2020-08-06 01:03:17'),
(55, 24, 122, 1, 6, '2020-08-06 01:03:17', '2020-08-06 01:03:17'),
(56, 24, 122, 1, 7, '2020-08-06 01:03:17', '2020-08-06 01:03:17'),
(57, 25, 12, 1, 2, '2020-08-06 02:24:42', '2020-08-06 02:24:42'),
(58, 25, 12, 1, 3, '2020-08-06 02:24:42', '2020-08-06 02:24:42'),
(59, 25, 12, 1, 4, '2020-08-06 02:24:42', '2020-08-06 02:24:42'),
(60, 26, 50, 1, 1, '2020-08-06 03:05:21', '2020-08-06 03:05:21'),
(61, 26, 40, 1, 6, '2020-08-06 03:05:21', '2020-08-06 03:05:21'),
(62, 26, 20, 1, 7, '2020-08-06 03:05:21', '2020-08-06 03:05:21'),
(63, 27, 12, 1, 2, '2020-08-13 23:44:14', '2020-08-13 23:44:14'),
(64, 27, 12, 1, 3, '2020-08-13 23:44:14', '2020-08-13 23:44:14'),
(65, 27, 12, 1, 4, '2020-08-13 23:44:14', '2020-08-13 23:44:14'),
(66, 28, 10, 1, 8, '2020-08-18 10:39:21', '2020-08-18 10:39:21'),
(67, 29, 20, 1, 1, '2020-08-18 11:37:37', '2020-08-18 11:37:37'),
(68, 29, 10, 0, 6, '2020-08-18 11:37:37', '2020-08-18 11:37:37'),
(69, 29, 10, 0, 7, '2020-08-18 11:37:37', '2020-08-18 11:37:37'),
(70, 30, 10, 1, 1, '2020-08-18 11:41:32', '2020-08-18 11:41:32'),
(71, 30, 10, 0, 6, '2020-08-18 11:41:32', '2020-08-18 11:41:32'),
(72, 30, 10, 0, 7, '2020-08-18 11:41:32', '2020-08-18 11:41:32'),
(73, 31, 10, 1, 1, '2020-08-18 11:44:13', '2020-08-18 11:44:13'),
(74, 32, 10, 1, 1, '2020-08-18 11:47:09', '2020-08-18 11:47:09'),
(75, 33, 20, 1, 2, '2020-08-18 11:47:09', '2020-08-18 11:47:09'),
(76, 33, 10, 1, 4, '2020-08-18 11:47:09', '2020-08-18 11:47:09'),
(77, 34, 10, 1, 8, '2020-08-18 11:47:09', '2020-08-18 11:47:09'),
(78, 35, 10, 1, 1, '2020-08-18 11:49:17', '2020-08-18 11:49:17'),
(79, 36, 10, 1, 4, '2020-08-18 11:49:17', '2020-08-18 11:49:17'),
(80, 37, 10, 1, 8, '2020-08-18 11:49:17', '2020-08-18 11:49:17'),
(81, 38, 10, 1, 1, '2020-08-18 11:53:02', '2020-08-18 11:53:02'),
(82, 38, 10, 1, 7, '2020-08-18 11:53:02', '2020-08-18 11:53:02'),
(83, 39, 10, 1, 2, '2020-08-18 11:53:02', '2020-08-18 11:53:02'),
(84, 40, 10, 1, 8, '2020-08-18 11:53:02', '2020-08-18 11:53:02'),
(85, 41, 10, 1, 1, '2020-08-18 11:55:51', '2020-08-18 11:55:51'),
(86, 41, 10, 1, 6, '2020-08-18 11:55:51', '2020-08-18 11:55:51'),
(87, 41, 10, 1, 7, '2020-08-18 11:55:51', '2020-08-18 11:55:51'),
(88, 42, 1, 1, 2, '2020-08-18 11:55:51', '2020-08-18 11:55:51'),
(89, 42, 10, 1, 3, '2020-08-18 11:55:51', '2020-08-18 11:55:51'),
(90, 42, 20, 1, 4, '2020-08-18 11:55:52', '2020-08-18 11:55:52'),
(91, 43, 10, 1, 8, '2020-08-18 11:55:52', '2020-08-18 11:55:52'),
(92, 44, 10, 1, 1, '2020-08-18 11:57:35', '2020-08-18 11:57:35'),
(93, 45, 10, 1, 2, '2020-08-18 11:57:35', '2020-08-18 11:57:35'),
(94, 46, 1, 1, 8, '2020-08-18 11:57:35', '2020-08-18 11:57:35'),
(95, 47, 10, 1, 7, '2020-08-18 11:59:28', '2020-08-18 11:59:28'),
(96, 48, 10, 1, 3, '2020-08-18 11:59:28', '2020-08-18 11:59:28'),
(97, 49, 10, 1, 8, '2020-08-18 11:59:28', '2020-08-18 11:59:28'),
(98, 50, 10, 1, 7, '2020-08-18 12:01:22', '2020-08-18 12:01:22'),
(99, 51, 1, 1, 4, '2020-08-18 12:01:23', '2020-08-18 12:01:23'),
(100, 52, 10, 1, 8, '2020-08-18 12:01:23', '2020-08-18 12:01:23'),
(101, 53, 10, 1, 6, '2020-08-18 12:05:30', '2020-08-18 12:05:30'),
(102, 54, 10, 1, 2, '2020-08-18 12:05:30', '2020-08-18 12:05:30'),
(103, 55, 10, 1, 8, '2020-08-18 12:05:31', '2020-08-18 12:05:31'),
(104, 56, 10, 1, 7, '2020-08-18 12:07:37', '2020-08-18 12:07:37'),
(105, 57, 10, 1, 2, '2020-08-18 12:07:37', '2020-08-18 12:07:37'),
(106, 58, 10, 1, 8, '2020-08-18 12:07:37', '2020-08-18 12:07:37'),
(107, 59, 10, 1, 1, '2020-08-18 12:11:29', '2020-08-18 12:11:29'),
(108, 59, 10, 1, 6, '2020-08-18 12:11:29', '2020-08-18 12:11:29'),
(109, 59, 10, 1, 7, '2020-08-18 12:11:29', '2020-08-18 12:11:29'),
(110, 60, 10, 1, 2, '2020-08-18 12:11:30', '2020-08-18 12:11:30'),
(111, 60, 10, 0, 3, '2020-08-18 12:11:30', '2020-08-18 12:11:30'),
(112, 60, 10, 0, 4, '2020-08-18 12:11:30', '2020-08-18 12:11:30'),
(113, 61, 10, 0, 8, '2020-08-18 12:11:30', '2020-08-18 12:11:30'),
(114, 62, 10, 0, 7, '2020-08-18 12:14:11', '2020-08-18 12:14:11'),
(115, 63, 10, 0, 4, '2020-08-18 12:14:11', '2020-08-18 12:14:11'),
(116, 64, 10, 0, 1, '2020-08-18 12:16:40', '2020-08-18 12:16:40'),
(117, 65, 10, 1, 1, '2020-08-18 12:20:15', '2020-08-18 12:20:15'),
(118, 65, 10, 0, 6, '2020-08-18 12:20:15', '2020-08-18 12:20:15'),
(119, 65, 10, 0, 7, '2020-08-18 12:20:15', '2020-08-18 12:20:15'),
(120, 66, 10, 0, 2, '2020-08-18 12:22:03', '2020-08-18 12:22:03'),
(121, 66, 10, 0, 3, '2020-08-18 12:22:03', '2020-08-18 12:22:03'),
(122, 66, 10, 0, 4, '2020-08-18 12:22:03', '2020-08-18 12:22:03'),
(123, 67, 10, 0, 8, '2020-08-18 12:23:57', '2020-08-18 12:23:57'),
(124, 68, 10, 0, 2, '2020-08-18 12:25:38', '2020-08-18 12:25:38'),
(125, 68, 10, 0, 3, '2020-08-18 12:25:38', '2020-08-18 12:25:38'),
(126, 68, 30, 0, 4, '2020-08-18 12:25:38', '2020-08-18 12:25:38'),
(127, 69, 10, 1, 8, '2020-08-18 12:27:10', '2020-08-18 12:27:10'),
(128, 70, 10, 0, 2, '2020-08-18 12:28:48', '2020-08-18 12:28:48'),
(129, 70, 10, 0, 3, '2020-08-18 12:28:48', '2020-08-18 12:28:48'),
(130, 70, 10, 0, 4, '2020-08-18 12:28:48', '2020-08-18 12:28:48'),
(131, 71, 10, 1, 8, '2020-08-18 12:31:48', '2020-08-18 12:31:48'),
(132, 72, 10, 0, 8, '2020-08-18 12:33:32', '2020-08-18 12:33:32'),
(133, 73, 10, 0, 8, '2020-08-18 12:34:39', '2020-08-18 12:34:39'),
(134, 74, 10, 0, 8, '2020-08-18 12:36:20', '2020-08-18 12:36:20'),
(135, 75, 10, 0, 1, '2020-08-18 23:50:38', '2020-08-18 23:50:38'),
(136, 75, 10, 0, 6, '2020-08-18 23:50:38', '2020-08-18 23:50:38'),
(137, 75, 10, 0, 7, '2020-08-18 23:50:38', '2020-08-18 23:50:38'),
(138, 76, 10, 0, 1, '2020-08-18 23:52:21', '2020-08-18 23:52:21'),
(139, 76, 10, 0, 6, '2020-08-18 23:52:21', '2020-08-18 23:52:21'),
(140, 77, 10, 0, 2, '2020-08-18 23:53:48', '2020-08-18 23:53:48'),
(141, 77, 10, 0, 3, '2020-08-18 23:53:48', '2020-08-18 23:53:48'),
(142, 77, 10, 0, 4, '2020-08-18 23:53:48', '2020-08-18 23:53:48'),
(143, 78, 10, 0, 2, '2020-08-19 00:03:41', '2020-08-19 00:03:41'),
(144, 78, 10, 0, 3, '2020-08-19 00:03:41', '2020-08-19 00:03:41'),
(145, 78, 10, 0, 4, '2020-08-19 00:03:41', '2020-08-19 00:03:41'),
(146, 79, 20, 0, 8, '2020-08-19 00:05:54', '2020-08-19 00:05:54'),
(147, 80, 10, 0, 8, '2020-08-19 00:07:49', '2020-08-19 00:07:49'),
(148, 81, 10, 0, 8, '2020-08-19 00:09:14', '2020-08-19 00:09:14'),
(149, 82, 10, 0, 8, '2020-08-19 00:10:12', '2020-08-19 00:10:12'),
(150, 83, 10, 0, 8, '2020-08-19 00:11:27', '2020-08-19 00:11:27'),
(151, 84, 10, 0, 2, '2020-08-19 00:12:28', '2020-08-19 00:12:28'),
(152, 84, 10, 0, 3, '2020-08-19 00:12:28', '2020-08-19 00:12:28'),
(153, 84, 10, 0, 4, '2020-08-19 00:12:28', '2020-08-19 00:12:28'),
(154, 85, 10, 0, 2, '2020-08-19 00:14:27', '2020-08-19 00:14:27'),
(155, 85, 10, 0, 3, '2020-08-19 00:14:27', '2020-08-19 00:14:27'),
(156, 85, 10, 0, 4, '2020-08-19 00:14:27', '2020-08-19 00:14:27'),
(157, 86, 10, 0, 2, '2020-08-19 00:15:52', '2020-08-19 00:15:52'),
(158, 86, 10, 0, 3, '2020-08-19 00:15:52', '2020-08-19 00:15:52'),
(159, 86, 10, 0, 4, '2020-08-19 00:15:52', '2020-08-19 00:15:52'),
(160, 87, 10, 0, 2, '2020-08-19 00:17:10', '2020-08-19 00:17:10'),
(161, 87, 10, 0, 3, '2020-08-19 00:17:10', '2020-08-19 00:17:10'),
(162, 87, 10, 1, 4, '2020-08-19 00:17:10', '2020-08-19 00:17:10'),
(163, 88, 10, 0, 2, '2020-08-19 00:18:23', '2020-08-19 00:18:23'),
(164, 88, 10, 0, 3, '2020-08-19 00:18:23', '2020-08-19 00:18:23'),
(165, 88, 10, 0, 4, '2020-08-19 00:18:23', '2020-08-19 00:18:23'),
(166, 89, 10, 0, 2, '2020-08-19 00:23:03', '2020-08-19 00:23:03'),
(167, 89, 10, 0, 3, '2020-08-19 00:23:03', '2020-08-19 00:23:03'),
(168, 89, 10, 0, 4, '2020-08-19 00:23:03', '2020-08-19 00:23:03'),
(169, 90, 10, 0, 8, '2020-08-19 00:24:20', '2020-08-19 00:24:20'),
(170, 91, 10, 0, 8, '2020-08-19 00:25:38', '2020-08-19 00:25:38'),
(171, 92, 10, 0, 8, '2020-08-19 00:26:43', '2020-08-19 00:26:43'),
(172, 93, 10, 0, 8, '2020-08-19 00:32:44', '2020-08-19 00:32:44'),
(173, 94, 10, 0, 8, '2020-08-19 00:33:57', '2020-08-19 00:33:57'),
(174, 95, 10, 0, 8, '2020-08-19 00:36:39', '2020-08-19 00:36:39'),
(175, 96, 10, 0, 1, '2020-08-19 00:39:19', '2020-08-19 00:39:19'),
(176, 96, 10, 0, 6, '2020-08-19 00:39:19', '2020-08-19 00:39:19'),
(177, 96, 10, 0, 7, '2020-08-19 00:39:19', '2020-08-19 00:39:19'),
(178, 97, 10, 0, 1, '2020-08-19 00:41:15', '2020-08-19 00:41:15'),
(179, 97, 10, 0, 6, '2020-08-19 00:41:15', '2020-08-19 00:41:15'),
(180, 97, 10, 0, 7, '2020-08-19 00:41:15', '2020-08-19 00:41:15'),
(181, 98, 10, 0, 1, '2020-08-19 00:42:58', '2020-08-19 00:42:58'),
(182, 98, 10, 0, 6, '2020-08-19 00:42:59', '2020-08-19 00:42:59'),
(183, 98, 10, 0, 7, '2020-08-19 00:42:59', '2020-08-19 00:42:59'),
(184, 99, 10, 0, 1, '2020-08-19 00:46:41', '2020-08-19 00:46:41'),
(185, 99, 10, 0, 6, '2020-08-19 00:46:41', '2020-08-19 00:46:41'),
(186, 99, 10, 0, 7, '2020-08-19 00:46:41', '2020-08-19 00:46:41'),
(187, 100, 10, 0, 1, '2020-08-19 00:47:46', '2020-08-19 00:47:46'),
(188, 100, 10, 0, 6, '2020-08-19 00:47:46', '2020-08-19 00:47:46'),
(189, 100, 10, 0, 7, '2020-08-19 00:47:46', '2020-08-19 00:47:46'),
(190, 101, 10, 0, 1, '2020-08-19 00:49:04', '2020-08-19 00:49:04'),
(191, 101, 10, 0, 6, '2020-08-19 00:49:04', '2020-08-19 00:49:04'),
(192, 101, 10, 0, 7, '2020-08-19 00:49:04', '2020-08-19 00:49:04'),
(193, 102, 10, 0, 1, '2020-08-19 00:51:08', '2020-08-19 00:51:08'),
(194, 102, 10, 0, 6, '2020-08-19 00:51:08', '2020-08-19 00:51:08'),
(195, 102, 10, 0, 7, '2020-08-19 00:51:09', '2020-08-19 00:51:09'),
(196, 103, 10, 0, 8, '2020-08-19 00:53:04', '2020-08-19 00:53:04'),
(197, 104, 10, 0, 8, '2020-08-19 00:54:19', '2020-08-19 00:54:19'),
(198, 105, 10, 0, 8, '2020-08-19 00:55:31', '2020-08-19 00:55:31'),
(199, 106, 10, 0, 8, '2020-08-19 00:56:34', '2020-08-19 00:56:34'),
(200, 107, 10, 0, 8, '2020-08-19 00:57:51', '2020-08-19 00:57:51'),
(201, 108, 10, 0, 8, '2020-08-19 00:58:52', '2020-08-19 00:58:52'),
(202, 109, 10, 0, 8, '2020-08-19 01:00:15', '2020-08-19 01:00:15'),
(203, 110, 10, 0, 8, '2020-08-19 01:01:22', '2020-08-19 01:01:22'),
(204, 111, 10, 0, 8, '2020-08-19 01:03:02', '2020-08-19 01:03:02');

-- --------------------------------------------------------

--
-- Table structure for table `product_tags`
--

CREATE TABLE `product_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product` bigint(20) UNSIGNED NOT NULL,
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_tags`
--

INSERT INTO `product_tags` (`id`, `product`, `tag`, `created_at`, `updated_at`) VALUES
(152, 21, 'a', '2020-08-06 01:03:17', '2020-08-06 01:03:17'),
(153, 21, 's', '2020-08-06 01:03:17', '2020-08-06 01:03:17'),
(154, 21, 'd', '2020-08-06 01:03:17', '2020-08-06 01:03:17'),
(155, 21, 'f', '2020-08-06 01:03:17', '2020-08-06 01:03:17'),
(156, 21, 'g', '2020-08-06 01:03:17', '2020-08-06 01:03:17'),
(162, 23, 'a', '2020-08-06 03:05:21', '2020-08-06 03:05:21'),
(163, 23, 's', '2020-08-06 03:05:21', '2020-08-06 03:05:21'),
(164, 23, 'd', '2020-08-06 03:05:21', '2020-08-06 03:05:21'),
(165, 23, 'f', '2020-08-06 03:05:21', '2020-08-06 03:05:21'),
(166, 23, 'g', '2020-08-06 03:05:21', '2020-08-06 03:05:21'),
(172, 22, 'a', '2020-08-06 13:23:03', '2020-08-06 13:23:03'),
(173, 22, 's', '2020-08-06 13:23:03', '2020-08-06 13:23:03'),
(174, 22, 'd', '2020-08-06 13:23:03', '2020-08-06 13:23:03'),
(175, 22, 'f', '2020-08-06 13:23:03', '2020-08-06 13:23:03'),
(176, 22, 'g', '2020-08-06 13:23:03', '2020-08-06 13:23:03'),
(177, 24, 'a', '2020-08-13 23:44:14', '2020-08-13 23:44:14'),
(178, 24, 's', '2020-08-13 23:44:14', '2020-08-13 23:44:14'),
(179, 24, 'd', '2020-08-13 23:44:14', '2020-08-13 23:44:14'),
(180, 24, 'f', '2020-08-13 23:44:14', '2020-08-13 23:44:14'),
(181, 24, 'g', '2020-08-13 23:44:14', '2020-08-13 23:44:14'),
(182, 25, 'mobile', '2020-08-18 10:39:20', '2020-08-18 10:39:20'),
(183, 25, 'phone', '2020-08-18 10:39:20', '2020-08-18 10:39:20'),
(184, 25, 'xiomi', '2020-08-18 10:39:20', '2020-08-18 10:39:20'),
(185, 25, '4x', '2020-08-18 10:39:20', '2020-08-18 10:39:20'),
(186, 25, 'abcd', '2020-08-18 10:39:21', '2020-08-18 10:39:21'),
(187, 26, 'mobile', '2020-08-18 11:37:36', '2020-08-18 11:37:36'),
(188, 26, 'Samsung', '2020-08-18 11:37:36', '2020-08-18 11:37:36'),
(189, 26, 'Note 20', '2020-08-18 11:37:36', '2020-08-18 11:37:36'),
(190, 26, 'Samsung Galaxy', '2020-08-18 11:37:36', '2020-08-18 11:37:36'),
(191, 26, 'Note 20 Ultra 5G', '2020-08-18 11:37:36', '2020-08-18 11:37:36'),
(192, 27, 'mobile', '2020-08-18 11:41:30', '2020-08-18 11:41:30'),
(193, 27, 'electronic', '2020-08-18 11:41:30', '2020-08-18 11:41:30'),
(194, 27, 'Samsung', '2020-08-18 11:41:31', '2020-08-18 11:41:31'),
(195, 27, 'Galaxy S20', '2020-08-18 11:41:31', '2020-08-18 11:41:31'),
(196, 27, 'S20', '2020-08-18 11:41:31', '2020-08-18 11:41:31'),
(197, 28, 'mobile', '2020-08-18 11:44:12', '2020-08-18 11:44:12'),
(198, 28, 'LG', '2020-08-18 11:44:12', '2020-08-18 11:44:12'),
(199, 28, 'LG V60', '2020-08-18 11:44:12', '2020-08-18 11:44:12'),
(200, 28, 'LG V60 ThinQ', '2020-08-18 11:44:12', '2020-08-18 11:44:12'),
(201, 28, 'V60', '2020-08-18 11:44:13', '2020-08-18 11:44:13'),
(202, 29, 'mobile', '2020-08-18 11:47:09', '2020-08-18 11:47:09'),
(203, 29, 'OnePlus 8 Pro', '2020-08-18 11:47:09', '2020-08-18 11:47:09'),
(204, 29, 'OnePlus 8', '2020-08-18 11:47:09', '2020-08-18 11:47:09'),
(205, 29, 'OnePlus', '2020-08-18 11:47:09', '2020-08-18 11:47:09'),
(206, 29, 'smartphone', '2020-08-18 11:47:09', '2020-08-18 11:47:09'),
(207, 30, 'Galaxy Note10 Plus', '2020-08-18 11:49:16', '2020-08-18 11:49:16'),
(208, 30, 'Galaxy Note10', '2020-08-18 11:49:17', '2020-08-18 11:49:17'),
(209, 30, 'Note10', '2020-08-18 11:49:17', '2020-08-18 11:49:17'),
(210, 30, 'samsung', '2020-08-18 11:49:17', '2020-08-18 11:49:17'),
(211, 30, 'Galaxy Note10 Plus 256GB', '2020-08-18 11:49:17', '2020-08-18 11:49:17'),
(212, 31, 'iPhone 11 Pro', '2020-08-18 11:53:01', '2020-08-18 11:53:01'),
(213, 31, 'iPhone 11', '2020-08-18 11:53:01', '2020-08-18 11:53:01'),
(214, 31, 'iPhone', '2020-08-18 11:53:02', '2020-08-18 11:53:02'),
(215, 31, 'mobile', '2020-08-18 11:53:02', '2020-08-18 11:53:02'),
(216, 31, 'smartphone', '2020-08-18 11:53:02', '2020-08-18 11:53:02'),
(217, 32, 'Google', '2020-08-18 11:55:51', '2020-08-18 11:55:51'),
(218, 32, 'Pixel 3a', '2020-08-18 11:55:51', '2020-08-18 11:55:51'),
(219, 32, 'Pixel 3a XL', '2020-08-18 11:55:51', '2020-08-18 11:55:51'),
(220, 32, 'Google Pixel 3a XL', '2020-08-18 11:55:51', '2020-08-18 11:55:51'),
(221, 32, 'Google Pixel 3a', '2020-08-18 11:55:51', '2020-08-18 11:55:51'),
(222, 33, 'iPhone 11', '2020-08-18 11:57:34', '2020-08-18 11:57:34'),
(223, 33, 'iPhone', '2020-08-18 11:57:34', '2020-08-18 11:57:34'),
(224, 33, 'mobile', '2020-08-18 11:57:34', '2020-08-18 11:57:34'),
(225, 33, 'smartphone', '2020-08-18 11:57:34', '2020-08-18 11:57:34'),
(226, 33, 'apple', '2020-08-18 11:57:34', '2020-08-18 11:57:34'),
(227, 34, 'Google Pixel 4 XL', '2020-08-18 11:59:27', '2020-08-18 11:59:27'),
(228, 34, 'Google Pixel 4', '2020-08-18 11:59:27', '2020-08-18 11:59:27'),
(229, 34, 'Pixel 4 XL', '2020-08-18 11:59:28', '2020-08-18 11:59:28'),
(230, 34, 'Google', '2020-08-18 11:59:28', '2020-08-18 11:59:28'),
(231, 34, 'Pixel 4', '2020-08-18 11:59:28', '2020-08-18 11:59:28'),
(232, 35, 'iPhone SE', '2020-08-18 12:01:21', '2020-08-18 12:01:21'),
(233, 35, 'iPhone SE 2020', '2020-08-18 12:01:21', '2020-08-18 12:01:21'),
(234, 35, 'iPhone', '2020-08-18 12:01:21', '2020-08-18 12:01:21'),
(235, 35, 'SE 2020', '2020-08-18 12:01:22', '2020-08-18 12:01:22'),
(236, 35, 'apple', '2020-08-18 12:01:22', '2020-08-18 12:01:22'),
(237, 36, 'Xiaomi Mi 9X', '2020-08-18 12:05:30', '2020-08-18 12:05:30'),
(238, 36, 'Xiaomi', '2020-08-18 12:05:30', '2020-08-18 12:05:30'),
(239, 36, 'Mi 9X', '2020-08-18 12:05:30', '2020-08-18 12:05:30'),
(240, 36, 'Xiaomi Mi', '2020-08-18 12:05:30', '2020-08-18 12:05:30'),
(241, 36, 'mobile', '2020-08-18 12:05:30', '2020-08-18 12:05:30'),
(242, 37, 'Xiaomi', '2020-08-18 12:07:37', '2020-08-18 12:07:37'),
(243, 37, 'Xiaomi Redmi', '2020-08-18 12:07:37', '2020-08-18 12:07:37'),
(244, 37, 'K20', '2020-08-18 12:07:37', '2020-08-18 12:07:37'),
(245, 37, 'Redmi K20', '2020-08-18 12:07:37', '2020-08-18 12:07:37'),
(246, 37, 'mobile', '2020-08-18 12:07:37', '2020-08-18 12:07:37'),
(247, 38, 'Xiaomi Mi 9T', '2020-08-18 12:11:29', '2020-08-18 12:11:29'),
(248, 38, 'Xiaomi Mi', '2020-08-18 12:11:29', '2020-08-18 12:11:29'),
(249, 38, 'Mi 9T', '2020-08-18 12:11:29', '2020-08-18 12:11:29'),
(250, 38, 'Xiaomi', '2020-08-18 12:11:29', '2020-08-18 12:11:29'),
(251, 38, 'Xiaomi Mi 9', '2020-08-18 12:11:29', '2020-08-18 12:11:29'),
(252, 38, 'Xiaomi Mi 9T Blue', '2020-08-18 12:11:29', '2020-08-18 12:11:29'),
(253, 39, 'Realme C3', '2020-08-18 12:14:10', '2020-08-18 12:14:10'),
(254, 39, 'Realme', '2020-08-18 12:14:10', '2020-08-18 12:14:10'),
(255, 39, 'C3', '2020-08-18 12:14:10', '2020-08-18 12:14:10'),
(256, 39, 'Mobile', '2020-08-18 12:14:10', '2020-08-18 12:14:10'),
(257, 39, 'oppo', '2020-08-18 12:14:10', '2020-08-18 12:14:10'),
(258, 40, 'Realme X 8GB', '2020-08-18 12:16:40', '2020-08-18 12:16:40'),
(259, 40, 'Realme X', '2020-08-18 12:16:40', '2020-08-18 12:16:40'),
(260, 40, 'Realme X 8GB RAM 128GB', '2020-08-18 12:16:40', '2020-08-18 12:16:40'),
(261, 40, 'Realme', '2020-08-18 12:16:40', '2020-08-18 12:16:40'),
(262, 40, 'X 8GB', '2020-08-18 12:16:40', '2020-08-18 12:16:40'),
(263, 41, 'TCL 32S327 32 Inch 1080p', '2020-08-18 12:20:14', '2020-08-18 12:20:14'),
(264, 41, 'TCL 32S327', '2020-08-18 12:20:14', '2020-08-18 12:20:14'),
(265, 41, 'TCL 32S327 32', '2020-08-18 12:20:14', '2020-08-18 12:20:14'),
(266, 41, 'LED TV', '2020-08-18 12:20:14', '2020-08-18 12:20:14'),
(267, 41, 'Smart LED TV', '2020-08-18 12:20:14', '2020-08-18 12:20:14'),
(268, 42, 'LG', '2020-08-18 12:22:03', '2020-08-18 12:22:03'),
(269, 42, 'LG 22LJ4540 TV 22', '2020-08-18 12:22:03', '2020-08-18 12:22:03'),
(270, 42, 'LG 22LJ4540 TV 22 Inch 1080p', '2020-08-18 12:22:03', '2020-08-18 12:22:03'),
(271, 42, 'LG 22LJ4540', '2020-08-18 12:22:03', '2020-08-18 12:22:03'),
(272, 42, 'IPS LED', '2020-08-18 12:22:03', '2020-08-18 12:22:03'),
(273, 43, 'Supersonic SC 1911 19 Inch 1080p', '2020-08-18 12:23:56', '2020-08-18 12:23:56'),
(274, 43, 'Supersonic SC 1911', '2020-08-18 12:23:56', '2020-08-18 12:23:56'),
(275, 43, 'Supersonic SC', '2020-08-18 12:23:56', '2020-08-18 12:23:56'),
(276, 43, 'Supersonic SC 1911 19 Inch 1080p LED', '2020-08-18 12:23:56', '2020-08-18 12:23:56'),
(277, 43, 'Supersonic SC 1911 19 Inch 1080p LED Widescreen HDTV', '2020-08-18 12:23:56', '2020-08-18 12:23:56'),
(278, 44, 'Samsung', '2020-08-18 12:25:38', '2020-08-18 12:25:38'),
(279, 44, 'Samsung Electronics UN32M4500BFXZA 720P', '2020-08-18 12:25:38', '2020-08-18 12:25:38'),
(280, 44, 'Samsung Electronics UN32M4500BFXZA 720P Smart LED TV', '2020-08-18 12:25:38', '2020-08-18 12:25:38'),
(281, 44, 'Samsung Electronics UN32M4500BFXZA 720P Smart LED TV 32', '2020-08-18 12:25:38', '2020-08-18 12:25:38'),
(282, 44, 'Samsung Electronics UN32M4500BFXZA', '2020-08-18 12:25:38', '2020-08-18 12:25:38'),
(283, 45, 'LG 32LM570BPUA 32 Class 720p Smart LED HD TV', '2020-08-18 12:27:10', '2020-08-18 12:27:10'),
(284, 45, 'LG 32LM570BPUA 32 Class 720p', '2020-08-18 12:27:10', '2020-08-18 12:27:10'),
(285, 45, 'LG 32LM570BPUA', '2020-08-18 12:27:10', '2020-08-18 12:27:10'),
(286, 45, 'LG 32LM570BPUA 32', '2020-08-18 12:27:10', '2020-08-18 12:27:10'),
(287, 45, 'LG', '2020-08-18 12:27:10', '2020-08-18 12:27:10'),
(288, 46, 'Samsung Electronics UN32N5300AFXZA 32 1080p Smart LED TV', '2020-08-18 12:28:47', '2020-08-18 12:28:47'),
(289, 46, 'Samsung Electronics', '2020-08-18 12:28:47', '2020-08-18 12:28:47'),
(290, 46, 'Samsung Electronics UN32N5300AFXZA 32 1080p', '2020-08-18 12:28:48', '2020-08-18 12:28:48'),
(291, 46, 'Samsung Electronics UN32N5300AFXZA 32 1080p Smart LED', '2020-08-18 12:28:48', '2020-08-18 12:28:48'),
(292, 46, 'Samsung', '2020-08-18 12:28:48', '2020-08-18 12:28:48'),
(293, 47, 'LG OLED55B9PUA B9 Series', '2020-08-18 12:31:47', '2020-08-18 12:31:47'),
(294, 47, 'LG OLED55B9PUA B9', '2020-08-18 12:31:47', '2020-08-18 12:31:47'),
(295, 47, 'LG OLED55B9PUA', '2020-08-18 12:31:47', '2020-08-18 12:31:47'),
(296, 47, 'LG', '2020-08-18 12:31:47', '2020-08-18 12:31:47'),
(297, 47, 'TV', '2020-08-18 12:31:47', '2020-08-18 12:31:47'),
(298, 48, 'Samsung', '2020-08-18 12:33:31', '2020-08-18 12:33:31'),
(299, 48, 'Samsung  Samsung QN65Q900RBFXZA', '2020-08-18 12:33:31', '2020-08-18 12:33:31'),
(300, 48, 'Samsung QN65Q900RBFXZA', '2020-08-18 12:33:31', '2020-08-18 12:33:31'),
(301, 48, 'QN65Q900RBFXZA', '2020-08-18 12:33:31', '2020-08-18 12:33:31'),
(302, 48, 'TV', '2020-08-18 12:33:32', '2020-08-18 12:33:32'),
(303, 49, 'Sony XBR85Z9G Smart Master Series', '2020-08-18 12:34:38', '2020-08-18 12:34:38'),
(304, 49, 'Sony XBR85Z9G Smart Master', '2020-08-18 12:34:38', '2020-08-18 12:34:38'),
(305, 49, 'Sony XBR85Z9G Smart', '2020-08-18 12:34:38', '2020-08-18 12:34:38'),
(306, 49, 'Sony', '2020-08-18 12:34:39', '2020-08-18 12:34:39'),
(307, 49, 'Sony XBR85Z9G', '2020-08-18 12:34:39', '2020-08-18 12:34:39'),
(308, 50, 'LG 28LM430BPU 28 Class HD LED', '2020-08-18 12:36:20', '2020-08-18 12:36:20'),
(309, 50, 'LG 28LM430BPU 28', '2020-08-18 12:36:20', '2020-08-18 12:36:20'),
(310, 50, 'LG 28LM430BPU 28 Class HD LED TV', '2020-08-18 12:36:20', '2020-08-18 12:36:20'),
(311, 50, 'LG 28LM430BPU', '2020-08-18 12:36:20', '2020-08-18 12:36:20'),
(312, 50, 'LG', '2020-08-18 12:36:20', '2020-08-18 12:36:20'),
(313, 51, 'Hoodie', '2020-08-18 23:50:38', '2020-08-18 23:50:38'),
(314, 51, '01', '2020-08-18 23:50:38', '2020-08-18 23:50:38'),
(315, 51, 'Supreme Wears Hoodie H032', '2020-08-18 23:50:38', '2020-08-18 23:50:38'),
(316, 51, 'Supreme Wears Hoodie', '2020-08-18 23:50:38', '2020-08-18 23:50:38'),
(317, 51, 'Supreme Wears', '2020-08-18 23:50:38', '2020-08-18 23:50:38'),
(318, 52, 'Supreme Wears Hoodie', '2020-08-18 23:52:20', '2020-08-18 23:52:20'),
(319, 52, 'Supreme Wears', '2020-08-18 23:52:20', '2020-08-18 23:52:20'),
(320, 52, 'Hoodie H', '2020-08-18 23:52:20', '2020-08-18 23:52:20'),
(321, 52, 'Hoodie', '2020-08-18 23:52:20', '2020-08-18 23:52:20'),
(322, 52, 'Supreme Wears Hoodie H033', '2020-08-18 23:52:20', '2020-08-18 23:52:20'),
(323, 53, 'Supreme Wears Hoodie', '2020-08-18 23:53:48', '2020-08-18 23:53:48'),
(324, 53, 'Supreme Wears', '2020-08-18 23:53:48', '2020-08-18 23:53:48'),
(325, 53, 'Hoodie', '2020-08-18 23:53:48', '2020-08-18 23:53:48'),
(326, 53, 'Supreme Hoodie', '2020-08-18 23:53:48', '2020-08-18 23:53:48'),
(327, 53, 'Supreme Wears Hoodie H', '2020-08-18 23:53:48', '2020-08-18 23:53:48'),
(328, 54, 'Supreme Wears Hoodie', '2020-08-19 00:03:40', '2020-08-19 00:03:40'),
(329, 54, 'Supreme Wears', '2020-08-19 00:03:40', '2020-08-19 00:03:40'),
(330, 54, 'Hoodie', '2020-08-19 00:03:41', '2020-08-19 00:03:41'),
(331, 54, 'Supreme Wears Men', '2020-08-19 00:03:41', '2020-08-19 00:03:41'),
(332, 54, 'Supreme Hoodie', '2020-08-19 00:03:41', '2020-08-19 00:03:41'),
(333, 55, 'Linen by Linen Heart Motive Saree', '2020-08-19 00:05:53', '2020-08-19 00:05:53'),
(334, 55, 'Linen by Linen Heart Motive', '2020-08-19 00:05:54', '2020-08-19 00:05:54'),
(335, 55, 'Linen by Linen', '2020-08-19 00:05:54', '2020-08-19 00:05:54'),
(336, 55, 'Linen by Linen Heart Motive Saree Red', '2020-08-19 00:05:54', '2020-08-19 00:05:54'),
(337, 55, 'Saree', '2020-08-19 00:05:54', '2020-08-19 00:05:54'),
(338, 56, 'Linen by Linen Heart Motive Saree', '2020-08-19 00:07:49', '2020-08-19 00:07:49'),
(339, 56, 'Linen by Linen Heart Motive Saree Black', '2020-08-19 00:07:49', '2020-08-19 00:07:49'),
(340, 56, 'Saree', '2020-08-19 00:07:49', '2020-08-19 00:07:49'),
(341, 56, 'Linen by Linen', '2020-08-19 00:07:49', '2020-08-19 00:07:49'),
(342, 56, 'Heart Motive Saree', '2020-08-19 00:07:49', '2020-08-19 00:07:49'),
(343, 57, 'Oprea Benarosi Saree', '2020-08-19 00:09:13', '2020-08-19 00:09:13'),
(344, 57, 'Oprea Benarosi', '2020-08-19 00:09:13', '2020-08-19 00:09:13'),
(345, 57, 'Oprea', '2020-08-19 00:09:13', '2020-08-19 00:09:13'),
(346, 57, 'Benarosi Saree', '2020-08-19 00:09:13', '2020-08-19 00:09:13'),
(347, 57, 'Benarosi', '2020-08-19 00:09:13', '2020-08-19 00:09:13'),
(348, 58, 'Oprea Benarosi Saree', '2020-08-19 00:10:11', '2020-08-19 00:10:11'),
(349, 58, 'Oprea Saree', '2020-08-19 00:10:11', '2020-08-19 00:10:11'),
(350, 58, 'Oprea Benarosi', '2020-08-19 00:10:11', '2020-08-19 00:10:11'),
(351, 58, 'Oprea', '2020-08-19 00:10:11', '2020-08-19 00:10:11'),
(352, 58, 'Benarosi', '2020-08-19 00:10:11', '2020-08-19 00:10:11'),
(353, 59, 'Oprea Benarosi Saree Pakistani', '2020-08-19 00:11:27', '2020-08-19 00:11:27'),
(354, 59, 'Oprea Benarosi Saree', '2020-08-19 00:11:27', '2020-08-19 00:11:27'),
(355, 59, 'Oprea Benarosi', '2020-08-19 00:11:27', '2020-08-19 00:11:27'),
(356, 59, 'Benarosi', '2020-08-19 00:11:27', '2020-08-19 00:11:27'),
(357, 59, 'Benarosi Saree Pakistani', '2020-08-19 00:11:27', '2020-08-19 00:11:27'),
(358, 60, 'Oprea Benarosi Saree', '2020-08-19 00:12:28', '2020-08-19 00:12:28'),
(359, 60, 'Oprea Benarosi Saree Pakistani', '2020-08-19 00:12:28', '2020-08-19 00:12:28'),
(360, 60, 'Oprea Benarosi', '2020-08-19 00:12:28', '2020-08-19 00:12:28'),
(361, 60, 'Benarosi Saree', '2020-08-19 00:12:28', '2020-08-19 00:12:28'),
(362, 60, 'Benarosi Saree Pakistani', '2020-08-19 00:12:28', '2020-08-19 00:12:28'),
(363, 61, 'Supreme Wears Jacket J20', '2020-08-19 00:14:26', '2020-08-19 00:14:26'),
(364, 61, 'Supreme Wears Jacket', '2020-08-19 00:14:26', '2020-08-19 00:14:26'),
(365, 61, 'Supreme Wears', '2020-08-19 00:14:26', '2020-08-19 00:14:26'),
(366, 61, 'Jacket J20', '2020-08-19 00:14:27', '2020-08-19 00:14:27'),
(367, 61, 'Jacket', '2020-08-19 00:14:27', '2020-08-19 00:14:27'),
(368, 62, 'Supreme Wears Jacket J21', '2020-08-19 00:15:51', '2020-08-19 00:15:51'),
(369, 62, 'Supreme Wears Jacket', '2020-08-19 00:15:51', '2020-08-19 00:15:51'),
(370, 62, 'Supreme Wears', '2020-08-19 00:15:51', '2020-08-19 00:15:51'),
(371, 62, 'Jacket', '2020-08-19 00:15:51', '2020-08-19 00:15:51'),
(372, 62, 'Jacket J21', '2020-08-19 00:15:51', '2020-08-19 00:15:51'),
(373, 63, 'Supreme Wears Jacket J23', '2020-08-19 00:17:10', '2020-08-19 00:17:10'),
(374, 63, 'Supreme Wears Jacket', '2020-08-19 00:17:10', '2020-08-19 00:17:10'),
(375, 63, 'Supreme Wears', '2020-08-19 00:17:10', '2020-08-19 00:17:10'),
(376, 63, 'Jacket', '2020-08-19 00:17:10', '2020-08-19 00:17:10'),
(377, 63, 'Jacket J23', '2020-08-19 00:17:10', '2020-08-19 00:17:10'),
(378, 64, 'Supreme Wears Jacket J24', '2020-08-19 00:18:23', '2020-08-19 00:18:23'),
(379, 64, 'Supreme Wears Jacket', '2020-08-19 00:18:23', '2020-08-19 00:18:23'),
(380, 64, 'Supreme Wears', '2020-08-19 00:18:23', '2020-08-19 00:18:23'),
(381, 64, 'Supreme', '2020-08-19 00:18:23', '2020-08-19 00:18:23'),
(382, 64, 'Jacket J24', '2020-08-19 00:18:23', '2020-08-19 00:18:23'),
(383, 65, 'Supreme Wears Jacket J25', '2020-08-19 00:23:03', '2020-08-19 00:23:03'),
(384, 65, 'Supreme Wears Jacket', '2020-08-19 00:23:03', '2020-08-19 00:23:03'),
(385, 65, 'Supreme Wears', '2020-08-19 00:23:03', '2020-08-19 00:23:03'),
(386, 65, 'Jacket J25', '2020-08-19 00:23:03', '2020-08-19 00:23:03'),
(387, 65, 'Jacket', '2020-08-19 00:23:03', '2020-08-19 00:23:03'),
(388, 66, 'Oprea Benarosi Saree Pakistani', '2020-08-19 00:24:19', '2020-08-19 00:24:19'),
(389, 66, 'Oprea Benarosi Saree', '2020-08-19 00:24:19', '2020-08-19 00:24:19'),
(390, 66, 'Oprea Benarosi', '2020-08-19 00:24:19', '2020-08-19 00:24:19'),
(391, 66, 'Benarosi Saree', '2020-08-19 00:24:19', '2020-08-19 00:24:19'),
(392, 66, 'Saree Pakistani', '2020-08-19 00:24:19', '2020-08-19 00:24:19'),
(393, 67, 'Oprea', '2020-08-19 00:25:38', '2020-08-19 00:25:38'),
(394, 67, 'Oprea Benarosi', '2020-08-19 00:25:38', '2020-08-19 00:25:38'),
(395, 67, 'Oprea Benarosi Saree', '2020-08-19 00:25:38', '2020-08-19 00:25:38'),
(396, 67, 'Oprea Benarosi Saree Pakistani', '2020-08-19 00:25:38', '2020-08-19 00:25:38'),
(397, 67, 'Saree Pakistani', '2020-08-19 00:25:38', '2020-08-19 00:25:38'),
(398, 68, 'Oprea Benarosi Saree Pakistani', '2020-08-19 00:26:43', '2020-08-19 00:26:43'),
(399, 68, 'Oprea Benarosi Saree', '2020-08-19 00:26:43', '2020-08-19 00:26:43'),
(400, 68, 'Oprea Benarosi', '2020-08-19 00:26:43', '2020-08-19 00:26:43'),
(401, 68, 'Oprea', '2020-08-19 00:26:43', '2020-08-19 00:26:43'),
(402, 68, 'Benarosi Saree', '2020-08-19 00:26:43', '2020-08-19 00:26:43'),
(403, 69, 'Manipuri Handloomed Saree', '2020-08-19 00:32:43', '2020-08-19 00:32:43'),
(404, 69, 'Manipuri Handloomed', '2020-08-19 00:32:44', '2020-08-19 00:32:44'),
(405, 69, 'Manipuri', '2020-08-19 00:32:44', '2020-08-19 00:32:44'),
(406, 69, 'Saree', '2020-08-19 00:32:44', '2020-08-19 00:32:44'),
(407, 69, 'Handloomed Saree', '2020-08-19 00:32:44', '2020-08-19 00:32:44'),
(408, 70, 'Designer Jamdani Saree', '2020-08-19 00:33:57', '2020-08-19 00:33:57'),
(409, 70, 'Designer Jamdani', '2020-08-19 00:33:57', '2020-08-19 00:33:57'),
(410, 70, 'Jamdani', '2020-08-19 00:33:57', '2020-08-19 00:33:57'),
(411, 70, 'Jamdani Saree', '2020-08-19 00:33:57', '2020-08-19 00:33:57'),
(412, 70, 'Saree', '2020-08-19 00:33:57', '2020-08-19 00:33:57'),
(413, 71, 'Designer joomsaree Saree', '2020-08-19 00:36:39', '2020-08-19 00:36:39'),
(414, 71, 'Designer joomsaree', '2020-08-19 00:36:39', '2020-08-19 00:36:39'),
(415, 71, 'joomsaree Saree', '2020-08-19 00:36:39', '2020-08-19 00:36:39'),
(416, 71, 'joomsaree', '2020-08-19 00:36:39', '2020-08-19 00:36:39'),
(417, 71, 'Saree', '2020-08-19 00:36:39', '2020-08-19 00:36:39'),
(418, 72, 'Supreme Wears Tshirt', '2020-08-19 00:39:19', '2020-08-19 00:39:19'),
(419, 72, 'Supreme Wears', '2020-08-19 00:39:19', '2020-08-19 00:39:19'),
(420, 72, 'Supreme', '2020-08-19 00:39:19', '2020-08-19 00:39:19'),
(421, 72, 'Tshirt', '2020-08-19 00:39:19', '2020-08-19 00:39:19'),
(422, 72, 'Men Tshirt', '2020-08-19 00:39:19', '2020-08-19 00:39:19'),
(423, 73, 'Supreme Wears Tshirt FT02', '2020-08-19 00:41:14', '2020-08-19 00:41:14'),
(424, 73, 'Supreme Wears Tshirt', '2020-08-19 00:41:14', '2020-08-19 00:41:14'),
(425, 73, 'Supreme Wears', '2020-08-19 00:41:15', '2020-08-19 00:41:15'),
(426, 73, 'Tshirt FT02', '2020-08-19 00:41:15', '2020-08-19 00:41:15'),
(427, 73, 'FT02', '2020-08-19 00:41:15', '2020-08-19 00:41:15'),
(428, 74, 'Supreme Wears Tshirt FT02', '2020-08-19 00:42:58', '2020-08-19 00:42:58'),
(429, 74, 'Supreme Wears Tshirt', '2020-08-19 00:42:58', '2020-08-19 00:42:58'),
(430, 74, 'Supreme Wears', '2020-08-19 00:42:58', '2020-08-19 00:42:58'),
(431, 74, 'Tshirt FT02', '2020-08-19 00:42:58', '2020-08-19 00:42:58'),
(432, 74, 'Supreme FT02', '2020-08-19 00:42:58', '2020-08-19 00:42:58'),
(433, 75, 'Supreme Wears Tshirt FT02', '2020-08-19 00:46:40', '2020-08-19 00:46:40'),
(434, 75, 'Supreme Wears Tshirt', '2020-08-19 00:46:40', '2020-08-19 00:46:40'),
(435, 75, 'Supreme Wears', '2020-08-19 00:46:40', '2020-08-19 00:46:40'),
(436, 75, 'Supreme', '2020-08-19 00:46:40', '2020-08-19 00:46:40'),
(437, 75, 'Tshirt', '2020-08-19 00:46:40', '2020-08-19 00:46:40'),
(438, 76, 'Supreme Wears Tshirt FT04', '2020-08-19 00:47:46', '2020-08-19 00:47:46'),
(439, 76, 'Supreme Wears Tshirt', '2020-08-19 00:47:46', '2020-08-19 00:47:46'),
(440, 76, 'Supreme Wears', '2020-08-19 00:47:46', '2020-08-19 00:47:46'),
(441, 76, 'Supreme', '2020-08-19 00:47:46', '2020-08-19 00:47:46'),
(442, 76, 'Supreme Tshirt', '2020-08-19 00:47:46', '2020-08-19 00:47:46'),
(443, 77, 'Supreme Wears Tshirt FT05', '2020-08-19 00:49:04', '2020-08-19 00:49:04'),
(444, 77, 'Supreme Wears Tshirt', '2020-08-19 00:49:04', '2020-08-19 00:49:04'),
(445, 77, 'Supreme Wears', '2020-08-19 00:49:04', '2020-08-19 00:49:04'),
(446, 77, 'Supreme', '2020-08-19 00:49:04', '2020-08-19 00:49:04'),
(447, 77, 'Tshirt FT05', '2020-08-19 00:49:04', '2020-08-19 00:49:04'),
(448, 78, 'Supreme Wears Tshirt FT06', '2020-08-19 00:51:08', '2020-08-19 00:51:08'),
(449, 78, 'Supreme Wears Tshirt', '2020-08-19 00:51:08', '2020-08-19 00:51:08'),
(450, 78, 'Supreme Wears', '2020-08-19 00:51:08', '2020-08-19 00:51:08'),
(451, 78, 'Supreme', '2020-08-19 00:51:08', '2020-08-19 00:51:08'),
(452, 78, 'Tshirt FT06', '2020-08-19 00:51:08', '2020-08-19 00:51:08'),
(453, 79, 'Supreme Wears Jacket J26', '2020-08-19 00:53:04', '2020-08-19 00:53:04'),
(454, 79, 'Supreme Wears Jacket', '2020-08-19 00:53:04', '2020-08-19 00:53:04'),
(455, 79, 'Supreme Wears', '2020-08-19 00:53:04', '2020-08-19 00:53:04'),
(456, 79, 'Supreme', '2020-08-19 00:53:04', '2020-08-19 00:53:04'),
(457, 79, 'Jacket J26', '2020-08-19 00:53:04', '2020-08-19 00:53:04'),
(458, 80, 'Supreme Wears Jacket J27', '2020-08-19 00:54:19', '2020-08-19 00:54:19'),
(459, 80, 'Supreme Wears', '2020-08-19 00:54:19', '2020-08-19 00:54:19'),
(460, 80, 'Supreme Wears Jacket', '2020-08-19 00:54:19', '2020-08-19 00:54:19'),
(461, 80, 'Supreme', '2020-08-19 00:54:19', '2020-08-19 00:54:19'),
(462, 80, 'Jacket J27', '2020-08-19 00:54:19', '2020-08-19 00:54:19'),
(463, 81, 'Supreme Wears Jacket J28', '2020-08-19 00:55:31', '2020-08-19 00:55:31'),
(464, 81, 'Supreme Wears Jacket', '2020-08-19 00:55:31', '2020-08-19 00:55:31'),
(465, 81, 'Supreme Wears', '2020-08-19 00:55:31', '2020-08-19 00:55:31'),
(466, 81, 'Supreme', '2020-08-19 00:55:31', '2020-08-19 00:55:31'),
(467, 81, 'Wears Jacket J28', '2020-08-19 00:55:31', '2020-08-19 00:55:31'),
(468, 82, 'Supreme Wears Jacket J30', '2020-08-19 00:56:33', '2020-08-19 00:56:33'),
(469, 82, 'Supreme Wears Jacket', '2020-08-19 00:56:34', '2020-08-19 00:56:34'),
(470, 82, 'Supreme Wears', '2020-08-19 00:56:34', '2020-08-19 00:56:34'),
(471, 82, 'Supreme', '2020-08-19 00:56:34', '2020-08-19 00:56:34'),
(472, 82, 'Jacket J30', '2020-08-19 00:56:34', '2020-08-19 00:56:34'),
(473, 83, 'Supreme Wears Hoodie H020', '2020-08-19 00:57:51', '2020-08-19 00:57:51'),
(474, 83, 'Supreme Wears', '2020-08-19 00:57:51', '2020-08-19 00:57:51'),
(475, 83, 'Supreme Wears Hoodie', '2020-08-19 00:57:51', '2020-08-19 00:57:51'),
(476, 83, 'Supreme', '2020-08-19 00:57:51', '2020-08-19 00:57:51'),
(477, 83, 'Hoodie H020', '2020-08-19 00:57:51', '2020-08-19 00:57:51'),
(478, 84, 'Supreme Wears Hoodie H021', '2020-08-19 00:58:52', '2020-08-19 00:58:52'),
(479, 84, 'Supreme Wears Hoodie', '2020-08-19 00:58:52', '2020-08-19 00:58:52'),
(480, 84, 'Supreme Wears', '2020-08-19 00:58:52', '2020-08-19 00:58:52'),
(481, 84, 'Supreme', '2020-08-19 00:58:52', '2020-08-19 00:58:52'),
(482, 84, 'Hoodie', '2020-08-19 00:58:52', '2020-08-19 00:58:52'),
(483, 85, 'Supreme Wears Hoodie H035', '2020-08-19 01:00:14', '2020-08-19 01:00:14'),
(484, 85, 'Supreme Wears Hoodie', '2020-08-19 01:00:14', '2020-08-19 01:00:14'),
(485, 85, 'Supreme Wears', '2020-08-19 01:00:14', '2020-08-19 01:00:14'),
(486, 85, 'Supreme', '2020-08-19 01:00:14', '2020-08-19 01:00:14'),
(487, 85, 'Hoodie H035', '2020-08-19 01:00:14', '2020-08-19 01:00:14'),
(488, 86, 'Supreme Wears Hoodie H036', '2020-08-19 01:01:22', '2020-08-19 01:01:22'),
(489, 86, 'Supreme Wears Supreme', '2020-08-19 01:01:22', '2020-08-19 01:01:22'),
(490, 86, 'Supreme Wears', '2020-08-19 01:01:22', '2020-08-19 01:01:22'),
(491, 86, 'Supreme', '2020-08-19 01:01:22', '2020-08-19 01:01:22'),
(492, 86, 'Supreme Wears Hoodie', '2020-08-19 01:01:22', '2020-08-19 01:01:22'),
(493, 87, 'Supreme Wears Hoodie H036', '2020-08-19 01:03:01', '2020-08-19 01:03:01'),
(494, 87, 'Supreme Wears Hoodie', '2020-08-19 01:03:01', '2020-08-19 01:03:01'),
(495, 87, 'Supreme Wears', '2020-08-19 01:03:01', '2020-08-19 01:03:01'),
(496, 87, 'Supreme Supreme Wears Hoodie H036', '2020-08-19 01:03:01', '2020-08-19 01:03:01'),
(497, 87, 'Supreme', '2020-08-19 01:03:01', '2020-08-19 01:03:01');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'superadministrator', 'Superadministrator', 'Superadministrator', '2020-08-19 15:11:37', '2020-08-19 15:11:37'),
(2, 'administrator', 'Administrator', 'Administrator', '2020-08-19 15:11:37', '2020-08-19 15:11:37'),
(3, 'user', 'User', 'User', '2020-08-19 15:11:37', '2020-08-19 15:11:37'),
(4, 'seller', 'Seller', 'Seller', '2020-08-19 15:11:37', '2020-08-19 15:11:37');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`role_id`, `user_id`, `user_type`) VALUES
(1, 1, 'App\\Admin'),
(3, 1, 'App\\User'),
(3, 2, 'App\\User'),
(4, 1, 'App\\User');

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sellers`
--

INSERT INTO `sellers` (`id`, `user`, `name`, `company_name`, `nid`, `phone`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'saifullah', 'bongo shop', NULL, '01752495467', NULL, '2020-07-28 21:00:50', '2020-07-28 21:00:50');

-- --------------------------------------------------------

--
-- Table structure for table `seller_requests`
--

CREATE TABLE `seller_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user` bigint(20) UNSIGNED NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_author` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `verified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seller_requests`
--

INSERT INTO `seller_requests` (`id`, `user`, `company_name`, `company_author`, `contact`, `location`, `verified`, `verified_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'bongo shop', 'saifullah', '01752495467', 'dhaka bangladesh', 1, 1, NULL, '2020-07-28 21:00:39', '2020-07-28 21:00:50');

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`id`, `seller`, `name`, `url`, `description`, `active`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'bongobtian', 'c04fa01b-3b9b-47c2-8fc2-49c4aa5e2563', 'this is demo shop', 0, NULL, '2020-07-28 21:01:15', '2020-07-28 21:01:15'),
(2, 1, 'shop1', 'e76cb614-ec52-4796-91dc-e7b3f8c8d53e', 'this is demo shop', 0, NULL, '2020-07-30 05:22:32', '2020-07-30 05:22:32'),
(3, 1, 'bongobtian2', 'e5c11313-b083-406b-ac6b-96a288d84492', 'this is demo shop2', 0, NULL, '2020-08-18 10:35:20', '2020-08-18 10:35:20');

-- --------------------------------------------------------

--
-- Table structure for table `shop_banners`
--

CREATE TABLE `shop_banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop` bigint(20) UNSIGNED DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_banners`
--

INSERT INTO `shop_banners` (`id`, `shop`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 'aBPucvqjJBTL5f213ae2c0e4a.png', '2020-07-28 21:01:22', '2020-07-28 21:01:22'),
(2, 1, 'xG19oOaqNBnZ5f213ae32cd36.png', '2020-07-28 21:01:23', '2020-07-28 21:01:23'),
(3, 1, 'sWkq5JfLQx4e5f213ae398060.png', '2020-07-28 21:01:23', '2020-07-28 21:01:23'),
(4, 2, 'FC6AjYoZkRGk5f2301dfbe3e2.jpeg', '2020-07-30 05:22:39', '2020-07-30 05:22:39'),
(5, 2, 'KncMOoirgVKs5f2301e098743.png', '2020-07-30 05:22:40', '2020-07-30 05:22:40'),
(6, 2, 'mGvRNx7uLVNp5f2301e0ec4c7.png', '2020-07-30 05:22:40', '2020-07-30 05:22:40'),
(7, 3, 'v0cXi6y40sM35f3c0366ca180.jpeg', '2020-08-18 10:35:50', '2020-08-18 10:35:50');

-- --------------------------------------------------------

--
-- Table structure for table `shop_locations`
--

CREATE TABLE `shop_locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop` bigint(20) UNSIGNED NOT NULL,
  `main_branch` tinyint(1) NOT NULL DEFAULT '0',
  `block_house` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `road` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `area` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `police` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shopping_complex` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `floor` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_locations`
--

INSERT INTO `shop_locations` (`id`, `shop`, `main_branch`, `block_house`, `road`, `area`, `city`, `police`, `post`, `shopping_complex`, `floor`, `shop_no`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 'block', 'road', 'area', 'city', 'police', 'post', 'shopping name', 'shopping complex floor', 'shopping complex shop no', NULL, '2020-07-28 21:01:15', '2020-07-28 21:01:15'),
(2, 2, 0, 'block', 'road', 'area', 'city', 'police', 'post', 'shopping name', 'shopping complex floor', 'shopping complex shop no', NULL, '2020-07-30 05:22:32', '2020-07-30 05:22:32'),
(3, 2, 0, 'block2', 'road2', 'area2', 'city', 'police2', 'office2', NULL, NULL, NULL, NULL, '2020-07-30 05:22:32', '2020-07-30 05:22:32'),
(4, 2, 0, 'house3', 'road3', 'area3', 'cuty3', 'police3', 'post3', NULL, NULL, NULL, NULL, '2020-07-30 06:41:00', '2020-07-30 06:41:00'),
(5, 1, 0, 'block2', 'road2', 'area2', 'city2', 'police2', 'post2', NULL, NULL, NULL, '2020-07-30 09:28:43', '2020-07-30 06:41:55', '2020-07-30 09:28:43'),
(6, 1, 0, 'block2', 'road2', 'area2', 'city2', 'police2', 'office2', NULL, NULL, NULL, NULL, '2020-07-31 00:15:55', '2020-07-31 00:15:55'),
(7, 1, 0, 'house3', 'area3', 'area3', 'city3', 'sta3', 'post3', 'complex', 'shopping', 'number', NULL, '2020-07-31 00:15:55', '2020-07-31 00:15:55'),
(8, 3, 0, 'block', 'road', 'area', 'city', 'police', 'post', 'shopping name', 'shopping complex floor', 'shopping complex shop no', NULL, '2020-08-18 10:35:20', '2020-08-18 10:35:20');

-- --------------------------------------------------------

--
-- Table structure for table `shop_location_banners`
--

CREATE TABLE `shop_location_banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `location` bigint(20) UNSIGNED DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_location_banners`
--

INSERT INTO `shop_location_banners` (`id`, `location`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 'HnmPM7ZmOSou5f213ae910cbf.png', '2020-07-28 21:01:29', '2020-07-28 21:01:29'),
(2, 1, 'Dm26KbGzJlMy5f213ae96d381.jpeg', '2020-07-28 21:01:29', '2020-07-28 21:01:29'),
(3, 1, 'I6pNUpjTyicp5f213aea3a002.png', '2020-07-28 21:01:30', '2020-07-28 21:01:30'),
(4, 2, 'w1CNSqnn69bX5f2301e8128dc.png', '2020-07-30 05:22:48', '2020-07-30 05:22:48'),
(5, 2, 'EcdmU4D7QA5R5f2301e863311.png', '2020-07-30 05:22:48', '2020-07-30 05:22:48'),
(6, 2, 'JwEa1JbRKSos5f2301e8c2c2e.jpeg', '2020-07-30 05:22:48', '2020-07-30 05:22:48'),
(7, 3, 'XgBHUjlIXlb45f2301f616b27.png', '2020-07-30 05:23:02', '2020-07-30 05:23:02'),
(8, 3, '7ulM6fcpVQXZ5f2301f6681af.png', '2020-07-30 05:23:02', '2020-07-30 05:23:02'),
(9, 3, 'x98CoyJhMbSs5f2301f6c62c2.jpeg', '2020-07-30 05:23:02', '2020-07-30 05:23:02'),
(10, 5, '1zlxm0On5U195f23147e1f8b4.png', '2020-07-30 06:42:06', '2020-07-30 06:42:06'),
(11, 8, 'tY84yeYActtc5f3c039a3759c.jpeg', '2020-08-18 10:36:42', '2020-08-18 10:36:42');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `email_verify_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `email_verify_code`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Saifullah shaheen', 'seller@seller.com', NULL, '4dXmLWpbxPXA', '$2y$10$9tq4RM1i8BrdoXTqLu0ZquewSum2hWI28Mr/3JfKWwz/2sP8Kk9SG', NULL, '2020-07-28 20:55:01', '2020-07-28 20:55:01'),
(2, 'emon', 'user@user.com', NULL, 'ip1EOHXScxAX', '$2y$10$tmwt9xNc/q2TrExShACTq.7tiH6tBDwIwUHcPy2MchZs4LbixOMuK', NULL, '2020-08-19 15:42:33', '2020-08-19 15:42:33');

-- --------------------------------------------------------

--
-- Table structure for table `user_addresses`
--

CREATE TABLE `user_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user` bigint(20) UNSIGNED NOT NULL,
  `house` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `road` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `police` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_addresses`
--

INSERT INTO `user_addresses` (`id`, `user`, `house`, `area`, `road`, `police`, `post`, `city`, `default`, `created_at`, `updated_at`) VALUES
(1, 1, 'block1', 'area1', 'road1', 'police1', 'post1', 'city1', 1, '2020-08-19 15:33:59', '2020-08-19 15:34:01'),
(2, 2, 'house2', 'are', 'road', 'police', 'post', 'city', 1, '2020-08-19 15:43:25', '2020-08-19 15:43:33');

-- --------------------------------------------------------

--
-- Table structure for table `user_product_clicks`
--

CREATE TABLE `user_product_clicks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user` bigint(20) UNSIGNED DEFAULT NULL,
  `mac` varchar(17) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_product_clicks`
--

INSERT INTO `user_product_clicks` (`id`, `user`, `mac`, `product`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 87, '2020-08-19 15:33:31', '2020-08-19 15:33:31'),
(2, 1, NULL, 79, '2020-08-19 15:33:38', '2020-08-19 15:33:38'),
(3, 1, NULL, 86, '2020-08-19 15:41:53', '2020-08-19 15:41:53'),
(4, 2, NULL, 87, '2020-08-19 15:42:53', '2020-08-19 15:42:53'),
(5, 2, NULL, 85, '2020-08-19 15:43:01', '2020-08-19 15:43:01'),
(6, NULL, 'D0-94-66-EF-0A-F1', 87, '2020-08-19 15:43:41', '2020-08-19 15:43:41'),
(7, NULL, 'D0-94-66-EF-0A-F1', 86, '2020-08-19 15:44:07', '2020-08-19 15:44:07'),
(8, 1, NULL, 85, '2020-08-20 07:33:47', '2020-08-20 07:33:47'),
(9, NULL, 'D0-94-66-EF-0A-F1', 85, '2020-08-20 07:34:35', '2020-08-20 07:34:35'),
(10, 1, NULL, 83, '2020-08-20 07:34:56', '2020-08-20 07:34:56'),
(11, NULL, 'D0-94-66-EF-0A-F1', 79, '2020-08-20 10:39:06', '2020-08-20 10:39:06'),
(12, NULL, 'D0-94-66-EF-0A-F1', 83, '2020-08-20 10:43:40', '2020-08-20 10:43:40'),
(13, 1, NULL, 82, '2020-08-20 11:40:05', '2020-08-20 11:40:05'),
(14, NULL, 'D0-94-66-EF-0A-F1', 81, '2020-08-20 17:08:35', '2020-08-20 17:08:35'),
(15, NULL, 'D0-94-66-EF-0A-F1', 80, '2020-08-20 17:09:25', '2020-08-20 17:09:25'),
(16, NULL, 'D0-94-66-EF-0A-F1', 78, '2020-08-20 17:09:33', '2020-08-20 17:09:33'),
(17, 1, NULL, 81, '2020-08-20 20:30:34', '2020-08-20 20:30:34'),
(18, 1, NULL, 50, '2020-08-20 20:36:11', '2020-08-20 20:36:11'),
(19, NULL, 'D0-94-66-EF-0A-F1', 50, '2020-08-20 20:36:59', '2020-08-20 20:36:59'),
(20, 1, NULL, 31, '2020-08-20 20:37:15', '2020-08-20 20:37:15'),
(21, NULL, 'D0-94-66-EF-0A-F1', 31, '2020-08-20 20:38:40', '2020-08-20 20:38:40'),
(22, 1, NULL, 30, '2020-08-20 20:42:14', '2020-08-20 20:42:14'),
(23, NULL, 'D0-94-66-EF-0A-F1', 30, '2020-08-20 20:42:41', '2020-08-20 20:42:41'),
(24, 1, NULL, 35, '2020-08-20 20:44:01', '2020-08-20 20:44:01'),
(25, NULL, 'D0-94-66-EF-0A-F1', 35, '2020-08-20 20:50:38', '2020-08-20 20:50:38'),
(26, 1, NULL, 24, '2020-08-20 20:51:39', '2020-08-20 20:51:39'),
(27, NULL, 'D0-94-66-EF-0A-F1', 24, '2020-08-20 20:52:11', '2020-08-20 20:52:11'),
(28, 1, NULL, 27, '2020-08-20 20:56:39', '2020-08-20 20:56:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_infos`
--
ALTER TABLE `admin_infos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_infos_admin_foreign` (`admin`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_foreign` (`user`);

--
-- Indexes for table `cart_products`
--
ALTER TABLE `cart_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_products_cart_foreign` (`cart`),
  ADD KEY `cart_products_product_foreign` (`product`);

--
-- Indexes for table `cart_product_options`
--
ALTER TABLE `cart_product_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_product_options_cart_product_foreign` (`cart_product`),
  ADD KEY `cart_product_options_option_foreign` (`option`),
  ADD KEY `cart_product_options_option_parent_foreign` (`option_parent`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_parent_foreign` (`parent`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_foreign` (`user`),
  ADD KEY `orders_cart_foreign` (`cart`);

--
-- Indexes for table `order_addresses`
--
ALTER TABLE `order_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_addresses_order_foreign` (`order`),
  ADD KEY `order_addresses_address_foreign` (`address`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_products_product_index` (`product`);

--
-- Indexes for table `order_product_options`
--
ALTER TABLE `order_product_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_product_options_order_product_foreign` (`order_product`),
  ADD KEY `order_product_options_option_index` (`option`);

--
-- Indexes for table `order_product_statuses`
--
ALTER TABLE `order_product_statuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_product_statuses_seller_foreign` (`seller`),
  ADD KEY `order_product_statuses_product_foreign` (`product`),
  ADD KEY `order_product_statuses_order_foreign` (`order`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `permission_user`
--
ALTER TABLE `permission_user`
  ADD PRIMARY KEY (`user_id`,`permission_id`,`user_type`),
  ADD KEY `permission_user_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_seller_foreign` (`seller`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_categories_category_foreign` (`category`),
  ADD KEY `product_categories_product_foreign` (`product`);

--
-- Indexes for table `product_details`
--
ALTER TABLE `product_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_foreign` (`product`);

--
-- Indexes for table `product_options`
--
ALTER TABLE `product_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_options_product_foreign` (`product`);

--
-- Indexes for table `product_option_details`
--
ALTER TABLE `product_option_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_option_details_option_foreign` (`option`);

--
-- Indexes for table `product_option_images`
--
ALTER TABLE `product_option_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_option_images_option_details_foreign` (`option_details`);

--
-- Indexes for table `product_shops`
--
ALTER TABLE `product_shops`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_shops_shop_foreign` (`shop`),
  ADD KEY `product_shops_product_foreign` (`product`);

--
-- Indexes for table `product_shop_locations`
--
ALTER TABLE `product_shop_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_shop_locations_product_shop_foreign` (`product_shop`);

--
-- Indexes for table `product_tags`
--
ALTER TABLE `product_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_tags_product_index` (`product`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`user_id`,`role_id`,`user_type`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sellers_user_index` (`user`);

--
-- Indexes for table `seller_requests`
--
ALTER TABLE `seller_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seller_requests_user_foreign` (`user`),
  ADD KEY `seller_requests_verified_by_foreign` (`verified_by`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shops_seller_foreign` (`seller`);

--
-- Indexes for table `shop_banners`
--
ALTER TABLE `shop_banners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_banners_shop_foreign` (`shop`);

--
-- Indexes for table `shop_locations`
--
ALTER TABLE `shop_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_locations_shop_index` (`shop`);

--
-- Indexes for table `shop_location_banners`
--
ALTER TABLE `shop_location_banners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_location_banners_location_foreign` (`location`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_addresses_user_foreign` (`user`);

--
-- Indexes for table `user_product_clicks`
--
ALTER TABLE `user_product_clicks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_product_clicks_user_foreign` (`user`),
  ADD KEY `user_product_clicks_product_foreign` (`product`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_infos`
--
ALTER TABLE `admin_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cart_products`
--
ALTER TABLE `cart_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `cart_product_options`
--
ALTER TABLE `cart_product_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order_addresses`
--
ALTER TABLE `order_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `order_product_options`
--
ALTER TABLE `order_product_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `order_product_statuses`
--
ALTER TABLE `order_product_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=210;

--
-- AUTO_INCREMENT for table `product_details`
--
ALTER TABLE `product_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT for table `product_options`
--
ALTER TABLE `product_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `product_option_details`
--
ALTER TABLE `product_option_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `product_option_images`
--
ALTER TABLE `product_option_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `product_shops`
--
ALTER TABLE `product_shops`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `product_shop_locations`
--
ALTER TABLE `product_shop_locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=205;

--
-- AUTO_INCREMENT for table `product_tags`
--
ALTER TABLE `product_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=498;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `seller_requests`
--
ALTER TABLE `seller_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shop_banners`
--
ALTER TABLE `shop_banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `shop_locations`
--
ALTER TABLE `shop_locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `shop_location_banners`
--
ALTER TABLE `shop_location_banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_addresses`
--
ALTER TABLE `user_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_product_clicks`
--
ALTER TABLE `user_product_clicks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_infos`
--
ALTER TABLE `admin_infos`
  ADD CONSTRAINT `admin_infos_admin_foreign` FOREIGN KEY (`admin`) REFERENCES `admins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_user_foreign` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_products`
--
ALTER TABLE `cart_products`
  ADD CONSTRAINT `cart_products_cart_foreign` FOREIGN KEY (`cart`) REFERENCES `carts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_products_product_foreign` FOREIGN KEY (`product`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_product_options`
--
ALTER TABLE `cart_product_options`
  ADD CONSTRAINT `cart_product_options_cart_product_foreign` FOREIGN KEY (`cart_product`) REFERENCES `cart_products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_product_options_option_foreign` FOREIGN KEY (`option`) REFERENCES `product_option_details` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_product_options_option_parent_foreign` FOREIGN KEY (`option_parent`) REFERENCES `product_options` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_foreign` FOREIGN KEY (`parent`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_cart_foreign` FOREIGN KEY (`cart`) REFERENCES `carts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_user_foreign` FOREIGN KEY (`user`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_addresses`
--
ALTER TABLE `order_addresses`
  ADD CONSTRAINT `order_addresses_address_foreign` FOREIGN KEY (`address`) REFERENCES `user_addresses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_addresses_order_foreign` FOREIGN KEY (`order`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_product_options`
--
ALTER TABLE `order_product_options`
  ADD CONSTRAINT `order_product_options_order_product_foreign` FOREIGN KEY (`order_product`) REFERENCES `order_products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_product_statuses`
--
ALTER TABLE `order_product_statuses`
  ADD CONSTRAINT `order_product_statuses_order_foreign` FOREIGN KEY (`order`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_product_statuses_product_foreign` FOREIGN KEY (`product`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_product_statuses_seller_foreign` FOREIGN KEY (`seller`) REFERENCES `sellers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `permission_user`
--
ALTER TABLE `permission_user`
  ADD CONSTRAINT `permission_user_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_seller_foreign` FOREIGN KEY (`seller`) REFERENCES `sellers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD CONSTRAINT `product_categories_category_foreign` FOREIGN KEY (`category`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_categories_product_foreign` FOREIGN KEY (`product`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_foreign` FOREIGN KEY (`product`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_options`
--
ALTER TABLE `product_options`
  ADD CONSTRAINT `product_options_product_foreign` FOREIGN KEY (`product`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_option_details`
--
ALTER TABLE `product_option_details`
  ADD CONSTRAINT `product_option_details_option_foreign` FOREIGN KEY (`option`) REFERENCES `product_options` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_option_images`
--
ALTER TABLE `product_option_images`
  ADD CONSTRAINT `product_option_images_option_details_foreign` FOREIGN KEY (`option_details`) REFERENCES `product_option_details` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_shops`
--
ALTER TABLE `product_shops`
  ADD CONSTRAINT `product_shops_product_foreign` FOREIGN KEY (`product`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_shops_shop_foreign` FOREIGN KEY (`shop`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_shop_locations`
--
ALTER TABLE `product_shop_locations`
  ADD CONSTRAINT `product_shop_locations_product_shop_foreign` FOREIGN KEY (`product_shop`) REFERENCES `product_shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_tags`
--
ALTER TABLE `product_tags`
  ADD CONSTRAINT `product_tags_product_foreign` FOREIGN KEY (`product`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sellers`
--
ALTER TABLE `sellers`
  ADD CONSTRAINT `sellers_user_foreign` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `seller_requests`
--
ALTER TABLE `seller_requests`
  ADD CONSTRAINT `seller_requests_user_foreign` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `seller_requests_verified_by_foreign` FOREIGN KEY (`verified_by`) REFERENCES `admins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shops`
--
ALTER TABLE `shops`
  ADD CONSTRAINT `shops_seller_foreign` FOREIGN KEY (`seller`) REFERENCES `sellers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shop_banners`
--
ALTER TABLE `shop_banners`
  ADD CONSTRAINT `shop_banners_shop_foreign` FOREIGN KEY (`shop`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shop_locations`
--
ALTER TABLE `shop_locations`
  ADD CONSTRAINT `shop_locations_shop_foreign` FOREIGN KEY (`shop`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shop_location_banners`
--
ALTER TABLE `shop_location_banners`
  ADD CONSTRAINT `shop_location_banners_location_foreign` FOREIGN KEY (`location`) REFERENCES `shop_locations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD CONSTRAINT `user_addresses_user_foreign` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_product_clicks`
--
ALTER TABLE `user_product_clicks`
  ADD CONSTRAINT `user_product_clicks_product_foreign` FOREIGN KEY (`product`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_product_clicks_user_foreign` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
