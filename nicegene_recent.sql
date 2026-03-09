-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 09, 2026 at 12:06 PM
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
-- Database: `nicegene`
--

-- --------------------------------------------------------

--
-- Table structure for table `academic_calendar`
--

CREATE TABLE `academic_calendar` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `event_type` enum('term','exam','holiday','meeting','event','other') NOT NULL DEFAULT 'event',
  `color` varchar(20) DEFAULT '#3788d8',
  `all_day` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `academic_classes`
--

CREATE TABLE `academic_classes` (
  `id` int(11) NOT NULL,
  `class_name` varchar(50) NOT NULL,
  `class_level` enum('junior','senior') NOT NULL,
  `class_order` tinyint(4) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `academic_classes`
--

INSERT INTO `academic_classes` (`id`, `class_name`, `class_level`, `class_order`, `status`) VALUES
(1, 'JSS 1', 'junior', 1, 1),
(2, 'JSS 2', 'junior', 2, 1),
(3, 'JSS 3', 'junior', 3, 1),
(4, 'SSS 1', 'senior', 1, 1),
(5, 'SSS 2', 'senior', 2, 1),
(6, 'SSS 3', 'senior', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `academic_subjects`
--

CREATE TABLE `academic_subjects` (
  `id` int(11) NOT NULL,
  `subject_name` varchar(100) NOT NULL,
  `class_level` enum('junior','senior','both') NOT NULL DEFAULT 'both',
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `academic_subjects`
--

INSERT INTO `academic_subjects` (`id`, `subject_name`, `class_level`, `status`) VALUES
(1, 'Mathematics', 'both', 1),
(2, 'English Language', 'both', 1),
(3, 'Basic Science', 'junior', 1),
(4, 'Basic Technology', 'junior', 1),
(5, 'Social Studies', 'junior', 1),
(6, 'Civic Education', 'both', 1),
(7, 'Christian Religious Studies', 'both', 1),
(8, 'Physics', 'senior', 1),
(9, 'Chemistry', 'senior', 1),
(10, 'Biology', 'senior', 1),
(11, 'Economics', 'senior', 1),
(12, 'Government', 'senior', 1),
(13, 'Literature in English', 'senior', 1),
(14, 'Agricultural Science', 'both', 1),
(15, 'Computer Studies', 'both', 1),
(16, 'French', 'both', 1),
(17, 'Fine Art', 'both', 1),
(18, 'Home Economics', 'junior', 1),
(19, 'Business Studies', 'junior', 1),
(20, 'Physical Education', 'both', 1),
(21, 'History', 'both', 1),
(22, 'Geography', 'both', 1),
(23, 'Further Mathematics', 'senior', 1),
(24, 'Technical Drawing', 'senior', 1),
(25, 'Commerce', 'senior', 1),
(26, 'Accounting', 'senior', 1),
(27, 'Yoruba', 'both', 1),
(28, 'Igbo', 'both', 1),
(29, 'Hausa', 'both', 1),
(30, 'Music', 'both', 1);

-- --------------------------------------------------------

--
-- Table structure for table `admin_action_audit`
--

CREATE TABLE `admin_action_audit` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `action_type` varchar(80) NOT NULL,
  `module_name` varchar(80) NOT NULL,
  `reference_id` varchar(100) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `actor_user_id` int(11) NOT NULL,
  `actor_name` varchar(255) DEFAULT NULL,
  `actor_role` varchar(80) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_settings`
--

CREATE TABLE `app_settings` (
  `id` int(11) NOT NULL,
  `setting_key` varchar(100) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `app_settings`
--

INSERT INTO `app_settings` (`id`, `setting_key`, `setting_value`, `description`, `created_at`, `updated_at`) VALUES
(1, 'school_name', 'Finbarr School', 'School/Organization name', '2026-02-20 02:37:44', '2026-02-20 02:37:44'),
(2, 'departments', '[\"bookshop\",\"uniform\",\"clinic\"]', 'JSON: Department names', '2026-02-20 02:37:44', '2026-02-20 02:37:44'),
(3, 'uniform_sizes', '[\"S\",\"M\",\"L\",\"XL\",\"XXL\"]', 'JSON: Available uniform sizes', '2026-02-20 02:37:44', '2026-02-20 02:37:44'),
(4, 'bookshop_categories', '[\"books\",\"stationery\"]', 'JSON: Bookshop item categories', '2026-02-20 02:37:44', '2026-02-20 02:37:44'),
(5, 'uniform_categories', '[\"shirt\",\"trouser\",\"shoes\",\"sandals\"]', 'JSON: Uniform item categories', '2026-02-20 02:37:44', '2026-02-20 02:37:44'),
(6, 'clinic_categories', '[\"drugs\"]', 'JSON: Clinic item categories', '2026-02-20 02:37:44', '2026-02-20 02:37:44'),
(7, 'notifications_enabled', '1', '1=on, 0=off', '2026-02-20 02:37:44', '2026-02-20 02:37:44'),
(8, 'email_notifications', '1', '1=on, 0=off', '2026-02-20 02:37:44', '2026-02-20 02:37:44'),
(9, 'smtp_host', 'mail.klozza.com.ng', 'SMTP host for sending emails', '2026-02-20 02:37:44', '2026-03-02 01:27:56'),
(10, 'smtp_port', '587', 'SMTP port', '2026-02-20 02:37:44', '2026-03-02 01:43:26'),
(11, 'smtp_user', 'customercare@klozza.com.ng', 'SMTP username', '2026-02-20 02:37:44', '2026-03-02 01:27:56'),
(12, 'smtp_pass', 'W98(.N9KEDJDXuCN', 'SMTP password', '2026-02-20 02:37:44', '2026-03-02 01:27:56'),
(25, 'smtp_encryption', 'tls', 'tls, ssl or none', '2026-02-20 03:32:52', '2026-02-20 03:32:52'),
(85, 'low_stock_threshold', '5', 'Default minimum stock before low-stock alert', '2026-02-20 14:05:39', '2026-02-20 14:05:39'),
(86, 'smtp_provider', 'amazon', 'SMTP provider: custom or amazon', '2026-03-02 01:27:56', '2026-03-04 11:18:34'),
(87, 'mail_from_address', 'eugeneoorji@gmail.com', 'From email', '2026-03-02 01:27:56', '2026-03-04 11:30:14'),
(88, 'mail_from_name', 'Finbarrs', 'From name', '2026-03-02 01:27:56', '2026-03-02 01:27:56'),
(95, 'amazon_smtp_host', 'email-smtp.us-east-1.amazonaws.com', NULL, '2026-03-03 23:06:47', '2026-03-04 11:18:34'),
(96, 'amazon_smtp_port', '587', NULL, '2026-03-03 23:06:47', '2026-03-03 23:06:47'),
(97, 'amazon_smtp_user', 'AKIAWSTSBP7O3NZE62NH', NULL, '2026-03-03 23:06:47', '2026-03-04 11:18:34'),
(98, 'amazon_smtp_pass', 'BNeA5hYEvFAs3B4cUlYuu5hbRPK7VsCEOo9YPXD91gzm', NULL, '2026-03-03 23:06:47', '2026-03-04 11:18:34'),
(99, 'amazon_smtp_encryption', 'tls', NULL, '2026-03-03 23:06:47', '2026-03-03 23:06:47');

-- --------------------------------------------------------

--
-- Table structure for table `assets_tbl`
--

CREATE TABLE `assets_tbl` (
  `id` int(11) NOT NULL,
  `asset_name` varchar(255) NOT NULL,
  `tag_number` varchar(100) NOT NULL,
  `serial_number` varchar(100) DEFAULT NULL,
  `purchase_year` year(4) NOT NULL,
  `purchase_price` decimal(12,2) DEFAULT 0.00,
  `description` text DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `assigned_to_employee_id` int(11) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `status` enum('active','maintenance','retired','lost') NOT NULL DEFAULT 'active',
  `condition_status` enum('new','good','fair','poor','damaged') NOT NULL DEFAULT 'good',
  `warranty_expiry` date DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `photo` varchar(500) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `asset_categories`
--

CREATE TABLE `asset_categories` (
  `id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `asset_categories`
--

INSERT INTO `asset_categories` (`id`, `category_name`, `description`, `status`, `created_at`) VALUES
(1, 'Furniture', 'Chairs, tables, desks, shelves', 1, '2026-03-07 18:18:29'),
(2, 'Electronics', 'Computers, projectors, printers, TVs', 1, '2026-03-07 18:18:29'),
(3, 'Appliances', 'Air conditioners, fans, refrigerators', 1, '2026-03-07 18:18:29'),
(4, 'Vehicles', 'School buses, cars', 1, '2026-03-07 18:18:29'),
(5, 'Sports Equipment', 'Balls, nets, goal posts', 1, '2026-03-07 18:18:29'),
(6, 'Lab Equipment', 'Microscopes, test tubes, chemicals', 1, '2026-03-07 18:18:29'),
(7, 'Musical Instruments', 'Pianos, drums, guitars', 1, '2026-03-07 18:18:29'),
(8, 'Office Supplies', 'Filing cabinets, safes, whiteboards', 1, '2026-03-07 18:18:29'),
(9, 'Building/Fixtures', 'Generators, water tanks, plumbing', 1, '2026-03-07 18:18:29'),
(10, 'Books/Library', 'Library books, reference materials', 1, '2026-03-07 18:18:29');

-- --------------------------------------------------------

--
-- Table structure for table `asset_depreciation_log`
--

CREATE TABLE `asset_depreciation_log` (
  `id` int(11) NOT NULL,
  `asset_id` int(11) NOT NULL,
  `method` enum('straight_line') NOT NULL DEFAULT 'straight_line',
  `depreciation_rate` decimal(5,2) NOT NULL DEFAULT 10.00,
  `years_elapsed` int(11) NOT NULL DEFAULT 0,
  `opening_value` decimal(12,2) NOT NULL DEFAULT 0.00,
  `depreciation_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `closing_value` decimal(12,2) NOT NULL DEFAULT 0.00,
  `calculated_on` date NOT NULL,
  `calculated_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `asset_maintenance_log`
--

CREATE TABLE `asset_maintenance_log` (
  `id` int(11) NOT NULL,
  `asset_id` int(11) NOT NULL,
  `maintenance_type` enum('repair','servicing','inspection','replacement') NOT NULL DEFAULT 'repair',
  `description` text NOT NULL,
  `cost` decimal(12,2) DEFAULT 0.00,
  `vendor` varchar(255) DEFAULT NULL,
  `maintenance_date` date NOT NULL,
  `next_maintenance_date` date DEFAULT NULL,
  `performed_by` varchar(255) DEFAULT NULL,
  `logged_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `asset_transfer_log`
--

CREATE TABLE `asset_transfer_log` (
  `id` int(11) NOT NULL,
  `asset_id` int(11) NOT NULL,
  `old_department_id` int(11) DEFAULT NULL,
  `new_department_id` int(11) DEFAULT NULL,
  `old_employee_id` int(11) DEFAULT NULL,
  `new_employee_id` int(11) DEFAULT NULL,
  `old_location` varchar(255) DEFAULT NULL,
  `new_location` varchar(255) DEFAULT NULL,
  `transfer_note` text DEFAULT NULL,
  `transferred_by` int(11) NOT NULL,
  `transfer_date` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendance_tbl`
--

CREATE TABLE `attendance_tbl` (
  `attandence_id` int(11) NOT NULL,
  `date` varchar(200) NOT NULL,
  `in_time` varchar(200) NOT NULL,
  `out_time` varchar(20) NOT NULL,
  `staytime` time NOT NULL,
  `employee_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `attendance_tbl`
--

INSERT INTO `attendance_tbl` (`attandence_id`, `date`, `in_time`, `out_time`, `staytime`, `employee_id`) VALUES
(1, '2026-03-08', '03:03 am', '03:34:33 am', '00:31:33', 3);

-- --------------------------------------------------------

--
-- Table structure for table `audit_log`
--

CREATE TABLE `audit_log` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `action` varchar(50) NOT NULL,
  `module` varchar(50) NOT NULL,
  `record_id` varchar(100) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `audit_log`
--

INSERT INTO `audit_log` (`id`, `user_id`, `action`, `module`, `record_id`, `details`, `ip_address`, `created_at`) VALUES
(1, 2, 'update', 'role', '3', '{\"role_name\":\"Registrar\"}', '::1', '2026-03-02 02:27:19'),
(2, 2, 'update', 'role', '1', '{\"role_name\":\"Stock Controller\"}', '::1', '2026-03-02 02:43:41'),
(3, 2, 'assign', 'role', '10', '{\"role_ids\":[\"3\"]}', '::1', '2026-03-02 02:51:31'),
(4, 2, 'update', 'role', '2', '{\"role_name\":\"Admins\"}', '::1', '2026-03-03 23:51:40'),
(5, 2, 'assign', 'role', '3', '{\"role_ids\":[\"2\"]}', '::1', '2026-03-03 23:54:20');

-- --------------------------------------------------------

--
-- Table structure for table `bank_tbl`
--

CREATE TABLE `bank_tbl` (
  `id` int(11) NOT NULL,
  `bank_id` varchar(50) NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `account_no` varchar(255) NOT NULL,
  `account_name` varchar(255) NOT NULL DEFAULT '',
  `branch_name` varchar(255) NOT NULL,
  `area` int(11) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(2) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `bank_tbl`
--

INSERT INTO `bank_tbl` (`id`, `bank_id`, `bank_name`, `account_no`, `account_name`, `branch_name`, `area`, `created_by`, `created_at`, `updated_at`, `status`) VALUES
(1, 'bnk_1', 'First Bank', '3126641003', 'Egwu Joseph Nnanna', 'Lagos', 0, 2, '2026-03-02 00:43:35', '2026-03-02 00:43:35', 1);

-- --------------------------------------------------------

--
-- Table structure for table `category_tbl`
--

CREATE TABLE `category_tbl` (
  `id` int(11) NOT NULL,
  `category_id` varchar(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `parent_id` varchar(20) NOT NULL,
  `is_menu` int(2) DEFAULT NULL,
  `is_front` int(2) DEFAULT NULL,
  `ordering` varchar(2) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` int(11) NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category_tbl`
--

INSERT INTO `category_tbl` (`id`, `category_id`, `name`, `description`, `parent_id`, `is_menu`, `is_front`, `ordering`, `icon`, `created_by`, `created_date`, `updated_by`, `updated_date`, `status`) VALUES
(1, '55248', 'Uniform', NULL, '', NULL, NULL, NULL, NULL, 0, '2026-02-21 00:57:53', 0, '0000-00-00 00:00:00', 0),
(2, '76254', 'Shirt', NULL, '55248', NULL, NULL, NULL, NULL, 0, '2026-02-21 00:58:36', 0, '0000-00-00 00:00:00', 0),
(3, '51574', 'Trouser', NULL, '55248', NULL, NULL, NULL, NULL, 0, '2026-02-21 00:58:51', 0, '0000-00-00 00:00:00', 0),
(4, '99152', 'Books', NULL, '', NULL, NULL, NULL, NULL, 0, '2026-02-21 00:59:15', 0, '0000-00-00 00:00:00', 0),
(5, '56481', 'Text Book', NULL, '99152', NULL, NULL, NULL, NULL, 0, '2026-02-21 00:59:42', 0, '0000-00-00 00:00:00', 0),
(6, '65493', 'Exercise Book', NULL, '99152', NULL, NULL, NULL, NULL, 0, '2026-02-21 00:59:59', 0, '0000-00-00 00:00:00', 0),
(7, '63137', 'Foot wear', NULL, '', NULL, NULL, NULL, NULL, 0, '2026-02-21 01:00:23', 0, '0000-00-00 00:00:00', 0),
(8, '71946', 'Shoes', NULL, '63137', NULL, NULL, NULL, NULL, 0, '2026-02-21 01:00:40', 0, '0000-00-00 00:00:00', 0),
(9, '57758', 'Cortina', NULL, '71946', NULL, NULL, NULL, NULL, 0, '2026-02-21 01:01:05', 0, '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `country_tbl`
--

CREATE TABLE `country_tbl` (
  `country_id` int(11) NOT NULL,
  `sortname` varchar(150) NOT NULL,
  `country_name` varchar(150) NOT NULL,
  `phonecode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `country_tbl`
--

INSERT INTO `country_tbl` (`country_id`, `sortname`, `country_name`, `phonecode`) VALUES
(2, 'AL', 'Albania', 355),
(3, 'DZ', 'Algeria', 213),
(4, 'AS', 'American Samoa', 1684),
(5, 'AD', 'Andorra', 376),
(6, 'AO', 'Angola', 244),
(7, 'AI', 'Anguilla', 1264),
(8, 'AQ', 'Antarctica', 0),
(9, 'AG', 'Antigua And Barbuda', 1268),
(10, 'AR', 'Argentina', 54),
(11, 'AM', 'Armenia', 374),
(12, 'AW', 'Aruba', 297),
(13, 'AU', 'Australia', 61),
(14, 'AT', 'Austria', 43),
(15, 'AZ', 'Azerbaijan', 994),
(16, 'BS', 'Bahamas The', 1242),
(17, 'BH', 'Bahrain', 973),
(18, 'BD', 'Bangladesh', 880),
(19, 'BB', 'Barbados', 1246),
(20, 'BY', 'Belarus', 375),
(21, 'BE', 'Belgium', 32),
(22, 'BZ', 'Belize', 501),
(23, 'BJ', 'Benin', 229),
(24, 'BM', 'Bermuda', 1441),
(25, 'BT', 'Bhutan', 975),
(26, 'BO', 'Bolivia', 591),
(27, 'BA', 'Bosnia and Herzegovina', 387),
(28, 'BW', 'Botswana', 267),
(29, 'BV', 'Bouvet Island', 0),
(30, 'BR', 'Brazil', 55),
(31, 'IO', 'British Indian Ocean Territory', 246),
(32, 'BN', 'Brunei', 673),
(33, 'BG', 'Bulgaria', 359),
(34, 'BF', 'Burkina Faso', 226),
(35, 'BI', 'Burundi', 257),
(36, 'KH', 'Cambodia', 855),
(37, 'CM', 'Cameroon', 237),
(38, 'CA', 'Canada', 1),
(39, 'CV', 'Cape Verde', 238),
(40, 'KY', 'Cayman Islands', 1345),
(41, 'CF', 'Central African Republic', 236),
(42, 'TD', 'Chad', 235),
(43, 'CL', 'Chile', 56),
(44, 'CN', 'China', 86),
(45, 'CX', 'Christmas Island', 61),
(46, 'CC', 'Cocos (Keeling) Islands', 672),
(47, 'CO', 'Colombia', 57),
(48, 'KM', 'Comoros', 269),
(49, 'CG', 'Republic Of The Congo', 242),
(50, 'CD', 'Democratic Republic Of The Congo', 242),
(51, 'CK', 'Cook Islands', 682),
(52, 'CR', 'Costa Rica', 506),
(53, 'CI', 'Cote D\'Ivoire (Ivory Coast)', 225),
(54, 'HR', 'Croatia (Hrvatska)', 385),
(55, 'CU', 'Cuba', 53),
(56, 'CY', 'Cyprus', 357),
(57, 'CZ', 'Czech Republic', 420),
(58, 'DK', 'Denmark', 45),
(59, 'DJ', 'Djibouti', 253),
(60, 'DM', 'Dominica', 1767),
(61, 'DO', 'Dominican Republic', 1809),
(62, 'TP', 'East Timor', 670),
(63, 'EC', 'Ecuador', 593),
(64, 'EG', 'Egypt', 20),
(65, 'SV', 'El Salvador', 503),
(66, 'GQ', 'Equatorial Guinea', 240),
(67, 'ER', 'Eritrea', 291),
(68, 'EE', 'Estonia', 372),
(69, 'ET', 'Ethiopia', 251),
(70, 'XA', 'External Territories of Australia', 61),
(71, 'FK', 'Falkland Islands', 500),
(72, 'FO', 'Faroe Islands', 298),
(73, 'FJ', 'Fiji Islands', 679),
(74, 'FI', 'Finland', 358),
(75, 'FR', 'France', 33),
(76, 'GF', 'French Guiana', 594),
(77, 'PF', 'French Polynesia', 689),
(78, 'TF', 'French Southern Territories', 0),
(79, 'GA', 'Gabon', 241),
(80, 'GM', 'Gambia The', 220),
(81, 'GE', 'Georgia', 995),
(82, 'DE', 'Germany', 49),
(83, 'GH', 'Ghana', 233),
(84, 'GI', 'Gibraltar', 350),
(85, 'GR', 'Greece', 30),
(86, 'GL', 'Greenland', 299),
(87, 'GD', 'Grenada', 1473),
(88, 'GP', 'Guadeloupe', 590),
(89, 'GU', 'Guam', 1671),
(90, 'GT', 'Guatemala', 502),
(91, 'XU', 'Guernsey and Alderney', 44),
(92, 'GN', 'Guinea', 224),
(93, 'GW', 'Guinea-Bissau', 245),
(94, 'GY', 'Guyana', 592),
(95, 'HT', 'Haiti', 509),
(96, 'HM', 'Heard and McDonald Islands', 0),
(97, 'HN', 'Honduras', 504),
(98, 'HK', 'Hong Kong S.A.R.', 852),
(99, 'HU', 'Hungary', 36),
(100, 'IS', 'Iceland', 354),
(101, 'IN', 'India', 91),
(102, 'ID', 'Indonesia', 62),
(103, 'IR', 'Iran', 98),
(104, 'IQ', 'Iraq', 964),
(105, 'IE', 'Ireland', 353),
(106, 'IL', 'Israel', 972),
(107, 'IT', 'Italy', 39),
(108, 'JM', 'Jamaica', 1876),
(109, 'JP', 'Japan', 81),
(110, 'XJ', 'Jersey', 44),
(111, 'JO', 'Jordan', 962),
(112, 'KZ', 'Kazakhstan', 7),
(113, 'KE', 'Kenya', 254),
(114, 'KI', 'Kiribati', 686),
(115, 'KP', 'Korea North', 850),
(116, 'KR', 'Korea South', 82),
(117, 'KW', 'Kuwait', 965),
(118, 'KG', 'Kyrgyzstan', 996),
(119, 'LA', 'Laos', 856),
(120, 'LV', 'Latvia', 371),
(121, 'LB', 'Lebanon', 961),
(122, 'LS', 'Lesotho', 266),
(123, 'LR', 'Liberia', 231),
(124, 'LY', 'Libya', 218),
(125, 'LI', 'Liechtenstein', 423),
(126, 'LT', 'Lithuania', 370),
(127, 'LU', 'Luxembourg', 352),
(128, 'MO', 'Macau S.A.R.', 853),
(129, 'MK', 'Macedonia', 389),
(130, 'MG', 'Madagascar', 261),
(131, 'MW', 'Malawi', 265),
(132, 'MY', 'Malaysia', 60),
(133, 'MV', 'Maldives', 960),
(134, 'ML', 'Mali', 223),
(135, 'MT', 'Malta', 356),
(136, 'XM', 'Man (Isle of)', 44),
(137, 'MH', 'Marshall Islands', 692),
(138, 'MQ', 'Martinique', 596),
(139, 'MR', 'Mauritania', 222),
(140, 'MU', 'Mauritius', 230),
(141, 'YT', 'Mayotte', 269),
(142, 'MX', 'Mexico', 52),
(143, 'FM', 'Micronesia', 691),
(144, 'MD', 'Moldova', 373),
(145, 'MC', 'Monaco', 377),
(146, 'MN', 'Mongolia', 976),
(147, 'MS', 'Montserrat', 1664),
(148, 'MA', 'Morocco', 212),
(149, 'MZ', 'Mozambique', 258),
(150, 'MM', 'Myanmar', 95),
(151, 'NA', 'Namibia', 264),
(152, 'NR', 'Nauru', 674),
(153, 'NP', 'Nepal', 977),
(154, 'AN', 'Netherlands Antilles', 599),
(155, 'NL', 'Netherlands The', 31),
(156, 'NC', 'New Caledonia', 687),
(157, 'NZ', 'New Zealand', 64),
(158, 'NI', 'Nicaragua', 505),
(159, 'NE', 'Niger', 227),
(160, 'NG', 'Nigeria', 234),
(161, 'NU', 'Niue', 683),
(162, 'NF', 'Norfolk Island', 672),
(163, 'MP', 'Northern Mariana Islands', 1670),
(164, 'NO', 'Norway', 47),
(165, 'OM', 'Oman', 968),
(166, 'PK', 'Pakistan', 92),
(167, 'PW', 'Palau', 680),
(168, 'PS', 'Palestinian Territory Occupied', 970),
(169, 'PA', 'Panama', 507),
(170, 'PG', 'Papua new Guinea', 675),
(171, 'PY', 'Paraguay', 595),
(172, 'PE', 'Peru', 51),
(173, 'PH', 'Philippines', 63),
(174, 'PN', 'Pitcairn Island', 0),
(175, 'PL', 'Poland', 48),
(176, 'PT', 'Portugal', 351),
(177, 'PR', 'Puerto Rico', 1787),
(178, 'QA', 'Qatar', 974),
(179, 'RE', 'Reunion', 262),
(180, 'RO', 'Romania', 40),
(181, 'RU', 'Russia', 70),
(182, 'RW', 'Rwanda', 250),
(183, 'SH', 'Saint Helena', 290),
(184, 'KN', 'Saint Kitts And Nevis', 1869),
(185, 'LC', 'Saint Lucia', 1758),
(186, 'PM', 'Saint Pierre and Miquelon', 508),
(187, 'VC', 'Saint Vincent And The Grenadines', 1784),
(188, 'WS', 'Samoa', 684),
(189, 'SM', 'San Marino', 378),
(190, 'ST', 'Sao Tome and Principe', 239),
(191, 'SA', 'Saudi Arabia', 966),
(192, 'SN', 'Senegal', 221),
(193, 'RS', 'Serbia', 381),
(194, 'SC', 'Seychelles', 248),
(195, 'SL', 'Sierra Leone', 232),
(196, 'SG', 'Singapore', 65),
(197, 'SK', 'Slovakia', 421),
(198, 'SI', 'Slovenia', 386),
(199, 'XG', 'Smaller Territories of the UK', 44),
(200, 'SB', 'Solomon Islands', 677),
(201, 'SO', 'Somalia', 252),
(202, 'ZA', 'South Africa', 27),
(203, 'GS', 'South Georgia', 0),
(204, 'SS', 'South Sudan', 211),
(205, 'ES', 'Spain', 34),
(206, 'LK', 'Sri Lanka', 94),
(207, 'SD', 'Sudan', 249),
(208, 'SR', 'Suriname', 597),
(209, 'SJ', 'Svalbard And Jan Mayen Islands', 47),
(210, 'SZ', 'Swaziland', 268),
(211, 'SE', 'Sweden', 46),
(212, 'CH', 'Switzerland', 41),
(213, 'SY', 'Syria', 963),
(214, 'TW', 'Taiwan', 886),
(215, 'TJ', 'Tajikistan', 992),
(216, 'TZ', 'Tanzania', 255),
(217, 'TH', 'Thailand', 66),
(218, 'TG', 'Togo', 228),
(219, 'TK', 'Tokelau', 690),
(220, 'TO', 'Tonga', 676),
(221, 'TT', 'Trinidad And Tobago', 1868),
(222, 'TN', 'Tunisia', 216),
(223, 'TR', 'Turkey', 90),
(224, 'TM', 'Turkmenistan', 7370),
(225, 'TC', 'Turks And Caicos Islands', 1649),
(226, 'TV', 'Tuvalu', 688),
(227, 'UG', 'Uganda', 256),
(228, 'UA', 'Ukraine', 380),
(229, 'AE', 'United Arab Emirates', 971),
(230, 'GB', 'United Kingdom', 44),
(231, 'US', 'United States', 1),
(232, 'UM', 'United States Minor Outlying Islands', 1),
(233, 'UY', 'Uruguay', 598),
(234, 'UZ', 'Uzbekistan', 998),
(235, 'VU', 'Vanuatu', 678),
(236, 'VA', 'Vatican City State (Holy See)', 39),
(237, 'VE', 'Venezuela', 58),
(238, 'VN', 'Vietnam', 84),
(239, 'VG', 'Virgin Islands (British)', 1284),
(240, 'VI', 'Virgin Islands (US)', 1340),
(241, 'WF', 'Wallis And Futuna Islands', 681),
(242, 'EH', 'Western Sahara', 212),
(243, 'YE', 'Yemen', 967),
(244, 'YU', 'Yugoslavia', 38),
(245, 'ZM', 'Zambia', 260),
(246, 'ZW', 'Zimbabwe', 263);

-- --------------------------------------------------------

--
-- Table structure for table `curriculum_tbl`
--

CREATE TABLE `curriculum_tbl` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `term` enum('first','second','third') NOT NULL,
  `academic_year` varchar(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `file_path` varchar(500) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `uploaded_by` int(11) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `status` enum('pending','approved','rejected') NOT NULL DEFAULT 'pending',
  `review_comment` text DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `reviewed_by` int(11) DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `reviewed_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `daily_closing`
--

CREATE TABLE `daily_closing` (
  `id` int(11) NOT NULL,
  `last_day_closing` float NOT NULL,
  `cash_in` float NOT NULL,
  `cash_out` float NOT NULL,
  `date` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `amount` float NOT NULL,
  `adjustment` float DEFAULT NULL,
  `status` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `department_tbl`
--

CREATE TABLE `department_tbl` (
  `department_id` int(11) NOT NULL,
  `department_name` varchar(200) NOT NULL,
  `department_description` text NOT NULL,
  `department_head_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `department_tbl`
--

INSERT INTO `department_tbl` (`department_id`, `department_name`, `department_description`, `department_head_id`) VALUES
(1, 'Uniform Department', 'Sales for school uniforms', NULL),
(2, 'Bookshop Department', 'Sales of books', NULL),
(3, 'Clinic Department', 'Sales of Drugs', NULL),
(4, 'Administration', 'Administrative staff', NULL),
(5, 'Teaching', 'Teaching staff', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `designation_tbl`
--

CREATE TABLE `designation_tbl` (
  `designation_id` int(11) NOT NULL,
  `designation_name` varchar(200) NOT NULL,
  `designation_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `designation_tbl`
--

INSERT INTO `designation_tbl` (`designation_id`, `designation_name`, `designation_description`) VALUES
(1, 'Registrars', 'Makes sales'),
(2, 'Inventory manager', 'Uploads and manages inventory'),
(3, 'Admins', 'Full and settings access'),
(4, 'Admin', 'Administrator'),
(5, 'Storekeeper', 'Inventory/store keeper');

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` int(11) NOT NULL,
  `user_id` varchar(15) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `target_type` varchar(20) NOT NULL DEFAULT 'self',
  `target_user_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `mime_type` varchar(100) NOT NULL,
  `size` varchar(50) NOT NULL,
  `upload_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id`, `user_id`, `department_id`, `target_type`, `target_user_id`, `title`, `file_path`, `file_name`, `mime_type`, `size`, `upload_date`, `created_at`) VALUES
(2, '10', 4, 'self', NULL, 'march report', 'admin_assets/documents/bef4788656cf3b46777851e8c4c20604.pdf', 'ChefSync.pdf', 'application/pdf', '158.82', '2026-03-02', '2026-03-02 03:15:20'),
(3, '2', 4, 'department', NULL, 'letter head', 'admin_assets/documents/249e336c9da88250c15cdb59e17d70ce.png', 'SMARTECHKID_LETTER_HEAD.png', 'image/png', '64.02', '2026-03-04', '2026-03-04 11:40:11');

-- --------------------------------------------------------

--
-- Table structure for table `employee_tbl`
--

CREATE TABLE `employee_tbl` (
  `employee_id` int(11) NOT NULL,
  `em_first_name` varchar(100) NOT NULL,
  `em_last_name` varchar(100) NOT NULL,
  `em_gender` varchar(10) DEFAULT NULL,
  `em_date_of_birth` date DEFAULT NULL,
  `em_nin` varchar(50) DEFAULT NULL,
  `em_staff_id` varchar(50) DEFAULT NULL,
  `em_designation` int(11) NOT NULL,
  `em_department` int(11) NOT NULL,
  `em_phone` varchar(20) NOT NULL,
  `em_email` varchar(100) NOT NULL,
  `em_salary` float DEFAULT NULL,
  `em_country` int(11) NOT NULL,
  `em_city` varchar(100) NOT NULL,
  `em_zip` varchar(100) NOT NULL,
  `em_address` varchar(200) NOT NULL,
  `em_image` varchar(200) NOT NULL,
  `em_passport_photo` varchar(500) DEFAULT NULL,
  `em_marital_status` varchar(20) DEFAULT NULL,
  `em_next_of_kin_name` varchar(255) DEFAULT NULL,
  `em_next_of_kin_phone` varchar(20) DEFAULT NULL,
  `em_next_of_kin_relationship` varchar(50) DEFAULT NULL,
  `em_date_hired` date DEFAULT NULL,
  `em_employment_status` enum('active','suspended','terminated','retired') NOT NULL DEFAULT 'active',
  `em_bank_name` varchar(100) DEFAULT NULL,
  `em_account_number` varchar(20) DEFAULT NULL,
  `em_pension_id` varchar(50) DEFAULT NULL,
  `em_tax_id` varchar(50) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `employee_tbl`
--

INSERT INTO `employee_tbl` (`employee_id`, `em_first_name`, `em_last_name`, `em_gender`, `em_date_of_birth`, `em_nin`, `em_staff_id`, `em_designation`, `em_department`, `em_phone`, `em_email`, `em_salary`, `em_country`, `em_city`, `em_zip`, `em_address`, `em_image`, `em_passport_photo`, `em_marital_status`, `em_next_of_kin_name`, `em_next_of_kin_phone`, `em_next_of_kin_relationship`, `em_date_hired`, `em_employment_status`, `em_bank_name`, `em_account_number`, `em_pension_id`, `em_tax_id`, `status`) VALUES
(3, 'Smart', 'kid', NULL, NULL, NULL, NULL, 1, 5, '0000000000', 'smartechkid@gmail.com', NULL, 2, 'Lagos', '100001', 'Auto-generated from user account', 'admin_assets/img/user/m.png', NULL, NULL, NULL, NULL, NULL, NULL, 'active', NULL, NULL, NULL, NULL, 1),
(4, 'Eugene', 'Orji', NULL, NULL, NULL, NULL, 3, 4, '0000000000', 'eugeneoorji@gmail.com', NULL, 2, 'Lagos', '100001', 'Auto-generated from user account', 'admin_assets/img/user/m.png', NULL, NULL, NULL, NULL, NULL, NULL, 'active', NULL, NULL, NULL, NULL, 1),
(5, 'Admin', 'User', NULL, NULL, NULL, NULL, 3, 4, '0000000000', 'admin@finbarrschool.com', NULL, 2, 'Lagos', '100001', 'Auto-generated from user account', 'admin_assets/img/user/m.png', NULL, NULL, NULL, NULL, NULL, NULL, 'active', NULL, NULL, NULL, NULL, 1),
(6, 'eugene', 'orji', NULL, NULL, NULL, NULL, 3, 4, '0000000000', 'nicegeneorji@gmail.com', NULL, 2, 'Lagos', '100001', 'Auto-generated from user account', 'admin_assets/img/user/m.png', NULL, NULL, NULL, NULL, NULL, NULL, 'active', NULL, NULL, NULL, NULL, 1),
(7, 'Finbarr\'s', 'Academy', NULL, NULL, NULL, NULL, 4, 4, '0000000000', 'everjoe514myown@gmail.com', NULL, 2, 'Lagos', '100001', 'Auto-generated from user account', 'admin_assets/img/user/m.png', NULL, NULL, NULL, NULL, NULL, NULL, 'active', NULL, NULL, NULL, NULL, 1),
(9, 'John', 'Clerk', NULL, NULL, NULL, NULL, 5, 1, '0000000000', 'clerk@finbarrschool.com', NULL, 2, 'Lagos', '100001', 'Auto-generated from user account', 'admin_assets/img/user/m.png', NULL, NULL, NULL, NULL, NULL, NULL, 'active', NULL, NULL, NULL, NULL, 1),
(11, 'Jane', 'Nurse', NULL, NULL, NULL, NULL, 1, 5, '0000000000', 'nurse@finbarrschool.com', NULL, 2, 'Lagos', '100001', 'Auto-generated from user account', 'admin_assets/img/user/m.png', NULL, NULL, NULL, NULL, NULL, NULL, 'active', NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `grn_details_tbl`
--

CREATE TABLE `grn_details_tbl` (
  `id` bigint(20) NOT NULL,
  `grn_detail_id` varchar(100) NOT NULL,
  `grn_id` varchar(100) NOT NULL,
  `po_detail_id` varchar(100) DEFAULT NULL,
  `product_id` varchar(100) NOT NULL,
  `quantity` decimal(12,3) NOT NULL DEFAULT 0.000,
  `rate` decimal(12,2) NOT NULL DEFAULT 0.00,
  `batch_no` varchar(100) DEFAULT NULL,
  `lot_no` varchar(100) DEFAULT NULL,
  `mfg_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `grn_tbl`
--

CREATE TABLE `grn_tbl` (
  `id` bigint(20) NOT NULL,
  `grn_id` varchar(100) NOT NULL,
  `po_id` varchar(100) NOT NULL,
  `purchase_id` varchar(100) DEFAULT NULL,
  `supplier_id` varchar(100) NOT NULL,
  `grn_date` date NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `grn_details` text DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'received',
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `posted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_details`
--

CREATE TABLE `invoice_details` (
  `id` int(11) NOT NULL,
  `invoice_id` varchar(20) NOT NULL,
  `invoice_details_id` varchar(20) NOT NULL,
  `product_id` varchar(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `discount` decimal(10,0) DEFAULT NULL,
  `total_price` decimal(10,0) DEFAULT NULL,
  `discount_amount` decimal(10,0) DEFAULT NULL,
  `tax` decimal(10,0) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_tbl`
--

CREATE TABLE `invoice_tbl` (
  `id` int(11) NOT NULL,
  `invoice_id` varchar(20) NOT NULL,
  `customer_id` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `invoice` varchar(100) NOT NULL,
  `is_different` int(11) DEFAULT NULL,
  `is_inhouse` int(2) NOT NULL COMMENT '1=In and 2 = out',
  `shipping_method` varchar(100) NOT NULL,
  `payment_method` varchar(55) NOT NULL,
  `bank_id` varchar(50) DEFAULT NULL,
  `description` mediumtext NOT NULL,
  `invoice_discount` float NOT NULL,
  `total_discount` float NOT NULL,
  `total_amount` float NOT NULL,
  `paid_amount` float NOT NULL,
  `due_amount` float NOT NULL,
  `total_tax` float NOT NULL,
  `status` int(11) NOT NULL COMMENT '0 = pending, 1 = Processing and 2 = Delivered',
  `created_by` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` varchar(20) NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `id` int(11) NOT NULL,
  `phrase` varchar(100) NOT NULL,
  `english` varchar(255) NOT NULL,
  `yoruba` text DEFAULT NULL,
  `odia` text DEFAULT NULL,
  `xx` text DEFAULT NULL,
  `spanish` text DEFAULT NULL,
  `arabic` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`id`, `phrase`, `english`, `yoruba`, `odia`, `xx`, `spanish`, `arabic`) VALUES
(2, 'login', 'Login', NULL, NULL, NULL, NULL, NULL),
(3, 'email', 'Email Address', NULL, NULL, NULL, NULL, NULL),
(4, 'password', 'Password', NULL, NULL, NULL, NULL, NULL),
(5, 'reset', 'Reset', NULL, NULL, NULL, NULL, NULL),
(6, 'dashboard', 'Dashboard', NULL, NULL, NULL, NULL, NULL),
(7, 'home', 'Home', NULL, NULL, NULL, NULL, NULL),
(8, 'profile', 'Profile', NULL, NULL, NULL, NULL, NULL),
(9, 'profile_setting', 'Profile Setting', NULL, NULL, NULL, NULL, NULL),
(10, 'firstname', 'First Name', NULL, NULL, NULL, NULL, NULL),
(11, 'lastname', 'Last Name', NULL, NULL, NULL, NULL, NULL),
(12, 'about', 'About', NULL, NULL, NULL, NULL, 'ar_ar'),
(13, 'preview', 'Preview', NULL, NULL, NULL, NULL, NULL),
(14, 'image', 'Image', NULL, NULL, NULL, NULL, NULL),
(15, 'save', 'Save', NULL, NULL, NULL, NULL, NULL),
(16, 'upload_successfully', 'Upload Successfully!', NULL, NULL, NULL, NULL, NULL),
(17, 'user_added_successfully', 'User Added Successfully!', NULL, NULL, NULL, NULL, NULL),
(18, 'please_try_again', 'Please Try Again...', NULL, NULL, NULL, NULL, NULL),
(19, 'inbox_message', 'Inbox Messages', NULL, NULL, NULL, NULL, NULL),
(20, 'sent_message', 'Sent Message', NULL, NULL, NULL, NULL, NULL),
(21, 'message_details', 'Message Details', NULL, NULL, NULL, NULL, NULL),
(22, 'new_message', 'New Message', NULL, NULL, NULL, NULL, NULL),
(23, 'receiver_name', 'Receiver Name', NULL, NULL, NULL, NULL, NULL),
(24, 'sender_name', 'Sender Name', NULL, NULL, NULL, NULL, NULL),
(25, 'subject', 'Subject', NULL, NULL, NULL, NULL, NULL),
(26, 'message', 'Message', NULL, NULL, NULL, NULL, NULL),
(27, 'message_sent', 'Message Sent!', NULL, NULL, NULL, NULL, NULL),
(28, 'ip_address', 'IP Address', NULL, NULL, NULL, NULL, NULL),
(29, 'last_login', 'Last Login', NULL, NULL, NULL, NULL, NULL),
(30, 'last_logout', 'Last Logout', NULL, NULL, NULL, NULL, NULL),
(31, 'status', 'Status', NULL, NULL, NULL, NULL, NULL),
(32, 'delete_successfully', 'Delete Successfully!', NULL, NULL, NULL, NULL, NULL),
(33, 'send', 'Send', NULL, NULL, NULL, NULL, NULL),
(34, 'date', 'Date', NULL, NULL, NULL, NULL, NULL),
(35, 'action', 'Action', NULL, NULL, NULL, NULL, NULL),
(36, 'sl_no', 'SL No.', NULL, NULL, NULL, NULL, NULL),
(37, 'are_you_sure', 'Are you sure?', NULL, NULL, NULL, NULL, NULL),
(38, 'application_setting', 'Application Setting', NULL, NULL, NULL, NULL, NULL),
(39, 'application_title', 'Application Title', NULL, NULL, NULL, NULL, NULL),
(40, 'address', 'Address', NULL, NULL, NULL, NULL, NULL),
(41, 'phone', 'Phone', NULL, NULL, NULL, NULL, NULL),
(42, 'favicon', 'Favicon', NULL, NULL, NULL, NULL, NULL),
(43, 'logo', 'Logo', NULL, NULL, NULL, NULL, NULL),
(44, 'language', 'Language', NULL, NULL, NULL, NULL, NULL),
(45, 'left_to_right', 'Left To Right', NULL, NULL, NULL, NULL, NULL),
(46, 'right_to_left', 'Right To Left', NULL, NULL, NULL, NULL, NULL),
(47, 'footer_text', 'Footer Text', NULL, NULL, NULL, NULL, NULL),
(48, 'site_align', 'Application Alignment', NULL, NULL, NULL, NULL, NULL),
(49, 'welcome_back', 'Welcome Back!', NULL, NULL, NULL, NULL, NULL),
(50, 'please_contact_with_admin', 'Please Contact With Admin', NULL, NULL, NULL, NULL, NULL),
(51, 'incorrect_email_or_password', 'Incorrect Email/Password', NULL, NULL, NULL, NULL, NULL),
(52, 'select_option', 'Select Option', NULL, NULL, NULL, NULL, NULL),
(53, 'ftp_setting', 'Data Synchronize [FTP Setting]', NULL, NULL, NULL, NULL, NULL),
(54, 'hostname', 'Host Name', NULL, NULL, NULL, NULL, NULL),
(55, 'username', 'User Name', NULL, NULL, NULL, NULL, NULL),
(56, 'ftp_port', 'FTP Port', NULL, NULL, NULL, NULL, NULL),
(57, 'ftp_debug', 'FTP Debug', NULL, NULL, NULL, NULL, NULL),
(58, 'project_root', 'Project Root', NULL, NULL, NULL, NULL, NULL),
(59, 'update_successfully', 'Update Successfully', NULL, NULL, NULL, NULL, NULL),
(60, 'save_successfully', 'Saved Successfully!', NULL, NULL, NULL, NULL, NULL),
(61, 'delete_successfully', 'Delete Successfully!', NULL, NULL, NULL, NULL, NULL),
(62, 'internet_connection', 'Internet Connection', NULL, NULL, NULL, NULL, NULL),
(63, 'ok', 'Ok', NULL, NULL, NULL, NULL, NULL),
(64, 'not_available', 'Not Available', NULL, NULL, NULL, NULL, NULL),
(65, 'available', 'Available', NULL, NULL, NULL, NULL, NULL),
(66, 'outgoing_file', 'Outgoing File', NULL, NULL, NULL, NULL, NULL),
(67, 'incoming_file', 'Incoming File', NULL, NULL, NULL, NULL, NULL),
(68, 'data_synchronize', 'Data Synchronize', NULL, NULL, NULL, NULL, NULL),
(69, 'unable_to_upload_file_please_check_configuration', 'Unable to upload file! please check configuration', NULL, NULL, NULL, NULL, NULL),
(70, 'please_configure_synchronizer_settings', 'Please configure synchronizer settings', NULL, NULL, NULL, NULL, NULL),
(71, 'download_successfully', 'Download Successfully', NULL, NULL, NULL, NULL, NULL),
(72, 'unable_to_download_file_please_check_configuration', 'Unable to download file! please check configuration', NULL, NULL, NULL, NULL, NULL),
(73, 'data_import_first', 'Data Import First', NULL, NULL, NULL, NULL, NULL),
(74, 'data_import_successfully', 'Data Import Successfully!', NULL, NULL, NULL, NULL, NULL),
(75, 'unable_to_import_data_please_check_config_or_sql_file', 'Unable to import data! please check configuration / SQL file.', NULL, NULL, NULL, NULL, NULL),
(76, 'download_data_from_server', 'Download Data from Server', NULL, NULL, NULL, NULL, NULL),
(77, 'data_import_to_database', 'Data Import To Database', NULL, NULL, NULL, NULL, NULL),
(79, 'data_upload_to_server', 'Data Upload to Server', NULL, NULL, NULL, NULL, NULL),
(80, 'please_wait', 'Please Wait...', NULL, NULL, NULL, NULL, NULL),
(81, 'ooops_something_went_wrong', ' Ooops something went wrong...', NULL, NULL, NULL, NULL, NULL),
(82, 'module_permission_list', 'Module Permission List', NULL, NULL, NULL, NULL, NULL),
(83, 'user_permission', 'User Permission', NULL, NULL, NULL, NULL, NULL),
(84, 'add_module_permission', 'Add Module Permission', NULL, NULL, NULL, NULL, NULL),
(85, 'module_permission_added_successfully', 'Module Permission Added Successfully!', NULL, NULL, NULL, NULL, NULL),
(86, 'update_module_permission', 'Update Module Permission', NULL, NULL, NULL, NULL, NULL),
(87, 'download', 'Download', NULL, NULL, NULL, NULL, NULL),
(88, 'module_name', 'Module Name', NULL, NULL, NULL, NULL, NULL),
(89, 'create', 'Create', NULL, NULL, NULL, NULL, NULL),
(90, 'read', 'Read', NULL, NULL, NULL, NULL, NULL),
(91, 'update', 'Update', NULL, NULL, NULL, NULL, NULL),
(92, 'delete', 'Delete', NULL, NULL, NULL, NULL, NULL),
(93, 'module_list', 'Module List', NULL, NULL, NULL, NULL, NULL),
(94, 'add_module', 'Add Module', NULL, NULL, NULL, NULL, NULL),
(95, 'directory', 'Module Direcotory', NULL, NULL, NULL, NULL, NULL),
(96, 'description', 'Description', NULL, NULL, NULL, NULL, NULL),
(97, 'image_upload_successfully', 'Image Upload Successfully!', NULL, NULL, NULL, NULL, NULL),
(98, 'module_added_successfully', 'Module Added Successfully', NULL, NULL, NULL, NULL, NULL),
(99, 'inactive', 'Inactive', NULL, NULL, NULL, NULL, NULL),
(100, 'active', 'Active', NULL, NULL, NULL, NULL, NULL),
(101, 'user_list', 'User List', NULL, NULL, NULL, NULL, NULL),
(102, 'see_all_message', 'See All Messages', NULL, NULL, NULL, NULL, NULL),
(103, 'setting', 'Setting', NULL, NULL, NULL, NULL, NULL),
(104, 'logout', 'Logout', NULL, NULL, NULL, NULL, NULL),
(105, 'admin', 'Admin', NULL, NULL, NULL, NULL, NULL),
(106, 'add_user', 'Add User', NULL, NULL, NULL, NULL, NULL),
(107, 'user', 'User', NULL, NULL, NULL, NULL, NULL),
(108, 'module', 'Module', NULL, NULL, NULL, NULL, NULL),
(109, 'new', 'New', NULL, NULL, NULL, NULL, NULL),
(110, 'inbox', 'Inbox', NULL, NULL, NULL, NULL, NULL),
(111, 'sent', 'Sent', NULL, NULL, NULL, NULL, NULL),
(112, 'synchronize', 'Synchronize', NULL, NULL, NULL, NULL, NULL),
(113, 'data_synchronizer', 'Data Synchronizer', NULL, NULL, NULL, NULL, NULL),
(114, 'module_permission', 'Module Permission', NULL, NULL, NULL, NULL, NULL),
(115, 'backup_now', 'Backup Now!', NULL, NULL, NULL, NULL, NULL),
(116, 'restore_now', 'Restore Now!', NULL, NULL, NULL, NULL, NULL),
(117, 'backup_and_restore', 'Backup and Restore', NULL, NULL, NULL, NULL, NULL),
(118, 'captcha', 'Captcha Word', NULL, NULL, NULL, NULL, NULL),
(119, 'database_backup', 'Database Backup', NULL, NULL, NULL, NULL, NULL),
(120, 'restore_successfully', 'Restore Successfully', NULL, NULL, NULL, NULL, NULL),
(121, 'backup_successfully', 'Backup Successfully', NULL, NULL, NULL, NULL, NULL),
(122, 'filename', 'File Name', NULL, NULL, NULL, NULL, NULL),
(123, 'file_information', 'File Information', NULL, NULL, NULL, NULL, NULL),
(124, 'size', 'size', NULL, NULL, NULL, NULL, NULL),
(125, 'backup_date', 'Backup Date', NULL, NULL, NULL, NULL, NULL),
(126, 'overwrite', 'Overwrite', NULL, NULL, NULL, NULL, NULL),
(127, 'invalid_file', 'Invalid File!', NULL, NULL, NULL, NULL, NULL),
(128, 'invalid_module', 'Invalid Module', NULL, NULL, NULL, NULL, NULL),
(129, 'remove_successfully', 'Remove Successfully!', NULL, NULL, NULL, NULL, NULL),
(130, 'install', 'Install', NULL, NULL, NULL, NULL, NULL),
(131, 'uninstall', 'Uninstall', NULL, NULL, NULL, NULL, NULL),
(132, 'tables_are_not_available_in_database', 'Tables are not available in database.sql', NULL, NULL, NULL, NULL, NULL),
(133, 'no_tables_are_registered_in_config', 'No tables are registerd in config.php', NULL, NULL, NULL, NULL, NULL),
(134, 'enquiry', 'Enquiry', NULL, NULL, NULL, NULL, NULL),
(135, 'read_unread', 'Read/Unread', NULL, NULL, NULL, NULL, NULL),
(136, 'enquiry_information', 'Enquiry Information', NULL, NULL, NULL, NULL, NULL),
(137, 'user_agent', 'User Agent', NULL, NULL, NULL, NULL, NULL),
(138, 'checked_by', 'Checked By', NULL, NULL, NULL, NULL, NULL),
(139, 'new_enquiry', 'New Enquiry', NULL, NULL, NULL, NULL, NULL),
(140, 'hrm', 'HRM', NULL, NULL, NULL, NULL, NULL),
(141, 'test_module', 'Test Module', NULL, NULL, NULL, NULL, NULL),
(142, 'test_user', 'Test User', NULL, NULL, NULL, NULL, NULL),
(143, 'testmodule', 'Testmodule', NULL, NULL, NULL, NULL, NULL),
(692, 'inventory', 'Inventory', NULL, NULL, NULL, NULL, NULL),
(693, 'product_inventory', 'Product inventory', NULL, NULL, NULL, NULL, NULL),
(694, 'account', 'Account', NULL, NULL, NULL, NULL, ''),
(695, 'test', 'Test', NULL, NULL, NULL, NULL, NULL),
(696, 'customer', 'Customer', NULL, NULL, NULL, NULL, NULL),
(697, 'expense', 'Expense', NULL, NULL, NULL, NULL, NULL),
(698, 'hrm', 'HRM', NULL, NULL, NULL, NULL, NULL),
(699, 'invoice', 'Invoice', NULL, NULL, NULL, NULL, NULL),
(700, 'item', 'Item', NULL, NULL, NULL, NULL, NULL),
(701, 'purchase', 'Purchase', NULL, NULL, NULL, NULL, NULL),
(702, 'report', 'Report', NULL, NULL, NULL, NULL, NULL),
(703, 'stock', 'Stock', NULL, NULL, NULL, NULL, NULL),
(704, 'Supplier', 'Supplier', NULL, NULL, NULL, NULL, NULL),
(705, 'customer_list', 'Customer List', NULL, NULL, NULL, NULL, NULL),
(706, 'customer_name', 'Customer Name', NULL, NULL, NULL, NULL, NULL),
(707, 'mobile', 'Mobile', NULL, NULL, NULL, NULL, NULL),
(708, 'address', 'Address', NULL, NULL, NULL, NULL, NULL),
(709, 'add_new', 'Add New', NULL, NULL, NULL, NULL, NULL),
(710, 'ad', 'Add', NULL, NULL, NULL, NULL, NULL),
(711, 'customer_update', 'Customer Update', NULL, NULL, NULL, NULL, NULL),
(712, 'supplier_list', 'Supplier List', NULL, NULL, NULL, NULL, NULL),
(713, 'supplier_name', 'Supplier Name', NULL, NULL, NULL, NULL, NULL),
(714, 'supplier_add', 'Supplier Add', NULL, NULL, NULL, NULL, NULL),
(715, 'supplier_edit', 'Supplier Edit', NULL, NULL, NULL, NULL, NULL),
(716, 'previous_balance', 'Previous Balance', NULL, NULL, NULL, NULL, NULL),
(717, 'inventory', 'Inventory', NULL, NULL, NULL, NULL, NULL),
(718, 'product_inventory', 'Product inventory', NULL, NULL, NULL, NULL, NULL),
(719, 'account', 'Account', NULL, NULL, NULL, NULL, NULL),
(720, 'test', 'Test', NULL, NULL, NULL, NULL, NULL),
(721, 'customer', 'Customer', NULL, NULL, NULL, NULL, NULL),
(722, 'expense', 'Expense', NULL, NULL, NULL, NULL, NULL),
(723, 'hrm', 'HRM', NULL, NULL, NULL, NULL, NULL),
(724, 'invoice', 'Invoice', NULL, NULL, NULL, NULL, NULL),
(725, 'item', 'Item', NULL, NULL, NULL, NULL, NULL),
(726, 'purchase', 'Purchase', NULL, NULL, NULL, NULL, NULL),
(727, 'report', 'Report', NULL, NULL, NULL, NULL, NULL),
(728, 'stock', 'Stock', NULL, NULL, NULL, NULL, NULL),
(729, 'Supplier', 'Supplier', NULL, NULL, NULL, NULL, NULL),
(730, 'department', 'Department', NULL, NULL, NULL, NULL, NULL),
(731, 'designation', 'Designation', NULL, NULL, NULL, NULL, NULL),
(732, 'add_employee', 'Add Employee', NULL, NULL, NULL, NULL, NULL),
(733, 'manage_employee', 'Manage Employee', NULL, NULL, NULL, NULL, NULL),
(734, 'department_name', 'Department name', NULL, NULL, NULL, NULL, NULL),
(735, 'department_description', 'Department description', NULL, NULL, NULL, NULL, NULL),
(736, 'designation', 'Designation', NULL, NULL, NULL, NULL, NULL),
(737, 'employee', 'Employee', NULL, NULL, NULL, NULL, NULL),
(738, 'name', 'Name', NULL, NULL, NULL, NULL, NULL),
(739, 'country', 'Country', NULL, NULL, NULL, NULL, NULL),
(740, 'city', 'City', NULL, NULL, NULL, NULL, NULL),
(741, 'zip', 'Zip', NULL, NULL, NULL, NULL, NULL),
(742, 'salary', 'Salary', NULL, NULL, NULL, NULL, NULL),
(743, 'address', 'Address', NULL, NULL, NULL, NULL, NULL),
(744, 'salary', 'Salary', NULL, NULL, NULL, NULL, NULL),
(745, 'amount', 'Amount', NULL, NULL, NULL, NULL, NULL),
(746, 'attendance', 'Attendance', NULL, NULL, NULL, NULL, NULL),
(747, 'in_time', 'In Time', NULL, NULL, NULL, NULL, NULL),
(748, 'out_time', 'Out Time', NULL, NULL, NULL, NULL, NULL),
(749, 'date', 'Date', NULL, NULL, NULL, NULL, NULL),
(750, 'stay_time', 'Stay Time', NULL, NULL, NULL, NULL, NULL),
(751, 'attendance_report', 'Attendance Report', NULL, NULL, NULL, NULL, NULL),
(752, 'submit', 'Submit', NULL, NULL, NULL, NULL, NULL),
(753, 'item', 'Item', NULL, NULL, NULL, NULL, NULL),
(754, 'purchase', 'Purchase', NULL, NULL, NULL, NULL, NULL),
(755, 'report', 'Report', NULL, NULL, NULL, NULL, NULL),
(756, 'stock', 'Stock', NULL, NULL, NULL, NULL, NULL),
(757, 'Supplier', 'Supplier', NULL, NULL, NULL, NULL, NULL),
(758, 'add_item', 'Add Item', NULL, NULL, NULL, NULL, NULL),
(759, 'item_list', 'Item List', NULL, NULL, NULL, NULL, NULL),
(760, 'unit', 'Unit', NULL, NULL, NULL, NULL, NULL),
(761, 'category', 'Category', NULL, NULL, NULL, NULL, NULL),
(762, 'new_purchase', 'New Purchase', NULL, NULL, NULL, NULL, NULL),
(763, 'purchase_list', 'Purchase List', NULL, NULL, NULL, NULL, NULL),
(764, 'add_invoice', 'Add Invoice', NULL, NULL, NULL, NULL, NULL),
(765, 'invoice_list', 'Invoice List', NULL, NULL, NULL, NULL, NULL),
(766, 'invoice_id', 'Invoice ID', NULL, NULL, NULL, NULL, NULL),
(767, 'paid', 'Paid', NULL, NULL, NULL, NULL, NULL),
(769, 'total_amount', 'Total Aamount', NULL, NULL, NULL, NULL, NULL),
(770, 'record_not_found', 'Record not found', NULL, NULL, NULL, NULL, NULL),
(771, 'add_menu          ', 'Add Menu', NULL, NULL, NULL, NULL, NULL),
(772, 'menu              ', 'Role Permission', NULL, NULL, NULL, NULL, NULL),
(773, 'menu_list', 'Menu List', NULL, NULL, NULL, NULL, NULL),
(774, 'add_role', 'Add Role', NULL, NULL, NULL, NULL, NULL),
(775, 'role_list', 'Role List', NULL, NULL, NULL, NULL, NULL),
(776, 'role_assign', 'User Assign Role', NULL, NULL, NULL, NULL, NULL),
(777, 'assigned_userrole_list', 'Assigned List', NULL, NULL, NULL, NULL, NULL),
(778, 'accounts', 'Accounts', NULL, NULL, NULL, NULL, NULL),
(779, 'payment_or_receive', 'Payment or Receive', NULL, NULL, NULL, NULL, NULL),
(780, 'manage_transaction', 'Manage Transaction', NULL, NULL, NULL, NULL, NULL),
(781, 'payment_received_transaction', 'Payment received transaction', NULL, NULL, NULL, NULL, NULL),
(782, 'choose_transaction', 'Choose transaction', NULL, NULL, NULL, NULL, NULL),
(783, 'payment', 'Payment', NULL, NULL, NULL, NULL, NULL),
(784, 'receive', 'Receive', NULL, NULL, NULL, NULL, NULL),
(785, 'transaction_category', 'Transaction Category', NULL, NULL, NULL, NULL, NULL),
(786, 'transaction_mode', 'Transaction mode', NULL, NULL, NULL, NULL, NULL),
(787, 'bank', 'Bank', NULL, NULL, NULL, NULL, NULL),
(788, 'add_bank', 'Add Bank', NULL, NULL, NULL, NULL, NULL),
(789, 'bank_list', 'Bank List', NULL, NULL, NULL, NULL, NULL),
(790, 'bank_name', 'Bank Name', NULL, NULL, NULL, NULL, NULL),
(791, 'account_no', 'Account No ', NULL, NULL, NULL, NULL, NULL),
(792, 'branch_name', 'Branch Name', NULL, NULL, NULL, NULL, NULL),
(793, 'salary_generat_list', 'Salary generate list', NULL, NULL, NULL, NULL, NULL),
(794, 'salary_setup', 'Salary Setup', NULL, NULL, NULL, NULL, NULL),
(795, 'purchase_date', 'Purchase Date', NULL, NULL, NULL, NULL, NULL),
(796, 'challan_no', 'Challan No', NULL, NULL, NULL, NULL, NULL),
(797, 'details', 'Details', NULL, NULL, NULL, NULL, NULL),
(798, 'payment_type', 'Payment Type', NULL, NULL, NULL, NULL, NULL),
(799, 'cash_payment', 'Cash Payment', NULL, NULL, NULL, NULL, NULL),
(800, 'bank_payment', 'Bank Payment', NULL, NULL, NULL, NULL, NULL),
(801, 'due_payment', 'Due Payment', NULL, NULL, NULL, NULL, NULL),
(802, 'item_name', 'Item Name', NULL, NULL, NULL, NULL, NULL),
(803, 'unit_qty', 'Unit Qty', NULL, NULL, NULL, NULL, NULL),
(804, 'box_qty', 'Box Qty', NULL, NULL, NULL, NULL, NULL),
(805, 'rate', 'Rate', NULL, NULL, NULL, NULL, NULL),
(806, 'total', 'Total ', NULL, NULL, NULL, NULL, NULL),
(807, 'discount', 'Discount', NULL, NULL, NULL, NULL, NULL),
(808, 'grand_total', 'Grand Total', NULL, NULL, NULL, NULL, NULL),
(809, 'edit_purchase', 'Edit Purchase', NULL, NULL, NULL, NULL, NULL),
(810, 'filter', 'Filter', NULL, NULL, NULL, NULL, NULL),
(811, 'from_date', 'From Date', NULL, NULL, NULL, NULL, NULL),
(812, 'to_date', 'To Date', NULL, NULL, NULL, NULL, NULL),
(813, 'find', 'Find', NULL, NULL, NULL, NULL, NULL),
(814, 'purchase_id', 'Purchase Id', NULL, NULL, NULL, NULL, NULL),
(815, 'sl', 'Sl', NULL, NULL, NULL, NULL, NULL),
(816, 'qty', 'Qty', NULL, NULL, NULL, NULL, NULL),
(817, 'price', 'Price', NULL, NULL, NULL, NULL, NULL),
(818, 'purchase_price', 'Purchase Price', NULL, NULL, NULL, NULL, NULL),
(819, 'sale_price', 'Sale Price', NULL, NULL, NULL, NULL, NULL),
(820, 'cartoon_qty', 'Cartoon Qty', NULL, NULL, NULL, NULL, NULL),
(821, 'item_model', 'Item Model', NULL, NULL, NULL, NULL, NULL),
(822, 'item_code', 'Item Code', NULL, NULL, NULL, NULL, NULL),
(823, 'category_name', 'Category  Name', NULL, NULL, NULL, NULL, NULL),
(824, 'parent_category', 'Parent Category', NULL, NULL, NULL, NULL, NULL),
(825, 'category_list', 'Category List', NULL, NULL, NULL, NULL, NULL),
(826, 'add_category', 'Add Category', NULL, NULL, NULL, NULL, NULL),
(827, 'unit_list', 'Unit List', NULL, NULL, NULL, NULL, NULL),
(828, 'add_unit', 'Add Unit', NULL, NULL, NULL, NULL, NULL),
(829, 'unit_name', 'Unit Name', NULL, NULL, NULL, NULL, NULL),
(830, 'total_price', 'Total Price', NULL, NULL, NULL, NULL, NULL),
(831, 'payment_amount', 'Payment Amount', NULL, NULL, NULL, NULL, NULL),
(832, 'select_name', 'Select Name', NULL, NULL, NULL, NULL, NULL),
(833, 'select_one', 'Select One', NULL, NULL, NULL, NULL, NULL),
(834, 'receipt_amount', 'Receipt Amount', NULL, NULL, NULL, NULL, NULL),
(835, 'isreceipt', 'Received/Payment', NULL, NULL, NULL, NULL, NULL),
(836, 'supplier_ledger', 'Supplier Ledger', NULL, NULL, NULL, NULL, NULL),
(837, 'total_credit', 'Total Credit', NULL, NULL, NULL, NULL, NULL),
(838, 'total_debit', 'Total Debit', NULL, NULL, NULL, NULL, NULL),
(839, 'balance', 'Balance', NULL, NULL, NULL, NULL, NULL),
(840, 'stock_report_supplier_wise', 'Stock report (supplier wise)', NULL, NULL, NULL, NULL, NULL),
(841, 'stock_report', 'Stock report', NULL, NULL, NULL, NULL, NULL),
(842, 'purchase_report', 'Purchase Report', NULL, NULL, NULL, NULL, NULL),
(843, 'stock_report_product_wise', 'Stock report product wise', NULL, NULL, NULL, NULL, NULL),
(844, 'list', 'list', NULL, NULL, NULL, NULL, NULL),
(845, 'sl', 'LS', NULL, NULL, NULL, NULL, NULL),
(846, 'generate', 'Generate', NULL, NULL, NULL, NULL, NULL),
(847, 'salary', 'Salary', NULL, NULL, NULL, NULL, NULL),
(848, 'month', 'Month', NULL, NULL, NULL, NULL, NULL),
(849, 'by', 'By', NULL, NULL, NULL, NULL, NULL),
(850, 'paid', 'Paid', NULL, NULL, NULL, NULL, NULL),
(851, 'pay_now', 'Pay now', NULL, NULL, NULL, NULL, NULL),
(852, 'receipt', 'Receipt', NULL, NULL, NULL, NULL, NULL),
(853, 'add', 'Add', NULL, NULL, NULL, NULL, NULL),
(854, 'department', 'Department', NULL, NULL, NULL, NULL, NULL),
(855, 'close', 'Close', NULL, NULL, NULL, NULL, NULL),
(856, 'note', 'Note', NULL, NULL, NULL, NULL, NULL),
(857, 'account_adjustment', 'Account Adjustment', NULL, NULL, NULL, NULL, NULL),
(858, 'add', 'Add', NULL, NULL, NULL, NULL, NULL),
(859, 'payment_date', 'Payment Date', NULL, NULL, NULL, NULL, NULL),
(860, 'payment_type', 'Payment Type', NULL, NULL, NULL, NULL, NULL),
(861, 'bank_ledger', 'Bank Ledger', NULL, NULL, NULL, NULL, NULL),
(862, 'ledger', 'Ledger', NULL, NULL, NULL, NULL, NULL),
(863, 'transactionid', 'Transaction ID', NULL, NULL, NULL, NULL, NULL),
(864, 'paid_amount', 'Paid Amount', NULL, NULL, NULL, NULL, NULL),
(865, 'invoice_discount', 'Invoice Discount', NULL, NULL, NULL, NULL, NULL),
(866, 'total_discount', 'Total Discount', NULL, NULL, NULL, NULL, NULL),
(867, 'debit', 'Debit', NULL, NULL, NULL, NULL, NULL),
(868, 'credit', 'Credit', NULL, NULL, NULL, NULL, NULL),
(869, 'due', 'Due', NULL, NULL, NULL, NULL, NULL),
(870, 'customer_ledger', 'Customer Ledger', NULL, NULL, NULL, NULL, NULL),
(871, 'sales_report', 'Sales report', NULL, NULL, NULL, NULL, NULL),
(872, 'sales', 'Sales', NULL, NULL, NULL, NULL, NULL),
(873, 'invoice_details', 'Invoice Details', NULL, NULL, NULL, NULL, NULL),
(874, 'bank_adjustment', 'Bank Adjustment', NULL, NULL, NULL, NULL, NULL),
(875, 'currency_name', 'Currency Name', NULL, NULL, NULL, NULL, NULL),
(876, 'currency_icon', 'Currency Icon', NULL, NULL, NULL, NULL, NULL),
(877, 'currency_rate', 'Currency Rate', NULL, NULL, NULL, NULL, NULL),
(878, 'currency_position', 'Position', NULL, NULL, NULL, NULL, NULL),
(879, 'currency_add', 'Currency Add', NULL, NULL, NULL, NULL, NULL),
(880, 'currency_edit', 'Currency Edit', NULL, NULL, NULL, NULL, NULL),
(881, 'currency_list', 'Currency List', NULL, NULL, NULL, NULL, NULL),
(882, 'currency', 'Currency', NULL, NULL, NULL, NULL, NULL),
(883, 'cash', 'Cash', NULL, NULL, NULL, NULL, NULL),
(884, 'book', 'Book', NULL, NULL, NULL, NULL, NULL),
(885, 'cash_book', 'Cash book', NULL, NULL, NULL, NULL, NULL),
(886, 'cash_payment', 'Cash Payment', NULL, NULL, NULL, NULL, NULL),
(887, 'bank_payment', 'Bank Payment', NULL, NULL, NULL, NULL, NULL),
(888, 'due_payment', 'Due Payment', NULL, NULL, NULL, NULL, NULL),
(889, 'spasni', '', NULL, NULL, NULL, NULL, NULL),
(890, 'odia', '', NULL, NULL, NULL, NULL, NULL),
(891, 'quantity', 'Quantity', NULL, NULL, NULL, NULL, NULL),
(892, 'thank_you_very_much', 'Thank you very much for choosing us. It was a pleasure to have worked with you.', NULL, NULL, NULL, NULL, NULL),
(893, 'received_amount', 'Received Amount', NULL, NULL, NULL, NULL, NULL),
(894, 'left', 'Left', NULL, NULL, NULL, NULL, NULL),
(895, 'right', 'Right', NULL, NULL, NULL, NULL, NULL),
(896, 'edit_phrase', 'Edit Phrase', NULL, NULL, NULL, NULL, NULL),
(897, 'add_new_phrase', 'Add New Phrase', NULL, NULL, NULL, NULL, NULL),
(898, 'add_language', 'Add Language', NULL, NULL, NULL, NULL, NULL),
(899, 'add_language_name', 'Add Language Name', NULL, NULL, NULL, NULL, NULL),
(900, 'add_language_name', 'Add Language Name', NULL, NULL, NULL, NULL, NULL),
(901, 'add_phrase', 'Add Phrase', NULL, NULL, NULL, NULL, NULL),
(902, 'phrase_name', 'Phrase Name', NULL, NULL, NULL, NULL, NULL),
(903, 'phrase', 'Phrase', NULL, NULL, NULL, NULL, NULL),
(904, 'add_phrase_name', 'Add Phrase Name', NULL, NULL, NULL, NULL, NULL),
(905, 'about_me', 'About Me', NULL, NULL, NULL, NULL, ''),
(906, 'choose_file', 'Choose File', NULL, NULL, NULL, NULL, NULL),
(907, 'more_info', 'More Info', NULL, NULL, NULL, NULL, NULL),
(908, 'purchase_and_sales_report', 'Purchase and sales report', NULL, NULL, NULL, NULL, NULL),
(909, 'select_employee', 'Select Employee', NULL, NULL, NULL, NULL, NULL),
(910, 'main_salary', 'Main Salary', NULL, NULL, NULL, NULL, NULL),
(911, 'earnings', 'Earnings', NULL, NULL, NULL, NULL, NULL),
(912, 'cancel', 'Cancel', NULL, NULL, NULL, NULL, NULL),
(913, 'menu_title', 'Menu Title', NULL, NULL, NULL, NULL, NULL),
(914, 'page_url', 'Page URL', NULL, NULL, NULL, NULL, NULL),
(915, 'module_name', 'Module Name', NULL, NULL, NULL, NULL, NULL),
(916, 'parent_menu', 'Parent Menu', NULL, NULL, NULL, NULL, NULL),
(917, 'role_name', 'Role Name', NULL, NULL, NULL, NULL, NULL),
(918, 'select_deselect', 'Select/Deselect', NULL, NULL, NULL, NULL, NULL),
(919, 'can_create', 'Can Create', NULL, NULL, NULL, NULL, NULL),
(920, 'all', 'All', NULL, NULL, NULL, NULL, NULL),
(921, 'can_read', 'Can Read', NULL, NULL, NULL, NULL, NULL),
(922, 'can_edit', 'Can Edit', NULL, NULL, NULL, NULL, NULL),
(923, 'can_delete', 'Can Delete', NULL, NULL, NULL, NULL, NULL),
(924, 'user_name', 'User Name', NULL, NULL, NULL, NULL, NULL),
(925, 'assigned_role', 'Assigned Role', NULL, NULL, NULL, NULL, NULL),
(926, 'menu_list', 'Menu List', NULL, NULL, NULL, NULL, NULL),
(927, 'product_name', 'Product Name', NULL, NULL, NULL, NULL, NULL),
(928, 'product_model', 'Product Model', NULL, NULL, NULL, NULL, NULL),
(929, 'category_name', 'Category Name', NULL, NULL, NULL, NULL, NULL),
(930, 'sales_price', 'Sales Price', NULL, NULL, NULL, NULL, NULL),
(931, 'purchase_price', 'Purchase Price', NULL, NULL, NULL, NULL, NULL),
(932, 'total_sales', 'Total Sales', NULL, NULL, NULL, NULL, NULL),
(933, 'total_purchase', 'Total Purchase', NULL, NULL, NULL, NULL, NULL),
(934, 'select_product', 'Select Product', NULL, NULL, NULL, NULL, NULL),
(935, 'search', 'Search', NULL, NULL, NULL, NULL, NULL),
(936, 'select_supplier', 'Select Supplier', NULL, NULL, NULL, NULL, NULL),
(937, 'add_pos_invoice', 'Add POS Invoice', NULL, NULL, NULL, NULL, NULL),
(938, 'return', 'Return', NULL, NULL, NULL, NULL, NULL),
(939, 'payment_now', 'Pay Now', NULL, NULL, NULL, NULL, NULL),
(940, 'supplier_return', 'Supplier Return', NULL, NULL, NULL, NULL, NULL),
(941, 'customer_return', 'Customer Return', NULL, NULL, NULL, NULL, NULL),
(942, 'sold_qty', 'Sold Qty', NULL, NULL, NULL, NULL, NULL),
(943, 'return_qty', 'Return Qty', NULL, NULL, NULL, NULL, NULL),
(944, 'reason', 'Reason', NULL, NULL, NULL, NULL, NULL),
(945, 'deduction', 'Deduction', NULL, NULL, NULL, NULL, NULL),
(946, 'customer_return_list', 'Customer Return List', NULL, NULL, NULL, NULL, NULL),
(947, 'purchase_qty', 'Purchase Qty', NULL, NULL, NULL, NULL, NULL),
(948, 'supplier_return_list', 'Supplier Return List', NULL, NULL, NULL, NULL, NULL),
(949, 'customer_return_details', 'Customer Return Details', NULL, NULL, NULL, NULL, NULL),
(950, 'cash_closing', 'Cash Closing', NULL, NULL, NULL, NULL, NULL),
(951, 'last_closing_balance', 'Last Closing Balance', NULL, NULL, NULL, NULL, NULL),
(952, 'closing_list', 'Closing List', NULL, NULL, NULL, NULL, NULL),
(953, 'cash_already_closed_for_this_day', 'Today\'s Cash Already Closed ', NULL, NULL, NULL, NULL, NULL),
(954, 'adjustment', 'Adjustment', NULL, NULL, NULL, NULL, NULL),
(955, 'import_csv', 'Import CSV', NULL, NULL, NULL, NULL, NULL),
(956, 'download_sample_file', 'Download sample file', NULL, NULL, NULL, NULL, NULL),
(957, 'imported_successfully', 'Imported Successfully', NULL, NULL, NULL, NULL, NULL),
(958, 'updated_successfully', 'Updated Successfully', NULL, NULL, NULL, NULL, NULL),
(959, 'payment_now', 'Payment Now', NULL, NULL, NULL, NULL, NULL),
(960, 'upload_csv_file', 'Upload csv file', NULL, NULL, NULL, NULL, NULL),
(961, 'upload', 'Upload', NULL, NULL, NULL, NULL, NULL),
(962, 'bank_book', 'Bank book', NULL, NULL, NULL, NULL, NULL),
(963, 'from_date', 'From date', NULL, NULL, NULL, NULL, NULL),
(964, 'deposit', 'Deposit', NULL, NULL, NULL, NULL, NULL),
(965, 'withdraw', 'Withdraw', NULL, NULL, NULL, NULL, NULL),
(966, 'stock_in', 'Stock In', NULL, NULL, NULL, NULL, NULL),
(968, 'stock_out', 'Stock Out', NULL, NULL, NULL, NULL, NULL),
(9997, 'student', 'Students', NULL, NULL, NULL, NULL, NULL),
(9998, 'student_list', 'Student List', NULL, NULL, NULL, NULL, NULL),
(9999, 'student_ledger', 'Student Ledger', NULL, NULL, NULL, NULL, NULL),
(10000, 'student_name', 'Student Name', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ledger_tbl`
--

CREATE TABLE `ledger_tbl` (
  `id` bigint(20) NOT NULL,
  `transaction_id` varchar(100) NOT NULL,
  `transaction_type` int(11) NOT NULL COMMENT '1=payment and 2= receive',
  `transaction_category` varchar(100) DEFAULT NULL,
  `ledger_id` varchar(100) NOT NULL,
  `invoice_no` varchar(100) DEFAULT NULL,
  `receipt_no` varchar(100) DEFAULT NULL,
  `amount` float NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `payment_type` varchar(100) DEFAULT NULL,
  `cheque_bank_name` varchar(255) DEFAULT NULL,
  `source_bank` varchar(50) DEFAULT NULL,
  `money_source` varchar(150) DEFAULT NULL,
  `transferred_by` varchar(150) DEFAULT NULL,
  `supplier_id` varchar(50) DEFAULT NULL,
  `student_id` varchar(50) DEFAULT NULL,
  `payment_reference` varchar(150) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `d_c` varchar(20) DEFAULT NULL,
  `is_capital` int(2) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(2) NOT NULL DEFAULT 1,
  `relation_id` varchar(50) DEFAULT NULL,
  `is_transaction` int(11) NOT NULL DEFAULT 0 COMMENT '0 = default and 1=from account transaction'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ledger_tbl`
--

INSERT INTO `ledger_tbl` (`id`, `transaction_id`, `transaction_type`, `transaction_category`, `ledger_id`, `invoice_no`, `receipt_no`, `amount`, `description`, `payment_type`, `cheque_bank_name`, `source_bank`, `money_source`, `transferred_by`, `supplier_id`, `student_id`, `payment_reference`, `date`, `d_c`, `is_capital`, `created_by`, `created_at`, `updated_by`, `updated_at`, `status`, `relation_id`, `is_transaction`) VALUES
(1, 'cvpx9mSdGOO8lei', 0, 'Purchase', 'supp_002', NULL, 'AliExpress001', 300000, 'Trouser 2 box blue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-21', 'd', NULL, 2, '2026-02-21 01:34:58', NULL, '2026-02-21 01:34:58', 1, NULL, 0),
(2, 'cvpx9mSdGOO8lei', 0, 'Purchase', '1', NULL, 'AliExpress001', 300000, 'Trouser 2 box blue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-21', 'c', NULL, 2, '2026-02-21 01:34:58', NULL, '2026-02-21 01:34:58', 1, NULL, 0),
(3, 'cvpx9mSdGOO8lei', 0, 'Purchase', 'supp_002', NULL, 'AliExpress001', 300000, 'Trouser 2 box blue', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-02-21', 'c', NULL, 2, '2026-02-21 01:34:58', NULL, '2026-02-21 01:34:58', 1, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `location_tbl`
--

CREATE TABLE `location_tbl` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `created_by` int(2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `recipient_id` int(11) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `body` text DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `parent_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `sender_id`, `recipient_id`, `subject`, `body`, `is_read`, `parent_id`, `created_at`) VALUES
(1, 3, 4, 'Sample Message', 'This is a sample private message between users.', 0, NULL, '2026-02-20 02:40:25'),
(2, 3, 6, 'Sample Message', 'This is a sample private message between users.', 0, NULL, '2026-02-20 02:59:36'),
(3, 3, 4, 'Welcome - Test Message', 'This is a sample message. You can reply from Messages > Inbox.', 0, NULL, '2026-02-20 03:34:33'),
(4, 1, 2, 'Welcome to Finbarr Inventory', 'This is a sample broadcast notification. You can customize notification settings in Admin Settings.', 1, NULL, '2026-02-20 02:40:25'),
(5, 1, 3, 'Welcome to Finbarr Inventory', 'This is a sample broadcast notification. You can customize notification settings in Admin Settings.', 0, NULL, '2026-02-20 02:40:25'),
(6, 1, 4, 'Welcome to Finbarr Inventory', 'This is a sample broadcast notification. You can customize notification settings in Admin Settings.', 0, NULL, '2026-02-20 02:40:25'),
(7, 1, 2, 'Welcome to Finbarr Inventory', 'This is a sample broadcast notification. You can customize notification settings in Admin Settings.', 1, NULL, '2026-02-20 02:59:36'),
(8, 1, 3, 'Welcome to Finbarr Inventory', 'This is a sample broadcast notification. You can customize notification settings in Admin Settings.', 0, NULL, '2026-02-20 02:59:36'),
(9, 1, 4, 'Welcome to Finbarr Inventory', 'This is a sample broadcast notification. You can customize notification settings in Admin Settings.', 0, NULL, '2026-02-20 02:59:36'),
(10, 1, 2, 'Welcome to Finbarr Inventory', 'Your notifications and messages are now active. Configure SMTP in Settings > App Customization to enable email.', 1, NULL, '2026-02-20 03:34:33'),
(11, 1, 3, 'Welcome to Finbarr Inventory', 'Your notifications and messages are now active. Configure SMTP in Settings > App Customization to enable email.', 0, NULL, '2026-02-20 03:34:33'),
(12, 1, 4, 'Welcome to Finbarr Inventory', 'Your notifications and messages are now active. Configure SMTP in Settings > App Customization to enable email.', 0, NULL, '2026-02-20 03:34:33'),
(13, 1, 5, 'Welcome to Finbarr Inventory', 'Your notifications and messages are now active. Configure SMTP in Settings > App Customization to enable email.', 0, NULL, '2026-02-20 03:34:33'),
(14, 1, 6, 'Welcome to Finbarr Inventory', 'Your notifications and messages are now active. Configure SMTP in Settings > App Customization to enable email.', 0, NULL, '2026-02-20 03:34:33'),
(15, 1, 3, 'System is undergoing maintenance', 'Will you all be available, tmrw?', 0, NULL, '2026-02-20 19:39:37'),
(16, 1, 4, 'System is undergoing maintenance', 'Will you all be available, tmrw?', 0, NULL, '2026-02-20 19:39:37'),
(17, 1, 5, 'System is undergoing maintenance', 'Will you all be available, tmrw?', 0, NULL, '2026-02-20 19:39:37'),
(18, 1, 6, 'System is undergoing maintenance', 'Will you all be available, tmrw?', 0, NULL, '2026-02-20 19:39:37'),
(19, 1, 7, 'System is undergoing maintenance', 'Will you all be available, tmrw?', 0, NULL, '2026-02-20 19:39:37'),
(20, 1, 8, 'System is undergoing maintenance', 'Will you all be available, tmrw?', 0, NULL, '2026-02-20 19:39:37'),
(21, 1, 9, 'System is undergoing maintenance', 'Will you all be available, tmrw?', 0, NULL, '2026-02-20 19:39:37'),
(22, 2, 3, 'We are to eat today', 'We are to eat today make yourself available', 0, NULL, '2026-02-21 00:09:55'),
(23, 2, 4, 'We are to eat today', 'We are to eat today make yourself available', 0, NULL, '2026-02-21 00:09:55'),
(24, 2, 5, 'We are to eat today', 'We are to eat today make yourself available', 0, NULL, '2026-02-21 00:09:55'),
(25, 2, 6, 'We are to eat today', 'We are to eat today make yourself available', 0, NULL, '2026-02-21 00:09:55'),
(26, 2, 7, 'We are to eat today', 'We are to eat today make yourself available', 0, NULL, '2026-02-21 00:09:55'),
(27, 2, 8, 'We are to eat today', 'We are to eat today make yourself available', 0, NULL, '2026-02-21 00:09:55'),
(28, 2, 9, 'We are to eat today', 'We are to eat today make yourself available', 0, NULL, '2026-02-21 00:09:55'),
(35, 2, 3, 'Happy Message', 'We are very happy today 10 billion for everyone', 0, NULL, '2026-03-02 04:00:10'),
(36, 2, 4, 'Happy Message', 'We are very happy today 10 billion for everyone', 0, NULL, '2026-03-02 04:00:10'),
(37, 2, 5, 'Happy Message', 'We are very happy today 10 billion for everyone', 0, NULL, '2026-03-02 04:00:10'),
(38, 2, 6, 'Happy Message', 'We are very happy today 10 billion for everyone', 0, NULL, '2026-03-02 04:00:10'),
(39, 2, 7, 'Happy Message', 'We are very happy today 10 billion for everyone', 0, NULL, '2026-03-02 04:00:10'),
(40, 2, 8, 'Happy Message', 'We are very happy today 10 billion for everyone', 0, NULL, '2026-03-02 04:00:10'),
(41, 2, 9, 'Happy Message', 'We are very happy today 10 billion for everyone', 0, NULL, '2026-03-02 04:00:10'),
(42, 2, 10, 'Happy Message', 'We are very happy today 10 billion for everyone', 1, NULL, '2026-03-02 04:00:10'),
(44, 10, 2, 'Appreciation message', 'Thank you so much sir', 1, NULL, '2026-03-02 04:06:09');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `type` enum('broadcast','direct') DEFAULT 'direct',
  `title` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `link` varchar(500) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `sender_id`, `type`, `title`, `message`, `link`, `is_read`, `created_at`) VALUES
(1, 2, NULL, 'broadcast', 'Welcome to Finbarr Inventory', 'This is a sample broadcast notification. You can customize notification settings in Admin Settings.', 'dashboard/home', 1, '2026-02-20 02:40:25'),
(2, 3, NULL, 'broadcast', 'Welcome to Finbarr Inventory', 'This is a sample broadcast notification. You can customize notification settings in Admin Settings.', 'dashboard/home', 0, '2026-02-20 02:40:25'),
(3, 4, NULL, 'broadcast', 'Welcome to Finbarr Inventory', 'This is a sample broadcast notification. You can customize notification settings in Admin Settings.', 'dashboard/home', 0, '2026-02-20 02:40:25'),
(4, 2, NULL, 'broadcast', 'Welcome to Finbarr Inventory', 'This is a sample broadcast notification. You can customize notification settings in Admin Settings.', 'dashboard/home', 1, '2026-02-20 02:59:36'),
(5, 3, NULL, 'broadcast', 'Welcome to Finbarr Inventory', 'This is a sample broadcast notification. You can customize notification settings in Admin Settings.', 'dashboard/home', 0, '2026-02-20 02:59:36'),
(6, 4, NULL, 'broadcast', 'Welcome to Finbarr Inventory', 'This is a sample broadcast notification. You can customize notification settings in Admin Settings.', 'dashboard/home', 0, '2026-02-20 02:59:36'),
(7, 2, NULL, 'broadcast', 'Welcome to Finbarr Inventory', 'Your notifications and messages are now active. Configure SMTP in Settings > App Customization to enable email.', 'dashboard/setting/app_customization', 1, '2026-02-20 03:34:33'),
(8, 3, NULL, 'broadcast', 'Welcome to Finbarr Inventory', 'Your notifications and messages are now active. Configure SMTP in Settings > App Customization to enable email.', 'dashboard/setting/app_customization', 0, '2026-02-20 03:34:33'),
(9, 4, NULL, 'broadcast', 'Welcome to Finbarr Inventory', 'Your notifications and messages are now active. Configure SMTP in Settings > App Customization to enable email.', 'dashboard/setting/app_customization', 0, '2026-02-20 03:34:33'),
(10, 5, NULL, 'broadcast', 'Welcome to Finbarr Inventory', 'Your notifications and messages are now active. Configure SMTP in Settings > App Customization to enable email.', 'dashboard/setting/app_customization', 0, '2026-02-20 03:34:33'),
(11, 6, NULL, 'broadcast', 'Welcome to Finbarr Inventory', 'Your notifications and messages are now active. Configure SMTP in Settings > App Customization to enable email.', 'dashboard/setting/app_customization', 0, '2026-02-20 03:34:33'),
(14, 3, NULL, 'broadcast', 'System is undergoing maintenance', 'Will you all be available, tmrw?', 'https://www.smartechkid.com/', 0, '2026-02-20 19:39:37'),
(15, 4, NULL, 'broadcast', 'System is undergoing maintenance', 'Will you all be available, tmrw?', 'https://www.smartechkid.com/', 0, '2026-02-20 19:39:37'),
(16, 5, NULL, 'broadcast', 'System is undergoing maintenance', 'Will you all be available, tmrw?', 'https://www.smartechkid.com/', 0, '2026-02-20 19:39:37'),
(17, 6, NULL, 'broadcast', 'System is undergoing maintenance', 'Will you all be available, tmrw?', 'https://www.smartechkid.com/', 0, '2026-02-20 19:39:37'),
(18, 7, NULL, 'broadcast', 'System is undergoing maintenance', 'Will you all be available, tmrw?', 'https://www.smartechkid.com/', 0, '2026-02-20 19:39:37'),
(19, 8, NULL, 'broadcast', 'System is undergoing maintenance', 'Will you all be available, tmrw?', 'https://www.smartechkid.com/', 0, '2026-02-20 19:39:37'),
(20, 9, NULL, 'broadcast', 'System is undergoing maintenance', 'Will you all be available, tmrw?', 'https://www.smartechkid.com/', 0, '2026-02-20 19:39:37'),
(21, 3, 2, 'broadcast', 'We are to eat today', 'We are to eat today make yourself available', 'dashboard/home', 0, '2026-02-21 00:09:55'),
(22, 4, 2, 'broadcast', 'We are to eat today', 'We are to eat today make yourself available', 'dashboard/home', 0, '2026-02-21 00:09:55'),
(23, 5, 2, 'broadcast', 'We are to eat today', 'We are to eat today make yourself available', 'dashboard/home', 0, '2026-02-21 00:09:55'),
(24, 6, 2, 'broadcast', 'We are to eat today', 'We are to eat today make yourself available', 'dashboard/home', 0, '2026-02-21 00:09:55'),
(25, 7, 2, 'broadcast', 'We are to eat today', 'We are to eat today make yourself available', 'dashboard/home', 0, '2026-02-21 00:09:55'),
(26, 8, 2, 'broadcast', 'We are to eat today', 'We are to eat today make yourself available', 'dashboard/home', 0, '2026-02-21 00:09:55'),
(27, 9, 2, 'broadcast', 'We are to eat today', 'We are to eat today make yourself available', 'dashboard/home', 0, '2026-02-21 00:09:55'),
(28, 3, 2, 'broadcast', 'Happy Message', 'We are very happy today 10 billion for everyone', 'dashboard', 0, '2026-03-02 04:00:10'),
(29, 4, 2, 'broadcast', 'Happy Message', 'We are very happy today 10 billion for everyone', 'dashboard', 0, '2026-03-02 04:00:10'),
(30, 5, 2, 'broadcast', 'Happy Message', 'We are very happy today 10 billion for everyone', 'dashboard', 0, '2026-03-02 04:00:10'),
(31, 6, 2, 'broadcast', 'Happy Message', 'We are very happy today 10 billion for everyone', 'dashboard', 0, '2026-03-02 04:00:10'),
(32, 7, 2, 'broadcast', 'Happy Message', 'We are very happy today 10 billion for everyone', 'dashboard', 0, '2026-03-02 04:00:10'),
(33, 8, 2, 'broadcast', 'Happy Message', 'We are very happy today 10 billion for everyone', 'dashboard', 0, '2026-03-02 04:00:10'),
(34, 9, 2, 'broadcast', 'Happy Message', 'We are very happy today 10 billion for everyone', 'dashboard', 0, '2026-03-02 04:00:10'),
(35, 10, 2, 'broadcast', 'Happy Message', 'We are very happy today 10 billion for everyone', 'dashboard', 1, '2026-03-02 04:00:10');

-- --------------------------------------------------------

--
-- Table structure for table `picture_tbl`
--

CREATE TABLE `picture_tbl` (
  `id` int(11) NOT NULL,
  `from_id` varchar(20) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `picture_type` varchar(20) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` int(11) NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `picture_tbl`
--

INSERT INTO `picture_tbl` (`id`, `from_id`, `picture`, `picture_type`, `created_by`, `created_date`, `updated_by`, `updated_date`, `status`) VALUES
(1, '73197771', './application/modules/item/assets/images/2026-02-21/20c1220d1a35674fdad4e09ed8c142c7.jpg', '', 2, '2026-02-21 01:07:11', 0, '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_purchase`
--

CREATE TABLE `product_purchase` (
  `purchase_id` varchar(100) NOT NULL,
  `challan_no` varchar(100) NOT NULL,
  `supplier_id` varchar(100) NOT NULL,
  `grand_total_amount` float NOT NULL,
  `paid_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `due_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `payment_status` varchar(20) NOT NULL DEFAULT 'due',
  `department_id` int(11) DEFAULT NULL,
  `money_source` varchar(150) DEFAULT NULL,
  `transferred_by` varchar(150) DEFAULT NULL,
  `payment_reference` varchar(150) DEFAULT NULL,
  `purchase_date` varchar(50) NOT NULL,
  `purchase_details` text NOT NULL,
  `status` int(2) NOT NULL DEFAULT 1,
  `discount` decimal(6,2) NOT NULL DEFAULT 0.00,
  `payment_type` tinyint(4) NOT NULL,
  `bank_id` varchar(15) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_purchase`
--

INSERT INTO `product_purchase` (`purchase_id`, `challan_no`, `supplier_id`, `grand_total_amount`, `paid_amount`, `due_amount`, `payment_status`, `department_id`, `money_source`, `transferred_by`, `payment_reference`, `purchase_date`, `purchase_details`, `status`, `discount`, `payment_type`, `bank_id`, `created_by`, `created_at`, `updated_at`) VALUES
('cvpx9mSdGOO8lei', 'AliExpress001', 'supp_002', 300000, 300000.00, 0.00, 'paid', NULL, NULL, NULL, NULL, '2026-02-21', 'Trouser 2 box blue', 1, 0.00, 1, '', 0, '2026-02-21 01:34:58', '2026-02-21 01:34:58');

-- --------------------------------------------------------

--
-- Table structure for table `product_purchase_details`
--

CREATE TABLE `product_purchase_details` (
  `id` int(11) NOT NULL,
  `purchase_detail_id` varchar(100) NOT NULL,
  `purchase_id` varchar(100) NOT NULL,
  `product_id` varchar(100) NOT NULL,
  `quantity` decimal(12,3) NOT NULL DEFAULT 0.000,
  `rate` float NOT NULL,
  `total_amount` float NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_purchase_details`
--

INSERT INTO `product_purchase_details` (`id`, `purchase_detail_id`, `purchase_id`, `product_id`, `quantity`, `rate`, `total_amount`, `status`) VALUES
(1, 'WL4bER4521QbdB4', 'cvpx9mSdGOO8lei', '73197771', 100.000, 3000, 300000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_return`
--

CREATE TABLE `product_return` (
  `id` int(11) NOT NULL,
  `return_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `purchase_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `supplier_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `invoice_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `return_date` date NOT NULL,
  `deduction` float NOT NULL,
  `invoice_discount` float NOT NULL,
  `total_amount` float NOT NULL,
  `reason` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `paymet_type` tinyint(4) NOT NULL,
  `bank_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(2) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_tbl`
--

CREATE TABLE `product_tbl` (
  `id` int(11) NOT NULL,
  `product_id` varchar(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `category_id` text NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `purchase_price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `old_price` decimal(10,0) DEFAULT NULL,
  `product_code` varchar(20) NOT NULL,
  `unit` int(11) DEFAULT NULL,
  `model` varchar(150) NOT NULL,
  `cartoon_qty` int(11) NOT NULL,
  `supplier_id` varchar(20) NOT NULL,
  `offer` varchar(255) NOT NULL,
  `top_offer` varchar(50) DEFAULT NULL COMMENT '1=top dealz, 2 = top accessories and 3 = discount',
  `tag` text DEFAULT NULL,
  `is_specification` int(2) DEFAULT NULL COMMENT '1=yes and 2= no',
  `is_exclusive` int(2) DEFAULT NULL COMMENT '1 = Yes and 2 = No',
  `exclusive_date` varchar(20) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` int(11) NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` int(11) NOT NULL,
  `reorder_level` int(11) DEFAULT 5
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_tbl`
--

INSERT INTO `product_tbl` (`id`, `product_id`, `name`, `category_id`, `description`, `price`, `purchase_price`, `old_price`, `product_code`, `unit`, `model`, `cartoon_qty`, `supplier_id`, `offer`, `top_offer`, `tag`, `is_specification`, `is_exclusive`, `exclusive_date`, `created_by`, `created_date`, `updated_by`, `updated_date`, `status`, `reorder_level`) VALUES
(1, '73197771', 'Blue Trouser', '51574', 'Trouser for primary 4', 5000.00, 3000.00, NULL, 'BT01', 4, 'NIICEGENE MODEL', 2, 'supp_002', '', NULL, NULL, NULL, NULL, NULL, 0, '2026-02-21 01:07:11', 0, '0000-00-00 00:00:00', 0, 5);

-- --------------------------------------------------------

--
-- Table structure for table `product_unit`
--

CREATE TABLE `product_unit` (
  `id` int(11) NOT NULL,
  `unit_name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_unit`
--

INSERT INTO `product_unit` (`id`, `unit_name`) VALUES
(1, 'S'),
(2, 'M'),
(3, 'L'),
(4, 'XL'),
(5, 'XXL'),
(6, '80 leaves'),
(7, 'size 34');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_batch_tbl`
--

CREATE TABLE `purchase_batch_tbl` (
  `id` bigint(20) NOT NULL,
  `batch_record_id` varchar(50) NOT NULL,
  `purchase_id` varchar(100) NOT NULL,
  `purchase_detail_id` varchar(100) NOT NULL,
  `product_id` varchar(100) NOT NULL,
  `batch_no` varchar(100) DEFAULT NULL,
  `lot_no` varchar(100) DEFAULT NULL,
  `mfg_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `quantity` decimal(12,3) NOT NULL DEFAULT 0.000,
  `remaining_qty` decimal(12,3) NOT NULL DEFAULT 0.000,
  `grn_id` varchar(100) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_details_tbl`
--

CREATE TABLE `purchase_order_details_tbl` (
  `id` bigint(20) NOT NULL,
  `po_detail_id` varchar(100) NOT NULL,
  `po_id` varchar(100) NOT NULL,
  `product_id` varchar(100) NOT NULL,
  `ordered_qty` decimal(12,3) NOT NULL DEFAULT 0.000,
  `received_qty` decimal(12,3) NOT NULL DEFAULT 0.000,
  `rate` decimal(12,2) NOT NULL DEFAULT 0.00,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_tbl`
--

CREATE TABLE `purchase_order_tbl` (
  `id` bigint(20) NOT NULL,
  `po_id` varchar(100) NOT NULL,
  `supplier_id` varchar(100) NOT NULL,
  `order_date` date NOT NULL,
  `expected_date` date DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `order_details` text DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'open',
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `return_details`
--

CREATE TABLE `return_details` (
  `id` int(11) NOT NULL,
  `return_id` varchar(30) NOT NULL,
  `product_id` bigint(25) NOT NULL,
  `return_qty` float NOT NULL,
  `sold_pur_qty` float NOT NULL,
  `price` float NOT NULL,
  `amount` float NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salary_generat_tbl`
--

CREATE TABLE `salary_generat_tbl` (
  `generat_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `salary_amount` float NOT NULL,
  `salary_month` int(11) NOT NULL,
  `generate_date` date NOT NULL,
  `generate_by` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salary_payment_history`
--

CREATE TABLE `salary_payment_history` (
  `payment_id` int(11) NOT NULL,
  `generate_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `paid_amount` float NOT NULL,
  `payment_note` text NOT NULL,
  `payment_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salary_tbl`
--

CREATE TABLE `salary_tbl` (
  `salary_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `salary_amount` float NOT NULL,
  `salary_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sec_menu_item`
--

CREATE TABLE `sec_menu_item` (
  `menu_id` int(11) NOT NULL,
  `menu_title` varchar(200) DEFAULT NULL,
  `page_url` varchar(250) DEFAULT NULL,
  `module` varchar(200) DEFAULT NULL,
  `parent_menu` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `createby` int(11) NOT NULL,
  `createdate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sec_menu_item`
--

INSERT INTO `sec_menu_item` (`menu_id`, `menu_title`, `page_url`, `module`, `parent_menu`, `status`, `createby`, `createdate`) VALUES
(132, 'Add Menu', 'menu/menu_setting/index', 'Menu', 0, 1, 1, '2020-01-18 00:00:00'),
(133, 'Menu List', 'menu/menu_setting/menu_list', 'Menu', 132, 1, 1, '2020-01-18 00:00:00'),
(134, 'Add Role', 'menu/crole/add_role', 'Menu', 132, 1, 1, '2020-01-18 00:00:00'),
(135, 'Role List', 'menu/crole/role_list', 'Menu', 132, 1, 1, '2020-01-18 00:00:00'),
(136, 'User Assign Role', 'menu/crole/role_assign', 'Menu', 132, 1, 1, '2020-01-18 00:00:00'),
(139, 'Assigned List', 'menu/crole/assigned_role_list', 'Menu', 132, 1, 1, '2020-01-18 00:00:00'),
(140, 'department', 'hrm/department/index', 'hrm', 0, 1, 1, NULL),
(141, 'designation', 'hrm/designation/index', 'hrm', 0, 1, 1, NULL),
(142, 'salary', 'hrm/salary', 'hrm', 0, 1, 1, NULL),
(143, 'salary_setup', 'hrm/salary/salary_setup', 'hrm', 142, 1, 1, NULL),
(144, 'salary_generat_list', 'hrm/salary/salary_generat_list', 'hrm', 142, 1, 1, NULL),
(145, 'attendance', 'hrm/attendance', 'hrm', 0, 1, 1, NULL),
(146, 'attendance_report', 'hrm/attendance/report', 'hrm', 145, 1, 1, NULL),
(147, 'employee', 'hrm/employee/index', 'hrm', 0, 1, 1, NULL),
(148, 'add_employee', 'hrm/employee/add_employee', 'hrm', 147, 1, 1, NULL),
(149, 'manage_employee', 'hrm/employee/manage_employee', 'hrm', 147, 1, 1, NULL),
(150, 'bank', 'bank/Bank/bank_list', 'bank', 0, 1, 1, NULL),
(151, 'bank', 'bank/Bank/bank_list', 'bank', 150, 1, 1, NULL),
(152, 'add_bank', 'bank/Bank/bank_list', 'bank', 150, 1, 1, NULL),
(153, 'bank_ledger', 'bank/Bank/bank_ledger', 'bank', 150, 1, 1, NULL),
(154, 'bank_adjustment', 'bank/Bank/bank_adjustment', 'bank', 150, 1, 1, NULL),
(155, 'item', 'item/item', 'item', 0, 1, 1, NULL),
(156, 'unit', 'item/Unit/unit_form', 'item', 155, 1, 1, NULL),
(157, 'add_unit', 'item/Unit/unit_form', 'item', 155, 1, 1, NULL),
(158, 'category', 'item/Category/category_form', 'item', 155, 1, 1, NULL),
(159, 'add_category', 'item/Category/category_form', 'item', 155, 1, 1, NULL),
(160, 'add_item', 'item/Item/item_form', 'item', 155, 1, 1, NULL),
(161, 'item_list', 'item/Item/item_list', 'item', 155, 1, 1, NULL),
(162, 'purchase', 'purchase/Purchase/', 'purchase', 0, 1, 1, NULL),
(163, 'new_purchase', 'purchase/Purchase/create_purchase', 'purchase', 162, 1, 1, NULL),
(164, 'purchase_list', 'purchase/Purchase/purchase_list', 'purchase', 162, 1, 1, NULL),
(165, 'accounts', 'accounts/index', 'accounts', 0, 1, 1, NULL),
(166, 'payment_or_receive', 'accounts/Account/payment_receive_form', 'accounts', 165, 1, 1, NULL),
(167, 'manage_transaction', 'accounts/Account/manage_transaction', 'accounts', 165, 1, 1, NULL),
(168, 'account_adjustment', 'accounts/Account/account_adjustment', 'accounts', 165, 1, 1, NULL),
(169, 'student', 'student/index', 'student', 0, 1, 1, NULL),
(170, 'student_list', 'student/student_info/index', 'student', 169, 1, 1, NULL),
(171, 'student_ledger', 'student/student_info/studentledger', 'student', 169, 1, 1, NULL),
(172, 'report', 'report/index', 'report', 0, 1, 1, NULL),
(173, 'purchase_report', 'report/report/purchase_report', 'report', 172, 1, 1, NULL),
(174, 'sales_report', 'report/report/sales_report', 'report', 172, 1, 1, NULL),
(175, 'cash_book', 'report/report/cash_book', 'report', 172, 1, 1, NULL),
(176, 'stock', 'stock', 'stock', 0, 1, 1, NULL),
(177, 'stock_report', 'stock/stock/index', 'stock', 176, 1, 1, NULL),
(178, 'stock_report_supplier_wise', 'stock/stock/stock_report_supplier_wise', 'stock', 176, 1, 1, NULL),
(179, 'stock_report_product_wise', 'stock/stock/stock_report_product_wise', 'stock', 176, 1, 1, NULL),
(180, 'supplier', 'supplier', 'supplier', 0, 1, 1, NULL),
(181, 'supplier_list', 'supplier/supplierlist/index', 'supplier', 180, 1, 1, NULL),
(182, 'supplier_ledger', 'supplier/supplierlist/supplierledger', 'supplier', 180, 1, 1, NULL),
(183, 'invoice', 'invoice', 'invoice', 0, 1, 1, NULL),
(184, 'add_invoice', 'invoice/CInvoice/index', 'invoice', 183, 1, 1, NULL),
(185, 'invoice_list', 'invoice/CInvoice/invoice_list', 'invoice', 183, 1, 1, NULL),
(186, 'Role Permission', 'menu/crole/add_role', 'menu', 0, 1, 1, NULL),
(187, 'add_pos_invoice', 'add_pos', 'invoice', 183, 1, 1, NULL),
(188, 'cash_closing', 'closing_form', 'accounts', 165, 1, 1, NULL),
(189, 'closing_list', 'closing_list', 'accounts', 165, 1, 1, NULL),
(190, 'messaging', 'messaging/messages/inbox', 'messaging', 0, 1, 1, '2026-03-02 03:07:30'),
(191, 'inbox', 'messaging/messages/inbox', 'messaging', 0, 1, 1, '2026-03-02 03:07:30'),
(192, 'sent', 'messaging/messages/sent', 'messaging', 0, 1, 1, '2026-03-02 03:07:30'),
(193, 'compose', 'messaging/messages/compose', 'messaging', 0, 1, 1, '2026-03-02 03:07:30'),
(194, 'broadcast', 'messaging/notifications/broadcast', 'messaging', 0, 1, 1, '2026-03-02 03:07:30'),
(195, 'my_documents', 'document/document/index', 'document', 0, 1, 1, '2026-03-02 03:07:30'),
(196, 'all_documents', 'document/document/all_documents', 'document', 0, 1, 1, '2026-03-02 03:07:30'),
(197, 'academic_calendar', 'dashboard/academic_calendar/index', 'dashboard', 0, 1, 1, '2026-03-07 19:18:30'),
(198, 'curriculum', 'dashboard/curriculum/index', 'dashboard', 0, 1, 1, '2026-03-07 19:18:30'),
(199, 'assets', 'assets/assets/index', 'assets', 0, 1, 1, '2026-03-07 19:18:30'),
(200, 'asset_categories', 'assets/assets/categories', 'assets', 0, 1, 1, '2026-03-07 19:18:30'),
(201, 'asset_maintenance', 'assets/assets/all_maintenance', 'assets', 0, 1, 1, '2026-03-07 19:18:30'),
(202, 'staff_appointments', 'hrm/employee/all_appointments', 'hrm', 0, 1, 1, '2026-03-07 19:18:30'),
(203, 'staff_leaves', 'hrm/employee/leaves', 'hrm', 0, 1, 1, '2026-03-07 19:18:30'),
(204, 'staff_terminations', 'hrm/employee/all_terminations', 'hrm', 0, 1, 1, '2026-03-07 19:18:30'),
(205, 'purchase_order', 'purchase/workflow/purchase_order_form', 'purchase', 0, 1, 1, '2026-03-08 04:24:57'),
(206, 'goods_received_note', 'purchase/workflow/grn_form', 'purchase', 0, 1, 1, '2026-03-08 04:24:57'),
(207, 'supplier_due_settlement', 'purchase/workflow/supplier_due_payment_form', 'purchase', 0, 1, 1, '2026-03-08 04:24:57'),
(208, 'purchase_order_list', 'purchase/workflow/purchase_order_list', 'purchase', 0, 1, 1, '2026-03-08 04:24:57'),
(209, 'grn_list', 'purchase/workflow/grn_list', 'purchase', 0, 1, 1, '2026-03-08 04:24:57'),
(210, 'supplier_settlement_history', 'purchase/workflow/supplier_due_payment_list', 'purchase', 0, 1, 1, '2026-03-08 04:24:57');

-- --------------------------------------------------------

--
-- Table structure for table `sec_role_permission`
--

CREATE TABLE `sec_role_permission` (
  `id` bigint(20) NOT NULL,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `can_access` tinyint(1) NOT NULL,
  `can_create` tinyint(1) NOT NULL,
  `can_edit` tinyint(1) NOT NULL,
  `can_delete` tinyint(1) NOT NULL,
  `createby` int(11) NOT NULL,
  `createdate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sec_role_permission`
--

INSERT INTO `sec_role_permission` (`id`, `role_id`, `menu_id`, `can_access`, `can_create`, `can_edit`, `can_delete`, `createby`, `createdate`) VALUES
(169, 3, 165, 1, 1, 1, 1, 2, '2026-03-02 00:00:00'),
(170, 3, 166, 1, 1, 1, 1, 2, '2026-03-02 00:00:00'),
(171, 3, 167, 1, 1, 1, 1, 2, '2026-03-02 00:00:00'),
(172, 3, 168, 1, 1, 1, 1, 2, '2026-03-02 00:00:00'),
(173, 3, 188, 1, 1, 1, 1, 2, '2026-03-02 00:00:00'),
(174, 3, 189, 1, 1, 1, 1, 2, '2026-03-02 00:00:00'),
(175, 3, 150, 1, 1, 1, 1, 2, '2026-03-02 00:00:00'),
(176, 3, 151, 1, 1, 1, 1, 2, '2026-03-02 00:00:00'),
(177, 3, 152, 1, 1, 1, 1, 2, '2026-03-02 00:00:00'),
(178, 3, 153, 1, 1, 1, 1, 2, '2026-03-02 00:00:00'),
(179, 3, 154, 1, 1, 1, 1, 2, '2026-03-02 00:00:00'),
(180, 3, 195, 1, 1, 1, 0, 2, '2026-03-02 00:00:00'),
(181, 3, 196, 0, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(182, 3, 140, 0, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(183, 3, 141, 0, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(184, 3, 142, 0, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(185, 3, 143, 0, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(186, 3, 144, 0, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(187, 3, 145, 0, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(188, 3, 146, 0, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(189, 3, 147, 0, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(190, 3, 148, 0, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(191, 3, 149, 0, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(192, 3, 183, 1, 1, 0, 0, 2, '2026-03-02 00:00:00'),
(193, 3, 184, 1, 1, 0, 0, 2, '2026-03-02 00:00:00'),
(194, 3, 185, 1, 1, 0, 0, 2, '2026-03-02 00:00:00'),
(195, 3, 187, 1, 1, 0, 0, 2, '2026-03-02 00:00:00'),
(196, 3, 155, 1, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(197, 3, 156, 1, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(198, 3, 157, 1, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(199, 3, 158, 1, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(200, 3, 159, 1, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(201, 3, 160, 1, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(202, 3, 161, 1, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(203, 3, 132, 0, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(204, 3, 133, 0, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(205, 3, 134, 0, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(206, 3, 135, 0, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(207, 3, 136, 0, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(208, 3, 139, 0, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(209, 3, 186, 0, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(210, 3, 190, 1, 1, 1, 0, 2, '2026-03-02 00:00:00'),
(211, 3, 191, 1, 1, 1, 0, 2, '2026-03-02 00:00:00'),
(212, 3, 192, 1, 1, 1, 0, 2, '2026-03-02 00:00:00'),
(213, 3, 193, 1, 1, 1, 0, 2, '2026-03-02 00:00:00'),
(214, 3, 194, 0, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(215, 3, 162, 1, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(216, 3, 163, 1, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(217, 3, 164, 1, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(218, 3, 172, 0, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(219, 3, 173, 0, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(220, 3, 174, 1, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(221, 3, 175, 1, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(222, 3, 176, 1, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(223, 3, 177, 1, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(224, 3, 178, 1, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(225, 3, 179, 1, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(226, 3, 169, 1, 1, 1, 1, 2, '2026-03-02 00:00:00'),
(227, 3, 170, 1, 1, 1, 1, 2, '2026-03-02 00:00:00'),
(228, 3, 171, 1, 1, 1, 1, 2, '2026-03-02 00:00:00'),
(229, 3, 180, 0, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(230, 3, 181, 0, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(231, 3, 182, 0, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(232, 1, 165, 1, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(233, 1, 166, 1, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(234, 1, 167, 1, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(235, 1, 168, 1, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(236, 1, 188, 1, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(237, 1, 189, 1, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(238, 1, 150, 1, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(239, 1, 151, 1, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(240, 1, 152, 1, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(241, 1, 153, 1, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(242, 1, 154, 1, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(243, 1, 195, 1, 1, 1, 0, 2, '2026-03-02 00:00:00'),
(244, 1, 196, 0, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(245, 1, 140, 0, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(246, 1, 141, 0, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(247, 1, 142, 0, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(248, 1, 143, 0, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(249, 1, 144, 0, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(250, 1, 145, 0, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(251, 1, 146, 0, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(252, 1, 147, 0, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(253, 1, 148, 0, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(254, 1, 149, 0, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(255, 1, 183, 1, 1, 1, 1, 2, '2026-03-02 00:00:00'),
(256, 1, 184, 1, 1, 1, 1, 2, '2026-03-02 00:00:00'),
(257, 1, 185, 1, 1, 1, 1, 2, '2026-03-02 00:00:00'),
(258, 1, 187, 1, 1, 1, 1, 2, '2026-03-02 00:00:00'),
(259, 1, 155, 1, 1, 1, 1, 2, '2026-03-02 00:00:00'),
(260, 1, 156, 1, 1, 1, 1, 2, '2026-03-02 00:00:00'),
(261, 1, 157, 1, 1, 1, 1, 2, '2026-03-02 00:00:00'),
(262, 1, 158, 1, 1, 1, 1, 2, '2026-03-02 00:00:00'),
(263, 1, 159, 1, 1, 1, 1, 2, '2026-03-02 00:00:00'),
(264, 1, 160, 1, 1, 1, 1, 2, '2026-03-02 00:00:00'),
(265, 1, 161, 1, 1, 1, 1, 2, '2026-03-02 00:00:00'),
(266, 1, 132, 0, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(267, 1, 133, 0, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(268, 1, 134, 0, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(269, 1, 135, 0, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(270, 1, 136, 0, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(271, 1, 139, 0, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(272, 1, 186, 0, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(273, 1, 190, 1, 1, 1, 0, 2, '2026-03-02 00:00:00'),
(274, 1, 191, 1, 1, 1, 0, 2, '2026-03-02 00:00:00'),
(275, 1, 192, 1, 1, 1, 0, 2, '2026-03-02 00:00:00'),
(276, 1, 193, 1, 1, 1, 0, 2, '2026-03-02 00:00:00'),
(277, 1, 194, 0, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(278, 1, 162, 1, 1, 1, 1, 2, '2026-03-02 00:00:00'),
(279, 1, 163, 1, 1, 1, 1, 2, '2026-03-02 00:00:00'),
(280, 1, 164, 1, 1, 1, 1, 2, '2026-03-02 00:00:00'),
(281, 1, 172, 0, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(282, 1, 173, 0, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(283, 1, 174, 0, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(284, 1, 175, 0, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(285, 1, 176, 1, 1, 1, 1, 2, '2026-03-02 00:00:00'),
(286, 1, 177, 1, 1, 1, 1, 2, '2026-03-02 00:00:00'),
(287, 1, 178, 1, 1, 1, 1, 2, '2026-03-02 00:00:00'),
(288, 1, 179, 1, 1, 1, 1, 2, '2026-03-02 00:00:00'),
(289, 1, 169, 1, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(290, 1, 170, 1, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(291, 1, 171, 1, 0, 0, 0, 2, '2026-03-02 00:00:00'),
(292, 1, 180, 1, 1, 1, 1, 2, '2026-03-02 00:00:00'),
(293, 1, 181, 1, 1, 1, 1, 2, '2026-03-02 00:00:00'),
(294, 1, 182, 1, 1, 1, 1, 2, '2026-03-02 00:00:00'),
(295, 2, 165, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(296, 2, 166, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(297, 2, 167, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(298, 2, 168, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(299, 2, 188, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(300, 2, 189, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(301, 2, 150, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(302, 2, 151, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(303, 2, 152, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(304, 2, 153, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(305, 2, 154, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(306, 2, 195, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(307, 2, 196, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(308, 2, 140, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(309, 2, 141, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(310, 2, 142, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(311, 2, 143, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(312, 2, 144, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(313, 2, 145, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(314, 2, 146, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(315, 2, 147, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(316, 2, 148, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(317, 2, 149, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(318, 2, 183, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(319, 2, 184, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(320, 2, 185, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(321, 2, 187, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(322, 2, 155, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(323, 2, 156, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(324, 2, 157, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(325, 2, 158, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(326, 2, 159, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(327, 2, 160, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(328, 2, 161, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(329, 2, 132, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(330, 2, 133, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(331, 2, 134, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(332, 2, 135, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(333, 2, 136, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(334, 2, 139, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(335, 2, 186, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(336, 2, 190, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(337, 2, 191, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(338, 2, 192, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(339, 2, 193, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(340, 2, 194, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(341, 2, 162, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(342, 2, 163, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(343, 2, 164, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(344, 2, 172, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(345, 2, 173, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(346, 2, 174, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(347, 2, 175, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(348, 2, 176, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(349, 2, 177, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(350, 2, 178, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(351, 2, 179, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(352, 2, 169, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(353, 2, 170, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(354, 2, 171, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(355, 2, 180, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(356, 2, 181, 1, 1, 1, 1, 2, '2026-03-04 00:00:00'),
(357, 2, 182, 1, 1, 1, 1, 2, '2026-03-04 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `sec_role_tbl`
--

CREATE TABLE `sec_role_tbl` (
  `role_id` int(11) NOT NULL,
  `role_name` text NOT NULL,
  `role_description` text NOT NULL,
  `create_by` int(11) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `role_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sec_role_tbl`
--

INSERT INTO `sec_role_tbl` (`role_id`, `role_name`, `role_description`, `create_by`, `date_time`, `role_status`) VALUES
(1, 'Stock Controller', 'Stock Controller: Making sure physical stock corresponds with the system by monitoring daily stock levels and performing routine cycle counts.\r\nManaging connections with suppliers and negotiating for new inventory are the responsibilities of the procurement liaison.\r\nA quality auditor checks incoming shipments to make sure the products are of the right quality and quantity.\r\nDemand forecaster: forecasting future inventory requirements and averting shortages by using sales data. \r\nobject', 1, '0000-00-00 00:00:00', 1),
(2, 'Admins', 'Systems Administrator                  ', 1, '0000-00-00 00:00:00', 1),
(3, 'Registrar', 'Sales Lead, Order Fulfillment Specialist, Billing Officer            ', 1, '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sec_user_access_tbl`
--

CREATE TABLE `sec_user_access_tbl` (
  `role_acc_id` int(11) NOT NULL,
  `fk_role_id` int(11) NOT NULL,
  `fk_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sec_user_access_tbl`
--

INSERT INTO `sec_user_access_tbl` (`role_acc_id`, `fk_role_id`, `fk_user_id`) VALUES
(2, 1, 8),
(3, 3, 5),
(5, 3, 10),
(6, 2, 11),
(7, 2, 3),
(8, 2, 12);

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `logo` varchar(200) DEFAULT NULL,
  `favicon` varchar(200) DEFAULT NULL,
  `language` varchar(100) DEFAULT NULL,
  `site_align` varchar(50) DEFAULT NULL,
  `currency` varchar(5) NOT NULL,
  `footer_text` varchar(255) DEFAULT NULL,
  `app_version` varchar(30) DEFAULT NULL,
  `developer_name` varchar(150) DEFAULT NULL,
  `developer_whatsapp` varchar(30) DEFAULT NULL,
  `timezone` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `title`, `address`, `email`, `phone`, `logo`, `favicon`, `language`, `site_align`, `currency`, `footer_text`, `app_version`, `developer_name`, `developer_whatsapp`, `timezone`) VALUES
(2, 'NICEGENE TECHNOLOGIES', 'Lagos Town', 'NICEGENETECHNOLOGIES@GMAIL.COM', '08060704412', 'admin_assets/img/icons/2026-02-20/aac111826d0398c372a621bf7edf4de1.png', 'admin_assets/img/icons/2026-02-20/8113ebd0d1df0268d17762d4a9665910.png', 'english', NULL, '5', 'Copywright© Nicegene Tech. 2026', '4.0', 'Engr. Eugene', '+2348060704412', 'Africa/Lagos');

-- --------------------------------------------------------

--
-- Table structure for table `staff_appointments`
--

CREATE TABLE `staff_appointments` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `appointment_title` varchar(255) NOT NULL,
  `appointment_type` enum('promotion','appointment','transfer','redeployment','acting') NOT NULL DEFAULT 'appointment',
  `description` text DEFAULT NULL,
  `effective_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `letter_file` varchar(500) DEFAULT NULL,
  `appointed_by` int(11) NOT NULL,
  `previous_designation_id` int(11) DEFAULT NULL,
  `new_designation_id` int(11) DEFAULT NULL,
  `previous_department_id` int(11) DEFAULT NULL,
  `new_department_id` int(11) DEFAULT NULL,
  `status` enum('active','superseded','revoked') NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff_documents`
--

CREATE TABLE `staff_documents` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `document_type` enum('offer_letter','nin_scan','birth_certificate','guarantor_form','medical_report','id_card','other') NOT NULL DEFAULT 'other',
  `title` varchar(255) NOT NULL,
  `file_path` varchar(500) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `uploaded_by` int(11) NOT NULL,
  `expires_at` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff_leaves`
--

CREATE TABLE `staff_leaves` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `leave_type` enum('annual','sick','maternity','paternity','study','compassionate','unpaid') NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `days_count` int(11) NOT NULL DEFAULT 0,
  `reason` text DEFAULT NULL,
  `status` enum('pending','approved','rejected','cancelled') NOT NULL DEFAULT 'pending',
  `approved_by` int(11) DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `rejection_reason` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff_qualifications`
--

CREATE TABLE `staff_qualifications` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `qualification_type` enum('degree','diploma','certificate','professional','other') NOT NULL,
  `qualification_name` varchar(255) NOT NULL,
  `institution` varchar(255) NOT NULL,
  `year_obtained` year(4) DEFAULT NULL,
  `grade` varchar(50) DEFAULT NULL,
  `document_file` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff_terminations`
--

CREATE TABLE `staff_terminations` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `termination_type` enum('dismissal','resignation','retirement','contract_end','redundancy','misconduct') NOT NULL,
  `reason` text NOT NULL,
  `effective_date` date NOT NULL,
  `notice_date` date DEFAULT NULL,
  `letter_file` varchar(500) DEFAULT NULL,
  `final_settlement` decimal(12,2) DEFAULT 0.00,
  `terminated_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_tbl`
--

CREATE TABLE `student_tbl` (
  `id` int(11) NOT NULL,
  `customerid` varchar(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `created_by` varchar(20) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` varchar(20) DEFAULT NULL,
  `updated_date` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `status` int(11) NOT NULL DEFAULT 0,
  `class` varchar(50) DEFAULT NULL,
  `school_id_number` varchar(100) DEFAULT NULL,
  `parent_phone` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `student_tbl`
--

INSERT INTO `student_tbl` (`id`, `customerid`, `name`, `mobile`, `email`, `address`, `created_by`, `created_date`, `updated_by`, `updated_date`, `status`, `class`, `school_id_number`, `parent_phone`) VALUES
(1, 'Cus_001', 'John Doe', '08012345678', 'john.doe@student.com', '123 Main St', NULL, '2026-02-20 02:40:25', NULL, '0000-00-00 00:00:00', 1, NULL, NULL, NULL),
(2, 'Cus_002', 'Jane Smith', '08023456789', 'jane.smith@student.com', '456 Oak Ave', NULL, '2026-02-20 02:40:25', NULL, '0000-00-00 00:00:00', 1, NULL, NULL, NULL),
(3, 'Cus_003', 'Bob Wilson', '08034567890', 'bob.wilson@student.com', '789 Pine Rd', NULL, '2026-02-20 02:40:25', NULL, '0000-00-00 00:00:00', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student_transactions`
--

CREATE TABLE `student_transactions` (
  `id` int(11) NOT NULL,
  `student_id` varchar(20) NOT NULL,
  `item_id` varchar(20) NOT NULL,
  `product_id` varchar(20) DEFAULT NULL,
  `department` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `size` varchar(10) DEFAULT NULL,
  `unit_price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total_price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `transaction_date` date NOT NULL,
  `notes` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `invoice_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_due_payment_details_tbl`
--

CREATE TABLE `supplier_due_payment_details_tbl` (
  `id` bigint(20) NOT NULL,
  `payment_detail_id` varchar(100) NOT NULL,
  `payment_id` varchar(100) NOT NULL,
  `purchase_id` varchar(100) NOT NULL,
  `paid_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_due_payment_tbl`
--

CREATE TABLE `supplier_due_payment_tbl` (
  `id` bigint(20) NOT NULL,
  `payment_id` varchar(100) NOT NULL,
  `supplier_id` varchar(100) NOT NULL,
  `payment_date` date NOT NULL,
  `payment_type` tinyint(4) NOT NULL,
  `bank_id` varchar(15) DEFAULT NULL,
  `amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `money_source` varchar(150) DEFAULT NULL,
  `transferred_by` varchar(150) DEFAULT NULL,
  `payment_reference` varchar(150) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_tbl`
--

CREATE TABLE `supplier_tbl` (
  `id` int(11) NOT NULL,
  `supplier_id` varchar(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_by` varchar(20) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `update_by` varchar(20) DEFAULT NULL,
  `updated_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `supplier_tbl`
--

INSERT INTO `supplier_tbl` (`id`, `supplier_id`, `name`, `mobile`, `email`, `address`, `status`, `created_by`, `created_date`, `update_by`, `updated_date`) VALUES
(2, 'supp_002', 'NICEGENE FASHIONS LTD', '08102514461', 'nicegeneorji@gmail.com', 'Yaba Nigeria', 1, 'Finbarr\'s  Academy', '2026-02-21 00:38:17', NULL, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_currency`
--

CREATE TABLE `tbl_currency` (
  `currencyid` int(11) NOT NULL,
  `currencyname` varchar(100) NOT NULL,
  `curr_icon` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `curr_rate` decimal(10,2) NOT NULL DEFAULT 0.00,
  `position` int(11) NOT NULL DEFAULT 0 COMMENT '0=left,1=right'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_currency`
--

INSERT INTO `tbl_currency` (`currencyid`, `currencyname`, `curr_icon`, `curr_rate`, `position`) VALUES
(4, 'Dollar', '$', 1.00, 1),
(5, 'Naira', '₦', 0.00, 1);

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `id` bigint(20) NOT NULL,
  `transaction_id` varchar(30) NOT NULL,
  `date_of_transaction` varchar(30) NOT NULL,
  `transaction_type` varchar(30) NOT NULL,
  `transaction_category` varchar(30) NOT NULL,
  `transaction_mode` varchar(25) NOT NULL,
  `received_amount` float NOT NULL,
  `pay_amount` float DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `relation_id` varchar(30) NOT NULL,
  `from_invoice_data` varchar(20) DEFAULT NULL,
  `cheque_no` varchar(255) DEFAULT NULL,
  `cheque_issue_date` varchar(20) DEFAULT NULL,
  `cheque_bank_name` varchar(255) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` varchar(50) DEFAULT NULL,
  `status` int(2) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `firstname` varchar(150) DEFAULT NULL,
  `lastname` varchar(150) DEFAULT NULL,
  `about` text DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(32) NOT NULL,
  `password_reset_token` varchar(55) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_logout` datetime DEFAULT NULL,
  `ip_address` varchar(14) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `is_admin` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=super_admin',
  `password_change_required` tinyint(1) DEFAULT 0,
  `role` varchar(50) DEFAULT 'employee',
  `fullname` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `firstname`, `lastname`, `about`, `email`, `password`, `password_reset_token`, `image`, `last_login`, `last_logout`, `ip_address`, `status`, `is_admin`, `password_change_required`, `role`, `fullname`) VALUES
(2, 'Finbarr\'s ', 'Academy', 'At the Heart of our School, the Gift of a Child. Welcome to St Finbarr’s Catholic Primary School.', 'everjoe514myown@gmail.com', '70daba9a33fb46e821a872e89eb6a6b6', NULL, './admin_assets/img/user/schoolHeader2.png', '2026-03-07 19:08:50', '2026-03-04 12:30:29', '::1', 1, 1, 0, 'employee', 'Finbarr\'s  Academy'),
(3, 'Admin', 'User', NULL, 'admin@finbarrschool.com', '0192023a7bbd73250516f069df18b500', NULL, NULL, NULL, NULL, NULL, 1, 2, 0, 'admin', 'Admin User'),
(4, 'John', 'Clerk', NULL, 'clerk@finbarrschool.com', 'cca8dd8babd4c9996c8dfee788a49d18', NULL, NULL, '2026-02-21 03:28:05', '2026-02-21 01:29:16', '::1', 1, 0, 0, 'clerk', 'John Clerk'),
(5, 'Jane', 'Nurse', NULL, 'nurse@finbarrschool.com', 'cca8dd8babd4c9996c8dfee788a49d18', NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 'nurse', 'Jane Nurse'),
(6, 'John', 'Clerk', NULL, 'clerk@finbarrschool.com', 'cca8dd8babd4c9996c8dfee788a49d18', NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 'clerk', 'John Clerk'),
(7, 'Jane', 'Nurse', NULL, 'nurse@finbarrschool.com', 'cca8dd8babd4c9996c8dfee788a49d18', NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 'nurse', 'Jane Nurse'),
(8, 'John', 'Clerk', NULL, 'clerk@finbarrschool.com', 'cca8dd8babd4c9996c8dfee788a49d18', NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 'clerk', 'John Clerk'),
(9, 'Jane', 'Nurse', NULL, 'nurse@finbarrschool.com', 'cca8dd8babd4c9996c8dfee788a49d18', NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 'nurse', 'Jane Nurse'),
(10, 'Smart', 'kid', 'You are a keeper', 'smartechkid@gmail.com', '7dd4f2e66b1e262c195aa9ee78f33c4a', NULL, '', '2026-03-02 04:14:34', '2026-03-02 05:08:47', '::1', 1, 2, 0, 'employee', NULL),
(11, 'Eugene', 'Orji', '', 'eugeneoorji@gmail.com', 'e5e14fe6e7fdf90afa7484093b9a4d8b', 'a3e5be08e19c708a524c817445bb4caea50b5c2a2e91c376', '', NULL, NULL, NULL, 1, 2, 1, 'employee', NULL),
(12, 'eugene', 'orji', '', 'nicegeneorji@gmail.com', 'f59915b50cef666d59c51c607d263276', '0b6d40655587c968e0804d4afd1d41aede0a4afe4d86f7c9', '', NULL, NULL, NULL, 1, 2, 1, 'employee', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academic_calendar`
--
ALTER TABLE `academic_calendar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cal_dates` (`start_date`,`end_date`),
  ADD KEY `idx_cal_type` (`event_type`);

--
-- Indexes for table `academic_classes`
--
ALTER TABLE `academic_classes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_class_name` (`class_name`);

--
-- Indexes for table `academic_subjects`
--
ALTER TABLE `academic_subjects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_subject_name_level` (`subject_name`,`class_level`);

--
-- Indexes for table `admin_action_audit`
--
ALTER TABLE `admin_action_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_audit_module` (`module_name`),
  ADD KEY `idx_audit_action` (`action_type`),
  ADD KEY `idx_audit_actor` (`actor_user_id`),
  ADD KEY `idx_audit_created` (`created_at`);

--
-- Indexes for table `app_settings`
--
ALTER TABLE `app_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `setting_key` (`setting_key`);

--
-- Indexes for table `assets_tbl`
--
ALTER TABLE `assets_tbl`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_asset_tag_number` (`tag_number`),
  ADD KEY `idx_asset_department` (`department_id`),
  ADD KEY `idx_asset_employee` (`assigned_to_employee_id`),
  ADD KEY `idx_asset_category` (`category_id`);

--
-- Indexes for table `asset_categories`
--
ALTER TABLE `asset_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_category_name` (`category_name`);

--
-- Indexes for table `asset_depreciation_log`
--
ALTER TABLE `asset_depreciation_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_depr_asset` (`asset_id`),
  ADD KEY `idx_depr_date` (`calculated_on`);

--
-- Indexes for table `asset_maintenance_log`
--
ALTER TABLE `asset_maintenance_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_maint_asset` (`asset_id`),
  ADD KEY `idx_maint_date` (`maintenance_date`);

--
-- Indexes for table `asset_transfer_log`
--
ALTER TABLE `asset_transfer_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_transfer_asset` (`asset_id`),
  ADD KEY `idx_transfer_date` (`transfer_date`);

--
-- Indexes for table `attendance_tbl`
--
ALTER TABLE `attendance_tbl`
  ADD PRIMARY KEY (`attandence_id`);

--
-- Indexes for table `audit_log`
--
ALTER TABLE `audit_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `module` (`module`),
  ADD KEY `created_at` (`created_at`);

--
-- Indexes for table `bank_tbl`
--
ALTER TABLE `bank_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_tbl`
--
ALTER TABLE `category_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country_tbl`
--
ALTER TABLE `country_tbl`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `curriculum_tbl`
--
ALTER TABLE `curriculum_tbl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_curr_class` (`class_id`),
  ADD KEY `idx_curr_subject` (`subject_id`),
  ADD KEY `idx_curr_term` (`term`,`academic_year`);

--
-- Indexes for table `daily_closing`
--
ALTER TABLE `daily_closing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department_tbl`
--
ALTER TABLE `department_tbl`
  ADD PRIMARY KEY (`department_id`);

--
-- Indexes for table `designation_tbl`
--
ALTER TABLE `designation_tbl`
  ADD PRIMARY KEY (`designation_id`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_documents_target_user` (`target_user_id`),
  ADD KEY `idx_documents_target_type` (`target_type`),
  ADD KEY `idx_documents_department` (`department_id`);

--
-- Indexes for table `employee_tbl`
--
ALTER TABLE `employee_tbl`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `grn_details_tbl`
--
ALTER TABLE `grn_details_tbl`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_grn_detail_id` (`grn_detail_id`),
  ADD KEY `idx_grn_details_grn_id` (`grn_id`),
  ADD KEY `idx_grn_details_product` (`product_id`);

--
-- Indexes for table `grn_tbl`
--
ALTER TABLE `grn_tbl`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_grn_id` (`grn_id`),
  ADD KEY `idx_grn_po` (`po_id`),
  ADD KEY `idx_grn_status` (`status`);

--
-- Indexes for table `invoice_details`
--
ALTER TABLE `invoice_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_tbl`
--
ALTER TABLE `invoice_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ledger_tbl`
--
ALTER TABLE `ledger_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `location_tbl`
--
ALTER TABLE `location_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `recipient_id` (`recipient_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `is_read` (`is_read`),
  ADD KEY `sender_id` (`sender_id`);

--
-- Indexes for table `picture_tbl`
--
ALTER TABLE `picture_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_purchase`
--
ALTER TABLE `product_purchase`
  ADD PRIMARY KEY (`purchase_id`);

--
-- Indexes for table `product_purchase_details`
--
ALTER TABLE `product_purchase_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_return`
--
ALTER TABLE `product_return`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_tbl`
--
ALTER TABLE `product_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_unit`
--
ALTER TABLE `product_unit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_batch_tbl`
--
ALTER TABLE `purchase_batch_tbl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_purchase_batch_purchase` (`purchase_id`),
  ADD KEY `idx_purchase_batch_product` (`product_id`),
  ADD KEY `idx_purchase_batch_expiry` (`expiry_date`);

--
-- Indexes for table `purchase_order_details_tbl`
--
ALTER TABLE `purchase_order_details_tbl`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_po_detail_id` (`po_detail_id`),
  ADD KEY `idx_po_details_po_id` (`po_id`),
  ADD KEY `idx_po_details_product` (`product_id`);

--
-- Indexes for table `purchase_order_tbl`
--
ALTER TABLE `purchase_order_tbl`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_po_id` (`po_id`),
  ADD KEY `idx_po_supplier` (`supplier_id`),
  ADD KEY `idx_po_status` (`status`);

--
-- Indexes for table `return_details`
--
ALTER TABLE `return_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salary_generat_tbl`
--
ALTER TABLE `salary_generat_tbl`
  ADD PRIMARY KEY (`generat_id`);

--
-- Indexes for table `salary_payment_history`
--
ALTER TABLE `salary_payment_history`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `salary_tbl`
--
ALTER TABLE `salary_tbl`
  ADD PRIMARY KEY (`salary_id`);

--
-- Indexes for table `sec_menu_item`
--
ALTER TABLE `sec_menu_item`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `sec_role_permission`
--
ALTER TABLE `sec_role_permission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sec_role_tbl`
--
ALTER TABLE `sec_role_tbl`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `sec_user_access_tbl`
--
ALTER TABLE `sec_user_access_tbl`
  ADD PRIMARY KEY (`role_acc_id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_appointments`
--
ALTER TABLE `staff_appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_appt_employee` (`employee_id`),
  ADD KEY `idx_appt_date` (`effective_date`);

--
-- Indexes for table `staff_documents`
--
ALTER TABLE `staff_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_sdoc_employee` (`employee_id`);

--
-- Indexes for table `staff_leaves`
--
ALTER TABLE `staff_leaves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_leave_employee` (`employee_id`),
  ADD KEY `idx_leave_dates` (`start_date`,`end_date`),
  ADD KEY `idx_leave_status` (`status`);

--
-- Indexes for table `staff_qualifications`
--
ALTER TABLE `staff_qualifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_qual_employee` (`employee_id`);

--
-- Indexes for table `staff_terminations`
--
ALTER TABLE `staff_terminations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_term_employee` (`employee_id`),
  ADD KEY `idx_term_date` (`effective_date`);

--
-- Indexes for table `student_tbl`
--
ALTER TABLE `student_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_transactions`
--
ALTER TABLE `student_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `department` (`department`),
  ADD KEY `transaction_date` (`transaction_date`);

--
-- Indexes for table `supplier_due_payment_details_tbl`
--
ALTER TABLE `supplier_due_payment_details_tbl`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_supplier_due_payment_detail` (`payment_detail_id`),
  ADD KEY `idx_supplier_due_payment_payment` (`payment_id`),
  ADD KEY `idx_supplier_due_payment_purchase` (`purchase_id`);

--
-- Indexes for table `supplier_due_payment_tbl`
--
ALTER TABLE `supplier_due_payment_tbl`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_supplier_due_payment_id` (`payment_id`),
  ADD KEY `idx_supplier_due_payment_supplier` (`supplier_id`);

--
-- Indexes for table `supplier_tbl`
--
ALTER TABLE `supplier_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_currency`
--
ALTER TABLE `tbl_currency`
  ADD PRIMARY KEY (`currencyid`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `academic_calendar`
--
ALTER TABLE `academic_calendar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `academic_classes`
--
ALTER TABLE `academic_classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `academic_subjects`
--
ALTER TABLE `academic_subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `admin_action_audit`
--
ALTER TABLE `admin_action_audit`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_settings`
--
ALTER TABLE `app_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `assets_tbl`
--
ALTER TABLE `assets_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `asset_categories`
--
ALTER TABLE `asset_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `asset_depreciation_log`
--
ALTER TABLE `asset_depreciation_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `asset_maintenance_log`
--
ALTER TABLE `asset_maintenance_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `asset_transfer_log`
--
ALTER TABLE `asset_transfer_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendance_tbl`
--
ALTER TABLE `attendance_tbl`
  MODIFY `attandence_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `audit_log`
--
ALTER TABLE `audit_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `bank_tbl`
--
ALTER TABLE `bank_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category_tbl`
--
ALTER TABLE `category_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `country_tbl`
--
ALTER TABLE `country_tbl`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT for table `curriculum_tbl`
--
ALTER TABLE `curriculum_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `daily_closing`
--
ALTER TABLE `daily_closing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `department_tbl`
--
ALTER TABLE `department_tbl`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `designation_tbl`
--
ALTER TABLE `designation_tbl`
  MODIFY `designation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employee_tbl`
--
ALTER TABLE `employee_tbl`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `grn_details_tbl`
--
ALTER TABLE `grn_details_tbl`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `grn_tbl`
--
ALTER TABLE `grn_tbl`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_details`
--
ALTER TABLE `invoice_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_tbl`
--
ALTER TABLE `invoice_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10001;

--
-- AUTO_INCREMENT for table `ledger_tbl`
--
ALTER TABLE `ledger_tbl`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `location_tbl`
--
ALTER TABLE `location_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `picture_tbl`
--
ALTER TABLE `picture_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_purchase_details`
--
ALTER TABLE `product_purchase_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_return`
--
ALTER TABLE `product_return`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_tbl`
--
ALTER TABLE `product_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_unit`
--
ALTER TABLE `product_unit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `purchase_batch_tbl`
--
ALTER TABLE `purchase_batch_tbl`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_order_details_tbl`
--
ALTER TABLE `purchase_order_details_tbl`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_order_tbl`
--
ALTER TABLE `purchase_order_tbl`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `return_details`
--
ALTER TABLE `return_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salary_generat_tbl`
--
ALTER TABLE `salary_generat_tbl`
  MODIFY `generat_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salary_payment_history`
--
ALTER TABLE `salary_payment_history`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salary_tbl`
--
ALTER TABLE `salary_tbl`
  MODIFY `salary_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sec_menu_item`
--
ALTER TABLE `sec_menu_item`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=211;

--
-- AUTO_INCREMENT for table `sec_role_permission`
--
ALTER TABLE `sec_role_permission`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=358;

--
-- AUTO_INCREMENT for table `sec_role_tbl`
--
ALTER TABLE `sec_role_tbl`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sec_user_access_tbl`
--
ALTER TABLE `sec_user_access_tbl`
  MODIFY `role_acc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `staff_appointments`
--
ALTER TABLE `staff_appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff_documents`
--
ALTER TABLE `staff_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff_leaves`
--
ALTER TABLE `staff_leaves`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff_qualifications`
--
ALTER TABLE `staff_qualifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff_terminations`
--
ALTER TABLE `staff_terminations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_tbl`
--
ALTER TABLE `student_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `student_transactions`
--
ALTER TABLE `student_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supplier_due_payment_details_tbl`
--
ALTER TABLE `supplier_due_payment_details_tbl`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supplier_due_payment_tbl`
--
ALTER TABLE `supplier_due_payment_tbl`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supplier_tbl`
--
ALTER TABLE `supplier_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_currency`
--
ALTER TABLE `tbl_currency`
  MODIFY `currencyid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
