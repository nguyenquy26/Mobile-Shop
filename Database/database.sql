-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: mobileshop
-- ------------------------------------------------------
-- Server version	8.0.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cart_detail`
--

DROP TABLE IF EXISTS `cart_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `price` double NOT NULL,
  `quantity` bigint NOT NULL,
  `cart_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbql1m2v2po7hcawonqsgqex88` (`cart_id`),
  KEY `FKclb1c0wg3mofxnpgidib1t987` (`product_id`),
  CONSTRAINT `FKbql1m2v2po7hcawonqsgqex88` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`),
  CONSTRAINT `FKclb1c0wg3mofxnpgidib1t987` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_detail`
--

LOCK TABLES `cart_detail` WRITE;
/*!40000 ALTER TABLE `cart_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sum` int NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_64t7ox312pqal3p7fg9o503c2` (`user_id`),
  CONSTRAINT `FKb5o626f86h46m4s7ms6ginnop` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `carts_chk_1` CHECK ((`sum` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `price` double NOT NULL,
  `quantity` bigint NOT NULL,
  `order_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKrws2q0si6oyd6il8gqe2aennc` (`order_id`),
  KEY `FKc7q42e9tu0hslx6w4wxgomhvn` (`product_id`),
  CONSTRAINT `FKc7q42e9tu0hslx6w4wxgomhvn` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `FKrws2q0si6oyd6il8gqe2aennc` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (1,799990000,3,1,2);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `receiver_address` varchar(255) DEFAULT NULL,
  `receiver_name` varchar(255) DEFAULT NULL,
  `receiver_phone` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `total_price` double NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK32ql8ubntj5uh44ph9659tiih` (`user_id`),
  CONSTRAINT `FK32ql8ubntj5uh44ph9659tiih` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'Nam Dinh ','Quy ','123456789','PENDING',799990000,1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `detail_desc` mediumtext NOT NULL,
  `factory` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `quantity` bigint NOT NULL,
  `short_desc` varchar(255) NOT NULL,
  `sold` bigint NOT NULL,
  `target` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `products_chk_1` CHECK ((`quantity` >= 1))
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (2,'ƒêi·ªán tho·∫°i Apple iPhone 13 v·ªõi m√†n h√¨nh Super Retina XDR 6.1 inch, chip A15 Bionic, camera k√©p 12MP.','Apple','image_iphone13.png','iPhone 13',7999000,120,'4GB, 128GB',80,'4GB128GB'),(3,'ƒêi·ªán tho·∫°i Samsung Galaxy S21 v·ªõi m√†n h√¨nh AMOLED 6.2 inch, camera ch√≠nh 64MP, chip Exynos 2100.','SamSung','image_s21.png','Samsung Galaxy S21',7999000,150,'8GB, 128GB',70,'8GB128GB'),(4,'ƒêi·ªán tho·∫°i Xiaomi Mi 11 v·ªõi m√†n h√¨nh AMOLED 6.81 inch, camera 108MP, chip Snapdragon 888.','Xiaomi','image_mi11.png','Xiaomi Mi 11',7499000,90,'8GB, 256GB',60,'8GB256GB'),(5,'ƒêi·ªán tho·∫°i Realme GT v·ªõi m√†n h√¨nh Super AMOLED 6.43 inch, camera 64MP, chip Snapdragon 888.','Realme','image_gt.png','Realme GT',4999000,130,'8GB, 128GB',45,'8GB128GB'),(6,'ƒêi·ªán tho·∫°i Oppo Find X3 Pro v·ªõi m√†n h√¨nh AMOLED 6.7 inch, camera 50MP, chip Snapdragon 888.','Oppo','image_findx3.png','Oppo Find X3 Pro',10000000,70,'12GB, 256GB',20,'12GB256GB'),(7,'ƒêi·ªán tho·∫°i Vivo X60 Pro v·ªõi m√†n h√¨nh AMOLED 6.56 inch, camera 48MP, chip Exynos 1080.','ViVo','image_x60pro.png','Vivo X60 Pro',7999000,75,'12GB, 256GB',15,'12GB256GB'),(8,'ƒêi·ªán tho·∫°i Apple iPhone 12 v·ªõi m√†n h√¨nh Super Retina XDR 6.1 inch, chip A14 Bionic, camera k√©p 12MP.','Apple','image_iphone12.png','iPhone 12',6999000,100,'4GB, 64GB',90,'4GB64GB'),(9,'ƒêi·ªán tho·∫°i Samsung Galaxy A52 v·ªõi m√†n h√¨nh Super AMOLED 6.5 inch, camera 64MP, chip Snapdragon 720G.','SamSung','image_a52.png','Samsung Galaxy A52',3499000,110,'6GB, 128GB',50,'6GB128GB'),(10,'ƒêi·ªán tho·∫°i Xiaomi Redmi Note 10 v·ªõi m√†n h√¨nh AMOLED 6.43 inch, camera 48MP, chip Snapdragon 678.','Xiaomi','image_redmi10.png','Xiaomi Redmi Note 10',19999000,140,'4GB, 64GB',60,'4GB64GB'),(11,'ƒêi·ªán tho·∫°i Realme 8 v·ªõi m√†n h√¨nh Super AMOLED 6.4 inch, camera 64MP, chip MediaTek Helio G95.','Realme','image_realme8.png','Realme 8',24999000,130,'8GB, 128GB',40,'8GB128GB'),(12,'ƒêi·ªán tho·∫°i Oppo Reno 5 v·ªõi m√†n h√¨nh AMOLED 6.43 inch, camera 64MP, chip Snapdragon 720G.','Oppo','image_reno5.png','Oppo Reno 5',3999000,90,'8GB, 128GB',35,'8GB128GB'),(13,'ƒêi·ªán tho·∫°i Vivo V21 v·ªõi m√†n h√¨nh AMOLED 6.44 inch, camera 64MP, chip MediaTek Dimensity 800U.','ViVo','image_v21.png','Vivo V21',3999000,85,'8GB, 128GB',25,'8GB128GB'),(14,'ƒêi·ªán tho·∫°i Apple iPhone SE (2022) v·ªõi m√†n h√¨nh Retina HD 4.7 inch, chip A15 Bionic, camera 12MP.','Apple','image_iphoneSE.png','iPhone SE (2022)',4299000,110,'4GB, 64GB',60,'4GB64GB'),(15,'ƒêi·ªán tho·∫°i Samsung Galaxy M32 v·ªõi m√†n h√¨nh Super AMOLED 6.4 inch, camera 64MP, chip MediaTek Helio G80.','SamSung','image_m32.png','Samsung Galaxy M32',2799000,120,'6GB, 128GB',50,'6GB128GB'),(16,'ƒêi·ªán tho·∫°i Xiaomi Poco X3 Pro v·ªõi m√†n h√¨nh IPS LCD 6.67 inch, camera 48MP, chip Snapdragon 860.','Xiaomi','image_pocoX3Pro.png','Xiaomi Poco X3 Pro',3499000,100,'6GB, 128GB',40,'6GB128GB'),(17,'ƒêi·ªán tho·∫°i iPhone 13 Mini v·ªõi m√†n h√¨nh 5.4 inch, camera k√©p 12MP, chip A15 Bionic.','Apple','image_iphone13mini.png','iPhone 13 Mini',23900000,50,'4GB, 128GB',30,'4GB128GB'),(18,'ƒêi·ªán tho·∫°i Samsung Galaxy S21 FE v·ªõi m√†n h√¨nh 6.4 inch, camera 12MP, chip Snapdragon 888.','Samsung','image_galaxyS21FE.png','Galaxy S21 FE',24900000,70,'4GB, 128GB',25,'4GB128GB'),(19,'ƒêi·ªán tho·∫°i Oppo Reno 7 v·ªõi m√†n h√¨nh 6.43 inch, camera 64MP, chip MediaTek Dimensity 900.','Oppo','image_reno7.png','Oppo Reno 7',21900000,60,'8GB, 256GB',20,'8GB256GB'),(20,'ƒêi·ªán tho·∫°i Realme GT 2 v·ªõi m√†n h√¨nh 6.62 inch, camera 50MP, chip Snapdragon 888.','Realme','image_realmeGT2.png','Realme GT 2',26900000,55,'8GB, 128GB',15,'8GB128GB'),(21,'ƒêi·ªán tho·∫°i Xiaomi 12 v·ªõi m√†n h√¨nh 6.28 inch, camera 50MP, chip Snapdragon 8 Gen 1.','Xiaomi','image_xiaomi12.png','Xiaomi 12',28900000,40,'8GB, 256GB',10,'8GB256GB'),(22,'ƒêi·ªán tho·∫°i iPhone 14 v·ªõi m√†n h√¨nh 6.1 inch, camera k√©p 12MP, chip A15 Bionic.','Apple','image_iphone14.png','iPhone 14',29900000,30,'4GB, 128GB',5,'4GB128GB'),(23,'ƒêi·ªán tho·∫°i Samsung Galaxy A53 v·ªõi m√†n h√¨nh 6.5 inch, camera 64MP, chip Exynos 1280.','Samsung','image_galaxyA53.png','Galaxy A53',18900000,80,'8GB, 128GB',35,'8GB128GB'),(24,'ƒêi·ªán tho·∫°i Oppo Find X5 v·ªõi m√†n h√¨nh 6.55 inch, camera 50MP, chip Snapdragon 8 Gen 1.','Oppo','image_findX5.png','Oppo Find X5',28900000,45,'8GB, 256GB',15,'8GB256GB'),(25,'ƒêi·ªán tho·∫°i Realme 9 Pro v·ªõi m√†n h√¨nh 6.6 inch, camera 64MP, chip Snapdragon 695.','Realme','image_realme9Pro.png','Realme 9 Pro',19900000,50,'8GB, 128GB',20,'8GB128GB'),(26,'ƒêi·ªán tho·∫°i Xiaomi Redmi Note 11 Pro v·ªõi m√†n h√¨nh 6.67 inch, camera 108MP, chip MediaTek Helio G96.','Xiaomi','image_redmiNote11Pro.png','Xiaomi Redmi Note 11 Pro',20900000,65,'8GB, 128GB',25,'8GB128GB');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'User','USER'),(2,'Admin','ADMIN');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spring_session`
--

DROP TABLE IF EXISTS `spring_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spring_session` (
  `PRIMARY_ID` char(36) NOT NULL,
  `SESSION_ID` char(36) NOT NULL,
  `CREATION_TIME` bigint NOT NULL,
  `LAST_ACCESS_TIME` bigint NOT NULL,
  `MAX_INACTIVE_INTERVAL` int NOT NULL,
  `EXPIRY_TIME` bigint NOT NULL,
  `PRINCIPAL_NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`PRIMARY_ID`),
  UNIQUE KEY `SPRING_SESSION_IX1` (`SESSION_ID`),
  KEY `SPRING_SESSION_IX2` (`EXPIRY_TIME`),
  KEY `SPRING_SESSION_IX3` (`PRINCIPAL_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spring_session`
--

LOCK TABLES `spring_session` WRITE;
/*!40000 ALTER TABLE `spring_session` DISABLE KEYS */;
INSERT INTO `spring_session` VALUES ('86ceeff5-2983-44cb-8400-95e12a9f555f','d3af1510-2831-4783-86b7-0eea2aee86b2',1728808013234,1728809109253,2592000,1731401109253,'admin@gmail.com'),('a89a9aab-c8d3-4e4a-b4ce-5a3d6975b383','2aae2fd0-e71b-42b5-af06-7e55dcacf2b4',1728809482994,1728825772300,2592000,1731417772300,'user@gmail.com');
/*!40000 ALTER TABLE `spring_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spring_session_attributes`
--

DROP TABLE IF EXISTS `spring_session_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spring_session_attributes` (
  `SESSION_PRIMARY_ID` char(36) NOT NULL,
  `ATTRIBUTE_NAME` varchar(200) NOT NULL,
  `ATTRIBUTE_BYTES` blob NOT NULL,
  PRIMARY KEY (`SESSION_PRIMARY_ID`,`ATTRIBUTE_NAME`),
  CONSTRAINT `SPRING_SESSION_ATTRIBUTES_FK` FOREIGN KEY (`SESSION_PRIMARY_ID`) REFERENCES `spring_session` (`PRIMARY_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spring_session_attributes`
--

LOCK TABLES `spring_session_attributes` WRITE;
/*!40000 ALTER TABLE `spring_session_attributes` DISABLE KEYS */;
INSERT INTO `spring_session_attributes` VALUES ('86ceeff5-2983-44cb-8400-95e12a9f555f','email',_binary '¨\Ì\0t\0admin@gmail.com'),('86ceeff5-2983-44cb-8400-95e12a9f555f','fullName',_binary '¨\Ì\0t\0admin'),('86ceeff5-2983-44cb-8400-95e12a9f555f','id',_binary '¨\Ì\0sr\0java.lang.Long;ã\‰êÃè#\ﬂ\0J\0valuexr\0java.lang.NumberÜ¨ïî\‡ã\0\0xp\0\0\0\0\0\0\0'),('86ceeff5-2983-44cb-8400-95e12a9f555f','jakarta.servlet.jsp.jstl.fmt.request.charset',_binary '¨\Ì\0t\0UTF-8'),('86ceeff5-2983-44cb-8400-95e12a9f555f','org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository.CSRF_TOKEN',_binary '¨\Ì\0sr\06org.springframework.security.web.csrf.DefaultCsrfTokenZ\Ô∑\»/¢˚\’\0L\0\nheaderNamet\0Ljava/lang/String;L\0\rparameterNameq\0~\0L\0tokenq\0~\0xpt\0X-CSRF-TOKENt\0_csrft\0$4bd3df44-cbd9-4dbc-944b-85ced3560918'),('86ceeff5-2983-44cb-8400-95e12a9f555f','SPRING_SECURITY_CONTEXT',_binary '¨\Ì\0sr\0=org.springframework.security.core.context.SecurityContextImpl\0\0\0\0\0\0l\0L\0authenticationt\02Lorg/springframework/security/core/Authentication;xpsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0l\0L\0credentialst\0Ljava/lang/Object;L\0	principalq\0~\0xr\0Gorg.springframework.security.authentication.AbstractAuthenticationToken”™(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailsq\0~\0xpsr\0&java.util.Collections$UnmodifiableList¸%1µ\Ïé\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0Ä\À^˜\0L\0cq\0~\0xpsr\0java.util.ArrayListxÅ\“ô\«aù\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0l\0L\0rolet\0Ljava/lang/String;xpt\0\nROLE_ADMINxq\0~\0\rsr\0Horg.springframework.security.web.authentication.WebAuthenticationDetails\0\0\0\0\0\0l\0L\0\rremoteAddressq\0~\0L\0	sessionIdq\0~\0xpt\00:0:0:0:0:0:0:1t\0$3a8acc6f-6242-413b-ab72-c33440f80b6apsr\02org.springframework.security.core.userdetails.User\0\0\0\0\0\0l\0Z\0accountNonExpiredZ\0accountNonLockedZ\0credentialsNonExpiredZ\0enabledL\0authoritiest\0Ljava/util/Set;L\0passwordq\0~\0L\0usernameq\0~\0xpsr\0%java.util.Collections$UnmodifiableSetÄí—èõÄU\0\0xq\0~\0\nsr\0java.util.TreeSet›òPìï\Ìá[\0\0xpsr\0Forg.springframework.security.core.userdetails.User$AuthorityComparator\0\0\0\0\0\0l\0\0xpw\0\0\0q\0~\0xpt\0admin@gmail.com'),('86ceeff5-2983-44cb-8400-95e12a9f555f','sum',_binary '¨\Ì\0sr\0java.lang.Integer‚†§˜Åá8\0I\0valuexr\0java.lang.NumberÜ¨ïî\‡ã\0\0xp\0\0\0\0'),('a89a9aab-c8d3-4e4a-b4ce-5a3d6975b383','email',_binary '¨\Ì\0t\0user@gmail.com'),('a89a9aab-c8d3-4e4a-b4ce-5a3d6975b383','fullName',_binary '¨\Ì\0t\0\nquy nguyen'),('a89a9aab-c8d3-4e4a-b4ce-5a3d6975b383','id',_binary '¨\Ì\0sr\0java.lang.Long;ã\‰êÃè#\ﬂ\0J\0valuexr\0java.lang.NumberÜ¨ïî\‡ã\0\0xp\0\0\0\0\0\0\0'),('a89a9aab-c8d3-4e4a-b4ce-5a3d6975b383','jakarta.servlet.jsp.jstl.fmt.request.charset',_binary '¨\Ì\0t\0UTF-8'),('a89a9aab-c8d3-4e4a-b4ce-5a3d6975b383','org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository.CSRF_TOKEN',_binary '¨\Ì\0sr\06org.springframework.security.web.csrf.DefaultCsrfTokenZ\Ô∑\»/¢˚\’\0L\0\nheaderNamet\0Ljava/lang/String;L\0\rparameterNameq\0~\0L\0tokenq\0~\0xpt\0X-CSRF-TOKENt\0_csrft\0$e7cdeac4-c3a3-4ed5-be37-bfd91c910205'),('a89a9aab-c8d3-4e4a-b4ce-5a3d6975b383','SPRING_SECURITY_CONTEXT',_binary '¨\Ì\0sr\0=org.springframework.security.core.context.SecurityContextImpl\0\0\0\0\0\0l\0L\0authenticationt\02Lorg/springframework/security/core/Authentication;xpsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0l\0L\0credentialst\0Ljava/lang/Object;L\0	principalq\0~\0xr\0Gorg.springframework.security.authentication.AbstractAuthenticationToken”™(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailsq\0~\0xpsr\0&java.util.Collections$UnmodifiableList¸%1µ\Ïé\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0Ä\À^˜\0L\0cq\0~\0xpsr\0java.util.ArrayListxÅ\“ô\«aù\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0l\0L\0rolet\0Ljava/lang/String;xpt\0	ROLE_USERxq\0~\0\rsr\0Horg.springframework.security.web.authentication.WebAuthenticationDetails\0\0\0\0\0\0l\0L\0\rremoteAddressq\0~\0L\0	sessionIdq\0~\0xpt\00:0:0:0:0:0:0:1t\0$68a32403-ac7f-4be4-af97-a9682666e53apsr\02org.springframework.security.core.userdetails.User\0\0\0\0\0\0l\0Z\0accountNonExpiredZ\0accountNonLockedZ\0credentialsNonExpiredZ\0enabledL\0authoritiest\0Ljava/util/Set;L\0passwordq\0~\0L\0usernameq\0~\0xpsr\0%java.util.Collections$UnmodifiableSetÄí—èõÄU\0\0xq\0~\0\nsr\0java.util.TreeSet›òPìï\Ìá[\0\0xpsr\0Forg.springframework.security.core.userdetails.User$AuthorityComparator\0\0\0\0\0\0l\0\0xpw\0\0\0q\0~\0xpt\0user@gmail.com'),('a89a9aab-c8d3-4e4a-b4ce-5a3d6975b383','SPRING_SECURITY_SAVED_REQUEST',_binary '¨\Ì\0sr\0Aorg.springframework.security.web.savedrequest.DefaultSavedRequest\0\0\0\0\0\0l\0I\0\nserverPortL\0contextPatht\0Ljava/lang/String;L\0cookiest\0Ljava/util/ArrayList;L\0headerst\0Ljava/util/Map;L\0localesq\0~\0L\0matchingRequestParameterNameq\0~\0L\0methodq\0~\0L\0\nparametersq\0~\0L\0pathInfoq\0~\0L\0queryStringq\0~\0L\0\nrequestURIq\0~\0L\0\nrequestURLq\0~\0L\0schemeq\0~\0L\0\nserverNameq\0~\0L\0servletPathq\0~\0xp\0\0êt\0\0sr\0java.util.ArrayListxÅ\“ô\«aù\0I\0sizexp\0\0\0w\0\0\0sr\09org.springframework.security.web.savedrequest.SavedCookie\0\0\0\0\0\0l\0I\0maxAgeZ\0secureI\0versionL\0commentq\0~\0L\0domainq\0~\0L\0nameq\0~\0L\0pathq\0~\0L\0valueq\0~\0xpˇˇˇˇ\0\0\0\0\0ppt\0SESSIONpt\00NjhhMzI0MDMtYWM3Zi00YmU0LWFmOTctYTk2ODI2NjZlNTNhxsr\0java.util.TreeMap¡ˆ>-%j\Ê\0L\0\ncomparatort\0Ljava/util/Comparator;xpsr\0*java.lang.String$CaseInsensitiveComparatorw\\}\\P\Â\Œ\0\0xpw\0\0\0t\0acceptsq\0~\0\0\0\0w\0\0\0t\0átext/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7xt\0accept-encodingsq\0~\0\0\0\0w\0\0\0t\0gzip, deflate, br, zstdxt\0accept-languagesq\0~\0\0\0\0w\0\0\0t\0en-US,en;q=0.9xt\0\nconnectionsq\0~\0\0\0\0w\0\0\0t\0\nkeep-alivext\0cookiesq\0~\0\0\0\0w\0\0\0t\08SESSION=NjhhMzI0MDMtYWM3Zi00YmU0LWFmOTctYTk2ODI2NjZlNTNhxt\0hostsq\0~\0\0\0\0w\0\0\0t\0localhost:8080xt\0purposesq\0~\0\0\0\0w\0\0\0t\0prefetchxt\0	sec-ch-uasq\0~\0\0\0\0w\0\0\0t\0@\"Google Chrome\";v=\"129\", \"Not=A?Brand\";v=\"8\", \"Chromium\";v=\"129\"xt\0sec-ch-ua-mobilesq\0~\0\0\0\0w\0\0\0t\0?0xt\0sec-ch-ua-platformsq\0~\0\0\0\0w\0\0\0t\0	\"Windows\"xt\0sec-fetch-destsq\0~\0\0\0\0w\0\0\0t\0documentxt\0sec-fetch-modesq\0~\0\0\0\0w\0\0\0t\0navigatext\0sec-fetch-sitesq\0~\0\0\0\0w\0\0\0t\0nonext\0sec-fetch-usersq\0~\0\0\0\0w\0\0\0t\0?1xt\0sec-purposesq\0~\0\0\0\0w\0\0\0t\0prefetch;prerenderxt\0upgrade-insecure-requestssq\0~\0\0\0\0w\0\0\0t\01xt\0\nuser-agentsq\0~\0\0\0\0w\0\0\0t\0oMozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36xxsq\0~\0\0\0\0w\0\0\0sr\0java.util.Locale~¯`ú0˘\Ï\0I\0hashcodeL\0countryq\0~\0L\0\nextensionsq\0~\0L\0languageq\0~\0L\0scriptq\0~\0L\0variantq\0~\0xpˇˇˇˇt\0USq\0~\0t\0enq\0~\0q\0~\0xsq\0~\0Eˇˇˇˇq\0~\0q\0~\0q\0~\0Hq\0~\0q\0~\0xxt\0continuet\0GETsq\0~\0pw\0\0\0t\0expiredur\0[Ljava.lang.String;≠\“V\Á\È{G\0\0xp\0\0\0q\0~\0xpt\0expiredt\0/logoutt\0http://localhost:8080/logoutt\0httpt\0	localhostt\0/logout'),('a89a9aab-c8d3-4e4a-b4ce-5a3d6975b383','sum',_binary '¨\Ì\0sr\0java.lang.Integer‚†§˜Åá8\0I\0valuexr\0java.lang.NumberÜ¨ïî\‡ã\0\0xp\0\0\0\0');
/*!40000 ALTER TABLE `spring_session_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `role_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKp56c1712k691lhsyewcssf40f` (`role_id`),
  CONSTRAINT `FKp56c1712k691lhsyewcssf40f` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,NULL,NULL,'user@gmail.com','quy nguyen','$2a$10$O8Po1essG0olw8L2Y4fo3.rdAuHbXM28YpCCA6WhE0EB1S9GPbSI2',NULL,1),(2,NULL,NULL,'admin@gmail.com','admin','$2a$10$O8Po1essG0olw8L2Y4fo3.rdAuHbXM28YpCCA6WhE0EB1S9GPbSI2',NULL,2);
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

-- Dump completed on 2024-10-13 20:34:13
