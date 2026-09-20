-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 20, 2026 at 02:21 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.4.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ormawa_platform`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `action` varchar(50) NOT NULL,
  `entity` varchar(80) NOT NULL,
  `description` text NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (`id`, `organization_id`, `user_id`, `action`, `entity`, `description`, `ip_address`, `user_agent`, `created_at`) VALUES
(1, 1, 1, 'login', 'auth', 'Login user Administrator', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/153.0.0.0 Safari/537.36', '2026-09-19 21:02:43'),
(2, 1, 1, 'login', 'auth', 'Login user Administrator', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/153.0.0.0 Safari/537.36', '2026-09-19 21:02:55'),
(3, 1, 1, 'login', 'auth', 'Login user Administrator', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/153.0.0.0 Safari/537.36', '2026-09-19 21:03:35'),
(4, 1, 1, 'login', 'auth', 'Login user Administrator', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-20 04:31:51'),
(5, 1, 1, 'login', 'auth', 'Login user Administrator', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/153.0.0.0 Safari/537.36', '2026-09-20 04:44:13'),
(6, 1, 1, 'login', 'auth', 'Login user Administrator', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/153.0.0.0 Safari/537.36', '2026-09-20 04:44:40'),
(7, 1, 1, 'login', 'auth', 'Login user Administrator', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/153.0.0.0 Safari/537.36', '2026-09-20 04:49:56'),
(8, 1, 1, 'login', 'auth', 'Login user Administrator', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36', '2026-09-20 08:48:01');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(220) NOT NULL,
  `slug` varchar(180) NOT NULL,
  `description` longtext DEFAULT NULL,
  `event_date` date NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `poster` varchar(255) DEFAULT NULL,
  `poster_size` enum('Small','Medium','Large','Custom') NOT NULL DEFAULT 'Medium',
  `status` enum('draft','published','cancelled') NOT NULL DEFAULT 'draft',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faculties`
--

CREATE TABLE `faculties` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(180) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faculties`
--

INSERT INTO `faculties` (`id`, `code`, `name`, `sort_order`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'FK', 'Fakultas', 1, 1, '2026-09-19 13:46:54', '2026-09-19 13:46:54');

-- --------------------------------------------------------

--
-- Table structure for table `gallery_albums`
--

CREATE TABLE `gallery_albums` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(220) NOT NULL,
  `slug` varchar(180) NOT NULL,
  `description` longtext DEFAULT NULL,
  `event_date` date DEFAULT NULL,
  `category` varchar(120) DEFAULT NULL,
  `source_type` enum('local','google_drive','remote_url') NOT NULL DEFAULT 'local',
  `cover_image` varchar(255) DEFAULT NULL,
  `drive_folder_id` varchar(255) DEFAULT NULL,
  `drive_folder_name` varchar(255) DEFAULT NULL,
  `last_synced_at` datetime DEFAULT NULL,
  `sync_status` enum('idle','syncing','synced','failed') NOT NULL DEFAULT 'idle',
  `sync_error` text DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gallery_items`
--

CREATE TABLE `gallery_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `album_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(220) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `file_path` varchar(255) NOT NULL,
  `mime_type` varchar(100) NOT NULL,
  `file_size` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `alt_text` varchar(220) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `source_type` enum('local','google_drive','remote_url') NOT NULL DEFAULT 'local',
  `drive_file_id` varchar(255) DEFAULT NULL,
  `drive_url` text DEFAULT NULL,
  `remote_url` varchar(500) DEFAULT NULL,
  `thumbnail_url` varchar(500) DEFAULT NULL,
  `sync_status` enum('active','removed','error') NOT NULL DEFAULT 'active',
  `last_synced_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `home_sections`
--

CREATE TABLE `home_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` bigint(20) UNSIGNED NOT NULL,
  `section_key` varchar(80) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 1,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `legacy_structure_mappings`
--

CREATE TABLE `legacy_structure_mappings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` bigint(20) UNSIGNED NOT NULL,
  `legacy_position_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED DEFAULT NULL,
  `group_id` bigint(20) UNSIGNED DEFAULT NULL,
  `position_id` bigint(20) UNSIGNED DEFAULT NULL,
  `person_id` bigint(20) UNSIGNED DEFAULT NULL,
  `assignment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('migrated','skipped','ambiguous') NOT NULL DEFAULT 'migrated',
  `notes` text DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `letters`
--

CREATE TABLE `letters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('incoming','outgoing') NOT NULL DEFAULT 'incoming',
  `letter_number` varchar(120) NOT NULL,
  `title` varchar(255) NOT NULL,
  `sender` varchar(180) NOT NULL,
  `recipient` varchar(180) NOT NULL,
  `letter_date` date NOT NULL,
  `received_or_sent_date` date DEFAULT NULL,
  `category` varchar(100) NOT NULL DEFAULT 'Umum',
  `file_path` varchar(255) DEFAULT NULL,
  `file_size` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `status` enum('active','archived') NOT NULL DEFAULT 'active',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` bigint(20) UNSIGNED NOT NULL,
  `uploaded_by` bigint(20) UNSIGNED DEFAULT NULL,
  `category` varchar(80) NOT NULL DEFAULT 'general',
  `file_name` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `mime_type` varchar(100) NOT NULL,
  `file_size` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` bigint(20) UNSIGNED NOT NULL,
  `person_id` bigint(20) UNSIGNED DEFAULT NULL,
  `member_number` varchar(20) NOT NULL,
  `status` enum('pending','active','rejected','suspended','inactive','alumni') NOT NULL DEFAULT 'pending',
  `joined_at` datetime DEFAULT NULL,
  `reviewed_at` datetime DEFAULT NULL,
  `reviewed_by` bigint(20) UNSIGNED DEFAULT NULL,
  `reviewer_notes` text DEFAULT NULL,
  `current_term_id` bigint(20) UNSIGNED DEFAULT NULL,
  `batch_year` varchar(10) DEFAULT NULL,
  `faculty_name` varchar(180) DEFAULT NULL,
  `prodi_name` varchar(180) DEFAULT NULL,
  `whatsapp` varchar(60) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `member_audit`
--

CREATE TABLE `member_audit` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `old_status` varchar(20) DEFAULT NULL,
  `new_status` varchar(20) NOT NULL,
  `changed_by` bigint(20) UNSIGNED DEFAULT NULL,
  `changed_at` datetime NOT NULL DEFAULT current_timestamp(),
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `organizations`
--

CREATE TABLE `organizations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(180) NOT NULL,
  `short_name` varchar(80) NOT NULL DEFAULT '',
  `slug` varchar(100) NOT NULL,
  `website_name` varchar(180) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `about` longtext DEFAULT NULL,
  `vision` longtext DEFAULT NULL,
  `mission` longtext DEFAULT NULL,
  `values_text` longtext DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `favicon` varchar(255) DEFAULT NULL,
  `hero_image` varchar(255) DEFAULT NULL,
  `primary_color` char(7) NOT NULL DEFAULT '#0a84ff',
  `secondary_color` char(7) NOT NULL DEFAULT '#5e5ce6',
  `accent_color` char(7) NOT NULL DEFAULT '#30d158',
  `background_color` char(7) NOT NULL DEFAULT '#f7f8fa',
  `text_color` char(7) NOT NULL DEFAULT '#111827',
  `font_family` varchar(60) NOT NULL DEFAULT 'Inter',
  `email` varchar(190) DEFAULT NULL,
  `phone` varchar(60) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `whatsapp` varchar(60) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `tiktok` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `map_embed_url` text DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `organizations`
--

INSERT INTO `organizations` (`id`, `name`, `short_name`, `slug`, `website_name`, `description`, `about`, `vision`, `mission`, `values_text`, `logo`, `favicon`, `hero_image`, `primary_color`, `secondary_color`, `accent_color`, `background_color`, `text_color`, `font_family`, `email`, `phone`, `address`, `whatsapp`, `instagram`, `facebook`, `youtube`, `tiktok`, `linkedin`, `website`, `map_embed_url`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Organisasi Mahasiswa', 'ORMAWA', 'ormawa', 'ORMAWA', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '#1b4332', '#2d6a4f', '#30d158', '#f7f8fa', '#111827', 'Inter', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2026-09-19 13:46:54', '2026-09-19 13:46:54');

-- --------------------------------------------------------

--
-- Table structure for table `organization_positions`
--

CREATE TABLE `organization_positions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `position_name` varchar(180) NOT NULL,
  `description` longtext DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `photo` varchar(255) DEFAULT NULL,
  `person_name` varchar(160) DEFAULT NULL,
  `period` varchar(80) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `organization_settings`
--

CREATE TABLE `organization_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` bigint(20) UNSIGNED NOT NULL,
  `setting_key` varchar(100) NOT NULL,
  `setting_value` longtext DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `organization_settings`
--

INSERT INTO `organization_settings` (`id`, `organization_id`, `setting_key`, `setting_value`, `created_at`, `updated_at`) VALUES
(188, 1, 'registration_enabled', '1', '2026-09-19 13:46:54', '2026-09-19 13:46:54'),
(189, 1, 'organization_name', 'Organisasi Mahasiswa', '2026-09-19 13:46:54', '2026-09-19 13:46:54');

-- --------------------------------------------------------

--
-- Table structure for table `organization_terms`
--

CREATE TABLE `organization_terms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(180) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `organization_terms`
--

INSERT INTO `organization_terms` (`id`, `organization_id`, `name`, `slug`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
(1, 1, 'Periode Awal', 'periode-awal', '2026-01-01', '2026-12-31', '2026-09-19 13:46:54', '2026-09-19 13:46:54');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` bigint(20) UNSIGNED NOT NULL,
  `page_key` varchar(80) NOT NULL,
  `title` varchar(180) NOT NULL,
  `slug` varchar(120) NOT NULL,
  `content` longtext DEFAULT NULL,
  `meta_title` varchar(180) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `status` enum('draft','published') NOT NULL DEFAULT 'published',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `persons`
--

CREATE TABLE `persons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(180) NOT NULL,
  `email` varchar(190) DEFAULT NULL,
  `phone` varchar(60) DEFAULT NULL,
  `photo_media_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `positions`
--

CREATE TABLE `positions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` bigint(20) UNSIGNED NOT NULL,
  `group_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(180) NOT NULL,
  `description` text DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_public` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Whether this position should be visible on public structure page (1=public, 0=private/admin-only)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `position_assignments`
--

CREATE TABLE `position_assignments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `position_id` bigint(20) UNSIGNED NOT NULL,
  `person_id` bigint(20) UNSIGNED DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `status` enum('active','inactive','vacant') NOT NULL DEFAULT 'active',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_public` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Whether this assignment should be visible on public structure page (1=public, 0=private/admin-only)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `registration_fields`
--

CREATE TABLE `registration_fields` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `form_id` bigint(20) UNSIGNED NOT NULL,
  `field_type` enum('text','textarea','number','phone','date','email','select','radio','checkbox','file_image','file','social_media','faculty_selector','program_study_selector') NOT NULL DEFAULT 'text',
  `name` varchar(100) NOT NULL,
  `label` varchar(180) NOT NULL,
  `placeholder` varchar(255) DEFAULT NULL,
  `help_text` text DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `options_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`options_json`)),
  `validation_rules` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`validation_rules`)),
  `config_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`config_json`)),
  `file_accept` varchar(255) DEFAULT NULL,
  `file_max_bytes` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `registration_forms`
--

CREATE TABLE `registration_forms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(180) NOT NULL DEFAULT 'Formulir Pendaftaran',
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `registration_member_mapping`
--

CREATE TABLE `registration_member_mapping` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `registration_submission_id` bigint(20) UNSIGNED NOT NULL,
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `mapping_type` enum('direct','ambiguous','manual') NOT NULL DEFAULT 'direct',
  `confidence_score` tinyint(3) UNSIGNED DEFAULT NULL,
  `mapped_at` datetime NOT NULL DEFAULT current_timestamp(),
  `mapped_by` bigint(20) UNSIGNED DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `registration_submissions`
--

CREATE TABLE `registration_submissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `form_id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(180) DEFAULT NULL,
  `faculty_name` varchar(180) DEFAULT NULL,
  `prodi_name` varchar(180) DEFAULT NULL,
  `whatsapp` varchar(50) DEFAULT NULL,
  `batch_year` varchar(10) DEFAULT NULL,
  `member_number` varchar(20) DEFAULT NULL,
  `public_reference` varchar(30) DEFAULT NULL,
  `public_token_hash` char(64) DEFAULT NULL,
  `status` enum('pending','approved','rejected','draft') NOT NULL DEFAULT 'pending',
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `reviewer_notes` text DEFAULT NULL,
  `submitted_at` datetime DEFAULT NULL,
  `reviewed_at` datetime DEFAULT NULL,
  `reviewed_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `registration_values`
--

CREATE TABLE `registration_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `submission_id` bigint(20) UNSIGNED NOT NULL,
  `field_id` bigint(20) UNSIGNED DEFAULT NULL,
  `field_name` varchar(100) NOT NULL,
  `field_label` varchar(180) NOT NULL,
  `field_type` varchar(50) NOT NULL,
  `value` text DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `structure_groups`
--

CREATE TABLE `structure_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(180) NOT NULL,
  `description` text DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `banner_media_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Whether this group should be visible on public structure page (1=public, 0=private/admin-only)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `study_programs`
--

CREATE TABLE `study_programs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `faculty_id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(180) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `study_programs`
--

INSERT INTO `study_programs` (`id`, `faculty_id`, `code`, `name`, `sort_order`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 'PS', 'Program Studi', 1, 1, '2026-09-19 13:46:54', '2026-09-19 13:46:54');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(160) NOT NULL,
  `email` varchar(190) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('super_admin','organization_admin','editor','member') NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `last_login` datetime DEFAULT NULL,
  `remember_token` varchar(64) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `organization_id`, `name`, `email`, `password`, `role`, `status`, `last_login`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'Administrator', 'admin@example.com', '$2y$12$YmSsFiMd2NPJGJ2L1e7Wv.o6X0UhxFP3aLjzKwYBfJ16T4YcQhLrm', 'organization_admin', 'active', '2026-09-20 08:48:01', NULL, '2026-09-19 13:46:54', '2026-09-19 13:46:54');

-- --------------------------------------------------------

--
-- Table structure for table `user_account_members`
--

CREATE TABLE `user_account_members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `member_id` bigint(20) UNSIGNED DEFAULT NULL,
  `person_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_primary` tinyint(1) NOT NULL DEFAULT 1,
  `linked_at` datetime NOT NULL DEFAULT current_timestamp(),
  `linked_by` bigint(20) UNSIGNED DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_logs_user` (`user_id`),
  ADD KEY `idx_logs_org_created` (`organization_id`,`created_at`),
  ADD KEY `idx_logs_action_created` (`action`,`created_at`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_event_slug` (`organization_id`,`slug`),
  ADD KEY `idx_events_org_date` (`organization_id`,`event_date`),
  ADD KEY `idx_events_org_status_date` (`organization_id`,`status`,`event_date`);

--
-- Indexes for table `faculties`
--
ALTER TABLE `faculties`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_faculty_code` (`code`),
  ADD KEY `idx_faculty_sort` (`sort_order`),
  ADD KEY `idx_faculty_active` (`is_active`);

--
-- Indexes for table `gallery_albums`
--
ALTER TABLE `gallery_albums`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_album_slug` (`organization_id`,`slug`),
  ADD KEY `idx_albums_org_date` (`organization_id`,`event_date`),
  ADD KEY `idx_albums_org_category` (`organization_id`,`category`),
  ADD KEY `idx_gallery_albums_drive` (`organization_id`,`source_type`,`drive_folder_id`);

--
-- Indexes for table `gallery_items`
--
ALTER TABLE `gallery_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_gallery_item_drive_file` (`album_id`,`drive_file_id`),
  ADD KEY `idx_gallery_items_album_order` (`album_id`,`sort_order`),
  ADD KEY `idx_gallery_items_drive` (`album_id`,`source_type`,`sync_status`);

--
-- Indexes for table `home_sections`
--
ALTER TABLE `home_sections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_home_section` (`organization_id`,`section_key`),
  ADD KEY `idx_home_sections_org_order` (`organization_id`,`sort_order`);

--
-- Indexes for table `legacy_structure_mappings`
--
ALTER TABLE `legacy_structure_mappings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `legacy_position_id` (`legacy_position_id`),
  ADD KEY `fk_map_org` (`organization_id`),
  ADD KEY `fk_map_term` (`term_id`),
  ADD KEY `fk_map_group` (`group_id`),
  ADD KEY `fk_map_position` (`position_id`),
  ADD KEY `fk_map_person` (`person_id`),
  ADD KEY `fk_map_assignment` (`assignment_id`);

--
-- Indexes for table `letters`
--
ALTER TABLE `letters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_letters_org_type` (`organization_id`,`type`),
  ADD KEY `idx_letters_org_date` (`organization_id`,`letter_date`),
  ADD KEY `idx_letters_category` (`category`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_media_user` (`uploaded_by`),
  ADD KEY `idx_media_org_created` (`organization_id`,`created_at`),
  ADD KEY `idx_media_org_category` (`organization_id`,`category`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `member_number` (`member_number`),
  ADD UNIQUE KEY `uq_member_number` (`member_number`),
  ADD KEY `fk_members_term` (`current_term_id`),
  ADD KEY `fk_members_reviewer` (`reviewed_by`),
  ADD KEY `idx_members_org_status` (`organization_id`,`status`),
  ADD KEY `idx_members_person` (`person_id`),
  ADD KEY `idx_members_batch` (`organization_id`,`batch_year`),
  ADD KEY `idx_members_reviewed` (`reviewed_at`);

--
-- Indexes for table `member_audit`
--
ALTER TABLE `member_audit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_audit_user` (`changed_by`),
  ADD KEY `idx_audit_member` (`member_id`),
  ADD KEY `idx_audit_date` (`changed_at`);

--
-- Indexes for table `organizations`
--
ALTER TABLE `organizations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `idx_org_status` (`status`),
  ADD KEY `idx_org_name` (`name`);

--
-- Indexes for table `organization_positions`
--
ALTER TABLE `organization_positions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_positions_parent` (`parent_id`),
  ADD KEY `idx_positions_org_parent_order` (`organization_id`,`parent_id`,`sort_order`),
  ADD KEY `idx_positions_org_status` (`organization_id`,`status`);

--
-- Indexes for table `organization_settings`
--
ALTER TABLE `organization_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_org_setting` (`organization_id`,`setting_key`),
  ADD KEY `idx_settings_org` (`organization_id`);

--
-- Indexes for table `organization_terms`
--
ALTER TABLE `organization_terms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_term_org_slug` (`organization_id`,`slug`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_page_key` (`organization_id`,`page_key`),
  ADD UNIQUE KEY `uq_page_slug` (`organization_id`,`slug`),
  ADD KEY `idx_pages_org_status` (`organization_id`,`status`);

--
-- Indexes for table `persons`
--
ALTER TABLE `persons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_persons_photo` (`photo_media_id`),
  ADD KEY `idx_persons_org` (`organization_id`);

--
-- Indexes for table `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_struct_positions_group` (`group_id`),
  ADD KEY `idx_positions_org_group` (`organization_id`,`group_id`,`sort_order`),
  ADD KEY `idx_positions_public` (`organization_id`,`group_id`,`is_public`,`sort_order`);

--
-- Indexes for table `position_assignments`
--
ALTER TABLE `position_assignments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_assign_term` (`term_id`),
  ADD KEY `idx_assign_org_term` (`organization_id`,`term_id`),
  ADD KEY `idx_assign_position` (`position_id`),
  ADD KEY `idx_assign_person` (`person_id`),
  ADD KEY `idx_assignments_public` (`organization_id`,`term_id`,`is_public`);

--
-- Indexes for table `registration_fields`
--
ALTER TABLE `registration_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_reg_fields_form` (`form_id`),
  ADD KEY `idx_reg_fields_sort` (`form_id`,`sort_order`,`is_active`,`deleted_at`),
  ADD KEY `idx_reg_fields_name` (`form_id`,`name`),
  ADD KEY `idx_reg_fields_active` (`is_active`,`deleted_at`);

--
-- Indexes for table `registration_forms`
--
ALTER TABLE `registration_forms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_reg_forms_org` (`organization_id`);

--
-- Indexes for table `registration_member_mapping`
--
ALTER TABLE `registration_member_mapping`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_submission_mapping` (`registration_submission_id`),
  ADD KEY `fk_map_user` (`mapped_by`),
  ADD KEY `idx_map_member` (`member_id`),
  ADD KEY `idx_map_type` (`mapping_type`);

--
-- Indexes for table `registration_submissions`
--
ALTER TABLE `registration_submissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_reg_sub_public_ref` (`public_reference`),
  ADD UNIQUE KEY `member_number` (`member_number`),
  ADD KEY `fk_reg_sub_form` (`form_id`),
  ADD KEY `idx_reg_sub_org_status` (`organization_id`,`status`),
  ADD KEY `idx_reg_sub_org_created` (`organization_id`,`created_at`);

--
-- Indexes for table `registration_values`
--
ALTER TABLE `registration_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_reg_val_submission` (`submission_id`);

--
-- Indexes for table `structure_groups`
--
ALTER TABLE `structure_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_groups_parent` (`parent_id`),
  ADD KEY `idx_groups_org_parent` (`organization_id`,`parent_id`,`sort_order`),
  ADD KEY `fk_groups_banner` (`banner_media_id`),
  ADD KEY `idx_groups_public` (`organization_id`,`is_public`,`sort_order`);

--
-- Indexes for table `study_programs`
--
ALTER TABLE `study_programs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_sp_faculty` (`faculty_id`),
  ADD KEY `idx_sp_active` (`is_active`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_users_org` (`organization_id`),
  ADD KEY `idx_users_role` (`role`),
  ADD KEY `idx_users_remember_token` (`remember_token`);

--
-- Indexes for table `user_account_members`
--
ALTER TABLE `user_account_members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_user_member` (`user_id`,`member_id`),
  ADD UNIQUE KEY `uq_user_person` (`user_id`,`person_id`),
  ADD KEY `fk_uam_linked_by` (`linked_by`),
  ADD KEY `idx_uam_user` (`user_id`),
  ADD KEY `idx_uam_member` (`member_id`),
  ADD KEY `idx_uam_person` (`person_id`),
  ADD KEY `idx_uam_primary` (`is_primary`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `faculties`
--
ALTER TABLE `faculties`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `gallery_albums`
--
ALTER TABLE `gallery_albums`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `gallery_items`
--
ALTER TABLE `gallery_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `home_sections`
--
ALTER TABLE `home_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `legacy_structure_mappings`
--
ALTER TABLE `legacy_structure_mappings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `letters`
--
ALTER TABLE `letters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `member_audit`
--
ALTER TABLE `member_audit`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `organizations`
--
ALTER TABLE `organizations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `organization_positions`
--
ALTER TABLE `organization_positions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `organization_settings`
--
ALTER TABLE `organization_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=190;

--
-- AUTO_INCREMENT for table `organization_terms`
--
ALTER TABLE `organization_terms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `persons`
--
ALTER TABLE `persons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `positions`
--
ALTER TABLE `positions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `position_assignments`
--
ALTER TABLE `position_assignments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `registration_fields`
--
ALTER TABLE `registration_fields`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=245;

--
-- AUTO_INCREMENT for table `registration_forms`
--
ALTER TABLE `registration_forms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `registration_member_mapping`
--
ALTER TABLE `registration_member_mapping`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `registration_submissions`
--
ALTER TABLE `registration_submissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `registration_values`
--
ALTER TABLE `registration_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `structure_groups`
--
ALTER TABLE `structure_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `study_programs`
--
ALTER TABLE `study_programs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user_account_members`
--
ALTER TABLE `user_account_members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD CONSTRAINT `fk_logs_org` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_logs_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `fk_events_org` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `gallery_albums`
--
ALTER TABLE `gallery_albums`
  ADD CONSTRAINT `fk_gallery_albums_org` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `gallery_items`
--
ALTER TABLE `gallery_items`
  ADD CONSTRAINT `fk_gallery_items_album` FOREIGN KEY (`album_id`) REFERENCES `gallery_albums` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `home_sections`
--
ALTER TABLE `home_sections`
  ADD CONSTRAINT `fk_sections_org` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `legacy_structure_mappings`
--
ALTER TABLE `legacy_structure_mappings`
  ADD CONSTRAINT `fk_map_assignment` FOREIGN KEY (`assignment_id`) REFERENCES `position_assignments` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_map_group` FOREIGN KEY (`group_id`) REFERENCES `structure_groups` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_map_legacy` FOREIGN KEY (`legacy_position_id`) REFERENCES `organization_positions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_map_org` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_map_person` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_map_position` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_map_term` FOREIGN KEY (`term_id`) REFERENCES `organization_terms` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `letters`
--
ALTER TABLE `letters`
  ADD CONSTRAINT `fk_letters_org` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `fk_media_org` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_media_user` FOREIGN KEY (`uploaded_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `members`
--
ALTER TABLE `members`
  ADD CONSTRAINT `fk_members_org` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_members_person` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_members_reviewer` FOREIGN KEY (`reviewed_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_members_term` FOREIGN KEY (`current_term_id`) REFERENCES `organization_terms` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `member_audit`
--
ALTER TABLE `member_audit`
  ADD CONSTRAINT `fk_audit_member` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_audit_user` FOREIGN KEY (`changed_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `organization_positions`
--
ALTER TABLE `organization_positions`
  ADD CONSTRAINT `fk_positions_org` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_positions_parent` FOREIGN KEY (`parent_id`) REFERENCES `organization_positions` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `organization_settings`
--
ALTER TABLE `organization_settings`
  ADD CONSTRAINT `fk_settings_org` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `organization_terms`
--
ALTER TABLE `organization_terms`
  ADD CONSTRAINT `fk_terms_org` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pages`
--
ALTER TABLE `pages`
  ADD CONSTRAINT `fk_pages_org` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `persons`
--
ALTER TABLE `persons`
  ADD CONSTRAINT `fk_persons_org` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_persons_photo` FOREIGN KEY (`photo_media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `positions`
--
ALTER TABLE `positions`
  ADD CONSTRAINT `fk_struct_positions_group` FOREIGN KEY (`group_id`) REFERENCES `structure_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_struct_positions_org` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `position_assignments`
--
ALTER TABLE `position_assignments`
  ADD CONSTRAINT `fk_assign_org` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_assign_person` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_assign_position` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_assign_term` FOREIGN KEY (`term_id`) REFERENCES `organization_terms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `registration_fields`
--
ALTER TABLE `registration_fields`
  ADD CONSTRAINT `fk_reg_fields_form` FOREIGN KEY (`form_id`) REFERENCES `registration_forms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `registration_forms`
--
ALTER TABLE `registration_forms`
  ADD CONSTRAINT `fk_reg_forms_org` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `registration_member_mapping`
--
ALTER TABLE `registration_member_mapping`
  ADD CONSTRAINT `fk_map_member` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_map_submission` FOREIGN KEY (`registration_submission_id`) REFERENCES `registration_submissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_map_user` FOREIGN KEY (`mapped_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `registration_submissions`
--
ALTER TABLE `registration_submissions`
  ADD CONSTRAINT `fk_reg_sub_form` FOREIGN KEY (`form_id`) REFERENCES `registration_forms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_reg_sub_org` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `registration_values`
--
ALTER TABLE `registration_values`
  ADD CONSTRAINT `fk_reg_val_submission` FOREIGN KEY (`submission_id`) REFERENCES `registration_submissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `structure_groups`
--
ALTER TABLE `structure_groups`
  ADD CONSTRAINT `fk_groups_banner` FOREIGN KEY (`banner_media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_groups_org` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_groups_parent` FOREIGN KEY (`parent_id`) REFERENCES `structure_groups` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `study_programs`
--
ALTER TABLE `study_programs`
  ADD CONSTRAINT `fk_study_programs_faculty` FOREIGN KEY (`faculty_id`) REFERENCES `faculties` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_org` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `user_account_members`
--
ALTER TABLE `user_account_members`
  ADD CONSTRAINT `fk_uam_linked_by` FOREIGN KEY (`linked_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_uam_member` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_uam_person` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_uam_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
