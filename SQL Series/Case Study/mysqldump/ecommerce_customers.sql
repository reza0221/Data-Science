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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `phone` varchar(15) DEFAULT NULL,
  `address` text,
  `date_of_birth` date DEFAULT NULL,
  `gender` enum('Male','Female') DEFAULT NULL,
  `loyalty_points` int DEFAULT '0',
  `account_status` enum('Active','Inactive','Suspended') DEFAULT 'Active',
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Alice Smith','alice@example.com','2025-02-24 03:26:43','2025-02-25 16:53:10','123-456-7890','123 Main St, Anytown, USA','1990-01-01','Female',1,'Active'),(2,'Bob Johnson','bob@example.com','2025-02-24 05:53:57','2025-02-25 11:43:55','234-567-8901','456 Elm St, Othertown, USA','1985-05-12','Male',0,'Active'),(3,'Charlie Brown','charlie@example.com','2025-02-24 05:53:57','2025-02-25 16:53:35','345-678-9012','789 Oak St, Anycity, USA','1992-08-25','Male',1,'Active'),(4,'Diana Prince','diana@example.com','2025-02-24 05:53:57','2025-02-25 11:43:56','456-789-0123','012 Pine St, Othercity, USA','1988-03-10','Female',0,'Active'),(5,'Evan Rogers','evan@example.com','2025-02-24 05:53:57','2025-02-25 11:43:56','567-890-1234','123 Maple St, Anyvillage, USA','1995-11-02','Male',0,'Active'),(6,'Fiona Green','fiona@example.com','2025-02-24 05:53:57','2025-02-25 16:53:35','678-901-2345','234 Birch St, Othervillage, USA','1990-07-18','Female',1,'Active'),(7,'Gina White','gina@example.com','2025-02-24 05:53:57','2025-02-25 11:43:56','789-012-3456','345 Cedar St, Anystate, USA','1987-02-05','Female',0,'Active'),(8,'Henry Black','henry@example.com','2025-02-24 05:53:57','2025-02-25 11:43:56','890-123-4567','456 Walnut St, Otherstate, USA','1983-09-22','Male',0,'Active'),(9,'Ivy Brown','ivy@example.com','2025-02-24 05:53:57','2025-02-25 16:53:35','901-234-5678','567 Spruce St, Anycountry, USA','1994-06-30','Female',1,'Active'),(10,'Jack Miller','jack@example.com','2025-02-24 05:53:57','2025-02-25 11:43:56','012-345-6789','678 Pineapple St, Othercountry, USA','1991-12-15','Male',0,'Active'),(11,'Kate Wilson','kate@example.com','2025-02-24 14:19:14','2025-02-25 11:43:56','123-456-7890','123 Banana St, Anyplanet, USA','1989-04-28','Female',0,'Active'),(12,'Liam Davis','liam@example.com','2025-02-24 14:19:14','2025-02-25 16:53:35','234-567-8901','456 Orange St, Otherplanet, USA','1996-01-20','Male',1,'Active'),(13,'Mia Taylor','mia@example.com','2025-02-24 14:19:14','2025-02-25 11:43:56','345-678-9012','789 Apple St, Anystar, USA','1993-10-07','Female',0,'Active'),(14,'Noah Anderson','noah@example.com','2025-02-24 14:19:14','2025-02-25 11:43:56','456-789-0123','012 Cherry St, Otherstar, USA','1986-06-11','Male',0,'Active'),(15,'Olivia Martinez','olivia@example.com','2025-02-24 14:19:14','2025-02-25 16:53:35','567-890-1234','123 Grape St, Anysolar, USA','1997-09-04','Female',1,'Active'),(16,'Peter Martinez','peter@example.com','2025-02-24 14:19:14','2025-02-25 11:43:56','678-901-2345','234 Lemon St, Othersolar, USA','1984-11-26','Male',0,'Active'),(17,'Quinn Green','quinn@example.com','2025-02-24 14:19:14','2025-02-25 11:43:56','789-012-3456','345 Lime St, Anygalaxy, USA','1990-02-14','Female',0,'Active'),(18,'Rachel Brown','rachel@example.com','2025-02-24 14:19:14','2025-02-25 16:53:35','890-123-4567','456 Strawberry St, Othergalaxy, USA','1982-08-19','Female',1,'Active'),(19,'Sam White','sam@example.com','2025-02-24 14:19:14','2025-02-25 11:43:56','901-234-5678','567 Blueberry St, Anyuniverse, USA','1998-03-03','Male',0,'Active'),(20,'Tina Black','tina@example.com','2025-02-24 14:19:14','2025-02-25 11:43:56','012-345-6789','678 Raspberry St, Otheruniverse, USA','1991-05-23','Female',0,'Active'),(21,'John Doe','john.doe@email.com','2025-03-01 14:04:52','2025-03-01 14:04:52','885-673-6734','123 Main St, NY, USA','1990-05-15','Male',0,'Active');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-01 21:39:37
