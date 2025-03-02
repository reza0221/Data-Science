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
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` text,
  `category` varchar(50) DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `sku` varchar(20) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `discount_percentage` decimal(5,2) DEFAULT '0.00',
  `is_active` tinyint(1) DEFAULT '1',
  `stock` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `weight` decimal(10,2) DEFAULT NULL,
  `dimensions` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Laptop','High-performance laptop with fast processing and ample storage.','Computers','TechBrand','TB-LAP-001',1000.00,2.00,1,100,'2025-02-25 11:52:13','2025-02-28 13:40:55',2.50,'35 x 25 x 2 cm'),(2,'Smartphone','Latest model smartphone with high-resolution camera and long-lasting battery.','Mobile Phones','SmartTech','ST-PHN-002',500.00,0.00,1,100,'2025-02-25 11:52:13','2025-02-28 13:40:55',0.20,'15 x 7 x 0.8 cm'),(3,'Tablet','Portable tablet perfect for browsing, reading, and entertainment.','Tablets','TabWorld','TW-TAB-003',300.00,0.00,1,100,'2025-02-25 11:52:13','2025-02-28 13:40:55',0.50,'25 x 17 x 0.7 cm'),(4,'Headphones','Noise-cancelling headphones with superior sound quality.','Audio','SoundMax','SM-HPH-004',50.00,0.00,1,100,'2025-02-25 11:52:13','2025-02-28 13:40:55',0.30,'18 x 15 x 7 cm'),(5,'Mouse','Ergonomic mouse for smooth and precise control.','Accessories','PeriTech','PT-MOU-005',20.00,0.00,1,100,'2025-02-25 11:52:13','2025-02-25 12:10:43',0.10,'10 x 6 x 4 cm'),(6,'Keyboard','Comfortable keyboard with quiet keys for better typing experience.','Accessories','PeriTech','PT-KBD-006',30.00,0.00,1,100,'2025-02-25 11:52:13','2025-02-28 13:40:55',0.60,'45 x 15 x 3 cm'),(7,'Monitor','High-definition monitor with vibrant colors and sharp images.','Displays','ViewPro','VP-MON-007',200.00,0.00,1,100,'2025-02-25 11:52:13','2025-02-28 13:40:55',3.00,'50 x 30 x 10 cm'),(8,'Printer','All-in-one printer for home and office use.','Printers','PrintEase','PE-PRT-008',150.00,0.00,1,100,'2025-02-25 11:52:13','2025-02-28 13:40:55',6.50,'48 x 40 x 25 cm'),(9,'Scanner','Fast and reliable scanner for documents and images.','Scanners','ScanTech','ST-SCN-009',100.00,0.00,1,100,'2025-02-25 11:52:13','2025-02-28 13:40:55',4.00,'40 x 30 x 15 cm'),(10,'External Hard Drive','Portable external hard drive for extra storage and backup.','Storage Devices','DataSafe','DS-EHD-010',80.00,0.00,1,100,'2025-02-25 11:52:13','2025-02-28 13:40:55',0.80,'12 x 8 x 2 cm'),(11,'Webcam','High-quality webcam for video conferencing and streaming.','Cameras','CamPro','CP-WEB-011',40.00,0.00,1,100,'2025-02-25 11:52:13','2025-02-28 13:40:55',0.15,'10 x 7 x 5 cm'),(12,'Microphone','Clear-sounding microphone for recording and communication.','Audio','SoundMax','SM-MIC-012',30.00,0.00,1,100,'2025-02-25 11:52:13','2025-02-28 13:40:55',0.25,'20 x 15 x 8 cm'),(13,'Speakers','Compact speakers with deep bass and clear treble.','Audio','SoundMax','SM-SPK-013',50.00,0.00,1,100,'2025-02-25 11:52:13','2025-02-28 13:40:55',0.50,'25 x 20 x 15 cm'),(14,'USB Flash Drive','Convenient USB flash drive for quick data transfer.','Storage Devices','DataSafe','DS-UFD-014',10.00,0.00,1,100,'2025-02-25 11:52:13','2025-02-25 12:10:43',0.05,'6 x 2 x 1 cm'),(15,'Ethernet Cable','Durable Ethernet cable for fast network connections.','Networking','NetConnect','NC-ETH-015',5.00,0.00,1,100,'2025-02-25 11:52:13','2025-02-28 13:40:55',0.20,'20 x 15 x 3 cm'),(16,'HDMI Cable','Reliable HDMI cable for high-quality video and audio.','Cables','CablePro','CP-HDM-016',10.00,0.00,1,100,'2025-02-25 11:52:13','2025-02-28 13:40:55',0.25,'25 x 20 x 4 cm'),(17,'VGA Cable','Versatile VGA cable for legacy devices and displays.','Cables','CablePro','CP-VGA-017',8.00,0.00,1,100,'2025-02-25 11:52:13','2025-02-28 13:40:55',0.30,'30 x 20 x 5 cm'),(18,'Power Strip','Multi-outlet power strip with surge protection.','Power Accessories','PowerSafe','PS-PWS-018',15.00,0.00,1,100,'2025-02-25 11:52:13','2025-02-28 13:40:55',0.60,'40 x 10 x 6 cm'),(19,'Wireless Router','Fast wireless router for seamless internet connectivity.','Networking','NetConnect','NC-WRT-019',50.00,0.00,1,100,'2025-02-25 11:52:13','2025-02-28 13:40:55',0.80,'25 x 20 x 5 cm'),(20,'Network Switch','Efficient network switch for stable wired connections.','Networking','NetConnect','NC-SWT-020',60.00,0.00,1,100,'2025-02-25 11:52:13','2025-02-28 13:40:55',1.20,'30 x 25 x 6 cm'),(21,'TechBrand Smartphone','Latest model','Electronics','TechBrand',NULL,500.00,2.00,1,50,'2025-03-01 14:04:52','2025-03-01 14:04:52',0.50,'15 x 7 x 0.8 cm');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
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
