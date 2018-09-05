# ************************************************************
# Sequel Pro SQL dump
# Versión 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.21)
# Base de datos: pets
# Tiempo de Generación: 2018-09-05 05:17:10 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Volcado de tabla migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(11,'2014_10_12_000000_create_users_table',1),
	(12,'2018_09_05_011516_create_pets_table',1),
	(13,'2018_09_05_011532_create_photos_table',1),
	(14,'2018_09_05_031913_create_votes_table',1);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla pets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pets`;

CREATE TABLE `pets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pets_user_id_foreign` (`user_id`),
  CONSTRAINT `pets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `pets` WRITE;
/*!40000 ALTER TABLE `pets` DISABLE KEYS */;

INSERT INTO `pets` (`id`, `name`, `user_id`, `created_at`, `updated_at`)
VALUES
	(1,'Allen',1,'2018-09-05 04:19:17','2018-09-05 04:19:17'),
	(2,'Aniii',2,'2018-09-05 04:20:39','2018-09-05 04:20:39'),
	(3,'A',3,'2018-09-05 04:24:35','2018-09-05 04:24:35'),
	(4,'Allen Schezar',4,'2018-09-05 04:27:40','2018-09-05 04:27:40'),
	(5,'Padme',5,'2018-09-05 04:29:32','2018-09-05 04:29:32');

/*!40000 ALTER TABLE `pets` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla photos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `photos`;

CREATE TABLE `photos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pet_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `photos_pet_id_foreign` (`pet_id`),
  CONSTRAINT `photos_pet_id_foreign` FOREIGN KEY (`pet_id`) REFERENCES `pets` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;

INSERT INTO `photos` (`id`, `image`, `pet_id`, `created_at`, `updated_at`)
VALUES
	(1,'1536121157-gatito-nd.jpg',1,'2018-09-05 04:19:17','2018-09-05 04:19:17'),
	(2,'1536121239-gatito-nd.jpg',2,'2018-09-05 04:20:39','2018-09-05 04:20:39'),
	(3,'1536121475-gatito-nd.jpg',3,'2018-09-05 04:24:35','2018-09-05 04:24:35'),
	(4,'1536121660-gatito-nd.jpg',4,'2018-09-05 04:27:40','2018-09-05 04:27:40'),
	(5,'1536121692-gatito-nd.jpg',4,'2018-09-05 04:28:12','2018-09-05 04:28:12'),
	(6,'1536121726-gatito-nd.jpg',4,'2018-09-05 04:28:46','2018-09-05 04:28:46'),
	(7,'1536121772-gatito-nd.jpg',5,'2018-09-05 04:29:32','2018-09-05 04:29:32'),
	(8,'1536121803-gatito-nd.jpg',5,'2018-09-05 04:30:03','2018-09-05 04:30:03');

/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `nickname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_nickname_unique` (`nickname`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `nickname`, `email`, `password`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(1,'','Nii',NULL,'',NULL,'2018-09-05 04:19:17','2018-09-05 04:19:17'),
	(2,'','Anakin',NULL,'',NULL,'2018-09-05 04:20:39','2018-09-05 04:20:39'),
	(3,'','N',NULL,'',NULL,'2018-09-05 04:24:35','2018-09-05 04:24:35'),
	(4,'','Adara',NULL,'',NULL,'2018-09-05 04:27:40','2018-09-05 04:27:40'),
	(5,'','Arya',NULL,'',NULL,'2018-09-05 04:29:32','2018-09-05 04:29:32'),
	(11,'Anya','','a@bs.cl','$2y$10$ITQY6L28xj443vY5waJFxOT/o5wjxJWW6d8uAYc04wfIAaEGxb56O','lsECuZF2A3OqNNUbUiKnntBKEbZ1ormdFNc8WL0KYtnOcggtGGAAZSHRtIZp','2018-09-05 05:04:57','2018-09-05 05:04:57');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla votes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `votes`;

CREATE TABLE `votes` (
  `user_id` int(10) unsigned NOT NULL,
  `pet_id` int(10) unsigned NOT NULL,
  `vote` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `votes_user_id_foreign` (`user_id`),
  KEY `votes_pet_id_foreign` (`pet_id`),
  CONSTRAINT `votes_pet_id_foreign` FOREIGN KEY (`pet_id`) REFERENCES `pets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `votes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `votes` WRITE;
/*!40000 ALTER TABLE `votes` DISABLE KEYS */;

INSERT INTO `votes` (`user_id`, `pet_id`, `vote`, `created_at`, `updated_at`)
VALUES
	(5,1,2,'2018-09-05 04:43:27','2018-09-05 04:43:27'),
	(5,3,2,'2018-09-05 04:43:34','2018-09-05 04:43:34'),
	(5,5,2,'2018-09-05 04:54:51','2018-09-05 04:54:51'),
	(5,5,2,'2018-09-05 04:54:57','2018-09-05 04:54:57'),
	(5,1,2,'2018-09-05 04:54:59','2018-09-05 04:54:59'),
	(5,5,2,'2018-09-05 04:58:48','2018-09-05 04:58:48');

/*!40000 ALTER TABLE `votes` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
