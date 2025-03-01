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
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `status` enum('Pending','Shipped','Delivered','Cancelled') DEFAULT 'Pending',
  `shipping_address` text,
  `shipping_cost` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tracking_number` varchar(100) DEFAULT NULL,
  `payment_status` enum('Unpaid','Paid','Refunded') DEFAULT 'Unpaid',
  `delivery_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  KEY `orders_ibfk_1` (`customer_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'2025-02-23',26342.40,'Delivered','123 Main St, City A',20.00,'TRK1234567890','Paid','2025-02-28','2025-02-25 12:35:20','2025-02-27 13:13:53'),(2,2,'2025-02-24',5390.00,'Delivered','456 Oak St, City B',15.00,'TRK1234567891','Paid','2025-03-01','2025-02-25 12:35:20','2025-02-27 13:13:53'),(3,3,'2025-02-25',900.00,'Delivered','789 Pine St, City C',12.50,'TRK1234567892','Paid','2025-03-03','2025-02-25 12:35:20','2025-02-27 13:13:53'),(4,4,'2025-02-26',539.00,'Delivered','101 Maple Ave, City D',5.00,'TRK1234567893','Paid','2025-03-05','2025-02-25 12:35:20','2025-02-27 13:13:53'),(5,5,'2025-02-27',254.80,'Delivered','202 Birch Blvd, City E',3.00,'TRK1234567894','Paid','2025-03-06','2025-02-25 12:35:20','2025-02-27 13:13:53'),(6,6,'2025-02-28',90.00,'Delivered','303 Cedar Ln, City F',4.50,'TRK1234567895','Paid','2025-03-08','2025-02-25 12:35:20','2025-02-27 13:13:53'),(7,7,'2025-03-01',600.00,'Delivered','404 Spruce Ct, City G',10.00,'TRK1234567896','Paid','2025-03-09','2025-02-25 12:35:20','2025-02-27 13:13:53'),(8,8,'2025-03-02',1350.00,'Delivered','505 Willow Rd, City H',8.00,'TRK1234567897','Paid','2025-03-10','2025-02-25 12:35:20','2025-02-27 13:13:53'),(9,9,'2025-03-03',300.00,'Delivered','606 Poplar St, City I',7.00,'TRK1234567898','Paid','2025-03-12','2025-02-25 12:35:20','2025-02-27 13:13:53'),(10,10,'2025-03-04',1536.00,'Delivered','707 Elm St, City J',6.50,'TRK1234567899','Paid','2025-03-13','2025-02-25 12:35:20','2025-02-27 13:13:53'),(11,11,'2025-03-05',1036.80,'Delivered','808 Ash Dr, City K',5.75,'TRK1234567900','Paid','2025-03-14','2025-02-25 12:35:20','2025-02-27 13:13:53'),(12,12,'2025-03-06',529.20,'Delivered','909 Chestnut Ave, City L',6.25,'TRK1234567901','Paid','2025-03-15','2025-02-25 12:35:20','2025-02-27 13:13:53'),(13,13,'2025-03-07',350.00,'Delivered','111 Beech Blvd, City M',4.00,'TRK1234567902','Paid','2025-03-17','2025-02-25 12:35:20','2025-02-27 13:13:53'),(14,14,'2025-03-08',107.80,'Delivered','222 Walnut Ct, City N',2.50,'TRK1234567903','Paid','2025-03-18','2025-02-25 12:35:20','2025-02-27 13:13:53'),(15,15,'2025-03-09',25.00,'Delivered','333 Redwood Rd, City O',2.00,'TRK1234567904','Paid','2025-03-19','2025-02-25 12:35:20','2025-02-27 13:13:53'),(16,16,'2025-03-10',201.60,'Delivered','444 Fir Ln, City P',3.75,'TRK1234567905','Paid','2025-03-20','2025-02-25 12:35:20','2025-02-27 13:13:53'),(17,17,'2025-03-11',215.04,'Delivered','555 Cypress St, City Q',3.25,'TRK1234567906','Paid','2025-03-21','2025-02-25 12:35:20','2025-02-27 13:13:53'),(18,18,'2025-03-12',220.50,'Delivered','666 Magnolia Blvd, City R',4.25,'TRK1234567907','Paid','2025-03-22','2025-02-25 12:35:20','2025-02-27 13:13:53'),(19,19,'2025-03-13',1104.00,'Delivered','777 Dogwood Ct, City S',5.00,'TRK1234567908','Paid','2025-03-23','2025-02-25 12:35:20','2025-02-27 13:13:53'),(20,20,'2025-03-14',588.00,'Delivered','888 Alder Ave, City T',6.00,'TRK1234567909','Paid','2025-03-24','2025-02-25 12:35:20','2025-02-27 13:13:53'),(21,21,'2025-03-01',11760.00,'Pending','123 Main St, NY, USA',5.99,NULL,'Unpaid','2025-03-01','2025-03-01 14:04:52','2025-03-01 14:05:09');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
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
