-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 22, 2022 at 03:07 PM
-- Server version: 5.7.36
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `foodie_admin_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `routes` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `permissions` (`id`, `role_id`, `permission`, `routes`, `created_at`, `updated_at`) VALUES
(798, 1, 'drivers', 'drivers', '2024-06-10 06:24:09', '2024-06-10 06:24:09'),
(861, 1, 'god-eye', 'map', '2024-06-11 05:31:22', '2024-06-11 05:31:22'),
(862, 1, 'zone', 'zone.list', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(863, 1, 'zone', 'zone.create', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(864, 1, 'zone', 'zone.edit', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(865, 1, 'zone', 'zone.delete', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(866, 1, 'roles', 'role.index', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(867, 1, 'roles', 'role.save', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(868, 1, 'roles', 'role.store', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(869, 1, 'roles', 'role.edit', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(870, 1, 'roles', 'role.update', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(871, 1, 'roles', 'role.delete', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(872, 1, 'admins', 'admin.users', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(873, 1, 'admins', 'admin.users.create', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(874, 1, 'admins', 'admin.users.store', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(875, 1, 'admins', 'admin.users.edit', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(876, 1, 'admins', 'admin.users.update', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(877, 1, 'admins', 'admin.users.delete', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(878, 1, 'users', 'users', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(879, 1, 'users', 'users.create', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(880, 1, 'users', 'users.edit', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(881, 1, 'users', 'users.view', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(882, 1, 'user', 'user.delete', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(883, 1, 'vendors', 'vendors', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(885, 1, 'vendors-document', 'vendor.document.list', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(886, 1, 'vendors-document', 'vendor.document.edit', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(887, 1, 'restaurants', 'restaurants', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(888, 1, 'restaurants', 'restaurants.create', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(889, 1, 'restaurants', 'restaurants.edit', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(890, 1, 'restaurants', 'restaurants.view', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(891, 1, 'restaurant', 'restaurant.delete', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(892, 1, 'drivers', 'drivers', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(893, 1, 'drivers', 'drivers.create', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(894, 1, 'drivers', 'drivers.edit', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(895, 1, 'drivers', 'drivers.view', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(896, 1, 'driver', 'driver.delete', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(897, 1, 'drivers-document', 'driver.document.list', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(898, 1, 'drivers-document', 'driver.document.edit', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(899, 1, 'reports', 'report.index', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(900, 1, 'category', 'categories', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(901, 1, 'category', 'categories.create', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(902, 1, 'category', 'categories.edit', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(903, 1, 'category', 'category.delete', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(904, 1, 'foods', 'foods', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(905, 1, 'foods', 'foods.create', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(906, 1, 'foods', 'foods.edit', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(907, 1, 'foods', 'foods.delete', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(908, 1, 'item-attribute', 'attributes', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(909, 1, 'item-attribute', 'attributes.create', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(910, 1, 'item-attribute', 'attributes.edit', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(911, 1, 'attributes', 'attributes.delete', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(912, 1, 'review-attribute', 'reviewattributes', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(913, 1, 'review-attribute', 'reviewattributes.create', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(914, 1, 'review-attribute', 'reviewattributes.edit', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(915, 1, 'reviewattributes', 'reviewattributes.delete', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(916, 1, 'orders', 'orders', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(917, 1, 'orders', 'vendors.orderprint', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(918, 1, 'orders', 'orders.edit', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(919, 1, 'orders', 'orders.delete', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(920, 1, 'dinein-orders', 'restaurants.booktable', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(921, 1, 'dinein-orders', 'booktable.edit', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(922, 1, 'gift-cards', 'gift-card.index', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(923, 1, 'gift-cards', 'gift-card.save', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(924, 1, 'gift-cards', 'gift-card.edit', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(925, 1, 'gift-card', 'gift-card.delete', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(926, 1, 'coupons', 'coupons', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(927, 1, 'coupons', 'coupons.create', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(928, 1, 'coupons', 'coupons.edit', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(929, 1, 'coupons', 'coupons.delete', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(930, 1, 'documents', 'documents.list', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(931, 1, 'documents', 'documents.create', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(932, 1, 'documents', 'documents.edit', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(933, 1, 'documents', 'documents.delete', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(934, 1, 'general-notifications', 'notification', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(935, 1, 'general-notifications', 'notification.send', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(936, 1, 'notification', 'notification.delete', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(937, 1, 'dynamic-notifications', 'dynamic-notification.index', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(938, 1, 'dynamic-notifications', 'dynamic-notification.save', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(939, 1, 'payments', 'payments', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(940, 1, 'restaurant-payouts', 'restaurantsPayouts', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(941, 1, 'restaurant-payouts', 'restaurantsPayouts.create', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(942, 1, 'driver-payments', 'driver.driverpayments', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(943, 1, 'driver-payouts', 'driversPayouts', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(944, 1, 'driver-payouts', 'driversPayouts.create', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(945, 1, 'wallet-transaction', 'walletstransaction', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(946, 1, 'payout-request', 'payoutRequests.drivers', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(947, 1, 'payout-request', 'payoutRequests.restaurants', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(949, 1, 'banners', 'setting.banners', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(950, 1, 'banners', 'setting.banners.create', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(951, 1, 'banners', 'setting.banners.edit', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(952, 1, 'banners', 'banners.delete', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(953, 1, 'cms', 'cms', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(954, 1, 'cms', 'cms.create', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(955, 1, 'cms', 'cms.edit', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(956, 1, 'cms', 'cms.delete', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(959, 1, 'global-setting', 'settings.app.globals', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(960, 1, 'currency', 'currencies', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(961, 1, 'currency', 'currencies.create', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(962, 1, 'currency', 'currencies.edit', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(963, 1, 'currency', 'currency.delete', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(964, 1, 'payment-method', 'payment-method', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(965, 1, 'admin-commission', 'settings.app.adminCommission', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(966, 1, 'radius', 'settings.app.radiusConfiguration', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(967, 1, 'dinein', 'settings.app.bookTable', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(968, 1, 'tax', 'tax', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(969, 1, 'tax', 'tax.create', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(970, 1, 'tax', 'tax.edit', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(971, 1, 'tax', 'tax.delete', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(972, 1, 'delivery-charge', 'settings.app.deliveryCharge', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(974, 1, 'language', 'settings.app.languages', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(975, 1, 'language', 'settings.app.languages.create', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(976, 1, 'language', 'settings.app.languages.edit', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(977, 1, 'language', 'language.delete', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(978, 1, 'special-offer', 'setting.specialOffer', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(979, 1, 'terms', 'termsAndConditions', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(980, 1, 'privacy', 'privacyPolicy', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(981, 1, 'home-page', 'homepageTemplate', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(982, 1, 'footer', 'footerTemplate', '2024-06-11 05:35:27', '2024-06-11 05:35:27'),
(1366, 1, 'document-verification', 'settings.app.documentVerification', '2024-06-12 10:08:27', '2024-06-12 10:08:27'),
(1527, 1, 'approve_vendors', 'approve.vendors.list', '2024-06-12 13:16:06', '2024-06-12 13:16:06'),
(1529, 1, 'pending_vendors', 'pending.vendors.list', '2024-06-12 13:16:06', '2024-06-12 13:16:06'),
(1531, 1, 'approve_drivers', 'approve.driver.list', '2024-06-12 13:16:06', '2024-06-12 13:16:06'),
(1533, 1, 'pending_drivers', 'pending.driver.list', '2024-06-12 13:16:06', '2024-06-12 13:16:06'),
(1541, 1, 'approve_vendors', 'approve.vendors.delete', '2024-06-12 13:45:34', '2024-06-12 13:45:34'),
(1542, 1, 'pending_vendors', 'pending.vendors.delete', '2024-06-12 13:45:34', '2024-06-12 13:45:34'),
(1543, 1, 'vendors', 'vendors.delete', '2024-06-12 13:45:47', '2024-06-12 13:45:47'),
(1544, 1, 'approve_drivers', 'approve.driver.delete', '2024-06-12 13:49:17', '2024-06-12 13:49:17'),
(1545, 1, 'pending_drivers', 'pending.driver.delete', '2024-06-12 13:49:17', '2024-06-12 13:49:17'),
(2769, 1, 'email-template', 'email-templates.index', '2024-07-01 11:52:23', '2024-07-01 11:52:23'),
(2773, 1, 'email-template', 'email-templates.edit', '2024-08-07 10:41:15', '2024-08-07 10:41:15'),
(2848, 1, 'on-board', 'onboard.list', '2024-09-03 12:09:23', '2024-09-03 12:09:23'),
(2849, 1, 'on-board', 'onboard.edit', '2024-09-03 12:09:23', '2024-09-03 12:09:23');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `role` (`id`, `role_name`, `created_at`, `updated_at`) VALUES
(1, 'Super Administrator', '2023-11-27 05:10:43', '2023-11-27 06:36:20');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int(15) NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'admin@foodie.com', NULL, '$2y$10$4D/Oi3x7gxPwZ/zxCKtgCOlPNujUnUER0vkMjQ0moL7l3cAJwTIJa', 1, 'xmMQOp8aT80phlL2714CfAxZxeNw7SNcHzGCWIflETi8sfsygU4VZuh5xZTg', '2022-02-26 12:22:29', '2023-11-29 10:45:57');

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
