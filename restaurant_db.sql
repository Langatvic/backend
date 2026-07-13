-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: restaurant_db
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `foods`
--

DROP TABLE IF EXISTS `foods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foods` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price_kes` decimal(10,2) NOT NULL,
  `price_usd` decimal(10,2) NOT NULL,
  `price_eur` decimal(10,2) NOT NULL,
  `category` varchar(255) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT 1,
  `preparation_time` int(11) NOT NULL COMMENT 'in minutes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foods`
--

LOCK TABLES `foods` WRITE;
/*!40000 ALTER TABLE `foods` DISABLE KEYS */;
INSERT INTO `foods` VALUES (1,'Pizza','Tasty and sweet',600.00,4.62,4.26,'Pizza','http://batch-undermost-snugly.ngrok-free.dev/storage/foods/1781769431_scaled_images.jpg',1,20,'2026-06-18 07:57:22','2026-06-18 07:58:39'),(2,'Starters','An upscale Mediterranean appetizer spread perfect for sharing. Features classic tomato basil crostini drizzled with aged balsamic glaze, crisp golden calamari with tartar sauce, garlic herb sautéed shrimp, house-made hummus with warm pita wedges, and crispy spring rolls.',800.00,6.16,5.68,'Starters','http://batch-undermost-snugly.ngrok-free.dev/storage/foods/1782454517_scaled_1000843845.png',1,20,'2026-06-26 06:17:05','2026-06-26 06:17:05'),(3,'Artisanal Botanical & Latte Flight','A curated flight of refreshing craft drinks. Features a crisp cucumber-mint cooler, a vibrant mixed berry infused botanical water, a traditional warm chai latte with dusted cinnamon, and an elegant matcha green tea latte with delicate micro-foam art.',550.00,4.24,3.91,'Main Course','http://batch-undermost-snugly.ngrok-free.dev/storage/foods/1782454671_scaled_1000843836.png',1,15,'2026-06-26 06:20:10','2026-06-26 06:20:10'),(4,'Premium Raw Bar & Pasta Platter','A premium oceanic selection featuring fresh half-shell oysters, chilled prawns, and plump sea scallops served with fresh lemon wedges. Paired with a savory seafood-infused black tagliatelle pasta and crisp, golden parmesan herb crisps alongside artisanal seafood crostini.',950.00,7.32,6.75,'Seafood','http://batch-undermost-snugly.ngrok-free.dev/storage/foods/1782454965_scaled_1000843830.png',1,25,'2026-06-26 06:22:52','2026-06-26 06:22:52'),(5,'Burgers','Gourmet flame-grilled beef sliders served on toasted artisan brioche buns. Layered with melted vintage white cheddar, crisp arugula, ripe vine tomatoes, and thinly sliced red onions. Accompanied by a side of crispy, sea-salted sweet potato fries and a creamy garlic-herb dipping aioli.',850.00,6.54,6.04,'Burgers','http://batch-undermost-snugly.ngrok-free.dev/storage/foods/1782455011_scaled_1000843822.png',1,10,'2026-06-26 06:24:48','2026-06-26 06:24:48'),(6,'Main Course','A perfectly grilled ribeye steak on a white ceramic plate, side of roasted asparagus, gourmet restaurant plating, soft natural lighting, depth of field, 8k resolution, food photography.',650.00,5.00,4.62,'Main Course','http://batch-undermost-snugly.ngrok-free.dev/storage/foods/1782455124_scaled_1000843821.png',1,20,'2026-06-26 06:27:18','2026-06-26 06:27:18');
/*!40000 ALTER TABLE `foods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2026_06_01_000000_create_roles_table',1),(2,'2026_06_05_141807_create_users_table',1),(3,'2026_06_05_141808_create_tables_table',1),(4,'2026_06_05_141809_create_foods_table',1),(5,'2026_06_05_141813_create_orders_table',1),(6,'2026_06_05_141815_create_order_items_table',1),(7,'2026_06_05_141816_create_ratings_table',1),(8,'2026_06_18_095224_add_role_foreign_key_to_users_table',1),(9,'2019_12_14_000001_create_personal_access_tokens_table',2),(10,'2026_06_24_101416_add_is_public_to_ratings_table',3),(11,'2026_07_03_140943_create_sessions_table',4);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) unsigned NOT NULL,
  `food_id` bigint(20) unsigned NOT NULL,
  `quantity` int(11) NOT NULL,
  `price_kes` decimal(10,2) NOT NULL,
  `price_usd` decimal(10,2) NOT NULL,
  `price_eur` decimal(10,2) NOT NULL,
  `subtotal_kes` decimal(10,2) NOT NULL,
  `subtotal_usd` decimal(10,2) NOT NULL,
  `subtotal_eur` decimal(10,2) NOT NULL,
  `special_instructions` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_index` (`order_id`),
  KEY `order_items_food_id_index` (`food_id`),
  CONSTRAINT `order_items_food_id_foreign` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,1,1,600.00,4.62,4.26,600.00,4.62,4.26,NULL,'2026-06-18 09:56:06','2026-06-18 09:56:06'),(2,2,1,1,600.00,4.62,4.26,600.00,4.62,4.26,NULL,'2026-06-18 11:23:31','2026-06-18 11:23:31'),(3,3,1,1,600.00,4.62,4.26,600.00,4.62,4.26,NULL,'2026-06-18 12:19:34','2026-06-18 12:19:34'),(4,4,1,1,600.00,4.62,4.26,600.00,4.62,4.26,NULL,'2026-06-19 10:28:35','2026-06-19 10:28:35'),(5,5,1,1,600.00,4.62,4.26,600.00,4.62,4.26,NULL,'2026-06-22 09:20:33','2026-06-22 09:20:33'),(6,6,1,4,600.00,4.62,4.26,2400.00,18.48,17.04,NULL,'2026-06-24 08:26:59','2026-06-24 08:26:59'),(7,7,1,2,600.00,4.62,4.26,1200.00,9.24,8.52,NULL,'2026-06-24 10:00:42','2026-06-24 10:00:42'),(8,8,1,1,600.00,4.62,4.26,600.00,4.62,4.26,NULL,'2026-06-24 11:04:46','2026-06-24 11:04:46'),(9,9,1,2,600.00,4.62,4.26,1200.00,9.24,8.52,NULL,'2026-06-24 11:06:26','2026-06-24 11:06:26'),(10,10,1,1,600.00,4.62,4.26,600.00,4.62,4.26,NULL,'2026-06-24 11:15:16','2026-06-24 11:15:16'),(11,11,1,1,600.00,4.62,4.26,600.00,4.62,4.26,NULL,'2026-06-24 11:19:29','2026-06-24 11:19:29'),(12,12,1,1,600.00,4.62,4.26,600.00,4.62,4.26,NULL,'2026-06-24 11:22:36','2026-06-24 11:22:36'),(13,13,1,1,600.00,4.62,4.26,600.00,4.62,4.26,NULL,'2026-06-30 12:36:55','2026-06-30 12:36:55'),(14,14,2,1,800.00,6.16,5.68,800.00,6.16,5.68,NULL,'2026-07-02 07:13:26','2026-07-02 07:13:26'),(15,15,1,1,600.00,4.62,4.26,600.00,4.62,4.26,NULL,'2026-07-02 07:57:14','2026-07-02 07:57:14'),(16,16,4,1,950.00,7.32,6.75,950.00,7.32,6.75,NULL,'2026-07-02 08:15:28','2026-07-02 08:15:28'),(17,17,5,1,850.00,6.54,6.04,850.00,6.54,6.04,NULL,'2026-07-02 08:32:21','2026-07-02 08:32:21'),(18,18,6,1,650.00,5.00,4.62,650.00,5.00,4.62,NULL,'2026-07-02 09:04:09','2026-07-02 09:04:09'),(19,19,1,1,600.00,4.62,4.26,600.00,4.62,4.26,NULL,'2026-07-08 09:04:41','2026-07-08 09:04:41'),(20,19,3,1,550.00,4.24,3.91,550.00,4.24,3.91,NULL,'2026-07-08 09:04:41','2026-07-08 09:04:41'),(21,19,5,1,850.00,6.54,6.04,850.00,6.54,6.04,NULL,'2026-07-08 09:04:41','2026-07-08 09:04:41');
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `table_id` bigint(20) unsigned NOT NULL,
  `order_number` varchar(255) NOT NULL,
  `total_amount_kes` decimal(10,2) NOT NULL,
  `total_amount_usd` decimal(10,2) NOT NULL,
  `total_amount_eur` decimal(10,2) NOT NULL,
  `status` enum('pending','approved','preparing','ready','delivered','cancelled') NOT NULL DEFAULT 'pending',
  `is_delivered` tinyint(1) DEFAULT 0,
  `is_cancelled` tinyint(1) DEFAULT 0,
  `special_instructions` text DEFAULT NULL,
  `approved_at` timestamp NULL DEFAULT NULL,
  `delivered_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_order_number_unique` (`order_number`),
  KEY `orders_user_id_foreign` (`user_id`),
  KEY `orders_table_id_foreign` (`table_id`),
  KEY `orders_order_number_index` (`order_number`),
  KEY `orders_status_index` (`status`),
  KEY `orders_created_at_index` (`created_at`),
  KEY `idx_orders_is_delivered` (`is_delivered`),
  KEY `idx_orders_is_cancelled` (`is_cancelled`),
  CONSTRAINT `orders_table_id_foreign` FOREIGN KEY (`table_id`) REFERENCES `tables` (`id`) ON DELETE CASCADE,
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,5,1,'ORD-uGby2OGHU0',600.00,4.62,4.26,'cancelled',0,2,NULL,'2026-06-18 10:10:32','2026-06-18 10:10:45','2026-06-18 09:56:06','2026-06-18 12:19:03'),(2,5,1,'ORD-6KFlgsVRPF',600.00,4.62,4.26,'cancelled',0,2,NULL,NULL,NULL,'2026-06-18 11:23:31','2026-06-18 11:54:10'),(3,5,3,'ORD-CBTdPQJwDa',600.00,4.62,4.26,'cancelled',0,2,NULL,'2026-06-18 12:28:09',NULL,'2026-06-18 12:19:34','2026-06-18 12:28:28'),(4,5,4,'ORD-Re4Yq8C2zQ',600.00,4.62,4.26,'cancelled',0,2,NULL,NULL,NULL,'2026-06-19 10:28:35','2026-06-19 12:03:30'),(5,5,5,'ORD-T89JQINJil',600.00,4.62,4.26,'delivered',1,0,NULL,'2026-06-22 13:14:43','2026-06-22 13:15:16','2026-06-22 09:20:33','2026-06-22 13:15:16'),(6,6,5,'ORD-sQeSz4L9Hc',2400.00,18.48,17.04,'delivered',1,0,NULL,'2026-06-24 08:27:49','2026-06-24 08:28:25','2026-06-24 08:26:59','2026-06-24 08:28:25'),(7,6,5,'ORD-Hjw94U5UP8',1200.00,9.24,8.52,'cancelled',0,2,NULL,'2026-06-24 10:01:21',NULL,'2026-06-24 10:00:42','2026-06-24 10:02:00'),(8,6,1,'ORD-wXogZP0Cgv',600.00,4.62,4.26,'cancelled',0,2,NULL,'2026-06-24 11:04:57',NULL,'2026-06-24 11:04:46','2026-06-24 11:10:39'),(9,5,1,'ORD-N1AGwqpoEC',1200.00,9.24,8.52,'delivered',1,0,NULL,'2026-06-24 11:16:03','2026-06-24 11:22:08','2026-06-24 11:06:26','2026-06-24 11:22:08'),(10,6,1,'ORD-4RpwVblv7u',600.00,4.62,4.26,'cancelled',0,2,NULL,NULL,NULL,'2026-06-24 11:15:16','2026-06-24 11:16:41'),(11,6,1,'ORD-S8nQs2gboT',600.00,4.62,4.26,'delivered',1,0,NULL,'2026-06-24 11:20:05','2026-06-24 11:21:54','2026-06-24 11:19:29','2026-06-24 11:21:54'),(12,6,1,'ORD-Xg3LMTGG9o',600.00,4.62,4.26,'cancelled',0,2,NULL,'2026-06-24 11:22:46',NULL,'2026-06-24 11:22:36','2026-06-24 11:22:58'),(13,6,1,'ORD-rvYol2vT7k',600.00,4.62,4.26,'cancelled',0,2,NULL,'2026-06-30 12:39:14',NULL,'2026-06-30 12:36:55','2026-06-30 12:42:36'),(14,6,1,'ORD-pG7Z60eQrS',800.00,6.16,5.68,'cancelled',0,2,NULL,'2026-07-02 07:13:43',NULL,'2026-07-02 07:13:26','2026-07-02 07:14:10'),(15,6,1,'ORD-dVweT8lVKE',600.00,4.62,4.26,'cancelled',0,2,NULL,'2026-07-02 07:58:12',NULL,'2026-07-02 07:57:14','2026-07-02 07:58:32'),(16,6,3,'ORD-OgAfXQdvvy',950.00,7.32,6.75,'cancelled',0,0,NULL,'2026-07-02 08:16:54',NULL,'2026-07-02 08:15:28','2026-07-02 08:17:19'),(17,6,5,'ORD-qTWDRapa1C',850.00,6.54,6.04,'cancelled',0,2,NULL,'2026-07-02 08:33:06',NULL,'2026-07-02 08:32:21','2026-07-02 08:33:24'),(18,6,5,'ORD-0rLvv9ryKq',650.00,5.00,4.62,'approved',0,0,NULL,'2026-07-02 10:01:33',NULL,'2026-07-02 09:04:09','2026-07-02 10:01:33'),(19,5,1,'ORD-97Tr3DxIOP',2000.00,15.40,14.21,'approved',0,0,NULL,'2026-07-08 09:09:12',NULL,'2026-07-08 09:04:41','2026-07-08 09:09:12');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER free_table_on_order_cancel
AFTER UPDATE ON orders
FOR EACH ROW
BEGIN
    IF NEW.status = 'cancelled' AND OLD.status != 'cancelled' THEN
        UPDATE tables 
        SET status = 'available' 
        WHERE id = NEW.table_id AND status = 'occupied';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  KEY `personal_access_tokens_expires_at_index` (`expires_at`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (1,'App\\Models\\User',1,'auth_token','897c6fd5fe25dd9ccc2dda7dfe4e67b0a3b2b6e7121a5ba7cf0903c5120adaa7','[\"*\"]',NULL,NULL,'2026-06-18 07:23:04','2026-06-18 07:23:04'),(2,'App\\Models\\User',1,'auth_token','c511c8e74a7b37f67e7d1e32b2266dc39275d8285087b092f141561a313c7f83','[\"*\"]',NULL,NULL,'2026-06-18 07:24:07','2026-06-18 07:24:07'),(3,'App\\Models\\User',1,'auth_token','73e1ea1c7360528dcfc670866a66ba8af627632984a293fbe091d531ed89d083','[\"*\"]',NULL,NULL,'2026-06-18 07:25:38','2026-06-18 07:25:38'),(4,'App\\Models\\User',1,'auth_token','e1da1eee8770fecacd7561d5861fb145c6571a670d66635b6ee7cfc5c1273b5d','[\"*\"]',NULL,NULL,'2026-06-18 07:26:13','2026-06-18 07:26:13'),(5,'App\\Models\\User',1,'auth_token','429d415e7c1cfe497ebb54487ce3ea037fc89b1589306cbb6219505d0ba32781','[\"*\"]',NULL,NULL,'2026-06-18 07:26:31','2026-06-18 07:26:31'),(6,'App\\Models\\User',1,'auth_token','0a820dce6a53207680639dccda25b5d92cd84daa8073f3fb69d48ff7db60781d','[\"*\"]',NULL,NULL,'2026-06-18 07:26:59','2026-06-18 07:26:59'),(7,'App\\Models\\User',1,'auth_token','46a3f4bae149143a549623f4ed4d41af800d95b35c2af19c5e45e1fd78fdd97a','[\"*\"]',NULL,NULL,'2026-06-18 07:27:18','2026-06-18 07:27:18'),(8,'App\\Models\\User',1,'auth_token','dfa6af47be0e9fffa6d1ffafdfa5500dd1390f191c2877406b57d8f929f2bdf2','[\"*\"]',NULL,NULL,'2026-06-18 07:27:35','2026-06-18 07:27:35'),(9,'App\\Models\\User',1,'auth_token','5904fc8a56a331f2a3eece9584c83749f67f460fad4de3188ec096bcec58de2e','[\"*\"]',NULL,NULL,'2026-06-18 07:27:55','2026-06-18 07:27:55'),(10,'App\\Models\\User',1,'auth_token','c4ba3b37df81f5fb204564f66d9e303cb31d4a2539e1b0e46b51d376396404eb','[\"*\"]',NULL,NULL,'2026-06-18 07:28:08','2026-06-18 07:28:08'),(11,'App\\Models\\User',1,'auth_token','63b4a677fd17bf55b6df70d49f78d536df7d58bf8fcb161ba85554e70e492690','[\"*\"]',NULL,NULL,'2026-06-18 07:28:18','2026-06-18 07:28:18'),(12,'App\\Models\\User',1,'auth_token','02034c6a8e6a3b31b4aeefb7201ee5407866f7ba4a7eda009bc7769abd4c6e57','[\"*\"]',NULL,NULL,'2026-06-18 07:28:32','2026-06-18 07:28:32'),(13,'App\\Models\\User',1,'auth_token','58ac04441e12957dd54aa76635cafaaf905d952b0dd8a2ee1623392a95a06da5','[\"*\"]',NULL,NULL,'2026-06-18 07:28:45','2026-06-18 07:28:45'),(14,'App\\Models\\User',1,'auth_token','e50e638a9f0f84dfd5814139e42153f786de0558d79a525cf556a1c332df274d','[\"*\"]',NULL,NULL,'2026-06-18 07:29:02','2026-06-18 07:29:02'),(15,'App\\Models\\User',1,'auth_token','b5b9e58705a1e0d3c7a89e23dc71ae4843d0ec84f2495489a2c96579f562c97f','[\"*\"]',NULL,NULL,'2026-06-18 07:29:18','2026-06-18 07:29:18'),(16,'App\\Models\\User',1,'auth_token','4c3d85692ad94cd18e0593efca3bf84e62e0f87460b5eea50655a618da7e8e0e','[\"*\"]',NULL,NULL,'2026-06-18 07:29:26','2026-06-18 07:29:26'),(18,'App\\Models\\User',4,'auth_token','25fb0cbe0941a3d9bd8954b1460caaf581d30e5db1119b73063d60d7536c9a08','[\"*\"]',NULL,NULL,'2026-06-18 07:41:57','2026-06-18 07:41:57'),(21,'App\\Models\\User',5,'auth_token','71a08b2cc40a28a8f3d6211e5df59bc5bbe30845e06dc5eaeef64db87eea236b','[\"*\"]',NULL,NULL,'2026-06-18 08:15:22','2026-06-18 08:15:22'),(22,'App\\Models\\User',5,'auth_token','70fa37ede7d1e948cad7e7f21f05524f9ff1a566d6077f79af0f6319e1cf68b7','[\"*\"]','2026-06-18 08:18:08',NULL,'2026-06-18 08:15:39','2026-06-18 08:18:08'),(31,'App\\Models\\User',5,'auth_token','2303500212daba9341920a0f2f032e5cf4fcc769a78cd59ce78fd58b90f2129c','[\"*\"]','2026-06-18 11:23:31',NULL,'2026-06-18 11:23:05','2026-06-18 11:23:31'),(32,'App\\Models\\User',5,'auth_token','7b2c9b01f2eeee486b426a390523bf5cd8eb93f3c6671f4c637019c6030b93fd','[\"*\"]','2026-06-18 11:54:10',NULL,'2026-06-18 11:50:28','2026-06-18 11:54:10'),(33,'App\\Models\\User',5,'auth_token','dd6a9346b5db5bfc846adc6dfdd725e6c59c48a82972d1b417cbec4427c28a39','[\"*\"]','2026-06-19 10:28:45',NULL,'2026-06-18 12:18:39','2026-06-19 10:28:45'),(35,'App\\Models\\User',1,'auth_token','2c0b1a6380981095a70ca3c8806a5992f41ad4c04f5347fb1e98dfda769c8146','[\"*\"]','2026-06-18 12:33:30',NULL,'2026-06-18 12:32:46','2026-06-18 12:33:30'),(37,'App\\Models\\User',5,'auth_token','bcfccae7790c28602eddc35e94d4921d79c28494db55c38349fb809309becefc','[\"*\"]','2026-06-19 12:03:30',NULL,'2026-06-19 11:44:19','2026-06-19 12:03:30'),(44,'App\\Models\\User',1,'auth_token','f6373cb6ad3b0f91b8f5e490585b419cf3a4e8106bd3f4cbe6597f8e1f9fff3f','[\"*\"]','2026-06-19 13:02:46',NULL,'2026-06-19 12:59:19','2026-06-19 13:02:46'),(45,'App\\Models\\User',5,'auth_token','50449226d7e11fdf262010398f9593bf5e0598a734c9b4c2df9425f706e6f3a3','[\"*\"]','2026-06-22 09:20:32',NULL,'2026-06-22 09:17:35','2026-06-22 09:20:32'),(51,'App\\Models\\User',6,'auth_token','3a56dfb1e09873508001a428f6fb7a168cfefaa044d8fff62b79842844ee31b0','[\"*\"]',NULL,NULL,'2026-06-23 05:48:23','2026-06-23 05:48:23'),(71,'App\\Models\\User',1,'auth_token','6a2947f3e9160d12b349e8cf5122f701d78571f032307e3f94d8247e40ea3176','[\"*\"]','2026-06-26 06:28:49',NULL,'2026-06-26 05:50:38','2026-06-26 06:28:49'),(72,'App\\Models\\User',5,'auth_token','4bf788eb04704c1c485898b4be982504cd65c28795b2a23f6cd42da931120010','[\"*\"]',NULL,NULL,'2026-06-30 12:08:38','2026-06-30 12:08:38'),(74,'App\\Models\\User',6,'auth_token','6b80fddb99b044a77f5fe6b36f908977f1dc4bcf1082bc377a18debf8973c4c7','[\"*\"]',NULL,NULL,'2026-06-30 12:38:43','2026-06-30 12:38:43'),(75,'App\\Models\\User',4,'auth_token','0dace0cc1b7c3fd0eb515f1297a25b392eb099fdc859b4158bbe4ca7b75fce18','[\"*\"]','2026-07-02 10:17:15',NULL,'2026-06-30 12:39:06','2026-07-02 10:17:15'),(76,'App\\Models\\User',5,'auth_token','9e8d76d26e8f0c95389d7a16c75eddb578a884a63d2abef15e04f85ef569d564','[\"*\"]','2026-07-01 12:05:11',NULL,'2026-07-01 11:55:54','2026-07-01 12:05:11'),(77,'App\\Models\\User',5,'auth_token','152442aa459ce47c339fb65cd07f8cab6e6f5a344d0f64585e2a5a6f9b69a3be','[\"*\"]','2026-07-01 12:31:00',NULL,'2026-07-01 12:05:29','2026-07-01 12:31:00'),(81,'App\\Models\\User',5,'auth_token','63deacc3f2e68000278352293d4cc2c617799754c1141e4e53463d844b8cfc61','[\"*\"]',NULL,NULL,'2026-07-06 06:50:32','2026-07-06 06:50:32'),(82,'App\\Models\\User',5,'auth_token','06d9dfb9d31b0584011871700d20c143464109b0e36948e20446a291beed2ae8','[\"*\"]',NULL,NULL,'2026-07-06 06:50:34','2026-07-06 06:50:34'),(83,'App\\Models\\User',5,'auth_token','e20e02a7a6859d8618eb6607b9e39a4ef70c0ecd31e1d058b4e466cbbb7c88ef','[\"*\"]',NULL,NULL,'2026-07-06 09:27:24','2026-07-06 09:27:24'),(84,'App\\Models\\User',5,'auth_token','86c5109af3c7476cead9cd9cba7314ba648c19a637618001a0b0ea9cf676f621','[\"*\"]',NULL,NULL,'2026-07-06 13:09:45','2026-07-06 13:09:45'),(85,'App\\Models\\User',5,'auth_token','8a6a51f9ec3b7178f4b3ae368728562fa760606091cb972e98ee67ebc6ef3a32','[\"*\"]',NULL,NULL,'2026-07-06 13:21:03','2026-07-06 13:21:03'),(86,'App\\Models\\User',4,'auth_token','74eca3fe10d7ab73377e70a682e4ae8b04932ff71fb48deaabba401ad3b43d54','[\"*\"]','2026-07-08 09:09:15',NULL,'2026-07-08 09:07:26','2026-07-08 09:09:15');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ratings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `order_id` bigint(20) unsigned NOT NULL,
  `food_id` bigint(20) unsigned NOT NULL,
  `food_rating` int(11) NOT NULL COMMENT '1-5 stars',
  `service_rating` int(11) NOT NULL COMMENT '1-5 stars',
  `comment` text DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ratings_order_id_food_id_unique` (`order_id`,`food_id`),
  KEY `ratings_user_id_index` (`user_id`),
  KEY `ratings_food_id_index` (`food_id`),
  KEY `ratings_created_at_index` (`created_at`),
  CONSTRAINT `ratings_food_id_foreign` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ratings_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ratings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
INSERT INTO `ratings` VALUES (1,5,1,1,5,5,NULL,1,'2026-06-18 10:11:17','2026-06-18 10:11:17'),(2,5,5,1,5,5,'The food was good and delivery was done on time',1,'2026-06-22 13:16:48','2026-06-22 13:16:48'),(3,6,6,1,1,5,NULL,1,'2026-06-24 08:29:00','2026-06-24 08:29:00');
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`),
  UNIQUE KEY `roles_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Customer','customer','Regular customer who can browse and place orders','2026-06-18 06:54:19','2026-06-18 06:54:19'),(2,'Manager','manager','Restaurant manager who can manage orders and view reports','2026-06-18 06:54:19','2026-06-18 06:54:19'),(3,'Admin','admin','Super admin with full system access','2026-06-18 06:54:19','2026-06-18 06:54:19');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('IOGz2lp7pdXs02hYoV5pbnk6Kn1gc6iQ6Z9zhezn',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoibHNpOHdXbjBmb1AzUVRwczJIN0xlM0kxdWdDVlV2UnJZRXNMZThFZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1783676714),('lmatnRCtSqLi9m37PK1BvhdFfGkeFLglTA0gIWry',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoidmR2bGFWNlJkS2VjcnFaVVVlbnQ4N2Q4NkdMcTg3QmJQR1Y3YjNaMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1783677294);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tables`
--

DROP TABLE IF EXISTS `tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tables` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `table_number` varchar(255) NOT NULL,
  `capacity` int(11) NOT NULL,
  `status` enum('available','occupied','reserved') NOT NULL DEFAULT 'available',
  `qr_code` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tables_table_number_unique` (`table_number`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tables`
--

LOCK TABLES `tables` WRITE;
/*!40000 ALTER TABLE `tables` DISABLE KEYS */;
INSERT INTO `tables` VALUES (1,'T001',5,'occupied','PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZlcnNpb249IjEuMSIgd2lkdGg9IjIwMCIgaGVpZ2h0PSIyMDAiIHZpZXdCb3g9IjAgMCAyMDAgMjAwIj48cmVjdCB4PSIwIiB5PSIwIiB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iI2ZmZmZmZiIvPjxnIHRyYW5zZm9ybT0ic2NhbGUoNi44OTcpIj48ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgwLDApIj48cGF0aCBmaWxsLXJ1bGU9ImV2ZW5vZGQiIGQ9Ik04IDBMOCA0TDEwIDRMMTAgM0wxMSAzTDExIDRMMTIgNEwxMiAyTDExIDJMMTEgMFpNMTIgMEwxMiAxTDEzIDFMMTMgMFpNMTQgMEwxNCAxTDE1IDFMMTUgMFpNMTYgMUwxNiAyTDE1IDJMMTUgM0wxNCAzTDE0IDJMMTMgMkwxMyAzTDE0IDNMMTQgNEwxMyA0TDEzIDVMMTEgNUwxMSA2TDEwIDZMMTAgN0w5IDdMOSA1TDggNUw4IDdMOSA3TDkgOEwxMCA4TDEwIDdMMTEgN0wxMSA2TDEyIDZMMTIgOEwxMSA4TDExIDlMOSA5TDkgMTBMNiAxMEw2IDlMNyA5TDcgOEw0IDhMNCA5TDIgOUwyIDhMMCA4TDAgMTBMMSAxMEwxIDExTDAgMTFMMCAxNUwxIDE1TDEgMTZMMiAxNkwyIDE3TDAgMTdMMCAxOEwzIDE4TDMgMjBMMCAyMEwwIDIxTDQgMjFMNCAxOUw1IDE5TDUgMjFMNyAyMUw3IDIwTDYgMjBMNiAxOUw3IDE5TDcgMThMNiAxOEw2IDE3TDggMTdMOCAxNEw5IDE0TDkgMTVMMTEgMTVMMTEgMTRMMTAgMTRMMTAgMTNMMTEgMTNMMTEgMTJMMTIgMTJMMTIgMTNMMTMgMTNMMTMgMTRMMTUgMTRMMTUgMTVMMTQgMTVMMTQgMTZMMTMgMTZMMTMgMTVMMTIgMTVMMTIgMTZMMTAgMTZMMTAgMTdMMTIgMTdMMTIgMThMMTEgMThMMTEgMTlMMTAgMTlMMTAgMThMOSAxOEw5IDE5TDggMTlMOCAyMkw5IDIyTDkgMjNMOCAyM0w4IDI1TDkgMjVMOSAyNkwxMSAyNkwxMSAyN0w4IDI3TDggMjlMMTEgMjlMMTEgMjhMMTIgMjhMMTIgMjlMMTQgMjlMMTQgMjdMMTYgMjdMMTYgMjhMMTcgMjhMMTcgMjlMMTkgMjlMMTkgMjhMMTggMjhMMTggMjdMMTcgMjdMMTcgMjZMMTggMjZMMTggMjVMMjAgMjVMMjAgMjZMMjIgMjZMMjIgMjVMMjUgMjVMMjUgMjRMMjYgMjRMMjYgMjVMMjggMjVMMjggMjZMMjUgMjZMMjUgMjlMMjYgMjlMMjYgMjdMMjcgMjdMMjcgMjlMMjggMjlMMjggMjhMMjkgMjhMMjkgMjVMMjggMjVMMjggMjRMMjkgMjRMMjkgMjBMMjggMjBMMjggMjFMMjYgMjFMMjYgMTlMMjUgMTlMMjUgMjBMMjIgMjBMMjIgMTlMMjQgMTlMMjQgMThMMjUgMThMMjUgMTdMMjYgMTdMMjYgMTVMMjcgMTVMMjcgMTZMMjggMTZMMjggMTVMMjkgMTVMMjkgMTNMMjggMTNMMjggMTJMMjkgMTJMMjkgOEwyNSA4TDI1IDlMMjQgOUwyNCA4TDIzIDhMMjMgOUwyMSA5TDIxIDEwTDIwIDEwTDIwIDlMMTggOUwxOCA4TDIxIDhMMjEgNkwyMCA2TDIwIDVMMTkgNUwxOSA0TDIwIDRMMjAgM0wyMSAzTDIxIDFMMTkgMUwxOSAyTDE3IDJMMTcgMVpNOSAyTDkgM0wxMCAzTDEwIDJaTTE2IDJMMTYgM0wxNSAzTDE1IDRMMTggNEwxOCAzTDE3IDNMMTcgMlpNMTUgNUwxNSA5TDEzIDlMMTMgOEwxNCA4TDE0IDZMMTMgNkwxMyA4TDEyIDhMMTIgOUwxMSA5TDExIDEwTDkgMTBMOSAxMUw2IDExTDYgMTBMNSAxMEw1IDlMNCA5TDQgMTBMMyAxMEwzIDExTDEgMTFMMSAxM0wyIDEzTDIgMTRMMyAxNEwzIDE4TDQgMThMNCAxNkw3IDE2TDcgMTVMNSAxNUw1IDEzTDQgMTNMNCAxMkw1IDEyTDUgMTFMNiAxMUw2IDEyTDcgMTJMNyAxM0w2IDEzTDYgMTRMNyAxNEw3IDEzTDEwIDEzTDEwIDExTDExIDExTDExIDEwTDEyIDEwTDEyIDlMMTMgOUwxMyAxMEwxNSAxMEwxNSA5TDE2IDlMMTYgMTFMMTggMTFMMTggMTNMMTYgMTNMMTYgMTJMMTUgMTJMMTUgMTFMMTQgMTFMMTQgMTNMMTYgMTNMMTYgMTRMMTggMTRMMTggMTNMMTkgMTNMMTkgMTZMMTggMTZMMTggMTdMMTYgMTdMMTYgMTZMMTUgMTZMMTUgMTdMMTMgMTdMMTMgMTZMMTIgMTZMMTIgMTdMMTMgMTdMMTMgMThMMTUgMThMMTUgMTdMMTYgMTdMMTYgMThMMTcgMThMMTcgMTlMMTggMTlMMTggMjBMMTkgMjBMMTkgMTlMMjAgMTlMMjAgMjBMMjEgMjBMMjEgMThMMjIgMThMMjIgMTdMMjMgMTdMMjMgMThMMjQgMThMMjQgMTdMMjUgMTdMMjUgMTVMMjYgMTVMMjYgMTRMMjUgMTRMMjUgMTVMMjQgMTVMMjQgMTZMMjEgMTZMMjEgMTdMMjAgMTdMMjAgMTVMMjMgMTVMMjMgMTRMMjQgMTRMMjQgMTNMMjUgMTNMMjUgMTJMMjQgMTJMMjQgMTNMMjMgMTNMMjMgMTJMMjIgMTJMMjIgMTFMMjEgMTFMMjEgMTNMMTkgMTNMMTkgMTJMMjAgMTJMMjAgMTBMMTggMTBMMTggOUwxNyA5TDE3IDhMMTYgOEwxNiA2TDE3IDZMMTcgN0wxOCA3TDE4IDZMMTkgNkwxOSA3TDIwIDdMMjAgNkwxOSA2TDE5IDVaTTEgOUwxIDEwTDIgMTBMMiA5Wk0yMyA5TDIzIDEwTDI0IDEwTDI0IDlaTTI3IDlMMjcgMTBMMjYgMTBMMjYgMTNMMjcgMTNMMjcgMTFMMjggMTFMMjggOVpNNCAxMEw0IDExTDMgMTFMMyAxMkw0IDEyTDQgMTFMNSAxMUw1IDEwWk0xMiAxMUwxMiAxMkwxMyAxMkwxMyAxMVpNMjIgMTNMMjIgMTRMMjMgMTRMMjMgMTNaTTI3IDE0TDI3IDE1TDI4IDE1TDI4IDE0Wk0yOCAxN0wyOCAxOEwyNyAxOEwyNyAxOUwyOSAxOUwyOSAxN1pNOSAxOUw5IDIwTDEwIDIwTDEwIDIxTDExIDIxTDExIDI0TDEwIDI0TDEwIDIzTDkgMjNMOSAyNUwxMSAyNUwxMSAyNkwxMiAyNkwxMiAyNUwxMyAyNUwxMyAyNkwxNiAyNkwxNiAyNEwxNyAyNEwxNyAyM0wxOCAyM0wxOCAyNEwxOSAyNEwxOSAyMkwxOCAyMkwxOCAyMUwxNiAyMUwxNiAyMEwxNSAyMEwxNSAxOUwxNCAxOUwxNCAyMUwxNiAyMUwxNiAyMkwxNyAyMkwxNyAyM0wxNiAyM0wxNiAyNEwxNSAyNEwxNSAyNUwxMyAyNUwxMyAyNEwxNCAyNEwxNCAyM0wxNSAyM0wxNSAyMkwxMyAyMkwxMyAyMUwxMiAyMUwxMiAyMEwxMyAyMEwxMyAxOUwxMiAxOUwxMiAyMEwxMCAyMEwxMCAxOVpNMjEgMjFMMjEgMjRMMjQgMjRMMjQgMjFaTTI1IDIxTDI1IDIyTDI2IDIyTDI2IDI0TDI3IDI0TDI3IDIzTDI4IDIzTDI4IDIyTDI2IDIyTDI2IDIxWk0yMiAyMkwyMiAyM0wyMyAyM0wyMyAyMlpNMTIgMjNMMTIgMjRMMTEgMjRMMTEgMjVMMTIgMjVMMTIgMjRMMTMgMjRMMTMgMjNaTTEyIDI3TDEyIDI4TDEzIDI4TDEzIDI3Wk0yMCAyN0wyMCAyOUwyMSAyOUwyMSAyN1pNMjIgMjdMMjIgMjhMMjMgMjhMMjMgMjdaTTAgMEwwIDdMNyA3TDcgMFpNMSAxTDEgNkw2IDZMNiAxWk0yIDJMMiA1TDUgNUw1IDJaTTIyIDBMMjIgN0wyOSA3TDI5IDBaTTIzIDFMMjMgNkwyOCA2TDI4IDFaTTI0IDJMMjQgNUwyNyA1TDI3IDJaTTAgMjJMMCAyOUw3IDI5TDcgMjJaTTEgMjNMMSAyOEw2IDI4TDYgMjNaTTIgMjRMMiAyN0w1IDI3TDUgMjRaIiBmaWxsPSIjMDAwMDAwIi8+PC9nPjwvZz48L3N2Zz4K','2026-06-18 08:54:21','2026-07-08 09:04:41'),(2,'T002',10,'available','PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZlcnNpb249IjEuMSIgd2lkdGg9IjIwMCIgaGVpZ2h0PSIyMDAiIHZpZXdCb3g9IjAgMCAyMDAgMjAwIj48cmVjdCB4PSIwIiB5PSIwIiB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iI2ZmZmZmZiIvPjxnIHRyYW5zZm9ybT0ic2NhbGUoNi44OTcpIj48ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgwLDApIj48cGF0aCBmaWxsLXJ1bGU9ImV2ZW5vZGQiIGQ9Ik04IDBMOCAxTDkgMUw5IDJMOCAyTDggNUw5IDVMOSA0TDExIDRMMTEgNUwxMCA1TDEwIDEwTDkgMTBMOSAxMUw4IDExTDggMTJMOSAxMkw5IDE1TDEwIDE1TDEwIDE3TDkgMTdMOSAxNkw2IDE2TDYgMTVMOCAxNUw4IDEzTDcgMTNMNyAxMkw2IDEyTDYgMTNMNSAxM0w1IDExTDMgMTFMMyAxMEwyIDEwTDIgMTFMMSAxMUwxIDEyTDAgMTJMMCAxM0wxIDEzTDEgMTVMMCAxNUwwIDE3TDMgMTdMMyAxOUwyIDE5TDIgMjBMMSAyMEwxIDIxTDIgMjFMMiAyMEwzIDIwTDMgMjFMNSAyMUw1IDE5TDcgMTlMNyAyMEw2IDIwTDYgMjFMOCAyMUw4IDIyTDkgMjJMOSAyNEwxMCAyNEwxMCAyNUw4IDI1TDggMjlMOSAyOUw5IDI4TDExIDI4TDExIDI5TDEyIDI5TDEyIDI4TDE0IDI4TDE0IDI3TDE1IDI3TDE1IDI2TDE0IDI2TDE0IDI1TDEzIDI1TDEzIDI2TDEyIDI2TDEyIDI0TDE1IDI0TDE1IDI1TDE2IDI1TDE2IDI3TDE4IDI3TDE4IDI4TDE5IDI4TDE5IDI5TDIxIDI5TDIxIDI3TDIyIDI3TDIyIDI1TDIzIDI1TDIzIDI5TDI1IDI5TDI1IDI4TDI2IDI4TDI2IDI3TDI3IDI3TDI3IDI5TDI4IDI5TDI4IDI3TDI5IDI3TDI5IDI1TDI4IDI1TDI4IDI3TDI3IDI3TDI3IDI2TDI2IDI2TDI2IDI0TDI1IDI0TDI1IDIzTDI4IDIzTDI4IDI0TDI5IDI0TDI5IDIzTDI4IDIzTDI4IDIyTDI5IDIyTDI5IDIxTDI4IDIxTDI4IDIyTDI2IDIyTDI2IDIxTDI3IDIxTDI3IDIwTDI5IDIwTDI5IDE5TDI4IDE5TDI4IDE4TDI3IDE4TDI3IDE3TDI2IDE3TDI2IDE4TDI3IDE4TDI3IDE5TDI1IDE5TDI1IDE4TDI0IDE4TDI0IDE5TDI1IDE5TDI1IDIwTDIzIDIwTDIzIDE5TDIyIDE5TDIyIDE4TDIxIDE4TDIxIDE2TDIyIDE2TDIyIDE0TDI0IDE0TDI0IDE2TDIzIDE2TDIzIDE3TDI1IDE3TDI1IDE2TDI2IDE2TDI2IDE1TDI3IDE1TDI3IDE2TDI5IDE2TDI5IDEzTDI3IDEzTDI3IDEyTDI2IDEyTDI2IDE0TDI0IDE0TDI0IDEyTDI1IDEyTDI1IDExTDI4IDExTDI4IDEyTDI5IDEyTDI5IDExTDI4IDExTDI4IDEwTDI5IDEwTDI5IDhMMjggOEwyOCA5TDI3IDlMMjcgOEwyNCA4TDI0IDEwTDIzIDEwTDIzIDlMMjIgOUwyMiA4TDIwIDhMMjAgN0wyMSA3TDIxIDVMMjAgNUwyMCAzTDIxIDNMMjEgMEwxOSAwTDE5IDFMMTYgMUwxNiAwTDE1IDBMMTUgMUwxNiAxTDE2IDJMMTggMkwxOCAzTDE2IDNMMTYgNEwxNSA0TDE1IDNMMTQgM0wxNCA1TDEzIDVMMTMgM0wxMiAzTDEyIDRMMTEgNEwxMSAyTDE0IDJMMTQgMEwxMiAwTDEyIDFMMTEgMUwxMSAwTDEwIDBMMTAgMUw5IDFMOSAwWk0xOSAxTDE5IDNMMTggM0wxOCA0TDE3IDRMMTcgN0wxNiA3TDE2IDVMMTQgNUwxNCA2TDEzIDZMMTMgNUwxMiA1TDEyIDZMMTEgNkwxMSA4TDEyIDhMMTIgNkwxMyA2TDEzIDhMMTQgOEwxNCA5TDE1IDlMMTUgMTBMMTQgMTBMMTQgMTFMMTEgMTFMMTEgMTNMMTAgMTNMMTAgMTVMMTEgMTVMMTEgMTNMMTIgMTNMMTIgMTJMMTMgMTJMMTMgMTRMMTIgMTRMMTIgMTZMMTEgMTZMMTEgMThMMTAgMThMMTAgMjBMOSAyMEw5IDE3TDYgMTdMNiAxNkw1IDE2TDUgMTVMNiAxNUw2IDE0TDcgMTRMNyAxM0w2IDEzTDYgMTRMNSAxNEw1IDEzTDQgMTNMNCAxNEwzIDE0TDMgMTNMMiAxM0wyIDE0TDMgMTRMMyAxN0w0IDE3TDQgMTlMNSAxOUw1IDE3TDYgMTdMNiAxOEw3IDE4TDcgMTlMOCAxOUw4IDIxTDEwIDIxTDEwIDIyTDExIDIyTDExIDIzTDEwIDIzTDEwIDI0TDExIDI0TDExIDIzTDE0IDIzTDE0IDIyTDE1IDIyTDE1IDI0TDE5IDI0TDE5IDI1TDIwIDI1TDIwIDIzTDE5IDIzTDE5IDIyTDIwIDIyTDIwIDIxTDE5IDIxTDE5IDE5TDIxIDE5TDIxIDIwTDIyIDIwTDIyIDE5TDIxIDE5TDIxIDE4TDIwIDE4TDIwIDE3TDE5IDE3TDE5IDE5TDE4IDE5TDE4IDIxTDE3IDIxTDE3IDE4TDE4IDE4TDE4IDE2TDIwIDE2TDIwIDE1TDIxIDE1TDIxIDE0TDIyIDE0TDIyIDEzTDIzIDEzTDIzIDEyTDI0IDEyTDI0IDExTDIzIDExTDIzIDEwTDIyIDEwTDIyIDlMMjEgOUwyMSAxMEwyMCAxMEwyMCA4TDE5IDhMMTkgMTBMMTggMTBMMTggOUwxNiA5TDE2IDhMMTcgOEwxNyA3TDE4IDdMMTggNUwxOSA1TDE5IDNMMjAgM0wyMCAxWk04IDZMOCA3TDkgN0w5IDZaTTE0IDZMMTQgN0wxNSA3TDE1IDhMMTYgOEwxNiA3TDE1IDdMMTUgNlpNMTkgNkwxOSA3TDIwIDdMMjAgNlpNMCA4TDAgMTBMMSAxMEwxIDlMNCA5TDQgMTBMNSAxMEw1IDlMNCA5TDQgOFpNNiA4TDYgOUw3IDlMNyAxMEw2IDEwTDYgMTFMNyAxMUw3IDEwTDggMTBMOCA5TDkgOUw5IDhMOCA4TDggOUw3IDlMNyA4Wk0xMSA5TDExIDEwTDEyIDEwTDEyIDlaTTI1IDlMMjUgMTBMMjcgMTBMMjcgOVpNMiAxMUwyIDEyTDMgMTJMMyAxMVpNMTUgMTFMMTUgMTJMMTQgMTJMMTQgMTRMMTMgMTRMMTMgMTVMMTQgMTVMMTQgMThMMTMgMThMMTMgMjFMMTUgMjFMMTUgMTlMMTYgMTlMMTYgMThMMTcgMThMMTcgMTZMMTYgMTZMMTYgMTVMMTcgMTVMMTcgMTRMMTggMTRMMTggMTVMMjAgMTVMMjAgMTNMMTkgMTNMMTkgMTRMMTggMTRMMTggMTJMMTcgMTJMMTcgMTFaTTE5IDExTDE5IDEyTDIxIDEyTDIxIDEzTDIyIDEzTDIyIDEyTDIxIDEyTDIxIDExWk0xNiAxM0wxNiAxNEwxNCAxNEwxNCAxNUwxNiAxNUwxNiAxNEwxNyAxNEwxNyAxM1pNMSAxNUwxIDE2TDIgMTZMMiAxNVpNNCAxNkw0IDE3TDUgMTdMNSAxNlpNMTIgMTZMMTIgMTdMMTMgMTdMMTMgMTZaTTE1IDE2TDE1IDE3TDE2IDE3TDE2IDE2Wk0wIDE4TDAgMTlMMSAxOUwxIDE4Wk0xMSAxOUwxMSAyMEwxMiAyMEwxMiAxOVpNMTggMjFMMTggMjJMMTkgMjJMMTkgMjFaTTIxIDIxTDIxIDI0TDI0IDI0TDI0IDIxWk0yMiAyMkwyMiAyM0wyMyAyM0wyMyAyMlpNMTcgMjVMMTcgMjZMMTggMjZMMTggMjdMMTkgMjdMMTkgMjhMMjAgMjhMMjAgMjdMMjEgMjdMMjEgMjZMMjAgMjZMMjAgMjdMMTkgMjdMMTkgMjZMMTggMjZMMTggMjVaTTExIDI2TDExIDI4TDEyIDI4TDEyIDI2Wk0xMyAyNkwxMyAyN0wxNCAyN0wxNCAyNlpNMjQgMjZMMjQgMjdMMjYgMjdMMjYgMjZaTTAgMEwwIDdMNyA3TDcgMFpNMSAxTDEgNkw2IDZMNiAxWk0yIDJMMiA1TDUgNUw1IDJaTTIyIDBMMjIgN0wyOSA3TDI5IDBaTTIzIDFMMjMgNkwyOCA2TDI4IDFaTTI0IDJMMjQgNUwyNyA1TDI3IDJaTTAgMjJMMCAyOUw3IDI5TDcgMjJaTTEgMjNMMSAyOEw2IDI4TDYgMjNaTTIgMjRMMiAyN0w1IDI3TDUgMjRaIiBmaWxsPSIjMDAwMDAwIi8+PC9nPjwvZz48L3N2Zz4K','2026-06-18 10:15:52','2026-06-24 10:54:48'),(3,'T003',6,'available','PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZlcnNpb249IjEuMSIgd2lkdGg9IjIwMCIgaGVpZ2h0PSIyMDAiIHZpZXdCb3g9IjAgMCAyMDAgMjAwIj48cmVjdCB4PSIwIiB5PSIwIiB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iI2ZmZmZmZiIvPjxnIHRyYW5zZm9ybT0ic2NhbGUoNi44OTcpIj48ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgwLDApIj48cGF0aCBmaWxsLXJ1bGU9ImV2ZW5vZGQiIGQ9Ik04IDBMOCAxTDkgMUw5IDJMOCAyTDggNUw5IDVMOSA0TDExIDRMMTEgNUwxMCA1TDEwIDEwTDYgMTBMNiA5TDcgOUw3IDhMNiA4TDYgOUw0IDlMNCA4TDAgOEwwIDlMMSA5TDEgMTFMMCAxMUwwIDEzTDEgMTNMMSAxNEwwIDE0TDAgMTVMMiAxNUwyIDE3TDEgMTdMMSAxOEwwIDE4TDAgMTlMMSAxOUwxIDE4TDIgMThMMiAxOUwzIDE5TDMgMjBMNSAyMEw1IDIxTDggMjFMOCAyMkw5IDIyTDkgMjVMOCAyNUw4IDI5TDEwIDI5TDEwIDI3TDExIDI3TDExIDI2TDEyIDI2TDEyIDI4TDExIDI4TDExIDI5TDEyIDI5TDEyIDI4TDE0IDI4TDE0IDI3TDE1IDI3TDE1IDI2TDE0IDI2TDE0IDI1TDEzIDI1TDEzIDI2TDEyIDI2TDEyIDI0TDE1IDI0TDE1IDI1TDE2IDI1TDE2IDI3TDE4IDI3TDE4IDI4TDE5IDI4TDE5IDI5TDIxIDI5TDIxIDI3TDIyIDI3TDIyIDI1TDIzIDI1TDIzIDI5TDI1IDI5TDI1IDI4TDI2IDI4TDI2IDI3TDI3IDI3TDI3IDI5TDI4IDI5TDI4IDI3TDI5IDI3TDI5IDI1TDI4IDI1TDI4IDI3TDI3IDI3TDI3IDI2TDI2IDI2TDI2IDI0TDI1IDI0TDI1IDIzTDI4IDIzTDI4IDI0TDI5IDI0TDI5IDIzTDI4IDIzTDI4IDIyTDI5IDIyTDI5IDIxTDI4IDIxTDI4IDIyTDI2IDIyTDI2IDIxTDI3IDIxTDI3IDIwTDI5IDIwTDI5IDE5TDI4IDE5TDI4IDE4TDI3IDE4TDI3IDE3TDI2IDE3TDI2IDE4TDI3IDE4TDI3IDE5TDI1IDE5TDI1IDE4TDI0IDE4TDI0IDE5TDI1IDE5TDI1IDIwTDIzIDIwTDIzIDE5TDIyIDE5TDIyIDE4TDIxIDE4TDIxIDE2TDIyIDE2TDIyIDE0TDI0IDE0TDI0IDE2TDIzIDE2TDIzIDE3TDI1IDE3TDI1IDE2TDI2IDE2TDI2IDE1TDI3IDE1TDI3IDE2TDI5IDE2TDI5IDEzTDI3IDEzTDI3IDEyTDI2IDEyTDI2IDE0TDI0IDE0TDI0IDEyTDI1IDEyTDI1IDExTDI4IDExTDI4IDEyTDI5IDEyTDI5IDExTDI4IDExTDI4IDEwTDI5IDEwTDI5IDhMMjggOEwyOCA5TDI3IDlMMjcgOEwyNCA4TDI0IDEwTDIzIDEwTDIzIDlMMjIgOUwyMiA4TDIwIDhMMjAgN0wyMSA3TDIxIDVMMjAgNUwyMCAzTDIxIDNMMjEgMEwxOSAwTDE5IDFMMTYgMUwxNiAwTDE1IDBMMTUgMUwxNiAxTDE2IDJMMTggMkwxOCAzTDE2IDNMMTYgNEwxNSA0TDE1IDNMMTQgM0wxNCA1TDEzIDVMMTMgM0wxMiAzTDEyIDRMMTEgNEwxMSAyTDE0IDJMMTQgMEwxMiAwTDEyIDFMMTEgMUwxMSAwTDEwIDBMMTAgMUw5IDFMOSAwWk0xOSAxTDE5IDNMMTggM0wxOCA0TDE3IDRMMTcgN0wxNiA3TDE2IDVMMTQgNUwxNCA2TDEzIDZMMTMgNUwxMiA1TDEyIDZMMTEgNkwxMSA4TDEyIDhMMTIgNkwxMyA2TDEzIDhMMTQgOEwxNCA5TDE1IDlMMTUgMTBMMTQgMTBMMTQgMTFMMTEgMTFMMTEgMTNMMTAgMTNMMTAgMTRMOCAxNEw4IDE1TDkgMTVMOSAxNkw4IDE2TDggMThMNyAxOEw3IDE3TDYgMTdMNiAxNkw3IDE2TDcgMTVMNCAxNUw0IDEzTDUgMTNMNSAxNEw3IDE0TDcgMTNMOCAxM0w4IDEyTDkgMTJMOSAxMUw2IDExTDYgMTJMNSAxMkw1IDExTDQgMTFMNCAxM0wyIDEzTDIgMTJMMSAxMkwxIDEzTDIgMTNMMiAxNUwzIDE1TDMgMTdMMiAxN0wyIDE4TDMgMThMMyAxOUw1IDE5TDUgMjBMOCAyMEw4IDIxTDkgMjFMOSAyMEw4IDIwTDggMTlMMTIgMTlMMTIgMjBMMTEgMjBMMTEgMjFMMTAgMjFMMTAgMjNMMTQgMjNMMTQgMjJMMTUgMjJMMTUgMjRMMTkgMjRMMTkgMjVMMjAgMjVMMjAgMjNMMTkgMjNMMTkgMjJMMjAgMjJMMjAgMjFMMTkgMjFMMTkgMTlMMjEgMTlMMjEgMjBMMjIgMjBMMjIgMTlMMjEgMTlMMjEgMThMMjAgMThMMjAgMTdMMTkgMTdMMTkgMTlMMTggMTlMMTggMjFMMTcgMjFMMTcgMThMMTggMThMMTggMTZMMjAgMTZMMjAgMTVMMjEgMTVMMjEgMTRMMjIgMTRMMjIgMTNMMjMgMTNMMjMgMTJMMjQgMTJMMjQgMTFMMjMgMTFMMjMgMTBMMjIgMTBMMjIgOUwyMSA5TDIxIDEwTDIwIDEwTDIwIDhMMTkgOEwxOSAxMEwxOCAxMEwxOCA5TDE2IDlMMTYgOEwxNyA4TDE3IDdMMTggN0wxOCA1TDE5IDVMMTkgM0wyMCAzTDIwIDFaTTggNkw4IDdMOSA3TDkgNlpNMTQgNkwxNCA3TDE1IDdMMTUgOEwxNiA4TDE2IDdMMTUgN0wxNSA2Wk0xOSA2TDE5IDdMMjAgN0wyMCA2Wk04IDhMOCA5TDkgOUw5IDhaTTExIDlMMTEgMTBMMTIgMTBMMTIgOVpNMjUgOUwyNSAxMEwyNyAxMEwyNyA5Wk0xNiAxMEwxNiAxMUwxNSAxMUwxNSAxMkwxNCAxMkwxNCAxNEwxMyAxNEwxMyAxMkwxMiAxMkwxMiAxM0wxMSAxM0wxMSAxNUwxMCAxNUwxMCAxOEwxMSAxOEwxMSAxNkwxMiAxNkwxMiAxN0wxMyAxN0wxMyAxNkwxMiAxNkwxMiAxNEwxMyAxNEwxMyAxNUwxNCAxNUwxNCAxOEwxMyAxOEwxMyAyMUwxNSAyMUwxNSAxOUwxNiAxOUwxNiAxOEwxNyAxOEwxNyAxNkwxNiAxNkwxNiAxNUwxNyAxNUwxNyAxNEwxOCAxNEwxOCAxNUwyMCAxNUwyMCAxM0wxOSAxM0wxOSAxNEwxOCAxNEwxOCAxMkwxNyAxMkwxNyAxMFpNMTkgMTFMMTkgMTJMMjEgMTJMMjEgMTNMMjIgMTNMMjIgMTFaTTYgMTJMNiAxM0w3IDEzTDcgMTJaTTE2IDEzTDE2IDE0TDE0IDE0TDE0IDE1TDE2IDE1TDE2IDE0TDE3IDE0TDE3IDEzWk0xNSAxNkwxNSAxN0wxNiAxN0wxNiAxNlpNNCAxN0w0IDE4TDUgMThMNSAxN1pNNiAxOEw2IDE5TDcgMTlMNyAxOFpNMSAyMEwxIDIxTDIgMjFMMiAyMFpNMTggMjFMMTggMjJMMTkgMjJMMTkgMjFaTTIxIDIxTDIxIDI0TDI0IDI0TDI0IDIxWk0yMiAyMkwyMiAyM0wyMyAyM0wyMyAyMlpNMTcgMjVMMTcgMjZMMTggMjZMMTggMjdMMTkgMjdMMTkgMjhMMjAgMjhMMjAgMjdMMjEgMjdMMjEgMjZMMjAgMjZMMjAgMjdMMTkgMjdMMTkgMjZMMTggMjZMMTggMjVaTTkgMjZMOSAyN0wxMCAyN0wxMCAyNlpNMTMgMjZMMTMgMjdMMTQgMjdMMTQgMjZaTTI0IDI2TDI0IDI3TDI2IDI3TDI2IDI2Wk0wIDBMMCA3TDcgN0w3IDBaTTEgMUwxIDZMNiA2TDYgMVpNMiAyTDIgNUw1IDVMNSAyWk0yMiAwTDIyIDdMMjkgN0wyOSAwWk0yMyAxTDIzIDZMMjggNkwyOCAxWk0yNCAyTDI0IDVMMjcgNUwyNyAyWk0wIDIyTDAgMjlMNyAyOUw3IDIyWk0xIDIzTDEgMjhMNiAyOEw2IDIzWk0yIDI0TDIgMjdMNSAyN0w1IDI0WiIgZmlsbD0iIzAwMDAwMCIvPjwvZz48L2c+PC9zdmc+Cg==','2026-06-18 10:16:25','2026-07-02 08:15:28'),(4,'T004',5,'available','PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZlcnNpb249IjEuMSIgd2lkdGg9IjIwMCIgaGVpZ2h0PSIyMDAiIHZpZXdCb3g9IjAgMCAyMDAgMjAwIj48cmVjdCB4PSIwIiB5PSIwIiB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iI2ZmZmZmZiIvPjxnIHRyYW5zZm9ybT0ic2NhbGUoNi44OTcpIj48ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgwLDApIj48cGF0aCBmaWxsLXJ1bGU9ImV2ZW5vZGQiIGQ9Ik0xMCAwTDEwIDJMMTEgMkwxMSAwWk0xMiAwTDEyIDFMMTMgMUwxMyAyTDEyIDJMMTIgNEwxMyA0TDEzIDNMMTQgM0wxNCA0TDE1IDRMMTUgM0wxNiAzTDE2IDVMMTUgNUwxNSA2TDE0IDZMMTQgOEwxNSA4TDE1IDlMMTIgOUwxMiA3TDEzIDdMMTMgNUwxMSA1TDExIDZMMTAgNkwxMCA0TDExIDRMMTEgM0w4IDNMOCA0TDkgNEw5IDVMOCA1TDggN0w5IDdMOSA4TDYgOEw2IDlMNSA5TDUgOEwwIDhMMCA5TDIgOUwyIDEwTDMgMTBMMyA5TDQgOUw0IDEwTDUgMTBMNSAxMUw3IDExTDcgMTJMNSAxMkw1IDE0TDMgMTRMMyAxM0w0IDEzTDQgMTJMMyAxMkwzIDExTDEgMTFMMSAxMEwwIDEwTDAgMTJMMSAxMkwxIDE1TDAgMTVMMCAyMUwxIDIxTDEgMThMMiAxOEwyIDE5TDUgMTlMNSAyMEw2IDIwTDYgMjFMNyAyMUw3IDIwTDggMjBMOCAxOUwxMCAxOUwxMCAyMkw5IDIyTDkgMjFMOCAyMUw4IDIzTDEwIDIzTDEwIDIyTDExIDIyTDExIDI0TDEwIDI0TDEwIDI1TDkgMjVMOSAyNEw4IDI0TDggMjlMMTEgMjlMMTEgMjdMMTAgMjdMMTAgMjVMMTIgMjVMMTIgMjZMMTMgMjZMMTMgMjdMMTIgMjdMMTIgMjlMMTMgMjlMMTMgMjhMMTQgMjhMMTQgMjlMMTYgMjlMMTYgMjhMMTQgMjhMMTQgMjdMMTYgMjdMMTYgMjZMMTcgMjZMMTcgMjdMMTggMjdMMTggMjhMMTcgMjhMMTcgMjlMMjAgMjlMMjAgMjhMMjEgMjhMMjEgMjlMMjIgMjlMMjIgMjhMMjEgMjhMMjEgMjdMMjAgMjdMMjAgMjhMMTkgMjhMMTkgMjZMMjAgMjZMMjAgMjVMMjUgMjVMMjUgMjZMMjIgMjZMMjIgMjdMMjMgMjdMMjMgMjhMMjYgMjhMMjYgMjlMMjcgMjlMMjcgMjhMMjggMjhMMjggMjZMMjkgMjZMMjkgMjVMMjYgMjVMMjYgMjFMMjggMjFMMjggMjJMMjkgMjJMMjkgMTlMMjggMTlMMjggMThMMjkgMThMMjkgMTdMMjggMTdMMjggMTZMMjkgMTZMMjkgMTVMMjcgMTVMMjcgMTRMMjYgMTRMMjYgMTVMMjQgMTVMMjQgMTZMMjYgMTZMMjYgMTdMMjQgMTdMMjQgMTlMMjIgMTlMMjIgMThMMjMgMThMMjMgMTdMMjIgMTdMMjIgMTVMMjMgMTVMMjMgMTNMMjQgMTNMMjQgMTRMMjUgMTRMMjUgMTNMMjQgMTNMMjQgMTJMMjMgMTJMMjMgMTNMMjIgMTNMMjIgMTFMMjEgMTFMMjEgOUwyMiA5TDIyIDEwTDIzIDEwTDIzIDlMMjQgOUwyNCAxMEwyNSAxMEwyNSAxMkwyNiAxMkwyNiAxM0wyNyAxM0wyNyAxMkwyOCAxMkwyOCAxMUwyNyAxMUwyNyAxMkwyNiAxMkwyNiAxMEwyNSAxMEwyNSA5TDI2IDlMMjYgOEwyNSA4TDI1IDlMMjQgOUwyNCA4TDIzIDhMMjMgOUwyMiA5TDIyIDhMMjEgOEwyMSA0TDIwIDRMMjAgM0wyMSAzTDIxIDJMMTkgMkwxOSA0TDE4IDRMMTggM0wxNyAzTDE3IDFMMTYgMUwxNiAwTDE1IDBMMTUgMUwxNCAxTDE0IDBaTTE5IDBMMTkgMUwyMSAxTDIxIDBaTTggMUw4IDJMOSAyTDkgMVpNMTQgMkwxNCAzTDE1IDNMMTUgMlpNMTYgNUwxNiA2TDE1IDZMMTUgOEwxNiA4TDE2IDlMMTUgOUwxNSAxMEwxNiAxMEwxNiAxMUwxNyAxMUwxNyAxMkwxOCAxMkwxOCAxM0wxNCAxM0wxNCAxMkwxNSAxMkwxNSAxMUwxNCAxMUwxNCAxMkwxMyAxMkwxMyAxM0wxMiAxM0wxMiAxMUwxMyAxMUwxMyAxMEwxMiAxMEwxMiA5TDExIDlMMTEgOEwxMCA4TDEwIDlMOSA5TDkgMTFMOCAxMUw4IDlMNiA5TDYgMTBMNyAxMEw3IDExTDggMTFMOCAxMkwxMSAxMkwxMSAxM0wxMCAxM0wxMCAxNEw4IDE0TDggMTNMNiAxM0w2IDE0TDUgMTRMNSAxNUwzIDE1TDMgMTRMMiAxNEwyIDE1TDEgMTVMMSAxNkwyIDE2TDIgMThMNSAxOEw1IDE3TDMgMTdMMyAxNkw4IDE2TDggMTVMOSAxNUw5IDE2TDEwIDE2TDEwIDE1TDExIDE1TDExIDE0TDEzIDE0TDEzIDE1TDEyIDE1TDEyIDE3TDEwIDE3TDEwIDE5TDExIDE5TDExIDIyTDEzIDIyTDEzIDIzTDEyIDIzTDEyIDI1TDE1IDI1TDE1IDI0TDE0IDI0TDE0IDIzTDE1IDIzTDE1IDIyTDE2IDIyTDE2IDIzTDE3IDIzTDE3IDI0TDE4IDI0TDE4IDIzTDE3IDIzTDE3IDIyTDE4IDIyTDE4IDIxTDE0IDIxTDE0IDIwTDE1IDIwTDE1IDE5TDE0IDE5TDE0IDIwTDEzIDIwTDEzIDIxTDEyIDIxTDEyIDE5TDEzIDE5TDEzIDE4TDEyIDE4TDEyIDE3TDE1IDE3TDE1IDE4TDE2IDE4TDE2IDIwTDE4IDIwTDE4IDE5TDE3IDE5TDE3IDE4TDE5IDE4TDE5IDE5TDIwIDE5TDIwIDIwTDE5IDIwTDE5IDIyTDIwIDIyTDIwIDIwTDIxIDIwTDIxIDE4TDE5IDE4TDE5IDE2TDIwIDE2TDIwIDE3TDIxIDE3TDIxIDE2TDIwIDE2TDIwIDE1TDIyIDE1TDIyIDE0TDE4IDE0TDE4IDEzTDIxIDEzTDIxIDEyTDIwIDEyTDIwIDlMMTkgOUwxOSA3TDIwIDdMMjAgNVpNOSA2TDkgN0wxMCA3TDEwIDZaTTExIDZMMTEgN0wxMiA3TDEyIDZaTTE2IDZMMTYgN0wxNyA3TDE3IDZaTTE4IDZMMTggN0wxOSA3TDE5IDZaTTE3IDhMMTcgOUwxOCA5TDE4IDEwTDE3IDEwTDE3IDExTDE4IDExTDE4IDEyTDE5IDEyTDE5IDlMMTggOUwxOCA4Wk0yNyA4TDI3IDEwTDI5IDEwTDI5IDlMMjggOUwyOCA4Wk0xMCA5TDEwIDExTDExIDExTDExIDlaTTIgMTJMMiAxM0wzIDEzTDMgMTJaTTI4IDEzTDI4IDE0TDI5IDE0TDI5IDEzWk02IDE0TDYgMTVMNyAxNUw3IDE0Wk0xNSAxNEwxNSAxNUwxNCAxNUwxNCAxNkwxNSAxNkwxNSAxN0wxOCAxN0wxOCAxNkwxNiAxNkwxNiAxNFpNMjYgMTVMMjYgMTZMMjcgMTZMMjcgMTVaTTYgMTdMNiAxOEw3IDE4TDcgMTlMNiAxOUw2IDIwTDcgMjBMNyAxOUw4IDE5TDggMTdaTTI1IDE4TDI1IDE5TDI2IDE5TDI2IDIwTDI1IDIwTDI1IDIxTDI2IDIxTDI2IDIwTDI4IDIwTDI4IDE5TDI3IDE5TDI3IDE4Wk0yIDIwTDIgMjFMMyAyMUwzIDIwWk0yMSAyMUwyMSAyNEwyNCAyNEwyNCAyMVpNMjIgMjJMMjIgMjNMMjMgMjNMMjMgMjJaTTI3IDIzTDI3IDI0TDI4IDI0TDI4IDIzWk0xOSAyNEwxOSAyNUwxOCAyNUwxOCAyNkwxOSAyNkwxOSAyNUwyMCAyNUwyMCAyNFpNOSAyN0w5IDI4TDEwIDI4TDEwIDI3Wk0yNiAyN0wyNiAyOEwyNyAyOEwyNyAyN1pNMCAwTDAgN0w3IDdMNyAwWk0xIDFMMSA2TDYgNkw2IDFaTTIgMkwyIDVMNSA1TDUgMlpNMjIgMEwyMiA3TDI5IDdMMjkgMFpNMjMgMUwyMyA2TDI4IDZMMjggMVpNMjQgMkwyNCA1TDI3IDVMMjcgMlpNMCAyMkwwIDI5TDcgMjlMNyAyMlpNMSAyM0wxIDI4TDYgMjhMNiAyM1pNMiAyNEwyIDI3TDUgMjdMNSAyNFoiIGZpbGw9IiMwMDAwMDAiLz48L2c+PC9nPjwvc3ZnPgo=','2026-06-18 10:16:48','2026-06-24 10:54:48'),(5,'T005',10,'occupied','PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZlcnNpb249IjEuMSIgd2lkdGg9IjIwMCIgaGVpZ2h0PSIyMDAiIHZpZXdCb3g9IjAgMCAyMDAgMjAwIj48cmVjdCB4PSIwIiB5PSIwIiB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgZmlsbD0iI2ZmZmZmZiIvPjxnIHRyYW5zZm9ybT0ic2NhbGUoNi44OTcpIj48ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgwLDApIj48cGF0aCBmaWxsLXJ1bGU9ImV2ZW5vZGQiIGQ9Ik04IDBMOCAxTDkgMUw5IDJMOCAyTDggNUw5IDVMOSA0TDExIDRMMTEgNUwxMCA1TDEwIDEwTDkgMTBMOSA4TDggOEw4IDlMNyA5TDcgOEw2IDhMNiA5TDcgOUw3IDEwTDUgMTBMNSA5TDQgOUw0IDhMMCA4TDAgMTBMMSAxMEwxIDExTDAgMTFMMCAxMkwxIDEyTDEgMTFMMyAxMUwzIDEzTDQgMTNMNCAxNUw1IDE1TDUgMTZMNiAxNkw2IDE3TDggMTdMOCAxOUw5IDE5TDkgMjBMMTAgMjBMMTAgMjNMOSAyM0w5IDI1TDggMjVMOCAyOUwxMiAyOUwxMiAyOEwxNCAyOEwxNCAyN0wxNSAyN0wxNSAyNkwxNCAyNkwxNCAyNUwxMyAyNUwxMyAyNkwxMiAyNkwxMiAyNEwxNSAyNEwxNSAyNUwxNiAyNUwxNiAyN0wxOCAyN0wxOCAyOEwxOSAyOEwxOSAyOUwyMSAyOUwyMSAyN0wyMiAyN0wyMiAyNUwyMyAyNUwyMyAyOUwyNSAyOUwyNSAyOEwyNiAyOEwyNiAyN0wyNyAyN0wyNyAyOUwyOCAyOUwyOCAyN0wyOSAyN0wyOSAyNUwyOCAyNUwyOCAyN0wyNyAyN0wyNyAyNkwyNiAyNkwyNiAyNEwyNSAyNEwyNSAyM0wyOCAyM0wyOCAyNEwyOSAyNEwyOSAyM0wyOCAyM0wyOCAyMkwyOSAyMkwyOSAyMUwyOCAyMUwyOCAyMkwyNiAyMkwyNiAyMUwyNyAyMUwyNyAyMEwyOSAyMEwyOSAxOUwyOCAxOUwyOCAxOEwyNyAxOEwyNyAxN0wyNiAxN0wyNiAxOEwyNyAxOEwyNyAxOUwyNSAxOUwyNSAxOEwyNCAxOEwyNCAxOUwyNSAxOUwyNSAyMEwyMyAyMEwyMyAxOUwyMiAxOUwyMiAxOEwyMSAxOEwyMSAxNkwyMiAxNkwyMiAxNEwyNCAxNEwyNCAxNkwyMyAxNkwyMyAxN0wyNSAxN0wyNSAxNkwyNiAxNkwyNiAxNUwyNyAxNUwyNyAxNkwyOSAxNkwyOSAxM0wyNyAxM0wyNyAxMkwyNiAxMkwyNiAxNEwyNCAxNEwyNCAxMkwyNSAxMkwyNSAxMUwyOCAxMUwyOCAxMkwyOSAxMkwyOSAxMUwyOCAxMUwyOCAxMEwyOSAxMEwyOSA4TDI4IDhMMjggOUwyNyA5TDI3IDhMMjQgOEwyNCAxMEwyMyAxMEwyMyA5TDIyIDlMMjIgOEwyMCA4TDIwIDdMMjEgN0wyMSA1TDIwIDVMMjAgM0wyMSAzTDIxIDBMMTkgMEwxOSAxTDE2IDFMMTYgMEwxNSAwTDE1IDFMMTYgMUwxNiAyTDE4IDJMMTggM0wxNiAzTDE2IDRMMTUgNEwxNSAzTDE0IDNMMTQgNUwxMyA1TDEzIDNMMTIgM0wxMiA0TDExIDRMMTEgMkwxNCAyTDE0IDBMMTIgMEwxMiAxTDExIDFMMTEgMEwxMCAwTDEwIDFMOSAxTDkgMFpNMTkgMUwxOSAzTDE4IDNMMTggNEwxNyA0TDE3IDdMMTYgN0wxNiA1TDE0IDVMMTQgNkwxMyA2TDEzIDVMMTIgNUwxMiA2TDExIDZMMTEgOEwxMiA4TDEyIDZMMTMgNkwxMyA4TDE0IDhMMTQgOUwxNSA5TDE1IDEwTDE0IDEwTDE0IDExTDExIDExTDExIDEzTDkgMTNMOSAxMkw4IDEyTDggMTFMNiAxMUw2IDEyTDggMTJMOCAxM0w2IDEzTDYgMTRMOCAxNEw4IDE2TDkgMTZMOSAxN0wxMCAxN0wxMCAxNEwxMSAxNEwxMSAxM0wxMiAxM0wxMiAxMkwxMyAxMkwxMyAxNEwxMiAxNEwxMiAxNkwxMSAxNkwxMSAxOEw5IDE4TDkgMTlMMTAgMTlMMTAgMjBMMTEgMjBMMTEgMjNMMTAgMjNMMTAgMjRMMTEgMjRMMTEgMjNMMTQgMjNMMTQgMjJMMTUgMjJMMTUgMjRMMTkgMjRMMTkgMjVMMjAgMjVMMjAgMjNMMTkgMjNMMTkgMjJMMjAgMjJMMjAgMjFMMTkgMjFMMTkgMTlMMjEgMTlMMjEgMjBMMjIgMjBMMjIgMTlMMjEgMTlMMjEgMThMMjAgMThMMjAgMTdMMTkgMTdMMTkgMTlMMTggMTlMMTggMjFMMTcgMjFMMTcgMThMMTggMThMMTggMTZMMjAgMTZMMjAgMTVMMjEgMTVMMjEgMTRMMjIgMTRMMjIgMTNMMjMgMTNMMjMgMTJMMjQgMTJMMjQgMTFMMjMgMTFMMjMgMTBMMjIgMTBMMjIgOUwyMSA5TDIxIDEwTDIwIDEwTDIwIDhMMTkgOEwxOSAxMEwxOCAxMEwxOCA5TDE2IDlMMTYgOEwxNyA4TDE3IDdMMTggN0wxOCA1TDE5IDVMMTkgM0wyMCAzTDIwIDFaTTggNkw4IDdMOSA3TDkgNlpNMTQgNkwxNCA3TDE1IDdMMTUgOEwxNiA4TDE2IDdMMTUgN0wxNSA2Wk0xOSA2TDE5IDdMMjAgN0wyMCA2Wk0yIDlMMiAxMEwzIDEwTDMgMTFMNCAxMUw0IDEyTDUgMTJMNSAxMUw0IDExTDQgMTBMMyAxMEwzIDlaTTExIDlMMTEgMTBMMTIgMTBMMTIgOVpNMjUgOUwyNSAxMEwyNyAxMEwyNyA5Wk0xNiAxMEwxNiAxMUwxNyAxMUwxNyAxMFpNMjEgMTBMMjEgMTFMMTkgMTFMMTkgMTJMMjEgMTJMMjEgMTNMMjIgMTNMMjIgMTJMMjMgMTJMMjMgMTFMMjIgMTFMMjIgMTBaTTE0IDEyTDE0IDE0TDEzIDE0TDEzIDE1TDE0IDE1TDE0IDE4TDEzIDE4TDEzIDIxTDE1IDIxTDE1IDE5TDE2IDE5TDE2IDE4TDE3IDE4TDE3IDE2TDE2IDE2TDE2IDE1TDE3IDE1TDE3IDE0TDE4IDE0TDE4IDE1TDIwIDE1TDIwIDEzTDE5IDEzTDE5IDE0TDE4IDE0TDE4IDEyWk0wIDEzTDAgMTRMMiAxNEwyIDE1TDMgMTVMMyAxNEwyIDE0TDIgMTNaTTggMTNMOCAxNEw5IDE0TDkgMTNaTTE2IDEzTDE2IDE0TDE0IDE0TDE0IDE1TDE2IDE1TDE2IDE0TDE3IDE0TDE3IDEzWk02IDE1TDYgMTZMNyAxNkw3IDE1Wk0wIDE2TDAgMTdMMSAxN0wxIDE4TDAgMThMMCAxOUwxIDE5TDEgMThMMiAxOEwyIDE3TDMgMTdMMyAxNkwyIDE2TDIgMTdMMSAxN0wxIDE2Wk0xMiAxNkwxMiAxN0wxMyAxN0wxMyAxNlpNMTUgMTZMMTUgMTdMMTYgMTdMMTYgMTZaTTQgMThMNCAxOUwzIDE5TDMgMjBMMSAyMEwxIDIxTDMgMjFMMyAyMEw0IDIwTDQgMTlMNSAxOUw1IDE4Wk02IDE4TDYgMTlMNyAxOUw3IDE4Wk0xMSAxOUwxMSAyMEwxMiAyMEwxMiAxOVpNNSAyMEw1IDIxTDggMjFMOCAyMkw5IDIyTDkgMjFMOCAyMUw4IDIwWk0xOCAyMUwxOCAyMkwxOSAyMkwxOSAyMVpNMjEgMjFMMjEgMjRMMjQgMjRMMjQgMjFaTTIyIDIyTDIyIDIzTDIzIDIzTDIzIDIyWk05IDI1TDkgMjZMMTEgMjZMMTEgMjdMOSAyN0w5IDI4TDEyIDI4TDEyIDI2TDExIDI2TDExIDI1Wk0xNyAyNUwxNyAyNkwxOCAyNkwxOCAyN0wxOSAyN0wxOSAyOEwyMCAyOEwyMCAyN0wyMSAyN0wyMSAyNkwyMCAyNkwyMCAyN0wxOSAyN0wxOSAyNkwxOCAyNkwxOCAyNVpNMTMgMjZMMTMgMjdMMTQgMjdMMTQgMjZaTTI0IDI2TDI0IDI3TDI2IDI3TDI2IDI2Wk0wIDBMMCA3TDcgN0w3IDBaTTEgMUwxIDZMNiA2TDYgMVpNMiAyTDIgNUw1IDVMNSAyWk0yMiAwTDIyIDdMMjkgN0wyOSAwWk0yMyAxTDIzIDZMMjggNkwyOCAxWk0yNCAyTDI0IDVMMjcgNUwyNyAyWk0wIDIyTDAgMjlMNyAyOUw3IDIyWk0xIDIzTDEgMjhMNiAyOEw2IDIzWk0yIDI0TDIgMjdMNSAyN0w1IDI0WiIgZmlsbD0iIzAwMDAwMCIvPjwvZz48L2c+PC9zdmc+Cg==','2026-06-19 12:08:08','2026-07-02 09:04:09');
/*!40000 ALTER TABLE `tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `phone` varchar(255) DEFAULT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Super Admin','admin@restaurant.com','$2y$12$UY7jDobmYSVYLtVWNF3lBeushFzuGqdf4eCbIe.IjnEvT0TlSRCee',3,'0700000000',NULL,NULL,'2026-06-18 07:09:38','2026-06-18 07:15:34'),(3,'Test Customer','customer@restaurant.com','$2y$12$u8IZUKo9DWbe9I8W.o/wfeSn1BaVuy8/AjEhE7eEJxIeQbIdeK8w.',1,'0722222222',NULL,NULL,'2026-06-18 07:09:38','2026-06-18 07:15:35'),(4,'Kevin','kevin@gmail.com','$2y$12$WoLd3Dnvre.ndYtg2B8TT.nn0iUyXGhsM4TPHxUOitkDyDrUyk2vO',2,'0706353423',NULL,NULL,'2026-06-18 07:41:57','2026-06-18 07:41:58'),(5,'victor kipkemoi','victorkipkemoi@gmail.com','$2y$12$5bIQRvRa8Poz9tagdNTfOOXpG.bzyuEwWaDCBiO134qe.dirsg76a',1,'0706353423',NULL,NULL,'2026-06-18 08:15:22','2026-06-19 12:51:27'),(6,'Kipkemoi','victor@gmail.com','$2y$12$xSY8D01kZXXaWGQXiRdAue1LZo7lZW1B/LqC9RLcHbUi7cdH0yCfm',1,'0706353423',NULL,NULL,'2026-06-23 05:48:23','2026-06-23 05:48:23');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-13  9:46:47
