-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: ankand
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.22.04.1

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
-- Table structure for table `auctions_auction`
--

DROP TABLE IF EXISTS `auctions_auction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auctions_auction` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `description` longtext,
  `price` decimal(10,2) NOT NULL,
  `quantity` int unsigned DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  `condition` varchar(50) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_expired` datetime(6) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `closed` tinyint(1) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `author_id` bigint DEFAULT NULL,
  `winnerBid_id` bigint DEFAULT NULL,
  `details_description` longtext,
  `category_id` bigint DEFAULT NULL,
  `image1` varchar(100) DEFAULT NULL,
  `image2` varchar(100) DEFAULT NULL,
  `latest_bid` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `auctions_auction_winnerBid_id_3b97ddd9_fk_auctions_bidder_id` (`winnerBid_id`),
  KEY `auctions_auction_author_id_4a59a0bb_fk_users_userprofile_id` (`author_id`),
  KEY `auctions_auction_category_id_63c8e40c_fk_auctions_category_id` (`category_id`),
  CONSTRAINT `auctions_auction_author_id_4a59a0bb_fk_users_userprofile_id` FOREIGN KEY (`author_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `auctions_auction_category_id_63c8e40c_fk_auctions_category_id` FOREIGN KEY (`category_id`) REFERENCES `auctions_category` (`id`),
  CONSTRAINT `auctions_auction_winnerBid_id_3b97ddd9_fk_auctions_bidder_id` FOREIGN KEY (`winnerBid_id`) REFERENCES `auctions_bidder` (`id`),
  CONSTRAINT `auctions_auction_chk_1` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auctions_auction`
--

LOCK TABLES `auctions_auction` WRITE;
/*!40000 ALTER TABLE `auctions_auction` DISABLE KEYS */;
INSERT INTO `auctions_auction` VALUES (1,'Creative Fashion Riboon Digital Watch Little Elegant.','creative-fashion-riboon-digital-watch-little-elega','How can have anything you ant in life if you ?\r\nIf you’ve been following the crypto space, you’ve likely heard of Non-Fungible Tokens (Biddings), more popularly referred to',465.00,1,'images/prod-gallery1_iD9R3AM.png','New','2024-02-29 20:02:12.000000','2024-03-29 20:50:52.000000',1,0,'2024-02-29 20:03:14.357538','2024-03-14 19:50:23.195119',2,2,'as ‘Crypto Collectibles.’ The world of Biddings is growing rapidly. It seems there is no slowing down of these assets as they continue to go up in price. This growth comes with the opportunity for people to start new businesses',1,'','',467.00),(4,'Brand New royal Enfield 250 CC For Sale','brand-new-royal-enfield-250-cc-for-sale-3','But getting your own auction site up and running has always required learning complex coding langua ges, or hiring an expensive design firm for thousands of dollars and months of work.',19000.00,100,'images/live-auc1_i6UvnaM.png','New','2024-02-29 20:03:17.000000','2024-03-16 20:00:52.000000',1,0,'2024-02-29 20:05:08.638479','2024-03-14 19:44:10.154931',2,NULL,'How can have anything you ant in life if you ?\r\nIf you’ve been following the crypto space, you’ve likely heard of Non-Fungible Tokens (Biddings), more popularly referred to as ‘Crypto Collectibles.’ The world of Biddings is growing rapidly. It seems there is no slowing down of these assets as they continue to go up in price. This growth comes with the opportunity for people to start new businesses',2,'','',19003.00),(6,'Havit HV-G61 USB Black Double Game Pad With Vibrat','havit-hv-g61-usb-black-double-game-pad-with-vibrat','How can have anything you ant in life if you ?\r\nIf you’ve been following the crypto space, you’ve likely heard of Non-Fungible Tokens (Biddings), more popularly referred',8499.99,1,'images/live-auc4_kQ9IUtS.png','Used','2024-02-29 20:07:07.000000','2024-03-16 20:27:30.000000',1,0,'2024-02-29 20:08:05.926737','2024-03-14 17:09:01.219624',2,NULL,'How can have anything you ant in life if you ?\r\nIf you’ve been following the crypto space, you’ve likely heard of Non-Fungible Tokens (Biddings), more popularly referred to as ‘Crypto Collectibles.’ The world of Biddings is growing rapidly. It seems there is no slowing down of these assets as they continue to go up in price. This growth comes with the opportunity for people to start new businesses',3,'','',NULL),(8,'Brand New Honda CBR 600 RR For Special Sale (2022)','brand-new-honda-cbr-600-rr-for-special-sale-2022','How can have anything you ant in life if you ?\r\nIf you’ve been following the crypto space, you’ve likely heard of Non-Fungible Tokens (Biddings), more popularly referred',65999.00,100,'images/live-auc3.png','New','2024-02-29 20:43:43.000000','2024-03-12 20:39:53.000000',0,1,'2024-02-29 20:45:23.438277','2024-03-14 18:52:45.682054',4,3,'How can have anything you ant in life if you ?\r\nIf you’ve been following the crypto space, you’ve likely heard of Non-Fungible Tokens (Biddings), more popularly referred to as ‘Crypto Collectibles.’ The world of Biddings is growing rapidly. It seems there is no slowing down of these assets as they continue to go up in price. This growth comes with the opportunity for people to start new businessesHow can have anything you ant in life if you ?\r\nIf you’ve been following the crypto space, you’ve likely heard of Non-Fungible Tokens (Biddings), more popularly referred to as ‘Crypto Collectibles.’ The world of Biddings is growing rapidly. It seems there is no slowing down of these assets as they continue to go up in price. This growth comes with the opportunity for people to start new businessesHow can have anything you ant in life if you ?\r\nIf you’ve been following the crypto space, you’ve likely heard of Non-Fungible Tokens (Biddings), more popularly referred to as ‘Crypto Collectibles.’',1,'images/live-auc1_GQCU1sV.png','images/live-auc3_hH00g1Y.png',NULL);
/*!40000 ALTER TABLE `auctions_auction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auctions_bidder`
--

DROP TABLE IF EXISTS `auctions_bidder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auctions_bidder` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `bid_amount` varchar(255) NOT NULL,
  `winningBid` tinyint(1) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `auction_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `auctions_bidder_auction_id_7fa9ed54_fk_auctions_auction_id` (`auction_id`),
  KEY `auctions_bidder_user_id_7bbe73fb_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `auctions_bidder_auction_id_7fa9ed54_fk_auctions_auction_id` FOREIGN KEY (`auction_id`) REFERENCES `auctions_auction` (`id`),
  CONSTRAINT `auctions_bidder_user_id_7bbe73fb_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auctions_bidder`
--

LOCK TABLES `auctions_bidder` WRITE;
/*!40000 ALTER TABLE `auctions_bidder` DISABLE KEYS */;
INSERT INTO `auctions_bidder` VALUES (2,'466',1,'2024-02-29 20:48:22.114575','2024-02-29 20:51:27.809971',1,1),(3,'653999.00',1,'2024-03-10 16:48:41.095204','2024-03-13 09:01:49.776534',8,1),(4,'4533225.00',0,'2024-03-14 19:00:11.116490','2024-03-14 19:00:11.116514',6,1),(6,'466',0,'2024-03-14 19:31:41.882134','2024-03-14 19:31:41.882154',1,4),(7,'19006.00',0,'2024-03-14 19:41:53.325848','2024-03-14 19:41:53.325871',4,1),(8,'19003.00',0,'2024-03-14 19:44:10.140508','2024-03-14 19:44:10.140533',4,3),(9,'467.00',0,'2024-03-14 19:50:23.175851','2024-03-14 19:50:23.175873',1,3);
/*!40000 ALTER TABLE `auctions_bidder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auctions_category`
--

DROP TABLE IF EXISTS `auctions_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auctions_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auctions_category`
--

LOCK TABLES `auctions_category` WRITE;
/*!40000 ALTER TABLE `auctions_category` DISABLE KEYS */;
INSERT INTO `auctions_category` VALUES (1,'Art and Collectibles','qwer',1,'2024-03-10 11:25:59.000000','2024-03-10 11:26:50.253970','icons/314870_edit_clipboard_icon.svg'),(2,'Antiques and Vintage','asd',1,'2024-03-10 11:30:53.000000','2024-03-10 11:37:19.694369','icons/314870_edit_clipboard_icon.svg'),(3,'Electronics','electronics',1,'2024-03-10 11:37:23.000000','2024-03-10 11:37:28.618451','icons/314870_edit_clipboard_icon.svg'),(4,'Fashion and Accessories','fashion-and-accessories',1,'2024-03-10 11:37:34.000000','2024-03-10 11:37:37.428225','icons/314870_edit_clipboard_icon.svg'),(5,'Home and Garden','home-and-garden',1,'2024-03-10 11:37:37.000000','2024-03-10 11:37:42.141039','icons/314870_edit_clipboard_icon.svg'),(6,'Automotive','automotive',1,'2024-03-10 11:37:42.000000','2024-03-10 11:37:45.895327','icons/314870_edit_clipboard_icon.svg'),(7,'Sports and Fitness','sports-and-fitness',1,'2024-03-10 11:37:45.000000','2024-03-10 11:37:50.655248','icons/314870_edit_clipboard_icon.svg'),(8,'Toys and Hobbies','toys-and-hobbies',1,'2024-03-10 11:37:50.000000','2024-03-10 11:37:55.232747','icons/314870_edit_clipboard_icon.svg'),(9,'Real Estate','real-estate',1,'2024-03-10 11:37:55.000000','2024-03-10 11:38:00.619433','icons/314870_edit_clipboard_icon.svg'),(10,'Everything Else','everything-else',1,'2024-03-10 11:38:00.000000','2024-03-10 11:38:05.236593','icons/314870_edit_clipboard_icon.svg');
/*!40000 ALTER TABLE `auctions_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auctions_comment`
--

DROP TABLE IF EXISTS `auctions_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auctions_comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `message` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `auction_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `auctions_comment_auction_id_f746b985_fk_auctions_auction_id` (`auction_id`),
  KEY `auctions_comment_user_id_13dd860a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `auctions_comment_auction_id_f746b985_fk_auctions_auction_id` FOREIGN KEY (`auction_id`) REFERENCES `auctions_auction` (`id`),
  CONSTRAINT `auctions_comment_user_id_13dd860a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auctions_comment`
--

LOCK TABLES `auctions_comment` WRITE;
/*!40000 ALTER TABLE `auctions_comment` DISABLE KEYS */;
INSERT INTO `auctions_comment` VALUES (15,'Is that the new car?','2024-03-01 05:48:05.000000','2024-03-01 05:50:49.750810',4,4),(16,'rrrr','2024-03-01 05:50:54.110128','2024-03-01 05:50:54.110296',4,4),(17,'Yes sire. This is new car.','2024-03-01 06:03:00.172411','2024-03-01 06:03:00.172578',4,4),(18,'May I bid on this car?','2024-03-01 06:03:43.864139','2024-03-01 06:03:43.864341',4,1),(19,'May I bid on this car?','2024-03-01 06:04:34.775561','2024-03-01 06:04:34.775918',4,1),(20,'May I bid on this car?','2024-03-01 06:04:35.471848','2024-03-01 06:04:35.472065',4,1),(21,'May I bid on this car?','2024-03-01 06:04:59.443863','2024-03-01 06:04:59.444128',4,1),(22,'May I bid on this car?','2024-03-01 06:05:08.291567','2024-03-01 06:05:08.291758',4,1),(23,'Yes sire. This is new car.','2024-03-01 06:07:20.776648','2024-03-01 06:07:20.776856',4,4),(24,'Yes sire. This is new car.','2024-03-01 06:08:03.743457','2024-03-01 06:08:03.743790',4,4),(25,'May I bid on this car?','2024-03-01 06:08:18.091687','2024-03-01 06:08:18.091843',4,1),(26,'Okay. I am bidding now.','2024-03-01 06:08:45.817181','2024-03-01 06:08:45.817435',4,1),(27,'Okay Sire.','2024-03-01 06:09:19.091311','2024-03-01 06:09:19.091564',4,4),(28,'Fast comment.','2024-03-01 06:18:45.797523','2024-03-01 06:18:45.797743',8,4),(29,'Second comment','2024-03-01 06:19:11.827567','2024-03-01 06:19:11.827720',8,1),(30,'saew','2024-03-10 10:25:07.244432','2024-03-10 10:25:07.244624',8,1);
/*!40000 ALTER TABLE `auctions_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auctions_order`
--

DROP TABLE IF EXISTS `auctions_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auctions_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int unsigned NOT NULL,
  `paid` tinyint(1) NOT NULL,
  `paid_amount` int DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `auction_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `auctions_order_auction_id_44bbb3ad_fk_auctions_auction_id` (`auction_id`),
  KEY `auctions_order_user_id_c0871f12_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `auctions_order_auction_id_44bbb3ad_fk_auctions_auction_id` FOREIGN KEY (`auction_id`) REFERENCES `auctions_auction` (`id`),
  CONSTRAINT `auctions_order_user_id_c0871f12_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `auctions_order_chk_1` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auctions_order`
--

LOCK TABLES `auctions_order` WRITE;
/*!40000 ALTER TABLE `auctions_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `auctions_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auctions_shippingaddress`
--

DROP TABLE IF EXISTS `auctions_shippingaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auctions_shippingaddress` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(254) DEFAULT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `address` longtext,
  `state` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `street` varchar(150) DEFAULT NULL,
  `house` varchar(150) DEFAULT NULL,
  `zip_code` varchar(10) DEFAULT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `phone` varchar(128) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `order_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `auctions_shippingaddress_order_id_b5e44211_fk_auctions_order_id` (`order_id`),
  KEY `auctions_shippingadd_user_id_58c2f67b_fk_users_use` (`user_id`),
  CONSTRAINT `auctions_shippingadd_user_id_58c2f67b_fk_users_use` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `auctions_shippingaddress_order_id_b5e44211_fk_auctions_order_id` FOREIGN KEY (`order_id`) REFERENCES `auctions_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auctions_shippingaddress`
--

LOCK TABLES `auctions_shippingaddress` WRITE;
/*!40000 ALTER TABLE `auctions_shippingaddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `auctions_shippingaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auctions_transaction`
--

DROP TABLE IF EXISTS `auctions_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auctions_transaction` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `transaction_id` char(32) NOT NULL,
  `auction_title` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `auction_id` bigint NOT NULL,
  `customer_id` bigint NOT NULL,
  `vendor_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transaction_id` (`transaction_id`),
  KEY `auctions_transaction_auction_id_9d2e0b90_fk_auctions_auction_id` (`auction_id`),
  KEY `auctions_transaction_customer_id_cdabe00c_fk_users_use` (`customer_id`),
  KEY `auctions_transaction_vendor_id_fa27ee38_fk_users_userprofile_id` (`vendor_id`),
  CONSTRAINT `auctions_transaction_auction_id_9d2e0b90_fk_auctions_auction_id` FOREIGN KEY (`auction_id`) REFERENCES `auctions_auction` (`id`),
  CONSTRAINT `auctions_transaction_customer_id_cdabe00c_fk_users_use` FOREIGN KEY (`customer_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `auctions_transaction_vendor_id_fa27ee38_fk_users_userprofile_id` FOREIGN KEY (`vendor_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auctions_transaction`
--

LOCK TABLES `auctions_transaction` WRITE;
/*!40000 ALTER TABLE `auctions_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `auctions_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (2,'customer'),(1,'vendor');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add auction',6,'add_auction'),(22,'Can change auction',6,'change_auction'),(23,'Can delete auction',6,'delete_auction'),(24,'Can view auction',6,'view_auction'),(25,'Can add bidder',7,'add_bidder'),(26,'Can change bidder',7,'change_bidder'),(27,'Can delete bidder',7,'delete_bidder'),(28,'Can view bidder',7,'view_bidder'),(29,'Can add order',8,'add_order'),(30,'Can change order',8,'change_order'),(31,'Can delete order',8,'delete_order'),(32,'Can view order',8,'view_order'),(33,'Can add shipping address',9,'add_shippingaddress'),(34,'Can change shipping address',9,'change_shippingaddress'),(35,'Can delete shipping address',9,'delete_shippingaddress'),(36,'Can view shipping address',9,'view_shippingaddress'),(37,'Can add transaction',10,'add_transaction'),(38,'Can change transaction',10,'change_transaction'),(39,'Can delete transaction',10,'delete_transaction'),(40,'Can view transaction',10,'view_transaction'),(41,'Can add User',11,'add_userprofile'),(42,'Can change User',11,'change_userprofile'),(43,'Can delete User',11,'delete_userprofile'),(44,'Can view User',11,'view_userprofile'),(45,'Can add chat',12,'add_chat'),(46,'Can change chat',12,'change_chat'),(47,'Can delete chat',12,'delete_chat'),(48,'Can view chat',12,'view_chat'),(49,'Can add message',13,'add_message'),(50,'Can change message',13,'change_message'),(51,'Can delete message',13,'delete_message'),(52,'Can view message',13,'view_message'),(53,'Can add reply',14,'add_reply'),(54,'Can change reply',14,'change_reply'),(55,'Can delete reply',14,'delete_reply'),(56,'Can view reply',14,'view_reply'),(57,'Can add comment',15,'add_comment'),(58,'Can change comment',15,'change_comment'),(59,'Can delete comment',15,'delete_comment'),(60,'Can view comment',15,'view_comment'),(61,'Can add slider',16,'add_slider'),(62,'Can change slider',16,'change_slider'),(63,'Can delete slider',16,'delete_slider'),(64,'Can view slider',16,'view_slider'),(65,'Can add category',17,'add_category'),(66,'Can change category',17,'change_category'),(67,'Can delete category',17,'delete_category'),(68,'Can view category',17,'view_category');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-02-29 20:05:37.368244','2','Brand New royal Enfield 250 CC For Sale',3,'',6,1),(2,'2024-02-29 20:05:47.043864','3','Brand New royal Enfield 250 CC For Sale',3,'',6,1),(3,'2024-02-29 20:08:21.506284','6','Havit HV-G61 USB Black Double Game Pad With Vibrat',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',6,1),(4,'2024-02-29 20:08:35.603073','7','Havit HV-G61 USB Black Double Game Pad With Vibrat',3,'',6,1),(5,'2024-02-29 20:32:04.072663','1','admin',2,'[{\"changed\": {\"fields\": [\"Email\", \"First name\", \"Last name\", \"Address\", \"City\", \"Street\", \"Zip code\", \"Postal code\", \"Phone\", \"Profile picture\"]}}]',11,1),(6,'2024-02-29 20:33:03.724909','2','vendor',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Phone\"]}}]',11,1),(7,'2024-02-29 20:33:30.219540','2','vendor',2,'[{\"changed\": {\"fields\": [\"Profile picture\"]}}]',11,1),(8,'2024-02-29 20:46:26.626165','8','Brand New Honda CBR 600 RR For Special Sale (2022)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',6,1),(9,'2024-03-01 05:50:36.745052','14','rrrr',3,'',15,1),(10,'2024-03-01 05:50:36.757443','13','rrrr',3,'',15,1),(11,'2024-03-01 05:50:36.771974','12','rrrr',3,'',15,1),(12,'2024-03-01 05:50:36.783566','11','rrrr',3,'',15,1),(13,'2024-03-01 05:50:36.799128','10','wert',3,'',15,1),(14,'2024-03-01 05:50:36.810132','9','wert',3,'',15,1),(15,'2024-03-01 05:50:36.821070','8','wert',3,'',15,1),(16,'2024-03-01 05:50:36.831747','7','wert',3,'',15,1),(17,'2024-03-01 05:50:36.845315','6','wert',3,'',15,1),(18,'2024-03-01 05:50:36.855880','5','wert',3,'',15,1),(19,'2024-03-01 05:50:36.870118','4','wert',3,'',15,1),(20,'2024-03-01 05:50:36.880490','3','wert',3,'',15,1),(21,'2024-03-01 05:50:36.891206','2','wert',3,'',15,1),(22,'2024-03-01 05:50:36.901530','1','wert',3,'',15,1),(23,'2024-03-01 05:50:49.751463','15','Is that the new car?',2,'[{\"changed\": {\"fields\": [\"Message\"]}}]',15,1),(24,'2024-03-10 10:59:17.385177','1','Purchase Dream auction & Try.',1,'[{\"added\": {}}]',16,1),(25,'2024-03-10 11:01:09.277359','1','Purchase Dream auction & Try.',2,'[]',16,1),(26,'2024-03-10 11:05:59.310302','2','werty',1,'[{\"added\": {}}]',16,1),(27,'2024-03-10 11:12:13.492909','1','Purchase Dream auction & Try.',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',16,1),(28,'2024-03-10 11:14:45.060909','1','Purchase Dream auction & Try.',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',16,1),(29,'2024-03-10 11:14:50.994928','2','werty',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',16,1),(30,'2024-03-10 11:15:08.930854','2','werty',3,'',16,1),(31,'2024-03-10 11:26:17.616253','1','Category object (1)',1,'[{\"added\": {}}]',17,1),(32,'2024-03-10 11:26:50.255703','1','Art and Collectibles',2,'[{\"changed\": {\"fields\": [\"Title\"]}}]',17,1),(33,'2024-03-10 11:30:57.309950','2','asd',1,'[{\"added\": {}}]',17,1),(34,'2024-03-10 11:37:19.696294','2','Antiques and Vintage',2,'[{\"changed\": {\"fields\": [\"Title\"]}}]',17,1),(35,'2024-03-10 11:37:28.619573','3','Electronics',1,'[{\"added\": {}}]',17,1),(36,'2024-03-10 11:37:37.429472','4','Fashion and Accessories',1,'[{\"added\": {}}]',17,1),(37,'2024-03-10 11:37:42.142522','5','Home and Garden',1,'[{\"added\": {}}]',17,1),(38,'2024-03-10 11:37:45.896653','6','Automotive',1,'[{\"added\": {}}]',17,1),(39,'2024-03-10 11:37:50.656642','7','Sports and Fitness',1,'[{\"added\": {}}]',17,1),(40,'2024-03-10 11:37:55.233487','8','Toys and Hobbies',1,'[{\"added\": {}}]',17,1),(41,'2024-03-10 11:38:00.620560','9','Real Estate',1,'[{\"added\": {}}]',17,1),(42,'2024-03-10 11:38:05.237809','10','Everything Else',1,'[{\"added\": {}}]',17,1),(43,'2024-03-10 11:39:10.141479','5','Toyota AIGID A Class Hatchback Sale (2017 - 2021)',2,'[{\"changed\": {\"fields\": [\"Category\", \"Description\", \"Details description\"]}}]',6,1),(44,'2024-03-10 11:39:27.261278','6','Havit HV-G61 USB Black Double Game Pad With Vibrat',2,'[{\"changed\": {\"fields\": [\"Category\", \"Description\", \"Details description\"]}}]',6,1),(45,'2024-03-10 11:39:46.867356','4','Brand New royal Enfield 250 CC For Sale',2,'[{\"changed\": {\"fields\": [\"Category\", \"Description\", \"Details description\"]}}]',6,1),(46,'2024-03-10 11:48:05.810426','8','Brand New Honda CBR 600 RR For Special Sale (2022)',2,'[{\"changed\": {\"fields\": [\"Category\", \"Description\"]}}]',6,1),(47,'2024-03-10 17:25:39.408439','8','Brand New Honda CBR 600 RR For Special Sale (2022)',2,'[{\"changed\": {\"fields\": [\"Image1\", \"Image2\"]}}]',6,1),(48,'2024-03-10 17:48:32.203247','8','Brand New Honda CBR 600 RR For Special Sale (2022)',2,'[{\"changed\": {\"fields\": [\"Image1\", \"Image2\"]}}]',6,1),(49,'2024-03-10 17:59:45.992985','8','Brand New Honda CBR 600 RR For Special Sale (2022)',2,'[{\"changed\": {\"fields\": [\"Image2\"]}}]',6,1),(50,'2024-03-12 08:43:10.559799','3','Test Slider',1,'[{\"added\": {}}]',16,1),(51,'2024-03-12 08:53:15.087968','3','Test Slider',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',16,1),(52,'2024-03-12 09:05:54.156359','3','Test Slider',2,'[]',16,1),(53,'2024-03-12 09:06:12.823953','3','Test Slider',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',16,1),(54,'2024-03-12 09:07:03.753697','3','Test Slider',2,'[]',16,1),(55,'2024-03-12 09:07:12.276065','4','wer',1,'[{\"added\": {}}]',16,1),(56,'2024-03-12 09:07:41.604240','4','wer',2,'[]',16,1),(57,'2024-03-12 09:08:01.805215','4','wer',2,'[]',16,1),(58,'2024-03-12 09:08:16.833170','4','wer',2,'[]',16,1),(59,'2024-03-12 09:08:35.260099','4','wer',2,'[]',16,1),(60,'2024-03-12 09:09:15.074692','4','wer',2,'[]',16,1),(61,'2024-03-12 09:09:17.814077','3','Test Slider',2,'[]',16,1),(62,'2024-03-12 09:09:19.910643','1','Purchase Dream auction & Try.',2,'[]',16,1),(63,'2024-03-12 09:09:45.084308','1','Purchase Dream auction & Try.',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',16,1),(64,'2024-03-12 09:09:51.838893','3','Test Slider',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',16,1),(65,'2024-03-12 09:09:58.273037','4','wer',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',16,1),(66,'2024-03-12 09:12:27.337282','4','wer',2,'[]',16,1),(67,'2024-03-12 09:13:19.658023','3','Test Slider',2,'[]',16,1),(68,'2024-03-12 09:13:33.246689','1','Purchase Dream auction & Try.',2,'[]',16,1),(69,'2024-03-12 09:13:47.626629','3','Test Slider',2,'[]',16,1),(70,'2024-03-12 09:13:52.920309','4','wer',2,'[]',16,1),(71,'2024-03-12 09:18:21.180075','3','Test Slider',2,'[]',16,1),(72,'2024-03-12 09:18:54.573644','3','Test Slider',2,'[]',16,1),(73,'2024-03-12 09:20:48.389560','3','Test Slider',2,'[]',16,1),(74,'2024-03-12 09:21:09.586070','3','Test Slider',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',16,1),(75,'2024-03-12 09:23:27.898767','3','Test Slider',2,'[]',16,1),(76,'2024-03-12 09:23:50.381811','3','Test Slider',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',16,1),(77,'2024-03-12 09:24:25.811806','3','Test Slider',2,'[]',16,1),(78,'2024-03-12 09:24:42.146864','3','Test Slider',2,'[]',16,1),(79,'2024-03-12 09:40:06.939305','3','Test Slider',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',16,1),(80,'2024-03-12 09:40:10.423335','1','Purchase Dream auction & Try.',2,'[]',16,1),(81,'2024-03-12 09:40:21.923886','4','wer',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',16,1),(82,'2024-03-12 09:43:20.642419','3','Test Slider',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',16,1),(83,'2024-03-12 09:44:09.742683','3','Test Slider',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',16,1),(84,'2024-03-12 09:46:24.395963','1','Purchase Dream auction & Try.',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',16,1),(85,'2024-03-12 09:47:08.559064','3','Test Slider',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',16,1),(86,'2024-03-12 10:02:52.953791','4','wer',2,'[]',16,1),(87,'2024-03-12 10:03:11.287593','4','wer',2,'[]',16,1),(88,'2024-03-12 10:03:24.349391','3','Test Slider',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',16,1),(89,'2024-03-12 10:13:34.829006','4','wer',2,'[]',16,1),(90,'2024-03-12 10:13:50.758458','4','Purchase Dream auction & Try.',2,'[{\"changed\": {\"fields\": [\"Title\", \"Short title\", \"Descriptions\", \"Button\"]}}]',16,1),(91,'2024-03-12 10:18:46.533963','4','Purchase Dream auction & Try.',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',16,1),(92,'2024-03-12 10:19:08.749056','1','Purchase Dream auction & Try.',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',16,1),(93,'2024-03-12 10:19:33.045201','4','Purchase Dream auction & Try.',2,'[{\"changed\": {\"fields\": [\"Descriptions\"]}}]',16,1),(94,'2024-03-12 10:19:48.184134','3','Test Slider',3,'',16,1),(95,'2024-03-12 10:20:19.942472','4','Build, sell & collect digital',2,'[{\"changed\": {\"fields\": [\"Title\"]}}]',16,1),(96,'2024-03-12 10:21:21.439231','4','Build, sell & collect digital items.',2,'[{\"changed\": {\"fields\": [\"Title\"]}}]',16,1),(97,'2024-03-13 09:02:34.623825','6','Havit HV-G61 USB Black Double Game Pad With Vibrat',2,'[{\"changed\": {\"fields\": [\"Date expired\", \"Closed\"]}}]',6,1),(98,'2024-03-13 10:18:26.745836','6','Havit HV-G61 USB Black Double Game Pad With Vibrat',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',6,1),(99,'2024-03-13 10:20:07.278196','6','Havit HV-G61 USB Black Double Game Pad With Vibrat',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',6,1),(100,'2024-03-13 10:21:34.666165','6','Havit HV-G61 USB Black Double Game Pad With Vibrat',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',6,1),(101,'2024-03-13 13:50:17.265066','6','Havit HV-G61 USB Black Double Game Pad With Vibrat',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',6,1),(102,'2024-03-13 13:52:22.448321','6','Havit HV-G61 USB Black Double Game Pad With Vibrat',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',6,1),(103,'2024-03-13 13:53:36.276863','6','Havit HV-G61 USB Black Double Game Pad With Vibrat',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',6,1),(104,'2024-03-14 16:49:38.667765','4','Build, sell & collect digital items.',2,'[]',16,1),(105,'2024-03-14 17:40:29.910163','4','Build, sell & collect digital items.',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',16,1),(106,'2024-03-14 17:45:24.942966','1','Purchase Dream auction & Try.',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',16,1),(107,'2024-03-14 17:47:39.615668','4','Build, sell & collect digital items.',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',16,1),(108,'2024-03-14 18:52:45.699548','8','Brand New Honda CBR 600 RR For Special Sale (2022)',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',6,1),(109,'2024-03-14 18:53:09.590655','4','Brand New royal Enfield 250 CC For Sale',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',6,1),(110,'2024-03-14 18:53:15.258726','1','Creative Fashion Riboon Digital Watch Little Elegant.',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',6,1),(111,'2024-03-14 19:28:09.650913','5','admin',3,'',7,1),(112,'2024-03-14 19:28:09.663387','1','customer',3,'',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(6,'auctions','auction'),(7,'auctions','bidder'),(17,'auctions','category'),(15,'auctions','comment'),(8,'auctions','order'),(9,'auctions','shippingaddress'),(10,'auctions','transaction'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(12,'messaging','chat'),(13,'messaging','message'),(14,'messaging','reply'),(5,'sessions','session'),(11,'users','userprofile'),(16,'website','slider');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-02-29 19:50:44.979249'),(2,'contenttypes','0002_remove_content_type_name','2024-02-29 19:50:45.416411'),(3,'auth','0001_initial','2024-02-29 19:50:46.406854'),(4,'auth','0002_alter_permission_name_max_length','2024-02-29 19:50:46.843804'),(5,'auth','0003_alter_user_email_max_length','2024-02-29 19:50:46.862629'),(6,'auth','0004_alter_user_username_opts','2024-02-29 19:50:46.881113'),(7,'auth','0005_alter_user_last_login_null','2024-02-29 19:50:46.938326'),(8,'auth','0006_require_contenttypes_0002','2024-02-29 19:50:46.949698'),(9,'auth','0007_alter_validators_add_error_messages','2024-02-29 19:50:46.964640'),(10,'auth','0008_alter_user_username_max_length','2024-02-29 19:50:46.981936'),(11,'auth','0009_alter_user_last_name_max_length','2024-02-29 19:50:46.998295'),(12,'auth','0010_alter_group_name_max_length','2024-02-29 19:50:47.073811'),(13,'auth','0011_update_proxy_permissions','2024-02-29 19:50:47.095286'),(14,'auth','0012_alter_user_first_name_max_length','2024-02-29 19:50:47.131045'),(15,'users','0001_initial','2024-02-29 19:50:48.005108'),(16,'admin','0001_initial','2024-02-29 19:50:48.513512'),(17,'admin','0002_logentry_remove_auto_add','2024-02-29 19:50:48.543843'),(18,'admin','0003_logentry_add_action_flag_choices','2024-02-29 19:50:48.562755'),(19,'sessions','0001_initial','2024-02-29 19:50:48.885267'),(20,'auctions','0001_initial','2024-02-29 19:51:08.748884'),(21,'messaging','0001_initial','2024-02-29 19:54:45.631369'),(22,'auctions','0002_alter_auction_date_expired_comment','2024-03-01 05:17:37.408924'),(23,'auctions','0003_auction_details_description_and_more','2024-03-01 06:12:19.574546'),(24,'auctions','0004_alter_auction_date_expired_alter_auction_description','2024-03-10 10:56:27.492689'),(25,'auctions','0005_alter_auction_date_expired','2024-03-10 10:56:27.518517'),(26,'website','0001_initial','2024-03-10 10:58:21.727635'),(27,'website','0002_slider_status','2024-03-10 11:01:01.424926'),(28,'auctions','0006_category_alter_auction_date_expired','2024-03-10 11:17:56.988506'),(29,'website','0003_alter_slider_descriptions','2024-03-10 11:17:57.043430'),(30,'auctions','0007_auction_category_alter_auction_date_expired','2024-03-10 11:18:30.009944'),(31,'auctions','0008_category_icon_alter_auction_date_expired','2024-03-10 11:25:56.320022'),(32,'auctions','0009_alter_auction_date_expired_alter_category_icon','2024-03-10 11:30:38.523162'),(33,'auctions','0002_auction_image1_auction_image2_and_more','2024-03-10 17:24:59.781549'),(34,'auctions','0003_alter_auction_date_expired_alter_auction_image_and_more','2024-03-12 10:21:16.388897'),(35,'auctions','0004_alter_auction_date_expired','2024-03-12 10:21:16.412741'),(36,'website','0004_alter_slider_status','2024-03-12 10:21:16.427306'),(37,'website','0005_alter_slider_image_alter_slider_title','2024-03-12 10:21:16.468236'),(38,'auctions','0005_auction_latest_bid_alter_auction_date_expired_and_more','2024-03-14 19:15:11.177918');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('479zijt1ru31x3ei1bss76brl6d9d2b4','.eJxVjMEOwiAQRP-FsyELFAIevfsNZBe2UjWQlPbU-O-2SQ96m8x7M5uIuC4lrp3nOGVxFUpcfjvC9OJ6gPzE-mgytbrME8lDkSft8t4yv2-n-3dQsJd9DRZoTENGYJ3BsjEmKPTkjAuglE8erbek9wCk1aicSRQseLCZBgbx-QLPTDck:1rjGAY:AZCRHiVkBZIbuwbZfjDyPGnig3fzfEh00dxw8y2dN0U','2024-03-24 10:12:38.211470'),('7wnadevtnhv3mp0ly7lh17qrdegiu8og','.eJxVjDsOwjAQBe_iGlnO2hiHkp4zWPsLDqBYipMKcXeIlALaNzPvZTKuS8lr0zmPYs7Gm8PvRsgPnTYgd5xu1XKdlnkkuyl2p81eq-jzsrt_BwVb-dbAyVGEDiJ4VoccARJQwAB9FKcA_cCKEUIYWBBdpJM_sgorIHXJvD_WBzg9:1rkr5H:X5qAdb0JMBQMXmZlUxtdAJiXQUviwJhdod-RHkqUa9k','2024-03-28 19:49:47.048979'),('944bdc7nlzkdc8aatymwc3xybpyyxwvk','.eJxVjMsOwiAQRf-FtSEjb1y67zcQYBipGkhKuzL-uzbpQrf3nHNfLMRtrWEbZQkzsgsT7PS7pZgfpe0A77HdOs-9rcuc-K7wgw4-dSzP6-H-HdQ46reOFiMpQylLPCcvoYBxaDQQoEpWS0FOJOkMgBOSHGhvyQMZr0kBCvb-AOhRN0s:1rg1sA:dyTGrjbzUrIeHq40vGF8zm3RhkctGLHbSSf0WPvYp-M','2024-03-15 12:20:18.226413'),('94iioo69ci87esvnbv17z9yxwuvaq9j1','.eJxVjDsOwjAQBe_iGlnrxF9Kes5g7dobHEC2FCcV4u4QKQW0b2beS0Tc1hK3zkucszgLLU6_G2F6cN1BvmO9NZlaXZeZ5K7Ig3Z5bZmfl8P9OyjYy7d2zoINgMFklTlNDvyowA_JMrHWrLQBBBgcZ-3QkyY3mRDYm5GSZxTvD8v1N60:1rjGFe:cejUgBfUH6yrwCECQD_5i-M-1bT0CCUcyu0XAv1dYBs','2024-03-24 10:17:54.799765'),('a7xfdoiotw9sxlrz4pe90l51y046ntvf','.eJxVjMEOwiAQRP-FsyELFAIevfsNZBe2UjWQlPbU-O-2SQ96m8x7M5uIuC4lrp3nOGVxFUpcfjvC9OJ6gPzE-mgytbrME8lDkSft8t4yv2-n-3dQsJd9DRZoTENGYJ3BsjEmKPTkjAuglE8erbek9wCk1aicSRQseLCZBgbx-QLPTDck:1rg6Mw:QxdSv9PY0VXbay47rAbR2kCd_Pr-2akZTOSi6GHU5ok','2024-03-15 17:08:22.204786'),('alaqlos2umiv1g6mhqixzgw1ul2oc002','.eJxVjMsOwiAQRf-FtSEjb1y67zcQYBipGkhKuzL-uzbpQrf3nHNfLMRtrWEbZQkzsgsT7PS7pZgfpe0A77HdOs-9rcuc-K7wgw4-dSzP6-H-HdQ46reOFiMpQylLPCcvoYBxaDQQoEpWS0FOJOkMgBOSHGhvyQMZr0kBCvb-AOhRN0s:1rjIKD:xzu2CtA5WfJZfPz3QtaFT15JwqrPkDYRM49PD7mGoSQ','2024-03-24 12:30:45.439381'),('mq6xv882fi71y2nfu293szsozww9kyk2','.eJxVjMEOwiAQRP-FsyELFAIevfsNZBe2UjWQlPbU-O-2SQ96m8x7M5uIuC4lrp3nOGVxFUpcfjvC9OJ6gPzE-mgytbrME8lDkSft8t4yv2-n-3dQsJd9DRZoTENGYJ3BsjEmKPTkjAuglE8erbek9wCk1aicSRQseLCZBgbx-QLPTDck:1rfujA:cDq2F5jyDiDGAUnv9HciJeuMBXcxq-GeL6178MSjCVE','2024-03-15 04:42:32.640538'),('syluyjgnyc1y5ncmxldyv31kwwjx79sg','.eJxVjMEOwiAQRP-FsyELFAIevfsNZBe2UjWQlPbU-O-2SQ96m8x7M5uIuC4lrp3nOGVxFUpcfjvC9OJ6gPzE-mgytbrME8lDkSft8t4yv2-n-3dQsJd9DRZoTENGYJ3BsjEmKPTkjAuglE8erbek9wCk1aicSRQseLCZBgbx-QLPTDck:1rfnV9:bAv_qsTd6jtZk18NjZn0pLe6CVr8nCP4KGYxvychEx0','2024-03-14 20:59:35.661030');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messaging_chat`
--

DROP TABLE IF EXISTS `messaging_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messaging_chat` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messaging_chat`
--

LOCK TABLES `messaging_chat` WRITE;
/*!40000 ALTER TABLE `messaging_chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `messaging_chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messaging_chat_participants`
--

DROP TABLE IF EXISTS `messaging_chat_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messaging_chat_participants` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `chat_id` bigint NOT NULL,
  `userprofile_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `messaging_chat_participants_chat_id_userprofile_id_ea16cd16_uniq` (`chat_id`,`userprofile_id`),
  KEY `messaging_chat_parti_userprofile_id_2b9a46ee_fk_users_use` (`userprofile_id`),
  CONSTRAINT `messaging_chat_parti_chat_id_52c17620_fk_messaging` FOREIGN KEY (`chat_id`) REFERENCES `messaging_chat` (`id`),
  CONSTRAINT `messaging_chat_parti_userprofile_id_2b9a46ee_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messaging_chat_participants`
--

LOCK TABLES `messaging_chat_participants` WRITE;
/*!40000 ALTER TABLE `messaging_chat_participants` DISABLE KEYS */;
/*!40000 ALTER TABLE `messaging_chat_participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messaging_message`
--

DROP TABLE IF EXISTS `messaging_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messaging_message` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) NOT NULL,
  `message` longtext NOT NULL,
  `auction_title` varchar(200) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `chat_id` bigint DEFAULT NULL,
  `recipient_id` bigint NOT NULL,
  `sender_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `messaging_message_chat_id_fe8aa54c_fk_messaging_chat_id` (`chat_id`),
  KEY `messaging_message_recipient_id_6eb91564_fk_users_userprofile_id` (`recipient_id`),
  KEY `messaging_message_sender_id_7a7088e6_fk_users_userprofile_id` (`sender_id`),
  CONSTRAINT `messaging_message_chat_id_fe8aa54c_fk_messaging_chat_id` FOREIGN KEY (`chat_id`) REFERENCES `messaging_chat` (`id`),
  CONSTRAINT `messaging_message_recipient_id_6eb91564_fk_users_userprofile_id` FOREIGN KEY (`recipient_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `messaging_message_sender_id_7a7088e6_fk_users_userprofile_id` FOREIGN KEY (`sender_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messaging_message`
--

LOCK TABLES `messaging_message` WRITE;
/*!40000 ALTER TABLE `messaging_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `messaging_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messaging_reply`
--

DROP TABLE IF EXISTS `messaging_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messaging_reply` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `text` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `author_id` bigint NOT NULL,
  `message_id` bigint NOT NULL,
  `reply_to_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `messaging_reply_author_id_f682fe41_fk_users_userprofile_id` (`author_id`),
  KEY `messaging_reply_message_id_aa92a4e7_fk_messaging_message_id` (`message_id`),
  KEY `messaging_reply_reply_to_id_8dfb466e_fk_messaging_reply_id` (`reply_to_id`),
  CONSTRAINT `messaging_reply_author_id_f682fe41_fk_users_userprofile_id` FOREIGN KEY (`author_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `messaging_reply_message_id_aa92a4e7_fk_messaging_message_id` FOREIGN KEY (`message_id`) REFERENCES `messaging_message` (`id`),
  CONSTRAINT `messaging_reply_reply_to_id_8dfb466e_fk_messaging_reply_id` FOREIGN KEY (`reply_to_id`) REFERENCES `messaging_reply` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messaging_reply`
--

LOCK TABLES `messaging_reply` WRITE;
/*!40000 ALTER TABLE `messaging_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `messaging_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile`
--

DROP TABLE IF EXISTS `users_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_userprofile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `email` varchar(254) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `address` longtext,
  `state` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `street` varchar(150) DEFAULT NULL,
  `house` varchar(150) DEFAULT NULL,
  `zip_code` varchar(10) DEFAULT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `phone` varchar(128) NOT NULL,
  `profile_picture` varchar(100) DEFAULT NULL,
  `role` varchar(15) NOT NULL,
  `business_name` varchar(100) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile`
--

LOCK TABLES `users_userprofile` WRITE;
/*!40000 ALTER TABLE `users_userprofile` DISABLE KEYS */;
INSERT INTO `users_userprofile` VALUES (1,'pbkdf2_sha256$720000$J5aTvBtpVFQNPTSXvkfzvy$Rv50Z2S452NUaQ4SnDANi8BAlkGZK9tYFHKnL3C7viQ=','mehedishovon01@gmail.com','admin','Mehedi Hasan','Shovon','97/7, Chairman Lane, West Dhanmondi',NULL,'Dhaka','97/7, Chairman Lane, West Dhanmondi','Test','12071','12071','+12125552368','profile_pictures/new_iXbXvri.jpg','administrator',NULL,1,1,1,'2024-02-29 19:53:22.000000','2024-03-14 19:48:57.925007'),(2,'pbkdf2_sha256$720000$hyo5pDSIgJwsAM0Snepmt6$tDp9BPKDyQ3puSMuvfNaxAq5F7Bhyd4LOgxWr3bVo3w=','vendor@vendor.com','vendor','Vendor','User','',NULL,NULL,NULL,NULL,NULL,NULL,'+12125552368','profile_pictures/new_BfscSgw.jpg','vendor','vendor',1,0,0,'2024-02-29 19:57:54.000000','2024-03-14 19:29:34.130411'),(3,'pbkdf2_sha256$720000$tWpdgxllOgyyTPtPrMCZwU$qpxbLP0aKr54cJ8iIzGTD0liYgM/RJMyh5AI7U8kIa8=','customer@customer.com','customer','','','','','','','','','','','','customer','',1,0,0,'2024-02-29 20:16:56.318051','2024-03-14 19:49:47.032397'),(4,'pbkdf2_sha256$720000$vILgOtXGGp37HBfspD9uXM$cKiHJcyTDF16BoRRSZiRKQ2aXlaCn9alduVE+cx7X88=','vendor1@vendor1.com','vendor1','','','','','','','','','','','','vendor','vendor1',1,0,0,'2024-02-29 20:18:36.684160','2024-03-14 19:31:31.222279');
/*!40000 ALTER TABLE `users_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile_groups`
--

DROP TABLE IF EXISTS `users_userprofile_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_userprofile_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userprofile_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_groups_userprofile_id_group_id_823cf2fc_uniq` (`userprofile_id`,`group_id`),
  KEY `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_userprofile_gr_userprofile_id_a4496a80_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile_groups`
--

LOCK TABLES `users_userprofile_groups` WRITE;
/*!40000 ALTER TABLE `users_userprofile_groups` DISABLE KEYS */;
INSERT INTO `users_userprofile_groups` VALUES (1,2,1),(2,3,2),(3,4,1);
/*!40000 ALTER TABLE `users_userprofile_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile_user_permissions`
--

DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_userprofile_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userprofile_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_user_p_userprofile_id_permissio_d0215190_uniq` (`userprofile_id`,`permission_id`),
  KEY `users_userprofile_us_permission_id_393136b6_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_userprofile_us_permission_id_393136b6_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_userprofile_us_userprofile_id_34544737_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile_user_permissions`
--

LOCK TABLES `users_userprofile_user_permissions` WRITE;
/*!40000 ALTER TABLE `users_userprofile_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_userprofile_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_slider`
--

DROP TABLE IF EXISTS `website_slider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `website_slider` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(40) NOT NULL,
  `short_title` varchar(25) NOT NULL,
  `descriptions` varchar(200) NOT NULL,
  `button` varchar(20) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_slider`
--

LOCK TABLES `website_slider` WRITE;
/*!40000 ALTER TABLE `website_slider` DISABLE KEYS */;
INSERT INTO `website_slider` VALUES (1,'Purchase Dream auction & Try.','Welcome To Auction House','Nulla facilisi. Maecenas ac tellus ut ligula interdum convallis. Nullam dapibus on erat in dolor pos','Start Exploring','','2024-03-10 10:58:27.000000','2024-03-14 17:45:24.941659',1),(4,'Build, sell & collect digital items.','Purchase Dream auction &','Nulla facilisi. Maecenas ac tellus ut ligula interdum convallis. Nullam dapibus on erat in dolor pos','Purchase Dream aucti','sliders/slider1.jpg','2024-03-12 09:07:05.000000','2024-03-14 17:47:39.475075',1);
/*!40000 ALTER TABLE `website_slider` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-15  2:17:03
