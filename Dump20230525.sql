CREATE DATABASE  IF NOT EXISTS `certificados` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `certificados`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: certificados
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `certificate_downloads`
--

DROP TABLE IF EXISTS `certificate_downloads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `certificate_downloads` (
  `id` int NOT NULL AUTO_INCREMENT,
  `certificate_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `download_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `certificate_downloads_ibfk_1` (`certificate_id`),
  KEY `certificate_downloads_ibfk_2` (`user_id`),
  CONSTRAINT `certificate_downloads_ibfk_1` FOREIGN KEY (`certificate_id`) REFERENCES `certificates` (`id`),
  CONSTRAINT `certificate_downloads_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificate_downloads`
--

LOCK TABLES `certificate_downloads` WRITE;
/*!40000 ALTER TABLE `certificate_downloads` DISABLE KEYS */;
INSERT INTO `certificate_downloads` VALUES (1,13,2,'2023-05-09 12:15:40'),(2,19,10,'2023-05-10 12:15:40'),(3,3,1,'2023-05-10 12:15:40'),(4,15,1,'2023-05-11 12:20:51'),(9,16,2,'2023-05-11 15:42:20'),(10,16,2,'2023-05-11 00:00:00'),(11,3,1,'2023-05-12 11:13:55'),(12,16,2,'2023-05-12 11:16:26'),(13,13,2,'2023-05-12 11:41:55'),(14,6,3,'2023-05-12 17:40:19'),(15,13,2,'2023-05-12 17:49:40'),(16,29,13,'2023-05-12 17:54:08'),(17,16,2,'2023-05-13 16:25:46'),(18,6,3,'2023-05-13 16:28:53'),(19,16,2,'2023-05-19 17:07:29'),(20,1,2,'2023-05-24 18:29:09'),(21,1,2,'2023-05-24 18:47:09'),(22,1,2,'2023-05-24 18:47:11'),(23,1,2,'2023-05-24 20:15:59'),(24,1,2,'2023-05-24 20:16:01'),(25,1,2,'2023-05-24 20:17:25'),(26,30,18,'2023-05-24 20:17:55'),(27,6,3,'2023-05-24 20:19:41'),(28,3,1,'2023-05-24 21:13:42'),(29,17,3,'2023-05-24 21:55:30'),(30,15,1,'2023-05-24 22:10:14'),(31,28,13,'2023-05-24 22:10:52'),(32,15,1,'2023-05-24 22:40:09'),(33,12,10,'2023-05-25 06:32:18'),(34,12,10,'2023-05-25 06:33:38'),(35,6,3,'2023-05-25 07:49:34'),(36,6,3,'2023-05-25 07:54:01'),(118,38,3,'2023-05-25 00:00:00'),(119,38,3,'2023-05-25 00:00:00'),(120,38,3,'2023-05-26 00:00:00'),(121,38,19,'2023-05-25 15:26:32'),(122,39,11,'2023-05-25 15:28:30'),(123,33,11,'2023-05-25 15:39:22'),(124,39,11,'2023-05-25 15:39:32'),(125,1,2,'2023-05-25 15:52:10'),(126,1,2,'2023-05-25 15:53:31'),(127,30,18,'2023-05-25 15:57:34'),(128,17,3,'2023-05-25 15:57:57');
/*!40000 ALTER TABLE `certificate_downloads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificate_types`
--

DROP TABLE IF EXISTS `certificate_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `certificate_types` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificate_types`
--

LOCK TABLES `certificate_types` WRITE;
/*!40000 ALTER TABLE `certificate_types` DISABLE KEYS */;
INSERT INTO `certificate_types` VALUES (1,'Certificado Curso'),(2,'Certificado Equipo');
/*!40000 ALTER TABLE `certificate_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates`
--

DROP TABLE IF EXISTS `certificates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `certificates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `type_id` int NOT NULL,
  `filename` varchar(50) NOT NULL,
  `upload_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `certificates_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `certificates_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `certificate_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates`
--

LOCK TABLES `certificates` WRITE;
/*!40000 ALTER TABLE `certificates` DISABLE KEYS */;
INSERT INTO `certificates` VALUES (1,2,1,'1.pdf','2023-05-01 00:00:00'),(2,3,1,'2.pdf','2023-05-02 00:00:00'),(3,1,1,'3.pdf','2023-05-10 10:12:04'),(6,3,1,'6.pdf','2023-05-10 10:49:32'),(11,11,2,'11.pdf','2023-05-10 11:09:49'),(12,10,1,'12.pdf','2023-05-10 11:29:32'),(13,2,2,'13.pdf','2023-05-10 11:42:28'),(15,1,1,'15.pdf','2023-05-10 00:00:00'),(16,2,2,'16.pdf','2023-05-10 00:00:00'),(17,3,1,'17.pdf','2023-05-10 00:00:00'),(18,9,2,'18.pdf','2023-05-10 00:00:00'),(19,10,1,'19.pdf','2023-05-10 00:00:00'),(20,11,2,'20.pdf','2023-05-10 00:00:00'),(28,13,1,'28.pdf','2023-05-12 17:46:51'),(29,13,1,'29.pdf','2023-05-12 17:53:43'),(30,18,2,'30.pdf','2023-05-24 12:15:32'),(31,1,1,'31.pdf','2023-05-10 00:00:00'),(32,1,1,'32.pdf','2023-05-10 00:00:00'),(33,11,1,'33.pdf','2023-05-25 08:33:20'),(34,1,1,'34.pdf','2023-05-25 08:39:30'),(35,2,2,'35.pdf','2023-05-25 08:41:03'),(36,9,1,'36.pdf','2023-05-25 08:51:49'),(37,1,1,'37.pdf','2023-05-25 11:54:51'),(38,19,2,'38.pdf','2023-05-25 13:07:22'),(39,11,1,'39.pdf','2023-05-25 15:28:17');
/*!40000 ALTER TABLE `certificates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_details`
--

DROP TABLE IF EXISTS `user_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `document` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_details_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_details`
--

LOCK TABLES `user_details` WRITE;
/*!40000 ALTER TABLE `user_details` DISABLE KEYS */;
INSERT INTO `user_details` VALUES (1,1,'Administracion','Ensep','9004440817','comercialensep@gmail.com',1),(2,2,'USER','UNO','80831122','USER1@GMAIL.COM',1),(3,3,'USER','DOS','80831123','USER2@GMAIL.COM',1),(4,9,'USER','TRES','80831124','USER3@GMAIL.COM',1),(5,10,'USER','CUATRO','80831125','USER4@GMAIL.COM',1),(6,11,'USER','CINCO','80831126','USER5@GMAIL.COM',1),(8,13,'PRUEBA','UNO','123456','PRUEBA1@GMAIL.COM',1),(9,18,'pruebamysql','pruebamysql','12345678','pruebamysql@mail.com',1),(10,19,'prueba2','prueba2','87654321','prueba2@correo.com',1);
/*!40000 ALTER TABLE `user_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `is_admin` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin',1),(2,'user1','user1',0),(3,'user2','user2',0),(9,'user3','user3',0),(10,'user4','user4',0),(11,'user5','user5',0),(13,'PRUEBA1','PRUEBA1',0),(14,'pruebamysql','pruebamysql',0),(15,'pruebamysql','pruebamysql',0),(16,'pruebamysql','pruebamysql',0),(17,'pruebamysql','pruebamysql',0),(18,'pruebamysql','pruebamysql',0),(19,'prueba2','prueba2',0);
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

-- Dump completed on 2023-05-25 16:19:55
