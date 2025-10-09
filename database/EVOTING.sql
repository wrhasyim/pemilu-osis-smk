-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 09, 2025 at 09:52 AM
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
-- Database: `pemilu_osis`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `candidates`
--

CREATE TABLE `candidates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `vision` text NOT NULL,
  `mission` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `candidates`
--

INSERT INTO `candidates` (`id`, `name`, `photo`, `vision`, `mission`, `created_at`, `updated_at`) VALUES
(1, 'MUHAMMAD AL ISRA FIRMANSYAH dan HIDAYATULLAH', 'photos/KFnz1AC9ZRVQVuSn5GkdW47J76l7SQwVOxbaTJVI.jpg', 'Menjadikan OSIS SMK Taruna Karya Mandiri sebagai wadah pengembangan potensi siswa yang kreatif, inovatif, dan berintegritas, serta meningkatkan kualitas siswa dan siswi sekaligus sekolah melalui kegiatan yang bermanfaat dan berdaya guna.', '1. Meningkatkan partisipasi siswa dalam kegiatan OSIS dan sekolah melalui program-program yang menarik dan bermanfaat.\r\n2. Mengembangkan potensi siswa melalui kegiatan ekstrakurikuler dan pelatihan yang sesuai dengan minat dan bakat siswa.\r\n3. Meningkatkan kesadaran dan kepedulian siswa terhadap lingkungan sekolah dan masyarakat melalui kegiatan sosial dan lingkungan.\r\n4. Meningkatkan kualitas komunikasi dan kerjasama antara siswa dan siswi sekaligus guru, dan staf sekolah untuk mencapai tujuan bersama.\r\n5. Mengadakan kegiatan yang mendukung pengembangan karakter dan kepemimpinan siswa.', '2025-10-09 00:23:23', '2025-10-09 00:23:23'),
(2, 'SITI MARYAM dan DONI RAMADHANI', 'photos/DixoLzKeN30DQBVb4QF43NScTuRrPUj4URB9RbVY.jpg', 'menumbuhkan lingkungan sekolah yang berkualitas dalam mengembangkan siswa-siswi 3B (berkarakter, berakhlak mulia, dan berprestasi)', '1. mengembangkan komunikasi dua arah yang sehat dan terbuka antara siswa, guru, dan pihak sekolah. \r\n2. mendengarkan dan menindaklanjuti aspirasi siswa secara responsif dan bersahabat \r\n3. mengubah budaya \"ikut-ikutan\" menjadi \"ikut sertaan\" agar semua dilibatkan semua dihargai\r\n4. bekerjasama dengan seluruh warga sekolah untuk mewujudkan SMK taruna karya Mandiri yang unggul dan berkarakter', '2025-10-09 00:24:05', '2025-10-09 00:24:05'),
(3, 'MUHAMMAD RAIHAN FEBRIAN dan REHAN MAULANA RIZKY', 'photos/0EX45At6UYin0HoF6O3r2Tp1yuFw1fJiYJsLU7Ou.jpg', 'mewujudkan smk taruna karya mandiri sebagai lingkungan yang inspiratif kreatif mandiri dan juga berprestasi serta menjujung tinggi nilai kebersamaan dan semangat kepemimpinan', '1.mengadakan kegiatan yang melibatkan siswa dalam menumbuh kan rasa kerja sama dan partisipasi aktif \r\n2.menanamkan rasa kedisiplinan kejujuran dan juga kerja sama yang baik\r\n3.menjadi jembatan atara siswa dan pihak sekolah untuk menyalurkan aspirasi dan partisipasi aktif \r\n4.memastikan program osis dapat berkelanjutan serta memberikan dampak positif jangka panjang', '2025-10-09 00:25:17', '2025-10-09 00:25:17');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_10_08_065217_create_candidates_table', 1),
(5, '2025_10_08_065229_create_votes_table', 1),
(6, '2025_10_08_081638_add_class_to_users_table', 1),
(7, '2025_10_08_133909_create_settings_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('i4tcaWIVsmWdB6ITYGHpBUN14qzI2cLPwnl7PloC', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoib3pId3ZUMVNJNW92MEhmbjh4TVVRU3JrcE5lSmVkbE9XWFRnUGJvcyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozNjoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2FkbWluL3N0dWRlbnRzIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9kYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1759996324),
('mHIkEggGn9eVdUR4x6uvz6AAL7gDk2ZBfm7KLkc4', 1, '192.168.16.5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiREdyN0hOWWVNampNNExVeUpLdWRYdEh5RW10TEhOQ29MYlFSM096TiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDc6Imh0dHA6Ly8xOTIuMTY4LjE2LjQ4OjgwMDAvYWRtaW4vc3R1ZGVudHM/cGFnZT0xIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1759995919),
('uS7JKnexlj7xod1pvNXA4cFYNmwIu567G3XUk4Il', 152, '192.168.16.48', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiWFR3akxiMzNBWnZKOFI0NVJPTm5hQzJpcG9MYzBqbEV3OGpsOElqZCI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM1OiJodHRwOi8vMTkyLjE2OC4xNi40ODo4MDAwL2Rhc2hib2FyZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE1Mjt9', 1759996306);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `voting_start_time` timestamp NULL DEFAULT NULL,
  `voting_end_time` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `voting_start_time`, `voting_end_time`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, '2025-10-09 00:17:10', '2025-10-09 00:17:10');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `class` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'voter',
  `has_voted` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `class`, `password`, `role`, `has_voted`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin OSIS', 'admin', NULL, '$2y$12$VXomcCpnHCSm/FS0uFDzOexUbDNSQsdSMU5uzUF/WWcjJ99cYrnGa', 'admin', 0, NULL, '2025-10-09 00:17:11', '2025-10-09 00:17:11'),
(2, 'ADILAH', '252610001', 'X MPLB 1', '$2y$12$1cSnMWvypri.yUB/acoTQOlU337xu9b8jzDdA1SxNuVWWCKmMnlGS', 'voter', 0, NULL, '2025-10-09 00:26:05', '2025-10-09 00:26:05'),
(3, 'ADINDA OKTAVIANA', '252610002', 'X MPLB 1', '$2y$12$q5F5RegVfyEHmarE50t0puaO64Q/hV1XXxNSzBejykoDht5mEtHku', 'voter', 0, NULL, '2025-10-09 00:26:05', '2025-10-09 00:26:05'),
(4, 'ATIK CANTIKA', '252610003', 'X MPLB 1', '$2y$12$UiUa2iL3HIQAeISbTKSD3.J6z2tIgtdrhRKH.vFtzE054AWCdQUWK', 'voter', 0, NULL, '2025-10-09 00:26:06', '2025-10-09 00:26:06'),
(5, 'AYU FADILLAH', '252610004', 'X MPLB 1', '$2y$12$Y0.Nb.xBdezqWB4e3iWBYuCPAnupD8k1p1ktZiswE.ntRzjm5I0XK', 'voter', 0, NULL, '2025-10-09 00:26:06', '2025-10-09 00:26:06'),
(6, 'BINTANG SAMUDRA SATYABUDIE', '252610005', 'X MPLB 1', '$2y$12$0T.OZLBzx2kdEev.hfv/R.hkMEcLFXoT7ec57k5n40P2jX7ccM1fG', 'voter', 0, NULL, '2025-10-09 00:26:06', '2025-10-09 00:26:06'),
(7, 'DESFA NAILATUL NAFISA', '252610007', 'X MPLB 1', '$2y$12$M6mbws9RLSutJ9CLn58eOONRO.QCjLHDnksT0lGRSUPjeKSycem/G', 'voter', 0, NULL, '2025-10-09 00:26:06', '2025-10-09 00:26:06'),
(8, 'DONI RAMADHANI', '252610008', 'X MPLB 1', '$2y$12$W9wl37/Gn1Dwy5vXjBMMeu1B/PD96QyXRB.vzBIwKmWhSm8/0ZZv.', 'voter', 0, NULL, '2025-10-09 00:26:07', '2025-10-09 00:26:07'),
(9, 'FITRIA ZAHRATUNNAJA', '252610009', 'X MPLB 1', '$2y$12$7k7D80sjaa5VmZ5.JuQhGuapxw47WNah/zB6bw3ENrwVoTnS7.0am', 'voter', 0, NULL, '2025-10-09 00:26:07', '2025-10-09 00:26:07'),
(10, 'INDAH AFIFA', '252610010', 'X MPLB 1', '$2y$12$bPvAsiWRolPGYVh6fCH0peIEJvhfe4aOcJMCfvk7EsD.xql3MYMgK', 'voter', 0, NULL, '2025-10-09 00:26:07', '2025-10-09 00:26:07'),
(11, 'INDAH LISNAWATI', '252610011', 'X MPLB 1', '$2y$12$XK3vYVJW/MZE5gqY.y7qzeTP86w9tilcAWkP4nw1FJp/Kl3p/.nKe', 'voter', 0, NULL, '2025-10-09 00:26:07', '2025-10-09 00:26:07'),
(12, 'INDRI PUSPITASARI', '252610012', 'X MPLB 1', '$2y$12$YWGy9Va/fLvEpL0OMTqSe.TRlZbc.X3ilaq6VPrzEpF5v/qHfdL7u', 'voter', 0, NULL, '2025-10-09 00:26:08', '2025-10-09 00:26:08'),
(13, 'IQBAL MAULANA', '252610013', 'X MPLB 1', '$2y$12$OVjrLbLDzZ.QroBJa4FHzOga31O9AFINvLhVlVxC4Hsc/PvEUEFbi', 'voter', 0, NULL, '2025-10-09 00:26:08', '2025-10-09 00:26:08'),
(14, 'JIHAN KHOLILAH', '252610014', 'X MPLB 1', '$2y$12$vhwwaiwWWFRhuS4ePiFTDOahiI2cUgVdpvEFn5BWngGqydkd/OzZO', 'voter', 0, NULL, '2025-10-09 00:26:08', '2025-10-09 00:26:08'),
(15, 'KARLINA', '252610263', 'X MPLB 1', '$2y$12$.p/lqk3QFdK0gLaImFVeRujaUhJ2E01tfRFrQqX1w3jIcAhWf2Go.', 'voter', 0, NULL, '2025-10-09 00:26:09', '2025-10-09 00:26:09'),
(16, 'KHOLIFAH RIZKA NURSAADAH', '252610016', 'X MPLB 1', '$2y$12$GFg17pcKMrwm4zL.is8IsOltJlvCqUTrxEzp0t2xGVAZLVR5HjTTe', 'voter', 0, NULL, '2025-10-09 00:26:09', '2025-10-09 00:26:09'),
(17, 'KOMARIAH', '252610017', 'X MPLB 1', '$2y$12$oHNFTzxXXiLDmUOJ4J6AU.7qLQiOmkO.m2ULCHfb8WN/ae7S7i1We', 'voter', 0, NULL, '2025-10-09 00:26:09', '2025-10-09 00:26:09'),
(18, 'NURUL HABIBAH', '252610018', 'X MPLB 1', '$2y$12$DdamIoig6PuAWrjZQvGKaOv8ol7yXb2WvrpTe3/qHYzKVF1Rzd5lu', 'voter', 0, NULL, '2025-10-09 00:26:10', '2025-10-09 00:26:10'),
(19, 'RISMA NURMALA', '252610020', 'X MPLB 1', '$2y$12$iZ12h7EQb7WHEsR/nV8Mau04CMOF/mQIpPAIFSTxUrf.wxvUHlu2.', 'voter', 0, NULL, '2025-10-09 00:26:10', '2025-10-09 00:26:10'),
(20, 'SHIPA', '252610022', 'X MPLB 1', '$2y$12$lLnGlIKuNxMfdYLRiyPWze5iENbvtXaMSiy4EtGRHRf2VBRNIwLdq', 'voter', 0, NULL, '2025-10-09 00:26:11', '2025-10-09 00:26:11'),
(21, 'SHOFIA AISYAH MUSAFAAH', '252610023', 'X MPLB 1', '$2y$12$SDp0GayxLpn4hsT0T.TdYuSkyPllU0ngHeWt6vUXqksHEVBHDLu9a', 'voter', 0, NULL, '2025-10-09 00:26:11', '2025-10-09 00:26:11'),
(22, 'SITI ALISA', '252610024', 'X MPLB 1', '$2y$12$SgkGdd1Q0JYu8K2KBvNvoORgjhzeg3G5ZqlMKMw1tI4mkEXNJJRwy', 'voter', 0, NULL, '2025-10-09 00:26:11', '2025-10-09 00:26:11'),
(23, 'SITI AMINAH', '252610025', 'X MPLB 1', '$2y$12$bHxPsrPVb7xzL8lHb8jaUukg596PeP7iVO62jlIBZUH13sBIoOGI.', 'voter', 0, NULL, '2025-10-09 00:26:12', '2025-10-09 00:26:12'),
(24, 'SITI FATIMAH', '252610026', 'X MPLB 1', '$2y$12$mSBvn.lJibBux7jslIhmA.9QGqdF8OuuvZg1EqCwml994VbZhhGaC', 'voter', 0, NULL, '2025-10-09 00:26:12', '2025-10-09 00:26:12'),
(25, 'WARNIH MELINDA', '252610027', 'X MPLB 1', '$2y$12$xQhUaIhd3jm9oUgKUucV5.y05cWglQAWvas5a1Ab1NFG/g.xmLYUC', 'voter', 0, NULL, '2025-10-09 00:26:12', '2025-10-09 00:26:12'),
(26, 'WINA', '252610028', 'X MPLB 1', '$2y$12$UOEEoRrvHLhk3do89CbtzOqfsBIt/FN61Ap3v5Cp3mwA/mQ.crsZq', 'voter', 0, NULL, '2025-10-09 00:26:13', '2025-10-09 00:26:13'),
(27, 'ZASKIA PUTRI', '252610262', 'X MPLB 1', '$2y$12$o2fcfse4o410t.hlCJo/KeR0rzqBLOwLng9iHFjGbPdq4QvASfOK2', 'voter', 0, NULL, '2025-10-09 00:26:13', '2025-10-09 00:26:13'),
(28, 'ALLEEISYA DAVINA KAMANDHANIKA', '252610038', 'X MPLB 2', '$2y$12$9l.aG/dWpB7NbmRzlUO/F.7FN/td.aU8ZmD1W97hPR9JD/4UmhR2u', 'voter', 0, NULL, '2025-10-09 00:26:13', '2025-10-09 00:26:13'),
(29, 'ALYA HANDAYANI', '252610030', 'X MPLB 2', '$2y$12$9KLvjY9fHnLKXgRb7oL7juTVtQnnJi2AUOjKYNMRTrmRifNT3a0h6', 'voter', 0, NULL, '2025-10-09 00:26:14', '2025-10-09 00:26:14'),
(30, 'ANI SUHAENI', '252610031', 'X MPLB 2', '$2y$12$nI6iGfAvcvjBx7fV5OpE/uR3DU4P5eYnVGD0AvKV63.xEjFeEGNLi', 'voter', 0, NULL, '2025-10-09 00:26:14', '2025-10-09 00:26:14'),
(31, 'ANITA', '252610032', 'X MPLB 2', '$2y$12$NPFWpZo8b43AHeQEXQhlwOgIKriqVhHPXoFu4BvwJvjSry1TwrRDi', 'voter', 0, NULL, '2025-10-09 00:26:14', '2025-10-09 00:26:14'),
(32, 'APRILLIA ANATASYA', '252610033', 'X MPLB 2', '$2y$12$Wy/N2m6aP08GJf709xo2UOw9jolBArgTgbfwGe.Lp.4UlOShtB4Ky', 'voter', 0, NULL, '2025-10-09 00:26:14', '2025-10-09 00:26:14'),
(33, 'AULIA ISHAQUE', '252610034', 'X MPLB 2', '$2y$12$a8K50cPDVj/5uaYYfNtMjOjZbpebrpYIpQANQQalvHWFvxBp71TZS', 'voter', 0, NULL, '2025-10-09 00:26:15', '2025-10-09 00:26:15'),
(34, 'AVRIL AVPRIDA HARIYANA', '252610035', 'X MPLB 2', '$2y$12$XyCtvBQvBw4IVEE.Z6wXy.7aYeyu/68NiZZkORZcLc.j8eUit1VEi', 'voter', 0, NULL, '2025-10-09 00:26:15', '2025-10-09 00:26:15'),
(35, 'CITRA LESTARI ROHIMAH', '252610036', 'X MPLB 2', '$2y$12$rdeYUzJnYFRPf0yLBnAfwuCypuZGiEzxt2oeHdkB4jJFMwhCHxf5O', 'voter', 0, NULL, '2025-10-09 00:26:16', '2025-10-09 00:26:16'),
(36, 'DINA', '252610037', 'X MPLB 2', '$2y$12$c9hBkmnXf.AqLz/.r/PuIeXOqZPv2eZxAbjUfYyYdmAkJTW.D3AAu', 'voter', 0, NULL, '2025-10-09 00:26:16', '2025-10-09 00:26:16'),
(37, 'ENENG JUMARIYAH', '252610039', 'X MPLB 2', '$2y$12$6XHjWDmATioXCuDnppIPtutXlNK1dz/X.JvTnWnZLsyP8uflEsvJe', 'voter', 0, NULL, '2025-10-09 00:26:16', '2025-10-09 00:26:16'),
(38, 'ENGKOM KOMARIAH', '252610040', 'X MPLB 2', '$2y$12$iA/98g/UefhJ1/QwhL263eBxMNpszkqT.KLwCHICanBqCNe9nPNWa', 'voter', 0, NULL, '2025-10-09 00:26:17', '2025-10-09 00:26:17'),
(39, 'HENA ALI', '252610041', 'X MPLB 2', '$2y$12$lItuVS69U8I7CyU26TE8fOGM8Hm7f0EUCAAks.ThfoyhDrDgdYrdm', 'voter', 0, NULL, '2025-10-09 00:26:17', '2025-10-09 00:26:17'),
(40, 'JIHAN ANNASTASYA', '252610042', 'X MPLB 2', '$2y$12$.NJfQI0DuBP8ny.9fSG.9.Y0UfO5/WxqrHFBnATMrU7UdcGsazsVC', 'voter', 0, NULL, '2025-10-09 00:26:17', '2025-10-09 00:26:17'),
(41, 'KURNIA HANAPIAH ISWANDI', '252610043', 'X MPLB 2', '$2y$12$tVCStbAPJ6/7SdjGnBcBoONMGF16HRaF/NWCB2h1SmZDustgWHit2', 'voter', 0, NULL, '2025-10-09 00:26:17', '2025-10-09 00:26:17'),
(42, 'LATIFAH', '252610044', 'X MPLB 2', '$2y$12$9.zg.AlXEXYlBOq.Cx2acOMcj8e5gcfYEjHC.zhnKhW7CHY2wcSgu', 'voter', 0, NULL, '2025-10-09 00:26:18', '2025-10-09 00:26:18'),
(43, 'NASYA MAHARANI', '252610045', 'X MPLB 2', '$2y$12$u9VRgHxlZiiaGYCyYX0BreF152XvkdXyT.bR9xiZ1ZcgFPD1Q8ZsO', 'voter', 0, NULL, '2025-10-09 00:26:18', '2025-10-09 00:26:18'),
(44, 'NUR ALBIAH SALWA', '252610046', 'X MPLB 2', '$2y$12$wMyFYCVsIFM0H/IGcVuvP.8OlB5o6QUY4HTljLyTrcntqst22iNHW', 'voter', 0, NULL, '2025-10-09 00:26:18', '2025-10-09 00:26:18'),
(45, 'NUR SIFA ANGGAENI', '252610047', 'X MPLB 2', '$2y$12$9ebfBcBSaJ.RjIH6ZOJHz.luLNvrp/TdNjHjWNsw0DnDtYCmwLkv6', 'voter', 0, NULL, '2025-10-09 00:26:19', '2025-10-09 00:26:19'),
(46, 'PUTRI SASKIA', '252610048', 'X MPLB 2', '$2y$12$bc0uTKYEpX5taLG9fYD9FOWVWth1dub1OSYNyp2X7QIu.qrO3u50e', 'voter', 0, NULL, '2025-10-09 00:26:19', '2025-10-09 00:26:19'),
(47, 'RAHMA YANTI', '252610049', 'X MPLB 2', '$2y$12$7AFAU4Ugo2SwSIj22NE1Cu.MEnPU2Uvx/HU2.iSNk8r/PFfYnjfuu', 'voter', 0, NULL, '2025-10-09 00:26:19', '2025-10-09 00:26:19'),
(48, 'RANI AMELIA', '252610050', 'X MPLB 2', '$2y$12$pmspZg48ZFDwahRzgTh4s.0j3LbIJzT8M11iSAT7UmSqkgfjffQwi', 'voter', 0, NULL, '2025-10-09 00:26:19', '2025-10-09 00:26:19'),
(49, 'SAHAR SYAFITRI', '252610051', 'X MPLB 2', '$2y$12$uNQmm/wzw8m5WxidIx0REe2clCPI6Hff9FNhDSzdMiM3BXEDdO8ge', 'voter', 0, NULL, '2025-10-09 00:26:20', '2025-10-09 00:26:20'),
(50, 'SALSA BILA AZZAHRA', '252610052', 'X MPLB 2', '$2y$12$/3t8JvP0vR3hWlZyXdndD.0..6yK0pM3qVSOdQY9VWutMUNLUNe/q', 'voter', 0, NULL, '2025-10-09 00:26:20', '2025-10-09 00:26:20'),
(51, 'SHIFA ADELIA MAWAR', '252610053', 'X MPLB 2', '$2y$12$hi.Zs8BRFlUme.aRNxzVv.geyJBA2BsmNOQKDyxkpB3Z9MX1L8wAO', 'voter', 0, NULL, '2025-10-09 00:26:20', '2025-10-09 00:26:20'),
(52, 'SINTA SUTIA', '252610054', 'X MPLB 2', '$2y$12$TVxCUY16DLWNH9gMjo5m2ugjNUbtm.S8TxCUOxB3s6VnvqkDQfuk.', 'voter', 0, NULL, '2025-10-09 00:26:21', '2025-10-09 00:26:21'),
(53, 'SITI NURZAHRA', '252610055', 'X MPLB 2', '$2y$12$WEtH23Ooe2JoWFMli6tCIOMHyJ0BjTfjuGEBRMWAHEOON2v3NlKVi', 'voter', 0, NULL, '2025-10-09 00:26:21', '2025-10-09 00:26:21'),
(54, 'SITI ROMLAH', '252610056', 'X MPLB 2', '$2y$12$zwhyngEZ6T2O1aduPERi9.oEwpKcynMzo.r35CPvJ0drnMHAPMo4.', 'voter', 0, NULL, '2025-10-09 00:26:21', '2025-10-09 00:26:21'),
(55, 'TANIA OKTAVIANI', '252610057', 'X MPLB 2', '$2y$12$9x5EgL7mezPbA63YSNEPteG9pF.OKoIQ9Qt6WjSicLIXVJkc7rSzS', 'voter', 0, NULL, '2025-10-09 00:26:21', '2025-10-09 00:26:21'),
(56, 'WINDI ALTIYAH', '252610058', 'X MPLB 2', '$2y$12$VRgkd8OjQhHoZgzeEMRI4O1JhanU0ToT.HtxgiV4j1fzlL69qJFhu', 'voter', 0, NULL, '2025-10-09 00:26:22', '2025-10-09 00:26:22'),
(57, 'ABU HAMAD MASKURI', '252610059', 'X TM 1', '$2y$12$0UJbRGV6nUKb33IzW6E/1OERZgdMHJPfNwOjNFWe17Hf0QZzCuxmm', 'voter', 0, NULL, '2025-10-09 00:26:22', '2025-10-09 00:26:22'),
(58, 'ADE IRWANSYAH', '252610060', 'X TM 1', '$2y$12$TzcTfSQ8C4fM1fA14pqRoOl.94AhHSqnVk4AuXyza5SPSOCDViny2', 'voter', 0, NULL, '2025-10-09 00:26:22', '2025-10-09 00:26:22'),
(59, 'ALDO SUTISNA', '252610061', 'X TM 1', '$2y$12$cf0yzHXXUj3.6QsSU/tFZuHwH8nJM1uQJ0fwvaTxVNWinO/XZ.YtC', 'voter', 0, NULL, '2025-10-09 00:26:23', '2025-10-09 00:26:23'),
(60, 'ANDIKA PAJAR MAHDI', '252610062', 'X TM 1', '$2y$12$e8IpBEnKMpjd68XTpO3doeqw/gP4kdd9AQKQTMrHei4LBXu52QSca', 'voter', 0, NULL, '2025-10-09 00:26:23', '2025-10-09 00:26:23'),
(61, 'ANDINI ANGGRAENI', '252610265', 'X TM 1', '$2y$12$vH6YrqRaIi3Ap0YR0ogXfuR4oUD6bvXmtJ3gsnnxa8CI/J5m2QdWi', 'voter', 0, NULL, '2025-10-09 00:26:23', '2025-10-09 00:26:23'),
(62, 'BAGAS ARDIWINATA', '252610064', 'X TM 1', '$2y$12$H7HG1iDAHUCL.dNl71gjvOtG7QYZ5NFnMQUL9wEivxF3CC2eZHsqK', 'voter', 0, NULL, '2025-10-09 00:26:23', '2025-10-09 00:26:23'),
(63, 'CHIKA SIPA ANGGITA', '252610065', 'X TM 1', '$2y$12$D70JnqY7bk/AbLhg7R9D1.Db7Q2iva6Zi1HmCFe4j8oW5S1N3czuG', 'voter', 0, NULL, '2025-10-09 00:26:24', '2025-10-09 00:26:24'),
(64, 'DANI SETIAWAN', '252610066', 'X TM 1', '$2y$12$j1zTuPNeH/6iKQtxSmzrrO2ZzX1xh/GRsxNB1EQmKGjYoA7cm6Vhq', 'voter', 0, NULL, '2025-10-09 00:26:24', '2025-10-09 00:26:24'),
(65, 'DANI SUTISNA', '252610067', 'X TM 1', '$2y$12$z6SfDkcg/bWjA0Z6OOc0kOhOcnE/Z1bsDa7fZE/NgUHk4MsT41kBK', 'voter', 0, NULL, '2025-10-09 00:26:24', '2025-10-09 00:26:24'),
(66, 'DANIA OKTAVIA', '252610068', 'X TM 1', '$2y$12$tohWf5bO5NIf5Xe4DND2/e4wjSfk7MrNlnwyX182qdy6vat4Evxvu', 'voter', 0, NULL, '2025-10-09 00:26:24', '2025-10-09 00:26:24'),
(67, 'DIMAS AHMAD RAMADAN', '252610069', 'X TM 1', '$2y$12$74NdKaWBiYjuM7NQ76V.JeDFyKzkuy.8b9QuNAGgCE2qPjStjHDkO', 'voter', 0, NULL, '2025-10-09 00:26:25', '2025-10-09 00:26:25'),
(68, 'DIRLY ANGGADITA', '252610070', 'X TM 1', '$2y$12$bFj4HR1eOCsoiCdHbWoD2O12jw05rqsA/30eX2HUrh3aXxWF2Llwy', 'voter', 0, NULL, '2025-10-09 00:26:25', '2025-10-09 00:26:25'),
(69, 'EDI SETIA GUNAWAN', '252610071', 'X TM 1', '$2y$12$0hAZqsHiFYckonMAHtxr4OyzbPc/059Jqb7wfFVgGZoGIpwD96owK', 'voter', 0, NULL, '2025-10-09 00:26:25', '2025-10-09 00:26:25'),
(70, 'EKA BAMBANG SAPUTRA', '252610072', 'X TM 1', '$2y$12$.Jo3lMv4wJVAHaPYLZYWQe8WN2PwmkMa06Ql8M/duPUZXQlX1aHiS', 'voter', 0, NULL, '2025-10-09 00:26:26', '2025-10-09 00:26:26'),
(71, 'ENDRIK PURNAMA', '252610073', 'X TM 1', '$2y$12$euVJqvXJ85gn3FljG6Vqk.1zO6ti80r8LJPHRXWrM5ieyyRMMlKkK', 'voter', 0, NULL, '2025-10-09 00:26:26', '2025-10-09 00:26:26'),
(72, 'HERMANSYAH', '252610074', 'X TM 1', '$2y$12$i1T3Wfk10E24lsSMX/WqMeqQChFwjRPmAxGXfU8ayy8ka5JT3/bK.', 'voter', 0, NULL, '2025-10-09 00:26:26', '2025-10-09 00:26:26'),
(73, 'HIDAYATULLAH', '252610075', 'X TM 1', '$2y$12$tr2PQD4xzRpJzjrFo9qSpuCH0vh8O8xNqdZDkw/kO/3BKkTCaWGqO', 'voter', 0, NULL, '2025-10-09 00:26:26', '2025-10-09 00:26:26'),
(74, 'JAEN', '252610076', 'X TM 1', '$2y$12$dYiBBQ4nlHNaSUx81lVGMuoWHp5LbecTi9GIFQfmgC9firKqKqdHm', 'voter', 0, NULL, '2025-10-09 00:26:27', '2025-10-09 00:26:27'),
(75, 'JULIYANTO', '252610077', 'X TM 1', '$2y$12$xy0zo49.tMMC7jf.G3e4nusyYjpbJzAf8qYmqiaZJd/gz9Y1TaJJu', 'voter', 0, NULL, '2025-10-09 00:26:27', '2025-10-09 00:26:27'),
(76, 'MIFTAHUL ARIFIN', '252610078', 'X TM 1', '$2y$12$xG/y/oEVHIcpwS2irbWt7.Y3Z98vmtZ0leVotfx9M8.ynruRauhP.', 'voter', 0, NULL, '2025-10-09 00:26:27', '2025-10-09 00:26:27'),
(77, 'MIT F FELIX GUSNA', '252610079', 'X TM 1', '$2y$12$hcVCEjhGuJ21vuGXpGWq6.MRal2Oh3RuE2fuyj6GpRC2Y4dleUe2y', 'voter', 0, NULL, '2025-10-09 00:26:27', '2025-10-09 00:26:27'),
(78, 'MUHAMAD MUHIBIN', '252610080', 'X TM 1', '$2y$12$kzzBYB1us0iy4OyXcTTMYuz0Xn3zkZyEjCsHxivzwc5qEV8fQciW2', 'voter', 0, NULL, '2025-10-09 00:26:28', '2025-10-09 00:26:28'),
(79, 'MUHAMAD RADITIYA', '252610081', 'X TM 1', '$2y$12$8QIjg0tFqRqJpFFuBBQkX.bkpc4xBdsa684h2z42FDdLcRJraI.JW', 'voter', 0, NULL, '2025-10-09 00:26:28', '2025-10-09 00:26:28'),
(80, 'MUHAMAD RIZKI BAEHAKI', '252610082', 'X TM 1', '$2y$12$7BfohmkoQgc.gJ6fv/IBBOmfbp9btG2SE2IA4ApSo.ANOs8BDNyzm', 'voter', 0, NULL, '2025-10-09 00:26:28', '2025-10-09 00:26:28'),
(81, 'MUHAMAD RIZKY HABIBI', '252610083', 'X TM 1', '$2y$12$JcDdXxp1w.dMmPjhyZD3oeU2dqL5w5uS4CHnkDvw6sbwB5kzp.t6K', 'voter', 0, NULL, '2025-10-09 00:26:28', '2025-10-09 00:26:28'),
(82, 'MUHAMMAD AL ISRA FIRMANSYAH', '252610084', 'X TM 1', '$2y$12$XzYx1LRc3JWgopiL4LZW9.OsvCkzTvXXubVaaEJD/8iF.50/NTWs2', 'voter', 0, NULL, '2025-10-09 00:26:29', '2025-10-09 00:26:29'),
(83, 'MUHAMMAD FARHAN ADI PUTRA', '252610085', 'X TM 1', '$2y$12$rXdEbw.ZMw7rymphlocKjeJNAZUm/ohqvs2.K4yNy5MjJ0i9vU6M6', 'voter', 0, NULL, '2025-10-09 00:26:29', '2025-10-09 00:26:29'),
(84, 'RIFALDI JULIANSYAH', '252610086', 'X TM 1', '$2y$12$UNXYJa50qg.Oz4d/4qGYp.cMkTGZHDyAfHvao51FGf7rpWRsBA1Oe', 'voter', 0, NULL, '2025-10-09 00:26:29', '2025-10-09 00:26:29'),
(85, 'RINDI', '252610087', 'X TM 1', '$2y$12$.40UukLW2G3zVketDq8GEuYqVuxQa/gk8ZEBQr3nozrJZQoXGBQmq', 'voter', 0, NULL, '2025-10-09 00:26:30', '2025-10-09 00:26:30'),
(86, 'RISFI HIDAYAT', '252610088', 'X TM 1', '$2y$12$rnM1IjH53eMwlnE2q41aA.IeUbv494ZV4yjzjDJ3dlENbJAWhmxrC', 'voter', 0, NULL, '2025-10-09 00:26:30', '2025-10-09 00:26:30'),
(87, 'TAOPIK HIDAYAH', '252610089', 'X TM 1', '$2y$12$Kpdys8PIJEg.f2nRLcsWzeyhiEIzo4.MlD2493rl26GnHJAhIX/va', 'voter', 0, NULL, '2025-10-09 00:26:30', '2025-10-09 00:26:30'),
(88, 'WISNU HASLAN FARID', '252610090', 'X TM 1', '$2y$12$SlXxVfBU/Qhw7qmLQh5j2euhwbz6.T4ZAtqimdB.xYU91T42she1.', 'voter', 0, NULL, '2025-10-09 00:26:30', '2025-10-09 00:26:30'),
(89, 'YOMI ABDUL MANAH', '252610091', 'X TM 1', '$2y$12$d3/3uFu7ECkcyz7.DK0zg.xcfYUJq1pQLF/9gk6UonjS5M3WFCKMa', 'voter', 0, NULL, '2025-10-09 00:26:31', '2025-10-09 00:26:31'),
(90, 'ZAKI IBNU KHAIRI', '252610092', 'X TM 1', '$2y$12$5jUqTdSrSpOrYDoLIchUtul/FoM4.yUIf.hOlasnwb/mRMmF0igPq', 'voter', 0, NULL, '2025-10-09 00:26:31', '2025-10-09 00:26:31'),
(91, 'ABDUL LATIF', '252610093', 'X TM 2', '$2y$12$gWZaUJkZxtmOvD41Oyx0neKX00jNuhG4kMxRd.0fnFx.YzjNTmsoi', 'voter', 0, NULL, '2025-10-09 00:26:31', '2025-10-09 00:26:31'),
(92, 'ADE IRFAN', '252610094', 'X TM 2', '$2y$12$OUoylFLDd0kkQsZaEnfVK.nTBa.AhONgNfJ5bZflJqNVp3mRfjyf2', 'voter', 0, NULL, '2025-10-09 00:26:32', '2025-10-09 00:26:32'),
(93, 'ADE KRISYANTO', '252610095', 'X TM 2', '$2y$12$goVL6QyBSH8e68Idf5dMweWEa0OPZyib4JyWalMvauM8GJmKTHyQ2', 'voter', 0, NULL, '2025-10-09 00:26:32', '2025-10-09 00:26:32'),
(94, 'ADITIA SIMATUPANG', '252610096', 'X TM 2', '$2y$12$0sB2KL060/MDjIjmKMSQn.cs6z0H6ZZJB5nh175L2FbUB1/6orzOm', 'voter', 0, NULL, '2025-10-09 00:26:32', '2025-10-09 00:26:32'),
(95, 'AHMAD FAUZAN', '252610097', 'X TM 2', '$2y$12$wSuV95p8mq/IwNDU7uUKdesMC1iZ4cy.Wpt.oL0D7o/A7CH2zL3ty', 'voter', 0, NULL, '2025-10-09 00:26:32', '2025-10-09 00:26:32'),
(96, 'AHMAD FAUZI', '252610098', 'X TM 2', '$2y$12$9sS2gWTDbuRVvsWi6D5XEuV82433F6EJnWNpi/7nqNTvg7YYt.5PK', 'voter', 0, NULL, '2025-10-09 00:26:33', '2025-10-09 00:26:33'),
(97, 'AKBAR JUNIARDI', '252610099', 'X TM 2', '$2y$12$JYYx33cKzep7ZVks.UtcCuMcufPyE6BOOtvl1tPSHLmOWwRgcepc6', 'voter', 0, NULL, '2025-10-09 00:26:33', '2025-10-09 00:26:33'),
(98, 'ALDI', '252610100', 'X TM 2', '$2y$12$Q98rbzNW4.uJuf3eSNT60eYkne8IaqukrOcllxjbuFcj9lHTH1Ylm', 'voter', 0, NULL, '2025-10-09 00:26:33', '2025-10-09 00:26:33'),
(99, 'BUNGA IRMA REFALIA', '252610101', 'X TM 2', '$2y$12$WFBR/NRGJQ/Epk9YoIxUzuZmwXudVy9knDYnmArkP7zRE0zAz4ttu', 'voter', 0, NULL, '2025-10-09 00:26:33', '2025-10-09 00:26:33'),
(100, 'DENIS', '252610102', 'X TM 2', '$2y$12$FafYSFkphkuOWPV07f4Z/./Vfv4nNNC379vXyMbd.7HFUhrCGf0T6', 'voter', 0, NULL, '2025-10-09 00:26:34', '2025-10-09 00:26:34'),
(101, 'DIDI FIRJATULLOH FADIB', '252610103', 'X TM 2', '$2y$12$r844BsXixK9yJrWpO9v/wOFPTK6k47kN3SAigFMZAVbNONbgZ82uW', 'voter', 0, NULL, '2025-10-09 00:26:34', '2025-10-09 00:26:34'),
(102, 'DIMAS HAFIDDUDIN', '252610104', 'X TM 2', '$2y$12$LEUG27wIagdMAESX4Z9og.ioiEboAHU.LEB3Ow5IL5/aIvO64XmZe', 'voter', 0, NULL, '2025-10-09 00:26:34', '2025-10-09 00:26:34'),
(103, 'DINI AMELIA PUTRI', '252610105', 'X TM 2', '$2y$12$SwvGVRlsH3SJ40KcxKF1ieulehxKo6lTshdn2kg6Wx.0hkR2tu4QO', 'voter', 0, NULL, '2025-10-09 00:26:35', '2025-10-09 00:26:35'),
(104, 'ENJELIKA APRIDA', '252610106', 'X TM 2', '$2y$12$IfsNv3o9O96exLUlohP71u5jhuHoMtI.0s3BfHHZr/.r/8AtvN50K', 'voter', 0, NULL, '2025-10-09 00:26:35', '2025-10-09 00:26:35'),
(105, 'FAISAL AKBAR', '252610107', 'X TM 2', '$2y$12$j7KJrF16xVV2ibw/22osKOQ00C0gJRe0l1KU8tRh5L6JZDP5Bfs36', 'voter', 0, NULL, '2025-10-09 00:26:35', '2025-10-09 00:26:35'),
(106, 'HAFID JULIANA', '252610109', 'X TM 2', '$2y$12$2.ZbrGu39MFLgQ5ITZ5VpuB7eEC8n8cgdWlWZzS6mEE/qtcXHLg/a', 'voter', 0, NULL, '2025-10-09 00:26:35', '2025-10-09 00:26:35'),
(107, 'IQBAL ALBIANSYAH', '252610110', 'X TM 2', '$2y$12$1hSvxlgwDm4ZxdZcLIZlE.CPsg7MOZWIrOB1By8MnNeCMK5oG7tIa', 'voter', 0, NULL, '2025-10-09 00:26:36', '2025-10-09 00:26:36'),
(108, 'IRWAN SAPUTRA', '252610111', 'X TM 2', '$2y$12$82GVzo12K9NgUkUhkpiyq.sOmNRZ.KS1d6J0uguDxeHLszS5YzUq6', 'voter', 0, NULL, '2025-10-09 00:26:36', '2025-10-09 00:26:36'),
(109, 'MUHAMAD FAZRI', '252610112', 'X TM 2', '$2y$12$2pQP5O7hgeJofuZT3lYGRuLDI4iVWjZY6LQK7p1Qtt7ty13HyLaWu', 'voter', 0, NULL, '2025-10-09 00:26:36', '2025-10-09 00:26:36'),
(110, 'MUHAMAD HUSAIN HAFIZHULLAH', '252610113', 'X TM 2', '$2y$12$dpdd3IlKOEZuVzb/HJ/CGO63BFgX5K3liTBVKLXCHb.xvuMd9SSPa', 'voter', 0, NULL, '2025-10-09 00:26:37', '2025-10-09 00:26:37'),
(111, 'MUHAMAD SOLEH ALFIKRI', '252610114', 'X TM 2', '$2y$12$j6096S2z1HE5mlBNoAfRee9QynqicWKVDRKGTZbWaDTrUGQy8pA26', 'voter', 0, NULL, '2025-10-09 00:26:37', '2025-10-09 00:26:37'),
(112, 'MUHAMMAD REFAN REPIS', '252610115', 'X TM 2', '$2y$12$4Q2617j5RDHuC/pC/AMStO3mRUPwe4Mhp3WQLao.qvgIKyf.RgtoG', 'voter', 0, NULL, '2025-10-09 00:26:37', '2025-10-09 00:26:37'),
(113, 'NIZAR NASIHUDIN', '252610116', 'X TM 2', '$2y$12$gjKbIWJHMr3TmQCKSKJhd.KEsvzUALz8ZPEjHNDI7zfTEGTTtBEcu', 'voter', 0, NULL, '2025-10-09 00:26:37', '2025-10-09 00:26:37'),
(114, 'RAHMAT MURTI UMAY PUTRA', '252610117', 'X TM 2', '$2y$12$X/62CQJbsQAfXIuRi8NHXORE9yA/N8QC67wB8xmBFSWMq2LvWdEK.', 'voter', 0, NULL, '2025-10-09 00:26:38', '2025-10-09 00:26:38'),
(115, 'REYHAN ABIDIN', '252610118', 'X TM 2', '$2y$12$cux0AQHwzWHlviHB9CnbGuVQQXecA8hDY5c1Wq1tQqdiFL4cem6qS', 'voter', 0, NULL, '2025-10-09 00:26:38', '2025-10-09 00:26:38'),
(116, 'REZA ARDIANSAH', '252610119', 'X TM 2', '$2y$12$brIXSosUHBJUKbGG41EvduFkVgSR2Rnj/JC/1iM6PlNFfHac9lqB2', 'voter', 0, NULL, '2025-10-09 00:26:38', '2025-10-09 00:26:38'),
(117, 'RHEDY AFRILIANS NUGRAHA', '252610120', 'X TM 2', '$2y$12$/osDpQTfwWUK5svfpKwIGuedL4pwU1Moef4YA17CxuJKtIt0XI/hO', 'voter', 0, NULL, '2025-10-09 00:26:39', '2025-10-09 00:26:39'),
(118, 'ROSALINDA', '252610121', 'X TM 2', '$2y$12$WCUFpjBjc1r4tL4OQqoqVOz1fRQR50neVa5TjBmovorg.7saiuyYS', 'voter', 0, NULL, '2025-10-09 00:26:39', '2025-10-09 00:26:39'),
(119, 'SITI MARYAM', '252610122', 'X TM 2', '$2y$12$cYvzvJLUN7JQacHBlRb8vOUxY7BraxLoBgxS26npM.hqqIHngSEz2', 'voter', 0, NULL, '2025-10-09 00:26:39', '2025-10-09 00:26:39'),
(120, 'SITI PAIDAH', '252610123', 'X TM 2', '$2y$12$5gCEyjm8uVkPXSxndT3Aoe9q23Uw8h/c66.ZIWpds4Mqir8olamWu', 'voter', 0, NULL, '2025-10-09 00:26:39', '2025-10-09 00:26:39'),
(121, 'SRI LESTARI', '252610124', 'X TM 2', '$2y$12$uRef6X/spA9ae1ZG9/6JPetASmQJEimYWuQGvBfWbqAkC772mDDce', 'voter', 0, NULL, '2025-10-09 00:26:40', '2025-10-09 00:26:40'),
(122, 'TRYO ABDULGONI', '252610125', 'X TM 2', '$2y$12$Y0vw/KsGjMpw4DcjSsMXT.OfsfLImgvjSmR.LFl0Ssr8iH0iwg8xG', 'voter', 0, NULL, '2025-10-09 00:26:40', '2025-10-09 00:26:40'),
(123, 'TUBAGUS NAWAWI', '252610126', 'X TM 2', '$2y$12$xO2kdGvfth6fKaoYr/rnE.Zo1u66huHtMZAjT0IZzeVD6iEaR3Zeu', 'voter', 0, NULL, '2025-10-09 00:26:40', '2025-10-09 00:26:40'),
(124, 'AHMAD FAUZI', '252610128', 'X TM 3', '$2y$12$Pg0lmL5q.ZlOc8bWPBfPwu0/IjkP22xHA43XCweLLeTPIdsbRcGUO', 'voter', 0, NULL, '2025-10-09 00:26:41', '2025-10-09 00:26:41'),
(125, 'AHMAD RIDWAN', '252610129', 'X TM 3', '$2y$12$LScWJWoI6th5C69BQNZXNuvP23y24Vj82nyOd/psYkMRF2kN/iLuG', 'voter', 0, NULL, '2025-10-09 00:26:41', '2025-10-09 00:26:41'),
(126, 'AHMAD RIFAI', '252610130', 'X TM 3', '$2y$12$1IM3zL9zN2D9TzwRnttsM.v/biucugMXTJO9w/EHECaJ3RyCW5uMS', 'voter', 0, NULL, '2025-10-09 00:26:41', '2025-10-09 00:26:41'),
(127, 'AKBAR MAULIANSYACH', '252610266', 'X TM 3', '$2y$12$C/z42E0Jb3FHb0F/ZG5NwONfFf/VdY1W.2j.LCBaxMvUXiMdBfQIC', 'voter', 0, NULL, '2025-10-09 00:26:41', '2025-10-09 00:26:41'),
(128, 'ANDINI', '252610132', 'X TM 3', '$2y$12$0Wfvf/8sRL4YICYPdNAqkOCcOhGxH.KpaFch0U1N0ZOt9IaHJ13UW', 'voter', 0, NULL, '2025-10-09 00:26:42', '2025-10-09 00:26:42'),
(129, 'AYU ADIRA', '252610133', 'X TM 3', '$2y$12$EK10g6fWpChVDemHxcwtW..CV1R5DjKPM.3/YDKFwD7DubcaskOqO', 'voter', 0, NULL, '2025-10-09 00:26:42', '2025-10-09 00:26:42'),
(130, 'CANDRA MAULANA', '252610134', 'X TM 3', '$2y$12$6qThJAZlIR7gT/3evhp.DOdcqDmcEMNF14TzXm0jHlQmXhACYuXS.', 'voter', 0, NULL, '2025-10-09 00:26:42', '2025-10-09 00:26:42'),
(131, 'CIKAL ERLANGGA', '252610267', 'X TM 3', '$2y$12$KoKRQnW6RUWvEIogL1fXOOffGELVh4rHfp55aVYEwMhRMigvJugJi', 'voter', 0, NULL, '2025-10-09 00:26:42', '2025-10-09 00:26:42'),
(132, 'DENI RIZKY PRATAMA', '252610136', 'X TM 3', '$2y$12$gQVHEplo7fPeqKd7kO6ncuupTVyg/N5yCsebpdXf/QegHkR4sbjeG', 'voter', 0, NULL, '2025-10-09 00:26:43', '2025-10-09 00:26:43'),
(133, 'FAHRI ALIF FADILLAH', '252610137', 'X TM 3', '$2y$12$Gb.iosYcsXFu4WmW.v074ec8hlpnyGTQzoFbxnrdfAHa/R0vj4X8a', 'voter', 0, NULL, '2025-10-09 00:26:43', '2025-10-09 00:26:43'),
(134, 'GALANG RAMDANI', '252610138', 'X TM 3', '$2y$12$lci27NFFxqFyXzwOi5QXjOuO.jMdqpbJIa54sWmVHQVCQ.M5LgaaW', 'voter', 0, NULL, '2025-10-09 00:26:43', '2025-10-09 00:26:43'),
(135, 'HADID SWARA GUMILANG', '252610139', 'X TM 3', '$2y$12$YDTQM/IIclweRwV.uxZEN.bA951v24o5NmXpoOkeeNmgZG2redhZu', 'voter', 0, NULL, '2025-10-09 00:26:44', '2025-10-09 00:26:44'),
(136, 'KARTIKA SARI', '252610140', 'X TM 3', '$2y$12$YiEp5y81f.u4sBEjHFkX4uLE0owkInjGCRWGshTsJjU6QURB9rUP2', 'voter', 0, NULL, '2025-10-09 00:26:44', '2025-10-09 00:26:44'),
(137, 'MARSHALL MILANIZT STILL Z', '252610141', 'X TM 3', '$2y$12$NOK7eTK2T5VClxHUNCLDA.syMQsJYWxRgtjauO3nMr8cYp93pelzi', 'voter', 0, NULL, '2025-10-09 00:26:44', '2025-10-09 00:26:44'),
(138, 'MEISYA EUIS SADIAH', '252610142', 'X TM 3', '$2y$12$1OqZhhbOTmPy..o.UYaaheC5OAx05mwi2EtoouAcnK0aU53QDvfvK', 'voter', 0, NULL, '2025-10-09 00:26:44', '2025-10-09 00:26:44'),
(139, 'MOHAMMAD ZEYAD', '252610143', 'X TM 3', '$2y$12$kuTvsD76tsGE0H0L6vhwu.rBz9IzTjw5p5nLZQD1wzLbQ4wN6kEva', 'voter', 0, NULL, '2025-10-09 00:26:45', '2025-10-09 00:26:45'),
(140, 'MUHAMAD FARHAN', '252610144', 'X TM 3', '$2y$12$Wetd.EQn2Ay0KpaTWwxe4.pRqTTHv2i39100AlX50X.3CJ4tzXA1K', 'voter', 0, NULL, '2025-10-09 00:26:45', '2025-10-09 00:26:45'),
(141, 'MUHAMAD IRFAN MAULANA', '252610145', 'X TM 3', '$2y$12$YrfMzuo8BngIqWPrk7i.je6twKkxM7zwHAggc6T1Ue7izFNNKBLRi', 'voter', 0, NULL, '2025-10-09 00:26:45', '2025-10-09 00:26:45'),
(142, 'MUHAMAD JIHAD ILMA ATTAMIMI', '252610146', 'X TM 3', '$2y$12$I9dxTgiUziaiFnQGi7GSuOKZUU4s3DVkeBCLQNCNhOWXbiHce2x/a', 'voter', 0, NULL, '2025-10-09 00:26:45', '2025-10-09 00:26:45'),
(143, 'MUHAMAD RIZKI', '252610147', 'X TM 3', '$2y$12$TeCfzHf2XGui/sz2MRLBweDW/C5LQprBK7OAAyj6diz9jwGtU7sxe', 'voter', 0, NULL, '2025-10-09 00:26:46', '2025-10-09 00:26:46'),
(144, 'MUHAMMAD ZAELANI', '252610148', 'X TM 3', '$2y$12$cMxqSABBR1QX.Bo5//bqAOv4uFSNnOvQl5Fl1Ts5.k/Ok3EuMyHJS', 'voter', 0, NULL, '2025-10-09 00:26:46', '2025-10-09 00:26:46'),
(145, 'NURJATI', '252610149', 'X TM 3', '$2y$12$ZzL.Dz.J7XLOQ2rmSDgCgOjEb1Ip32Ve62A6lPjq2SSMloLuk08Vi', 'voter', 0, NULL, '2025-10-09 00:26:46', '2025-10-09 00:26:46'),
(146, 'RAMADAN', '252610150', 'X TM 3', '$2y$12$jkhm1bx8id/lOOH3JbDXNe6K7D90wy2m5wAlGc/NYUajKWvqzjWNe', 'voter', 0, NULL, '2025-10-09 00:26:47', '2025-10-09 00:26:47'),
(147, 'RIFQI QHAIRUL HASAN', '252610151', 'X TM 3', '$2y$12$NKEEunz.0e9.k7UkPqtIce1Hs6r4Ql//jJkeDYmxVrxeYfQlFf8GC', 'voter', 0, NULL, '2025-10-09 00:26:47', '2025-10-09 00:26:47'),
(148, 'RIZKI NUR AL FAHRI', '252610152', 'X TM 3', '$2y$12$N0sv9DCNaEKVbxDF0mE.JOZHL585Usw1KkCuGPGPpYfSU9lMP/EgK', 'voter', 0, NULL, '2025-10-09 00:26:47', '2025-10-09 00:26:47'),
(149, 'SALSA NABILA', '252610153', 'X TM 3', '$2y$12$vbOdUymcvxUWuej6BlM01O6tolSNU7FNXqw34.c4InP5XKsDVvch.', 'voter', 0, NULL, '2025-10-09 00:26:47', '2025-10-09 00:26:47'),
(150, 'SITI HASANAH', '252610154', 'X TM 3', '$2y$12$9a0eYI5mtTM9eZzn5sbE3es/P4ETMmBCptLzBOlceX55Cbd3z3A3K', 'voter', 0, NULL, '2025-10-09 00:26:48', '2025-10-09 00:26:48'),
(151, 'SUHENDRA', '252610155', 'X TM 3', '$2y$12$b19ojFNfJJ3GL7cPMCRSt.8LYrPWs.n3IF7GYX3quzKpQ55bVTPBK', 'voter', 0, NULL, '2025-10-09 00:26:48', '2025-10-09 00:26:48'),
(152, 'AMELIA', '242510001', 'XI MPLB 1', '$2y$12$3YdJ1CErWrQEVG0uqnHMY.BqdEdKHaBn/fATYNYxYNpikqz7RCbri', 'voter', 0, NULL, '2025-10-09 00:33:49', '2025-10-09 00:33:49'),
(153, 'ANISA RHAMADANI', '242510306', 'XI MPLB 1', '$2y$12$2N.QqHkboM39bQPMuC0g1.amMg5xqqGHWFUYx.ON8ptA5FhIpxmdu', 'voter', 0, NULL, '2025-10-09 00:33:49', '2025-10-09 00:33:49'),
(154, 'AYU NINGRAT', '242510002', 'XI MPLB 1', '$2y$12$F6SL1Un9ybql/so9aDKuPek5yjwx.TTB2ZnJitnMdRW4IoABaAZPS', 'voter', 0, NULL, '2025-10-09 00:33:50', '2025-10-09 00:33:50'),
(155, 'CINDI LESTARI', '242510004', 'XI MPLB 1', '$2y$12$CNWMIf3k.emGhnos3y4q.enSJDi2Athc5bAmlrKaQUSX7p7O24x42', 'voter', 0, NULL, '2025-10-09 00:33:50', '2025-10-09 00:33:50'),
(156, 'CITRA SHABILA IRAWAN', '242510005', 'XI MPLB 1', '$2y$12$Peo4opXlNU5yqNEMN6Lmb.biKBeRu3gBI9tIaa7qjUYi9Kq81w7g.', 'voter', 0, NULL, '2025-10-09 00:33:50', '2025-10-09 00:33:50'),
(157, 'DENITA SARI', '242510006', 'XI MPLB 1', '$2y$12$oGS3dq66qz/Bhsv9yIcLLe5Qxss5y46.Xrke.Y/5aMYNLqP2NSQYq', 'voter', 0, NULL, '2025-10-09 00:33:51', '2025-10-09 00:33:51'),
(158, 'EVI NURAENDI', '242510008', 'XI MPLB 1', '$2y$12$I3TVScThtex6Y6aKqkt56uetQj0.Ug.QxVR0F36eSiwb6I0M3LkPC', 'voter', 0, NULL, '2025-10-09 00:33:51', '2025-10-09 00:33:51'),
(159, 'INTAN LESTARI', '242510011', 'XI MPLB 1', '$2y$12$TrO0fad2f/PjR.cctrirb.5ijisR8MdtKcHRqNKiHZmsNUHsXNzXy', 'voter', 0, NULL, '2025-10-09 00:33:51', '2025-10-09 00:33:51'),
(160, 'INTAN RASJI RAMADHANY', '242510012', 'XI MPLB 1', '$2y$12$w1DpYndadbmBvwn8Z9uNiu7Wj.C38rv6OZNTf5PMgzhWIQxcHZ1NW', 'voter', 0, NULL, '2025-10-09 00:33:51', '2025-10-09 00:33:51'),
(161, 'KARLINA', '242510013', 'XI MPLB 1', '$2y$12$/m2Jv0f8I.pNLJG.8OvgOOeIGZbSBfrQHr6M9bk2G79hLL56abkx6', 'voter', 0, NULL, '2025-10-09 00:33:52', '2025-10-09 00:33:52'),
(162, 'KURNIA', '242510014', 'XI MPLB 1', '$2y$12$Ik6G5AdfuPC4eiiJ6.ua8elNLt1wOp74gIl6ZJDM8dTIMEB6HD/72', 'voter', 0, NULL, '2025-10-09 00:33:52', '2025-10-09 00:33:52'),
(163, 'MAHENDRA', '242510015', 'XI MPLB 1', '$2y$12$dLPKGhjTEnsOaXBORuzoGejR8wZMj/a5zDoqIxaKYSZkvaU6UGQ/K', 'voter', 0, NULL, '2025-10-09 00:33:52', '2025-10-09 00:33:52'),
(164, 'MARPUAH', '242510016', 'XI MPLB 1', '$2y$12$IkAZ/KP3FRHQiBioDqwI.eIwjkDHaYzNRRB5k7aQLLMfJujF66wge', 'voter', 0, NULL, '2025-10-09 00:33:52', '2025-10-09 00:33:52'),
(165, 'MAULANA ANSORI SURYANA', '242510088', 'XI MPLB 1', '$2y$12$i/.vMUViaPYEOymh34EQGu5oV5k1B8/yG9abxL6.WhH5Dd8viZdbi', 'voter', 0, NULL, '2025-10-09 00:33:53', '2025-10-09 00:33:53'),
(166, 'MAYLANI', '242510017', 'XI MPLB 1', '$2y$12$LkjW3DcICS05eBbVOtfxje.BJ6ig3Te6qmNiZTRvOi1Y5OcQ0rmCu', 'voter', 0, NULL, '2025-10-09 00:33:53', '2025-10-09 00:33:53'),
(167, 'MUHAMAD ADHI SATRIO', '242510018', 'XI MPLB 1', '$2y$12$OmhpKJZvV2BtBYxGYeCncODgmOZ8kfV.j/LcO7e85UA/h5Fmf8Sbu', 'voter', 0, NULL, '2025-10-09 00:33:54', '2025-10-09 00:33:54'),
(168, 'NUR SILVA OCTAVIA', '242510019', 'XI MPLB 1', '$2y$12$9VxRO2hs3Re9ZIHLAwQNl.EDw4iHaUXJPmv9Zo2/XYk0c2YnfYCSy', 'voter', 0, NULL, '2025-10-09 00:33:54', '2025-10-09 00:33:54'),
(169, 'NURMALA PUSPITASARI', '242510020', 'XI MPLB 1', '$2y$12$9eREBcYm.FakMQ17zVUDGO06nEVaMhKmaWh10J2z6D1GAgkPMNHjy', 'voter', 0, NULL, '2025-10-09 00:33:54', '2025-10-09 00:33:54'),
(170, 'QORIATUL FITRIYAH', '242510021', 'XI MPLB 1', '$2y$12$AsiolzNWomaaW.lmoXCcfeOh6xp/63i8PBvWV0z03L/QtkbIOXlsu', 'voter', 0, NULL, '2025-10-09 00:33:55', '2025-10-09 00:33:55'),
(171, 'RAHMA PUSPITASARI', '242510022', 'XI MPLB 1', '$2y$12$ev7v4n1.No72p5fTW9MTbOPN1mJdVDVtKJ4fu0WvGa2bh0r/MlxLG', 'voter', 0, NULL, '2025-10-09 00:33:55', '2025-10-09 00:33:55'),
(172, 'RISKA APRILIA', '242510023', 'XI MPLB 1', '$2y$12$8J6zJquC7P9yHuaFNSqPu.DTMvR8E9Te507XFG.bpnGFOvns4Cpcy', 'voter', 0, NULL, '2025-10-09 00:33:55', '2025-10-09 00:33:55'),
(173, 'RISMAYANTI', '242510024', 'XI MPLB 1', '$2y$12$AAsBf6GRPm4lpZ69uG4ym.SzaJ9fPImp1KZ/IMkgswVbEY9hsSqo6', 'voter', 0, NULL, '2025-10-09 00:33:55', '2025-10-09 00:33:55'),
(174, 'SARAH INDRIYANTI', '242510025', 'XI MPLB 1', '$2y$12$KTqDmyCWlaRqfU6P9ggB2OnJLOalGwMzvy9JmhQ7XDblP7p7B9rWi', 'voter', 0, NULL, '2025-10-09 00:33:56', '2025-10-09 00:33:56'),
(175, 'SITI JAHROTULSYITTA', '242510026', 'XI MPLB 1', '$2y$12$FzBNB0NYzAkUW2SjtsIchev/bK5g5DiZHTLR0YXqawy6mpARSm2c2', 'voter', 0, NULL, '2025-10-09 00:33:56', '2025-10-09 00:33:56'),
(176, 'SITI NURHASANAH', '242510027', 'XI MPLB 1', '$2y$12$qYU6lX.xg7I082iTSXRvKuB24c1YkIdmIYu.lbnmgRqXz7l0Ome8K', 'voter', 0, NULL, '2025-10-09 00:33:56', '2025-10-09 00:33:56'),
(177, 'SITI NURPADILAH', '242510028', 'XI MPLB 1', '$2y$12$Y3tIi3DI.3lMD73v1CNL8.C005tsF5VRsyI4vlWvYlVV0TTXtGVL.', 'voter', 0, NULL, '2025-10-09 00:33:57', '2025-10-09 00:33:57'),
(178, 'SITI SALAMAH', '242510034', 'XI MPLB 1', '$2y$12$5FaC/6sbnItT.zs336TAwunAI.ZlV2PULXc8THrHprX8575HgDwbG', 'voter', 0, NULL, '2025-10-09 00:33:57', '2025-10-09 00:33:57'),
(179, 'SITI ZENAB', '242510035', 'XI MPLB 1', '$2y$12$BbCUQweM7O9HXecaqaz7DekyuaeiEuOY5.k.ltHNqOD03SGkfbuhC', 'voter', 0, NULL, '2025-10-09 00:33:57', '2025-10-09 00:33:57'),
(180, 'SYAVIRA DWI NOVIANTI', '242510029', 'XI MPLB 1', '$2y$12$NDPN5h8KvHQu.tj7pNrnNu7UUSJx6DCebZas0jISOt5PZ/WpjfH4q', 'voter', 0, NULL, '2025-10-09 00:33:57', '2025-10-09 00:33:57'),
(181, 'SYIFAUDZIHNI', '242510030', 'XI MPLB 1', '$2y$12$3tPM8qwhpeH9AcOnhco3DeiiNNr/WgKwSKyikhJ9OtmGiGtt/1cVq', 'voter', 0, NULL, '2025-10-09 00:33:58', '2025-10-09 00:33:58'),
(182, 'TASYA ANANDA', '242510031', 'XI MPLB 1', '$2y$12$//wYYccIJYwoLgG.oMEvOON2FzLRifCfm/o7yyFqgy0L.gY8oZop6', 'voter', 0, NULL, '2025-10-09 00:33:58', '2025-10-09 00:33:58'),
(183, 'TIKA DEWI', '242510032', 'XI MPLB 1', '$2y$12$JfmDVdFC4wcG/DHPkmynruIRhCvzoQ87RpjASWxpG8oAEtQkxySaO', 'voter', 0, NULL, '2025-10-09 00:33:58', '2025-10-09 00:33:58'),
(184, 'WILDA CAHYANI', '242510033', 'XI MPLB 1', '$2y$12$XVMjNfAXIIlUyIEuTZMBxeDyESvdxWbn8RkBdsMxVbY6tvymzpFIy', 'voter', 0, NULL, '2025-10-09 00:33:59', '2025-10-09 00:33:59'),
(185, 'AISAH WALINAYAH', '242510036', 'XI MPLB 2', '$2y$12$Eg2AGrI4uQ30BSTF7Qu5n.tSZcPQ5sISIMOdi8W3PlDaS2M1Ip9YO', 'voter', 0, NULL, '2025-10-09 00:33:59', '2025-10-09 00:33:59'),
(186, 'ANGGUN DARA CANTIKA', '242510037', 'XI MPLB 2', '$2y$12$TQEIHM6zp8cR8okcAyjlvuutxD0zcDWWcqPacrRHc.797lVLcIey.', 'voter', 0, NULL, '2025-10-09 00:33:59', '2025-10-09 00:33:59'),
(187, 'APRILIANI', '242510038', 'XI MPLB 2', '$2y$12$rfeaE2TounD/CAFKIcyPFe0VtTcMjvwLvex0JAWQd0P/eHWfRJONu', 'voter', 0, NULL, '2025-10-09 00:33:59', '2025-10-09 00:33:59'),
(188, 'ARUM', '242510039', 'XI MPLB 2', '$2y$12$mHaKyL3Cn50awuG7E/unLeochjrhqmlgTrT9I362yU/.cpNROO7ou', 'voter', 0, NULL, '2025-10-09 00:34:00', '2025-10-09 00:34:00'),
(189, 'CITRA NURY RAHMAN', '242510040', 'XI MPLB 2', '$2y$12$IgWq0x88P8mKD7HSC.BiCutDYVVcRQ8.eXdK5EWxMU0QGpxArLUym', 'voter', 0, NULL, '2025-10-09 00:34:00', '2025-10-09 00:34:00'),
(190, 'DEDEH FAUZIYAH', '242510041', 'XI MPLB 2', '$2y$12$QG65vZ9Enb7WqEQaA6KYq.0ept8hYVcAf5ynxkyh8wHXkr/7pQsM2', 'voter', 0, NULL, '2025-10-09 00:34:00', '2025-10-09 00:34:00'),
(191, 'DEVI YULIANI KUSMANTO', '242510042', 'XI MPLB 2', '$2y$12$IQ7jo0dFY.P2nCAuEpfbSeFlfZ/DmYyfhhVWqVsQGvPwOK7nMO7rK', 'voter', 0, NULL, '2025-10-09 00:34:01', '2025-10-09 00:34:01'),
(192, 'DINDA LESTARI', '242510043', 'XI MPLB 2', '$2y$12$vLjeCGHeuTYzofxKHpODFuWuPbasuG3M4p9I3NurIgz2B0oHwMGJG', 'voter', 0, NULL, '2025-10-09 00:34:01', '2025-10-09 00:34:01'),
(193, 'ERNAWATI', '242510044', 'XI MPLB 2', '$2y$12$5tC9QMiOg2r4/mXxmWmJfuWVGwbsKpG4E77EolSc7zI1L1GZsEQMm', 'voter', 0, NULL, '2025-10-09 00:34:01', '2025-10-09 00:34:01'),
(194, 'INAYAH', '242510046', 'XI MPLB 2', '$2y$12$i76gRldHm34SJ/F2lCyoauTuRliXZ22tHIZ0plLFu9QjhMmZgH6P.', 'voter', 0, NULL, '2025-10-09 00:34:01', '2025-10-09 00:34:01'),
(195, 'LAILA', '242510048', 'XI MPLB 2', '$2y$12$q0I8qr6SdRDtZrTaS8TTy.yNJ1cYPd0JPVZdRo3MvQ0iE9rchljjG', 'voter', 0, NULL, '2025-10-09 00:34:02', '2025-10-09 00:34:02'),
(196, 'LUTIKA SUNDAWA', '242510049', 'XI MPLB 2', '$2y$12$v2vRgA97D99vtIXObpMTLe4XqxBTr0rM7uI4xgwG7z/OXcEgbKZd2', 'voter', 0, NULL, '2025-10-09 00:34:02', '2025-10-09 00:34:02'),
(197, 'MAULIDDIVA NAWWAROH', '242510050', 'XI MPLB 2', '$2y$12$xSq3ZshJ3C4uG1lztnsTuet5npBnepm/DyEGjGfxWwegZamgYtG8G', 'voter', 0, NULL, '2025-10-09 00:34:02', '2025-10-09 00:34:02'),
(198, 'MAYA MAESAROH', '242510051', 'XI MPLB 2', '$2y$12$UH90B8qfUKXyhQp8NXfcY.EJoDNISpKA1EdK3jJbHedDiEaHzKba6', 'voter', 0, NULL, '2025-10-09 00:34:03', '2025-10-09 00:34:03'),
(199, 'MELYANI', '242510052', 'XI MPLB 2', '$2y$12$qqbq7yENuGGmvIp140.45e7CDk1/WQtFEztR4tB2iCXpZb1jTMWSa', 'voter', 0, NULL, '2025-10-09 00:34:03', '2025-10-09 00:34:03'),
(200, 'MIA BIATUL QOYA', '242510053', 'XI MPLB 2', '$2y$12$NMcR4ScgbL/J3yLalaCg6O57QoNQnfdPIorrz7yI7EYRZIbyxqBIm', 'voter', 0, NULL, '2025-10-09 00:34:03', '2025-10-09 00:34:03'),
(201, 'MUHAMMAD RAFFA RODIYANA', '242510054', 'XI MPLB 2', '$2y$12$AJvouePOsNSMfn2tf7JL2ORZ7CN/K53Bm8avPTKrm80eLToWDz5aC', 'voter', 0, NULL, '2025-10-09 00:34:03', '2025-10-09 00:34:03'),
(202, 'NAJWA FITRIA AZZAHRA', '242510055', 'XI MPLB 2', '$2y$12$033l387rfNfBvDPoJj.FjuKr.x0N9y9gta2ViCiRjgxuOV0L3xoja', 'voter', 0, NULL, '2025-10-09 00:34:04', '2025-10-09 00:34:04'),
(203, 'NINING NURFALAH', '242510056', 'XI MPLB 2', '$2y$12$c08L3mFhrqrsc1afHmm4EuetanhMAhUdhXyoGgES3dOGb/QeiAfme', 'voter', 0, NULL, '2025-10-09 00:34:04', '2025-10-09 00:34:04'),
(204, 'NORMAN HIDAYATULLAH', '242510057', 'XI MPLB 2', '$2y$12$..19fmNI/lPU/8uwGMNXxuwOt6dkx8R2guF16wW.ByUxN2TgTkCKO', 'voter', 0, NULL, '2025-10-09 00:34:04', '2025-10-09 00:34:04'),
(205, 'NOVI SEPTIANA RAHMADANI', '242510058', 'XI MPLB 2', '$2y$12$S81Ev9jP//gzU9N6NO6GE.yMpic1KQFr8wGIj4dyTv/F8jEnMkTxe', 'voter', 0, NULL, '2025-10-09 00:34:04', '2025-10-09 00:34:04'),
(206, 'NURMALA', '242510059', 'XI MPLB 2', '$2y$12$p2KdTvSp/FHEXommZd12OO4Acb8.36HLP8BEgnwh7sGF8jUTuj9Te', 'voter', 0, NULL, '2025-10-09 00:34:05', '2025-10-09 00:34:05'),
(207, 'PUTRI SALSABELA', '242510060', 'XI MPLB 2', '$2y$12$SCpsOYdnOyxAi3/F8dc5GuqI4Juug76kQJ114ZN5cJKM1HP3wpE.2', 'voter', 0, NULL, '2025-10-09 00:34:05', '2025-10-09 00:34:05'),
(208, 'RANI', '242510061', 'XI MPLB 2', '$2y$12$lOvsKdUK.KPZ52hPTYp3FuAedAUvdOnOPfHOgJZp9aRN.TUIPyURC', 'voter', 0, NULL, '2025-10-09 00:34:05', '2025-10-09 00:34:05'),
(209, 'RIRIN EKAWATI', '242510062', 'XI MPLB 2', '$2y$12$7YTYiMeA6Dgs38qx6B2ppOQ6gJqsnxnL3D/rD1NJe1TA98lo5tKUW', 'voter', 0, NULL, '2025-10-09 00:34:06', '2025-10-09 00:34:06'),
(210, 'SARASWATI', '242510063', 'XI MPLB 2', '$2y$12$dCNEQks57.QHx3T590Q4Y.8jI4ITuc9bNEvt90d0PRY.u7JdV4PdW', 'voter', 0, NULL, '2025-10-09 00:34:06', '2025-10-09 00:34:06'),
(211, 'SITI NURJAMILAH', '242510065', 'XI MPLB 2', '$2y$12$OpLmBXxPwSCXwmnxyNMC6uz4pSr7vbAJbuMP.gPINd6pAzFJi7Fje', 'voter', 0, NULL, '2025-10-09 00:34:06', '2025-10-09 00:34:06'),
(212, 'WIWIN NURMAULIDA', '242510066', 'XI MPLB 2', '$2y$12$bRlYasCTPIw8I7Wzyqx3n.dT2AtUiUHm69LnrV6TdGiSKrjYmyqeq', 'voter', 0, NULL, '2025-10-09 00:34:06', '2025-10-09 00:34:06'),
(213, 'WULAN SARI', '242510067', 'XI MPLB 2', '$2y$12$ya3rH5VZqbu3.TSdadX7yO7FZl1bK9IVtrO6FE.Z5CgKJntty/NNS', 'voter', 0, NULL, '2025-10-09 00:34:07', '2025-10-09 00:34:07'),
(214, 'ZAHRA AYUMI', '242510068', 'XI MPLB 2', '$2y$12$/7dPqxCR.uatZ61kBBl.pOoDhi/1te/SyNvNi0ztQCBB1GSLjhR7G', 'voter', 0, NULL, '2025-10-09 00:34:07', '2025-10-09 00:34:07'),
(215, 'ZAHWA AENURROHMAH', '242510070', 'XI MPLB 2', '$2y$12$XODC0fhXftt2BR5/rfcPZuyVWAF6sv2YvkLOQCLKdBfNdKIC7r81W', 'voter', 0, NULL, '2025-10-09 00:34:07', '2025-10-09 00:34:07'),
(216, 'ABDUL SODIK', '242510071', 'XI TM 1', '$2y$12$NLgxINo/lkDmno.RkxhGb.gCQLlExyusTfM2AcUqiNfJp8oh1UlFu', 'voter', 0, NULL, '2025-10-09 00:34:08', '2025-10-09 00:34:08'),
(217, 'AGNAN HAMBALI', '242510072', 'XI TM 1', '$2y$12$uSPbW/KoxCpKhZhdREv1vOqGLfovRA3fDSRzzUCPfWDAJALo8Q/fG', 'voter', 0, NULL, '2025-10-09 00:34:08', '2025-10-09 00:34:08'),
(218, 'AGUS MULYANA', '242510073', 'XI TM 1', '$2y$12$M3rBwAHrjEziG9aPI1L1qe2N75ukK7iR1CM1nx5xU3YDYt6.upF4G', 'voter', 0, NULL, '2025-10-09 00:34:08', '2025-10-09 00:34:08'),
(219, 'AKBAR DHANI', '242510074', 'XI TM 1', '$2y$12$sOSF4ikj/vPhGC/vGa982e2k7lwPPxbKi1jjNTcXWfincILP9br5O', 'voter', 0, NULL, '2025-10-09 00:34:08', '2025-10-09 00:34:08'),
(220, 'ALDI FAUZAN', '242510075', 'XI TM 1', '$2y$12$eY1dBn69m9I4cTuu/4T9..dSQJnJzZXybQP7Yx7KinaTj22DV3wqK', 'voter', 0, NULL, '2025-10-09 00:34:09', '2025-10-09 00:34:09'),
(221, 'ALDIEN AKBAR', '242510076', 'XI TM 1', '$2y$12$S1uc7bgxUfogxN6rUUyxDevcok.6sMBkBwQj13g7U4QE5jjlNv0JG', 'voter', 0, NULL, '2025-10-09 00:34:09', '2025-10-09 00:34:09'),
(222, 'ALPI SAEPUL AKBAR', '242510077', 'XI TM 1', '$2y$12$ZNetfrLtR8ws0lWhQ3NTpeJjHsQFTKmivvDhLAF14u4MDabg7r7l6', 'voter', 0, NULL, '2025-10-09 00:34:09', '2025-10-09 00:34:09'),
(223, 'ANDIKA SYAPUTRA', '242510078', 'XI TM 1', '$2y$12$289JsXOKLjXvwcdrbi4Is.oNHJz0h3Eh7tn2Bs6q6cdNn3pDBcWNe', 'voter', 0, NULL, '2025-10-09 00:34:10', '2025-10-09 00:34:10'),
(224, 'AYOM PRAYOGA', '242510079', 'XI TM 1', '$2y$12$PhK7TgZobiRYKSLnrwz99euXIluiPnTnbZgzJ84CUtaO6PkbIRtuu', 'voter', 0, NULL, '2025-10-09 00:34:10', '2025-10-09 00:34:10'),
(225, 'CAHYONO MAULANA', '242510080', 'XI TM 1', '$2y$12$dpJ8kpke3eRaQX4rJNU1nOt7L0DY5F/s6HZQTtIvvk6GIlimiZvlW', 'voter', 0, NULL, '2025-10-09 00:34:10', '2025-10-09 00:34:10'),
(226, 'DIMAS PRADIPTA FUDHOLI', '242510082', 'XI TM 1', '$2y$12$iAM25hB8ZG5eRrN98VI4quX5KvuYxWoBuKah7PibirQ5eW9UzWBbS', 'voter', 0, NULL, '2025-10-09 00:34:11', '2025-10-09 00:34:11'),
(227, 'EKA RAMDANI JUNAEDI', '242510083', 'XI TM 1', '$2y$12$EuqvqtnM0AA1qCr2lFqrLOsWurxeOkvEZ2u4snCIQ0uHHNo5sktbO', 'voter', 0, NULL, '2025-10-09 00:34:11', '2025-10-09 00:34:11'),
(228, 'EVA NURAENDI', '242510084', 'XI TM 1', '$2y$12$A0ShRJqsBI008cxpsMPOBet2h4w78K1DDzLgWZSmBWM0YH78a9NFS', 'voter', 0, NULL, '2025-10-09 00:34:11', '2025-10-09 00:34:11'),
(229, 'GENTA TENGGARA BADAY', '242510085', 'XI TM 1', '$2y$12$LuhYDQ4m87sqfu7gGqeCWeETQ4V3Ocg6SDx2ffoJES7no/b0bTa9C', 'voter', 0, NULL, '2025-10-09 00:34:12', '2025-10-09 00:34:12'),
(230, 'INTAN NURJANAH', '242510086', 'XI TM 1', '$2y$12$Onb/24zIrxkk36HQr/t6jOZgday2yE8ZWZ9JALd0r4TX4v.nyj8GC', 'voter', 0, NULL, '2025-10-09 00:34:12', '2025-10-09 00:34:12'),
(231, 'IRPAN HERMAWAN', '242510087', 'XI TM 1', '$2y$12$TecVierj.Ly4kyhrHAx71.NWk6AlKqbZHeSQbxJ4toychVjriPpj6', 'voter', 0, NULL, '2025-10-09 00:34:12', '2025-10-09 00:34:12'),
(232, 'MUHAMAD YAHYA', '242510089', 'XI TM 1', '$2y$12$vFn.WN6fbUk7FjbyNnmmj.y3fsWq2koqeANjnHCtqUZQxfzDljmAq', 'voter', 0, NULL, '2025-10-09 00:34:13', '2025-10-09 00:34:13'),
(233, 'NABILA JULIANY', '242510090', 'XI TM 1', '$2y$12$Ub6we2eGH1FLFB977wgFGOAk6HjN/.yeVubB2oqhobGt5ePnZmhHK', 'voter', 0, NULL, '2025-10-09 00:34:14', '2025-10-09 00:34:14'),
(234, 'RAFI MAULANA LILAH', '242510091', 'XI TM 1', '$2y$12$nRSBTS0mK0XkDozD8lKcXu54bEQXVhmWT5yF7LSxy0o9QVFSvES46', 'voter', 0, NULL, '2025-10-09 00:34:14', '2025-10-09 00:34:14'),
(235, 'RAMA ALDIANSYAH', '242510092', 'XI TM 1', '$2y$12$9/lPMIMJmNkJyoJO6MhFwu9YbPlnVcTyX.mCdiNfEK1eF.PvYh2d.', 'voter', 0, NULL, '2025-10-09 00:34:14', '2025-10-09 00:34:14'),
(236, 'RAMA HERDIANSYAH', '242510093', 'XI TM 1', '$2y$12$MuRNsuA4rZWCPHBnQyykgunx3Rh5OpHH8IFY/0wOeGDhdV0Jf/0Ne', 'voter', 0, NULL, '2025-10-09 00:34:15', '2025-10-09 00:34:15'),
(237, 'REDI', '242510094', 'XI TM 1', '$2y$12$VLL8dsa7ymDmQoZyT16aKe4etB4kEBRo5JlEHKxollpY3Ql5JM6o6', 'voter', 0, NULL, '2025-10-09 00:34:15', '2025-10-09 00:34:15'),
(238, 'REGIA NANDA FEBRIATAMA', '242510298', 'XI TM 1', '$2y$12$NW3M9qrJop0yfW5Lo/lyxuiFF16DPju8iO7NiT23A6pS6wEXZWtKu', 'voter', 0, NULL, '2025-10-09 00:34:15', '2025-10-09 00:34:15'),
(239, 'RIFKI MULYANA', '242510096', 'XI TM 1', '$2y$12$HkyVIC/XBgIlaR20tm3a8OF.5KPs1ENzB8ohc6auWkm6vL515.c8O', 'voter', 0, NULL, '2025-10-09 00:34:15', '2025-10-09 00:34:15'),
(240, 'RIZKY ADITIYA', '242510097', 'XI TM 1', '$2y$12$ILtujU6Cg.saxqjKs9fTwu0HeUX1F5kUOmQO.f1.5dfO4uvOMOB8G', 'voter', 0, NULL, '2025-10-09 00:34:16', '2025-10-09 00:34:16'),
(241, 'RIZKY AZIZ MAULANA', '242510302', 'XI TM 1', '$2y$12$sGbB2IzqF5FPFjQ25orC1.hFH.aVkg66haXOdptjUWwLffXIf2FRy', 'voter', 0, NULL, '2025-10-09 00:34:16', '2025-10-09 00:34:16'),
(242, 'SITI MARIYAM', '242510098', 'XI TM 1', '$2y$12$rpAGOFOIcYqeExWrrda4J.zyuFpEyoE9.82ubI8jwYefqO/0wWtwy', 'voter', 0, NULL, '2025-10-09 00:34:16', '2025-10-09 00:34:16'),
(243, 'SYAHRILLA PERMATA NUSANTARA', '242510099', 'XI TM 1', '$2y$12$n.pWC9ZlJIgu7AN4xtSDW.3.nSFMHBl.eB55CfUlXBNeyJy6c2KBG', 'voter', 0, NULL, '2025-10-09 00:34:17', '2025-10-09 00:34:17'),
(244, 'WIDIYA ANISA PUTRI', '242510101', 'XI TM 1', '$2y$12$CTZhNkuV0VGz3vUAFV8lleFSzc2Z1J/fGBDnC7.1kj60ul1m8wVTa', 'voter', 0, NULL, '2025-10-09 00:34:17', '2025-10-09 00:34:17'),
(245, 'WINDY DANUARTA', '242510102', 'XI TM 1', '$2y$12$IbyFTgN2arCajuFfzsrw.eeH.6LIAt2OmNxqzDMFLxU64RGRQZa/i', 'voter', 0, NULL, '2025-10-09 00:34:17', '2025-10-09 00:34:17'),
(246, 'YUDI MULYANA', '242510103', 'XI TM 1', '$2y$12$LouJTj2rcn.8.RH8eqO.IOQb4N8Q7WVoj3Ar24dRdJVdYtO.UzvaG', 'voter', 0, NULL, '2025-10-09 00:34:18', '2025-10-09 00:34:18'),
(247, 'ADITTIYA SAPUTRA', '242510104', 'XI TM 2', '$2y$12$mRDeQBzkq4VPwDbawCmLMOiswqtuDZx9YG.GdX0GDehDrtpBVF/nK', 'voter', 0, NULL, '2025-10-09 00:34:19', '2025-10-09 00:34:19'),
(248, 'AFDAL ZIQRI RAMADAN', '242510105', 'XI TM 2', '$2y$12$Zm6AwhPCN6PdY/Jj85dxJuTtoe8fh6ySB1.N0AYnl7jk87xZjCx4S', 'voter', 0, NULL, '2025-10-09 00:34:19', '2025-10-09 00:34:19'),
(249, 'ANDIKA EKA SAPUTRA', '242510106', 'XI TM 2', '$2y$12$rkaeCXa99CTYexDh0NODee6KbGCnNuokY9kvYR3nvinljEws5yp9y', 'voter', 0, NULL, '2025-10-09 00:34:19', '2025-10-09 00:34:19'),
(250, 'ANGGUN RIANA PUTRI', '242510107', 'XI TM 2', '$2y$12$CELBxrVHsdrXjLp2D8I7Leh.z7tVuKofZcPpz5v.MZBvEEL3Rs2x6', 'voter', 0, NULL, '2025-10-09 00:34:20', '2025-10-09 00:34:20'),
(251, 'APRIZAL SUGANDA', '242510108', 'XI TM 2', '$2y$12$TOK0netHUPsfNnv2O.LvO..1AdmieaFOCZI5AgfOACyoFXBWEGgDm', 'voter', 0, NULL, '2025-10-09 00:34:20', '2025-10-09 00:34:20'),
(252, 'ARDIANSYAH', '242510109', 'XI TM 2', '$2y$12$8geVlzVS2d0HAOk0H8JiZeN1L8sQiU2pr9lQhH09aWHEsVWaj9sLO', 'voter', 0, NULL, '2025-10-09 00:34:20', '2025-10-09 00:34:20'),
(253, 'ARIF JUNAEDI ABDILAH', '242510110', 'XI TM 2', '$2y$12$nyqanJvKEvsY.UOKvNhgfuGApe/dnuYIhl5pANB2gBOW6Mp8DGcBK', 'voter', 0, NULL, '2025-10-09 00:34:21', '2025-10-09 00:34:21'),
(254, 'ASIAH NURAZIZAH', '242510111', 'XI TM 2', '$2y$12$6/XETvJFrbXrgxn.mvmt9OAJ7uQqbAbUUQ8.BZdwO2U8rWr89eGYO', 'voter', 0, NULL, '2025-10-09 00:34:21', '2025-10-09 00:34:21'),
(255, 'DIMAS', '242510112', 'XI TM 2', '$2y$12$F1QDKYREZBGZRSksJB5U3.fMA2tHfUYj3UncZdlPG5nRAADlEZ96O', 'voter', 0, NULL, '2025-10-09 00:34:21', '2025-10-09 00:34:21'),
(256, 'DIO PRATAMA', '242510113', 'XI TM 2', '$2y$12$GM8CFSuRTjJYUIkF9E3qLuKOPu6S78zkT7s.cGIubpyGL5G9KY1LK', 'voter', 0, NULL, '2025-10-09 00:34:21', '2025-10-09 00:34:21'),
(257, 'FACHRI MUHAMAD SOFYAN', '242510114', 'XI TM 2', '$2y$12$97gJ/ggvR.ADdgLsV8jvx.2eSW7MjAh9.o7E1FX6Rhsq9c.00rl2m', 'voter', 0, NULL, '2025-10-09 00:34:22', '2025-10-09 00:34:22'),
(258, 'FAHRI HAMDANI', '242510115', 'XI TM 2', '$2y$12$i7hYaNCz3VHSoHiuGmRlaOf7AG4jIcAciTgtZtUyv0cGixzqr3hyG', 'voter', 0, NULL, '2025-10-09 00:34:22', '2025-10-09 00:34:22'),
(259, 'FERRY SEM JULIANTO', '242510117', 'XI TM 2', '$2y$12$gG1LrWT9QU2Fl2..zYLmeOwGxy/5N771WodLkF1qXWGNeIVKbBBlG', 'voter', 0, NULL, '2025-10-09 00:34:22', '2025-10-09 00:34:22'),
(260, 'GUNAWAN GUNTUR', '242510118', 'XI TM 2', '$2y$12$N/AMfU2Smxr/Y8L3fRH41ehNn.v6Ahif.QNOyQYW8zn90kUdICmdK', 'voter', 0, NULL, '2025-10-09 00:34:23', '2025-10-09 00:34:23'),
(261, 'IRMAWATI', '242510119', 'XI TM 2', '$2y$12$Y/1HLujIlGKgRla30QBWR.cHNj2U9w4lpyAnXGLCtcm9UcImGRIMS', 'voter', 0, NULL, '2025-10-09 00:34:25', '2025-10-09 00:34:25'),
(262, 'ISMAIL NURJAYA', '242510121', 'XI TM 2', '$2y$12$7.YYHIK1i2A6Q4juzZGafOHst5JzHtl51GC.vQXNlwkF6hwXtDXlC', 'voter', 0, NULL, '2025-10-09 00:34:25', '2025-10-09 00:34:25'),
(263, 'LUTPIAH', '242510122', 'XI TM 2', '$2y$12$YFS08H6IuJzNkCFM9iPx.ekWJEBgcyC5QXKuL.I.59h2AlzdljF9u', 'voter', 0, NULL, '2025-10-09 00:34:26', '2025-10-09 00:34:26'),
(264, 'MUHAMAD FAIS', '242510123', 'XI TM 2', '$2y$12$wOASconTj0k.l77vlAmMh.VUf6bOcF27kJaFFGITll6NS54r0Ay2u', 'voter', 0, NULL, '2025-10-09 00:34:26', '2025-10-09 00:34:26'),
(265, 'MUHAMAD MUMIN', '242510124', 'XI TM 2', '$2y$12$swu5pKz6UvTsSkKJ4DBkJ.3PH1DQO7KGoSTJ7STLlZWxsZqkmK.Ea', 'voter', 0, NULL, '2025-10-09 00:34:26', '2025-10-09 00:34:26'),
(266, 'MUHAMAD NUSHA BADARI', '242510297', 'XI TM 2', '$2y$12$SWALzg5Pf1CwOVQd3K8Z3uT8Qly2ZUC7olEjb5uISpZ8MD2NYp8SW', 'voter', 0, NULL, '2025-10-09 00:34:27', '2025-10-09 00:34:27'),
(267, 'MUHAMMAD PALESTIN', '242510125', 'XI TM 2', '$2y$12$WP8H32m/.U/z2/PU5JHfJOhmXQtuqSMuQ7wVkJaumo/H0GVImk1.6', 'voter', 0, NULL, '2025-10-09 00:34:27', '2025-10-09 00:34:27'),
(268, 'MUHAMMAD RAFFI ALFARIS', '242510126', 'XI TM 2', '$2y$12$mMDfn4S3C.Jzl34VUtIyhu7wSPfMf67KWu3yLjMoTfdqUaBbuG1He', 'voter', 0, NULL, '2025-10-09 00:34:27', '2025-10-09 00:34:27'),
(269, 'MUHIDIN', '242510128', 'XI TM 2', '$2y$12$rW2OFA2iadBSRg4rwfnu.eUlBWKdH4F4ZCov2538fQlfaHNDMPkJa', 'voter', 0, NULL, '2025-10-09 00:34:27', '2025-10-09 00:34:27'),
(270, 'NURHAYATI', '242510129', 'XI TM 2', '$2y$12$v4s4mhj/UwMk05YQ4ZmsGOmG409x0csMikvzTPnpNsrQZf9E7FcHy', 'voter', 0, NULL, '2025-10-09 00:34:28', '2025-10-09 00:34:28'),
(271, 'NURSIAH', '242510130', 'XI TM 2', '$2y$12$R3UtVK5KldHOCogS0rKsyukUFntL4CbPa3qBMmzV/EidSRP/H4ELS', 'voter', 0, NULL, '2025-10-09 00:34:28', '2025-10-09 00:34:28'),
(272, 'ROHMANA', '242510132', 'XI TM 2', '$2y$12$WgKqheY3jcSsk9gFTijF1uS3V/Vq3Da77I/OHt1/vwU/mLnr6m9ze', 'voter', 0, NULL, '2025-10-09 00:34:28', '2025-10-09 00:34:28'),
(273, 'SYARIP NASRULLOH', '242510134', 'XI TM 2', '$2y$12$LPFVZSI2S.HJc/KWtPpZTO6XR51372hdowydYdormzYHhYAX3pJ0C', 'voter', 0, NULL, '2025-10-09 00:34:29', '2025-10-09 00:34:29'),
(274, 'TAMAMI', '242510135', 'XI TM 2', '$2y$12$.bQ3b7wTbjYi0Ekb/O7JI.WEcofN.LVHpqgorXCRS2hfvdYKDmJ/m', 'voter', 0, NULL, '2025-10-09 00:34:29', '2025-10-09 00:34:29'),
(275, 'ABDUL GANI', '242510136', 'XI TM 3', '$2y$12$gjL8FwXmSk8sbyIkXSjN4.EX0N8OAOZld9Uaf7b26lSp0aY2PFGdu', 'voter', 0, NULL, '2025-10-09 00:34:29', '2025-10-09 00:34:29'),
(276, 'AHMAD DANU', '242510137', 'XI TM 3', '$2y$12$tQsd4D9T0gT.EaJQxYqzyO6J/52tvmLfHrMKpUlL.6EML2Z8l.eLa', 'voter', 0, NULL, '2025-10-09 00:34:29', '2025-10-09 00:34:29'),
(277, 'ALMASUL ANAM', '242510138', 'XI TM 3', '$2y$12$1oG4EAnEvNFKyPZOEgSvnuOPGsYphVOVGvmiMaft0CaEC3RU3puWy', 'voter', 0, NULL, '2025-10-09 00:34:30', '2025-10-09 00:34:30'),
(278, 'APRIANSYAH KARIM', '242510139', 'XI TM 3', '$2y$12$zbu66n6jmKKv1W8lQLnNPOAR8Jeaxz300RnzNuXPs.5YogXMUFgCi', 'voter', 0, NULL, '2025-10-09 00:34:30', '2025-10-09 00:34:30'),
(279, 'APRIYANSYAH', '242510140', 'XI TM 3', '$2y$12$DBklSnD8c9w66syQ6H//8u7mJd205TEyQdGfs3P.ufyFX6kGDl2My', 'voter', 0, NULL, '2025-10-09 00:34:30', '2025-10-09 00:34:30'),
(280, 'ARYO SAPUTRA', '242510141', 'XI TM 3', '$2y$12$caeWL/sk4HSKt.fRMUMbaugYlH/m.g5yoq2r.WBF9byQE6tifDDBS', 'voter', 0, NULL, '2025-10-09 00:34:30', '2025-10-09 00:34:30'),
(281, 'BELA CANTIKA', '242510142', 'XI TM 3', '$2y$12$aW5k0iF2Pu8aE6gjYBo8A.wEOduR2SmDcd82YRfap3CwzyIvgXwgq', 'voter', 0, NULL, '2025-10-09 00:34:31', '2025-10-09 00:34:31'),
(282, 'CASTIMAN', '242510143', 'XI TM 3', '$2y$12$QXj3NrxpyeU5LmLrOMZLM.TMPj69wesLrENk1SlQCqW6pC/tI41ca', 'voter', 0, NULL, '2025-10-09 00:34:31', '2025-10-09 00:34:31'),
(283, 'DAVI BAHTIAR', '242510144', 'XI TM 3', '$2y$12$zqgcfCILfMRW3Ry/AU.pEOdTUtN/3bvO1z9XQR2zHAkpinCbI3QRC', 'voter', 0, NULL, '2025-10-09 00:34:31', '2025-10-09 00:34:31'),
(284, 'DELIMA', '242510145', 'XI TM 3', '$2y$12$oN35XIg/VMIf5qHVBEqABuuEiD06U/jgZ0vlJQ7J2SnR/XKxnrXYu', 'voter', 0, NULL, '2025-10-09 00:34:32', '2025-10-09 00:34:32');
INSERT INTO `users` (`id`, `name`, `username`, `class`, `password`, `role`, `has_voted`, `remember_token`, `created_at`, `updated_at`) VALUES
(285, 'EKO ADI SUCIPTO', '242510146', 'XI TM 3', '$2y$12$T8kS/u2wdqrP4xd3HZDH5Oc6Oi4EhLFjTCscNVruaoge5dhKnbEWK', 'voter', 0, NULL, '2025-10-09 00:34:32', '2025-10-09 00:34:32'),
(286, 'IBRAHIM SIDIK JAELANI', '242510147', 'XI TM 3', '$2y$12$R3bBd3akVkXM4yI05OBPiOt4qHCFWha8aGVAT9DnWsgwOBEaxzTqe', 'voter', 0, NULL, '2025-10-09 00:34:32', '2025-10-09 00:34:32'),
(287, 'ICANA', '242510148', 'XI TM 3', '$2y$12$Zy5hsvA0UQCLDSh9h8LiqeOxsuxietBkx/8QfB9b5n2150AgpGkiq', 'voter', 0, NULL, '2025-10-09 00:34:32', '2025-10-09 00:34:32'),
(288, 'IRPAN', '242510149', 'XI TM 3', '$2y$12$Aolm1ijNaP0IG0mZrbaagOAOivVLE0xuAmWgbBNftFX597H6l2N72', 'voter', 0, NULL, '2025-10-09 00:34:33', '2025-10-09 00:34:33'),
(289, 'KHAILA SABINA', '242510300', 'XI TM 3', '$2y$12$MLcLbmDNvx2azd.DescIw.zEm7BqupBBjFcsOTrRXQ0VNvep7NOgy', 'voter', 0, NULL, '2025-10-09 00:34:33', '2025-10-09 00:34:33'),
(290, 'MUHANAD ABDULHADI', '242510152', 'XI TM 3', '$2y$12$bospxdTcnugXQGRW3bZgC.Zn.Y97kT7ZtnH7ESjjAcVWKNjr5e/JS', 'voter', 0, NULL, '2025-10-09 00:34:33', '2025-10-09 00:34:33'),
(291, 'NURLELA APRIYANTI', '242510153', 'XI TM 3', '$2y$12$JOhscO4rl.XzywjlpmBY3u0aws6FBvCMiPZUOdT6bfLH4vCK0YIse', 'voter', 0, NULL, '2025-10-09 00:34:34', '2025-10-09 00:34:34'),
(292, 'PARIDHAH', '242510154', 'XI TM 3', '$2y$12$kOv3RXKrJupD/CjM1U6JoehJXwo8U5yW4pkRoJd51VBrBD54tqk.i', 'voter', 0, NULL, '2025-10-09 00:34:34', '2025-10-09 00:34:34'),
(293, 'PASA NUR PADILAH', '242510155', 'XI TM 3', '$2y$12$8K5kKGpDhyyoNGlv92yqoOGlfA2iGHJVtfwZAnRuki3NPRJpGyAAW', 'voter', 0, NULL, '2025-10-09 00:34:35', '2025-10-09 00:34:35'),
(294, 'RAISYA ADITIA', '242510156', 'XI TM 3', '$2y$12$cDAiitdoAb9OaiJUOyK3I.L3TJqhHBu5veIaPnu.M33qUIn68d/FW', 'voter', 0, NULL, '2025-10-09 00:34:36', '2025-10-09 00:34:36'),
(295, 'RANATA', '242510158', 'XI TM 3', '$2y$12$B1M3SiHPSMuDva0zRl6i6O3E55nGFPz1qU9bTaxoZC80Bk87Ac/Vu', 'voter', 0, NULL, '2025-10-09 00:34:36', '2025-10-09 00:34:36'),
(296, 'RAPI RIPANSYAH', '242510159', 'XI TM 3', '$2y$12$vEi5AupFejtmVvbaZOfINu5aP7HfTpXIy1LZy68tdd6mpg9bA.LgO', 'voter', 0, NULL, '2025-10-09 00:34:36', '2025-10-09 00:34:36'),
(297, 'RIPAT', '242510160', 'XI TM 3', '$2y$12$xFXvhMnjBuMBKZ7N3k/sQOzTBVzYXk8zLji272dWlZq2ZTYyoT2xq', 'voter', 0, NULL, '2025-10-09 00:34:37', '2025-10-09 00:34:37'),
(298, 'RIZIQ ABDUL WAHID', '242510162', 'XI TM 3', '$2y$12$jiKJfpq/dVF0nUNcZ9DG3OMJJ8eaMSdF179tBTh9kItRBEQqaEt2y', 'voter', 0, NULL, '2025-10-09 00:34:37', '2025-10-09 00:34:37'),
(299, 'SUCIKOH MAHARANI', '242510163', 'XI TM 3', '$2y$12$Fk1.rpFZIdQHLlNaczTvq.uSF7zypM4Y.jl2e6N/izz/Kh3.5xGFm', 'voter', 0, NULL, '2025-10-09 00:34:38', '2025-10-09 00:34:38'),
(300, 'SUKARDI', '242510164', 'XI TM 3', '$2y$12$TZD1HkaUbKGjBR9z2KdEb.5d1NJ4TWyKpH7ls2VVx/YPi5itnX0r.', 'voter', 0, NULL, '2025-10-09 00:34:38', '2025-10-09 00:34:38'),
(301, 'TIANI', '242510166', 'XI TM 3', '$2y$12$GFkeDLR9zpuLO1q.JKVflebfWPgjXgQU72jf0eGVlSNfWpQoeGyOS', 'voter', 0, NULL, '2025-10-09 00:34:38', '2025-10-09 00:34:38'),
(302, 'WAHAB TAJUDIN', '242510167', 'XI TM 3', '$2y$12$Ro21EZ3Ua5tEOXlfxNN2Auzn.fGHFqwkGcWO2sAdfkWBIoZFJLRoi', 'voter', 0, NULL, '2025-10-09 00:34:39', '2025-10-09 00:34:39'),
(303, 'SUTISNA PRATAMA', '252610156', 'X TM 3', '$2y$12$tVp77r0nmjC5WXzH6jI.5ehV0XttR6YUrJ.7Af8M4tZoDuSh.ri4W', 'voter', 0, NULL, '2025-10-09 00:39:26', '2025-10-09 00:39:26'),
(304, 'TEDI MAULANA', '252610157', 'X TM 3', '$2y$12$kdmZuvdsl6RCEovBqFkClOBvw7AHfVzB9CuHyaKJghVaFv1xZIG4q', 'voter', 0, NULL, '2025-10-09 00:39:26', '2025-10-09 00:39:26'),
(305, 'WAHYU SUPRIATNA', '252610158', 'X TM 3', '$2y$12$kKiiR3gdKpsLpqHZdWkTDOzSP86yohOjxDvGijMBa1XGP6YW3ZeG6', 'voter', 0, NULL, '2025-10-09 00:39:26', '2025-10-09 00:39:26'),
(306, 'WALID FAJAR RAMADHAN', '252610159', 'X TM 3', '$2y$12$QzvjBVOtTTKw/KHFW4GtdelZoFmwbYKKy6YIZi95eRZBcfGxyysBe', 'voter', 0, NULL, '2025-10-09 00:39:27', '2025-10-09 00:39:27'),
(307, 'YUSUP', '252610160', 'X TM 3', '$2y$12$9PV61XypAaml.Co7P.4k7eQS.axcHochs4PW/85S9F3gYcsr5GsuS', 'voter', 0, NULL, '2025-10-09 00:39:27', '2025-10-09 00:39:27'),
(308, 'ABDUL FIKRI', '252610161', 'X TM 4', '$2y$12$O2kiEh8r5PmmM2ik02qBZejxb/B3p5Sh/Mzk4ytQOufRNcMkKe5ay', 'voter', 0, NULL, '2025-10-09 00:39:27', '2025-10-09 00:39:27'),
(309, 'ADIL ALZULFA', '252610162', 'X TM 4', '$2y$12$G3PeiSKg7Z6OXhx5d6rFuueKmVHRYCUmvPXmFefJTz1k7igCuaXv6', 'voter', 0, NULL, '2025-10-09 00:39:27', '2025-10-09 00:39:27'),
(310, 'AGAM MADANI', '252610163', 'X TM 4', '$2y$12$n88NeteAizeMLe3cwoaeKeXtXwxlacgrVL3tMqb0M3uXfDCDv/RJa', 'voter', 0, NULL, '2025-10-09 00:39:28', '2025-10-09 00:39:28'),
(311, 'AGUS SAPUTRA', '252610268', 'X TM 4', '$2y$12$j6M5XtZM1b6N52lfUc07SO1vLmCVrtwVlbs92FnsOwVJEctxUKSpO', 'voter', 0, NULL, '2025-10-09 00:39:28', '2025-10-09 00:39:28'),
(312, 'AHMAD AZMI KHOERUNNIZAR', '252610165', 'X TM 4', '$2y$12$WvbRNzhh0rUyFPtIAecsned0kHhV1IMb38YwB5cXFVu0sQxrU2cCi', 'voter', 0, NULL, '2025-10-09 00:39:28', '2025-10-09 00:39:28'),
(313, 'AHMAD RIZKY KURNIAWAN', '252610166', 'X TM 4', '$2y$12$Ot881GAdFBPuM/4/S1I2MOetTcB4Qyu9TL50QfIJqoyVIpo1rNyWW', 'voter', 0, NULL, '2025-10-09 00:39:28', '2025-10-09 00:39:28'),
(314, 'AHMAD SYAFIQ', '252610167', 'X TM 4', '$2y$12$BmdEzNmB7CDPTbzm8XQrX.2.xwSjONjqVVSMxNPkExFg25nTid7D2', 'voter', 0, NULL, '2025-10-09 00:39:29', '2025-10-09 00:39:29'),
(315, 'ANGGA MAULANA', '252610168', 'X TM 4', '$2y$12$M4mg/6M4fwu/ioguXtlv6OVc4xWF6785Zy5bwxEPC.j1qgFtDr4Xq', 'voter', 0, NULL, '2025-10-09 00:39:29', '2025-10-09 00:39:29'),
(316, 'DENI KUSMANA', '252610169', 'X TM 4', '$2y$12$7ov0rlhBMTjFzlJ9cWx14ekI0RwxQuOSzFRgZNOCaBmcNe8vbt0pm', 'voter', 0, NULL, '2025-10-09 00:39:29', '2025-10-09 00:39:29'),
(317, 'DIANA RAHAYU', '252610170', 'X TM 4', '$2y$12$SfWA4ZK24sNOG9wXhIjUBu3Y9mcgpMEbGomwb2xnWE94Lx2HHxbpS', 'voter', 0, NULL, '2025-10-09 00:39:30', '2025-10-09 00:39:30'),
(318, 'EPITASARI', '252610171', 'X TM 4', '$2y$12$s/wyw0mzjSAxlv8G2e8nCe/tVOPQPOAsv7mX.YctzlOPw86vQrksu', 'voter', 0, NULL, '2025-10-09 00:39:30', '2025-10-09 00:39:30'),
(319, 'FARHANNABIL', '252610172', 'X TM 4', '$2y$12$5ET2f7pgwO0C0RhGr3cR8O6xg/8jsmRVK02j1v4MTulXPTmeGH4gO', 'voter', 0, NULL, '2025-10-09 00:39:30', '2025-10-09 00:39:30'),
(320, 'HABIL NUR ALDIN', '252610173', 'X TM 4', '$2y$12$95HyaxdeBpM26qPFsZfApeKMvFn5YmCJ8KSx.H6sPIBA9jXe6smK2', 'voter', 0, NULL, '2025-10-09 00:39:31', '2025-10-09 00:39:31'),
(321, 'KARDA PUTRA ADIANSYAH', '252610174', 'X TM 4', '$2y$12$kDa1.WPdPRMUZGwtG0obCu2r/f6fk07UuDx9JUAqJb02cvZAk8BbK', 'voter', 0, NULL, '2025-10-09 00:39:31', '2025-10-09 00:39:31'),
(322, 'MARYONO', '252610175', 'X TM 4', '$2y$12$8jFT3EJfMaoeQAZBSh17O.f4TEZJFigr5doIB0yNQOQPMJxpKx2SK', 'voter', 0, NULL, '2025-10-09 00:39:31', '2025-10-09 00:39:31'),
(323, 'MASITOH NURUL SYIFA', '252610176', 'X TM 4', '$2y$12$v9wL5wFkP0ECZuDgwxt4tOE.ap2F0Cf4RWV8TByaQ/QC77g149fr2', 'voter', 0, NULL, '2025-10-09 00:39:31', '2025-10-09 00:39:31'),
(324, 'MOHAMAD FAJAR ALFAZRY', '252610177', 'X TM 4', '$2y$12$3NM/0.qNzDRPf9QagP/1MeXBrxO1J8nD5WSgVePKtIYIQcsg.Uhkq', 'voter', 0, NULL, '2025-10-09 00:39:32', '2025-10-09 00:39:32'),
(325, 'MUHAMAD KHOLBY SAHIH', '252610178', 'X TM 4', '$2y$12$yNWmIey1eqp8HV7Zcy3Ky.r9jPBs4Rk0JDXw/u7XG5vzKWD27FZ4W', 'voter', 0, NULL, '2025-10-09 00:39:32', '2025-10-09 00:39:32'),
(326, 'MUHAMAD RIDWAN SAPII', '252610179', 'X TM 4', '$2y$12$NddGiSgQJ0x2oGHr8F.FDu4g/USriu7Nz7YvIfpfbOfjvBJmUzr7y', 'voter', 0, NULL, '2025-10-09 00:39:32', '2025-10-09 00:39:32'),
(327, 'MUHAMMAD ALDIANSYAH', '252610180', 'X TM 4', '$2y$12$kyOyq1Zln5y0aKI5lFTQDOHq/x6ILtx76PTquq6shEzWGSUW/cjVy', 'voter', 0, NULL, '2025-10-09 00:39:32', '2025-10-09 00:39:32'),
(328, 'MUHAMMAD RIDWAN AL KHADAFI', '252610181', 'X TM 4', '$2y$12$aNImWPT8DlxNYdpvywksf.e.8b6O9CbMdxcfYmy.XYXCmqamSBBsm', 'voter', 0, NULL, '2025-10-09 00:39:33', '2025-10-09 00:39:33'),
(329, 'NOVAL MALIKI', '252610182', 'X TM 4', '$2y$12$GkmtMdV5ZY/K8UGCWk4Tt.UNYajWCrUzsM5DsZSXPsbXE3J2M2HAy', 'voter', 0, NULL, '2025-10-09 00:39:33', '2025-10-09 00:39:33'),
(330, 'NURWULAN', '252610183', 'X TM 4', '$2y$12$ZiJ0ivvar4SUpadPj01ww.shURRVX5XYm/VuJHheyBWMXqqRGJTQ.', 'voter', 0, NULL, '2025-10-09 00:39:33', '2025-10-09 00:39:33'),
(331, 'OBAY SOBARNA', '252610269', 'X TM 4', '$2y$12$Lgz9LOeLDOV5FKnn7PX7ruSeMnwuxtpn7hWJnxLhuunPJPKRVYNCG', 'voter', 0, NULL, '2025-10-09 00:39:34', '2025-10-09 00:39:34'),
(332, 'PATONAH', '252610185', 'X TM 4', '$2y$12$FASq8JETntKgbGIbEWrAQut3e1CWaQ02/Hx2TgJdKwjuwi2WEOFSO', 'voter', 0, NULL, '2025-10-09 00:39:34', '2025-10-09 00:39:34'),
(333, 'RAGIL GOJALI', '252610186', 'X TM 4', '$2y$12$C8BqTgrzeS4hmy3uKaPPmeaSNd43KeVZJ9oPp6JtlRp4nhDELagxy', 'voter', 0, NULL, '2025-10-09 00:39:34', '2025-10-09 00:39:34'),
(334, 'RAJIF JULIAWAN', '252610187', 'X TM 4', '$2y$12$Te50/AbaOTVBE1jWAMyJ2eRbilz/OZNmfB1fqWPXThZgl6zDSx7Su', 'voter', 0, NULL, '2025-10-09 00:39:35', '2025-10-09 00:39:35'),
(335, 'RIO SUSANTO', '252610188', 'X TM 4', '$2y$12$8dE5m8WjCe1AzHSrt7wD4.lWA1xU2vQo/RHAFTm10wJLfdIrsqMaa', 'voter', 0, NULL, '2025-10-09 00:39:35', '2025-10-09 00:39:35'),
(336, 'RIZKY RAMDANI', '252610189', 'X TM 4', '$2y$12$.00.uorn4FKBvTTK8lMG5emX5cY1QXKlvpfhxHZ10v/P6suXOSDG2', 'voter', 0, NULL, '2025-10-09 00:39:35', '2025-10-09 00:39:35'),
(337, 'RUSLAN', '252610190', 'X TM 4', '$2y$12$Zbpsj3YLmLL3uUi4XNCKkuBctRPaVH.u7sq0lvG6tAqF1K7FhTg3q', 'voter', 0, NULL, '2025-10-09 00:39:35', '2025-10-09 00:39:35'),
(338, 'RYAN HIDAYAT', '252610191', 'X TM 4', '$2y$12$beOitbk9QWXJz0uFrMu2wO3VpH5CbRMhvQrl8BKxE0y02qbQDmmNu', 'voter', 0, NULL, '2025-10-09 00:39:36', '2025-10-09 00:39:36'),
(339, 'TAUPIK UROHMAN', '252610192', 'X TM 4', '$2y$12$wNptrRp0QsIuts4FJVlnGumvZNGb5JQCxXwxAfHVzmIBCtXJHELwW', 'voter', 0, NULL, '2025-10-09 00:39:36', '2025-10-09 00:39:36'),
(340, 'WILLIYANA ADISTIA', '252610193', 'X TM 4', '$2y$12$7LW0gMsAyODLHQ0GmltVTeE3mqQgGF7SisjM3ASg4Z//NR8Bb4GCW', 'voter', 0, NULL, '2025-10-09 00:39:36', '2025-10-09 00:39:36'),
(341, 'YUSUF RAMADAN', '252610194', 'X TM 4', '$2y$12$5Lu/nTuBmxJfxKAu.1i2zeeiMYYXORaXpBa7ss0MlVxMAcTGp7Fxi', 'voter', 0, NULL, '2025-10-09 00:39:37', '2025-10-09 00:39:37'),
(342, 'AHMAD GUNAWAN', '252610195', 'X TM 5', '$2y$12$QBHfy85722UgYBkL7PL28uF.9oyG6u.zxd.rhiPTZBE1YHARWsL0C', 'voter', 0, NULL, '2025-10-09 00:39:37', '2025-10-09 00:39:37'),
(343, 'AKBAR ALVIAN', '252610196', 'X TM 5', '$2y$12$0U/t9JtR30UZHPA7ttWkxu53xljf0zCW6G0rwN9mioDgtaYcFyFQS', 'voter', 0, NULL, '2025-10-09 00:39:37', '2025-10-09 00:39:37'),
(344, 'AL AZIS MUBAROK', '252610197', 'X TM 5', '$2y$12$il2.e96z8MoYS6bzOudn7ekIwnThbsPKWkx3BJf/G2E/zdLpY7EDa', 'voter', 0, NULL, '2025-10-09 00:39:37', '2025-10-09 00:39:37'),
(345, 'ALIF QIZWINI', '252610198', 'X TM 5', '$2y$12$wqv4HX6rcCFmMiRYsa8ZfuZj8HJwd/yFcTRwaSYrDLEaPv0Y3clrm', 'voter', 0, NULL, '2025-10-09 00:39:38', '2025-10-09 00:39:38'),
(346, 'CARSADI', '252610199', 'X TM 5', '$2y$12$w0tBG7TcFX9LVWk0Ai5PM.SH4z6RxGxdVsDfL.oKfSxuF4SJCtJ6.', 'voter', 0, NULL, '2025-10-09 00:39:38', '2025-10-09 00:39:38'),
(347, 'CHIKA RAHMAWATI', '252610200', 'X TM 5', '$2y$12$6UrtZYlffoOsFYmjvVxmHORmR7JSLiU7mZsRlgK7JfqryOxqVdDMK', 'voter', 0, NULL, '2025-10-09 00:39:38', '2025-10-09 00:39:38'),
(348, 'DEFNE MAULLANA EL SYARIF', '252610201', 'X TM 5', '$2y$12$KnHlnBdpi2P8ZDe86y2s1.YXMdZlfi8Lme3uWEnDwlss.E2nraTPm', 'voter', 0, NULL, '2025-10-09 00:39:39', '2025-10-09 00:39:39'),
(349, 'DEVI DESVITASARI', '252610202', 'X TM 5', '$2y$12$LBues91R92vh71siAUfbpuDAdUygy/ZxduPC8CEV6.6uoe3GCx56O', 'voter', 0, NULL, '2025-10-09 00:39:39', '2025-10-09 00:39:39'),
(350, 'DIKA NANDA', '252610203', 'X TM 5', '$2y$12$BvaLLl7juVWAZ5aCcj18q.e7tBq1u2KXgWzEbFdOpghCvpDeXh8qe', 'voter', 0, NULL, '2025-10-09 00:39:39', '2025-10-09 00:39:39'),
(351, 'EKA FEBRIANA', '252610204', 'X TM 5', '$2y$12$iHD/1Cazovp.Vc/4Wt6DN.zD2jVG9bYyJ.jq/f41Q1QuXDBqQKR2S', 'voter', 0, NULL, '2025-10-09 00:39:39', '2025-10-09 00:39:39'),
(352, 'GALANG FIRMANSYAH', '252610205', 'X TM 5', '$2y$12$CKShBhDGOS/kPz4zzXFzROtCZkJTdNG8/3iHQ5nLCsQyUrBGVSbWa', 'voter', 0, NULL, '2025-10-09 00:39:40', '2025-10-09 00:39:40'),
(353, 'HALIMATU ZAHRA', '252610206', 'X TM 5', '$2y$12$IwVBi76GjPzzdvzK8LeKduOuCSGrCkWtje9BPwvMP1heq35/cOWou', 'voter', 0, NULL, '2025-10-09 00:39:40', '2025-10-09 00:39:40'),
(354, 'HASBI ASHIDIQI', '252610270', 'X TM 5', '$2y$12$QSDWxAgoAooo14dNYTaQ1OOmc7Gs5dSeCXXwWHdhcSALLlsRUN.La', 'voter', 0, NULL, '2025-10-09 00:39:40', '2025-10-09 00:39:40'),
(355, 'HERDIYAN NUGRAHA', '252610208', 'X TM 5', '$2y$12$Cm8fg1qAkLy9erepYLbBIeJxiBYofz6nq5rKt7BD78v7NzPZtgK0S', 'voter', 0, NULL, '2025-10-09 00:39:41', '2025-10-09 00:39:41'),
(356, 'JEJE', '252610209', 'X TM 5', '$2y$12$JAmQP70OXT9y.n1TD7grM.VRigdpFKJJDME6.z7F8W2grKkQZl0CK', 'voter', 0, NULL, '2025-10-09 00:39:41', '2025-10-09 00:39:41'),
(357, 'MARINA F SIMATUPANG', '252610210', 'X TM 5', '$2y$12$ksq..L4gF84fygI1Z59OT.xEsNp4BguAJ4TEwSyzD6HG4FR1nrPsG', 'voter', 0, NULL, '2025-10-09 00:39:41', '2025-10-09 00:39:41'),
(358, 'MUHAMAD IHSAN MUBAROK', '252610211', 'X TM 5', '$2y$12$j5/SmuqPXX5vXzzy6Kv1Ze/A.PfZrbTsyzu8fY7vdArIXXxqd1bpi', 'voter', 0, NULL, '2025-10-09 00:39:41', '2025-10-09 00:39:41'),
(359, 'MUHAMAD IQBAL ALFAQIH', '252610212', 'X TM 5', '$2y$12$sJBC3oji3DCxiVI.LMa4cuZx4FpcRZ7GZ.7aSa3La41.1NWJem/WS', 'voter', 0, NULL, '2025-10-09 00:39:42', '2025-10-09 00:39:42'),
(360, 'MUHAMAD KAMAL', '252610213', 'X TM 5', '$2y$12$RHnP.DjfkY2I58fEBg592uUXkEQb0KvE4WNnMNF7EkzhphPeGOC/m', 'voter', 0, NULL, '2025-10-09 00:39:42', '2025-10-09 00:39:42'),
(361, 'MUHAMAD REHAN', '252610214', 'X TM 5', '$2y$12$ImMfgo65.J9lSFthpaSj.u7Hb3f74wOhqwAycOZTQ8d6kuRr3gO5W', 'voter', 0, NULL, '2025-10-09 00:39:42', '2025-10-09 00:39:42'),
(362, 'MUHAMMAD WAROSATUL AMBIYA', '252610215', 'X TM 5', '$2y$12$sB14YcSYpvW62m7wNKd6POu6zlhUJQlMDjF/0c0FqNLmC/eGwef0i', 'voter', 0, NULL, '2025-10-09 00:39:43', '2025-10-09 00:39:43'),
(363, 'NURFRIAN SYAHRONY', '252610216', 'X TM 5', '$2y$12$uhbUqDlCOaTEsDBizxRYQux5bqcNPz.7KkhvkbSzf9dabBR7AZCuG', 'voter', 0, NULL, '2025-10-09 00:39:43', '2025-10-09 00:39:43'),
(364, 'RAELAN MUTABAROQ', '252610217', 'X TM 5', '$2y$12$hUZ.ecpWziHGsREXExfAdeyCoLVglV3K/raiqJizIXltwYRKmpy62', 'voter', 0, NULL, '2025-10-09 00:39:43', '2025-10-09 00:39:43'),
(365, 'RAMLI', '252610218', 'X TM 5', '$2y$12$rk5a6/rV9PvDQy.Cp9aC.O6lwJQGLdKgCkW0YnNJC42J.W/g0jy4W', 'voter', 0, NULL, '2025-10-09 00:39:43', '2025-10-09 00:39:43'),
(366, 'RIFQIANSAH', '252610273', 'X TM 5', '$2y$12$Lkfm3grGku3IBzSIBo3rzu3LuoBZBctBhwVERryDf.TCd6oDd8jrW', 'voter', 0, NULL, '2025-10-09 00:39:44', '2025-10-09 00:39:44'),
(367, 'RINTO', '252610220', 'X TM 5', '$2y$12$sXQlsezu9HO62NwxjlePqeRhxC.a0bBDOTWLHrPTTpBUv/cblpHVG', 'voter', 0, NULL, '2025-10-09 00:39:45', '2025-10-09 00:39:45'),
(368, 'RISMA', '222307391', 'X TM 5', '$2y$12$YZSQlbDUp0HmRZlib9Yp2OOSeH8PedfPXGmOO/W0kfGYK8xxi85xS', 'voter', 0, NULL, '2025-10-09 00:39:45', '2025-10-09 00:39:45'),
(369, 'SIVA YULYANTI', '252610222', 'X TM 5', '$2y$12$T/6gM8osOE6vXSa3YGEiOeESYxDO/sR9woxBH7LlDGr0hMRfIVvr2', 'voter', 0, NULL, '2025-10-09 00:39:45', '2025-10-09 00:39:45'),
(370, 'SUHERMAN', '252610223', 'X TM 5', '$2y$12$5dv//g7.D.JXjocsUC4r.uH7SYTybh2b8SviinMLW4fXqR2Y6NHGS', 'voter', 0, NULL, '2025-10-09 00:39:46', '2025-10-09 00:39:46'),
(371, 'SUNANTA', '252610224', 'X TM 5', '$2y$12$fu8LKKbjpd8qYLknkTPxMO/e0hEgSqtgpU.ciP5wlcw9SR2RPf6s2', 'voter', 0, NULL, '2025-10-09 00:39:46', '2025-10-09 00:39:46'),
(372, 'SURYANI WIDYA PUTRI', '252610225', 'X TM 5', '$2y$12$4yEXW0Dw/sOa/QgwDvwNQuUp2af658SM6jdTz6DhCmI1JbeSuerz2', 'voter', 0, NULL, '2025-10-09 00:39:46', '2025-10-09 00:39:46'),
(373, 'ULFIA ANGGIA PUTRI', '252610226', 'X TM 5', '$2y$12$3MFJyPsb4B/SoFcooU1Td.CMPeyn7askkMD6dmCKCRn3GXfWr9ISm', 'voter', 0, NULL, '2025-10-09 00:39:46', '2025-10-09 00:39:46'),
(374, 'WARDI', '252610227', 'X TM 5', '$2y$12$yBaC81Vh1iLQifgbDkTvvODTxwXjKeVyKTb5SxDiNaGGOIWr39CGG', 'voter', 0, NULL, '2025-10-09 00:39:47', '2025-10-09 00:39:47'),
(375, 'WARDIMAN', '252610228', 'X TM 5', '$2y$12$6dHHeXORk/6qnrvO3oGituIJ.DKDXIkRn5ab5qxWPEn0Ucv04GXJe', 'voter', 0, NULL, '2025-10-09 00:39:47', '2025-10-09 00:39:47'),
(376, 'ZAHRAN MAHESWARI', '252610229', 'X TM 5', '$2y$12$pFrQXJz1mRBoc.l2cWWqjOgq9p6Eey5RyQx3sCpUv4xKBIxZkHlBm', 'voter', 0, NULL, '2025-10-09 00:39:47', '2025-10-09 00:39:47'),
(377, 'AHMAD RANDIKA', '252610230', 'X TM 6', '$2y$12$c6LneU1F0B9Yic/Q5cYyMO6cX4jnSVelxja6uHRnPCQJUlX8nSnQ2', 'voter', 0, NULL, '2025-10-09 00:39:47', '2025-10-09 00:39:47'),
(378, 'AHMAD SAEPUDIN', '252610231', 'X TM 6', '$2y$12$11uunpNPrnAKedlQR5tfg.ZKbTQbkN/Hdz7ZUB7XL7zB6k1l80Re2', 'voter', 0, NULL, '2025-10-09 00:39:48', '2025-10-09 00:39:48'),
(379, 'AHMAD SOFWAN ISMAIL', '252610232', 'X TM 6', '$2y$12$tN3G7MFxaG7qHMEiMikIkuG9fB9Ga1/QsVgb4pMt4SrbOcQIW1iEK', 'voter', 0, NULL, '2025-10-09 00:39:48', '2025-10-09 00:39:48'),
(380, 'ANDHIKA RAMADHAN', '252610271', 'X TM 6', '$2y$12$WJaaIPTdCCiapzf4.KkOAOfqBpnDazmAVEDwQ.80TRJYzuLASmzo.', 'voter', 0, NULL, '2025-10-09 00:39:48', '2025-10-09 00:39:48'),
(381, 'ANDIH SAEPUL BAHRI', '252610233', 'X TM 6', '$2y$12$9qhIfkdgwgLsHmsp.tvkLugE3dUHsKxqZALx/BCrnJ1OqlXH2zKsa', 'voter', 0, NULL, '2025-10-09 00:39:49', '2025-10-09 00:39:49'),
(382, 'ANDIKA PRATAMA', '252610234', 'X TM 6', '$2y$12$CO28uh72Wa2rekbfmr7fnuQAfRK2vvXDXke3l4QNytL0W4iJn71jm', 'voter', 0, NULL, '2025-10-09 00:39:49', '2025-10-09 00:39:49'),
(383, 'ARIYA DARMAWANSYAH', '252610235', 'X TM 6', '$2y$12$Ku1viEfp8BO5jg.49ga9zuaQ0gT181dk4k58CzMqtNMkSNBHF8ctW', 'voter', 0, NULL, '2025-10-09 00:39:49', '2025-10-09 00:39:49'),
(384, 'ARSYA NUR HARLY HASAN', '252610236', 'X TM 6', '$2y$12$RSYW/5Khv9KzQUHEcQY1CeltRyucdSchxCRWBU1tvjjNqOfItT1Bi', 'voter', 0, NULL, '2025-10-09 00:39:49', '2025-10-09 00:39:49'),
(385, 'BENI KURNIA', '252610237', 'X TM 6', '$2y$12$9c7T/NgO5Rl7cEkLCZ4Wo.sFhVovTTW8tgoQClc3CLrHFFnbnN7E.', 'voter', 0, NULL, '2025-10-09 00:39:50', '2025-10-09 00:39:50'),
(386, 'CANDRA AKBAR', '252610238', 'X TM 6', '$2y$12$M9myp8kfC9VGY4VcfmaGUezxn14NJfIIkRSfd0JvSpeq3PVcNELi6', 'voter', 0, NULL, '2025-10-09 00:39:50', '2025-10-09 00:39:50'),
(387, 'CINTIA', '252610239', 'X TM 6', '$2y$12$gyThp6EeAuZHZH6TN19RVO4/BVAyNmVroC0SHDXgnTHh5pqoZlXrG', 'voter', 0, NULL, '2025-10-09 00:39:50', '2025-10-09 00:39:50'),
(388, 'DEWI CUT NADIN', '252610240', 'X TM 6', '$2y$12$lc5mmX8MQb7ooWvZT7jXAeQr9TaBMZUeI8KEjtS0C8ZznNVjL9yxm', 'voter', 0, NULL, '2025-10-09 00:39:51', '2025-10-09 00:39:51'),
(389, 'DIKA BAEHAKI', '252610241', 'X TM 6', '$2y$12$.5m3w8/aumScaL6vhw27xu.NgLVLkYqSjEpUJuXD00htbB2slPx52', 'voter', 0, NULL, '2025-10-09 00:39:51', '2025-10-09 00:39:51'),
(390, 'DIMAS SETO', '252610272', 'X TM 6', '$2y$12$duhHutHruhfr/BGocHK5U.ENUhIkLM0CrlIEHyJym372iQm1gYy4y', 'voter', 0, NULL, '2025-10-09 00:39:51', '2025-10-09 00:39:51'),
(391, 'FAIQ SUGILAR', '252610243', 'X TM 6', '$2y$12$nKLAoxQAmL5i.tyByyKQpecTOMLQZyIzlfIgjxVwQut63bAYG1J62', 'voter', 0, NULL, '2025-10-09 00:39:51', '2025-10-09 00:39:51'),
(392, 'FAJRUL MA ANI', '252610244', 'X TM 6', '$2y$12$JEIkyGKD1EACMCl08u3YiOtupblvAonfbWh72TdBupq1kV7JoVmo6', 'voter', 0, NULL, '2025-10-09 00:39:52', '2025-10-09 00:39:52'),
(393, 'FUJA SAEPULLOH', '252610245', 'X TM 6', '$2y$12$1yK86AOJVp8bPIaUYlP0muTOyDW7t4QNoJgXsW9xWJSNhUkAByHhG', 'voter', 0, NULL, '2025-10-09 00:39:52', '2025-10-09 00:39:52'),
(394, 'HENDI SETIAWAN', '252610246', 'X TM 6', '$2y$12$lEKxBFMpLt3UgjfIe53DQOgXRqCPlLp8bM/fDq3QPYTIy9YkzZsA.', 'voter', 0, NULL, '2025-10-09 00:39:52', '2025-10-09 00:39:52'),
(395, 'KARNATA JAYADI NINGRAT', '252610247', 'X TM 6', '$2y$12$1PajS5.8MwBmxRi2g1Hc3OzMLu8YCEjeur3qXo.gFnYcpGTaYfeuu', 'voter', 0, NULL, '2025-10-09 00:39:52', '2025-10-09 00:39:52'),
(396, 'MUHAMAD KHAIRUL INIESTA', '252610248', 'X TM 6', '$2y$12$ZrmrUtH02.OywfzlTD54Ke3wv.SzZO.//CPxGMbEOryFgr3frY24C', 'voter', 0, NULL, '2025-10-09 00:39:53', '2025-10-09 00:39:53'),
(397, 'MUHAMMAD DANIAL ALPIKRI', '252610249', 'X TM 6', '$2y$12$DpjJ3nYcYul5dcd2gTu6deLGnwNMBkobchVttFSYLMq3WxNaQ79ry', 'voter', 0, NULL, '2025-10-09 00:39:53', '2025-10-09 00:39:53'),
(398, 'NENENG HABIBAH', '252610250', 'X TM 6', '$2y$12$q1QhOez74MUplm/MiXpCcesRg6LMRwRuXaVLi0hC91tJFDEPYoboa', 'voter', 0, NULL, '2025-10-09 00:39:53', '2025-10-09 00:39:53'),
(399, 'NOVAL JUNIAN SALEH', '252610251', 'X TM 6', '$2y$12$T71W4Fjr4tsMFMhGtZV6zOZQsAAB1/xX1crnxQhEIdT9iY.G6Hzxu', 'voter', 0, NULL, '2025-10-09 00:39:54', '2025-10-09 00:39:54'),
(400, 'NUAF DHANU WINATA', '252610252', 'X TM 6', '$2y$12$56RUV80CIpjHP2Uvglcy9.yUkSwhwG96aJi6..2dkQfderr3onsg2', 'voter', 0, NULL, '2025-10-09 00:39:54', '2025-10-09 00:39:54'),
(401, 'RAIHAN ABDUL YAFIDZ', '252610253', 'X TM 6', '$2y$12$gIfWs5VPL4OlcGrpbeoAeuNgbXvad0BMnzlydPMg/dtYVq/.kPV8O', 'voter', 0, NULL, '2025-10-09 00:39:54', '2025-10-09 00:39:54'),
(402, 'REIHAN FIRMANSYAH', '252610254', 'X TM 6', '$2y$12$Nk0ep6jaD1hx35YsnF7ND.vzeUFd2fMHhjAehepxeDICqHlQ7lzb.', 'voter', 0, NULL, '2025-10-09 00:39:54', '2025-10-09 00:39:54'),
(403, 'RITA FITRIA', '252610255', 'X TM 6', '$2y$12$xYa9/SAMo0t4XFhmw4XXpezDK2NsZdWytF2OkVDodHZlPuP6cRZ6.', 'voter', 0, NULL, '2025-10-09 00:39:55', '2025-10-09 00:39:55'),
(404, 'ROFIKOH ALIYATUL SUNIAH', '252610256', 'X TM 6', '$2y$12$xm5DRY45lhvp48YokKzXqOiHKi8TQybBKywHav/9YVCkHdWjH4Jhy', 'voter', 0, NULL, '2025-10-09 00:39:55', '2025-10-09 00:39:55'),
(405, 'ROSAM CAKRA WINATA', '252610257', 'X TM 6', '$2y$12$g9MG0nsxYFbkyuQXZkCpIeI3taYzg3c49Wx8hvcB3IqMdr5HMtkv6', 'voter', 0, NULL, '2025-10-09 00:39:55', '2025-10-09 00:39:55'),
(406, 'SAEFUL GOFAR', '252610258', 'X TM 6', '$2y$12$a296XjzJcRQwN6MKsygi/.j1PLQlAtL7Qm/RAZjBO8nRSPOpcEeMy', 'voter', 0, NULL, '2025-10-09 00:39:55', '2025-10-09 00:39:55'),
(407, 'SAEPUL MAULANA', '252610259', 'X TM 6', '$2y$12$ILLr79Fr6W5.WB1cXuB5X.H4cPcU2ahAqyU49EVIyEwgc.ZPf.J6K', 'voter', 0, NULL, '2025-10-09 00:39:56', '2025-10-09 00:39:56'),
(408, 'SETIYAJI AHMAD FAUZI', '252610260', 'X TM 6', '$2y$12$BuE/z8nWfCsgvFYifdzrQeypO8gFJvX.dI1yWYtcdjt/G12zv3BYG', 'voter', 0, NULL, '2025-10-09 00:39:56', '2025-10-09 00:39:56'),
(409, 'WINDY OCTOVIYA', '252610261', 'X TM 6', '$2y$12$zlFZXnmaH8kHd/gobgqTCOnKDnRNS9Et6pBldve7Ebvc9zgL7hFhK', 'voter', 0, NULL, '2025-10-09 00:39:56', '2025-10-09 00:39:56'),
(410, 'YUDI ADITIA', '108382277', 'X TM 6', '$2y$12$E5JKcCAW7P43aXAcsnD2cO1zEUxSoZIAdrCndZ1MfyHIgtjQ9zvp6', 'voter', 0, NULL, '2025-10-09 00:39:57', '2025-10-09 00:39:57'),
(411, 'AHMAD RIFKI RIFA`I', '242510170', 'XI TM 4', '$2y$12$iGcHkwieeEiWaopp.zK8A.y61WvUyKSavoDzpAnvuSDHRGIuM6kE2', 'voter', 0, NULL, '2025-10-09 00:41:34', '2025-10-09 00:41:34'),
(412, 'ALDO PRASETYO ADAM', '242510171', 'XI TM 4', '$2y$12$DDJQebVyLnHbByvF.DcifeaRVgFZTYlfkT1TNG0Rd.bRdtnWfjsVC', 'voter', 0, NULL, '2025-10-09 00:41:34', '2025-10-09 00:41:34'),
(413, 'ARIS MUKTIA', '242510172', 'XI TM 4', '$2y$12$4yWXBBLuDYEafr.6GzIEeuZt1Wm1oG9PD5K0U1gmz5rnOJwike/wG', 'voter', 0, NULL, '2025-10-09 00:41:34', '2025-10-09 00:41:34'),
(414, 'ARMAN RAMADHAN', '242510174', 'XI TM 4', '$2y$12$rCyny2NUryR9zLNfeBmmLOyB2Q5T./qFAfAZcRpW9jL/AHnLiAdLy', 'voter', 0, NULL, '2025-10-09 00:41:34', '2025-10-09 00:41:34'),
(415, 'DARMAWAN', '242510175', 'XI TM 4', '$2y$12$kbXXcjJdvRK.1nOj5NWmoOOEzIuczcVm1BN0O6Q/jOkc4nOGjUJ.C', 'voter', 0, NULL, '2025-10-09 00:41:35', '2025-10-09 00:41:35'),
(416, 'DENI HARUN', '242510176', 'XI TM 4', '$2y$12$oIbmYccKGsHiwSzLTDCM5uCHCISdHhlyf2Qj5wNZZrkMuBOYWnXoe', 'voter', 0, NULL, '2025-10-09 00:41:35', '2025-10-09 00:41:35'),
(417, 'DIMAS', '242510177', 'XI TM 4', '$2y$12$Bcjhak5CRunh1Qdlu2hviOQxylN1YRAW3qxWx2hrM.r/tAqweUfMa', 'voter', 0, NULL, '2025-10-09 00:41:36', '2025-10-09 00:41:36'),
(418, 'FAISAL ABDUL AZIS', '242510178', 'XI TM 4', '$2y$12$7fxI5T/Kkdvecb6nmZzVQu0i2nFvDM5BjmENoHVtRcU/zQMSIVFQy', 'voter', 0, NULL, '2025-10-09 00:41:36', '2025-10-09 00:41:36'),
(419, 'GALIH WARDANA', '242510179', 'XI TM 4', '$2y$12$QT7je7X.yJ7Po6Wwe4bsfe7XZfiYxolCkZBla/t00lLKiRxfqTVoC', 'voter', 0, NULL, '2025-10-09 00:41:37', '2025-10-09 00:41:37'),
(420, 'GILANG PERMANA', '242510181', 'XI TM 4', '$2y$12$klCEW2QppRvgFa6K2s3PWOR7eMRCXmtMDHxz6jqbnCF/rnpfC0nFW', 'voter', 0, NULL, '2025-10-09 00:41:37', '2025-10-09 00:41:37'),
(421, 'HOTIMAH', '242510182', 'XI TM 4', '$2y$12$sh4ay0ibSAvuJjVkL2zXU.faLYGPmP.z6YqngPuMY8UrsWM9V08Re', 'voter', 0, NULL, '2025-10-09 00:41:37', '2025-10-09 00:41:37'),
(422, 'ILYAS SUPANDI', '242510183', 'XI TM 4', '$2y$12$uS.na4V1GP2hZdRhHPvV4.qbLX5CkcMfa4uQXwrstZtrdjRbNpmU.', 'voter', 0, NULL, '2025-10-09 00:41:37', '2025-10-09 00:41:37'),
(423, 'IRKI', '242510185', 'XI TM 4', '$2y$12$gMh/En0LgNBzDuno.r277.CEppapXHnZl8nQbtMzGk2tJPEhuKHAG', 'voter', 0, NULL, '2025-10-09 00:41:38', '2025-10-09 00:41:38'),
(424, 'IRWAN', '242510186', 'XI TM 4', '$2y$12$6T1o0RQJK6pkRX01AVQuhuHJeJhDyctBpbE4PaLNElBQh/n.tDwZe', 'voter', 0, NULL, '2025-10-09 00:41:38', '2025-10-09 00:41:38'),
(425, 'KARDIANSYAH', '242510305', 'XI TM 4', '$2y$12$pZUFwfr/YYkMBX0KjakSKum8jnoQKDxUIbbtCOuaGAqhLbAtgRrx.', 'voter', 0, NULL, '2025-10-09 00:41:38', '2025-10-09 00:41:38'),
(426, 'MEYFHA AKILAH', '242510313', 'XI TM 4', '$2y$12$kiXuy9Y9h/OpNm5DGggWz.StoTTvH6MwDg9jpEfutPPKMkE7Hkf7i', 'voter', 0, NULL, '2025-10-09 00:41:39', '2025-10-09 00:41:39'),
(427, 'MOHAMAD AKBAR', '242510187', 'XI TM 4', '$2y$12$1FQ3aBEaH8qBYe6mnKFrUOQL9oTFHJSt5cU3ddSS/MlTEZAC3Agv2', 'voter', 0, NULL, '2025-10-09 00:41:39', '2025-10-09 00:41:39'),
(428, 'MUTIARA', '242510189', 'XI TM 4', '$2y$12$4bvBzYj3Ys0z.ndyv8HClufpSdEFeAMqkcONd7uXJyFHnfshhqz/m', 'voter', 0, NULL, '2025-10-09 00:41:39', '2025-10-09 00:41:39'),
(429, 'NANANG ALDIANSYAH', '242510191', 'XI TM 4', '$2y$12$3Vu1lL0fhCbi42xUbjMg8eQLnYR26E6o/b29ZvMf9diJpaSq/9gqG', 'voter', 0, NULL, '2025-10-09 00:41:39', '2025-10-09 00:41:39'),
(430, 'PAHRUDIN', '242510193', 'XI TM 4', '$2y$12$imSmMA6ofsCEj8Kp0kKEPuzGxG.mvbzzXy00zoAKQimS8G5X0Ud0K', 'voter', 0, NULL, '2025-10-09 00:41:40', '2025-10-09 00:41:40'),
(431, 'SAPRUDIN', '242510195', 'XI TM 4', '$2y$12$fo8lZ1bRpglvCjUYMPO5XeksQ2H8j0HSPtR2P1P1/JrPBWdSVIpva', 'voter', 0, NULL, '2025-10-09 00:41:40', '2025-10-09 00:41:40'),
(432, 'SIFAH FAUZIAH', '242510196', 'XI TM 4', '$2y$12$PTlVDf/mAc2GFk1sOXEJDe/oHVpwt6PvesOiEk/FdsggM3iPHlO06', 'voter', 0, NULL, '2025-10-09 00:41:41', '2025-10-09 00:41:41'),
(433, 'TANIA LAURA', '242510197', 'XI TM 4', '$2y$12$0.hPZvyXPjJMKd4KUnjdrOidjeLbzJzym6d/S5V3iWnoIhXw57N0a', 'voter', 0, NULL, '2025-10-09 00:41:41', '2025-10-09 00:41:41'),
(434, 'TEGAR ANANDA PRATAMA', '242510198', 'XI TM 4', '$2y$12$r95APFpRxmmo.7oYVATBuORyNrrHTwPZxgKZ075V6qY/aRIh1QnNG', 'voter', 0, NULL, '2025-10-09 00:41:41', '2025-10-09 00:41:41'),
(435, 'WIRANATA', '242510199', 'XI TM 4', '$2y$12$QER9/V9KY5YMgr1sV.WTh.M1A9IEj.cCajU1wvjWIydtAJqXKX.9K', 'voter', 0, NULL, '2025-10-09 00:41:41', '2025-10-09 00:41:41'),
(436, 'YUSUP HABIBI', '242510201', 'XI TM 4', '$2y$12$9kDJrwtJgruK6nakaq6vue7SJlj3cgRyASsy9OT7vlZCVRaJhOyNa', 'voter', 0, NULL, '2025-10-09 00:41:42', '2025-10-09 00:41:42'),
(437, 'AHMAD NURACA', '242510202', 'XI TM 5', '$2y$12$eeLCzGH293sNv6PlgU9YbOOB1iGrZWHgwC.Z9gpR/E5UNHG9b5NQu', 'voter', 0, NULL, '2025-10-09 00:41:42', '2025-10-09 00:41:42'),
(438, 'ALVIAN NURFADILAH AGUSTIN', '242510203', 'XI TM 5', '$2y$12$KgCpYlwxqKxwnDvh/mJ/3eVdzUj8g043ia6O/ublqEUtv1Uwj99km', 'voter', 0, NULL, '2025-10-09 00:41:42', '2025-10-09 00:41:42'),
(439, 'CARTIKA AYU', '242510204', 'XI TM 5', '$2y$12$nOO./ze1NP76qY5mnf18k.osFNR4O.J3e7rony.muZ9S8fZRONrIm', 'voter', 0, NULL, '2025-10-09 00:41:43', '2025-10-09 00:41:43'),
(440, 'DIMAS', '242510205', 'XI TM 5', '$2y$12$eynt/F3wwiRJLpY7MObpWeuu59s9hb5fYAaTeT/fxWkitHO/orCLe', 'voter', 0, NULL, '2025-10-09 00:41:43', '2025-10-09 00:41:43'),
(441, 'DIRLY KUSUMAH', '242510206', 'XI TM 5', '$2y$12$sKqnNhUZKfoojakc88Tl9.uubQQzu8fUXzXwF8Q9VuaCjiTNrcJd6', 'voter', 0, NULL, '2025-10-09 00:41:43', '2025-10-09 00:41:43'),
(442, 'FAISAL SETYO NUGROHO', '242510207', 'XI TM 5', '$2y$12$bA46oQf/1yM8GozLe59bfuyOrMfR8ty1HltkpGyfJUPnfO9t/tzg6', 'voter', 0, NULL, '2025-10-09 00:41:43', '2025-10-09 00:41:43'),
(443, 'FARID RIZKY RAMDANI', '242510208', 'XI TM 5', '$2y$12$afUY/0ggsb4.3ZRZCEQSo.gdm7/nCqF30WTUB0xfGX/5Qt1wr/.02', 'voter', 0, NULL, '2025-10-09 00:41:44', '2025-10-09 00:41:44'),
(444, 'IIN DWI DIKA', '242510209', 'XI TM 5', '$2y$12$QpikH92IkAy1KcnQc56Dz.iui.qqDqr5jRrU5UEGDllY9d32YmQmm', 'voter', 0, NULL, '2025-10-09 00:41:44', '2025-10-09 00:41:44'),
(445, 'ILYAS EFENDI', '242510210', 'XI TM 5', '$2y$12$YK6UE7fYCHa2uptI2ZfOQuqvBlqBUZORjGRlY.Ua2Huee.cdYw.Ta', 'voter', 0, NULL, '2025-10-09 00:41:44', '2025-10-09 00:41:44'),
(446, 'IRWAN', '242510211', 'XI TM 5', '$2y$12$3gGHIEU2/crPYIAxQBSiheMiejbeHQ7vZuC7NXgo.W0rK1yqno2SO', 'voter', 0, NULL, '2025-10-09 00:41:44', '2025-10-09 00:41:44'),
(447, 'JAMAL MAULANA', '242510212', 'XI TM 5', '$2y$12$wuEVlG9EHAKz8CpUoeg44OfqSpRANsDA5XS2EXOgtpz1hsiFzO.mq', 'voter', 0, NULL, '2025-10-09 00:41:45', '2025-10-09 00:41:45'),
(448, 'LUTHFI YANSYAH', '242510312', 'XI TM 5', '$2y$12$4iFw2j4UDQng1.Rq9JQkiepct3HTdkTy1x5NgSYa7M7HcVbyGvLJ2', 'voter', 0, NULL, '2025-10-09 00:41:45', '2025-10-09 00:41:45'),
(449, 'MUHAMAD ANDRE ALPHIANSYAH', '242510213', 'XI TM 5', '$2y$12$VwylqnDkiQMqaIR9tX4ZK.JPvnWcNk1zGOzy0qz6bIvFZu7JbCy1G', 'voter', 0, NULL, '2025-10-09 00:41:45', '2025-10-09 00:41:45'),
(450, 'MUHAMAD BOBY FRAYUDA', '242510214', 'XI TM 5', '$2y$12$1M/LlB7yC4R4flVSIJVswOYAlC5rgnvHYc9Z3sOieXkaBNKeW9sBi', 'voter', 0, NULL, '2025-10-09 00:41:45', '2025-10-09 00:41:45'),
(451, 'MUHAMAD FAISAL', '242510215', 'XI TM 5', '$2y$12$wCWNf9/EeqEbQzqhTcCCGOV1HhqtdUIqfOAqAGS5egcDw/NzvNTgi', 'voter', 0, NULL, '2025-10-09 00:41:46', '2025-10-09 00:41:46'),
(452, 'MUHAMAD RAIHAN', '242510216', 'XI TM 5', '$2y$12$DvTFSMEYMe4qzM3NmzHa.Ou5YbbKcHJP9yR/ZpCCOy1SSkv6dEA0K', 'voter', 0, NULL, '2025-10-09 00:41:46', '2025-10-09 00:41:46'),
(453, 'MUHAMAD RIKI ALFATUR RIZKI', '242510217', 'XI TM 5', '$2y$12$kCiKHwk7jCVuVtSaM2Zck.95U1epkTJ77nHuseIKAWcEqlc0wNsiO', 'voter', 0, NULL, '2025-10-09 00:41:46', '2025-10-09 00:41:46'),
(454, 'MUHAMAD SAUD', '242510218', 'XI TM 5', '$2y$12$Hvgw0rRFMVakUUPDpEn1N.k6RodiABwV.cxqo3jnrIcHKrrsFWnMW', 'voter', 0, NULL, '2025-10-09 00:41:47', '2025-10-09 00:41:47'),
(455, 'MUHAMAD TIRTA RUKMANA', '242510219', 'XI TM 5', '$2y$12$eyrz6utVIBel2Eg3fKw5suVFzTKDcHPems9BCtJKirSNl6Qc4zlfm', 'voter', 0, NULL, '2025-10-09 00:41:47', '2025-10-09 00:41:47'),
(456, 'MUHAMMAD FARHAN MIFTAHUL ROJAK', '242510220', 'XI TM 5', '$2y$12$/1FVCJHML3ap1pHALYAdj.nOtuNaaSjwDJJbmd5GbfLn9PIgXlE8e', 'voter', 0, NULL, '2025-10-09 00:41:47', '2025-10-09 00:41:47'),
(457, 'MUHAMMAD HASAN BASRI', '242510221', 'XI TM 5', '$2y$12$3QPph3AgwjXIRhf3EhgyouxU/oI06lfAmf2TFiZB3JlBJbXMG0FoK', 'voter', 0, NULL, '2025-10-09 00:41:47', '2025-10-09 00:41:47'),
(458, 'NAJRIL ILHAM', '242510222', 'XI TM 5', '$2y$12$9vGJYvjCpAOJhN/WEzs.POrZrGoNJS4h3..Riv5WSbVVcOLWOcUla', 'voter', 0, NULL, '2025-10-09 00:41:48', '2025-10-09 00:41:48'),
(459, 'NANANG KOSIM', '242510223', 'XI TM 5', '$2y$12$ogx3zKQ/uXVRVclXUiUDKuOCuh9BhIkqdvdIXcyVryk8DcQNVZNK2', 'voter', 0, NULL, '2025-10-09 00:41:48', '2025-10-09 00:41:48'),
(460, 'RIPA HAMDANI', '242510224', 'XI TM 5', '$2y$12$OZ9NUpsR6iMLz52qGElty.n6CEHm6EKe2.RLJTHmaTAZZHlsmWeSi', 'voter', 0, NULL, '2025-10-09 00:41:48', '2025-10-09 00:41:48'),
(461, 'RIZKI AHMAD HAMBALI', '242510225', 'XI TM 5', '$2y$12$EC2NtJwGrVry74ZX3Df4vuaQTyGINzQ9VlrlsLf6rVwHL5jI1HsUW', 'voter', 0, NULL, '2025-10-09 00:41:49', '2025-10-09 00:41:49'),
(462, 'SAEPUDIN', '242510227', 'XI TM 5', '$2y$12$4KY5zfaRZj0PbXz/i/yMLefB/sRrm6/OqXhxm93FWRpRUS.s8tFcK', 'voter', 0, NULL, '2025-10-09 00:41:49', '2025-10-09 00:41:49'),
(463, 'SAKTI GENTA AIRLANGGA', '242510228', 'XI TM 5', '$2y$12$kWtq6Pn00a9gd7iH2RnYOuVuYpl3semQLwq2E4.K37KHmBKOsSCIG', 'voter', 0, NULL, '2025-10-09 00:41:49', '2025-10-09 00:41:49'),
(464, 'SASKIA MURNI ATI JUANDI', '242510229', 'XI TM 5', '$2y$12$pFavTqtpwsj8nRKVYUMYG.f6jLJVvIvmX8yuIo6BG.CtYcrUvQSFy', 'voter', 0, NULL, '2025-10-09 00:41:50', '2025-10-09 00:41:50'),
(465, 'SITI HALIMAH SADIYAH', '242510230', 'XI TM 5', '$2y$12$knHquZl.Yx9zKa1vF4/W2ueujIaS8rvMROcUoB3UHo.ipX9tzyZDW', 'voter', 0, NULL, '2025-10-09 00:41:50', '2025-10-09 00:41:50'),
(466, 'SODIK RIFAI', '242510231', 'XI TM 5', '$2y$12$WpNsreTYo0DeSLjs3nJ.weBfHbZPfTYTPb4ei627TKYj0LT1XKZwe', 'voter', 0, NULL, '2025-10-09 00:41:50', '2025-10-09 00:41:50'),
(467, 'WIDIA RAHMA SARI', '242510232', 'XI TM 5', '$2y$12$8nR7x4dTBdEcYycBaI4Auetb9tp2XEAnQjPEnVZxwepRBxr/FzhEm', 'voter', 0, NULL, '2025-10-09 00:41:51', '2025-10-09 00:41:51'),
(468, 'WILDATUL RAHMATUL UMMAH', '242510233', 'XI TM 5', '$2y$12$cXv7Z3Zfov7Nq8flFxWeze3L2/lfHNnx2roqs6kJJoclVMZyjzE/2', 'voter', 0, NULL, '2025-10-09 00:41:51', '2025-10-09 00:41:51'),
(469, 'AGNA FATHURROHMAN', '242510235', 'XI TM 6', '$2y$12$tGlok3PFsNVaGC5.7ihnF.TLSIX.PnTYO35Rg/BhbvLM8u7UL4jku', 'voter', 0, NULL, '2025-10-09 00:41:51', '2025-10-09 00:41:51'),
(470, 'ALI AHMAD DINEZAD', '242510236', 'XI TM 6', '$2y$12$DT.o6h06EaC63JkAEk0wv.RTKNxg1sQHYjYYdSghoMojNuYy9SBS6', 'voter', 0, NULL, '2025-10-09 00:41:52', '2025-10-09 00:41:52'),
(471, 'ALNAZRIL ANASSYAH', '242510237', 'XI TM 6', '$2y$12$./B20WhN3XZCooFQHW1iROZfOaD5a3Zvlk9CB..Ky0R2nv3v6Yvt2', 'voter', 0, NULL, '2025-10-09 00:41:52', '2025-10-09 00:41:52'),
(472, 'ANGGA', '242510239', 'XI TM 6', '$2y$12$YtzGj8QB3jLEUfZX5D.UJOsZOphXqHFjMR4Xks3Ptg6TiBA2TVPVy', 'voter', 0, NULL, '2025-10-09 00:41:52', '2025-10-09 00:41:52'),
(473, 'DERI SAEPUDIN', '242510241', 'XI TM 6', '$2y$12$YJ3HByg0Up2RCuXCWYQ7Ie/T4gbeO1RqHkenjSftxCgTKNovvMeAC', 'voter', 0, NULL, '2025-10-09 00:41:53', '2025-10-09 00:41:53'),
(474, 'DIKI PURNAMA', '242510242', 'XI TM 6', '$2y$12$r.qOr.45pVmhI5rg.0kg/ugCSlGCw8f3Ms/0mQGXNNUJD5ytEF1RO', 'voter', 0, NULL, '2025-10-09 00:41:53', '2025-10-09 00:41:53'),
(475, 'FAUZI RIDWAN', '242510244', 'XI TM 6', '$2y$12$GgUUNdvL4Jb1PMnNSQmkaOYRDs95slkEX13pSemVQPlj0IXasSC.a', 'voter', 0, NULL, '2025-10-09 00:41:53', '2025-10-09 00:41:53'),
(476, 'GILANG ANGGA KUSUMAH', '242510245', 'XI TM 6', '$2y$12$ank5x9/M9d5p5ErsC6jueuzFDPp6gQ92SeMzbLIVS54ERsRqDgRvW', 'voter', 0, NULL, '2025-10-09 00:41:54', '2025-10-09 00:41:54'),
(477, 'IMARRUL UMMARA', '242510246', 'XI TM 6', '$2y$12$eVi9aRqx.Jsa0HEP30.mqeJJBnN38qY.qd5i516thMabWTdhURWIW', 'voter', 0, NULL, '2025-10-09 00:41:54', '2025-10-09 00:41:54'),
(478, 'KARTOBI', '242510247', 'XI TM 6', '$2y$12$4ffMAGwNxj4Rp53C5iI03euaEWu7AEIO5yLYLomeX43yka7EnZT5K', 'voter', 0, NULL, '2025-10-09 00:41:54', '2025-10-09 00:41:54'),
(479, 'MALIK IBRAHIM', '242510249', 'XI TM 6', '$2y$12$eilZnfymFKhOKVnJjAwVhuG.d8FTDhkrSEclrhn6G5DHMUK6QAtbe', 'voter', 0, NULL, '2025-10-09 00:41:55', '2025-10-09 00:41:55'),
(480, 'MARSELA', '242510250', 'XI TM 6', '$2y$12$2dzXQuiTdQ4OZk.vXnc4jOy9c3Od9bLoozC1B6mLqKJiKNc.yMeOW', 'voter', 0, NULL, '2025-10-09 00:41:55', '2025-10-09 00:41:55'),
(481, 'MUHAMAD FARIS DZULFIKAR', '242510252', 'XI TM 6', '$2y$12$sOnfXKg8NAvIcr7xzqmKsu7ruS3pasEPsUq0eCJwRTZaXYTiPKd4q', 'voter', 0, NULL, '2025-10-09 00:41:56', '2025-10-09 00:41:56'),
(482, 'MUHAMAD REHAN BAROKAH', '242510253', 'XI TM 6', '$2y$12$yjezAjiMAS6Q9ne4wDatUuinHFuRawu2YNK3NfbforvfnrgKQ2Wbm', 'voter', 0, NULL, '2025-10-09 00:41:56', '2025-10-09 00:41:56'),
(483, 'MUHAMMAD RAIHAN FEBRIAN', '242510254', 'XI TM 6', '$2y$12$olHqnrwAxsVEPk.rqQN2Zeram1Fkn59yORaqsowy5hA6rdNMRyT8y', 'voter', 0, NULL, '2025-10-09 00:41:57', '2025-10-09 00:41:57'),
(484, 'RADIT RAMDANI', '242510255', 'XI TM 6', '$2y$12$L6eUQLJAfqrJEropUxrCE.L6X2BRhuSkMFuEOAvK2lEmk/9zrhWCy', 'voter', 0, NULL, '2025-10-09 00:41:57', '2025-10-09 00:41:57'),
(485, 'RAMDANI', '242510256', 'XI TM 6', '$2y$12$ERM9r9PdJ8PMiIIAtIwi1e2CsNiFdyG0moyA8o/CDOlWRsdu5Gea2', 'voter', 0, NULL, '2025-10-09 00:41:57', '2025-10-09 00:41:57'),
(486, 'REHAN MAULANA RIZKY', '252610264', 'XI TM 6', '$2y$12$L4nzZzGnJe9nLdP3yqli2uAAQP1p30bzt50sLiTcoaDbPaAW0Kgsu', 'voter', 0, NULL, '2025-10-09 00:41:57', '2025-10-09 00:41:57'),
(487, 'RENO APRIAN', '242510257', 'XI TM 6', '$2y$12$mIo.TC8UGj.COA00Pn0pFu5LXcO5WnTql6Omd7f.nL01HwEIL7d.2', 'voter', 0, NULL, '2025-10-09 00:41:58', '2025-10-09 00:41:58'),
(488, 'REYSSA PRIYUNITHA IVANA', '242510258', 'XI TM 6', '$2y$12$YwwEMjfnNFumuS5ZFy.sNOjMMyewDBu.f/VkX.mmI7zEKU2QjeqGS', 'voter', 0, NULL, '2025-10-09 00:41:58', '2025-10-09 00:41:58'),
(489, 'RIZKI', '242510259', 'XI TM 6', '$2y$12$ZPFMtXw/ExbwLXsMAFWRJOv51xX.BxJnm3VDjN47CKMmwAIgG7Hti', 'voter', 0, NULL, '2025-10-09 00:41:58', '2025-10-09 00:41:58'),
(490, 'SRI ANGGRAENI PEBRIANTI', '242510260', 'XI TM 6', '$2y$12$mb7BwGt2CejbNpZQ1tdxUOvxB.rdaukh9Cvh4RY92nT9V.p.Lr2w6', 'voter', 0, NULL, '2025-10-09 00:41:58', '2025-10-09 00:41:58'),
(491, 'TASYA', '242510261', 'XI TM 6', '$2y$12$5I02of3LqNGcJCTSyykjWutk8Twv0jsAq2I0nwJjn95p/ECdexV6C', 'voter', 0, NULL, '2025-10-09 00:41:59', '2025-10-09 00:41:59'),
(492, 'TAUFIQ HIDAYATULAH', '242510262', 'XI TM 6', '$2y$12$6S9kjlPP8FlTPmxmIObJmeTroQt2Z3hT0cLJAAEH8BF0ZOyA30/82', 'voter', 0, NULL, '2025-10-09 00:41:59', '2025-10-09 00:41:59'),
(493, 'TRISTANTO', '242510263', 'XI TM 6', '$2y$12$I1V0l/Yr4vUw04NcEHg1FeaRz3u5YzLqy4PC/akx92aBg9YqjLw1y', 'voter', 0, NULL, '2025-10-09 00:41:59', '2025-10-09 00:41:59'),
(494, 'WHILDAN SYAHRIZAL WAHYUDI', '242510264', 'XI TM 6', '$2y$12$p2Qc38B9v7XQaqozJt9LgOzjibs/WRi5dMbjP6K97zYlTf2J.tOX.', 'voter', 0, NULL, '2025-10-09 00:42:00', '2025-10-09 00:42:00'),
(495, 'ABDUL AZIS', '242510265', 'XI TM 7', '$2y$12$buaoFoZEsSXdhJ4bnyXBV.6HJOwKkSiWvGHyeft2rUzPpSw5w4K3K', 'voter', 0, NULL, '2025-10-09 00:42:00', '2025-10-09 00:42:00'),
(496, 'ABDUL RAHMAN WAHYUDIN', '242510266', 'XI TM 7', '$2y$12$xgm2kDBcUKVQA/EgM7mOCe.BLKu98DF/4WebYtDxwqSZfwM3kidwO', 'voter', 0, NULL, '2025-10-09 00:42:01', '2025-10-09 00:42:01'),
(497, 'AHMAD FANANI', '242510267', 'XI TM 7', '$2y$12$zdCrdPOgWmUelzsJN0pQB.gFHnatNjhvU682LsbttS7F7dLT.KW6S', 'voter', 0, NULL, '2025-10-09 00:42:01', '2025-10-09 00:42:01'),
(498, 'ALFA NURHIKMAH', '242510269', 'XI TM 7', '$2y$12$mKta2w17QY5LT6KEL/LH3enWbpaR/oqII2UXsoD22CuKO9hpPKZAO', 'voter', 0, NULL, '2025-10-09 00:42:01', '2025-10-09 00:42:01'),
(499, 'ANDRA PURNAMA', '242510271', 'XI TM 7', '$2y$12$hA00V2CdX4VS2yEJl5I0xejnMnDL/EKkC75eyAdMOS6vrWaXS3en2', 'voter', 0, NULL, '2025-10-09 00:42:02', '2025-10-09 00:42:02'),
(500, 'ARINO ARDAN ARUBETH', '242510272', 'XI TM 7', '$2y$12$5uJAMzSrXZM60B/cwqjOY.4vHEGNK7qRxaI9sYefuqIofwXX80SXq', 'voter', 0, NULL, '2025-10-09 00:42:02', '2025-10-09 00:42:02'),
(501, 'Ariyan', '242510311', 'XI TM 7', '$2y$12$A8YR3WJzRUkUrUO10fKTPut6ytH1d4tF3HM.rXWU.Y4jCR2U97Pdy', 'voter', 0, NULL, '2025-10-09 00:42:02', '2025-10-09 00:42:02'),
(502, 'CARSIYAH', '242510273', 'XI TM 7', '$2y$12$GF/dVe1RKc6N8kycnzLZ3OHtatgNs/XrSNQ5F4/oXBQyPA84gtFMi', 'voter', 0, NULL, '2025-10-09 00:42:02', '2025-10-09 00:42:02'),
(503, 'CHICI NURSELA', '242510274', 'XI TM 7', '$2y$12$XRQe65t7d4zeBiuMMgoJuOgqjQzrgxECZ5an14Il.NvM69sTX.y7e', 'voter', 0, NULL, '2025-10-09 00:42:03', '2025-10-09 00:42:03'),
(504, 'DALAL IRWANSYAH', '242510275', 'XI TM 7', '$2y$12$wO9IYTsF8TlRbkWSMb1mVOA9aGzWkXrCrEBAUctOkJPWtXVT0x5Vq', 'voter', 0, NULL, '2025-10-09 00:42:03', '2025-10-09 00:42:03'),
(505, 'DODO WIJAYA', '242510276', 'XI TM 7', '$2y$12$ZrQji2EPO4qXHu6mCh5ejOxssawmF00vLoyXf4t5IeNdohFesAV3W', 'voter', 0, NULL, '2025-10-09 00:42:04', '2025-10-09 00:42:04'),
(506, 'ELI HAYATI', '242510277', 'XI TM 7', '$2y$12$eCsp6LP5QcZ14BfLEaRrN.Z2Hgv6MyALpU76oDgjd0J.wwJGHer3a', 'voter', 0, NULL, '2025-10-09 00:42:04', '2025-10-09 00:42:04'),
(507, 'INDRA', '242510279', 'XI TM 7', '$2y$12$8gjo8L8Ew1AlDjQyYwotzemT/x3m8kwpNh/kZ/oJmKh4Mph07yKZO', 'voter', 0, NULL, '2025-10-09 00:42:04', '2025-10-09 00:42:04'),
(508, 'LAILA SAFITRI', '242510304', 'XI TM 7', '$2y$12$A6wGwhAaxi.Ve6ex0CEFeOVtNM9BAFURTpB6lRhadMlXsGcUpgl2G', 'voter', 0, NULL, '2025-10-09 00:42:05', '2025-10-09 00:42:05'),
(509, 'MAESAROH', '242510307', 'XI TM 7', '$2y$12$Fvqt8u81I.ni868ARGU6muISQe8RmXzqi5bjtQZunmihCZ/tE8fea', 'voter', 0, NULL, '2025-10-09 00:42:05', '2025-10-09 00:42:05'),
(510, 'MUHAMAD RASYA RAMADHAN', '242510280', 'XI TM 7', '$2y$12$WRryecwOwYroigehsEE8wuo8Twob9b74DMl87M5A7ubetfEWkB02y', 'voter', 0, NULL, '2025-10-09 00:42:05', '2025-10-09 00:42:05'),
(511, 'MUHAMAD WAKAB', '242510281', 'XI TM 7', '$2y$12$h43SpSrkittKfuQu5iaV6uCHfb9tlXGdpceZCXqW0bx.WE.SXUi6.', 'voter', 0, NULL, '2025-10-09 00:42:06', '2025-10-09 00:42:06'),
(512, 'MUHAMAD WAKUB', '242510282', 'XI TM 7', '$2y$12$QvEAAQ1qA7fJL0OOl1Jnm.NNKQSsw2gWxOs7Lc1NVtw335MAOnby2', 'voter', 0, NULL, '2025-10-09 00:42:06', '2025-10-09 00:42:06'),
(513, 'MUHAMMAD RIDO RIDWANULAH', '242510283', 'XI TM 7', '$2y$12$/m8cUEJK1rvsE.OGZ//HieXQCrC0MOo49koXbVF9oa1134gTpAR5m', 'voter', 0, NULL, '2025-10-09 00:42:08', '2025-10-09 00:42:08'),
(514, 'NAJRIL ILHAM', '242510285', 'XI TM 7', '$2y$12$YklPVem3XwymgaVJrgML4enDZQ1coYw0cAjAEHIEumosg8C865iIa', 'voter', 0, NULL, '2025-10-09 00:42:08', '2025-10-09 00:42:08'),
(515, 'NIA RAMADHANI', '242510286', 'XI TM 7', '$2y$12$SQUIeMunc0yiUSXMRIlyxuBEV3txQp1uzQRItdaWjBEVEq22NuKvK', 'voter', 0, NULL, '2025-10-09 00:42:08', '2025-10-09 00:42:08'),
(516, 'RANGGA ARDIAN', '242510287', 'XI TM 7', '$2y$12$reGwjaeY73inw7u6dmq4KerGXJp3kSY5ytElHysLXoJLONxRH/hTK', 'voter', 0, NULL, '2025-10-09 00:42:09', '2025-10-09 00:42:09'),
(517, 'RIZKI MAULANA', '242510289', 'XI TM 7', '$2y$12$.74GZGHNGxL.S/A6cR1Fle4bXv5c.3RXWREca7SXC71DkyhCgIMY2', 'voter', 0, NULL, '2025-10-09 00:42:09', '2025-10-09 00:42:09'),
(518, 'SOPIAN GUNAWAN', '242510291', 'XI TM 7', '$2y$12$TJlhPg3POlRwLCFWOZyzCenYfZuyphNt.dZFv/HlLYKGVGtmutUhm', 'voter', 0, NULL, '2025-10-09 00:42:09', '2025-10-09 00:42:09'),
(519, 'SUPRIYATNA RAMADAN PRASTIYO', '242510292', 'XI TM 7', '$2y$12$byvLgZfRa5jBej3s590a0u7NERGEgbzES/PsaRJcv0CHVvgUK5cEu', 'voter', 0, NULL, '2025-10-09 00:42:09', '2025-10-09 00:42:09'),
(520, 'VICRY APRIANSYAH', '242510293', 'XI TM 7', '$2y$12$yXtRJVO9io4Nw3e2BwwYfuMUThrNOxlRYoJBgQuzodyuDiz6ZNyrG', 'voter', 0, NULL, '2025-10-09 00:42:10', '2025-10-09 00:42:10'),
(521, 'WANA MAULANA', '242510294', 'XI TM 7', '$2y$12$RjNff5ZpVTsTJcDPII1PZuuaj4mRRYovd7.7GktOobB2vJujl7yLS', 'voter', 0, NULL, '2025-10-09 00:42:10', '2025-10-09 00:42:10'),
(522, 'WIRA ATMAJA', '242510295', 'XI TM 7', '$2y$12$9jVwRDtq59UFzP1fSR3xI.XPPsPPX1iwV4kVDiJFpPNImx70O9jt6', 'voter', 0, NULL, '2025-10-09 00:42:11', '2025-10-09 00:42:11'),
(523, 'YUDA PRATAMA', '242510296', 'XI TM 7', '$2y$12$NA3BG/CQ/hVKn2u0opfdMuhF5cp7/4082Z0uWsaiHprJeCkGLEvkm', 'voter', 0, NULL, '2025-10-09 00:42:11', '2025-10-09 00:42:11');

-- --------------------------------------------------------

--
-- Table structure for table `votes`
--

CREATE TABLE `votes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `candidate_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `candidates`
--
ALTER TABLE `candidates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- Indexes for table `votes`
--
ALTER TABLE `votes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `votes_user_id_foreign` (`user_id`),
  ADD KEY `votes_candidate_id_foreign` (`candidate_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `candidates`
--
ALTER TABLE `candidates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=524;

--
-- AUTO_INCREMENT for table `votes`
--
ALTER TABLE `votes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `votes`
--
ALTER TABLE `votes`
  ADD CONSTRAINT `votes_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `votes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
