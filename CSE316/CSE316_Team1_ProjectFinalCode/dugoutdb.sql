-- MySQL dump 10.13  Distrib 9.3.0, for macos15.2 (arm64)
--
-- Host: localhost    Database: dugoutdb
-- ------------------------------------------------------
-- Server version	9.3.0

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
-- Table structure for table `batters_1B`
--

DROP TABLE IF EXISTS `batters_1B`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `batters_1B` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `team` varchar(20) DEFAULT NULL,
  `war` float DEFAULT NULL,
  `pa` int DEFAULT NULL,
  `ab` int DEFAULT NULL,
  `hr` int DEFAULT NULL,
  `rbi` int DEFAULT NULL,
  `avg` float DEFAULT NULL,
  `battingScore` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batters_1B`
--

LOCK TABLES `batters_1B` WRITE;
/*!40000 ALTER TABLE `batters_1B` DISABLE KEYS */;
INSERT INTO `batters_1B` VALUES (1,'Austin Dean','LG Twins',2.44,221,188,16,44,0.309,178.08),(2,'Lewin Diaz','Samsung Lions',1.79,248,223,21,62,0.3,221.88),(3,'Patrick Wisdom','KIA Tigers',1.46,152,126,9,26,0.246,102.72),(4,'Yang Seok-hwan','Doosan Bears',1.01,232,204,6,23,0.26,75.72),(5,'Chae Eun-seong','Hanwha Eagles',0.64,230,209,9,31,0.278,98.88),(6,'Na Seung-yeop','Lotte Giants',0.59,238,199,7,31,0.246,86.28),(7,'Tucker Davidson','NC Dinos',0.58,130,113,8,28,0.31,88.56),(8,'Go Myung-jun','SSG Landers',0.39,203,188,6,29,0.266,75.48),(9,'Choi Joo-hwan','Kiwoom Heroes',0.37,239,213,4,31,0.286,65.64),(10,'Seo Ho-cheol','NC Dinos',0.28,115,102,1,12,0.294,23.76),(11,'Do Tae-hoon','NC Dinos',0.25,65,51,0,4,0.216,7.8),(12,'Kim Min-soo','LG Twins',0.03,8,6,0,1,0.167,1.56),(13,'Choi Hang','Lotte Giants',-0.06,2,2,0,0,0,-0.72),(14,'Moon Jeong-bin','LG Twins',-0.07,23,20,1,3,0.1,8.76),(15,'Hwang Dae-in','KIA Tigers',-0.12,25,24,0,4,0.208,3.36),(16,'Kang Jinseong','Kiwoom Heroes',-0.18,13,11,0,1,0.182,-0.96),(17,'Yoon Jun-hyeok','KT Wiz',-0.18,16,15,0,0,0.067,-2.16),(18,'Moon Sang-cheol','KT Wiz',-0.18,147,126,1,8,0.214,13.44),(19,'Kim In-hwan','Hanwha Eagles',-0.3,8,8,0,0,0,-3.6);
/*!40000 ALTER TABLE `batters_1B` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batters_2B`
--

DROP TABLE IF EXISTS `batters_2B`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `batters_2B` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `team` varchar(20) DEFAULT NULL,
  `war` float DEFAULT NULL,
  `pa` int DEFAULT NULL,
  `ab` int DEFAULT NULL,
  `hr` int DEFAULT NULL,
  `rbi` int DEFAULT NULL,
  `avg` float DEFAULT NULL,
  `battingScore` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batters_2B`
--

LOCK TABLES `batters_2B` WRITE;
/*!40000 ALTER TABLE `batters_2B` DISABLE KEYS */;
INSERT INTO `batters_2B` VALUES (1,'Park Min-woo','NC Dinos',2.16,198,171,0,21,0.298,51.12),(2,'Ko Seung-min','Lotte Giants',1.26,216,191,2,19,0.309,49.92),(3,'Ryu Ji-hyuk','Samsung Lions',0.99,203,172,0,19,0.297,34.68),(4,'Oh Myung-jin','Doosan Bears',0.96,150,135,1,20,0.274,41.52),(5,'Yang Do-geun','Samsung Lions',0.91,65,50,0,5,0.34,16.92),(6,'Kim Seonbin','KIA Tigers',0.78,125,106,0,17,0.292,29.76),(7,'Cheon Seong-ho','KT Wiz',0.72,65,55,0,7,0.2,17.04),(8,'Yoon Do-hyun','KIA Tigers',0.53,39,35,4,7,0.371,38.76),(9,'Koo Bon-hyeok','LG Twins',0.45,162,144,1,20,0.257,35.4),(10,'Lee Yu-chan','Doosan Bears',0.39,33,30,0,4,0.3,9.48),(11,'Lee Young-bin','LG Twins',0.33,46,44,3,4,0.25,26.76),(12,'Shin Min-jae','LG Twins',0.31,142,118,0,15,0.229,21.72),(13,'Kim Hanbyeol','NC Dinos',0.16,26,22,0,2,0.364,4.32),(14,'Lee Seung-hyun','Hanwha Eagles',0.15,1,1,0,1,1,3),(15,'Kim Sang-soo','KT Wiz',0.13,135,114,1,10,0.211,19.56),(16,'Jung Jun Jae','SSG Landers',0.12,195,168,0,11,0.214,14.64),(17,'Park Gye-beom','Doosan Bears',0.11,85,73,0,8,0.233,10.92),(18,'Lee Do-yoon','Hanwha Eagles',0.09,100,90,0,15,0.222,19.08),(19,'Kim Jun-sang','Doosan Bears',0.07,12,10,0,0,0.3,0.84),(20,'Kim Joo-sung','LG Twins',0.04,1,1,0,0,1,0.48),(21,'Hong Jong-pyo','KIA Tigers',0.04,52,42,0,1,0.19,1.68),(22,'Choi Jeong-yong','KIA Tigers',0.01,6,6,0,0,0.167,0.12),(23,'Shim Jae Hoon','Samsung Lions',0,29,24,0,1,0.208,1.2),(24,'Choi Jeong-won','NC Dinos',-0.01,34,27,0,2,0.259,2.28),(25,'Seo Geon-chang','KIA Tigers',-0.02,26,22,1,2,0.136,8.16),(26,'Seo Yu-shin','Kiwoom Heroes',-0.11,3,3,0,0,0,-1.32),(27,'Park Jun-soon','Doosan Bears',-0.2,8,7,0,0,0.143,-2.4),(28,'Hwang Young-mook','Hanwha Eagles',-0.25,171,154,1,9,0.234,13.8),(29,'Anjuhyung','Samsung Lions',-0.3,15,14,0,0,0.214,-3.6),(30,'Oh Yoon-seok','KT Wiz',-0.35,62,53,0,6,0.189,3),(31,'Song Ji-hoo','Kiwoom Heroes',-0.37,26,26,0,0,0.154,-4.44),(32,'Kang Min-seong','KT Wiz',-0.45,26,21,0,1,0.048,-4.2);
/*!40000 ALTER TABLE `batters_2B` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batters_3B`
--

DROP TABLE IF EXISTS `batters_3B`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `batters_3B` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `team` varchar(20) DEFAULT NULL,
  `war` float DEFAULT NULL,
  `pa` int DEFAULT NULL,
  `ab` int DEFAULT NULL,
  `hr` int DEFAULT NULL,
  `rbi` int DEFAULT NULL,
  `avg` float DEFAULT NULL,
  `battingScore` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batters_3B`
--

LOCK TABLES `batters_3B` WRITE;
/*!40000 ALTER TABLE `batters_3B` DISABLE KEYS */;
INSERT INTO `batters_3B` VALUES (1,'Moon Bo-kyung','LG Twins',3.14,244,203,12,42,0.32,160.08),(2,'Song Seong-moon','Kiwoom Heroes',2.6,264,236,8,28,0.28,112.8),(3,'Kim Do-young','KIA Tigers',1.47,111,100,7,26,0.33,90.84),(4,'Hwang Jae-gyun','KT Wiz',1.29,202,180,2,20,0.311,51.48),(5,'Noh Si-hwan','Hanwha Eagles',1.06,249,218,11,39,0.239,125.52),(6,'Kang Seung-ho','Doosan Bears',1.02,223,203,3,21,0.217,55.44),(7,'Heo Kyung-min','KT Wiz',0.68,148,129,1,10,0.279,26.16),(8,'Im Jong-seong','Doosan Bears',0.51,66,61,1,8,0.279,21.72),(9,'Kim Young-woong','Samsung Lions',0.51,194,176,8,28,0.244,87.72),(10,'Jeon Byeong-woo','Samsung Lions',0.38,40,30,1,3,0.2,14.16),(11,'Kim Seong-hyeon','SSG Landers',0.33,86,70,1,7,0.229,18.36),(12,'Kim Min-seong','Lotte Giants',0.19,101,86,1,13,0.221,23.88),(13,'Park Min','KIA Tigers',0.11,6,5,0,0,0.2,1.32),(14,'Yang Hyeon-jong','Kiwoom Heroes',-0.06,5,4,0,0,0,-0.72),(15,'Son Ho-young','Lotte Giants',-0.09,166,144,2,19,0.25,33.72),(16,'Lee Seung-won','Kiwoom Heroes',-0.13,2,2,0,0,0,-1.56),(17,'Byun Woo-hyuk','KIA Tigers',-0.15,132,121,0,16,0.215,17.4),(18,'Jeong Hyeon-chang','NC Dinos',-0.15,6,6,0,0,0,-1.8),(19,'Yeo Dong Wook','Kiwoom Heroes',-0.15,24,21,1,1,0.19,5.4),(20,'Jeon Tae-hyun','Kiwoom Heroes',-0.16,106,95,0,3,0.221,1.68),(21,'Go Young-woo','Kiwoom Heroes',-0.25,4,4,0,0,0,-3),(22,'Kim Soo-yoon','SSG Landers',-0.26,12,11,0,0,0.091,-3.12),(23,'Sang-Hyeon Ahn','SSG Landers',-0.28,87,80,0,3,0.288,0.24),(24,'Kim Chan-hyung','SSG Landers',-0.28,26,24,0,0,0.167,-3.36),(25,'Seok Jeong-woo','SSG Landers',-0.29,9,8,0,0,0.25,-3.48),(26,'Park Ji-hwan','SSG Landers',-0.78,54,48,0,4,0.167,-4.56),(27,'Kim Hui-jip','NC Dinos',-0.84,182,161,5,14,0.186,36.72);
/*!40000 ALTER TABLE `batters_3B` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batters_C`
--

DROP TABLE IF EXISTS `batters_C`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `batters_C` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `team` varchar(20) DEFAULT NULL,
  `war` float DEFAULT NULL,
  `pa` int DEFAULT NULL,
  `ab` int DEFAULT NULL,
  `hr` int DEFAULT NULL,
  `rbi` int DEFAULT NULL,
  `avg` float DEFAULT NULL,
  `battingScore` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batters_C`
--

LOCK TABLES `batters_C` WRITE;
/*!40000 ALTER TABLE `batters_C` DISABLE KEYS */;
INSERT INTO `batters_C` VALUES (1,'Park Dong-won','LG Twins',3.48,210,176,13,34,0.301,160.56),(2,'Yang Euji','Doosan Bears',2.76,232,197,8,35,0.31,123.12),(3,'Yoo Kang-nam','Lotte Giants',1.65,150,121,4,19,0.306,66.6),(4,'Choi Jae Hoon','Hanwha Eagles',1.27,126,89,0,12,0.292,29.64),(5,'Kim Hyung-jun','NC Dinos',1.25,138,123,10,29,0.236,109.8),(6,'Jang Seong-woo','KT Wiz',1.09,211,174,5,25,0.23,73.08),(7,'Kang Min-ho','Samsung Lions',1.02,201,178,2,31,0.275,61.44),(8,'Lee Joo-heon','LG Twins',0.63,47,35,2,4,0.229,24.36),(9,'Kim Tae-gun','KIA Tigers',0.48,93,83,1,7,0.241,20.16),(10,'Kim Ki-yeon','Doosan Bears',0.31,97,83,1,13,0.265,25.32),(11,'Jo Hyeong-woo','SSG Landers',0.25,112,104,2,11,0.25,28.2),(12,'Shin Beom-soo','SSG Landers',0.2,27,21,1,3,0.19,12),(13,'Jo Dae-hyun','KT Wiz',0.14,12,9,0,1,0.222,2.88),(14,'Kim Jeong-ho','NC Dinos',0.14,5,5,0,0,0.6,1.68),(15,'Kim Gun-hee','Kiwoom Heroes',0.12,87,84,1,9,0.226,18.24),(16,'Lee Jae-won','Hanwha Eagles',0.11,75,67,0,5,0.194,7.32),(17,'Jung Bogeun','Lotte Giants',0.11,87,79,1,11,0.228,20.52),(18,'Han Seung-taek','KIA Tigers',0.11,20,18,0,0,0.222,1.32),(19,'Heo In-seo','Hanwha Eagles',0.08,1,1,0,1,1,2.16),(20,'Lee Ji-young','SSG Landers',0.08,91,83,1,7,0.241,15.36),(21,'Son Seong-bin','Lotte Giants',0.03,9,7,1,2,0.143,8.76),(22,'Kim Sung-woo','LG Twins',0,3,3,0,1,0.333,1.2),(23,'Park Jae-yeop','Lotte Giants',0,2,2,0,0,0.5,0),(24,'Lee Yul-ye','SSG Landers',-0.03,1,1,0,0,0,-0.36),(25,'Kim Dong-heon','Kiwoom Heroes',-0.04,50,43,0,4,0.209,4.32),(26,'Jang Seung-hyun','Doosan Bears',-0.08,2,2,0,0,0,-0.96),(27,'Han Jun-su','KIA Tigers',-0.1,110,96,2,9,0.198,21.6),(28,'Kang Hyun Woo','KT Wiz',-0.15,15,12,0,1,0.167,-0.6),(29,'Kim Jae-seong','Samsung Lions',-0.15,18,16,0,4,0.125,3),(30,'Ryu Hyun-jun','Doosan Bears',-0.15,6,6,0,0,0.167,-1.8),(31,'An Jung-yeol','NC Dinos',-0.2,20,17,0,4,0.059,2.4),(32,'Lee Byung-hun','Samsung Lions',-0.21,25,23,0,0,0.087,-2.52),(33,'Kim Jae-hyun','Kiwoom Heroes',-0.43,89,85,0,4,0.212,-0.36),(34,'Park Se-hyuk','NC Dinos',-0.55,59,54,2,7,0.13,13.8);
/*!40000 ALTER TABLE `batters_C` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batters_CF`
--

DROP TABLE IF EXISTS `batters_CF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `batters_CF` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `team` varchar(20) DEFAULT NULL,
  `war` float DEFAULT NULL,
  `pa` int DEFAULT NULL,
  `ab` int DEFAULT NULL,
  `hr` int DEFAULT NULL,
  `rbi` int DEFAULT NULL,
  `avg` float DEFAULT NULL,
  `battingScore` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batters_CF`
--

LOCK TABLES `batters_CF` WRITE;
/*!40000 ALTER TABLE `batters_CF` DISABLE KEYS */;
INSERT INTO `batters_CF` VALUES (1,'Kim Seong-yoon','Samsung Lions',3.05,212,179,2,26,0.358,79.8),(2,'Estevan Florial','Hanwha Eagles',1.77,257,235,7,25,0.272,93.24),(3,'Jung Soo-bin','Doosan Bears',1.44,241,201,3,17,0.264,55.68),(4,'Lee Joo-hyung','Kiwoom Heroes',1.29,178,154,5,13,0.234,61.08),(5,'Park Hae-min','LG Twins',1.26,221,178,0,12,0.236,29.52),(6,'Choi Ji-hoon','SSG Landers',1.14,249,225,2,18,0.302,47.28),(7,'Cheon JaeHwan','NC Dinos',1.07,129,115,3,13,0.261,46.44),(8,'Kim Ji-chan','Samsung Lions',0.71,129,112,0,12,0.321,22.92),(9,'Han Seok-hyun','NC Dinos',0.7,98,80,3,17,0.238,46.8),(10,'Jang Doo-seong','Lotte Giants',0.61,137,120,0,18,0.292,28.92),(11,'Hwang Seong-bin','Lotte Giants',0.38,121,111,0,12,0.324,18.96),(12,'Park Jeong-woo','KIA Tigers',0.38,61,50,0,4,0.28,9.36),(13,'Kim Dong-hyuk','Lotte Giants',0.29,10,6,0,0,0.5,3.48),(14,'Park Young-bin','NC Dinos',0.14,3,3,0,1,0.333,2.88),(15,'Kim Dae-han','Doosan Bears',0.12,6,6,0,0,0.5,1.44),(16,'Jang Jin-hyeok','KT Wiz',-0.04,32,31,0,5,0.226,5.52),(17,'Yoo Rokyeol','Hanwha Eagles',-0.13,2,2,0,0,0,-1.56),(18,'Kim Ho-ryeong','KIA Tigers',-0.16,57,50,0,4,0.22,2.88),(19,'Kim Jae-hyuk','Samsung Lions',-0.16,3,2,0,0,0,-1.92),(20,'Jeon Da-min','Doosan Bears',-0.19,8,8,0,0,0,-2.28),(21,'Lee Yong-gyu','Kiwoom Heroes',-0.22,33,29,0,0,0.207,-2.64),(22,'Park Soo-jong','Kiwoom Heroes',-0.28,11,11,0,0,0.091,-3.36),(23,'Jang Jae-young','Kiwoom Heroes',-0.3,16,14,0,2,0.143,-1.2),(24,'Bae Jeong-dae','KT Wiz',-0.36,150,134,1,13,0.194,17.28),(25,'Kim Seong-wook','NC Dinos',-0.5,13,13,0,0,0.077,-6),(26,'Lim Byeong-wook','Kiwoom Heroes',-0.51,85,81,0,7,0.235,2.28),(27,'Park Jae-hyun','KIA Tigers',-0.68,32,30,0,0,0.1,-8.16),(28,'Choi Won-jun','KIA Tigers',-1.07,139,128,3,11,0.188,18.36);
/*!40000 ALTER TABLE `batters_CF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batters_DH`
--

DROP TABLE IF EXISTS `batters_DH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `batters_DH` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `team` varchar(20) DEFAULT NULL,
  `war` float DEFAULT NULL,
  `pa` int DEFAULT NULL,
  `ab` int DEFAULT NULL,
  `hr` int DEFAULT NULL,
  `rbi` int DEFAULT NULL,
  `avg` float DEFAULT NULL,
  `battingScore` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batters_DH`
--

LOCK TABLES `batters_DH` WRITE;
/*!40000 ALTER TABLE `batters_DH` DISABLE KEYS */;
INSERT INTO `batters_DH` VALUES (1,'Choi Hyeong-woo','KIA Tigers',2.6,225,190,10,37,0.342,135.6),(2,'Moon Hyun-bin','Hanwha Eagles',1.34,224,201,8,36,0.318,107.28),(3,'Kim Jae-hwan','Doosan Bears',0.8,219,189,7,30,0.243,87.6),(4,'Jeon Jun-woo','Lotte Giants',0.63,247,211,4,32,0.284,69.96),(5,'Choi Jung','SSG Landers',0.61,107,86,9,26,0.221,92.52),(6,'Kang Baek-ho','KT Wiz',0.38,176,157,7,23,0.255,74.16),(7,'Kim Tae-hoon','Samsung Lions',0.2,6,5,1,2,0.6,10.8),(8,'Park Byung-ho','Samsung Lions',0.16,151,125,9,20,0.2,79.92),(9,'Yeo Dong-geon','Doosan Bears',0.02,2,2,0,0,0,0.24),(10,'Lee Chang-yong','Samsung Lions',0.01,13,11,1,2,0.273,8.52),(11,'Kim Min-hyeok','Doosan Bears',0.01,6,5,0,0,0.2,0.12),(12,'Hongdae people','SSG Landers',-0.03,2,2,0,0,0,-0.36),(13,'Han Jae-hwan','NC Dinos',-0.03,31,27,0,4,0.185,4.44),(14,'Lee Won-seok','Kiwoom Heroes',-0.04,6,5,0,0,0.2,-0.48),(15,'Kim Dong-jun','Doosan Bears',-0.05,2,2,0,0,0,-0.6),(16,'Oh Young-soo','NC Dinos',-0.09,31,29,2,8,0.207,20.52),(17,'Son Yongjun','LG Twins',-0.1,5,5,0,0,0.2,-1.2),(18,'Kwon Kwang-min','Hanwha Eagles',-0.1,9,9,0,0,0.222,-1.2),(19,'Kim Dong-yeop','Kiwoom Heroes',-0.13,5,5,0,0,0,-1.56),(20,'Hyunwonhoe','SSG Landers',-0.15,23,20,0,3,0.15,1.8),(21,'Kim Woongbin','Kiwoom Heroes',-0.19,24,18,0,0,0.111,-2.28),(22,'Jeonghoon','Lotte Giants',-0.35,104,98,1,8,0.224,11.4),(23,'An Chi Hong','Hanwha Eagles',-1.21,74,68,0,5,0.088,-8.52);
/*!40000 ALTER TABLE `batters_DH` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batters_LF`
--

DROP TABLE IF EXISTS `batters_LF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `batters_LF` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `team` varchar(20) DEFAULT NULL,
  `war` float DEFAULT NULL,
  `pa` int DEFAULT NULL,
  `ab` int DEFAULT NULL,
  `hr` int DEFAULT NULL,
  `rbi` int DEFAULT NULL,
  `avg` float DEFAULT NULL,
  `battingScore` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batters_LF`
--

LOCK TABLES `batters_LF` WRITE;
/*!40000 ALTER TABLE `batters_LF` DISABLE KEYS */;
INSERT INTO `batters_LF` VALUES (1,'Kwon Hee-dong','NC Dinos',1.68,193,150,3,14,0.267,54.96),(2,'Kim Hyun-soo','LG Twins',1.44,225,193,4,35,0.285,83.28),(3,'Victor Reyes','Lotte Giants',1.38,264,243,6,44,0.313,105.36),(4,'Kim In-tae','Doosan Bears',0.88,86,71,2,10,0.296,34.56),(5,'Oh Seon-woo','KIA Tigers',0.47,132,124,5,16,0.315,54.84),(6,'Choi Won-young','LG Twins',0.44,19,17,0,1,0.294,6.48),(7,'Guillermo Heredia','SSG Landers',0.33,57,48,1,6,0.313,17.16),(8,'Gu Ja-wook','Samsung Lions',0.31,244,210,9,37,0.248,102.12),(9,'Lim Ji-yeol','Kiwoom Heroes',0.28,48,42,1,3,0.262,12.96),(10,'Chae Hyun-woo','SSG Landers',0.26,30,26,0,6,0.192,10.32),(11,'Choi Jun-woo','SSG Landers',0.24,134,101,3,21,0.208,46.08),(12,'Moon Sung-joo','LG Twins',0.15,176,154,0,20,0.247,25.8),(13,'Ham Chang-geon','LG Twins',0.14,28,25,0,2,0.2,4.08),(14,'Lee Hyung-jong','Kiwoom Heroes',0.04,75,64,1,5,0.188,12.48),(15,'Kim Tae-geun','Samsung Lions',-0.01,14,12,0,0,0.333,-0.12),(16,'Hong Hyun-bin','Samsung Lions',-0.02,1,1,0,0,0,-0.24),(17,'Ham Suho','Samsung Lions',-0.03,1,1,0,0,0,-0.36),(18,'Kim Beom-jun','NC Dinos',-0.03,1,1,0,0,0,-0.36),(19,'Kwon Hyuk Bin','Kiwoom Heroes',-0.03,1,1,0,0,0,-0.36),(20,'Kim Byung-jun','KT Wiz',-0.05,5,5,0,0,0.2,-0.6),(21,'Choi Seung-min','LG Twins',-0.05,1,1,0,0,0,-0.6),(22,'An Chi-young','KT Wiz',-0.07,12,8,0,1,0,0.36),(23,'Kim Min-hyeok','KT Wiz',-0.07,230,211,0,19,0.299,21.96),(24,'Jaehyun Choo','Doosan Bears',-0.07,60,56,1,5,0.25,11.16),(25,'Park Han-gyeol','NC Dinos',-0.08,19,17,2,3,0.118,14.64),(26,'Kim Gun-hyung','KT Wiz',-0.09,1,1,0,0,0,-1.08),(27,'Oh Tae-gon','SSG Landers',-0.11,119,100,2,12,0.18,25.08),(28,'Kim Seok-hwan','KIA Tigers',-0.14,34,32,0,5,0.281,4.32),(29,'Right to compensation','Kiwoom Heroes',-0.18,17,16,0,2,0.25,0.24),(30,'Song Seung-hwan','NC Dinos',-0.23,7,7,0,0,0.143,-2.76),(31,'Won Seong-jun','Kiwoom Heroes',-0.24,21,20,1,3,0.15,6.72),(32,'Lee Woo-sung','KIA Tigers',-0.29,165,144,2,15,0.236,26.52),(33,'Yoo Jun-gyu','KT Wiz',-0.35,29,24,0,3,0.042,-0.6),(34,'Jo Suhaeng','Doosan Bears',-0.35,72,61,0,3,0.23,-0.6),(35,'Choi In-ho','Hanwha Eagles',-0.39,77,68,1,7,0.221,9.72),(36,'Kim Tae-yeon','Hanwha Eagles',-0.43,153,140,1,9,0.229,11.64),(37,'Puig','Kiwoom Heroes',-0.45,172,156,6,20,0.212,54.6),(38,'Kim Min-seok','Doosan Bears',-0.52,68,65,0,6,0.2,0.96);
/*!40000 ALTER TABLE `batters_LF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batters_RF`
--

DROP TABLE IF EXISTS `batters_RF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `batters_RF` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `team` varchar(20) DEFAULT NULL,
  `war` float DEFAULT NULL,
  `pa` int DEFAULT NULL,
  `ab` int DEFAULT NULL,
  `hr` int DEFAULT NULL,
  `rbi` int DEFAULT NULL,
  `avg` float DEFAULT NULL,
  `battingScore` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batters_RF`
--

LOCK TABLES `batters_RF` WRITE;
/*!40000 ALTER TABLE `batters_RF` DISABLE KEYS */;
INSERT INTO `batters_RF` VALUES (1,'Hyunmin Ahn','KT Wiz',2.21,127,112,9,30,0.321,116.52),(2,'Mel Rojas Jr.','KT Wiz',1.89,255,215,8,25,0.27,100.68),(3,'Yoon Dong-hee','Lotte Giants',1.71,205,177,4,25,0.305,74.52),(4,'Lee Jin-young','Hanwha Eagles',1.58,165,143,4,17,0.287,63.36),(5,'Jake Cave','Doosan Bears',1.33,225,206,4,25,0.286,69.96),(6,'Son Ah-seop','NC Dinos',0.99,168,150,0,24,0.32,40.68),(7,'Hong Chang-ki','LG Twins',0.8,169,134,1,15,0.269,33.6),(8,'Han Yusum','SSG Landers',0.59,214,189,3,25,0.254,55.08),(9,'Park Seung-gyu','Samsung Lions',0.55,24,22,0,1,0.5,7.8),(10,'Lee Seong-gyu','Samsung Lions',0.4,57,46,1,6,0.174,18),(11,'Lee Won-seok','Hanwha Eagles',0.37,47,41,1,5,0.171,16.44),(12,'Park Geon-woo','NC Dinos',0.29,122,104,1,18,0.288,31.08),(13,'Song Chaneui','LG Twins',0.24,138,122,3,17,0.221,41.28),(14,'Na Sung-bum','KIA Tigers',0.16,110,93,4,16,0.226,45.12),(15,'Jeong Hae-won','KIA Tigers',0.1,18,15,0,0,0.067,1.2),(16,'Jeong Hyeon-seung','SSG Landers',0,2,2,0,0,0.5,0),(17,'Ruben Cardenas','Kiwoom Heroes',-0.02,222,189,5,25,0.238,59.76),(18,'Kim Heon-gon','Samsung Lions',-0.06,121,110,2,6,0.264,18.48),(19,'Choi Sung-min','KT Wiz',-0.1,17,15,0,0,0.067,-1.2),(20,'Park Kwan Woo','LG Twins',-0.1,1,1,0,0,0,-1.2),(21,'Lee Min-jae','Hanwha Eagles',-0.12,4,4,0,0,0,-1.44),(22,'Choi Sang-min','SSG Landers',-0.14,9,7,0,1,0.143,-0.48),(23,'Josejin','Lotte Giants',-0.14,4,4,0,0,0,-1.68),(24,'Park Joo-hong','Kiwoom Heroes',-0.14,105,93,2,9,0.194,21.12),(25,'McBroom','SSG Landers',-0.15,80,74,4,11,0.203,35.4),(26,'Im Jong-chan','Hanwha Eagles',-0.15,35,30,1,2,0.167,6.6),(27,'Park Si-won','NC Dinos',-0.24,50,44,1,2,0.205,5.52),(28,'Lee Sang-hyeok','Hanwha Eagles',-0.3,6,5,0,1,0.4,-2.4),(29,'Ha Jae Hoon','SSG Landers',-0.37,25,24,1,3,0.167,5.16),(30,'Yoon Jung-bin','Samsung Lions',-0.62,43,37,0,3,0.189,-3.84);
/*!40000 ALTER TABLE `batters_RF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batters_SS`
--

DROP TABLE IF EXISTS `batters_SS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `batters_SS` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `team` varchar(20) DEFAULT NULL,
  `war` float DEFAULT NULL,
  `pa` int DEFAULT NULL,
  `ab` int DEFAULT NULL,
  `hr` int DEFAULT NULL,
  `rbi` int DEFAULT NULL,
  `avg` float DEFAULT NULL,
  `battingScore` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batters_SS`
--

LOCK TABLES `batters_SS` WRITE;
/*!40000 ALTER TABLE `batters_SS` DISABLE KEYS */;
INSERT INTO `batters_SS` VALUES (1,'Jeon Minjae','Lotte Giants',1.74,166,146,2,19,0.377,55.68),(2,'Lee Jae-hyun','Samsung Lions',1.68,234,189,5,25,0.233,80.16),(3,'Chan Ho Park','KIA Tigers',1.5,209,175,1,13,0.263,39.6),(4,'Park Sung-han','SSG Landers',1.4,231,193,3,18,0.207,56.4),(5,'Kim Joo-won','NC Dinos',1.35,229,197,4,19,0.234,63),(6,'Oh Ji-hwan','LG Twins',1.28,194,167,6,24,0.228,80.16),(7,'Ha Joo-seok','Hanwha Eagles',1.13,83,74,0,8,0.297,23.16),(8,'Kwon Dong-jin','KT Wiz',0.58,136,113,0,8,0.257,16.56),(9,'Lee Ho-jun','Lotte Giants',0.35,75,63,0,8,0.238,13.8),(10,'Park Min-seok','KT Wiz',0.23,18,16,0,1,0.25,3.96),(11,'Park Jun-young','Doosan Bears',0.2,126,111,1,10,0.225,20.4),(12,'Kim Kyu-seong','KIA Tigers',0.13,100,91,0,6,0.22,8.76),(13,'Han Tae-yang','Lotte Giants',0.07,15,13,0,1,0.385,2.04),(14,'Jang Jun-won','KT Wiz',0.06,50,45,0,5,0.222,6.72),(15,'Park Seung-wook','Lotte Giants',-0.08,22,19,0,0,0.158,-0.96),(16,'Lee Jae-sang','Kiwoom Heroes',-0.1,2,2,0,0,0.5,-1.2),(17,'Park Ji Hoon','Doosan Bears',-0.11,8,6,0,0,0.167,-1.32),(18,'Oh Seon-jin','Kiwoom Heroes',-0.14,91,79,1,12,0.241,18.72),(19,'Sim Woo-jun','Hanwha Eagles',-0.14,101,94,1,9,0.17,15.12),(20,'Kim Tae-jin','Kiwoom Heroes',-0.19,175,159,3,13,0.245,31.32),(21,'Eojunseo','Kiwoom Heroes',-0.88,97,92,1,7,0.25,3.84);
/*!40000 ALTER TABLE `batters_SS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `post_id` int NOT NULL,
  `author` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (25,16,'yobro','adasd','2025-05-31 17:36:19'),(26,16,'yobro','asdads','2025-05-31 17:36:20'),(27,16,'yobro','adsasd','2025-05-31 17:36:21'),(28,16,'yobro','asdfasd','2025-05-31 19:53:42'),(29,16,'yobro','asdfasdf','2025-05-31 19:53:43'),(30,16,'yobro','asdfasdf','2025-05-31 19:53:43'),(31,17,'yobro','asdf','2025-06-01 16:23:23'),(32,17,'yobro','asd','2025-06-01 16:23:24'),(33,17,'yobro','asda','2025-06-01 16:23:25');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fielders_1B`
--

DROP TABLE IF EXISTS `fielders_1B`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fielders_1B` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `team` varchar(20) DEFAULT NULL,
  `war` float DEFAULT NULL,
  `g` int DEFAULT NULL,
  `inn` float DEFAULT NULL,
  `dwar` float DEFAULT NULL,
  `err` int DEFAULT NULL,
  `assists` int DEFAULT NULL,
  `putouts` int DEFAULT NULL,
  `dp` int DEFAULT NULL,
  `fieldingScore` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1171 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fielders_1B`
--

LOCK TABLES `fielders_1B` WRITE;
/*!40000 ALTER TABLE `fielders_1B` DISABLE KEYS */;
INSERT INTO `fielders_1B` VALUES (1121,'Kang Seung-ho','Doosan Bears',0.172,10,2,29.2,35,31,4,0,-4.05),(1122,'Hwang Jae-gyun','KT Wiz',0.142,27,21,184.2,186,168,18,0,7.5),(1123,'Jeonghoon','Lotte Giants',0.127,9,4,44.1,43,39,4,0,3.25),(1124,'Han Jae-hwan','NC Dinos',0.122,6,2,21,24,23,1,0,-1.8),(1125,'Park Min-woo','NC Dinos',0.118,2,1,11,13,13,0,0,-1.35),(1126,'Cheon Seong-ho','KT Wiz',0.117,5,1,13,18,17,1,0,-4.1),(1127,'Lim Ji-yeol','Kiwoom Heroes',0.102,5,3,29,30,29,1,0,0.5),(1128,'Kim Kyu-seong','KIA Tigers',0.101,3,2,17,19,17,2,0,-1.05),(1129,'Park Byung-ho','Samsung Lions',0.083,11,10,68,55,46,8,1,15.7),(1130,'Do Tae-hoon','NC Dinos',0.083,17,5,75,71,64,7,0,7.55),(1131,'Kim Min-soo','LG Twins',0.078,3,2,17,14,12,2,0,3.7),(1132,'Lee Young-bin','LG Twins',0.064,9,1,22,25,24,1,0,-1.75),(1133,'Lee Do-yoon','Hanwha Eagles',0.047,4,0,5,7,7,0,0,-1.65),(1134,'Moon Bo-kyung','LG Twins',0.038,9,1,22,19,19,0,0,3.95),(1135,'Park Ji Hoon','Doosan Bears',0.035,8,0,12,6,6,0,0,6.3),(1136,'Yoon Jun-hyeok','KT Wiz',0.022,8,1,22,20,18,2,0,3),(1137,'Ryu Ji-hyuk','Samsung Lions',0.021,9,2,30,32,31,1,0,-0.4),(1138,'Jaehyun Choo','Doosan Bears',0.02,2,1,6.1,10,9,1,0,-3.4),(1139,'Yoon Jung-bin','Samsung Lions',0.015,1,0,3,1,0,1,0,2.05),(1140,'Son Yongjun','LG Twins',0.004,1,1,4,6,6,0,0,-1.7),(1141,'Kwon Kwang-min','Hanwha Eagles',-0.006,3,0,6.1,8,8,0,0,-1.5),(1142,'Kim Tae-yeon','Hanwha Eagles',-0.006,14,7,75,67,60,7,0,11.35),(1143,'Park Joo-hong','Kiwoom Heroes',-0.012,3,0,5,2,2,0,0,3.1),(1144,'Hwang Dae-in','KIA Tigers',-0.014,6,6,53,50,49,1,0,5.5),(1145,'Oh Seon-woo','KIA Tigers',-0.014,14,9,77,81,78,3,0,0.05),(1146,'Oh Seon-jin','Kiwoom Heroes',-0.022,4,1,14,14,13,1,0,0.7),(1147,'Moon Jeong-bin','LG Twins',-0.029,6,2,18,20,18,2,0,-1),(1148,'Seo Geon-chang','KIA Tigers',-0.034,2,2,13,13,13,0,0,0.65),(1149,'Oh Young-soo','NC Dinos',-0.043,2,1,5,4,3,1,0,1.2),(1150,'Go Myung-jun','SSG Landers',-0.047,49,47,409.1,392,357,33,2,36.6),(1151,'Song Seung-hwan','NC Dinos',-0.055,1,1,2,2,2,0,0,0.1),(1152,'McBroom','SSG Landers',-0.067,6,5,45,48,43,5,0,-0.6),(1153,'Kim Hyun-soo','LG Twins',-0.07,11,9,81,82,71,9,2,3),(1154,'Byun Woo-hyuk','KIA Tigers',-0.072,14,4,52,44,39,5,0,10.2),(1155,'Kang Min-seong','KT Wiz',-0.078,3,0,8,3,3,0,0,5.15),(1156,'Kim Min-seong','Lotte Giants',-0.083,6,1,12,15,15,0,0,-2.25),(1157,'Kang Jinseong','Kiwoom Heroes',-0.083,4,2,19,18,17,1,0,1.9),(1158,'Kim In-hwan','Hanwha Eagles',-0.089,2,1,9,11,10,0,1,-1.5),(1159,'Song Chaneui','LG Twins',-0.108,3,2,13,13,11,1,1,0.6),(1160,'Kim Woongbin','Kiwoom Heroes',-0.114,3,2,19,15,15,0,0,4.75),(1161,'Kim Hui-jip','NC Dinos',-0.119,10,6,59,50,46,4,0,11.5),(1162,'Oh Tae-gon','SSG Landers',-0.126,15,5,58.1,57,54,3,0,3.95),(1163,'Moon Sang-cheol','KT Wiz',-0.127,39,33,275,272,250,22,0,16.6),(1164,'Patrick Wisdom','KIA Tigers',-0.133,36,33,280,299,283,16,0,-4.05),(1165,'Seo Ho-cheol','NC Dinos',-0.146,19,14,119,105,103,2,0,19.25),(1166,'Jeon Byeong-woo','Samsung Lions',-0.166,3,0,5,6,5,0,1,-0.75),(1167,'Lee Chang-yong','Samsung Lions',-0.175,3,1,10,13,12,0,1,-2.4),(1168,'Lewin Diaz','Samsung Lions',-0.185,47,45,400,389,353,35,1,30.4),(1169,'Ruben Cardenas','Kiwoom Heroes',-0.193,6,6,54,49,42,5,2,7.35),(1170,'Yang Seok-hwan','Doosan Bears',-0.2,55,55,461.2,449,410,35,4,34.45);
/*!40000 ALTER TABLE `fielders_1B` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fielders_2B`
--

DROP TABLE IF EXISTS `fielders_2B`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fielders_2B` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `team` varchar(20) DEFAULT NULL,
  `war` float DEFAULT NULL,
  `g` int DEFAULT NULL,
  `inn` float DEFAULT NULL,
  `dwar` float DEFAULT NULL,
  `err` int DEFAULT NULL,
  `assists` int DEFAULT NULL,
  `putouts` int DEFAULT NULL,
  `dp` int DEFAULT NULL,
  `fieldingScore` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fielders_2B`
--

LOCK TABLES `fielders_2B` WRITE;
/*!40000 ALTER TABLE `fielders_2B` DISABLE KEYS */;
INSERT INTO `fielders_2B` VALUES (1051,'Park Min-woo','NC Dinos',0.557,43,40,319,192,77,111,4,136.4),(1052,'Cheon Seong-ho','KT Wiz',0.412,20,14,119.1,77,25,50,2,45.85),(1053,'Kang Seung-ho','Doosan Bears',0.388,24,23,191.1,114,61,52,1,82.75),(1054,'Jeon Tae-hyun','Kiwoom Heroes',0.273,15,8,78,41,16,25,0,39.05),(1055,'Hong Jong-pyo','KIA Tigers',0.254,19,8,88,56,24,32,0,34.8),(1056,'Kim Kyu-seong','KIA Tigers',0.193,22,7,90,45,19,26,0,47.25),(1057,'Yang Do-geun','Samsung Lions',0.187,19,8,81,51,19,32,0,32.55),(1058,'Ryu Ji-hyuk','Samsung Lions',0.146,46,37,327,168,78,90,0,167.4),(1059,'Lee Yu-chan','Doosan Bears',0.137,6,4,40,26,12,14,0,15.3),(1060,'Song Seong-moon','Kiwoom Heroes',0.135,24,23,187,118,54,63,1,74.85),(1061,'Choi Jeong-yong','KIA Tigers',0.11,3,2,17,10,4,6,0,7.5),(1062,'Seo Geon-chang','KIA Tigers',0.108,7,4,34,23,11,12,0,12.15),(1063,'Park Seung-wook','Lotte Giants',0.105,7,0,10,8,1,7,0,2.4),(1064,'Jeon Byeong-woo','Samsung Lions',0.102,5,3,16,11,7,4,0,5.55),(1065,'Park Min','KIA Tigers',0.1,1,0,7,7,3,4,0,0.35),(1066,'Do Tae-hoon','NC Dinos',0.088,8,4,38,25,7,17,1,14.2),(1067,'Kim Min-seong','Lotte Giants',0.056,12,10,81,39,17,22,0,43.95),(1068,'Song Ji-hoo','Kiwoom Heroes',0.053,8,8,59,34,21,12,1,26.65),(1069,'Oh Yoon-seok','KT Wiz',0.05,20,12,117,72,31,40,1,48.55),(1070,'Jang Jun-won','KT Wiz',0.037,3,2,17.1,11,4,7,0,6.65),(1071,'Kim Chan-hyung','SSG Landers',0.035,5,3,21.2,7,3,4,0,14.55),(1072,'Kim Seong-hyeon','SSG Landers',0.035,12,7,61.2,41,17,23,1,22.2),(1073,'Lee Ho-jun','Lotte Giants',0.033,21,1,40.1,20,5,15,0,21.1),(1074,'Jung Jun Jae','SSG Landers',0.031,51,43,400.1,241,105,131,5,170.9),(1075,'Park Gye-beom','Doosan Bears',0.031,15,11,100,49,25,24,0,53.45),(1076,'Shin Min-jae','LG Twins',0.029,48,35,317.1,180,79,100,1,146.05),(1077,'Jeon Minjae','Lotte Giants',0.025,4,2,19,11,7,4,0,8.55),(1078,'Kim Hanbyeol','NC Dinos',0.017,8,3,29.2,16,4,12,0,14),(1079,'Lee Do-yoon','Hanwha Eagles',0.008,23,13,121.2,56,22,34,0,68),(1080,'Kim Sang-soo','KT Wiz',0.005,25,23,189,105,37,68,0,89.25),(1081,'Choi Hang','Lotte Giants',0,1,0,1,1,1,0,0,0.05),(1082,'Oh Myung-jin','Doosan Bears',0,22,16,136,73,35,37,1,66.6),(1083,'Kim Jun-sang','Doosan Bears',-0.002,4,2,21,10,2,8,0,11.5),(1084,'Park Jun-soon','Doosan Bears',-0.009,7,2,23,14,5,8,1,9.65),(1085,'Koo Bon-hyeok','LG Twins',-0.013,23,18,148,81,35,45,1,71),(1086,'Park Min-seok','KT Wiz',-0.02,3,1,9,4,2,2,0,5.2),(1087,'Han Tae-yang','Lotte Giants',-0.021,9,0,13.1,7,5,2,0,6.45),(1088,'Kim Tae-jin','Kiwoom Heroes',-0.026,28,18,177,102,38,63,1,80.05),(1089,'Kim Joo-sung','LG Twins',-0.026,2,0,3,0,0,0,0,3),(1090,'Shim Jae Hoon','Samsung Lions',-0.028,13,6,66,26,10,16,0,41.3),(1091,'Kwon Dong-jin','KT Wiz',-0.028,4,2,24,13,4,9,0,11.65),(1092,'Lee Young-bin','LG Twins',-0.033,12,5,48,32,11,21,0,17.6),(1093,'Seo Yu-shin','Kiwoom Heroes',-0.039,1,1,8,3,1,2,0,5.15),(1094,'Sang-Hyeon Ahn','SSG Landers',-0.052,3,3,24,12,3,9,0,12.6),(1095,'Ko Seung-min','Lotte Giants',-0.056,47,46,360,205,70,131,4,165.05),(1096,'Oh Seon-jin','Kiwoom Heroes',-0.057,4,3,23,14,8,5,1,9.65),(1097,'Kim Seonbin','KIA Tigers',-0.061,29,28,210,104,44,57,3,111.05),(1098,'Choi Jeong-won','NC Dinos',-0.083,11,4,49,31,13,18,0,19.55),(1099,'An Chi Hong','Hanwha Eagles',-0.092,5,5,35,21,5,15,1,15),(1100,'Seok Jeong-woo','SSG Landers',-0.117,1,1,4,3,0,2,1,1.1);
/*!40000 ALTER TABLE `fielders_2B` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fielders_3B`
--

DROP TABLE IF EXISTS `fielders_3B`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fielders_3B` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `team` varchar(20) DEFAULT NULL,
  `war` float DEFAULT NULL,
  `g` int DEFAULT NULL,
  `inn` float DEFAULT NULL,
  `dwar` float DEFAULT NULL,
  `err` int DEFAULT NULL,
  `assists` int DEFAULT NULL,
  `putouts` int DEFAULT NULL,
  `dp` int DEFAULT NULL,
  `fieldingScore` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fielders_3B`
--

LOCK TABLES `fielders_3B` WRITE;
/*!40000 ALTER TABLE `fielders_3B` DISABLE KEYS */;
INSERT INTO `fielders_3B` VALUES (1051,'Song Seong-moon','Kiwoom Heroes',0.494,35,33,287,114,43,68,3,178.55),(1052,'Kim Young-woong','Samsung Lions',0.339,44,42,362,103,29,68,6,263.85),(1053,'Seo Ho-cheol','NC Dinos',0.336,13,9,82,25,8,15,2,58.15),(1054,'Kim Do-young','KIA Tigers',0.304,22,22,180,51,9,39,3,131.4),(1055,'Heo Kyung-min','KT Wiz',0.294,35,34,297.1,86,30,52,4,215.2),(1056,'Oh Seon-jin','Kiwoom Heroes',0.287,15,6,67,17,3,14,0,50.85),(1057,'Im Jong-seong','Doosan Bears',0.275,23,19,157,43,15,26,2,116.05),(1058,'Byun Woo-hyuk','KIA Tigers',0.233,29,24,213,69,17,48,4,147.25),(1059,'Jeon Byeong-woo','Samsung Lions',0.202,18,7,69,19,4,15,0,50.95),(1060,'Kim Min-seong','Lotte Giants',0.162,20,13,111.1,20,1,19,0,92.1),(1061,'Kang Seung-ho','Doosan Bears',0.143,30,29,244,82,24,53,5,165.85),(1062,'Oh Myung-jin','Doosan Bears',0.107,7,7,57,13,4,9,0,44.65),(1063,'Lee Young-bin','LG Twins',0.105,5,2,25,3,1,2,0,22.15),(1064,'Kang Min-seong','KT Wiz',0.091,5,0,7,5,2,3,0,2.25),(1065,'Moon Jeong-bin','LG Twins',0.077,5,0,13,1,0,1,0,12.05),(1066,'Yeo Dong-geon','Doosan Bears',0.059,1,0,2,1,0,1,0,1.05),(1067,'Song Ji-hoo','Kiwoom Heroes',0.056,1,0,3,1,0,1,0,2.05),(1068,'Patrick Wisdom','KIA Tigers',0.055,2,2,13,5,0,5,0,8.25),(1069,'Lee Do-yoon','Hanwha Eagles',0.036,2,1,10,2,2,0,0,8.1),(1070,'Yang Hyeon-jong','Kiwoom Heroes',0.027,3,2,13,2,0,2,0,11.1),(1071,'Yang Do-geun','Samsung Lions',0.023,5,1,15,7,2,4,1,8.3),(1072,'Park Jun-young','Doosan Bears',0.011,2,0,2.1,1,1,0,0,1.15),(1073,'Jeong Hyeon-chang','NC Dinos',0.003,1,1,8,0,0,0,0,8),(1074,'Lee Jae-sang','Kiwoom Heroes',0,1,0,2,0,0,0,0,2),(1075,'Han Jae-hwan','NC Dinos',0,1,0,2.1,0,0,0,0,2.1),(1076,'Noh Si-hwan','Hanwha Eagles',-0.001,57,57,507,134,39,88,7,379.35),(1077,'Park Min','KIA Tigers',-0.004,1,1,8,5,0,5,0,3.25),(1078,'Hong Jong-pyo','KIA Tigers',-0.019,5,3,26,9,4,5,0,17.45),(1079,'Kim Chan-hyung','SSG Landers',-0.041,9,5,48,17,5,11,1,31.8),(1080,'Yoon Do-hyun','KIA Tigers',-0.047,2,1,12,5,2,3,0,7.25),(1081,'Koo Bon-hyeok','LG Twins',-0.049,23,12,107.1,22,7,15,0,86.2),(1082,'Jang Jun-won','KT Wiz',-0.049,2,0,6,1,1,0,0,5.05),(1083,'Kim Hanbyeol','NC Dinos',-0.056,9,2,26,5,4,1,0,21.25),(1084,'Kim Seong-hyeon','SSG Landers',-0.062,18,8,90,25,3,20,2,66.15),(1085,'Han Tae-yang','Lotte Giants',-0.063,4,0,7,0,0,0,0,7),(1086,'Do Tae-hoon','NC Dinos',-0.079,6,1,22,4,1,2,1,18.15),(1087,'Ryu Ji-hyuk','Samsung Lions',-0.081,11,8,70,15,4,10,1,55.7),(1088,'Lee Seung-won','Kiwoom Heroes',-0.082,1,1,5,1,0,0,1,4),(1089,'Choi Jung','SSG Landers',-0.086,2,2,18,3,0,2,1,15.1),(1090,'Kim Soo-yoon','SSG Landers',-0.09,7,5,35,14,4,8,2,21.6),(1091,'Park Gye-beom','Doosan Bears',-0.091,12,3,43.2,11,2,8,1,32.7),(1092,'Jeon Tae-hyun','Kiwoom Heroes',-0.098,13,9,80,19,5,13,1,61.9),(1093,'Song Chaneui','LG Twins',-0.101,3,0,6,0,0,0,0,6),(1094,'Yeo Dong Wook','Kiwoom Heroes',-0.101,9,5,41,13,6,5,2,28.55),(1095,'Seok Jeong-woo','SSG Landers',-0.109,5,3,21,3,0,2,1,18.1),(1096,'Kim Kyu-seong','KIA Tigers',-0.126,10,3,40,10,3,7,0,30.5),(1097,'Go Young-woo','Kiwoom Heroes',-0.149,2,1,9,2,1,0,1,7.05),(1098,'Son Ho-young','Lotte Giants',-0.178,42,41,358.1,112,32,72,8,251.3),(1099,'Moon Bo-kyung','LG Twins',-0.194,45,44,365,96,25,64,7,273.45),(1100,'Hwang Jae-gyun','KT Wiz',-0.219,28,25,219.2,35,18,16,1,185.9);
/*!40000 ALTER TABLE `fielders_3B` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fielders_C`
--

DROP TABLE IF EXISTS `fielders_C`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fielders_C` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `team` varchar(20) DEFAULT NULL,
  `war` float DEFAULT NULL,
  `g` int DEFAULT NULL,
  `inn` float DEFAULT NULL,
  `dwar` float DEFAULT NULL,
  `err` int DEFAULT NULL,
  `assists` int DEFAULT NULL,
  `putouts` int DEFAULT NULL,
  `dp` int DEFAULT NULL,
  `fieldingScore` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=763 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fielders_C`
--

LOCK TABLES `fielders_C` WRITE;
/*!40000 ALTER TABLE `fielders_C` DISABLE KEYS */;
INSERT INTO `fielders_C` VALUES (728,'Lee Jae-won','Hanwha Eagles',0.547,51,18,216,231,210,20,1,-3.5),(729,'Jang Seong-woo','KT Wiz',0.537,53,49,410.2,389,363,24,2,40.55),(730,'Kang Min-ho','Samsung Lions',0.534,53,44,401.1,363,339,23,1,56.2),(731,'Yang Euji','Doosan Bears',0.523,41,41,323.1,293,270,21,2,44.65),(732,'Park Dong-won','LG Twins',0.488,55,46,410.1,387,360,25,2,42.35),(733,'Kim Tae-gun','KIA Tigers',0.485,33,27,228.1,212,184,25,3,26.55),(734,'Jo Hyeong-woo','SSG Landers',0.361,37,30,260.2,249,229,19,1,23.6),(735,'Kim Hyung-jun','NC Dinos',0.323,40,35,296,260,241,17,2,48.9),(736,'Yoo Kang-nam','Lotte Giants',0.297,43,41,275.2,273,256,16,1,15.8),(737,'Kim Gun-hee','Kiwoom Heroes',0.28,27,21,187,149,131,17,1,45.4),(738,'Lee Ji-young','SSG Landers',0.211,27,22,198.2,210,196,13,1,-1.35),(739,'Jung Bogeun','Lotte Giants',0.203,47,17,221.1,221,206,13,2,11.05),(740,'Lee Byung-hun','Samsung Lions',0.154,20,9,77.2,69,65,3,1,11.6),(741,'Han Seung-taek','KIA Tigers',0.135,10,5,50,42,34,8,0,10.1),(742,'Han Jun-su','KIA Tigers',0.117,34,24,213.2,219,201,16,2,5.05),(743,'Lee Joo-heon','LG Twins',0.09,23,12,99,104,99,5,0,0.2),(744,'Kim Dong-heon','Kiwoom Heroes',0.086,22,9,96,87,82,4,1,13.3),(745,'Kim Jae-seong','Samsung Lions',0.083,10,5,37,37,34,3,0,1.85),(746,'Shin Beom-soo','SSG Landers',0.078,15,5,53.1,48,46,2,0,7.5),(747,'Jo Dae-hyun','KT Wiz',0.075,17,3,45.1,41,37,4,0,6.15),(748,'Kim Ki-yeon','Doosan Bears',0.056,33,16,175,153,143,8,2,29.55),(749,'Choi Jae Hoon','Hanwha Eagles',0.056,46,40,301,336,310,24,2,-18.3),(750,'Kim Jeong-ho','NC Dinos',0.039,3,1,15,11,11,0,0,4.55),(751,'Son Seong-bin','Lotte Giants',0.039,9,1,23.2,16,14,2,0,8),(752,'Kim Jae-hyun','Kiwoom Heroes',0.024,44,31,251,218,197,18,3,43.75),(753,'Kim Sung-woo','LG Twins',0,3,0,7,6,6,0,0,1.3),(754,'Kang Baek-ho','KT Wiz',-0.005,5,4,32.2,25,22,2,1,8.4),(755,'Jang Seung-hyun','Doosan Bears',-0.009,4,1,11,11,10,1,0,0.55),(756,'An Jung-yeol','NC Dinos',-0.016,8,4,37.1,27,23,3,1,11.4),(757,'Park Se-hyuk','NC Dinos',-0.059,26,14,116,109,97,9,3,12.3),(758,'Park Jae-yeop','Lotte Giants',-0.06,2,0,4,5,4,0,1,-0.8),(759,'Ryu Hyun-jun','Doosan Bears',-0.081,2,0,3,5,5,0,0,-1.75),(760,'Kang Hyun Woo','KT Wiz',-0.13,10,3,41.1,39,33,4,2,3.95),(761,'Heo In-seo','Hanwha Eagles',0,1,0,1,1,1,0,0,0.05),(762,'Park Min-jun','Doosan Bears',0,1,0,1,0,0,0,0,1);
/*!40000 ALTER TABLE `fielders_C` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fielders_CF`
--

DROP TABLE IF EXISTS `fielders_CF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fielders_CF` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `team` varchar(20) DEFAULT NULL,
  `war` float DEFAULT NULL,
  `g` int DEFAULT NULL,
  `inn` float DEFAULT NULL,
  `dwar` float DEFAULT NULL,
  `err` int DEFAULT NULL,
  `assists` int DEFAULT NULL,
  `putouts` int DEFAULT NULL,
  `dp` int DEFAULT NULL,
  `fieldingScore` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fielders_CF`
--

LOCK TABLES `fielders_CF` WRITE;
/*!40000 ALTER TABLE `fielders_CF` DISABLE KEYS */;
INSERT INTO `fielders_CF` VALUES (1051,'Park Hae-min','LG Twins',0.525,58,53,464.1,118,116,2,0,352),(1052,'Jang Doo-seong','Lotte Giants',0.437,36,20,222,73,72,1,0,152.65),(1053,'Lee Joo-hyung','Kiwoom Heroes',0.4,41,39,331,113,112,1,0,223.65),(1054,'Kim Seong-yoon','Samsung Lions',0.338,43,35,328,96,95,1,0,236.8),(1055,'Jung Soo-bin','Doosan Bears',0.327,55,55,454.1,102,102,0,0,357.2),(1056,'Choi Won-young','LG Twins',0.29,15,2,32,13,13,0,0,19.65),(1057,'Cheon JaeHwan','NC Dinos',0.216,29,18,168.2,49,49,0,0,121.65),(1058,'Park Joo-hong','Kiwoom Heroes',0.191,6,4,35,21,20,1,0,15.05),(1059,'Estevan Florial','Hanwha Eagles',0.19,57,56,484,134,127,3,4,356.5),(1060,'Bae Jeong-dae','KT Wiz',0.172,52,37,357.1,86,84,1,1,275.35),(1061,'Chae Hyun-woo','SSG Landers',0.165,4,2,18,6,6,0,0,12.3),(1062,'Mel Rojas Jr.','KT Wiz',0.104,5,5,34,7,7,0,0,27.35),(1063,'Yoo Jun-gyu','KT Wiz',0.103,7,1,23.2,7,6,1,0,16.55),(1064,'Han Seok-hyun','NC Dinos',0.1,21,16,147,39,38,1,0,109.95),(1065,'Hyunmin Ahn','KT Wiz',0.078,12,10,72.2,15,15,0,0,57.95),(1066,'Park Young-bin','NC Dinos',0.071,4,0,7,3,3,0,0,4.15),(1067,'Kim Dong-hyuk','Lotte Giants',0.062,3,1,19,8,8,0,0,11.4),(1068,'Choi In-ho','Hanwha Eagles',0.026,2,0,2,0,0,0,0,2),(1069,'Lee Jin-young','Hanwha Eagles',0.015,1,1,3,1,1,0,0,2.05),(1070,'Kim Dae-han','Doosan Bears',0.014,2,1,11,1,1,0,0,10.05),(1071,'Shin Min-jae','LG Twins',0.001,2,1,6,0,0,0,0,6),(1072,'Yang Do-geun','Samsung Lions',0,2,0,3,0,0,0,0,3),(1073,'Won Seong-jun','Kiwoom Heroes',-0.008,1,0,2,0,0,0,0,2),(1074,'Kim Byung-jun','KT Wiz',-0.012,1,0,3,0,0,0,0,3),(1075,'Song Chaneui','LG Twins',-0.028,3,2,14,2,2,0,0,12.1),(1076,'Jeon Da-min','Doosan Bears',-0.042,4,0,12,5,4,0,1,7.2),(1077,'Choi Jeong-won','NC Dinos',-0.047,6,2,20,5,5,0,0,15.25),(1078,'Choi Sung-min','KT Wiz',-0.048,3,1,5.1,2,1,0,1,3.15),(1079,'Oh Tae-gon','SSG Landers',-0.059,5,2,20,3,3,0,0,17.15),(1080,'Jo Suhaeng','Doosan Bears',-0.063,12,2,33,11,10,0,1,22.5),(1081,'Park Soo-jong','Kiwoom Heroes',-0.063,7,2,27,10,10,0,0,17.5),(1082,'Jang Jin-hyeok','KT Wiz',-0.067,6,4,33,8,8,0,0,25.4),(1083,'Lee Yong-gyu','Kiwoom Heroes',-0.083,7,7,52,18,17,0,1,34.85),(1084,'Yoon Dong-hee','Lotte Giants',-0.09,12,11,74,23,23,0,0,52.15),(1085,'Jang Jae-young','Kiwoom Heroes',-0.102,6,2,24,11,10,0,1,13.5),(1086,'Kwon Hee-dong','NC Dinos',-0.103,3,2,13,3,3,0,0,10.15),(1087,'Park Geon-woo','NC Dinos',-0.112,7,7,51,14,13,0,1,37.65),(1088,'Kim Min-hyeok','KT Wiz',-0.113,1,1,1,0,0,0,0,1),(1089,'Kim Ho-ryeong','KIA Tigers',-0.121,19,13,136,32,30,0,2,105.5),(1090,'Choi Ji-hoon','SSG Landers',-0.123,55,53,469.2,102,99,0,3,372.15),(1091,'Lim Byeong-wook','Kiwoom Heroes',-0.136,13,7,63,22,22,0,0,42.1),(1092,'Park Jeong-woo','KIA Tigers',-0.137,16,12,82,16,16,0,0,66.8),(1093,'Kim Jae-hyuk','Samsung Lions',-0.151,5,0,8,2,2,0,0,6.1),(1094,'Lee Woo-sung','KIA Tigers',-0.178,3,1,12,4,4,0,0,8.2),(1095,'Park Si-won','NC Dinos',-0.2,6,5,31,8,8,0,0,23.4),(1096,'Moon Hyun-bin','Hanwha Eagles',-0.216,4,1,14,4,3,1,0,10.2),(1097,'Hwang Seong-bin','Lotte Giants',-0.252,27,27,209.2,43,40,1,2,168.25),(1098,'Kim Seong-wook','NC Dinos',-0.255,5,4,26.2,8,8,0,0,18.6),(1099,'Park Jae-hyun','KIA Tigers',-0.258,15,5,61,11,9,1,1,50.5),(1100,'Kim Ji-chan','Samsung Lions',-0.355,24,23,175,48,48,0,0,129.4);
/*!40000 ALTER TABLE `fielders_CF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fielders_LF`
--

DROP TABLE IF EXISTS `fielders_LF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fielders_LF` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `team` varchar(20) DEFAULT NULL,
  `war` float DEFAULT NULL,
  `g` int DEFAULT NULL,
  `inn` float DEFAULT NULL,
  `dwar` float DEFAULT NULL,
  `err` int DEFAULT NULL,
  `assists` int DEFAULT NULL,
  `putouts` int DEFAULT NULL,
  `dp` int DEFAULT NULL,
  `fieldingScore` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fielders_LF`
--

LOCK TABLES `fielders_LF` WRITE;
/*!40000 ALTER TABLE `fielders_LF` DISABLE KEYS */;
INSERT INTO `fielders_LF` VALUES (1051,'Moon Sung-joo','LG Twins',0.317,21,16,144,41,41,0,0,105.05),(1052,'Han Yusum','SSG Landers',0.222,6,6,44,10,10,0,0,34.5),(1053,'Lee Won-seok','Hanwha Eagles',0.21,18,1,47.1,15,14,0,1,32.8),(1054,'Lee Jin-young','Hanwha Eagles',0.205,7,5,52,15,14,1,0,37.75),(1055,'Ham Chang-geon','LG Twins',0.202,7,5,41,14,14,0,0,27.7),(1056,'Lim Byeong-wook','Kiwoom Heroes',0.166,8,6,56,13,13,0,0,43.65),(1057,'Kim Heon-gon','Samsung Lions',0.151,19,7,71,17,17,0,0,54.85),(1058,'Choi Sung-min','KT Wiz',0.138,5,1,8.1,5,4,1,0,3.35),(1059,'Kim Jae-hwan','Doosan Bears',0.137,15,13,103.2,23,22,1,0,81.35),(1060,'Song Chaneui','LG Twins',0.124,18,12,107,27,26,1,0,81.35),(1061,'Cheon JaeHwan','NC Dinos',0.111,21,4,69.1,19,18,0,1,51),(1062,'Park Jeong-woo','KIA Tigers',0.09,18,1,37,9,9,0,0,28.45),(1063,'Jang Jin-hyeok','KT Wiz',0.089,6,0,6.1,5,4,1,0,1.35),(1064,'Lim Ji-yeol','Kiwoom Heroes',0.072,5,5,36,10,10,0,0,26.5),(1065,'Kim Hyun-soo','LG Twins',0.071,24,23,185.1,39,38,1,0,148.05),(1066,'Park Si-won','NC Dinos',0.066,2,1,12,6,6,0,0,6.3),(1067,'Mel Rojas Jr.','KT Wiz',0.065,19,8,86,19,18,1,0,67.95),(1068,'Han Seok-hyun','NC Dinos',0.05,5,2,20.1,1,1,0,0,19.15),(1069,'Victor Reyes','Lotte Giants',0.044,39,32,280.1,52,52,0,0,230.7),(1070,'Choi Won-young','LG Twins',0.043,19,1,34,8,8,0,0,26.4),(1071,'Jaehyun Choo','Doosan Bears',0.041,8,7,66,15,15,0,0,51.75),(1072,'Lee Yu-chan','Doosan Bears',0.031,2,2,13,3,3,0,0,10.15),(1073,'Choi Jeong-won','NC Dinos',0.027,2,1,12,4,4,0,0,8.2),(1074,'Lee Seong-gyu','Samsung Lions',0.021,1,1,9,2,2,0,0,7.1),(1075,'Estevan Florial','Hanwha Eagles',0.02,2,1,11,4,3,1,0,7.2),(1076,'Kim Byung-jun','KT Wiz',0.019,3,0,5.1,1,1,0,0,4.15),(1077,'Kwon Hyuk Bin','Kiwoom Heroes',0.017,1,0,2,2,2,0,0,0.1),(1078,'Kim Dong-hyuk','Lotte Giants',0.015,14,0,16,6,6,0,0,10.3),(1079,'Park Joo-hong','Kiwoom Heroes',0.008,19,8,83,31,30,1,0,53.55),(1080,'Choi Seung-min','LG Twins',0.008,1,0,2,1,1,0,0,1.05),(1081,'Choi Sang-min','SSG Landers',0.006,2,0,4,0,0,0,0,4),(1082,'Son Ah-seop','NC Dinos',0.004,1,1,2,1,1,0,0,1.05),(1083,'Kim In-tae','Doosan Bears',0.003,16,13,97,22,22,0,0,76.1),(1084,'Guillermo Heredia','SSG Landers',0.001,12,12,110,32,30,1,1,79.55),(1085,'Lee Sang-hyeok','Hanwha Eagles',0,3,0,5,0,0,0,0,5),(1086,'Choi Won-jun','KIA Tigers',-0.001,2,0,4,0,0,0,0,4),(1087,'Ko Seung-min','Lotte Giants',-0.001,1,0,2,0,0,0,0,2),(1088,'Jeon Tae-hyun','Kiwoom Heroes',-0.001,1,0,1,0,0,0,0,1),(1089,'Jang Doo-seong','Lotte Giants',-0.002,3,0,6,0,0,0,0,6),(1090,'Park Soo-jong','Kiwoom Heroes',-0.009,1,0,2,1,1,0,0,1.05),(1091,'Chae Hyun-woo','SSG Landers',-0.017,7,5,40,10,9,0,1,30.45),(1092,'Choi Hyeong-woo','KIA Tigers',-0.018,4,4,27,4,4,0,0,23.2),(1093,'Jeon Da-min','Doosan Bears',-0.02,3,0,9,0,0,0,0,9),(1094,'Kim Seong-yoon','Samsung Lions',-0.022,1,0,1,0,0,0,0,1),(1095,'Right to compensation','Kiwoom Heroes',-0.023,3,2,15,5,5,0,0,10.25),(1096,'Won Seong-jun','Kiwoom Heroes',-0.027,4,3,31,8,8,0,0,23.4),(1097,'Han Jae-hwan','NC Dinos',-0.028,3,1,9,2,2,0,0,7.1),(1098,'Jang Jae-young','Kiwoom Heroes',-0.03,3,0,5,0,0,0,0,5),(1099,'Moon Jeong-bin','LG Twins',-0.045,1,1,3,0,0,0,0,3),(1100,'An Chi-young','KT Wiz',-0.045,8,1,19.1,6,6,0,0,13.4);
/*!40000 ALTER TABLE `fielders_LF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fielders_RF`
--

DROP TABLE IF EXISTS `fielders_RF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fielders_RF` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `team` varchar(20) DEFAULT NULL,
  `war` float DEFAULT NULL,
  `g` int DEFAULT NULL,
  `inn` float DEFAULT NULL,
  `dwar` float DEFAULT NULL,
  `err` int DEFAULT NULL,
  `assists` int DEFAULT NULL,
  `putouts` int DEFAULT NULL,
  `dp` int DEFAULT NULL,
  `fieldingScore` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fielders_RF`
--

LOCK TABLES `fielders_RF` WRITE;
/*!40000 ALTER TABLE `fielders_RF` DISABLE KEYS */;
INSERT INTO `fielders_RF` VALUES (1051,'Lee Jin-young','Hanwha Eagles',0.294,40,38,287,52,51,1,0,237.6),(1052,'Jeong Hae-won','KIA Tigers',0.284,7,6,39.1,13,13,0,0,26.75),(1053,'Yoon Dong-hee','Lotte Giants',0.27,44,36,335.1,85,82,1,2,254.25),(1054,'Kim Tae-yeon','Hanwha Eagles',0.243,11,5,48.2,14,13,1,0,34.9),(1055,'Lee Hyung-jong','Kiwoom Heroes',0.237,12,6,63.1,17,16,1,0,46.95),(1056,'Lee Seong-gyu','Samsung Lions',0.235,19,12,110,29,27,1,1,82.4),(1057,'Hyunmin Ahn','KT Wiz',0.227,22,15,137.1,37,32,5,0,101.95),(1058,'Jake Cave','Doosan Bears',0.217,49,49,415.1,97,94,2,1,322.9),(1059,'Jang Doo-seong','Lotte Giants',0.164,9,6,57,17,16,0,1,40.8),(1060,'Oh Tae-gon','SSG Landers',0.133,10,6,52.1,13,12,1,0,39.75),(1061,'Kim Seong-yoon','Samsung Lions',0.131,14,11,82,21,21,0,0,62.05),(1062,'Lee Won-seok','Hanwha Eagles',0.13,22,4,76.1,18,17,1,0,59),(1063,'Chae Hyun-woo','SSG Landers',0.104,6,1,21,4,4,0,0,17.2),(1064,'Han Seok-hyun','NC Dinos',0.08,4,2,21.1,7,6,1,0,14.45),(1065,'McBroom','SSG Landers',0.071,10,10,72,15,15,0,0,57.75),(1066,'Song Chaneui','LG Twins',0.07,17,14,121,25,25,0,0,97.25),(1067,'Park Jeong-woo','KIA Tigers',0.061,7,1,22.2,5,5,0,0,17.45),(1068,'Choi Sung-min','KT Wiz',0.059,14,2,41.1,7,7,0,0,34.45),(1069,'Park Seung-gyu','Samsung Lions',0.059,6,4,38,5,5,0,0,33.25),(1070,'An Chi-young','KT Wiz',0.058,3,0,8,2,2,0,0,6.1),(1071,'Son Ah-seop','NC Dinos',0.054,30,29,210,43,43,0,0,169.15),(1072,'Lee Yu-chan','Doosan Bears',0.052,1,1,8,2,2,0,0,6.1),(1073,'Kim Seong-wook','NC Dinos',0.051,2,0,3.1,1,1,0,0,2.15),(1074,'Ham Chang-geon','LG Twins',0.048,6,0,12,3,3,0,0,9.15),(1075,'Choi Won-young','LG Twins',0.042,9,0,12.1,4,4,0,0,8.3),(1076,'Victor Reyes','Lotte Giants',0.011,16,16,121.1,26,25,0,1,96.35),(1077,'Lee Min-jae','Hanwha Eagles',0,1,1,5,1,1,0,0,4.05),(1078,'Jeon Da-min','Doosan Bears',-0.001,1,0,2,0,0,0,0,2),(1079,'Lee Young-bin','LG Twins',-0.001,1,0,1,0,0,0,0,1),(1080,'Right to compensation','Kiwoom Heroes',-0.002,2,0,1.2,0,0,0,0,1.2),(1081,'Moon Jeong-bin','LG Twins',-0.009,2,1,8,0,0,0,0,8),(1082,'Jeong Hyeon-seung','SSG Landers',-0.021,1,0,4.2,0,0,0,0,4.2),(1083,'Lee Woo-sung','KIA Tigers',-0.022,13,8,85.2,11,11,0,0,74.75),(1084,'Jang Jin-hyeok','KT Wiz',-0.035,6,0,11,3,3,0,0,8.15),(1085,'Kim Tae-geun','Samsung Lions',-0.035,3,1,11,3,3,0,0,8.15),(1086,'Kwon Hee-dong','NC Dinos',-0.038,3,2,7,0,0,0,0,7),(1087,'Josejin','Lotte Giants',-0.042,3,1,3,0,0,0,0,3),(1088,'Choi Sang-min','SSG Landers',-0.061,14,0,23.2,6,6,0,0,17.5),(1089,'Im Jong-chan','Hanwha Eagles',-0.066,13,10,86.1,17,16,0,1,69.9),(1090,'Park Kwan Woo','LG Twins',-0.078,1,0,2,1,0,0,1,1),(1091,'Jang Jae-young','Kiwoom Heroes',-0.085,2,1,10,0,0,0,0,10),(1092,'Lee Sang-hyeok','Hanwha Eagles',-0.087,5,0,12.2,2,2,0,0,10.3),(1093,'Kim In-tae','Doosan Bears',-0.087,5,0,6,2,2,0,0,4.1),(1094,'Kim Tae-hoon','Samsung Lions',-0.096,1,1,6,0,0,0,0,6),(1095,'Won Seong-jun','Kiwoom Heroes',-0.098,4,1,11,2,2,0,0,9.1),(1096,'Yoo Jun-gyu','KT Wiz',-0.099,2,2,12,2,2,0,0,10.1),(1097,'Cheon JaeHwan','NC Dinos',-0.099,14,4,51,7,6,1,0,44.35),(1098,'Choi Jun-woo','SSG Landers',-0.118,3,2,15,5,5,0,0,10.25),(1099,'Jo Suhaeng','Doosan Bears',-0.124,10,3,38,12,12,0,0,26.6),(1100,'Park Si-won','NC Dinos',-0.136,25,4,75,16,16,0,0,59.8);
/*!40000 ALTER TABLE `fielders_RF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fielders_SS`
--

DROP TABLE IF EXISTS `fielders_SS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fielders_SS` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `team` varchar(20) DEFAULT NULL,
  `war` float DEFAULT NULL,
  `g` int DEFAULT NULL,
  `inn` float DEFAULT NULL,
  `dwar` float DEFAULT NULL,
  `err` int DEFAULT NULL,
  `assists` int DEFAULT NULL,
  `putouts` int DEFAULT NULL,
  `dp` int DEFAULT NULL,
  `fieldingScore` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=997 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fielders_SS`
--

LOCK TABLES `fielders_SS` WRITE;
/*!40000 ALTER TABLE `fielders_SS` DISABLE KEYS */;
INSERT INTO `fielders_SS` VALUES (951,'Park Sung-han','SSG Landers',0.918,55,53,466.2,266,104,153,9,213.05),(952,'Oh Ji-hwan','LG Twins',0.837,55,45,396.1,183,59,121,3,222.1),(953,'Ha Joo-seok','Hanwha Eagles',0.774,22,19,167.2,68,20,48,0,102.6),(954,'Chan Ho Park','KIA Tigers',0.683,47,46,383,201,78,119,4,191.85),(955,'Kim Joo-won','NC Dinos',0.683,54,53,436,240,99,129,12,207.4),(956,'Lee Jae-hyun','Samsung Lions',0.637,55,55,458,218,85,124,9,250.45),(957,'Sim Woo-jun','Hanwha Eagles',0.408,33,32,261.1,141,50,88,3,127),(958,'Kim Kyu-seong','KIA Tigers',0.318,17,9,96,52,14,35,3,46.45),(959,'Jeon Minjae','Lotte Giants',0.298,36,33,284.1,127,49,71,7,163.1),(960,'Jang Jun-won','KT Wiz',0.264,13,11,94.1,41,18,23,0,55.15),(961,'Oh Myung-jin','Doosan Bears',0.222,16,15,128.1,69,28,39,2,62.45),(962,'Kwon Dong-jin','KT Wiz',0.146,43,34,293,162,62,91,9,138.65),(963,'Lee Do-yoon','Hanwha Eagles',0.127,16,7,87,36,12,22,2,52.7),(964,'Kim Seong-hyeon','SSG Landers',0.127,4,2,19,10,2,8,0,9.5),(965,'Koo Bon-hyeok','LG Twins',0.109,21,13,117,54,15,38,1,65.65),(966,'Park Min-seok','KT Wiz',0.076,7,3,33.1,15,6,8,1,18.8),(967,'Yoon Jun-hyeok','KT Wiz',0.063,3,0,10,3,0,3,0,7.15),(968,'Park Gye-beom','Doosan Bears',0.035,12,6,55,22,9,13,0,34.1),(969,'Park Jun-young','Doosan Bears',0.027,38,34,287,137,54,75,8,156.45),(970,'Hwang Jae-gyun','KT Wiz',0.022,1,0,1,1,0,1,0,0.05),(971,'Anjuhyung','Samsung Lions',0.015,3,0,6,4,1,3,0,2.2),(972,'Yang Do-geun','Samsung Lions',0.012,15,3,52,25,12,12,1,28.2),(973,'Kim Jun-sang','Doosan Bears',0.003,1,0,1,0,0,0,0,1),(974,'Kim Do-young','KIA Tigers',0,1,0,2,0,0,0,0,2),(975,'Kim Hanbyeol','NC Dinos',-0.024,6,1,20,11,4,6,1,9.5),(976,'Song Ji-hoo','Kiwoom Heroes',-0.031,1,0,2,1,1,0,0,1.05),(977,'Lee Yu-chan','Doosan Bears',-0.047,3,2,17,5,4,1,0,12.25),(978,'Park Ji Hoon','Doosan Bears',-0.056,5,1,18,8,2,5,1,10.35),(979,'Jeon Tae-hyun','Kiwoom Heroes',-0.056,3,0,5,2,1,1,0,3.1),(980,'Park Seung-wook','Lotte Giants',-0.069,11,7,58,31,11,18,2,28.45),(981,'Kim Chan-hyung','SSG Landers',-0.076,4,0,5,6,2,3,1,-0.75),(982,'Lee Young-bin','LG Twins',-0.083,2,0,3,0,0,0,0,3),(983,'Yoon Do-hyun','KIA Tigers',-0.084,1,1,9,4,1,2,1,5.15),(984,'Do Tae-hoon','NC Dinos',-0.088,2,0,8.1,5,2,2,1,3.3),(985,'Park Jun-soon','Doosan Bears',-0.09,3,0,7,5,2,2,1,2.2),(986,'Lee Ho-jun','Lotte Giants',-0.09,27,18,168.1,67,18,44,5,104.2),(987,'Han Tae-yang','Lotte Giants',-0.121,5,1,14,12,5,6,1,2.55),(988,'Lee Jae-sang','Kiwoom Heroes',-0.128,1,1,2,1,0,0,1,1),(989,'Kim Sang-soo','KT Wiz',-0.138,14,11,98.1,50,22,26,2,50.5),(990,'Kim Tae-jin','Kiwoom Heroes',-0.144,32,23,210,87,26,55,6,127.05),(991,'Sang-Hyeon Ahn','SSG Landers',-0.18,6,2,22,4,3,1,0,18.2),(992,'Eojunseo','Kiwoom Heroes',-0.314,34,24,185,90,36,45,9,99.05),(993,'Oh Seon-jin','Kiwoom Heroes',-0.421,27,13,130,54,25,26,3,78.55),(994,'Hong Jong-pyo','KIA Tigers',0,1,0,1,1,0,1,0,0.05),(995,'Lee Seung-hyun','Hanwha Eagles',0,2,0,2,2,2,0,0,0.1),(996,'Park Min','KIA Tigers',0,1,0,1,0,0,0,0,1);
/*!40000 ALTER TABLE `fielders_SS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pitchers`
--

DROP TABLE IF EXISTS `pitchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pitchers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `team` varchar(20) DEFAULT NULL,
  `war` float DEFAULT NULL,
  `g` int DEFAULT NULL,
  `w` int DEFAULT NULL,
  `l` int DEFAULT NULL,
  `era` float DEFAULT NULL,
  `ip` float DEFAULT NULL,
  `so` int DEFAULT NULL,
  `sv` int DEFAULT NULL,
  `hld` int DEFAULT NULL,
  `pitcherScore` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pitchers`
--

LOCK TABLES `pitchers` WRITE;
/*!40000 ALTER TABLE `pitchers` DISABLE KEYS */;
INSERT INTO `pitchers` VALUES (1,'Cody Ponce','Hanwha Eagles',3.79,12,8,0,1.94,79,105,0,0,51.96),(2,'Airel Jurado','Samsung Lions',3.53,12,5,4,2.32,77.2,60,0,0,42.98),(3,'Chan-gyu Lim','LG Twins',3.15,12,8,1,2.63,75.1,55,0,0,44.87),(4,'James Naile','KIA Tigers',3.12,12,3,1,2.59,73,66,0,0,34.61),(5,'Tucker Davidson','Lotte Giants',3.05,12,6,1,2.45,69.2,65,0,0,40.05),(6,'Drew Anderson','SSG Landers',2.98,12,4,2,2.08,69.1,98,0,0,35.72),(7,'Won Tae-in','Samsung Lions',2.87,11,4,2,2.55,67,51,0,0,34.15),(8,'Yonny Chirinos','LG Twins',2.67,12,6,2,2.84,73,69,0,0,35.86),(9,'So Hyung-jun','KT Wiz',2.56,10,4,2,2.23,60.2,63,0,0,31.37),(10,'Ryan Weiss','Hanwha Eagles',2.51,12,7,2,3.35,75.1,86,0,0,35.75),(11,'Oh Won-seok','KT Wiz',2.45,11,7,2,2.51,61,50,0,0,35.99),(12,'Zach Logue','Doosan Bears',2.41,12,3,5,3.13,72,72,0,0,26.97),(13,'Ryu Hyun-jin','Hanwha Eagles',2.35,12,5,2,3.12,66.1,54,0,0,30.38),(14,'Park Se-woong','Lotte Giants',2.25,12,8,3,3.34,72.2,78,0,0,35.16),(15,'Adam Oller','KIA Tigers',2.17,12,6,2,3.04,71,77,0,0,30.66),(16,'Song Seung-gi','LG Twins',2.16,10,5,3,2.83,57.1,55,0,0,28.77),(17,'Riley Thompson','NC Dinos',2.04,12,7,3,3.31,70.2,87,0,0,31.09),(18,'Go Young-pyo','KT Wiz',2.03,11,4,4,3.04,68,70,0,0,25.26),(19,'Mitch White','SSG Landers',1.78,8,4,1,2.72,46.1,47,0,0,23.08),(20,'Kenny Rosenberg','Kiwoom Heroes',1.74,12,4,4,3.33,70.1,77,0,0,22.07),(21,'Jo Byeong-Hyeon','SSG Landers',1.69,26,4,1,1.01,26.2,25,0,0,23.89),(22,'Kim Seo-hyun','Hanwha Eagles',1.64,29,1,1,1.59,28.1,32,0,0,16.81),(23,'Son Dong-hyun','KT Wiz',1.59,29,3,0,0.89,30.1,29,0,0,21.01),(24,'Choi Seung-yong','Doosan Bears',1.49,11,3,3,3.86,58.1,42,0,0,17.04),(25,'Kim Tae-hoon','Samsung Lions',1.46,29,1,1,1.86,29,30,0,0,14.74),(26,'Baek Jeong-hyeon','Samsung Lions',1.45,28,2,0,1.99,31.2,31,0,0,16.51),(27,'Kim Kwang Hyun','SSG Landers',1.45,12,3,6,3.84,65.2,63,0,0,16.66),(28,'Son Joo-young','LG Twins',1.44,11,6,3,3.79,59.1,61,0,0,22.61),(29,'Cole Irvin','Doosan Bears',1.43,12,5,5,4.28,67.1,54,0,0,20.02),(30,'Moon Seung-won','SSG Landers',1.42,9,3,2,3.4,47.2,21,0,0,16.8),(31,'Logan Allen','NC Dinos',1.37,12,2,6,3.58,65.1,45,0,0,14.12),(32,'Kim Do-hyun','KIA Tigers',1.37,11,2,3,3.36,61.2,36,0,0,14.34),(33,'Enmanuel De Jesus','KT Wiz',1.35,11,4,4,2.8,61,69,0,0,18.7),(34,'Park Young-hyun','KT Wiz',1.31,29,1,2,2.78,32.1,36,0,0,12.32),(35,'Denyi Reyes','Samsung Lions',1.3,9,4,3,3.64,47,32,0,0,17.36),(36,'Kim Won-joong','Lotte Giants',1.3,24,2,1,1.37,26.1,33,0,0,15.63),(37,'Moon Dong-ju','Hanwha Eagles',1.26,10,5,2,3.68,51.1,56,0,0,18.92),(38,'Lee Roun','SSG Landers',1.23,29,2,2,0.62,29,28,0,0,15.68),(39,'Shin Min-hyuk','NC Dinos',1.19,10,2,3,4.35,49.2,31,0,0,11.55),(40,'Won Sang-hyun','KT Wiz',1.09,28,0,1,2.08,30.1,26,0,0,8.82),(41,'Noh Kyung-eun','SSG Landers',1.02,31,0,2,1.69,32,24,0,0,8.51),(42,'Jeong Hae-young','KIA Tigers',1,25,1,2,2.25,28,34,0,0,9.75),(43,'Kim Jin-seong','LG Twins',0.91,32,1,2,3.23,30.2,29,0,0,7.87),(44,'Son Joo-hwan','NC Dinos',0.9,27,5,1,2.96,27.1,20,0,0,16.04),(45,'Park Sang-won','Hanwha Eagles',0.89,31,3,2,2.83,28.2,23,0,0,12.07),(46,'Woo Kyu-min','KT Wiz',0.89,24,1,1,2.11,21.1,14,0,0,8.79),(47,'Choi Won-tae','Samsung Lions',0.84,10,4,2,4.97,50.2,51,0,0,11.43),(48,'Joo Seung Woo','Kiwoom Heroes',0.84,18,2,1,2.66,20.1,15,0,0,9.74),(49,'Nakyun-an','Lotte Giants',0.8,11,0,3,4.94,54.2,41,0,0,3.06),(50,'Han Seung-hyuk','Hanwha Eagles',0.78,29,1,2,2.7,26.2,22,0,0,7.1);
/*!40000 ALTER TABLE `pitchers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_likes`
--

DROP TABLE IF EXISTS `post_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_likes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `post_id` int DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_like` (`post_id`,`user_email`),
  CONSTRAINT `post_likes_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_likes`
--

LOCK TABLES `post_likes` WRITE;
/*!40000 ALTER TABLE `post_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `author` varchar(100) NOT NULL,
  `time` datetime DEFAULT CURRENT_TIMESTAMP,
  `likes` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (16,'asda','asdasd','yobro','2025-05-31 17:32:56',0),(17,'hello','1111','yobro','2025-06-01 16:23:21',0);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `team` varchar(100) NOT NULL,
  `image_url` varchar(255) DEFAULT '/Images/user.png',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'yesyes','yobro','7499724d2fb5d3cc1ce097fef2f4132a8fcdbed1745110c65184e08e073c169','Samsung Lions','/uploads/16b793a927c6742fb02d5f03dc026493'),(2,'hello','qpqp','eb6b09ae4b649a3e39e0e42f3050cfd989bcaa8aacc4663undefined6f89c688d60f','Doosan Bears','/Images/user.png');
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

-- Dump completed on 2025-06-01 21:22:45
