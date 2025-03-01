CREATE DATABASE  IF NOT EXISTS `ecommerce` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ecommerce`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `amount` decimal(15,4) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `status` enum('Pending','Completed','Failed','Refunded') DEFAULT 'Pending',
  `refunded_amount` decimal(10,2) DEFAULT NULL,
  `currency` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_id`),
  KEY `payments_ibfk_1` (`order_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,1,'2025-02-23',26362.4000,'Credit Card','TXN-1-1-1-20250223','Completed',0.00,'US Dollar','2025-02-25 15:19:25','2025-02-27 13:34:13'),(2,2,'2025-02-24',5405.0000,'Credit Card','TXN-2-2-2-20250224','Completed',0.00,'US Dollar','2025-02-25 15:19:25','2025-02-27 13:34:13'),(3,3,'2025-02-25',903.3750,'PayPal','TXN-3-3-3-20250225','Completed',0.01,'US Dollar','2025-02-25 15:19:25','2025-02-27 13:41:59'),(4,4,'2025-02-26',544.0000,'Cash','TXN-4-4-4-20250226','Completed',0.00,'US Dollar','2025-02-25 15:19:25','2025-02-27 13:34:13'),(5,5,'2025-02-27',257.8000,'Credit Card','TXN-5-5-5-20250227','Completed',0.00,'US Dollar','2025-02-25 15:19:25','2025-02-27 13:34:13'),(6,6,'2025-02-28',93.5550,'PayPal','TXN-6-6-6-20250228','Completed',0.01,'US Dollar','2025-02-25 15:19:25','2025-02-27 13:41:59'),(7,7,'2025-03-01',610.0000,'Cash','TXN-7-7-7-20250301','Completed',0.00,'US Dollar','2025-02-25 15:19:25','2025-02-27 13:34:13'),(8,8,'2025-03-02',1358.0000,'Credit Card','TXN-8-8-8-20250302','Completed',0.00,'US Dollar','2025-02-25 15:19:25','2025-02-27 13:34:13'),(9,9,'2025-03-03',303.9300,'PayPal','TXN-9-9-9-20250303','Completed',0.01,'US Dollar','2025-02-25 15:19:25','2025-02-27 13:34:13'),(10,10,'2025-03-04',1542.5000,'Cash','TXN-10-10-10-20250304','Completed',0.00,'US Dollar','2025-02-25 15:19:25','2025-02-27 13:34:13'),(11,11,'2025-03-05',1042.5500,'Credit Card','TXN-11-11-11-20250305','Completed',0.00,'US Dollar','2025-02-25 15:19:25','2025-02-27 13:34:13'),(12,12,'2025-03-06',530.0955,'PayPal','TXN-12-12-12-20250306','Completed',0.01,'US Dollar','2025-02-25 15:19:25','2025-02-27 13:41:59'),(13,13,'2025-03-07',354.0000,'Cash','TXN-13-13-13-20250307','Completed',0.00,'US Dollar','2025-02-25 15:19:25','2025-02-27 13:34:13'),(14,14,'2025-03-08',110.3000,'Credit Card','TXN-14-14-14-20250308','Completed',0.00,'US Dollar','2025-02-25 15:19:25','2025-02-27 13:34:13'),(15,15,'2025-03-09',26.7300,'PayPal','TXN-15-15-15-20250309','Completed',0.01,'US Dollar','2025-02-25 15:19:25','2025-02-27 13:34:13'),(16,16,'2025-03-10',205.3500,'Cash','TXN-16-16-16-20250310','Completed',0.00,'US Dollar','2025-02-25 15:19:25','2025-02-27 13:34:13'),(17,17,'2025-03-11',218.2900,'Credit Card','TXN-17-17-17-20250311','Completed',0.00,'US Dollar','2025-02-25 15:19:25','2025-02-27 13:34:13'),(18,18,'2025-03-12',222.5025,'PayPal','TXN-18-18-18-20250312','Completed',0.01,'US Dollar','2025-02-25 15:19:25','2025-02-27 13:41:59'),(19,19,'2025-03-13',1109.0000,'Cash','TXN-19-19-19-20250313','Completed',0.00,'US Dollar','2025-02-25 15:19:25','2025-02-27 13:34:13'),(20,20,'2025-03-14',594.0000,'Credit Card','TXN-20-20-20-20250314','Completed',0.00,'US Dollar','2025-02-25 15:19:25','2025-02-27 13:34:13'),(21,21,'2025-03-01',11648.3300,'PayPal',NULL,'Pending',0.01,'US Dollar','2025-03-01 14:04:52','2025-03-01 14:05:09');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-01 21:39:38
