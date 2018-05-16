-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2018 at 07:25 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `banhang`
--

-- --------------------------------------------------------

--
-- Table structure for table `backend_access_log`
--

CREATE TABLE `backend_access_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `backend_access_log`
--

INSERT INTO `backend_access_log` (`id`, `user_id`, `ip_address`, `created_at`, `updated_at`) VALUES
(1, 1, '::1', '2017-10-21 20:09:01', '2017-10-21 20:09:01'),
(2, 1, '::1', '2017-10-27 08:36:52', '2017-10-27 08:36:52'),
(3, 1, '::1', '2017-10-27 21:56:48', '2017-10-27 21:56:48'),
(4, 1, '::1', '2017-11-16 05:21:52', '2017-11-16 05:21:52'),
(5, 1, '::1', '2018-02-28 10:25:55', '2018-02-28 10:25:55'),
(6, 1, '::1', '2018-03-10 01:44:09', '2018-03-10 01:44:09'),
(7, 1, '::1', '2018-05-11 08:02:47', '2018-05-11 08:02:47'),
(8, 1, '::1', '2018-05-15 09:54:01', '2018-05-15 09:54:01');

-- --------------------------------------------------------

--
-- Table structure for table `backend_users`
--

CREATE TABLE `backend_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `activation_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persist_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `permissions` text COLLATE utf8_unicode_ci,
  `is_activated` tinyint(1) NOT NULL DEFAULT '0',
  `activated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `backend_users`
--

INSERT INTO `backend_users` (`id`, `first_name`, `last_name`, `login`, `email`, `password`, `activation_code`, `persist_code`, `reset_password_code`, `permissions`, `is_activated`, `activated_at`, `last_login`, `created_at`, `updated_at`, `is_superuser`) VALUES
(1, 'Admin', 'Person', 'admin', 'tuyentvbg@gmail.com', '$2y$10$WYn/oBZueepl/CWzwVxMS.pD4o8OFfiSNM82P2RPsomWoCMgUXUIC', NULL, '$2y$10$/qKnBhjNUmxlaEVpWdmZ/.ECg38/HfxUAz72ono5jG05BjBU6/Wtq', NULL, '', 1, NULL, '2018-05-15 09:53:59', '2017-10-21 19:47:49', '2018-05-15 09:53:59', 1);

-- --------------------------------------------------------

--
-- Table structure for table `backend_users_groups`
--

CREATE TABLE `backend_users_groups` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_group_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `backend_users_groups`
--

INSERT INTO `backend_users_groups` (`user_id`, `user_group_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `backend_user_groups`
--

CREATE TABLE `backend_user_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `is_new_user_default` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `backend_user_groups`
--

INSERT INTO `backend_user_groups` (`id`, `name`, `permissions`, `created_at`, `updated_at`, `code`, `description`, `is_new_user_default`) VALUES
(1, 'Owners', NULL, '2017-10-21 19:47:49', '2017-10-21 19:47:49', 'owners', 'Default group for website owners.', 0);

-- --------------------------------------------------------

--
-- Table structure for table `backend_user_preferences`
--

CREATE TABLE `backend_user_preferences` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `namespace` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `item` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `backend_user_throttle`
--

CREATE TABLE `backend_user_throttle` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempts` int(11) NOT NULL DEFAULT '0',
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `is_suspended` tinyint(1) NOT NULL DEFAULT '0',
  `suspended_at` timestamp NULL DEFAULT NULL,
  `is_banned` tinyint(1) NOT NULL DEFAULT '0',
  `banned_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `backend_user_throttle`
--

INSERT INTO `backend_user_throttle` (`id`, `user_id`, `ip_address`, `attempts`, `last_attempt_at`, `is_suspended`, `suspended_at`, `is_banned`, `banned_at`) VALUES
(1, 1, '::1', 0, NULL, 0, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bedard_blogtags_post_tag`
--

CREATE TABLE `bedard_blogtags_post_tag` (
  `tag_id` int(10) UNSIGNED DEFAULT NULL,
  `post_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `bedard_blogtags_post_tag`
--

INSERT INTO `bedard_blogtags_post_tag` (`tag_id`, `post_id`) VALUES
(6, 11),
(7, 9),
(7, 11),
(8, 7),
(8, 9),
(8, 11),
(9, 9),
(10, 9),
(11, 7),
(12, 7),
(13, 7);

-- --------------------------------------------------------

--
-- Table structure for table `bedard_blogtags_tags`
--

CREATE TABLE `bedard_blogtags_tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `bedard_blogtags_tags`
--

INSERT INTO `bedard_blogtags_tags` (`id`, `name`, `created_at`, `updated_at`, `slug`) VALUES
(6, 'so blinded', '2017-11-08 07:56:32', '2017-11-08 07:56:32', 'so-blinded'),
(7, 'octobercms', '2017-11-08 07:56:32', '2017-11-08 07:56:32', 'octobercms'),
(8, 'tutorial spring', '2017-11-08 07:56:32', '2017-11-08 07:56:32', 'tutorial-spring'),
(9, 'nodejs', '2017-11-08 07:56:56', '2017-11-08 07:56:56', 'nodejs'),
(10, 'express', '2017-11-08 07:56:56', '2017-11-08 07:56:56', 'express'),
(11, 'java core', '2017-11-08 07:57:35', '2017-11-08 07:57:35', 'java-core'),
(12, 'expressjs', '2017-11-08 07:57:35', '2017-11-08 07:57:35', 'expressjs'),
(13, 'sailsjs', '2017-11-08 07:57:35', '2017-11-08 07:57:35', 'sailsjs');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_theme_data`
--

CREATE TABLE `cms_theme_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `theme` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` mediumtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_theme_logs`
--

CREATE TABLE `cms_theme_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `theme` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `old_template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `old_content` longtext COLLATE utf8_unicode_ci,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deferred_bindings`
--

CREATE TABLE `deferred_bindings` (
  `id` int(10) UNSIGNED NOT NULL,
  `master_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `master_field` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slave_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slave_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `session_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_bind` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` int(10) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` text COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flosch_slideshow_slides`
--

CREATE TABLE `flosch_slideshow_slides` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slideshow_id` int(10) UNSIGNED DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT '0',
  `published_at` datetime DEFAULT NULL,
  `unpublished_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `flosch_slideshow_slides`
--

INSERT INTO `flosch_slideshow_slides` (`id`, `name`, `description`, `link`, `sort_order`, `created_at`, `updated_at`, `slideshow_id`, `is_published`, `published_at`, `unpublished_at`) VALUES
(2, 'Morbi est est lectus non rutrum commodo felis quis tortor...', '<p>Fusce aliquet non ipsum vitae scelerisque. Nullam ultricies adipiscing erat</p>', '#', 2, '2017-10-28 08:40:56', '2017-11-09 05:30:32', 1, 1, '2017-11-09 12:16:04', NULL),
(3, 'Vestibulum auctor dapibus neque pulvinar urna leo', '<p>Fusce aliquet non ipsum vitae scelerisque. Nullam ultricies adipiscing erat</p>', '#', 3, '2017-10-28 08:40:56', '2017-11-09 05:13:49', 1, 1, '2017-11-09 12:12:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `flosch_slideshow_slideshows`
--

CREATE TABLE `flosch_slideshow_slideshows` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `flosch_slideshow_slideshows`
--

INSERT INTO `flosch_slideshow_slideshows` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Example', '2017-10-28 08:40:56', '2017-10-28 08:40:56');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payload` text COLLATE utf8_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2013_10_01_000001_Db_Deferred_Bindings', 1),
('2013_10_01_000002_Db_System_Files', 1),
('2013_10_01_000003_Db_System_Plugin_Versions', 1),
('2013_10_01_000004_Db_System_Plugin_History', 1),
('2013_10_01_000005_Db_System_Settings', 1),
('2013_10_01_000006_Db_System_Parameters', 1),
('2013_10_01_000007_Db_System_Add_Disabled_Flag', 1),
('2013_10_01_000008_Db_System_Mail_Templates', 1),
('2013_10_01_000009_Db_System_Mail_Layouts', 1),
('2014_10_01_000010_Db_Jobs', 1),
('2014_10_01_000011_Db_System_Event_Logs', 1),
('2014_10_01_000012_Db_System_Request_Logs', 1),
('2014_10_01_000013_Db_System_Sessions', 1),
('2015_10_01_000014_Db_System_Mail_Layout_Rename', 1),
('2015_10_01_000015_Db_System_Add_Frozen_Flag', 1),
('2015_10_01_000016_Db_Cache', 1),
('2015_10_01_000017_Db_System_Revisions', 1),
('2015_10_01_000018_Db_FailedJobs', 1),
('2016_10_01_000019_Db_System_Plugin_History_Detail_Text', 1),
('2016_10_01_000020_Db_System_Timestamp_Fix', 1),
('2013_10_01_000001_Db_Backend_Users', 2),
('2013_10_01_000002_Db_Backend_User_Groups', 2),
('2013_10_01_000003_Db_Backend_Users_Groups', 2),
('2013_10_01_000004_Db_Backend_User_Throttle', 2),
('2014_01_04_000005_Db_Backend_User_Preferences', 2),
('2014_10_01_000006_Db_Backend_Access_Log', 2),
('2014_10_01_000007_Db_Backend_Add_Description_Field', 2),
('2015_10_01_000008_Db_Backend_Add_Superuser_Flag', 2),
('2016_10_01_000009_Db_Backend_Timestamp_Fix', 2),
('2014_10_01_000001_Db_Cms_Theme_Data', 3),
('2016_10_01_000002_Db_Cms_Timestamp_Fix', 3),
('2017_10_01_000003_Db_Cms_Theme_Logs', 3);

-- --------------------------------------------------------

--
-- Table structure for table `offline_snipcartshop_categories`
--

CREATE TABLE `offline_snipcartshop_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `nest_left` int(11) DEFAULT NULL,
  `nest_right` int(11) DEFAULT NULL,
  `nest_depth` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `offline_snipcartshop_categories`
--

INSERT INTO `offline_snipcartshop_categories` (`id`, `name`, `slug`, `code`, `meta_title`, `meta_description`, `sort_order`, `created_at`, `updated_at`, `parent_id`, `nest_left`, `nest_right`, `nest_depth`) VALUES
(1, 'Case máy tính game - Đồ hoạ', 'case-may-tinh-game-do-hoa', '', '', '', 0, '2018-05-05 08:55:50', '2018-05-05 08:55:53', NULL, 1, 2, 0),
(2, 'Trọn bộ máy tính cũ', 'tron-bo-may-tinh-cu', '', '', '', 0, '2018-05-05 08:56:20', '2018-05-05 08:56:20', NULL, 3, 4, 0),
(3, 'Case máy tính mới', 'case-may-tinh-moi', '', '', '', 0, '2018-05-05 08:56:33', '2018-05-05 08:56:33', NULL, 5, 6, 0),
(4, 'Case máy tính đồng bộ', 'case-may-tinh-dong-bo', '', '', '', 0, '2018-05-05 08:56:51', '2018-05-05 08:56:51', NULL, 7, 8, 0),
(5, 'Màn hình máy tính cũ', 'man-hinh-may-tinh-cu', '', '', '', 0, '2018-05-05 08:57:07', '2018-05-05 08:57:07', NULL, 9, 10, 0),
(6, 'Máy Tính Chơi Game - Văn phòng', 'may-tinh-chi-game-van-phong', '', '', '', 0, '2018-05-05 08:57:23', '2018-05-05 08:57:23', NULL, 11, 12, 0);

-- --------------------------------------------------------

--
-- Table structure for table `offline_snipcartshop_category_product`
--

CREATE TABLE `offline_snipcartshop_category_product` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offline_snipcartshop_discounts`
--

CREATE TABLE `offline_snipcartshop_discounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `guid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `total_to_reach` decimal(10,0) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Rate',
  `trigger` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Code',
  `rate` int(10) UNSIGNED DEFAULT NULL,
  `amount` decimal(10,0) DEFAULT NULL,
  `alternate_price` decimal(10,0) DEFAULT NULL,
  `max_number_of_usages` int(10) UNSIGNED DEFAULT NULL,
  `expires` datetime DEFAULT NULL,
  `number_of_usages` int(10) UNSIGNED DEFAULT NULL,
  `number_of_usages_uncompleted` int(10) UNSIGNED DEFAULT NULL,
  `shipping_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_cost` decimal(10,0) DEFAULT NULL,
  `shipping_guaranteed_days_to_delivery` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offline_snipcartshop_orders`
--

CREATE TABLE `offline_snipcartshop_orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `token` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invoice_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `creation_date` timestamp NULL DEFAULT NULL,
  `modification_date` timestamp NULL DEFAULT NULL,
  `completion_date` timestamp NULL DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `will_be_paid_later` tinyint(1) DEFAULT NULL,
  `shipping_address_same_as_billing` tinyint(1) DEFAULT NULL,
  `billing_address` text COLLATE utf8_unicode_ci,
  `shipping_address` text COLLATE utf8_unicode_ci,
  `credit_card_last4_digits` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tracking_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tracking_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_fees` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_provider` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `card_holder_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `card_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_gateway_used` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tax_provider` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `refunds_amount` double(8,2) DEFAULT NULL,
  `adjusted_amount` double(8,2) DEFAULT NULL,
  `rebate_amount` double(8,2) DEFAULT NULL,
  `taxes` text COLLATE utf8_unicode_ci,
  `items_total` decimal(8,2) DEFAULT NULL,
  `subtotal` decimal(8,2) DEFAULT NULL,
  `taxable_total` decimal(8,2) DEFAULT NULL,
  `grand_total` decimal(8,2) DEFAULT NULL,
  `total_weight` int(11) DEFAULT NULL,
  `total_rebate_rate` int(11) DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `custom_fields` text COLLATE utf8_unicode_ci,
  `shipping_enabled` tinyint(1) DEFAULT NULL,
  `payment_transaction_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `metadata` text COLLATE utf8_unicode_ci,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `discounts` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offline_snipcartshop_order_items`
--

CREATE TABLE `offline_snipcartshop_order_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `unique_id` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `total_price` decimal(8,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `max_quantity` int(11) DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `length` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `total_weight` decimal(8,2) DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stackable` tinyint(1) DEFAULT NULL,
  `duplicatable` tinyint(1) DEFAULT NULL,
  `shippable` tinyint(1) DEFAULT NULL,
  `taxable` tinyint(1) DEFAULT NULL,
  `custom_fields` text COLLATE utf8_unicode_ci,
  `taxes` text COLLATE utf8_unicode_ci,
  `added_on` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offline_snipcartshop_products`
--

CREATE TABLE `offline_snipcartshop_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_defined_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` text COLLATE utf8_unicode_ci NOT NULL,
  `description_short` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci,
  `weight` int(10) UNSIGNED DEFAULT NULL,
  `width` int(10) UNSIGNED DEFAULT NULL,
  `length` int(10) UNSIGNED DEFAULT NULL,
  `height` int(10) UNSIGNED DEFAULT NULL,
  `quantity_default` int(10) UNSIGNED DEFAULT NULL,
  `quantity_max` int(10) UNSIGNED DEFAULT NULL,
  `quantity_min` int(10) UNSIGNED DEFAULT NULL,
  `stock` int(11) DEFAULT '0',
  `properties` text COLLATE utf8_unicode_ci,
  `links` text COLLATE utf8_unicode_ci,
  `inventory_management_method` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'single',
  `allow_out_of_stock_purchases` tinyint(1) NOT NULL DEFAULT '0',
  `stackable` tinyint(1) NOT NULL DEFAULT '1',
  `shippable` tinyint(1) NOT NULL DEFAULT '1',
  `taxable` tinyint(1) NOT NULL DEFAULT '1',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offline_snipcartshop_product_accessory`
--

CREATE TABLE `offline_snipcartshop_product_accessory` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `accessory_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offline_snipcartshop_product_custom_fields`
--

CREATE TABLE `offline_snipcartshop_product_custom_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `options` text COLLATE utf8_unicode_ci,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offline_snipcartshop_product_custom_field_options`
--

CREATE TABLE `offline_snipcartshop_product_custom_field_options` (
  `id` int(10) UNSIGNED NOT NULL,
  `custom_field_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` int(11) DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offline_snipcartshop_product_variants`
--

CREATE TABLE `offline_snipcartshop_product_variants` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `stock` int(11) DEFAULT NULL,
  `allow_out_of_stock_purchases` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offline_snipcartshop_product_variant_custom_field_option`
--

CREATE TABLE `offline_snipcartshop_product_variant_custom_field_option` (
  `id` int(10) UNSIGNED NOT NULL,
  `variant_id` int(10) UNSIGNED NOT NULL,
  `custom_field_option_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rainlab_blog_categories`
--

CREATE TABLE `rainlab_blog_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `nest_left` int(11) DEFAULT NULL,
  `nest_right` int(11) DEFAULT NULL,
  `nest_depth` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `rainlab_blog_categories`
--

INSERT INTO `rainlab_blog_categories` (`id`, `name`, `slug`, `code`, `description`, `parent_id`, `nest_left`, `nest_right`, `nest_depth`, `created_at`, `updated_at`) VALUES
(1, 'Uncategorized', 'uncategorized', NULL, NULL, NULL, 1, 2, 0, '2017-10-21 20:09:52', '2017-10-21 20:09:52'),
(2, 'Java', 'java', NULL, '', NULL, 3, 8, 0, '2017-10-21 20:13:47', '2017-10-21 20:15:50'),
(3, 'Spring boot', 'spring-boot', NULL, '', 2, 4, 5, 1, '2017-10-21 20:14:24', '2017-10-21 20:15:59'),
(4, 'Spring Security', 'spring-security', NULL, '', 2, 6, 7, 1, '2017-10-21 20:15:07', '2017-10-21 20:15:59'),
(5, 'October CMS', 'october-cms', NULL, '', NULL, 9, 10, 0, '2017-10-21 20:15:34', '2017-10-21 20:15:34'),
(6, 'Nodejs', 'nodejs', NULL, '', NULL, 11, 12, 0, '2017-10-21 20:15:42', '2017-10-21 20:15:42');

-- --------------------------------------------------------

--
-- Table structure for table `rainlab_blog_posts`
--

CREATE TABLE `rainlab_blog_posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8_unicode_ci,
  `content` longtext COLLATE utf8_unicode_ci,
  `content_html` longtext COLLATE utf8_unicode_ci,
  `published_at` timestamp NULL DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `rainlab_blog_posts`
--

INSERT INTO `rainlab_blog_posts` (`id`, `user_id`, `title`, `slug`, `excerpt`, `content`, `content_html`, `published_at`, `published`, `created_at`, `updated_at`) VALUES
(1, NULL, 'First blog post', 'first-blog-post', 'The first ever blog post is here. It might be a good idea to update this post with some more relevant content.', 'This is your first ever **blog post**! It might be a good idea to update this post with some more relevant content.\n\nYou can edit this content by selecting **Blog** from the administration back-end menu.\n\n*Enjoy the good times!*', '<p>This is your first ever <strong>blog post</strong>! It might be a good idea to update this post with some more relevant content.</p>\n<p>You can edit this content by selecting <strong>Blog</strong> from the administration back-end menu.</p>\n<p><em>Enjoy the good times!</em></p>', '2017-10-21 20:09:51', 1, '2017-10-21 20:09:52', '2017-10-21 20:09:52'),
(2, 1, 'The standard Lorem Ipsum passage, used since the 1500s', 'standard-lorem-ipsum-passage-used-1500s', '', 'The standard Lorem Ipsum passage, used since the 1500s\r\n\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"\r\nSection 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\r\n\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"\r\n1914 translation by H. Rackham\r\n\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"\r\nSection 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\r\n\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"\r\n1914 translation by H. Rackham\r\n\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"', '<p>The standard Lorem Ipsum passage, used since the 1500s\n&quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&quot;\nSection 1.10.32 of &quot;de Finibus Bonorum et Malorum&quot;, written by Cicero in 45 BC\n&quot;Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?&quot;\n1914 translation by H. Rackham\n&quot;But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?&quot;\nSection 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot;, written by Cicero in 45 BC\n&quot;At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.&quot;\n1914 translation by H. Rackham\n&quot;On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.&quot;</p>', '2017-10-21 20:20:33', 1, '2017-10-21 20:21:04', '2017-10-21 20:21:04'),
(3, 1, 'Lorem ipsum dolor sit amet', 'lorem-ipsum-dolor-sit-amet', '', 'The standard Lorem Ipsum passage, used since the 1500s\r\n\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"\r\nSection 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\r\n\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"\r\n1914 translation by H. Rackham\r\n\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"\r\nSection 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\r\n\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"\r\n1914 translation by H. Rackham\r\n\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"', '<p>The standard Lorem Ipsum passage, used since the 1500s\n&quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&quot;\nSection 1.10.32 of &quot;de Finibus Bonorum et Malorum&quot;, written by Cicero in 45 BC\n&quot;Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?&quot;\n1914 translation by H. Rackham\n&quot;But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?&quot;\nSection 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot;, written by Cicero in 45 BC\n&quot;At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.&quot;\n1914 translation by H. Rackham\n&quot;On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.&quot;</p>', '2017-10-21 20:21:53', 1, '2017-10-21 20:21:55', '2017-10-21 20:21:55'),
(4, 1, 'Consectetur adipiscing elit, sed do eiusmod tempor', 'consectetur-adipiscing-elit-sed-do-eiusmod-tempor', '', 'The standard Lorem Ipsum passage, used since the 1500s\r\n\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"\r\nSection 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\r\n\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"\r\n1914 translation by H. Rackham\r\n\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"\r\nSection 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\r\n\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"\r\n1914 translation by H. Rackham\r\n\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"', '<p>The standard Lorem Ipsum passage, used since the 1500s\n&quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&quot;\nSection 1.10.32 of &quot;de Finibus Bonorum et Malorum&quot;, written by Cicero in 45 BC\n&quot;Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?&quot;\n1914 translation by H. Rackham\n&quot;But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?&quot;\nSection 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot;, written by Cicero in 45 BC\n&quot;At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.&quot;\n1914 translation by H. Rackham\n&quot;On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.&quot;</p>', '2017-10-21 20:22:32', 1, '2017-10-21 20:22:33', '2017-10-21 20:22:33'),
(5, 1, 'Ut enim ad minim veniam', 'ut-enim-ad-minim-veniam', '', 'The standard Lorem Ipsum passage, used since the 1500s\r\n\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"\r\nSection 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\r\n\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"\r\n1914 translation by H. Rackham\r\n\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"\r\nSection 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\r\n\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"\r\n1914 translation by H. Rackham\r\n\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"', '<p>The standard Lorem Ipsum passage, used since the 1500s\n&quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&quot;\nSection 1.10.32 of &quot;de Finibus Bonorum et Malorum&quot;, written by Cicero in 45 BC\n&quot;Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?&quot;\n1914 translation by H. Rackham\n&quot;But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?&quot;\nSection 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot;, written by Cicero in 45 BC\n&quot;At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.&quot;\n1914 translation by H. Rackham\n&quot;On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.&quot;</p>', '2017-10-21 20:22:54', 1, '2017-10-21 20:23:03', '2017-10-21 20:23:03'),
(6, 1, 'Duis aute irure dolor in reprehenderit in voluptate', 'duis-aute-irure-dolor-reprehenderit-voluptate', '', 'The standard Lorem Ipsum passage, used since the 1500s\r\n\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"\r\nSection 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\r\n\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"\r\n1914 translation by H. Rackham\r\n\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"\r\nSection 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\r\n\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"\r\n1914 translation by H. Rackham\r\n\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"', '<p>The standard Lorem Ipsum passage, used since the 1500s\n&quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&quot;\nSection 1.10.32 of &quot;de Finibus Bonorum et Malorum&quot;, written by Cicero in 45 BC\n&quot;Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?&quot;\n1914 translation by H. Rackham\n&quot;But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?&quot;\nSection 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot;, written by Cicero in 45 BC\n&quot;At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.&quot;\n1914 translation by H. Rackham\n&quot;On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.&quot;</p>', '2017-10-21 20:23:28', 1, '2017-10-21 20:23:33', '2017-10-21 20:23:33');
INSERT INTO `rainlab_blog_posts` (`id`, `user_id`, `title`, `slug`, `excerpt`, `content`, `content_html`, `published_at`, `published`, `created_at`, `updated_at`) VALUES
(7, 1, 'Nam libero tempore, cum soluta', 'nam-libero-tempore-cum-soluta', '', 'The standard Lorem Ipsum passage, used since the 1500s\r\n\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"\r\nSection 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\r\n\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"\r\n1914 translation by H. Rackham\r\n\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"\r\nSection 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\r\n\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"\r\n1914 translation by H. Rackham\r\n\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"', '<p>The standard Lorem Ipsum passage, used since the 1500s\n&quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&quot;\nSection 1.10.32 of &quot;de Finibus Bonorum et Malorum&quot;, written by Cicero in 45 BC\n&quot;Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?&quot;\n1914 translation by H. Rackham\n&quot;But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?&quot;\nSection 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot;, written by Cicero in 45 BC\n&quot;At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.&quot;\n1914 translation by H. Rackham\n&quot;On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.&quot;</p>', '2017-10-21 20:23:53', 1, '2017-10-21 20:24:09', '2017-10-21 20:24:09'),
(8, 1, 'Itaque earum rerum hic tenetur a sapiente delectus', 'itaque-earum-rerum-hic-tenetur-sapiente-delectus', '', 'The standard Lorem Ipsum passage, used since the 1500s\r\n\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"\r\nSection 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\r\n\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"\r\n1914 translation by H. Rackham\r\n\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"\r\nSection 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\r\n\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"\r\n1914 translation by H. Rackham\r\n\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"', '<p>The standard Lorem Ipsum passage, used since the 1500s\n&quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&quot;\nSection 1.10.32 of &quot;de Finibus Bonorum et Malorum&quot;, written by Cicero in 45 BC\n&quot;Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?&quot;\n1914 translation by H. Rackham\n&quot;But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?&quot;\nSection 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot;, written by Cicero in 45 BC\n&quot;At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.&quot;\n1914 translation by H. Rackham\n&quot;On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.&quot;</p>', '2017-10-21 20:24:24', 1, '2017-10-21 20:24:37', '2017-10-21 20:24:37'),
(9, 1, 'Uaut reiciendis voluptatibus maiores alias consequatur aut', 'uaut-reiciendis-voluptatibus-maiores-alias-consequatur-aut', '', 'The standard Lorem Ipsum passage, used since the 1500s\r\n\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"\r\nSection 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\r\n\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"\r\n1914 translation by H. Rackham\r\n\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"\r\nSection 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\r\n\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"\r\n1914 translation by H. Rackham\r\n\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"', '<p>The standard Lorem Ipsum passage, used since the 1500s\n&quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&quot;\nSection 1.10.32 of &quot;de Finibus Bonorum et Malorum&quot;, written by Cicero in 45 BC\n&quot;Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?&quot;\n1914 translation by H. Rackham\n&quot;But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?&quot;\nSection 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot;, written by Cicero in 45 BC\n&quot;At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.&quot;\n1914 translation by H. Rackham\n&quot;On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.&quot;</p>', '2017-10-21 20:25:08', 1, '2017-10-21 20:25:13', '2017-10-21 20:25:13'),
(10, 1, 'On the other hand, we denounce with righteous', 'other-hand-we-denounce-righteous', '', 'The standard Lorem Ipsum passage, used since the 1500s\r\n\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"\r\nSection 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\r\n\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"\r\n1914 translation by H. Rackham\r\n\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"\r\nSection 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\r\n\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"\r\n1914 translation by H. Rackham\r\n\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"', '<p>The standard Lorem Ipsum passage, used since the 1500s\n&quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&quot;\nSection 1.10.32 of &quot;de Finibus Bonorum et Malorum&quot;, written by Cicero in 45 BC\n&quot;Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?&quot;\n1914 translation by H. Rackham\n&quot;But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?&quot;\nSection 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot;, written by Cicero in 45 BC\n&quot;At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.&quot;\n1914 translation by H. Rackham\n&quot;On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.&quot;</p>', '2017-10-21 20:25:29', 1, '2017-10-21 20:25:37', '2017-10-21 20:25:37'),
(11, 1, 'So blinded by desire, that they cannot foresee', 'so-blinded-desire-they-cannot-foresee', '', 'The standard Lorem Ipsum passage, used since the 1500s\r\n\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"\r\nSection 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\r\n\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"\r\n1914 translation by H. Rackham\r\n\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"\r\nSection 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\r\n\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"\r\n1914 translation by H. Rackham\r\n\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"', '<p>The standard Lorem Ipsum passage, used since the 1500s\n&quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&quot;\nSection 1.10.32 of &quot;de Finibus Bonorum et Malorum&quot;, written by Cicero in 45 BC\n&quot;Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?&quot;\n1914 translation by H. Rackham\n&quot;But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?&quot;\nSection 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot;, written by Cicero in 45 BC\n&quot;At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.&quot;\n1914 translation by H. Rackham\n&quot;On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.&quot;</p>', '2017-10-21 20:26:03', 1, '2017-10-21 20:26:10', '2017-10-21 20:26:10');

-- --------------------------------------------------------

--
-- Table structure for table `rainlab_blog_posts_categories`
--

CREATE TABLE `rainlab_blog_posts_categories` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `rainlab_blog_posts_categories`
--

INSERT INTO `rainlab_blog_posts_categories` (`post_id`, `category_id`) VALUES
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(3, 6),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(4, 6),
(5, 2),
(5, 3),
(5, 4),
(5, 5),
(5, 6),
(6, 2),
(6, 3),
(6, 4),
(7, 2),
(8, 5),
(8, 6),
(9, 6),
(10, 5),
(11, 5),
(11, 6);

-- --------------------------------------------------------

--
-- Table structure for table `rainlab_translate_attributes`
--

CREATE TABLE `rainlab_translate_attributes` (
  `id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `model_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `model_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attribute_data` mediumtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rainlab_translate_indexes`
--

CREATE TABLE `rainlab_translate_indexes` (
  `id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `model_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `model_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rainlab_translate_locales`
--

CREATE TABLE `rainlab_translate_locales` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `is_enabled` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `rainlab_translate_locales`
--

INSERT INTO `rainlab_translate_locales` (`id`, `code`, `name`, `is_default`, `is_enabled`) VALUES
(1, 'en', 'English', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `rainlab_translate_messages`
--

CREATE TABLE `rainlab_translate_messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message_data` mediumtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payload` text COLLATE utf8_unicode_ci,
  `last_activity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_event_logs`
--

CREATE TABLE `system_event_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `level` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `details` mediumtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `system_event_logs`
--

INSERT INTO `system_event_logs` (`id`, `level`, `message`, `details`, `created_at`, `updated_at`) VALUES
(1, 'error', 'Symfony\\Component\\Debug\\Exception\\FatalErrorException: Maximum execution time of 30 seconds exceeded in E:\\xampp7\\htdocs\\xukachan\\plugins\\kenshin\\facebook\\components\\FanpageFace.php:6\nStack trace:\n#0 {main}', NULL, '2017-11-04 09:28:03', '2017-11-04 09:28:03'),
(2, 'error', 'ErrorException: Trying to get property of non-object in E:\\xampp7\\htdocs\\xukachan\\plugins\\rahman\\blogtags\\components\\RelatedPosts.php:58\nStack trace:\n#0 E:\\xampp7\\htdocs\\xukachan\\plugins\\rahman\\blogtags\\components\\RelatedPosts.php(58): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(8, \'Trying to get p...\', \'E:\\\\xampp7\\\\htdoc...\', 58, Array)\n#1 E:\\xampp7\\htdocs\\xukachan\\plugins\\rahman\\blogtags\\components\\RelatedPosts.php(46): Rahman\\Blogtags\\Components\\RelatedPosts->loadRelatedPosts()\n#2 E:\\xampp7\\htdocs\\xukachan\\modules\\cms\\classes\\CmsCompoundObject.php(171): Rahman\\Blogtags\\Components\\RelatedPosts->onRun()\n#3 E:\\xampp7\\htdocs\\xukachan\\modules\\cms\\classes\\Controller.php(901): Cms\\Classes\\CmsCompoundObject->runComponents()\n#4 E:\\xampp7\\htdocs\\xukachan\\modules\\cms\\twig\\Extension.php(117): Cms\\Classes\\Controller->renderPartial(\'relatedPosts\', Array)\n#5 E:\\xampp7\\htdocs\\xukachan\\storage\\cms\\twig\\e1\\e1fc8bf22f5b295891570ad6ffaa915a39177fe85f85538bae2797bde4ef7235.php(185): Cms\\Twig\\Extension->partialFunction(\'footer\', Array)\n#6 E:\\xampp7\\htdocs\\xukachan\\vendor\\twig\\twig\\lib\\Twig\\Template.php(432): __TwigTemplate_29c7c7ede4293dd4cf3c0fb072a80dbb1be0a0f7e3a2f6c2886165c9d06c5d82->doDisplay(Array, Array)\n#7 E:\\xampp7\\htdocs\\xukachan\\vendor\\twig\\twig\\lib\\Twig\\Template.php(403): Twig_Template->displayWithErrorHandling(Array, Array)\n#8 E:\\xampp7\\htdocs\\xukachan\\vendor\\twig\\twig\\lib\\Twig\\Template.php(411): Twig_Template->display(Array)\n#9 E:\\xampp7\\htdocs\\xukachan\\modules\\cms\\classes\\Controller.php(376): Twig_Template->render(Array)\n#10 E:\\xampp7\\htdocs\\xukachan\\modules\\cms\\classes\\Controller.php(213): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#11 E:\\xampp7\\htdocs\\xukachan\\modules\\cms\\classes\\CmsController.php(50): Cms\\Classes\\Controller->run(\'/\')\n#12 [internal function]: Cms\\Classes\\CmsController->run(\'/\')\n#13 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(256): call_user_func_array(Array, Array)\n#14 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#15 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), \'run\')\n#16 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#17 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#18 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#19 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#20 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#21 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(68): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#22 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Cms\\\\Classes\\\\Cms...\', \'run\')\n#23 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#24 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#25 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#26 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#27 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#28 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#29 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#30 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(674): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#31 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#32 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#33 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#34 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#35 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#36 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#37 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#38 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#39 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#40 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#41 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#42 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#43 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#44 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#45 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#46 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#47 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#48 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#49 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#50 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#51 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#52 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#53 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#54 E:\\xampp7\\htdocs\\xukachan\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#55 {main}\n\nNext Twig_Error_Runtime: An exception has been thrown during the rendering of a template (\"Trying to get property of non-object\") in \"E:\\xampp7\\htdocs\\xukachan/themes/shizuka/layouts/default.htm\" at line 69. in E:\\xampp7\\htdocs\\xukachan\\vendor\\twig\\twig\\lib\\Twig\\Template.php:447\nStack trace:\n#0 E:\\xampp7\\htdocs\\xukachan\\vendor\\twig\\twig\\lib\\Twig\\Template.php(403): Twig_Template->displayWithErrorHandling(Array, Array)\n#1 E:\\xampp7\\htdocs\\xukachan\\vendor\\twig\\twig\\lib\\Twig\\Template.php(411): Twig_Template->display(Array)\n#2 E:\\xampp7\\htdocs\\xukachan\\modules\\cms\\classes\\Controller.php(376): Twig_Template->render(Array)\n#3 E:\\xampp7\\htdocs\\xukachan\\modules\\cms\\classes\\Controller.php(213): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#4 E:\\xampp7\\htdocs\\xukachan\\modules\\cms\\classes\\CmsController.php(50): Cms\\Classes\\Controller->run(\'/\')\n#5 [internal function]: Cms\\Classes\\CmsController->run(\'/\')\n#6 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(256): call_user_func_array(Array, Array)\n#7 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#8 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), \'run\')\n#9 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#10 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#11 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#12 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#13 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(68): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#15 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Cms\\\\Classes\\\\Cms...\', \'run\')\n#16 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#17 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#18 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#19 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#20 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#21 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#22 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#23 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(674): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#24 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#25 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#26 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#27 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#28 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#29 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#30 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#31 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#32 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#33 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#34 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#36 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#37 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#38 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#39 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#40 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#42 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#43 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#44 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#45 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#46 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#47 E:\\xampp7\\htdocs\\xukachan\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#48 {main}', NULL, '2017-11-04 18:31:49', '2017-11-04 18:31:49'),
(3, 'error', 'ErrorException: A non-numeric value encountered in E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Builder.php:1262\nStack trace:\n#0 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Builder.php(1262): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(2, \'A non-numeric v...\', \'E:\\\\xampp7\\\\htdoc...\', 1262, Array)\n#1 E:\\xampp7\\htdocs\\xukachan\\vendor\\october\\rain\\src\\Database\\Builder.php(138): Illuminate\\Database\\Query\\Builder->forPage(\'category\', \'10\')\n#2 E:\\xampp7\\htdocs\\xukachan\\plugins\\rainlab\\blog\\models\\Post.php(287): October\\Rain\\Database\\Builder->paginate(\'10\', \'category\')\n#3 [internal function]: RainLab\\Blog\\Models\\Post->scopeListFrontEnd(Object(October\\Rain\\Database\\Builder), Array)\n#4 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(901): call_user_func_array(Array, Array)\n#5 E:\\xampp7\\htdocs\\xukachan\\vendor\\october\\rain\\src\\Database\\Builder.php(185): Illuminate\\Database\\Eloquent\\Builder->callScope(\'scopeListFrontE...\', Array)\n#6 E:\\xampp7\\htdocs\\xukachan\\plugins\\rainlab\\blog\\components\\Posts.php(180): October\\Rain\\Database\\Builder->__call(\'listFrontEnd\', Array)\n#7 E:\\xampp7\\htdocs\\xukachan\\plugins\\rainlab\\blog\\components\\Posts.php(142): RainLab\\Blog\\Components\\Posts->listPosts()\n#8 E:\\xampp7\\htdocs\\xukachan\\modules\\cms\\classes\\CmsCompoundObject.php(171): RainLab\\Blog\\Components\\Posts->onRun()\n#9 E:\\xampp7\\htdocs\\xukachan\\modules\\cms\\classes\\Controller.php(428): Cms\\Classes\\CmsCompoundObject->runComponents()\n#10 E:\\xampp7\\htdocs\\xukachan\\modules\\cms\\classes\\Controller.php(349): Cms\\Classes\\Controller->execPageCycle()\n#11 E:\\xampp7\\htdocs\\xukachan\\modules\\cms\\classes\\Controller.php(213): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#12 E:\\xampp7\\htdocs\\xukachan\\modules\\cms\\classes\\CmsController.php(50): Cms\\Classes\\Controller->run(\'blog/category\')\n#13 [internal function]: Cms\\Classes\\CmsController->run(\'blog/category\')\n#14 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(256): call_user_func_array(Array, Array)\n#15 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#16 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), \'run\')\n#17 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#18 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#19 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#20 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#21 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#22 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(68): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#23 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Cms\\\\Classes\\\\Cms...\', \'run\')\n#24 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#25 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#26 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#27 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#28 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#29 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#30 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#31 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(674): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#32 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#33 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#34 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#35 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#36 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#37 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#38 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#39 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#40 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#41 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#42 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#43 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#44 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#45 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#46 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#47 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#48 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#49 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#50 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#51 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#52 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#53 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#54 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#55 E:\\xampp7\\htdocs\\xukachan\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#56 {main}', NULL, '2017-11-08 04:49:42', '2017-11-08 04:49:42'),
(4, 'error', 'ErrorException: Trying to get property of non-object in E:\\xampp7\\htdocs\\xukachan\\storage\\cms\\cache\\4b\\18\\post.htm.php:5\nStack trace:\n#0 E:\\xampp7\\htdocs\\xukachan\\storage\\cms\\cache\\4b\\18\\post.htm.php(5): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(8, \'Trying to get p...\', \'E:\\\\xampp7\\\\htdoc...\', 5, Array)\n#1 E:\\xampp7\\htdocs\\xukachan\\modules\\cms\\classes\\Controller.php(429): Cms5a02f1d49fcc2474127493_f82461d9cf4f3f7b046d03152a41b78aClass->onEnd()\n#2 E:\\xampp7\\htdocs\\xukachan\\modules\\cms\\classes\\Controller.php(349): Cms\\Classes\\Controller->execPageCycle()\n#3 E:\\xampp7\\htdocs\\xukachan\\modules\\cms\\classes\\Controller.php(213): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#4 E:\\xampp7\\htdocs\\xukachan\\modules\\cms\\classes\\CmsController.php(50): Cms\\Classes\\Controller->run(\'post/index.html\')\n#5 [internal function]: Cms\\Classes\\CmsController->run(\'post/index.html\')\n#6 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(256): call_user_func_array(Array, Array)\n#7 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#8 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), \'run\')\n#9 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#10 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#11 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#12 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#13 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(68): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#15 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Cms\\\\Classes\\\\Cms...\', \'run\')\n#16 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#17 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#18 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#19 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#20 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#21 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#22 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#23 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(674): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#24 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#25 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#26 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#27 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#28 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#29 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#30 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#31 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#32 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#33 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#34 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#36 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#37 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#38 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#39 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#40 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#42 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#43 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#44 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#45 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#46 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#47 E:\\xampp7\\htdocs\\xukachan\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#48 {main}', NULL, '2017-11-08 05:00:44', '2017-11-08 05:00:44'),
(5, 'error', 'Symfony\\Component\\Debug\\Exception\\FatalErrorException: Maximum execution time of 30 seconds exceeded in E:\\xampp7\\htdocs\\xukachan\\vendor\\symfony\\yaml\\Parser.php:21\nStack trace:\n#0 {main}', NULL, '2017-11-08 06:58:31', '2017-11-08 06:58:31'),
(6, 'error', 'October\\Rain\\Exception\\SystemException: Unable to find configuration file E:\\xampp7\\htdocs\\xukachan/plugins/raviraj/raviraj/rjsliders/models/slider/columns.yaml defined for Backend\\Behaviors\\ListController. in E:\\xampp7\\htdocs\\xukachan\\modules\\system\\traits\\ConfigMaker.php:63\nStack trace:\n#0 E:\\xampp7\\htdocs\\xukachan\\modules\\backend\\behaviors\\ListController.php(133): Backend\\Classes\\ControllerBehavior->makeConfig(\'E:\\\\xampp7\\\\htdoc...\')\n#1 E:\\xampp7\\htdocs\\xukachan\\modules\\backend\\behaviors\\ListController.php(105): Backend\\Behaviors\\ListController->makeList(\'list\')\n#2 E:\\xampp7\\htdocs\\xukachan\\modules\\backend\\behaviors\\ListController.php(278): Backend\\Behaviors\\ListController->makeLists()\n#3 [internal function]: Backend\\Behaviors\\ListController->index()\n#4 E:\\xampp7\\htdocs\\xukachan\\vendor\\october\\rain\\src\\Extension\\ExtendableTrait.php(371): call_user_func_array(Array, Array)\n#5 E:\\xampp7\\htdocs\\xukachan\\vendor\\october\\rain\\src\\Extension\\Extendable.php(42): October\\Rain\\Extension\\Extendable->extendableCall(\'index\', Array)\n#6 [internal function]: October\\Rain\\Extension\\Extendable->__call(\'index\', Array)\n#7 E:\\xampp7\\htdocs\\xukachan\\modules\\backend\\classes\\Controller.php(361): call_user_func_array(Array, Array)\n#8 E:\\xampp7\\htdocs\\xukachan\\modules\\backend\\classes\\Controller.php(257): Backend\\Classes\\Controller->execPageAction(\'index\', Array)\n#9 E:\\xampp7\\htdocs\\xukachan\\modules\\backend\\classes\\BackendController.php(112): Backend\\Classes\\Controller->run(\'index\', Array)\n#10 [internal function]: Backend\\Classes\\BackendController->run(\'raviraj/rjslide...\')\n#11 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(256): call_user_func_array(Array, Array)\n#12 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#13 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Backend\\Classes\\BackendController), Object(Illuminate\\Routing\\Route), \'run\')\n#14 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#15 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#16 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#17 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#18 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#19 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(68): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Backend\\Classes\\BackendController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#20 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Backend\\\\Classes...\', \'run\')\n#21 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#22 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#23 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#24 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#25 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#26 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#27 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#28 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(674): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#29 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#30 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#31 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#32 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#33 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#34 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#35 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#36 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#37 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#38 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#39 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#40 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#41 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#42 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#43 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#44 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#45 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#46 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#47 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#48 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#49 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#50 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#51 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#52 E:\\xampp7\\htdocs\\xukachan\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#53 {main}', NULL, '2017-11-09 02:54:04', '2017-11-09 02:54:04');
INSERT INTO `system_event_logs` (`id`, `level`, `message`, `details`, `created_at`, `updated_at`) VALUES
(7, 'error', 'Illuminate\\Database\\Eloquent\\ModelNotFoundException: No query results for model [Flosch\\Slideshow\\Models\\Slideshow]. in E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php:223\nStack trace:\n#0 E:\\xampp7\\htdocs\\xukachan\\plugins\\flosch\\slideshow\\components\\Slideshow.php(63): Illuminate\\Database\\Eloquent\\Builder->firstOrFail()\n#1 E:\\xampp7\\htdocs\\xukachan\\modules\\cms\\classes\\CmsCompoundObject.php(171): Flosch\\Slideshow\\Components\\Slideshow->onRun()\n#2 E:\\xampp7\\htdocs\\xukachan\\modules\\cms\\classes\\Controller.php(901): Cms\\Classes\\CmsCompoundObject->runComponents()\n#3 E:\\xampp7\\htdocs\\xukachan\\modules\\cms\\twig\\Extension.php(117): Cms\\Classes\\Controller->renderPartial(\'slideshow\', Array)\n#4 E:\\xampp7\\htdocs\\xukachan\\storage\\cms\\twig\\b1\\b11f36869a7dc75e081bf71a06246ed56ed703fb3a1031a428e86b0791a8bebe.php(20): Cms\\Twig\\Extension->partialFunction(\'slider\', Array)\n#5 E:\\xampp7\\htdocs\\xukachan\\vendor\\twig\\twig\\lib\\Twig\\Template.php(432): __TwigTemplate_bc3eb74d9d0c230345c99df5b7fd673c0f722887fa6e5833e29c13c7725d3aa4->doDisplay(Array, Array)\n#6 E:\\xampp7\\htdocs\\xukachan\\vendor\\twig\\twig\\lib\\Twig\\Template.php(403): Twig_Template->displayWithErrorHandling(Array, Array)\n#7 E:\\xampp7\\htdocs\\xukachan\\vendor\\twig\\twig\\lib\\Twig\\Template.php(411): Twig_Template->display(Array)\n#8 E:\\xampp7\\htdocs\\xukachan\\modules\\cms\\classes\\Controller.php(366): Twig_Template->render(Array)\n#9 E:\\xampp7\\htdocs\\xukachan\\modules\\cms\\classes\\Controller.php(213): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#10 E:\\xampp7\\htdocs\\xukachan\\modules\\cms\\classes\\CmsController.php(50): Cms\\Classes\\Controller->run(\'/\')\n#11 [internal function]: Cms\\Classes\\CmsController->run(\'/\')\n#12 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(256): call_user_func_array(Array, Array)\n#13 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#14 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), \'run\')\n#15 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#16 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#17 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#18 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#19 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#20 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(68): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#21 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Cms\\\\Classes\\\\Cms...\', \'run\')\n#22 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#23 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#24 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#25 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#26 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#27 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#28 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#29 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(674): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#30 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#31 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#32 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#33 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#34 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#36 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#37 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#38 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#39 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#40 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#42 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#43 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#44 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#45 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#46 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#47 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#48 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#49 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#50 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#51 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#52 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#53 E:\\xampp7\\htdocs\\xukachan\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#54 {main}\n\nNext Twig_Error_Runtime: An exception has been thrown during the rendering of a template (\"No query results for model [Flosch\\Slideshow\\Models\\Slideshow].\") in \"E:\\xampp7\\htdocs\\xukachan/themes/shizuka/pages/home.htm\" at line 1. in E:\\xampp7\\htdocs\\xukachan\\vendor\\twig\\twig\\lib\\Twig\\Template.php:447\nStack trace:\n#0 E:\\xampp7\\htdocs\\xukachan\\vendor\\twig\\twig\\lib\\Twig\\Template.php(403): Twig_Template->displayWithErrorHandling(Array, Array)\n#1 E:\\xampp7\\htdocs\\xukachan\\vendor\\twig\\twig\\lib\\Twig\\Template.php(411): Twig_Template->display(Array)\n#2 E:\\xampp7\\htdocs\\xukachan\\modules\\cms\\classes\\Controller.php(366): Twig_Template->render(Array)\n#3 E:\\xampp7\\htdocs\\xukachan\\modules\\cms\\classes\\Controller.php(213): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#4 E:\\xampp7\\htdocs\\xukachan\\modules\\cms\\classes\\CmsController.php(50): Cms\\Classes\\Controller->run(\'/\')\n#5 [internal function]: Cms\\Classes\\CmsController->run(\'/\')\n#6 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(256): call_user_func_array(Array, Array)\n#7 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#8 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), \'run\')\n#9 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#10 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#11 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#12 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#13 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(68): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#15 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Cms\\\\Classes\\\\Cms...\', \'run\')\n#16 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#17 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#18 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#19 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#20 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#21 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#22 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#23 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(674): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#24 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#25 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#26 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#27 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#28 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#29 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#30 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#31 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#32 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#33 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#34 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#36 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#37 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#38 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#39 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#40 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#42 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#43 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#44 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#45 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#46 E:\\xampp7\\htdocs\\xukachan\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#47 E:\\xampp7\\htdocs\\xukachan\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#48 {main}', NULL, '2017-11-09 05:27:42', '2017-11-09 05:27:42'),
(8, 'error', 'Twig_Error_Syntax: Unexpected character \"#\" in \"E:\\xampp7\\htdocs\\banhang/themes/kenshinEcommerce/pages/home.htm\" at line 199. in E:\\xampp7\\htdocs\\banhang\\vendor\\twig\\twig\\lib\\Twig\\Lexer.php:295\nStack trace:\n#0 E:\\xampp7\\htdocs\\banhang\\vendor\\twig\\twig\\lib\\Twig\\Lexer.php(227): Twig_Lexer->lexExpression()\n#1 E:\\xampp7\\htdocs\\banhang\\vendor\\twig\\twig\\lib\\Twig\\Lexer.php(126): Twig_Lexer->lexVar()\n#2 E:\\xampp7\\htdocs\\banhang\\vendor\\twig\\twig\\lib\\Twig\\Environment.php(653): Twig_Lexer->tokenize(Object(Twig_Source))\n#3 E:\\xampp7\\htdocs\\banhang\\vendor\\twig\\twig\\lib\\Twig\\Environment.php(750): Twig_Environment->tokenize(Object(Twig_Source))\n#4 E:\\xampp7\\htdocs\\banhang\\vendor\\twig\\twig\\lib\\Twig\\Environment.php(447): Twig_Environment->compileSource(Object(Twig_Source))\n#5 E:\\xampp7\\htdocs\\banhang\\modules\\cms\\classes\\Controller.php(365): Twig_Environment->loadTemplate(\'E:\\\\xampp7\\\\htdoc...\')\n#6 E:\\xampp7\\htdocs\\banhang\\modules\\cms\\classes\\Controller.php(213): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#7 E:\\xampp7\\htdocs\\banhang\\modules\\cms\\classes\\CmsController.php(50): Cms\\Classes\\Controller->run(\'/\')\n#8 [internal function]: Cms\\Classes\\CmsController->run(\'/\')\n#9 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(256): call_user_func_array(Array, Array)\n#10 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#11 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), \'run\')\n#12 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#13 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#14 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#15 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#16 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#17 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(68): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#18 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Cms\\\\Classes\\\\Cms...\', \'run\')\n#19 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#20 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#21 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#22 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#23 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#24 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#25 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#26 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(674): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#27 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#28 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#29 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#30 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#31 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#32 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#33 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#34 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#36 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#37 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#38 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#39 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#40 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#42 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#43 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#44 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#45 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#46 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#47 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#48 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#49 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#50 E:\\xampp7\\htdocs\\banhang\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#51 {main}', NULL, '2017-11-17 19:50:36', '2017-11-17 19:50:36'),
(9, 'error', 'Twig_Error_Syntax: Unexpected character \"#\" in \"E:\\xampp7\\htdocs\\banhang/themes/kenshinEcommerce/pages/home.htm\" at line 464. in E:\\xampp7\\htdocs\\banhang\\vendor\\twig\\twig\\lib\\Twig\\Lexer.php:295\nStack trace:\n#0 E:\\xampp7\\htdocs\\banhang\\vendor\\twig\\twig\\lib\\Twig\\Lexer.php(227): Twig_Lexer->lexExpression()\n#1 E:\\xampp7\\htdocs\\banhang\\vendor\\twig\\twig\\lib\\Twig\\Lexer.php(126): Twig_Lexer->lexVar()\n#2 E:\\xampp7\\htdocs\\banhang\\vendor\\twig\\twig\\lib\\Twig\\Environment.php(653): Twig_Lexer->tokenize(Object(Twig_Source))\n#3 E:\\xampp7\\htdocs\\banhang\\vendor\\twig\\twig\\lib\\Twig\\Environment.php(750): Twig_Environment->tokenize(Object(Twig_Source))\n#4 E:\\xampp7\\htdocs\\banhang\\vendor\\twig\\twig\\lib\\Twig\\Environment.php(447): Twig_Environment->compileSource(Object(Twig_Source))\n#5 E:\\xampp7\\htdocs\\banhang\\modules\\cms\\classes\\Controller.php(365): Twig_Environment->loadTemplate(\'E:\\\\xampp7\\\\htdoc...\')\n#6 E:\\xampp7\\htdocs\\banhang\\modules\\cms\\classes\\Controller.php(213): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#7 E:\\xampp7\\htdocs\\banhang\\modules\\cms\\classes\\CmsController.php(50): Cms\\Classes\\Controller->run(\'/\')\n#8 [internal function]: Cms\\Classes\\CmsController->run(\'/\')\n#9 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(256): call_user_func_array(Array, Array)\n#10 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#11 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), \'run\')\n#12 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#13 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#14 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#15 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#16 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#17 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(68): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#18 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Cms\\\\Classes\\\\Cms...\', \'run\')\n#19 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#20 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#21 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#22 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#23 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#24 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#25 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#26 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(674): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#27 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#28 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#29 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#30 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#31 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#32 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#33 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#34 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#36 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#37 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#38 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#39 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#40 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#42 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#43 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#44 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#45 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#46 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#47 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#48 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#49 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#50 E:\\xampp7\\htdocs\\banhang\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#51 {main}', NULL, '2017-11-17 19:51:36', '2017-11-17 19:51:36'),
(10, 'error', 'Twig_Error_Syntax: Unexpected character \"&\" in \"E:\\xampp7\\htdocs\\banhang/themes/kenshinEcommerce/pages/product/category.htm\" at line 470. in E:\\xampp7\\htdocs\\banhang\\vendor\\twig\\twig\\lib\\Twig\\Lexer.php:295\nStack trace:\n#0 E:\\xampp7\\htdocs\\banhang\\vendor\\twig\\twig\\lib\\Twig\\Lexer.php(227): Twig_Lexer->lexExpression()\n#1 E:\\xampp7\\htdocs\\banhang\\vendor\\twig\\twig\\lib\\Twig\\Lexer.php(126): Twig_Lexer->lexVar()\n#2 E:\\xampp7\\htdocs\\banhang\\vendor\\twig\\twig\\lib\\Twig\\Environment.php(653): Twig_Lexer->tokenize(Object(Twig_Source))\n#3 E:\\xampp7\\htdocs\\banhang\\vendor\\twig\\twig\\lib\\Twig\\Environment.php(750): Twig_Environment->tokenize(Object(Twig_Source))\n#4 E:\\xampp7\\htdocs\\banhang\\vendor\\twig\\twig\\lib\\Twig\\Environment.php(447): Twig_Environment->compileSource(Object(Twig_Source))\n#5 E:\\xampp7\\htdocs\\banhang\\modules\\cms\\classes\\Controller.php(365): Twig_Environment->loadTemplate(\'E:\\\\xampp7\\\\htdoc...\')\n#6 E:\\xampp7\\htdocs\\banhang\\modules\\cms\\classes\\Controller.php(213): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#7 E:\\xampp7\\htdocs\\banhang\\modules\\cms\\classes\\CmsController.php(50): Cms\\Classes\\Controller->run(\'category-produc...\')\n#8 [internal function]: Cms\\Classes\\CmsController->run(\'category-produc...\')\n#9 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(256): call_user_func_array(Array, Array)\n#10 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#11 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), \'run\')\n#12 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#13 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#14 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#15 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#16 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#17 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(68): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#18 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Cms\\\\Classes\\\\Cms...\', \'run\')\n#19 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#20 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#21 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#22 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#23 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#24 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#25 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#26 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(674): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#27 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#28 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#29 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#30 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#31 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#32 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#33 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#34 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#36 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#37 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#38 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#39 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#40 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#42 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#43 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#44 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#45 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#46 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#47 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#48 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#49 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#50 E:\\xampp7\\htdocs\\banhang\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#51 {main}', NULL, '2017-11-21 07:01:03', '2017-11-21 07:01:03');
INSERT INTO `system_event_logs` (`id`, `level`, `message`, `details`, `created_at`, `updated_at`) VALUES
(11, 'error', 'Twig_Error_Syntax: Unexpected character \"#\" in \"E:\\xampp7\\htdocs\\banhang/themes/kenshinEcommerce/partials/menu.htm\" at line 20. in E:\\xampp7\\htdocs\\banhang\\vendor\\twig\\twig\\lib\\Twig\\Lexer.php:295\nStack trace:\n#0 E:\\xampp7\\htdocs\\banhang\\vendor\\twig\\twig\\lib\\Twig\\Lexer.php(227): Twig_Lexer->lexExpression()\n#1 E:\\xampp7\\htdocs\\banhang\\vendor\\twig\\twig\\lib\\Twig\\Lexer.php(126): Twig_Lexer->lexVar()\n#2 E:\\xampp7\\htdocs\\banhang\\vendor\\twig\\twig\\lib\\Twig\\Environment.php(653): Twig_Lexer->tokenize(Object(Twig_Source))\n#3 E:\\xampp7\\htdocs\\banhang\\vendor\\twig\\twig\\lib\\Twig\\Environment.php(750): Twig_Environment->tokenize(Object(Twig_Source))\n#4 E:\\xampp7\\htdocs\\banhang\\vendor\\twig\\twig\\lib\\Twig\\Environment.php(447): Twig_Environment->compileSource(Object(Twig_Source))\n#5 E:\\xampp7\\htdocs\\banhang\\modules\\cms\\classes\\Controller.php(911): Twig_Environment->loadTemplate(\'E:\\\\xampp7\\\\htdoc...\')\n#6 E:\\xampp7\\htdocs\\banhang\\modules\\cms\\twig\\Extension.php(117): Cms\\Classes\\Controller->renderPartial(\'menu\', Array)\n#7 E:\\xampp7\\htdocs\\banhang\\storage\\cms\\twig\\1c\\1c5ca43ba71f4a958a9a11aadecba035687175a781a03e0bf2459f898018c3d0.php(170): Cms\\Twig\\Extension->partialFunction(\'menu\', Array)\n#8 E:\\xampp7\\htdocs\\banhang\\vendor\\twig\\twig\\lib\\Twig\\Template.php(432): __TwigTemplate_1eb8b13f1ffc98a5c6626fd6d23dd6416f4280e226713b373d871b3c2cfa0119->doDisplay(Array, Array)\n#9 E:\\xampp7\\htdocs\\banhang\\vendor\\twig\\twig\\lib\\Twig\\Template.php(403): Twig_Template->displayWithErrorHandling(Array, Array)\n#10 E:\\xampp7\\htdocs\\banhang\\vendor\\twig\\twig\\lib\\Twig\\Template.php(411): Twig_Template->display(Array)\n#11 E:\\xampp7\\htdocs\\banhang\\modules\\cms\\classes\\Controller.php(912): Twig_Template->render(Array)\n#12 E:\\xampp7\\htdocs\\banhang\\modules\\cms\\twig\\Extension.php(117): Cms\\Classes\\Controller->renderPartial(\'header\', Array)\n#13 E:\\xampp7\\htdocs\\banhang\\storage\\cms\\twig\\74\\74967d77af08f2a40e3ee15197de393843c9226324782c5f4ef3c2d010a86036.php(142): Cms\\Twig\\Extension->partialFunction(\'header\', Array)\n#14 E:\\xampp7\\htdocs\\banhang\\vendor\\twig\\twig\\lib\\Twig\\Template.php(432): __TwigTemplate_20a752f5b4a006557a0d85a5bbe51df9409a1da40ff7de4ba59a0ab318ee7d7a->doDisplay(Array, Array)\n#15 E:\\xampp7\\htdocs\\banhang\\vendor\\twig\\twig\\lib\\Twig\\Template.php(403): Twig_Template->displayWithErrorHandling(Array, Array)\n#16 E:\\xampp7\\htdocs\\banhang\\vendor\\twig\\twig\\lib\\Twig\\Template.php(411): Twig_Template->display(Array)\n#17 E:\\xampp7\\htdocs\\banhang\\modules\\cms\\classes\\Controller.php(376): Twig_Template->render(Array)\n#18 E:\\xampp7\\htdocs\\banhang\\modules\\cms\\classes\\Controller.php(213): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#19 E:\\xampp7\\htdocs\\banhang\\modules\\cms\\classes\\CmsController.php(50): Cms\\Classes\\Controller->run(\'category-produc...\')\n#20 [internal function]: Cms\\Classes\\CmsController->run(\'category-produc...\')\n#21 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(256): call_user_func_array(Array, Array)\n#22 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#23 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), \'run\')\n#24 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#25 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#26 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#27 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#28 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#29 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(68): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#30 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Cms\\\\Classes\\\\Cms...\', \'run\')\n#31 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#32 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#33 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#34 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#35 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#36 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#37 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#38 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(674): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#39 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#40 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#41 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#42 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#43 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#44 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#45 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#46 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#47 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#48 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#49 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#50 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#51 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#52 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#53 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#54 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#55 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#56 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#57 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#58 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#59 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#60 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#61 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#62 E:\\xampp7\\htdocs\\banhang\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#63 {main}', NULL, '2017-11-21 07:06:08', '2017-11-21 07:06:08'),
(12, 'error', 'Twig_Error_Syntax: Unexpected token \"name\" of value \"assets\" (\"end of print statement\" expected) in \"E:\\xampp7\\htdocs\\banhang/themes/kenshinEcommerce/pages/product/detail.htm\" at line 206. in E:\\xampp7\\htdocs\\banhang\\vendor\\twig\\twig\\lib\\Twig\\TokenStream.php:96\nStack trace:\n#0 E:\\xampp7\\htdocs\\banhang\\vendor\\twig\\twig\\lib\\Twig\\Parser.php(148): Twig_TokenStream->expect(4)\n#1 E:\\xampp7\\htdocs\\banhang\\vendor\\twig\\twig\\lib\\Twig\\Parser.php(103): Twig_Parser->subparse(NULL, false)\n#2 E:\\xampp7\\htdocs\\banhang\\vendor\\twig\\twig\\lib\\Twig\\Environment.php(692): Twig_Parser->parse(Object(Twig_TokenStream))\n#3 E:\\xampp7\\htdocs\\banhang\\vendor\\twig\\twig\\lib\\Twig\\Environment.php(750): Twig_Environment->parse(Object(Twig_TokenStream))\n#4 E:\\xampp7\\htdocs\\banhang\\vendor\\twig\\twig\\lib\\Twig\\Environment.php(447): Twig_Environment->compileSource(Object(Twig_Source))\n#5 E:\\xampp7\\htdocs\\banhang\\modules\\cms\\classes\\Controller.php(365): Twig_Environment->loadTemplate(\'E:\\\\xampp7\\\\htdoc...\')\n#6 E:\\xampp7\\htdocs\\banhang\\modules\\cms\\classes\\Controller.php(213): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#7 E:\\xampp7\\htdocs\\banhang\\modules\\cms\\classes\\CmsController.php(50): Cms\\Classes\\Controller->run(\'category-produc...\')\n#8 [internal function]: Cms\\Classes\\CmsController->run(\'category-produc...\')\n#9 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(256): call_user_func_array(Array, Array)\n#10 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#11 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), \'run\')\n#12 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#13 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#14 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#15 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#16 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#17 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(68): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#18 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Cms\\\\Classes\\\\Cms...\', \'run\')\n#19 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#20 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#21 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#22 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#23 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#24 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#25 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#26 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(674): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#27 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#28 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#29 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#30 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#31 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#32 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#33 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#34 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#36 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#37 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#38 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#39 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#40 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#42 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#43 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#44 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#45 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#46 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#47 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#48 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#49 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#50 E:\\xampp7\\htdocs\\banhang\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#51 {main}', NULL, '2017-11-21 07:19:53', '2017-11-21 07:19:53'),
(13, 'error', 'RuntimeException: Failed to write cache file \"E:\\xampp7\\htdocs\\banhang\\storage/cms/twig/74/74967d77af08f2a40e3ee15197de393843c9226324782c5f4ef3c2d010a86036.php\". in E:\\xampp7\\htdocs\\banhang\\vendor\\twig\\twig\\lib\\Twig\\Cache\\Filesystem.php:80\nStack trace:\n#0 E:\\xampp7\\htdocs\\banhang\\vendor\\twig\\twig\\lib\\Twig\\Environment.php(452): Twig_Cache_Filesystem->write(\'E:\\\\xampp7\\\\htdoc...\', \'<?php\\n\\n/* E:\\\\xa...\')\n#1 E:\\xampp7\\htdocs\\banhang\\modules\\cms\\classes\\Controller.php(375): Twig_Environment->loadTemplate(\'E:\\\\xampp7\\\\htdoc...\')\n#2 E:\\xampp7\\htdocs\\banhang\\modules\\cms\\classes\\Controller.php(213): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#3 E:\\xampp7\\htdocs\\banhang\\modules\\cms\\classes\\CmsController.php(50): Cms\\Classes\\Controller->run(\'assets/data/tra...\')\n#4 [internal function]: Cms\\Classes\\CmsController->run(\'assets/data/tra...\')\n#5 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(256): call_user_func_array(Array, Array)\n#6 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#7 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), \'run\')\n#8 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#9 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#10 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#11 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#12 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#13 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(68): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#14 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Cms\\\\Classes\\\\Cms...\', \'run\')\n#15 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#16 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#17 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#18 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#19 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#20 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#21 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#22 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(674): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#23 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#24 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#25 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#26 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#27 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#28 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#29 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#30 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#31 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#32 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#33 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#34 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#35 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#36 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#37 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#38 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#39 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#40 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#41 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#42 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#43 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#44 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#45 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#46 E:\\xampp7\\htdocs\\banhang\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#47 {main}', NULL, '2017-11-21 07:47:54', '2017-11-21 07:47:54'),
(14, 'error', 'RuntimeException: Failed to write cache file \"E:\\xampp7\\htdocs\\banhang\\storage/cms/twig/74/74967d77af08f2a40e3ee15197de393843c9226324782c5f4ef3c2d010a86036.php\". in E:\\xampp7\\htdocs\\banhang\\vendor\\twig\\twig\\lib\\Twig\\Cache\\Filesystem.php:80\nStack trace:\n#0 E:\\xampp7\\htdocs\\banhang\\vendor\\twig\\twig\\lib\\Twig\\Environment.php(452): Twig_Cache_Filesystem->write(\'E:\\\\xampp7\\\\htdoc...\', \'<?php\\n\\n/* E:\\\\xa...\')\n#1 E:\\xampp7\\htdocs\\banhang\\modules\\cms\\classes\\Controller.php(375): Twig_Environment->loadTemplate(\'E:\\\\xampp7\\\\htdoc...\')\n#2 E:\\xampp7\\htdocs\\banhang\\modules\\cms\\classes\\Controller.php(213): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#3 E:\\xampp7\\htdocs\\banhang\\modules\\cms\\classes\\CmsController.php(50): Cms\\Classes\\Controller->run(\'assets/images/l...\')\n#4 [internal function]: Cms\\Classes\\CmsController->run(\'assets/images/l...\')\n#5 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(256): call_user_func_array(Array, Array)\n#6 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#7 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), \'run\')\n#8 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#9 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#10 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#11 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#12 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#13 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(68): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#14 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Cms\\\\Classes\\\\Cms...\', \'run\')\n#15 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#16 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#17 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#18 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#19 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#20 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#21 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#22 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(674): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#23 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#24 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#25 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#26 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#27 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#28 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#29 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#30 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#31 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#32 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#33 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#34 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#35 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#36 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#37 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#38 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#39 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#40 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#41 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#42 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#43 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#44 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#45 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#46 E:\\xampp7\\htdocs\\banhang\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#47 {main}', NULL, '2017-11-21 07:47:54', '2017-11-21 07:47:54'),
(15, 'error', 'RuntimeException: Failed to write cache file \"E:\\xampp7\\htdocs\\banhang\\storage/cms/twig/74/74967d77af08f2a40e3ee15197de393843c9226324782c5f4ef3c2d010a86036.php\". in E:\\xampp7\\htdocs\\banhang\\vendor\\twig\\twig\\lib\\Twig\\Cache\\Filesystem.php:80\nStack trace:\n#0 E:\\xampp7\\htdocs\\banhang\\vendor\\twig\\twig\\lib\\Twig\\Environment.php(452): Twig_Cache_Filesystem->write(\'E:\\\\xampp7\\\\htdoc...\', \'<?php\\n\\n/* E:\\\\xa...\')\n#1 E:\\xampp7\\htdocs\\banhang\\modules\\cms\\classes\\Controller.php(375): Twig_Environment->loadTemplate(\'E:\\\\xampp7\\\\htdoc...\')\n#2 E:\\xampp7\\htdocs\\banhang\\modules\\cms\\classes\\Controller.php(213): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#3 E:\\xampp7\\htdocs\\banhang\\modules\\cms\\classes\\CmsController.php(50): Cms\\Classes\\Controller->run(\'assets/data/tra...\')\n#4 [internal function]: Cms\\Classes\\CmsController->run(\'assets/data/tra...\')\n#5 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(256): call_user_func_array(Array, Array)\n#6 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#7 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), \'run\')\n#8 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#9 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#10 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#11 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#12 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#13 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(68): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#14 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Cms\\\\Classes\\\\Cms...\', \'run\')\n#15 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#16 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#17 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#18 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#19 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#20 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#21 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#22 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(674): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#23 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#24 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#25 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#26 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#27 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#28 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#29 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#30 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#31 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#32 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#33 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#34 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#35 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#36 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#37 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#38 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#39 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#40 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#41 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#42 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#43 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#44 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#45 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#46 E:\\xampp7\\htdocs\\banhang\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#47 {main}', NULL, '2018-02-28 10:27:03', '2018-02-28 10:27:03');
INSERT INTO `system_event_logs` (`id`, `level`, `message`, `details`, `created_at`, `updated_at`) VALUES
(16, 'error', 'October\\Rain\\Exception\\SystemException: The partial \'E:\\xampp7\\htdocs\\banhang/plugins/offline/snipcartshop/controllers/product/_accessories.htm\' is not found. in E:\\xampp7\\htdocs\\banhang\\modules\\system\\traits\\ViewMaker.php:91\nStack trace:\n#0 E:\\xampp7\\htdocs\\banhang\\modules\\backend\\widgets\\form\\partials\\_field_partial.htm(7): Backend\\Classes\\Controller->makePartial(\'$/offline/snipc...\', Array)\n#1 E:\\xampp7\\htdocs\\banhang\\modules\\system\\traits\\ViewMaker.php(244): include(\'E:\\\\xampp7\\\\htdoc...\')\n#2 E:\\xampp7\\htdocs\\banhang\\modules\\system\\traits\\ViewMaker.php(98): Backend\\Classes\\WidgetBase->makeFileContents(\'E:\\\\xampp7\\\\htdoc...\', Array)\n#3 E:\\xampp7\\htdocs\\banhang\\modules\\backend\\widgets\\Form.php(273): Backend\\Classes\\WidgetBase->makePartial(\'_field_partial....\', Array)\n#4 E:\\xampp7\\htdocs\\banhang\\modules\\backend\\widgets\\form\\partials\\_field.htm(22): Backend\\Widgets\\Form->renderFieldElement(Object(Backend\\Classes\\FormField))\n#5 E:\\xampp7\\htdocs\\banhang\\modules\\system\\traits\\ViewMaker.php(244): include(\'E:\\\\xampp7\\\\htdoc...\')\n#6 E:\\xampp7\\htdocs\\banhang\\modules\\system\\traits\\ViewMaker.php(98): Backend\\Classes\\WidgetBase->makeFileContents(\'E:\\\\xampp7\\\\htdoc...\', Array)\n#7 E:\\xampp7\\htdocs\\banhang\\modules\\backend\\widgets\\form\\partials\\_field-container.htm(8): Backend\\Classes\\WidgetBase->makePartial(\'_field.htm\', Array)\n#8 E:\\xampp7\\htdocs\\banhang\\modules\\system\\traits\\ViewMaker.php(244): include(\'E:\\\\xampp7\\\\htdoc...\')\n#9 E:\\xampp7\\htdocs\\banhang\\modules\\system\\traits\\ViewMaker.php(98): Backend\\Classes\\WidgetBase->makeFileContents(\'E:\\\\xampp7\\\\htdoc...\', Array)\n#10 E:\\xampp7\\htdocs\\banhang\\modules\\backend\\widgets\\form\\partials\\_form_fields.htm(2): Backend\\Classes\\WidgetBase->makePartial(\'_field-containe...\', Array)\n#11 E:\\xampp7\\htdocs\\banhang\\modules\\system\\traits\\ViewMaker.php(244): include(\'E:\\\\xampp7\\\\htdoc...\')\n#12 E:\\xampp7\\htdocs\\banhang\\modules\\system\\traits\\ViewMaker.php(98): Backend\\Classes\\WidgetBase->makeFileContents(\'E:\\\\xampp7\\\\htdoc...\', Array)\n#13 E:\\xampp7\\htdocs\\banhang\\modules\\backend\\widgets\\form\\partials\\_form_tabs.htm(27): Backend\\Classes\\WidgetBase->makePartial(\'_form_fields.ht...\', Array)\n#14 E:\\xampp7\\htdocs\\banhang\\modules\\system\\traits\\ViewMaker.php(244): include(\'E:\\\\xampp7\\\\htdoc...\')\n#15 E:\\xampp7\\htdocs\\banhang\\modules\\system\\traits\\ViewMaker.php(98): Backend\\Classes\\WidgetBase->makeFileContents(\'E:\\\\xampp7\\\\htdoc...\', Array)\n#16 E:\\xampp7\\htdocs\\banhang\\modules\\backend\\widgets\\form\\partials\\_section.htm(27): Backend\\Classes\\WidgetBase->makePartial(\'_form_tabs.htm\', Array)\n#17 E:\\xampp7\\htdocs\\banhang\\modules\\system\\traits\\ViewMaker.php(244): include(\'E:\\\\xampp7\\\\htdoc...\')\n#18 E:\\xampp7\\htdocs\\banhang\\modules\\system\\traits\\ViewMaker.php(98): Backend\\Classes\\WidgetBase->makeFileContents(\'E:\\\\xampp7\\\\htdoc...\', Array)\n#19 E:\\xampp7\\htdocs\\banhang\\modules\\backend\\widgets\\form\\partials\\_form.htm(7): Backend\\Classes\\WidgetBase->makePartial(\'_section.htm\', Array)\n#20 E:\\xampp7\\htdocs\\banhang\\modules\\system\\traits\\ViewMaker.php(244): include(\'E:\\\\xampp7\\\\htdoc...\')\n#21 E:\\xampp7\\htdocs\\banhang\\modules\\system\\traits\\ViewMaker.php(98): Backend\\Classes\\WidgetBase->makeFileContents(\'E:\\\\xampp7\\\\htdoc...\', Array)\n#22 E:\\xampp7\\htdocs\\banhang\\modules\\backend\\widgets\\form\\partials\\_form-container.htm(8): Backend\\Classes\\WidgetBase->makePartial(\'_form.htm\')\n#23 E:\\xampp7\\htdocs\\banhang\\modules\\system\\traits\\ViewMaker.php(244): include(\'E:\\\\xampp7\\\\htdoc...\')\n#24 E:\\xampp7\\htdocs\\banhang\\modules\\system\\traits\\ViewMaker.php(98): Backend\\Classes\\WidgetBase->makeFileContents(\'E:\\\\xampp7\\\\htdoc...\', Array)\n#25 E:\\xampp7\\htdocs\\banhang\\modules\\backend\\widgets\\Form.php(227): Backend\\Classes\\WidgetBase->makePartial(\'_form-container...\', Array)\n#26 E:\\xampp7\\htdocs\\banhang\\modules\\backend\\behaviors\\FormController.php(414): Backend\\Widgets\\Form->render(Array)\n#27 [internal function]: Backend\\Behaviors\\FormController->formRender()\n#28 E:\\xampp7\\htdocs\\banhang\\vendor\\october\\rain\\src\\Extension\\ExtendableTrait.php(371): call_user_func_array(Array, Array)\n#29 E:\\xampp7\\htdocs\\banhang\\vendor\\october\\rain\\src\\Extension\\Extendable.php(42): October\\Rain\\Extension\\Extendable->extendableCall(\'formRender\', Array)\n#30 E:\\xampp7\\htdocs\\banhang\\plugins\\offline\\snipcartshop\\controllers\\products\\create.htm(9): October\\Rain\\Extension\\Extendable->__call(\'formRender\', Array)\n#31 E:\\xampp7\\htdocs\\banhang\\modules\\system\\traits\\ViewMaker.php(244): include(\'E:\\\\xampp7\\\\htdoc...\')\n#32 E:\\xampp7\\htdocs\\banhang\\modules\\system\\traits\\ViewMaker.php(110): Backend\\Classes\\Controller->makeFileContents(\'E:\\\\xampp7\\\\htdoc...\')\n#33 E:\\xampp7\\htdocs\\banhang\\modules\\backend\\classes\\Controller.php(375): Backend\\Classes\\Controller->makeView(\'create\')\n#34 E:\\xampp7\\htdocs\\banhang\\modules\\backend\\classes\\Controller.php(257): Backend\\Classes\\Controller->execPageAction(\'create\', Array)\n#35 E:\\xampp7\\htdocs\\banhang\\modules\\backend\\classes\\BackendController.php(112): Backend\\Classes\\Controller->run(\'create\', Array)\n#36 [internal function]: Backend\\Classes\\BackendController->run(\'offline/snipcar...\')\n#37 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(256): call_user_func_array(Array, Array)\n#38 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#39 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Backend\\Classes\\BackendController), Object(Illuminate\\Routing\\Route), \'run\')\n#40 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#41 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#42 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#43 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#44 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#45 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(68): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Backend\\Classes\\BackendController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#46 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Backend\\\\Classes...\', \'run\')\n#47 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#48 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#49 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#50 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#51 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#52 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#53 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#54 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(674): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#55 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#56 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#57 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#58 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#59 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#60 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#61 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#62 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#63 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#64 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#65 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#66 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#67 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#68 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#69 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#70 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#71 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#72 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#73 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(124): call_user_func_array(Array, Array)\n#74 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#75 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#76 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#77 E:\\xampp7\\htdocs\\banhang\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#78 E:\\xampp7\\htdocs\\banhang\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#79 {main}', NULL, '2018-03-10 01:44:41', '2018-03-10 01:44:41');

-- --------------------------------------------------------

--
-- Table structure for table `system_files`
--

CREATE TABLE `system_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `disk_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_size` int(11) NOT NULL,
  `content_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attachment_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attachment_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `system_files`
--

INSERT INTO `system_files` (`id`, `disk_name`, `file_name`, `file_size`, `content_type`, `title`, `description`, `field`, `attachment_id`, `attachment_type`, `is_public`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, '59ec0e9bb4542114639183.jpg', 'photodune-2043745-college-student-s-225x136.jpg', 13338, 'image/jpeg', NULL, NULL, 'featured_images', '2', 'RainLab\\Blog\\Models\\Post', 1, 1, '2017-10-21 20:20:59', '2017-10-21 20:21:05'),
(2, '59ec0ecfb665f435114663.jpg', 'photodune-3517559-idea-s-225x136.jpg', 10528, 'image/jpeg', NULL, NULL, 'featured_images', '3', 'RainLab\\Blog\\Models\\Post', 1, 2, '2017-10-21 20:21:51', '2017-10-21 20:21:55'),
(3, '59ec0ef6a7cf1078320888.jpg', 'photodune-3834701-laughing-girl-xs-225x136.jpg', 9011, 'image/jpeg', NULL, NULL, 'featured_images', '4', 'RainLab\\Blog\\Models\\Post', 1, 3, '2017-10-21 20:22:30', '2017-10-21 20:22:33'),
(4, '59ec0f1629271361817270.jpg', 'shutterstock_2114081-225x136.jpg', 11048, 'image/jpeg', NULL, NULL, 'featured_images', '5', 'RainLab\\Blog\\Models\\Post', 1, 4, '2017-10-21 20:23:02', '2017-10-21 20:23:03'),
(5, '59ec0f348a9a7486780453.jpg', 'shutterstock_58382248-225x136.jpg', 9503, 'image/jpeg', NULL, NULL, 'featured_images', '6', 'RainLab\\Blog\\Models\\Post', 1, 5, '2017-10-21 20:23:32', '2017-10-21 20:23:33'),
(7, '59ec0f6d1ded6343385609.jpg', 'shutterstock_123603871-225x136.jpg', 10809, 'image/jpeg', NULL, NULL, 'featured_images', '8', 'RainLab\\Blog\\Models\\Post', 1, 7, '2017-10-21 20:24:29', '2017-10-21 20:24:37'),
(8, '59ec0f9811487335587856.jpg', 'shutterstock_134257640-371x177.jpg', 24376, 'image/jpeg', NULL, NULL, 'featured_images', '9', 'RainLab\\Blog\\Models\\Post', 1, 8, '2017-10-21 20:25:12', '2017-10-21 20:25:13'),
(9, '59ec0fb072635818782064.jpg', 'shutterstock_123603871-371x177.jpg', 24276, 'image/jpeg', NULL, NULL, 'featured_images', '10', 'RainLab\\Blog\\Models\\Post', 1, 9, '2017-10-21 20:25:36', '2017-10-21 20:25:37'),
(11, '59edff6c7ecc2847597691.jpg', 'photodune-2043745-college-student-s-770x364.jpg', 70480, 'image/jpeg', NULL, NULL, 'featured_images', '7', 'RainLab\\Blog\\Models\\Post', 1, 11, '2017-10-23 07:40:44', '2017-10-23 07:40:47'),
(12, '59ee00ed6d52c649598483.jpg', 'shutterstock_134257640-371x177.jpg', 24376, 'image/jpeg', NULL, NULL, 'featured_images', '11', 'RainLab\\Blog\\Models\\Post', 1, 12, '2017-10-23 07:47:09', '2017-10-23 07:47:11'),
(13, '5a0446792b4ce276473658.jpg', 'shutterstock_109209743-770x364.jpg', 56536, 'image/jpeg', NULL, NULL, 'image', '3', 'Flosch\\Slideshow\\Models\\Slide', 1, 13, '2017-11-09 05:13:45', '2017-11-09 05:13:49'),
(14, '5a04473160d47602736500.jpg', 'shutterstock_123603871-770x364.jpg', 93620, 'image/jpeg', NULL, NULL, 'image', '2', 'Flosch\\Slideshow\\Models\\Slide', 1, 14, '2017-11-09 05:16:49', '2017-11-09 05:16:51');

-- --------------------------------------------------------

--
-- Table structure for table `system_mail_layouts`
--

CREATE TABLE `system_mail_layouts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content_html` text COLLATE utf8_unicode_ci,
  `content_text` text COLLATE utf8_unicode_ci,
  `content_css` text COLLATE utf8_unicode_ci,
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `system_mail_layouts`
--

INSERT INTO `system_mail_layouts` (`id`, `name`, `code`, `content_html`, `content_text`, `content_css`, `is_locked`, `created_at`, `updated_at`) VALUES
(1, 'Default', 'default', '<html>\n    <head>\n        <style type=\"text/css\" media=\"screen\">\n            {{ css|raw }}\n        </style>\n    </head>\n    <body>\n        {{ content|raw }}\n    </body>\n</html>', '{{ content|raw }}', 'a, a:hover {\n    text-decoration: none;\n    color: #0862A2;\n    font-weight: bold;\n}\n\ntd, tr, th, table {\n    padding: 0px;\n    margin: 0px;\n}\n\np {\n    margin: 10px 0;\n}', 1, '2017-10-21 19:47:49', '2017-10-21 19:47:49'),
(2, 'System', 'system', '<html>\n    <head>\n        <style type=\"text/css\" media=\"screen\">\n            {{ css|raw }}\n        </style>\n    </head>\n    <body>\n        {{ content|raw }}\n        <hr />\n        <p>This is an automatic message. Please do not reply to it.</p>\n    </body>\n</html>', '{{ content|raw }}\n\n\n---\nThis is an automatic message. Please do not reply to it.', 'a, a:hover {\n    text-decoration: none;\n    color: #0862A2;\n    font-weight: bold;\n}\n\ntd, tr, th, table {\n    padding: 0px;\n    margin: 0px;\n}\n\np {\n    margin: 10px 0;\n}', 1, '2017-10-21 19:47:49', '2017-10-21 19:47:49');

-- --------------------------------------------------------

--
-- Table structure for table `system_mail_templates`
--

CREATE TABLE `system_mail_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `content_html` text COLLATE utf8_unicode_ci,
  `content_text` text COLLATE utf8_unicode_ci,
  `layout_id` int(11) DEFAULT NULL,
  `is_custom` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_parameters`
--

CREATE TABLE `system_parameters` (
  `id` int(10) UNSIGNED NOT NULL,
  `namespace` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `item` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `system_parameters`
--

INSERT INTO `system_parameters` (`id`, `namespace`, `group`, `item`, `value`) VALUES
(1, 'system', 'update', 'count', '5'),
(2, 'system', 'core', 'hash', '\"386846ebe3802c4f192625743abb3f06\"'),
(3, 'system', 'core', 'build', '\"419\"'),
(4, 'system', 'update', 'retry', '1526489651'),
(5, 'cms', 'theme', 'active', '\"kenshinEcommerce\"');

-- --------------------------------------------------------

--
-- Table structure for table `system_plugin_history`
--

CREATE TABLE `system_plugin_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `detail` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `system_plugin_history`
--

INSERT INTO `system_plugin_history` (`id`, `code`, `type`, `version`, `detail`, `created_at`) VALUES
(2, 'RainLab.Blog', 'script', '1.0.1', 'create_posts_table.php', '2017-10-21 20:09:51'),
(3, 'RainLab.Blog', 'script', '1.0.1', 'create_categories_table.php', '2017-10-21 20:09:51'),
(4, 'RainLab.Blog', 'script', '1.0.1', 'seed_all_tables.php', '2017-10-21 20:09:52'),
(5, 'RainLab.Blog', 'comment', '1.0.1', 'Initialize plugin.', '2017-10-21 20:09:52'),
(6, 'RainLab.Blog', 'comment', '1.0.2', 'Added the processed HTML content column to the posts table.', '2017-10-21 20:09:52'),
(7, 'RainLab.Blog', 'comment', '1.0.3', 'Category component has been merged with Posts component.', '2017-10-21 20:09:52'),
(8, 'RainLab.Blog', 'comment', '1.0.4', 'Improvements to the Posts list management UI.', '2017-10-21 20:09:52'),
(9, 'RainLab.Blog', 'comment', '1.0.5', 'Removes the Author column from blog post list.', '2017-10-21 20:09:52'),
(10, 'RainLab.Blog', 'comment', '1.0.6', 'Featured images now appear in the Post component.', '2017-10-21 20:09:52'),
(11, 'RainLab.Blog', 'comment', '1.0.7', 'Added support for the Static Pages menus.', '2017-10-21 20:09:52'),
(12, 'RainLab.Blog', 'comment', '1.0.8', 'Added total posts to category list.', '2017-10-21 20:09:52'),
(13, 'RainLab.Blog', 'comment', '1.0.9', 'Added support for the Sitemap plugin.', '2017-10-21 20:09:52'),
(14, 'RainLab.Blog', 'comment', '1.0.10', 'Added permission to prevent users from seeing posts they did not create.', '2017-10-21 20:09:52'),
(15, 'RainLab.Blog', 'comment', '1.0.11', 'Deprecate \"idParam\" component property in favour of \"slug\" property.', '2017-10-21 20:09:52'),
(16, 'RainLab.Blog', 'comment', '1.0.12', 'Fixes issue where images cannot be uploaded caused by latest Markdown library.', '2017-10-21 20:09:52'),
(17, 'RainLab.Blog', 'comment', '1.0.13', 'Fixes problem with providing pages to Sitemap and Pages plugins.', '2017-10-21 20:09:52'),
(18, 'RainLab.Blog', 'comment', '1.0.14', 'Add support for CSRF protection feature added to core.', '2017-10-21 20:09:52'),
(19, 'RainLab.Blog', 'comment', '1.1.0', 'Replaced the Post editor with the new core Markdown editor.', '2017-10-21 20:09:52'),
(20, 'RainLab.Blog', 'comment', '1.1.1', 'Posts can now be imported and exported.', '2017-10-21 20:09:52'),
(21, 'RainLab.Blog', 'comment', '1.1.2', 'Posts are no longer visible if the published date has not passed.', '2017-10-21 20:09:52'),
(22, 'RainLab.Blog', 'comment', '1.1.3', 'Added a New Post shortcut button to the blog menu.', '2017-10-21 20:09:52'),
(23, 'RainLab.Blog', 'script', '1.2.0', 'categories_add_nested_fields.php', '2017-10-21 20:09:52'),
(24, 'RainLab.Blog', 'comment', '1.2.0', 'Categories now support nesting.', '2017-10-21 20:09:52'),
(25, 'RainLab.Blog', 'comment', '1.2.1', 'Post slugs now must be unique.', '2017-10-21 20:09:52'),
(26, 'RainLab.Blog', 'comment', '1.2.2', 'Fixes issue on new installs.', '2017-10-21 20:09:52'),
(27, 'RainLab.Blog', 'comment', '1.2.3', 'Minor user interface update.', '2017-10-21 20:09:52'),
(28, 'RainLab.Blog', 'script', '1.2.4', 'update_timestamp_nullable.php', '2017-10-21 20:09:52'),
(29, 'RainLab.Blog', 'comment', '1.2.4', 'Database maintenance. Updated all timestamp columns to be nullable.', '2017-10-21 20:09:52'),
(30, 'RainLab.Blog', 'comment', '1.2.5', 'Added translation support for blog posts.', '2017-10-21 20:09:52'),
(31, 'RainLab.Blog', 'comment', '1.2.6', 'The published field can now supply a time with the date.', '2017-10-21 20:09:52'),
(32, 'RainLab.Blog', 'comment', '1.2.7', 'Introduced a new RSS feed component.', '2017-10-21 20:09:52'),
(33, 'RainLab.Blog', 'comment', '1.2.8', 'Fixes issue with translated `content_html` attribute on blog posts.', '2017-10-21 20:09:52'),
(34, 'RainLab.Blog', 'comment', '1.2.9', 'Added translation support for blog categories.', '2017-10-21 20:09:52'),
(35, 'RainLab.Blog', 'comment', '1.2.10', 'Added translation support for post slugs.', '2017-10-21 20:09:52'),
(36, 'RainLab.Blog', 'comment', '1.2.11', 'Fixes bug where excerpt is not translated.', '2017-10-21 20:09:52'),
(37, 'RainLab.Blog', 'comment', '1.2.12', 'Description field added to category form.', '2017-10-21 20:09:52'),
(38, 'RainLab.Blog', 'comment', '1.2.13', 'Improved support for Static Pages menus, added a blog post and all blog posts.', '2017-10-21 20:09:52'),
(39, 'RainLab.Blog', 'comment', '1.2.14', 'Added post exception property to the post list component, useful for showing related posts.', '2017-10-21 20:09:52'),
(40, 'RainLab.Blog', 'comment', '1.2.15', 'Back-end navigation sort order updated.', '2017-10-21 20:09:52'),
(41, 'RainLab.Blog', 'comment', '1.2.16', 'Added `nextPost` and `previousPost` to the blog post component.', '2017-10-21 20:09:52'),
(92, 'RainLab.Pages', 'comment', '1.0.1', 'Implemented the static pages management and the Static Page component.', '2017-10-28 08:40:30'),
(93, 'RainLab.Pages', 'comment', '1.0.2', 'Fixed the page preview URL.', '2017-10-28 08:40:30'),
(94, 'RainLab.Pages', 'comment', '1.0.3', 'Implemented menus.', '2017-10-28 08:40:30'),
(95, 'RainLab.Pages', 'comment', '1.0.4', 'Implemented the content block management and placeholder support.', '2017-10-28 08:40:30'),
(96, 'RainLab.Pages', 'comment', '1.0.5', 'Added support for the Sitemap plugin.', '2017-10-28 08:40:30'),
(97, 'RainLab.Pages', 'comment', '1.0.6', 'Minor updates to the internal API.', '2017-10-28 08:40:30'),
(98, 'RainLab.Pages', 'comment', '1.0.7', 'Added the Snippets feature.', '2017-10-28 08:40:30'),
(99, 'RainLab.Pages', 'comment', '1.0.8', 'Minor improvements to the code.', '2017-10-28 08:40:30'),
(100, 'RainLab.Pages', 'comment', '1.0.9', 'Fixes issue where Snippet tab is missing from the Partials form.', '2017-10-28 08:40:30'),
(101, 'RainLab.Pages', 'comment', '1.0.10', 'Add translations for various locales.', '2017-10-28 08:40:30'),
(102, 'RainLab.Pages', 'comment', '1.0.11', 'Fixes issue where placeholders tabs were missing from Page form.', '2017-10-28 08:40:30'),
(103, 'RainLab.Pages', 'comment', '1.0.12', 'Implement Media Manager support.', '2017-10-28 08:40:30'),
(104, 'RainLab.Pages', 'script', '1.1.0', 'snippets_rename_viewbag_properties.php', '2017-10-28 08:40:30'),
(105, 'RainLab.Pages', 'comment', '1.1.0', 'Adds meta title and description to pages. Adds |staticPage filter.', '2017-10-28 08:40:30'),
(106, 'RainLab.Pages', 'comment', '1.1.1', 'Add support for Syntax Fields.', '2017-10-28 08:40:30'),
(107, 'RainLab.Pages', 'comment', '1.1.2', 'Static Breadcrumbs component now respects the hide from navigation setting.', '2017-10-28 08:40:30'),
(108, 'RainLab.Pages', 'comment', '1.1.3', 'Minor back-end styling fix.', '2017-10-28 08:40:30'),
(109, 'RainLab.Pages', 'comment', '1.1.4', 'Minor fix to the StaticPage component API.', '2017-10-28 08:40:30'),
(110, 'RainLab.Pages', 'comment', '1.1.5', 'Fixes bug when using syntax fields.', '2017-10-28 08:40:30'),
(111, 'RainLab.Pages', 'comment', '1.1.6', 'Minor styling fix to the back-end UI.', '2017-10-28 08:40:30'),
(112, 'RainLab.Pages', 'comment', '1.1.7', 'Improved menu item form to include CSS class, open in a new window and hidden flag.', '2017-10-28 08:40:30'),
(113, 'RainLab.Pages', 'comment', '1.1.8', 'Improved the output of snippet partials when saved.', '2017-10-28 08:40:31'),
(114, 'RainLab.Pages', 'comment', '1.1.9', 'Minor update to snippet inspector internal API.', '2017-10-28 08:40:31'),
(115, 'RainLab.Pages', 'comment', '1.1.10', 'Fixes a bug where selecting a layout causes permanent unsaved changes.', '2017-10-28 08:40:31'),
(116, 'RainLab.Pages', 'comment', '1.1.11', 'Add support for repeater syntax field.', '2017-10-28 08:40:31'),
(117, 'RainLab.Pages', 'comment', '1.2.0', 'Added support for translations, UI updates.', '2017-10-28 08:40:31'),
(118, 'RainLab.Pages', 'comment', '1.2.1', 'Use nice titles when listing the content files.', '2017-10-28 08:40:31'),
(119, 'RainLab.Pages', 'comment', '1.2.2', 'Minor styling update.', '2017-10-28 08:40:31'),
(120, 'RainLab.Pages', 'comment', '1.2.3', 'Snippets can now be moved by dragging them.', '2017-10-28 08:40:31'),
(121, 'RainLab.Pages', 'comment', '1.2.4', 'Fixes a bug where the cursor is misplaced when editing text files.', '2017-10-28 08:40:31'),
(122, 'RainLab.Pages', 'comment', '1.2.5', 'Fixes a bug where the parent page is lost upon changing a page layout.', '2017-10-28 08:40:31'),
(123, 'RainLab.Pages', 'comment', '1.2.6', 'Shared view variables are now passed to static pages.', '2017-10-28 08:40:31'),
(124, 'RainLab.Pages', 'comment', '1.2.7', 'Fixes issue with duplicating properties when adding multiple snippets on the same page.', '2017-10-28 08:40:31'),
(125, 'RainLab.Pages', 'comment', '1.2.8', 'Fixes a bug where creating a content block without extension doesn\'t save the contents to file.', '2017-10-28 08:40:31'),
(126, 'RainLab.Pages', 'comment', '1.2.9', 'Add conditional support for translating page URLs.', '2017-10-28 08:40:31'),
(127, 'RainLab.Pages', 'comment', '1.2.10', 'Streamline generation of URLs to use the new Cms::url helper.', '2017-10-28 08:40:31'),
(128, 'RainLab.Pages', 'comment', '1.2.11', 'Implements repeater usage with translate plugin.', '2017-10-28 08:40:31'),
(129, 'RainLab.Pages', 'comment', '1.2.12', 'Fixes minor issue when using snippets and switching the application locale.', '2017-10-28 08:40:31'),
(130, 'RainLab.Pages', 'comment', '1.2.13', 'Fixes bug when AJAX is used on a page that does not yet exist.', '2017-10-28 08:40:31'),
(131, 'RainLab.Pages', 'comment', '1.2.14', 'Add theme logging support for changes made to menus.', '2017-10-28 08:40:31'),
(132, 'RainLab.Pages', 'comment', '1.2.15', 'Back-end navigation sort order updated.', '2017-10-28 08:40:31'),
(133, 'RainLab.Pages', 'comment', '1.2.16', 'Fixes a bug when saving a template that has been modified outside of the CMS (mtime mismatch).', '2017-10-28 08:40:31'),
(134, 'Flosch.Slideshow', 'script', '1.0.1', 'create_slideshows_table.php', '2017-10-28 08:40:56'),
(135, 'Flosch.Slideshow', 'script', '1.0.1', 'create_slides_table.php', '2017-10-28 08:40:56'),
(136, 'Flosch.Slideshow', 'script', '1.0.1', 'seeder.php', '2017-10-28 08:40:56'),
(137, 'Flosch.Slideshow', 'comment', '1.0.1', 'First version of Slideshow', '2017-10-28 08:40:56'),
(138, 'Flosch.Slideshow', 'script', '1.0.2', 'table_update_flosch_slideshow_slides.php', '2017-10-28 08:40:57'),
(139, 'Flosch.Slideshow', 'comment', '1.0.2', 'Added is_published state and publication dates', '2017-10-28 08:40:57'),
(140, 'Flosch.Slideshow', 'comment', '1.0.3', 'Update documentation for Twitter Bootstrap sources', '2017-10-28 08:40:57'),
(141, 'Flosch.Slideshow', 'comment', '1.0.4', 'Update slides published query-scope (correct dates comparison)', '2017-10-28 08:40:57'),
(142, 'Flosch.Slideshow', 'comment', '1.0.5', 'Fix permission settings', '2017-10-28 08:40:57'),
(143, 'Flosch.Slideshow', 'script', '1.0.6', 'Add french translation', '2017-10-28 08:40:57'),
(144, 'Flosch.Slideshow', 'comment', '1.0.6', 'Add persian translation (thanks to @cracki)', '2017-10-28 08:40:57'),
(145, 'Flosch.Slideshow', 'comment', '1.0.7', 'Add german translation (thanks to @danielbruni)', '2017-10-28 08:40:57'),
(146, 'Flosch.Slideshow', 'comment', '1.0.8', 'Correct columns definition (thanks to @Jeime)', '2017-10-28 08:40:57'),
(147, 'Kenshin.Facebook', 'comment', '1.0.1', '- First version', '2017-10-31 05:00:37'),
(148, 'Bedard.BlogTags', 'script', '1.0.1', 'create_tags_table.php', '2017-11-08 04:20:20'),
(149, 'Bedard.BlogTags', 'comment', '1.0.1', 'First version of Blog Tags Extension', '2017-11-08 04:20:20'),
(150, 'Bedard.BlogTags', 'comment', '1.0.2', 'Minor fix', '2017-11-08 04:20:20'),
(151, 'Bedard.BlogTags', 'comment', '1.1.0', 'Added optional pagination to the blogTagSearch component.', '2017-11-08 04:20:20'),
(152, 'Bedard.BlogTags', 'comment', '1.1.1', 'Bug fix', '2017-11-08 04:20:20'),
(153, 'Bedard.BlogTags', 'comment', '1.1.2', 'Replace deprecated method', '2017-11-08 04:20:20'),
(154, 'Bedard.BlogTags', 'comment', '1.2.0', 'Upgrades for RC, and adds several new features.', '2017-11-08 04:20:20'),
(155, 'Bedard.BlogTags', 'comment', '1.2.1', 'Removed getters to make plugin more accessible.', '2017-11-08 04:20:20'),
(156, 'Bedard.BlogTags', 'comment', '1.3.0', 'PostgreSQL support and various bug fixes', '2017-11-08 04:20:20'),
(157, 'Bedard.BlogTags', 'script', '1.3.1', 'update_timestamp_nullable.php', '2017-11-08 04:20:20'),
(158, 'Bedard.BlogTags', 'comment', '1.3.1', 'Database maintenance. Updated all timestamp columns to be nullable.', '2017-11-08 04:20:20'),
(159, 'Bedard.BlogTags', 'comment', '1.3.2', 'Add slugify configuration option (vojtasvoboda)', '2017-11-08 04:20:20'),
(160, 'Bedard.BlogTags', 'comment', '1.3.3', 'Use native taglist and add translation file.', '2017-11-08 04:20:20'),
(161, 'Bedard.BlogTags', 'comment', '1.3.4', 'Add MIT license (gergo85)', '2017-11-08 04:20:20'),
(162, 'Bedard.BlogTags', 'comment', '1.3.5', 'Add Hungarian translation (gergo85)', '2017-11-08 04:20:20'),
(163, 'Bedard.BlogTags', 'comment', '1.3.6', 'Add German translation (justb81)', '2017-11-08 04:20:20'),
(164, 'Bedard.BlogTags', 'script', '1.3.7', 'add_slug_column.php', '2017-11-08 04:20:20'),
(165, 'Bedard.BlogTags', 'comment', '1.3.7', 'Add slug field to tags (Fl0Cri)', '2017-11-08 04:20:20'),
(166, 'Bedard.BlogTags', 'comment', '1.4.0', '!!! A slug is now created for each tag.', '2017-11-08 04:20:20'),
(167, 'RainLab.Translate', 'script', '1.0.1', 'create_messages_table.php', '2017-11-16 05:23:29'),
(168, 'RainLab.Translate', 'script', '1.0.1', 'create_attributes_table.php', '2017-11-16 05:23:29'),
(169, 'RainLab.Translate', 'script', '1.0.1', 'create_locales_table.php', '2017-11-16 05:23:30'),
(170, 'RainLab.Translate', 'script', '1.0.1', 'seed_all_tables.php', '2017-11-16 05:23:30'),
(171, 'RainLab.Translate', 'comment', '1.0.1', 'First version of Translate', '2017-11-16 05:23:30'),
(172, 'RainLab.Translate', 'comment', '1.0.2', 'Languages and Messages can now be deleted.', '2017-11-16 05:23:30'),
(173, 'RainLab.Translate', 'comment', '1.0.3', 'Minor updates for latest October release.', '2017-11-16 05:23:30'),
(174, 'RainLab.Translate', 'comment', '1.0.4', 'Locale cache will clear when updating a language.', '2017-11-16 05:23:30'),
(175, 'RainLab.Translate', 'comment', '1.0.5', 'Add Spanish language and fix plugin config.', '2017-11-16 05:23:30'),
(176, 'RainLab.Translate', 'comment', '1.0.6', 'Minor improvements to the code.', '2017-11-16 05:23:30'),
(177, 'RainLab.Translate', 'comment', '1.0.7', 'Fixes major bug where translations are skipped entirely!', '2017-11-16 05:23:30'),
(178, 'RainLab.Translate', 'comment', '1.0.8', 'Minor bug fixes.', '2017-11-16 05:23:30'),
(179, 'RainLab.Translate', 'comment', '1.0.9', 'Fixes an issue where newly created models lose their translated values.', '2017-11-16 05:23:30'),
(180, 'RainLab.Translate', 'comment', '1.0.10', 'Minor fix for latest build.', '2017-11-16 05:23:30'),
(181, 'RainLab.Translate', 'comment', '1.0.11', 'Fix multilingual rich editor when used in stretch mode.', '2017-11-16 05:23:30'),
(182, 'RainLab.Translate', 'comment', '1.1.0', 'Introduce compatibility with RainLab.Pages plugin.', '2017-11-16 05:23:30'),
(183, 'RainLab.Translate', 'comment', '1.1.1', 'Minor UI fix to the language picker.', '2017-11-16 05:23:30'),
(184, 'RainLab.Translate', 'comment', '1.1.2', 'Add support for translating Static Content files.', '2017-11-16 05:23:30'),
(185, 'RainLab.Translate', 'comment', '1.1.3', 'Improved support for the multilingual rich editor.', '2017-11-16 05:23:30'),
(186, 'RainLab.Translate', 'comment', '1.1.4', 'Adds new multilingual markdown editor.', '2017-11-16 05:23:30'),
(187, 'RainLab.Translate', 'comment', '1.1.5', 'Minor update to the multilingual control API.', '2017-11-16 05:23:30'),
(188, 'RainLab.Translate', 'comment', '1.1.6', 'Minor improvements in the message editor.', '2017-11-16 05:23:30'),
(189, 'RainLab.Translate', 'comment', '1.1.7', 'Fixes bug not showing content when first loading multilingual textarea controls.', '2017-11-16 05:23:30'),
(190, 'RainLab.Translate', 'comment', '1.2.0', 'CMS pages now support translating the URL.', '2017-11-16 05:23:30'),
(191, 'RainLab.Translate', 'comment', '1.2.1', 'Minor update in the rich editor and code editor language control position.', '2017-11-16 05:23:30'),
(192, 'RainLab.Translate', 'comment', '1.2.2', 'Static Pages now support translating the URL.', '2017-11-16 05:23:30'),
(193, 'RainLab.Translate', 'comment', '1.2.3', 'Fixes Rich Editor when inserting a page link.', '2017-11-16 05:23:30'),
(194, 'RainLab.Translate', 'script', '1.2.4', 'create_indexes_table.php', '2017-11-16 05:23:30'),
(195, 'RainLab.Translate', 'comment', '1.2.4', 'Translatable attributes can now be declared as indexes.', '2017-11-16 05:23:30'),
(196, 'RainLab.Translate', 'comment', '1.2.5', 'Adds new multilingual repeater form widget.', '2017-11-16 05:23:30'),
(197, 'RainLab.Translate', 'comment', '1.2.6', 'Fixes repeater usage with static pages plugin.', '2017-11-16 05:23:30'),
(198, 'RainLab.Translate', 'comment', '1.2.7', 'Fixes placeholder usage with static pages plugin.', '2017-11-16 05:23:30'),
(199, 'RainLab.Translate', 'comment', '1.2.8', 'Improvements to code for latest October build compatibility.', '2017-11-16 05:23:30'),
(200, 'RainLab.Translate', 'comment', '1.2.9', 'Fixes context for translated strings when used with Static Pages.', '2017-11-16 05:23:30'),
(201, 'RainLab.Translate', 'comment', '1.2.10', 'Minor UI fix to the multilingual repeater.', '2017-11-16 05:23:30'),
(202, 'RainLab.Translate', 'comment', '1.2.11', 'Fixes translation not working with partials loaded via AJAX', '2017-11-16 05:23:30'),
(241, 'OFFLINE.SnipcartShop', 'script', '1.0.1', 'builder_table_create_offline_snipcartshop_products.php', '2018-05-05 08:49:53'),
(242, 'OFFLINE.SnipcartShop', 'script', '1.0.1', 'builder_table_create_offline_snipcartshop_product_variants.php', '2018-05-05 08:49:53'),
(243, 'OFFLINE.SnipcartShop', 'script', '1.0.1', 'builder_table_create_offline_snipcartshop_product_custom_fields.php', '2018-05-05 08:49:53'),
(244, 'OFFLINE.SnipcartShop', 'script', '1.0.1', 'builder_table_create_offline_snipcartshop_product_custom_field_options.php', '2018-05-05 08:49:53'),
(245, 'OFFLINE.SnipcartShop', 'script', '1.0.1', 'builder_table_create_offline_snipcartshop_product_variant_custom_field_option.php', '2018-05-05 08:49:53'),
(246, 'OFFLINE.SnipcartShop', 'script', '1.0.1', 'builder_table_create_offline_snipcartshop_categories.php', '2018-05-05 08:49:54'),
(247, 'OFFLINE.SnipcartShop', 'script', '1.0.1', 'builder_table_create_offline_snipcartshop_category_product.php', '2018-05-05 08:49:54'),
(248, 'OFFLINE.SnipcartShop', 'script', '1.0.1', 'builder_table_create_offline_snipcartshop_orders.php', '2018-05-05 08:49:54'),
(249, 'OFFLINE.SnipcartShop', 'script', '1.0.1', 'builder_table_create_offline_snipcartshop_order_items.php', '2018-05-05 08:49:54'),
(250, 'OFFLINE.SnipcartShop', 'script', '1.0.1', 'builder_table_create_offline_snipcartshop_discounts.php', '2018-05-05 08:49:54'),
(251, 'OFFLINE.SnipcartShop', 'comment', '1.0.1', 'Initial release.', '2018-05-05 08:49:54'),
(252, 'OFFLINE.SnipcartShop', 'script', '1.0.2', 'builder_table_update_offline_snipcartshop_products.php', '2018-05-05 08:49:54'),
(253, 'OFFLINE.SnipcartShop', 'comment', '1.0.2', 'Added support for product attributes, downloads and links // Optimized price validation', '2018-05-05 08:49:54'),
(254, 'OFFLINE.SnipcartShop', 'script', '1.0.3', 'builder_table_create_offline_snipcartshop_product_accessory.php', '2018-05-05 08:49:54'),
(255, 'OFFLINE.SnipcartShop', 'comment', '1.0.3', 'Added support for product accessories', '2018-05-05 08:49:54'),
(256, 'OFFLINE.SnipcartShop', 'comment', '1.0.4', 'Fixed incorrect database schema generation (thanks to abhi1693)', '2018-05-05 08:49:54'),
(257, 'OFFLINE.SnipcartShop', 'comment', '1.0.5', 'Enable support on Windows systems and make Rainlab.Translate dependency optional', '2018-05-05 08:49:54'),
(258, 'OFFLINE.SnipcartShop', 'script', '1.0.6', 'set_sort_order_defaults.php', '2018-05-05 08:49:55'),
(259, 'OFFLINE.SnipcartShop', 'comment', '1.0.6', 'Fixed issues with MySQL instances that run in strict mode', '2018-05-05 08:49:55'),
(260, 'OFFLINE.SnipcartShop', 'comment', '1.0.7', 'Prevent generation of empty sub-category lists', '2018-05-05 08:49:55'),
(261, 'OFFLINE.SnipcartShop', 'comment', '1.0.8', 'Fixed price handling with product variants and generation of category slugs', '2018-05-05 08:49:55'),
(262, 'OFFLINE.SnipcartShop', 'comment', '1.0.9', 'Use category slug in sub categories directly', '2018-05-05 08:49:55'),
(263, 'OFFLINE.SnipcartShop', 'comment', '1.0.10', 'Added missing categoryPage param', '2018-05-05 08:49:55'),
(264, 'OFFLINE.SnipcartShop', 'comment', '1.0.11', 'Added is_accessory_of relationship to articles', '2018-05-05 08:49:56'),
(265, 'OFFLINE.SnipcartShop', 'comment', '1.0.12', 'Added new Snipcart Webhook fields', '2018-05-05 08:49:56'),
(266, 'OFFLINE.SnipcartShop', 'comment', '1.0.13', 'Fixed generation of quantitiy attributes in product markup', '2018-05-05 08:49:56'),
(267, 'OFFLINE.SnipcartShop', 'comment', '1.0.14', 'Added workaround to make translation of product attributes work as expected', '2018-05-05 08:49:56'),
(268, 'OFFLINE.SnipcartShop', 'comment', '1.0.15', 'Added maximum number of usages field to discouts', '2018-05-05 08:49:56'),
(269, 'OFFLINE.SnipcartShop', 'comment', '1.0.16', 'Fixed invalid relationship column in products list', '2018-05-05 08:49:56'),
(270, 'OFFLINE.SnipcartShop', 'comment', '1.0.17', 'Prevent a bug with discounts where the trigger type gets ignored by Snipcart', '2018-05-05 08:49:56'),
(271, 'OFFLINE.SnipcartShop', 'comment', '1.0.18', 'Added option to display custom fields directly on the product page', '2018-05-05 08:49:56'),
(272, 'OFFLINE.SnipcartShop', 'comment', '1.0.19', 'Implemented category images', '2018-05-05 08:49:56'),
(273, 'OFFLINE.SnipcartShop', 'script', '1.0.20', 'builder_table_update_offline_snipcartshop_categories.php', '2018-05-05 08:49:56'),
(274, 'OFFLINE.SnipcartShop', 'comment', '1.0.20', 'Added unique code field to better identify categories in frontend partials', '2018-05-05 08:49:56'),
(275, 'OFFLINE.SnipcartShop', 'comment', '1.0.21', 'Added options for continue shopping button and split first and last name fields', '2018-05-05 08:49:56'),
(276, 'OFFLINE.SnipcartShop', 'comment', '1.0.22', 'Fixed backend search and made components work without categories', '2018-05-05 08:49:56'),
(277, 'OFFLINE.SnipcartShop', 'comment', '1.0.23', 'Calculating new price immediately after changing custom fields on the product page', '2018-05-05 08:49:56'),
(278, 'OFFLINE.SnipcartShop', 'script', '1.0.24', 'make_order_fields_nullable.php', '2018-05-05 08:49:56'),
(279, 'OFFLINE.SnipcartShop', 'comment', '1.0.24', 'Made order fields nullable', '2018-05-05 08:49:56'),
(280, 'OFFLINE.SnipcartShop', 'comment', '1.0.25', 'Fixed \"show all products\" option on products component', '2018-05-05 08:49:56'),
(281, 'OFFLINE.SnipcartShop', 'script', '1.0.26', 'make_order_items_fields_nullable.php', '2018-05-05 08:49:56'),
(282, 'OFFLINE.SnipcartShop', 'comment', '1.0.26', 'Made order items fields nullable', '2018-05-05 08:49:56'),
(283, 'OFFLINE.SnipcartShop', 'comment', '1.0.27', 'Fixed custom attribute dropdowns when using SQLite', '2018-05-05 08:49:56'),
(284, 'OFFLINE.SnipcartShop', 'comment', '1.0.28', 'Added category filter to products list', '2018-05-05 08:49:56'),
(285, 'OFFLINE.SnipcartShop', 'comment', '1.0.29', 'Moved frontend price calculation into a separate partial', '2018-05-05 08:49:56'),
(286, 'OFFLINE.SnipcartShop', 'script', '1.0.30', 'builder_table_update_offline_snipcartshop_orders.php', '2018-05-05 08:49:56'),
(287, 'OFFLINE.SnipcartShop', 'comment', '1.0.30', 'Tracking used discount codes for orders', '2018-05-05 08:49:56'),
(288, 'OFFLINE.SnipcartShop', 'comment', '1.0.31', 'Implemented new Snipcart Webhook fields', '2018-05-05 08:49:56'),
(289, 'OFFLINE.SnipcartShop', 'comment', '1.0.32', 'Added orders export functionality', '2018-05-05 08:49:56'),
(290, 'OFFLINE.SnipcartShop', 'comment', '1.0.33', 'Implemented custom currency formats', '2018-05-05 08:49:56'),
(291, 'OFFLINE.SnipcartShop', 'comment', '1.0.34', 'Added dependency on Rainlab.Translate', '2018-05-05 08:49:56'),
(292, 'OFFLINE.SnipcartShop', 'comment', '1.0.35', 'Added support for new October Build 420 on Laravel 5.5', '2018-05-05 08:49:56'),
(293, 'OFFLINE.SnipcartShop', 'comment', '1.0.36', 'Fixed compatibility with new Snipcart Webhook fields', '2018-05-05 08:49:56'),
(294, 'OFFLINE.SnipcartShop', 'comment', '1.0.37', 'Fixed bugs when receiving Snipcart webhooks', '2018-05-05 08:49:56'),
(295, 'OFFLINE.SnipcartShop', 'comment', '1.0.38', 'Fixed dependency definition on RainLab.Translate', '2018-05-05 08:49:56'),
(296, 'OFFLINE.SnipcartShop', 'comment', '1.0.39', 'Changed json column types to text for new installations since it is causing problems with old MySQL versions', '2018-05-05 08:49:56');

-- --------------------------------------------------------

--
-- Table structure for table `system_plugin_versions`
--

CREATE TABLE `system_plugin_versions` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0',
  `is_frozen` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `system_plugin_versions`
--

INSERT INTO `system_plugin_versions` (`id`, `code`, `version`, `created_at`, `is_disabled`, `is_frozen`) VALUES
(2, 'RainLab.Blog', '1.2.16', '2017-10-21 20:09:52', 0, 0),
(4, 'RainLab.Pages', '1.2.16', '2017-10-28 08:40:31', 0, 0),
(5, 'Flosch.Slideshow', '1.0.8', '2017-10-28 08:40:57', 0, 0),
(6, 'Kenshin.Facebook', '1.0.1', '2017-10-31 05:00:37', 0, 0),
(7, 'Bedard.BlogTags', '1.4.0', '2017-11-08 04:20:20', 0, 0),
(8, 'RainLab.Translate', '1.2.11', '2017-11-16 05:23:30', 0, 0),
(12, 'OFFLINE.SnipcartShop', '1.0.39', '2018-05-05 08:49:56', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `system_request_logs`
--

CREATE TABLE `system_request_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `status_code` int(11) DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `referer` text COLLATE utf8_unicode_ci,
  `count` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_revisions`
--

CREATE TABLE `system_revisions` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cast` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `old_value` text COLLATE utf8_unicode_ci,
  `new_value` text COLLATE utf8_unicode_ci,
  `revisionable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `revisionable_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `item` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `item`, `value`) VALUES
(1, 'lovata_shopaholic_settings', '{\"check_offer_active\":\"1\",\"decimals\":\"\",\"dec_point\":\"dot\",\"thousands_sep\":\"together\",\"currency\":\"\"}'),
(2, 'offline_snipcartshop_settings', '{\"webhookUrl\":\"5RnxceQUKhPLnvvhZIcFCn71iWYw6Q\"}');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `backend_access_log`
--
ALTER TABLE `backend_access_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `backend_users`
--
ALTER TABLE `backend_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login_unique` (`login`),
  ADD UNIQUE KEY `email_unique` (`email`),
  ADD KEY `act_code_index` (`activation_code`),
  ADD KEY `reset_code_index` (`reset_password_code`);

--
-- Indexes for table `backend_users_groups`
--
ALTER TABLE `backend_users_groups`
  ADD PRIMARY KEY (`user_id`,`user_group_id`);

--
-- Indexes for table `backend_user_groups`
--
ALTER TABLE `backend_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_unique` (`name`),
  ADD KEY `code_index` (`code`);

--
-- Indexes for table `backend_user_preferences`
--
ALTER TABLE `backend_user_preferences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_item_index` (`user_id`,`namespace`,`group`,`item`);

--
-- Indexes for table `backend_user_throttle`
--
ALTER TABLE `backend_user_throttle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `backend_user_throttle_user_id_index` (`user_id`),
  ADD KEY `backend_user_throttle_ip_address_index` (`ip_address`);

--
-- Indexes for table `bedard_blogtags_post_tag`
--
ALTER TABLE `bedard_blogtags_post_tag`
  ADD KEY `bedard_blogtags_post_tag_tag_id_post_id_index` (`tag_id`,`post_id`),
  ADD KEY `bedard_blogtags_post_tag_post_id_foreign` (`post_id`);

--
-- Indexes for table `bedard_blogtags_tags`
--
ALTER TABLE `bedard_blogtags_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bedard_blogtags_tags_name_unique` (`name`),
  ADD UNIQUE KEY `bedard_blogtags_tags_slug_unique` (`slug`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD UNIQUE KEY `cache_key_unique` (`key`);

--
-- Indexes for table `cms_theme_data`
--
ALTER TABLE `cms_theme_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cms_theme_data_theme_index` (`theme`);

--
-- Indexes for table `cms_theme_logs`
--
ALTER TABLE `cms_theme_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cms_theme_logs_type_index` (`type`),
  ADD KEY `cms_theme_logs_theme_index` (`theme`),
  ADD KEY `cms_theme_logs_user_id_index` (`user_id`);

--
-- Indexes for table `deferred_bindings`
--
ALTER TABLE `deferred_bindings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deferred_bindings_master_type_index` (`master_type`),
  ADD KEY `deferred_bindings_master_field_index` (`master_field`),
  ADD KEY `deferred_bindings_slave_type_index` (`slave_type`),
  ADD KEY `deferred_bindings_slave_id_index` (`slave_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flosch_slideshow_slides`
--
ALTER TABLE `flosch_slideshow_slides`
  ADD PRIMARY KEY (`id`),
  ADD KEY `flosch_slideshow_slides_slideshow_id_foreign` (`slideshow_id`);

--
-- Indexes for table `flosch_slideshow_slideshows`
--
ALTER TABLE `flosch_slideshow_slideshows`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offline_snipcartshop_categories`
--
ALTER TABLE `offline_snipcartshop_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `offline_snipcartshop_categories_slug_unique` (`slug`);

--
-- Indexes for table `offline_snipcartshop_category_product`
--
ALTER TABLE `offline_snipcartshop_category_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offline_snipcartshop_discounts`
--
ALTER TABLE `offline_snipcartshop_discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offline_snipcartshop_orders`
--
ALTER TABLE `offline_snipcartshop_orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `offline_snipcartshop_orders_token_unique` (`token`);

--
-- Indexes for table `offline_snipcartshop_order_items`
--
ALTER TABLE `offline_snipcartshop_order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offline_snipcartshop_products`
--
ALTER TABLE `offline_snipcartshop_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `offline_snipcartshop_products_slug_unique` (`slug`);

--
-- Indexes for table `offline_snipcartshop_product_accessory`
--
ALTER TABLE `offline_snipcartshop_product_accessory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offline_snipcartshop_product_custom_fields`
--
ALTER TABLE `offline_snipcartshop_product_custom_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offline_snipcartshop_product_custom_field_options`
--
ALTER TABLE `offline_snipcartshop_product_custom_field_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offline_snipcartshop_product_variants`
--
ALTER TABLE `offline_snipcartshop_product_variants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offline_snipcartshop_product_variant_custom_field_option`
--
ALTER TABLE `offline_snipcartshop_product_variant_custom_field_option`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rainlab_blog_categories`
--
ALTER TABLE `rainlab_blog_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rainlab_blog_categories_slug_index` (`slug`),
  ADD KEY `rainlab_blog_categories_parent_id_index` (`parent_id`);

--
-- Indexes for table `rainlab_blog_posts`
--
ALTER TABLE `rainlab_blog_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rainlab_blog_posts_user_id_index` (`user_id`),
  ADD KEY `rainlab_blog_posts_slug_index` (`slug`);

--
-- Indexes for table `rainlab_blog_posts_categories`
--
ALTER TABLE `rainlab_blog_posts_categories`
  ADD PRIMARY KEY (`post_id`,`category_id`);

--
-- Indexes for table `rainlab_translate_attributes`
--
ALTER TABLE `rainlab_translate_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rainlab_translate_attributes_locale_index` (`locale`),
  ADD KEY `rainlab_translate_attributes_model_id_index` (`model_id`),
  ADD KEY `rainlab_translate_attributes_model_type_index` (`model_type`);

--
-- Indexes for table `rainlab_translate_indexes`
--
ALTER TABLE `rainlab_translate_indexes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rainlab_translate_indexes_locale_index` (`locale`),
  ADD KEY `rainlab_translate_indexes_model_id_index` (`model_id`),
  ADD KEY `rainlab_translate_indexes_model_type_index` (`model_type`),
  ADD KEY `rainlab_translate_indexes_item_index` (`item`);

--
-- Indexes for table `rainlab_translate_locales`
--
ALTER TABLE `rainlab_translate_locales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rainlab_translate_locales_code_index` (`code`),
  ADD KEY `rainlab_translate_locales_name_index` (`name`);

--
-- Indexes for table `rainlab_translate_messages`
--
ALTER TABLE `rainlab_translate_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rainlab_translate_messages_code_index` (`code`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Indexes for table `system_event_logs`
--
ALTER TABLE `system_event_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_event_logs_level_index` (`level`);

--
-- Indexes for table `system_files`
--
ALTER TABLE `system_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_files_field_index` (`field`),
  ADD KEY `system_files_attachment_id_index` (`attachment_id`),
  ADD KEY `system_files_attachment_type_index` (`attachment_type`);

--
-- Indexes for table `system_mail_layouts`
--
ALTER TABLE `system_mail_layouts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_mail_templates`
--
ALTER TABLE `system_mail_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_mail_templates_layout_id_index` (`layout_id`);

--
-- Indexes for table `system_parameters`
--
ALTER TABLE `system_parameters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_index` (`namespace`,`group`,`item`);

--
-- Indexes for table `system_plugin_history`
--
ALTER TABLE `system_plugin_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_plugin_history_code_index` (`code`),
  ADD KEY `system_plugin_history_type_index` (`type`);

--
-- Indexes for table `system_plugin_versions`
--
ALTER TABLE `system_plugin_versions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_plugin_versions_code_index` (`code`);

--
-- Indexes for table `system_request_logs`
--
ALTER TABLE `system_request_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_revisions`
--
ALTER TABLE `system_revisions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`),
  ADD KEY `system_revisions_user_id_index` (`user_id`),
  ADD KEY `system_revisions_field_index` (`field`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_settings_item_index` (`item`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `backend_access_log`
--
ALTER TABLE `backend_access_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `backend_users`
--
ALTER TABLE `backend_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `backend_user_groups`
--
ALTER TABLE `backend_user_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `backend_user_preferences`
--
ALTER TABLE `backend_user_preferences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `backend_user_throttle`
--
ALTER TABLE `backend_user_throttle`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `bedard_blogtags_tags`
--
ALTER TABLE `bedard_blogtags_tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `cms_theme_data`
--
ALTER TABLE `cms_theme_data`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cms_theme_logs`
--
ALTER TABLE `cms_theme_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `deferred_bindings`
--
ALTER TABLE `deferred_bindings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `flosch_slideshow_slides`
--
ALTER TABLE `flosch_slideshow_slides`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `flosch_slideshow_slideshows`
--
ALTER TABLE `flosch_slideshow_slideshows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `offline_snipcartshop_categories`
--
ALTER TABLE `offline_snipcartshop_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `offline_snipcartshop_category_product`
--
ALTER TABLE `offline_snipcartshop_category_product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `offline_snipcartshop_discounts`
--
ALTER TABLE `offline_snipcartshop_discounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `offline_snipcartshop_orders`
--
ALTER TABLE `offline_snipcartshop_orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `offline_snipcartshop_order_items`
--
ALTER TABLE `offline_snipcartshop_order_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `offline_snipcartshop_products`
--
ALTER TABLE `offline_snipcartshop_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `offline_snipcartshop_product_accessory`
--
ALTER TABLE `offline_snipcartshop_product_accessory`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `offline_snipcartshop_product_custom_fields`
--
ALTER TABLE `offline_snipcartshop_product_custom_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `offline_snipcartshop_product_custom_field_options`
--
ALTER TABLE `offline_snipcartshop_product_custom_field_options`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `offline_snipcartshop_product_variants`
--
ALTER TABLE `offline_snipcartshop_product_variants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `offline_snipcartshop_product_variant_custom_field_option`
--
ALTER TABLE `offline_snipcartshop_product_variant_custom_field_option`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rainlab_blog_categories`
--
ALTER TABLE `rainlab_blog_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `rainlab_blog_posts`
--
ALTER TABLE `rainlab_blog_posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `rainlab_translate_attributes`
--
ALTER TABLE `rainlab_translate_attributes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rainlab_translate_indexes`
--
ALTER TABLE `rainlab_translate_indexes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rainlab_translate_locales`
--
ALTER TABLE `rainlab_translate_locales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `rainlab_translate_messages`
--
ALTER TABLE `rainlab_translate_messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `system_event_logs`
--
ALTER TABLE `system_event_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `system_files`
--
ALTER TABLE `system_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `system_mail_layouts`
--
ALTER TABLE `system_mail_layouts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `system_mail_templates`
--
ALTER TABLE `system_mail_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `system_parameters`
--
ALTER TABLE `system_parameters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `system_plugin_history`
--
ALTER TABLE `system_plugin_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=297;
--
-- AUTO_INCREMENT for table `system_plugin_versions`
--
ALTER TABLE `system_plugin_versions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `system_request_logs`
--
ALTER TABLE `system_request_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `system_revisions`
--
ALTER TABLE `system_revisions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `bedard_blogtags_post_tag`
--
ALTER TABLE `bedard_blogtags_post_tag`
  ADD CONSTRAINT `bedard_blogtags_post_tag_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `rainlab_blog_posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bedard_blogtags_post_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `bedard_blogtags_tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `flosch_slideshow_slides`
--
ALTER TABLE `flosch_slideshow_slides`
  ADD CONSTRAINT `flosch_slideshow_slides_slideshow_id_foreign` FOREIGN KEY (`slideshow_id`) REFERENCES `flosch_slideshow_slideshows` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
