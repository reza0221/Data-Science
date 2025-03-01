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
-- Table structure for table `transaction_records`
--

DROP TABLE IF EXISTS `transaction_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_records` (
  `payment_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `order_id` int NOT NULL,
  `order_detail_id` int NOT NULL,
  `product_id` int NOT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  KEY `transaction_records_ibfk_1` (`payment_id`),
  KEY `idx_transaction_records_customer_id` (`customer_id`),
  KEY `idx_transaction_records_order_id` (`order_id`),
  KEY `idx_transaction_records_product_id` (`product_id`),
  CONSTRAINT `transaction_records_ibfk_1` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`payment_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_records`
--

LOCK TABLES `transaction_records` WRITE;
/*!40000 ALTER TABLE `transaction_records` DISABLE KEYS */;
INSERT INTO `transaction_records` VALUES (1,1,1,1,1,'TXN-1-1-1-20250223','2025-02-25 23:36:32'),(2,2,2,2,2,'TXN-2-2-2-20250224','2025-02-25 23:36:32'),(3,3,3,3,3,'TXN-3-3-3-20250225','2025-02-25 23:36:32'),(4,4,4,4,4,'TXN-4-4-4-20250226','2025-02-25 23:36:32'),(5,5,5,5,5,'TXN-5-5-5-20250227','2025-02-25 23:36:32'),(6,6,6,6,6,'TXN-6-6-6-20250228','2025-02-25 23:36:32'),(7,7,7,7,7,'TXN-7-7-7-20250301','2025-02-25 23:36:32'),(8,8,8,8,8,'TXN-8-8-8-20250302','2025-02-25 23:36:32'),(9,9,9,9,9,'TXN-9-9-9-20250303','2025-02-25 23:36:32'),(10,10,10,10,10,'TXN-10-10-10-20250304','2025-02-25 23:36:32'),(11,11,11,11,11,'TXN-11-11-11-20250305','2025-02-25 23:36:32'),(12,12,12,12,12,'TXN-12-12-12-20250306','2025-02-25 23:36:32'),(13,13,13,13,13,'TXN-13-13-13-20250307','2025-02-25 23:36:32'),(14,14,14,14,14,'TXN-14-14-14-20250308','2025-02-25 23:36:32'),(15,15,15,15,15,'TXN-15-15-15-20250309','2025-02-25 23:36:32'),(16,16,16,16,16,'TXN-16-16-16-20250310','2025-02-25 23:36:32'),(17,17,17,17,17,'TXN-17-17-17-20250311','2025-02-25 23:36:32'),(18,18,18,18,18,'TXN-18-18-18-20250312','2025-02-25 23:36:32'),(19,19,19,19,19,'TXN-19-19-19-20250313','2025-02-25 23:36:32'),(20,20,20,20,20,'TXN-20-20-20-20250314','2025-02-25 23:36:32');
/*!40000 ALTER TABLE `transaction_records` ENABLE KEYS */;
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
