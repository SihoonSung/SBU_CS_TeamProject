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
  `battingScore` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=360 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batters_1B`
--

LOCK TABLES `batters_1B` WRITE;
/*!40000 ALTER TABLE `batters_1B` DISABLE KEYS */;
INSERT INTO `batters_1B` VALUES (341,'Austin Dean','LG Twins',2.38,2,0,55,0,358.56),(342,'Lewin Diaz','Samsung Lions',1.66,1,0,66,0,415.92),(343,'Patrick Wisdom','KIA Tigers',1.43,1,0,29,0,191.16),(344,'Yang Seok-hwan','Doosan Bears',1.12,0,0,53,0,331.44),(345,'Na Seung-yeop','Lotte Giants',0.66,1,0,49,1,303.12),(346,'Tucker Davidson','NC Dinos',0.57,0,0,35,0,216.84),(347,'Choi Joo-hwan','Kiwoom Heroes',0.5,0,0,61,1,373.2),(348,'Chae Eun-seong','Hanwha Eagles',0.46,0,0,56,1,342.72),(349,'Go Myung-jun','SSG Landers',0.41,0,0,50,1,306.12),(350,'Seo Ho-cheol','NC Dinos',0.27,0,0,30,0,183.24),(351,'Do Tae-hoon','NC Dinos',0.13,0,0,10,1,62.76),(352,'Kim Min-soo','LG Twins',0.03,0,0,1,0,6.36),(353,'Choi Hang','Lotte Giants',-0.06,0,0,0,0,-0.72),(354,'Moon Jeong-bin','LG Twins',-0.08,0,0,2,0,11.04),(355,'Hwang Dae-in','KIA Tigers',-0.12,0,0,5,0,28.56),(356,'Moon Sang-cheol','KT Wiz',-0.15,0,0,27,1,161.4),(357,'Kang Jinseong','Kiwoom Heroes',-0.18,0,0,2,0,9.84),(358,'Yoon Jun-hyeok','KT Wiz',-0.18,0,0,1,0,3.84),(359,'Kim In-hwan','Hanwha Eagles',-0.3,0,0,0,0,-3.6);
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
  `battingScore` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=562 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batters_2B`
--

LOCK TABLES `batters_2B` WRITE;
/*!40000 ALTER TABLE `batters_2B` DISABLE KEYS */;
INSERT INTO `batters_2B` VALUES (529,'Park Min-woo','NC Dinos',2.24,1,0,51,5,338.88),(530,'Ko Seung-min','Lotte Giants',1.25,1,0,58,1,364.2),(531,'Oh Myung-jin','Doosan Bears',0.97,0,0,37,2,236.04),(532,'Ryu Ji-hyuk','Samsung Lions',0.88,0,0,50,0,310.56),(533,'Yang Do-geun','Samsung Lions',0.82,0,0,15,0,99.84),(534,'Kim Seonbin','KIA Tigers',0.79,0,0,31,0,195.48),(535,'Cheon Seong-ho','KT Wiz',0.72,0,0,11,1,75.84),(536,'Koo Bon-hyeok','LG Twins',0.52,0,0,35,1,217.44),(537,'Shin Min-jae','LG Twins',0.42,0,0,26,0,161.04),(538,'Lee Yu-chan','Doosan Bears',0.39,0,0,9,1,59.88),(539,'Lee Young-bin','LG Twins',0.33,0,0,11,0,69.96),(540,'Kim Sang-soo','KT Wiz',0.25,0,0,24,0,147),(541,'Park Gye-beom','Doosan Bears',0.2,0,0,17,2,106.8),(542,'Kim Hanbyeol','NC Dinos',0.17,0,0,8,0,50.04),(543,'Lee Seung-hyun','Hanwha Eagles',0.15,0,0,1,1,9),(544,'Kim Kyu-seong','KIA Tigers',0.14,0,0,20,0,121.68),(545,'Lee Do-yoon','Hanwha Eagles',0.13,0,0,20,2,123.96),(546,'Yoon Do-hyun','KIA Tigers',0.1,0,0,10,0,61.2),(547,'Jung Jun Jae','SSG Landers',0.08,0,0,34,1,206.16),(548,'Kim Joo-sung','LG Twins',0.04,0,0,1,0,6.48),(549,'Hong Jong-pyo','KIA Tigers',0.04,0,0,8,0,48.48),(550,'Choi Jeong-yong','KIA Tigers',0.01,0,0,1,0,6.12),(551,'Choi Jeong-won','NC Dinos',0,0,0,7,0,42),(552,'Kim Jun-sang','Doosan Bears',0,0,0,1,0,6),(553,'Shim Jae Hoon','Samsung Lions',-0.01,0,0,5,0,29.88),(554,'Seo Geon-chang','KIA Tigers',-0.02,0,0,3,0,17.76),(555,'Park Jun-soon','Doosan Bears',-0.08,0,0,1,0,5.04),(556,'Seo Yu-shin','Kiwoom Heroes',-0.11,0,0,0,0,-1.32),(557,'Hwang Young-mook','Hanwha Eagles',-0.12,0,0,36,0,214.56),(558,'Oh Yoon-seok','KT Wiz',-0.24,0,0,10,0,57.12),(559,'Song Ji-hoo','Kiwoom Heroes',-0.28,0,0,4,0,20.64),(560,'Anjuhyung','Samsung Lions',-0.3,0,0,3,0,14.4),(561,'Kang Min-seong','KT Wiz',-0.45,0,0,1,0,0.6);
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
  `battingScore` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=443 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batters_3B`
--

LOCK TABLES `batters_3B` WRITE;
/*!40000 ALTER TABLE `batters_3B` DISABLE KEYS */;
INSERT INTO `batters_3B` VALUES (417,'Moon Bo-kyung','LG Twins',2.96,3,0,63,0,413.52),(418,'Song Seong-moon','Kiwoom Heroes',2.6,2,0,65,0,421.2),(419,'Kim Do-young','KIA Tigers',1.47,1,0,33,0,215.64),(420,'Hwang Jae-gyun','KT Wiz',1.29,1,0,56,0,351.48),(421,'Noh Si-hwan','Hanwha Eagles',1.09,1,0,52,1,326.28),(422,'Kang Seung-ho','Doosan Bears',1,0,0,44,2,278.4),(423,'Heo Kyung-min','KT Wiz',0.58,0,0,34,0,210.96),(424,'Kim Young-woong','Samsung Lions',0.49,0,0,43,1,265.08),(425,'Jeon Byeong-woo','Samsung Lions',0.38,0,0,6,0,40.56),(426,'Kim Seong-hyeon','SSG Landers',0.33,0,0,16,0,99.96),(427,'Im Jong-seong','Doosan Bears',0.21,0,0,14,0,86.52),(428,'Kim Min-seong','Lotte Giants',0.19,0,0,19,0,116.28),(429,'Son Ho-young','Lotte Giants',-0.01,0,0,35,0,209.88),(430,'Yang Hyeon-jong','Kiwoom Heroes',-0.06,0,0,0,0,-0.72),(431,'Kim Chan-hyung','SSG Landers',-0.09,0,0,4,0,22.92),(432,'Lee Seung-won','Kiwoom Heroes',-0.13,0,0,0,0,-1.56),(433,'Jeong Hyeon-chang','NC Dinos',-0.15,0,0,0,0,-1.8),(434,'Byun Woo-hyuk','KIA Tigers',-0.16,0,0,26,0,154.08),(435,'Yeo Dong Wook','Kiwoom Heroes',-0.16,0,0,4,0,22.08),(436,'Jeon Tae-hyun','Kiwoom Heroes',-0.16,0,0,21,0,124.08),(437,'Go Young-woo','Kiwoom Heroes',-0.25,0,0,0,0,-3),(438,'Kim Soo-yoon','SSG Landers',-0.26,0,0,1,0,2.88),(439,'Sang-Hyeon Ahn','SSG Landers',-0.28,0,0,23,1,135.84),(440,'Seok Jeong-woo','SSG Landers',-0.29,0,0,2,0,8.52),(441,'Park Ji-hwan','SSG Landers',-0.79,0,0,8,0,38.52),(442,'Kim Hui-jip','NC Dinos',-0.99,0,0,29,1,163.32);
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
  `battingScore` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=579 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batters_C`
--

LOCK TABLES `batters_C` WRITE;
/*!40000 ALTER TABLE `batters_C` DISABLE KEYS */;
INSERT INTO `batters_C` VALUES (545,'Park Dong-won','LG Twins',3.6,3,0,53,0,361.2),(546,'Positive will','Doosan Bears',2.88,2,0,61,0,400.56),(547,'Yoo Kang-nam','Lotte Giants',1.6,1,0,36,0,235.2),(548,'Choi Jae Hoon','Hanwha Eagles',1.27,1,0,26,0,171.24),(549,'Kim Hyung-jun','NC Dinos',1.21,1,0,29,1,189.72),(550,'Jang Seong-woo','KT Wiz',1.11,1,0,39,0,247.32),(551,'Kang Min-ho','Samsung Lions',1,0,0,47,0,294),(552,'Lee Joo-heon','LG Twins',0.62,0,0,8,0,55.44),(553,'Kim Tae-gun','KIA Tigers',0.46,0,0,20,0,125.52),(554,'Kim Ki-yeon','Doosan Bears',0.32,0,0,22,0,135.84),(555,'Jo Hyeong-woo','SSG Landers',0.25,0,0,26,0,159),(556,'Shin Beom-soo','SSG Landers',0.2,0,0,4,0,26.4),(557,'Jo Dae-hyun','KT Wiz',0.14,0,0,2,0,13.68),(558,'Kim Gun-hee','Kiwoom Heroes',0.13,0,0,19,1,116.76),(559,'Kim Jeong-ho','NC Dinos',0.1,0,0,2,0,13.2),(560,'Han Seung-taek','KIA Tigers',0.1,0,0,4,0,25.2),(561,'Lee Jae-won','Hanwha Eagles',0.1,0,0,13,1,80.4),(562,'Son Seong-bin','Lotte Giants',0.1,0,0,1,0,7.2),(563,'Information source','Lotte Giants',0.09,0,0,18,1,110.28),(564,'Heo In-seo','Hanwha Eagles',0.08,0,0,1,0,6.96),(565,'Lee Ji-young','SSG Landers',0.08,0,0,19,1,116.16),(566,'Kim Sung-woo','LG Twins',0,0,0,1,0,6),(567,'Park Jae-yeop','Lotte Giants',0,0,0,1,0,6),(568,'Interest rate','SSG Landers',-0.03,0,0,0,0,-0.36),(569,'Kim Dong-heon','Kiwoom Heroes',-0.04,0,0,9,0,53.52),(570,'Han Jun-su','KIA Tigers',-0.07,0,0,19,0,113.16),(571,'Jang Seung-hyun','Doosan Bears',-0.08,0,0,0,0,-0.96),(572,'An Jung-yeol','NC Dinos',-0.12,0,0,1,0,4.56),(573,'Kang Hyun Woo','KT Wiz',-0.14,0,0,2,0,10.32),(574,'Kim Jae-seong','Samsung Lions',-0.15,0,0,2,0,10.2),(575,'Ryu Hyun-jun','Doosan Bears',-0.15,0,0,1,0,4.2),(576,'Lee Byung-hun','Samsung Lions',-0.21,0,0,2,0,9.48),(577,'Kim Jae-hyun','Kiwoom Heroes',-0.43,0,0,17,0,96.84),(578,'Park Se-hyuk','NC Dinos',-0.54,0,0,7,0,35.52);
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
  `battingScore` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=426 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batters_CF`
--

LOCK TABLES `batters_CF` WRITE;
/*!40000 ALTER TABLE `batters_CF` DISABLE KEYS */;
INSERT INTO `batters_CF` VALUES (401,'Kim Seong-yoon','Samsung Lions',3.05,2,0,64,3,424.2),(402,'Estevan Florial','Hanwha Eagles',1.78,1,0,63,2,401.76),(403,'Jung Soo-bin','Doosan Bears',1.44,1,0,53,0,335.28),(404,'Lee Joo-hyung','Kiwoom Heroes',1.42,0,0,36,0,233.04),(405,'Park Hae-min','LG Twins',1.28,0,0,41,2,263.76),(406,'Choi Ji-hoon','SSG Landers',1.05,1,0,67,2,417),(407,'Genius Hwan','NC Dinos',0.93,0,0,29,2,187.56),(408,'Jang Doo-seong','Lotte Giants',0.64,0,0,35,0,217.68),(409,'Kim Ji-chan','Samsung Lions',0.64,0,0,34,1,212.88),(410,'Han Seok-hyun','NC Dinos',0.48,0,0,17,0,107.76),(411,'Park Jeong-woo','KIA Tigers',0.38,0,0,14,0,88.56),(412,'Hwang Seong-bin','Lotte Giants',0.37,0,0,36,1,221.64),(413,'Jang Jin-hyeok','KT Wiz',0.09,0,0,7,1,44.28),(414,'Kim Ho-ryeong','KIA Tigers',-0.1,0,0,10,0,58.8),(415,'Euro decision','Hanwha Eagles',-0.13,0,0,0,0,-1.56),(416,'Kim Jae-hyuk','Samsung Lions',-0.16,0,0,0,0,-1.92),(417,'Jeon Da-min','Doosan Bears',-0.19,0,0,0,0,-2.28),(418,'Lee Yong-gyu','Kiwoom Heroes',-0.22,0,0,6,0,33.36),(419,'Park Soo-jong','Kiwoom Heroes',-0.28,0,0,1,0,2.64),(420,'Jang Jae-young','Kiwoom Heroes',-0.29,0,0,2,0,8.52),(421,'Assignment table','KT Wiz',-0.34,0,0,26,2,154.32),(422,'Kim Seong-wook','NC Dinos',-0.5,0,0,1,0,0),(423,'Lim Byeong-wook','Kiwoom Heroes',-0.51,0,0,18,1,103.08),(424,'Park Jae-hyun','KIA Tigers',-0.68,0,0,3,0,9.84),(425,'Choi Won-jun','KIA Tigers',-0.98,0,0,24,0,132.24);
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
  `battingScore` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=409 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batters_DH`
--

LOCK TABLES `batters_DH` WRITE;
/*!40000 ALTER TABLE `batters_DH` DISABLE KEYS */;
INSERT INTO `batters_DH` VALUES (385,'Choi Hyeong-woo','KIA Tigers',2.59,2,0,63,1,410.28),(386,'Kim Hyun-soo','LG Twins',1.51,1,0,55,0,348.12),(387,'Moon Hyun-bin','Hanwha Eagles',1.35,1,0,63,0,394.2),(388,'Kim Jae-hwan','Doosan Bears',0.85,0,0,46,1,287.4),(389,'Jeon Jun-woo','Lotte Giants',0.67,1,0,59,1,363.24),(390,'The best','SSG Landers',0.56,0,0,18,0,114.72),(391,'Kang Baek-ho','KT Wiz',0.39,0,0,40,0,244.68),(392,'Park Byung-ho','Samsung Lions',0.15,0,0,25,0,151.8),(393,'Park Young-bin','NC Dinos',0.06,0,0,0,0,0.72),(394,'Yeo Dong-geon','Doosan Bears',0.02,0,0,0,0,0.24),(395,'Lee Chang-yong','Samsung Lions',0.01,0,0,3,0,18.12),(396,'Kim Min-hyeok','Doosan Bears',0.01,0,0,1,0,6.12),(397,'Hongdae people','SSG Landers',-0.03,0,0,0,0,-0.36),(398,'Han Jae-hwan','NC Dinos',-0.04,0,0,5,0,29.52),(399,'Lee Won-seok','Kiwoom Heroes',-0.04,0,0,1,0,5.52),(400,'Kim Dong-jun','Doosan Bears',-0.05,0,0,0,0,-0.6),(401,'Son Yongjun','LG Twins',-0.1,0,0,1,0,4.8),(402,'Kwon Kwang-min','Hanwha Eagles',-0.1,0,0,2,0,10.8),(403,'Kim Dong-yeop','Kiwoom Heroes',-0.13,0,0,0,0,-1.56),(404,'Hyunwonhoe','SSG Landers',-0.15,0,0,3,0,16.2),(405,'Kim Woongbin','Kiwoom Heroes',-0.19,0,0,2,0,9.72),(406,'Oh Young-soo','NC Dinos',-0.22,0,0,5,0,27.36),(407,'Jeonghoon','Lotte Giants',-0.34,0,0,22,0,127.92),(408,'An Chi Hong','Hanwha Eagles',-1.09,0,0,6,0,22.92);
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
  `battingScore` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=647 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batters_LF`
--

LOCK TABLES `batters_LF` WRITE;
/*!40000 ALTER TABLE `batters_LF` DISABLE KEYS */;
INSERT INTO `batters_LF` VALUES (609,'Kwon Hee-dong','NC Dinos',1.51,1,0,37,0,240.12),(610,'Victor Reyes','Lotte Giants',1.4,1,0,76,0,472.8),(611,'Kim In-tae','Doosan Bears',0.82,0,0,20,0,129.84),(612,'Park Seung-gyu','Samsung Lions',0.52,0,0,9,0,60.24),(613,'Choi Won-young','LG Twins',0.44,0,0,5,0,35.28),(614,'Choi Jun-woo','SSG Landers',0.37,0,0,21,0,130.44),(615,'Oh Seon-woo','KIA Tigers',0.35,0,0,37,0,226.2),(616,'Guillermo Heredia','SSG Landers',0.35,0,0,15,0,94.2),(617,'Gu Ja-wook','Samsung Lions',0.33,0,0,51,0,309.96),(618,'Kim Dong-hyuk','Lotte Giants',0.3,0,0,3,0,21.6),(619,'Chae Hyun Woo','SSG Landers',0.26,0,0,5,1,34.32),(620,'Lim Ji-yeol','Kiwoom Heroes',0.24,0,0,10,0,62.88),(621,'Ham Chang-geon','LG Twins',0.14,0,0,5,0,31.68),(622,'Moon Sung-joo','LG Twins',0.08,0,0,36,0,216.96),(623,'An Chi-young','KT Wiz',0.02,0,0,0,0,0.24),(624,'Kim Tae-geun','Samsung Lions',-0.01,0,0,4,0,23.88),(625,'Hong Hyun-bin','Samsung Lions',-0.02,0,0,0,0,-0.24),(626,'saline','Samsung Lions',-0.03,0,0,0,0,-0.36),(627,'Kim Beom-jun','NC Dinos',-0.03,0,0,0,0,-0.36),(628,'Kwon Hyuk Bin','Kiwoom Heroes',-0.03,0,0,0,0,-0.36),(629,'Kim Byung-jun','KT Wiz',-0.05,0,0,1,0,5.4),(630,'Choi Seung-min','LG Twins',-0.05,0,0,0,0,-0.6),(631,'Park Han-gyeol','NC Dinos',-0.07,0,0,2,0,11.16),(632,'Jaehyun Choo','Doosan Bears',-0.07,0,0,14,1,84.36),(633,'Oh Tae-gon','SSG Landers',-0.08,0,0,18,0,107.04),(634,'Kim Gun-hyung','KT Wiz',-0.09,0,0,0,0,-1.08),(635,'Kim Min-hyeok','KT Wiz',-0.1,0,0,63,1,378),(636,'Right to compensation','Kiwoom Heroes',-0.18,0,0,4,0,21.84),(637,'Kim Seok-hwan','KIA Tigers',-0.19,0,0,7,0,39.72),(638,'Song Seung-hwan','NC Dinos',-0.23,0,0,1,0,3.24),(639,'Won Seong-jun','Kiwoom Heroes',-0.23,0,0,3,0,15.24),(640,'Lee Woo-sung','KIA Tigers',-0.28,0,0,34,1,201.84),(641,'Assistant','Doosan Bears',-0.34,0,0,14,0,79.92),(642,'Yoo Jun-gyu','KT Wiz',-0.35,0,0,1,0,1.8),(643,'Kim Tae-yeon','Hanwha Eagles',-0.36,0,0,32,0,187.68),(644,'Kim Min-seok','Doosan Bears',-0.46,0,0,13,2,74.88),(645,'Puig','Kiwoom Heroes',-0.46,0,0,33,0,192.48),(646,'Choi In-ho','Hanwha Eagles',-0.47,0,0,14,0,78.36);
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
  `battingScore` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=545 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batters_RF`
--

LOCK TABLES `batters_RF` WRITE;
/*!40000 ALTER TABLE `batters_RF` DISABLE KEYS */;
INSERT INTO `batters_RF` VALUES (513,'Hyunmin Ahn','KT Wiz',2.22,1,0,35,2,239.04),(514,'Mel Rojas Jr.','KT Wiz',1.76,1,0,55,0,351.12),(515,'Lee Jin-young','Hanwha Eagles',1.55,0,0,40,0,258.6),(516,'Yoon Dong-hee','Lotte Giants',1.37,1,0,52,0,328.44),(517,'Jake Cave','Doosan Bears',1.32,0,0,58,1,365.04),(518,'Son Ah-seop','NC Dinos',1.01,0,0,48,3,303.72),(519,'Hong Chang-ki','LG Twins',0.78,0,0,36,0,225.36),(520,'Hanyu Island','SSG Landers',0.57,0,0,46,0,282.84),(521,'Lee Seong-gyu','Samsung Lions',0.45,0,0,8,1,54.6),(522,'Lee Won-seok','Hanwha Eagles',0.38,0,0,7,0,46.56),(523,'Song Chan\'s','LG Twins',0.22,0,0,27,1,165.84),(524,'Park Geon-woo','NC Dinos',0.21,0,0,29,0,176.52),(525,'Sexually explicit','KIA Tigers',0.16,0,0,21,0,127.92),(526,'Jeong Hae-won','KIA Tigers',0.1,0,0,1,0,7.2),(527,'Heterogeneous','Kiwoom Heroes',0.02,0,0,11,0,66.24),(528,'Kim Dae-han','Doosan Bears',0.01,0,0,1,0,6.12),(529,'Jeong Hyeonseung','SSG Landers',0,0,0,1,0,6),(530,'Kim Tae-hoon','Samsung Lions',-0.02,0,0,2,0,11.76),(531,'Ruben Cardenas','Kiwoom Heroes',-0.03,0,0,45,1,270.84),(532,'Kim Heon-gon','Samsung Lions',-0.07,0,0,29,0,173.16),(533,'Choi Sung-min','KT Wiz',-0.1,0,0,1,0,4.8),(534,'Park Kwan Woo','LG Twins',-0.1,0,0,0,0,-1.2),(535,'Lee Min-jae','Hanwha Eagles',-0.12,0,0,0,0,-1.44),(536,'McBroom','SSG Landers',-0.14,0,0,15,0,88.32),(537,'Park Joo-hong','Kiwoom Heroes',-0.14,0,0,18,0,106.32),(538,'Josejin','Lotte Giants',-0.14,0,0,0,0,-1.68),(539,'Choi Sang-min','SSG Landers',-0.15,0,0,1,0,4.2),(540,'Im Jong-chan','Hanwha Eagles',-0.15,0,0,5,0,28.2),(541,'Park Si-won','NC Dinos',-0.24,0,0,9,0,51.12),(542,'Lee Sang-hyeok','Hanwha Eagles',-0.3,0,0,2,0,8.4),(543,'Ha Jae Hoon','SSG Landers',-0.37,0,0,4,0,19.56),(544,'Yoon Jung-bin','Samsung Lions',-0.62,0,0,7,0,34.56);
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
  `battingScore` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=358 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batters_SS`
--

LOCK TABLES `batters_SS` WRITE;
/*!40000 ALTER TABLE `batters_SS` DISABLE KEYS */;
INSERT INTO `batters_SS` VALUES (337,'Jeon Minjae','Lotte Giants',1.9,2,0,55,0,352.8),(338,'Lee Jae-hyun','Samsung Lions',1.68,1,0,43,0,278.16),(339,'Chan Ho Park','KIA Tigers',1.5,1,0,45,0,288),(340,'Park Sung-han','SSG Landers',1.4,0,0,39,0,250.8),(341,'Kim Joo-won','NC Dinos',1.35,1,0,45,2,288.6),(342,'Oh Ji-hwan','LG Twins',1.33,0,0,38,0,243.96),(343,'Ha Joo-seok','Hanwha Eagles',1.12,0,0,21,0,139.44),(344,'Kwon Dong-jin','KT Wiz',0.64,0,0,29,1,182.88),(345,'Lee Ho-jun','Lotte Giants',0.33,0,0,15,4,98.76),(346,'Park Min-seok','KT Wiz',0.23,0,0,4,1,27.96),(347,'Park Jun-young','Doosan Bears',0.17,0,0,25,0,152.04),(348,'Park Min','KIA Tigers',0.11,0,0,1,0,7.32),(349,'Han Tae-yang','Lotte Giants',0.07,0,0,5,0,30.84),(350,'Jang Jun-won','KT Wiz',0.05,0,0,10,0,60.6),(351,'Oh Seon-jin','Kiwoom Heroes',-0.02,0,0,19,0,113.76),(352,'Park Seung-wook','Lotte Giants',-0.08,0,0,3,0,17.04),(353,'Lee Jae-sang','Kiwoom Heroes',-0.1,0,0,1,0,4.8),(354,'Park Ji Hoon','Doosan Bears',-0.11,0,0,1,0,4.68),(355,'Sim Woo-jun','Hanwha Eagles',-0.18,0,0,16,1,95.04),(356,'Kim Tae-jin','Kiwoom Heroes',-0.2,0,0,39,1,232.8),(357,'Eojunseo','Kiwoom Heroes',-0.95,0,0,23,0,126.6);
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
) ENGINE=InnoDB AUTO_INCREMENT=851 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fielders_1B`
--

LOCK TABLES `fielders_1B` WRITE;
/*!40000 ALTER TABLE `fielders_1B` DISABLE KEYS */;
INSERT INTO `fielders_1B` VALUES (801,'Kang Seung-ho','Doosan Bears',0.172,10,2,29.2,35,31,4,0,-4.05),(802,'Hwang Jae-gyun','KT Wiz',0.146,27,21,184.2,186,168,18,0,7.5),(803,'Jeonghoon','Lotte Giants',0.127,9,4,44.1,43,39,4,0,3.25),(804,'Han Jae-hwan','NC Dinos',0.123,6,2,21,24,23,1,0,-1.8),(805,'Park Min-woo','NC Dinos',0.118,2,1,11,13,13,0,0,-1.35),(806,'Cheon Seong-ho','KT Wiz',0.118,5,1,13,18,17,1,0,-4.1),(807,'Kim Kyu-seong','KIA Tigers',0.102,3,2,17,19,17,2,0,-1.05),(808,'Do Tae-hoon','NC Dinos',0.094,16,5,72,67,61,6,0,8.35),(809,'Park Byung-ho','Samsung Lions',0.086,11,10,68,55,46,8,1,15.7),(810,'Kim Min-soo','LG Twins',0.078,3,2,17,14,12,2,0,3.7),(811,'Lim Ji-yeol','Kiwoom Heroes',0.074,4,2,20,25,25,0,0,-3.75),(812,'Lee Young-bin','LG Twins',0.065,9,1,22,25,24,1,0,-1.75),(813,'Lee Do-yoon','Hanwha Eagles',0.048,4,0,5,7,7,0,0,-1.65),(814,'Moon Bo-kyung','LG Twins',0.038,9,1,22,19,19,0,0,3.95),(815,'Park Ji Hoon','Doosan Bears',0.035,8,0,12,6,6,0,0,6.3),(816,'Yoon Jun-hyeok','KT Wiz',0.023,8,1,22,20,18,2,0,3),(817,'Ryu Ji-hyuk','Samsung Lions',0.022,9,2,30,32,31,1,0,-0.4),(818,'Jaehyun Choo','Doosan Bears',0.02,2,1,6.1,10,9,1,0,-3.4),(819,'Yoon Jung-bin','Samsung Lions',0.016,1,0,3,1,0,1,0,2.05),(820,'Son Yongjun','LG Twins',0.005,1,1,4,6,6,0,0,-1.7),(821,'Kim Tae-yeon','Hanwha Eagles',-0.004,14,7,75,67,60,7,0,11.35),(822,'Kwon Kwang-min','Hanwha Eagles',-0.006,3,0,6.1,8,8,0,0,-1.5),(823,'Hwang Dae-in','KIA Tigers',-0.011,6,6,53,50,49,1,0,5.5),(824,'Park Joo-hong','Kiwoom Heroes',-0.012,3,0,5,2,2,0,0,3.1),(825,'Oh Seon-jin','Kiwoom Heroes',-0.022,4,1,14,14,13,1,0,0.7),(826,'Moon Jeong-bin','LG Twins',-0.028,6,2,18,20,18,2,0,-1),(827,'Seo Geon-chang','KIA Tigers',-0.034,2,2,13,13,13,0,0,0.65),(828,'Oh Young-soo','NC Dinos',-0.042,2,1,5,4,3,1,0,1.2),(829,'Go Myung-jun','SSG Landers',-0.045,48,46,400.1,384,350,32,2,35.2),(830,'Oh Seon-woo','KIA Tigers',-0.045,13,8,70,77,74,3,0,-3.15),(831,'Song Seung-hwan','NC Dinos',-0.055,1,1,2,2,2,0,0,0.1),(832,'McBroom','SSG Landers',-0.064,6,5,45,48,43,5,0,-0.6),(833,'Kim Hyun-soo','LG Twins',-0.065,11,9,81,82,71,9,2,3),(834,'Byun Woo-hyuk','KIA Tigers',-0.071,14,4,52,44,39,5,0,10.2),(835,'Kang Min-seong','KT Wiz',-0.078,2,0,6,0,0,0,0,6),(836,'Kang Jinseong','Kiwoom Heroes',-0.082,4,2,19,18,17,1,0,1.9),(837,'Kim Min-seong','Lotte Giants',-0.082,6,1,12,15,15,0,0,-2.25),(838,'Kim In-hwan','Hanwha Eagles',-0.088,2,1,9,11,10,0,1,-1.5),(839,'Song Chan\'s','LG Twins',-0.107,3,2,13,13,11,1,1,0.6),(840,'Kim Woongbin','Kiwoom Heroes',-0.113,3,2,19,15,15,0,0,4.75),(841,'Kim Hui-jip','NC Dinos',-0.117,10,6,59,50,46,4,0,11.5),(842,'Moon Sang-cheol','KT Wiz',-0.118,38,33,274,272,250,22,0,15.6),(843,'Oh Tae-gon','SSG Landers',-0.124,15,5,58.1,57,54,3,0,3.95),(844,'Seo Ho-cheol','NC Dinos',-0.141,19,14,119,105,103,2,0,19.25),(845,'Patrick Wisdom','KIA Tigers',-0.145,35,33,278,297,281,16,0,-4.15),(846,'Jeon Byeong-woo','Samsung Lions',-0.166,3,0,5,6,5,0,1,-0.75),(847,'Lee Chang-yong','Samsung Lions',-0.175,3,1,10,13,12,0,1,-2.4),(848,'Yang Seok-hwan','Doosan Bears',-0.177,54,54,453.2,438,399,35,4,36.9),(849,'Oh Yoon-seok','KT Wiz',-0.185,8,2,21.1,14,14,0,0,7.8),(850,'Ruben Cardenas','Kiwoom Heroes',-0.191,6,6,54,49,42,5,2,7.35);
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
) ENGINE=InnoDB AUTO_INCREMENT=851 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fielders_2B`
--

LOCK TABLES `fielders_2B` WRITE;
/*!40000 ALTER TABLE `fielders_2B` DISABLE KEYS */;
INSERT INTO `fielders_2B` VALUES (801,'Park Min-woo','NC Dinos',0.515,42,39,311,188,76,108,4,132.2),(802,'Cheon Seong-ho','KT Wiz',0.414,20,14,119.1,77,25,50,2,45.85),(803,'Kang Seung-ho','Doosan Bears',0.391,24,23,191.1,114,61,52,1,82.75),(804,'Jeon Tae-hyun','Kiwoom Heroes',0.271,15,8,78,41,16,25,0,39.05),(805,'Hong Jong-pyo','KIA Tigers',0.255,18,8,87,56,24,32,0,33.8),(806,'Kim Kyu-seong','KIA Tigers',0.195,22,7,90,45,19,26,0,47.25),(807,'Song Seong-moon','Kiwoom Heroes',0.145,24,23,187,118,54,63,1,74.85),(808,'Lee Yu-chan','Doosan Bears',0.138,6,4,40,26,12,14,0,15.3),(809,'Ryu Ji-hyuk','Samsung Lions',0.136,46,37,327,168,78,90,0,167.4),(810,'Yang Do-geun','Samsung Lions',0.135,18,7,74,42,15,27,0,34.1),(811,'Shin Min-jae','LG Twins',0.113,47,34,308.1,175,76,98,1,141.8),(812,'Choi Jeong-yong','KIA Tigers',0.11,3,2,17,10,4,6,0,7.5),(813,'Seo Geon-chang','KIA Tigers',0.109,7,4,34,23,11,12,0,12.15),(814,'Park Seung-wook','Lotte Giants',0.106,7,0,10,8,1,7,0,2.4),(815,'Jeon Byeong-woo','Samsung Lions',0.102,5,3,16,11,7,4,0,5.55),(816,'Park Min','KIA Tigers',0.1,1,0,7,7,3,4,0,0.35),(817,'Do Tae-hoon','NC Dinos',0.089,8,4,38,25,7,17,1,14.2),(818,'Song Ji-hoo','Kiwoom Heroes',0.07,7,7,52,30,17,12,1,23.45),(819,'Kim Min-seong','Lotte Giants',0.059,12,10,81,39,17,22,0,43.95),(820,'Oh Yoon-seok','KT Wiz',0.045,19,12,114.2,69,29,39,1,48.6),(821,'Jang Jun-won','KT Wiz',0.038,3,2,17.1,11,4,7,0,6.65),(822,'Kim Seong-hyeon','SSG Landers',0.037,12,7,61.2,41,17,23,1,22.2),(823,'Kim Chan-hyung','SSG Landers',0.036,5,3,21.2,7,3,4,0,14.55),(824,'Park Gye-beom','Doosan Bears',0.035,15,11,100,49,25,24,0,53.45),(825,'Lee Ho-jun','Lotte Giants',0.034,20,1,39.1,20,5,15,0,20.1),(826,'Jung Jun Jae','SSG Landers',0.03,50,42,391.1,236,102,129,5,166.65),(827,'Jeon Minjae','Lotte Giants',0.026,4,2,19,11,7,4,0,8.55),(828,'Kim Sang-soo','KT Wiz',0.022,24,22,183,101,36,65,0,87.05),(829,'Kim Hanbyeol','NC Dinos',0.021,8,3,29.2,16,4,12,0,14),(830,'Kim Jun-sang','Doosan Bears',0.004,3,1,13,5,2,3,0,8.25),(831,'Lee Do-yoon','Hanwha Eagles',0.004,23,13,121.2,56,22,34,0,68),(832,'Oh Myung-jin','Doosan Bears',0.003,22,16,136,73,35,37,1,66.6),(833,'Choi Hang','Lotte Giants',0,1,0,1,1,1,0,0,0.05),(834,'Park Jun-soon','Doosan Bears',-0.008,7,2,23,14,5,8,1,9.65),(835,'Koo Bon-hyeok','LG Twins',-0.008,23,18,148,81,35,45,1,71),(836,'Park Min-seok','KT Wiz',-0.02,3,1,9,4,2,2,0,5.2),(837,'Han Tae-yang','Lotte Giants',-0.02,9,0,13.1,7,5,2,0,6.45),(838,'Kim Joo-sung','LG Twins',-0.026,2,0,3,0,0,0,0,3),(839,'Kwon Dong-jin','KT Wiz',-0.027,4,2,24,13,4,9,0,11.65),(840,'Kim Tae-jin','Kiwoom Heroes',-0.031,27,18,175,101,37,63,1,79),(841,'Lee Young-bin','LG Twins',-0.031,12,5,48,32,11,21,0,17.6),(842,'Seo Yu-shin','Kiwoom Heroes',-0.038,1,1,8,3,1,2,0,5.15),(843,'Shim Jae Hoon','Samsung Lions',-0.043,12,6,64,25,10,15,0,40.25),(844,'Ko Seung-min','Lotte Giants',-0.046,46,45,352,201,69,128,4,160.85),(845,'Sang-Hyeon Ahn','SSG Landers',-0.051,3,3,24,12,3,9,0,12.6),(846,'Kim Seonbin','KIA Tigers',-0.053,29,28,210,104,44,57,3,111.05),(847,'Oh Seon-jin','Kiwoom Heroes',-0.058,4,3,23,14,8,5,1,9.65),(848,'Choi Jeong-won','NC Dinos',-0.085,10,4,48,30,13,17,0,19.5),(849,'An Chi Hong','Hanwha Eagles',-0.091,5,5,35,21,5,15,1,15),(850,'Seok Jeong-woo','SSG Landers',-0.116,1,1,4,3,0,2,1,1.1);
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
) ENGINE=InnoDB AUTO_INCREMENT=851 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fielders_3B`
--

LOCK TABLES `fielders_3B` WRITE;
/*!40000 ALTER TABLE `fielders_3B` DISABLE KEYS */;
INSERT INTO `fielders_3B` VALUES (801,'Song Seong-moon','Kiwoom Heroes',0.46,34,32,278,109,40,66,3,174.3),(802,'Kim Young-woong','Samsung Lions',0.333,43,41,353,99,28,66,5,258.7),(803,'Seo Ho-cheol','NC Dinos',0.331,13,9,82,25,8,15,2,58.15),(804,'Kim Do-young','KIA Tigers',0.295,22,22,180,51,9,39,3,131.4),(805,'Oh Seon-jin','Kiwoom Heroes',0.283,15,6,67,17,3,14,0,50.85),(806,'Heo Kyung-min','KT Wiz',0.281,34,33,288.1,84,29,51,4,208.1),(807,'Im Jong-seong','Doosan Bears',0.23,22,18,149,41,15,24,2,109.95),(808,'Byun Woo-hyuk','KIA Tigers',0.222,29,24,213,69,17,48,4,147.25),(809,'Jeon Byeong-woo','Samsung Lions',0.197,18,7,69,19,4,15,0,50.95),(810,'Kim Chan-hyung','SSG Landers',0.163,8,4,40,14,4,9,1,26.65),(811,'Kim Min-seong','Lotte Giants',0.158,20,13,111.1,20,1,19,0,92.1),(812,'Kang Seung-ho','Doosan Bears',0.127,30,29,244,82,24,53,5,165.85),(813,'Lee Young-bin','LG Twins',0.104,5,2,25,3,1,2,0,22.15),(814,'Oh Myung-jin','Doosan Bears',0.103,7,7,57,13,4,9,0,44.65),(815,'Kang Min-seong','KT Wiz',0.09,5,0,7,5,2,3,0,2.25),(816,'Koo Bon-hyeok','LG Twins',0.087,22,11,98.1,21,6,15,0,78.15),(817,'Moon Jeong-bin','LG Twins',0.076,5,0,13,1,0,1,0,12.05),(818,'Yeo Dong-geon','Doosan Bears',0.058,1,0,2,1,0,1,0,1.05),(819,'Patrick Wisdom','KIA Tigers',0.058,1,1,6,3,0,3,0,3.15),(820,'Song Ji-hoo','Kiwoom Heroes',0.056,1,0,3,1,0,1,0,2.05),(821,'Noh Si-hwan','Hanwha Eagles',0.05,56,56,499,131,37,87,7,374.2),(822,'Lee Do-yoon','Hanwha Eagles',0.036,2,1,10,2,2,0,0,8.1),(823,'Yang Hyeon-jong','Kiwoom Heroes',0.025,3,2,13,2,0,2,0,11.1),(824,'Yang Do-geun','Samsung Lions',0.022,5,1,15,7,2,4,1,8.3),(825,'Park Jun-young','Doosan Bears',0.011,2,0,2.1,1,1,0,0,1.15),(826,'Jeong Hyeon-chang','NC Dinos',0.003,1,1,8,0,0,0,0,8),(827,'Lee Jae-sang','Kiwoom Heroes',0,1,0,2,0,0,0,0,2),(828,'Han Jae-hwan','NC Dinos',0,1,0,2.1,0,0,0,0,2.1),(829,'Park Min','KIA Tigers',-0.006,1,1,8,5,0,5,0,3.25),(830,'Hong Jong-pyo','KIA Tigers',-0.022,5,3,26,9,4,5,0,17.45),(831,'Yoon Do-hyun','KIA Tigers',-0.049,2,1,12,5,2,3,0,7.25),(832,'Jang Jun-won','KT Wiz',-0.049,2,0,6,1,1,0,0,5.05),(833,'Kim Hanbyeol','NC Dinos',-0.058,8,2,24,5,4,1,0,19.25),(834,'Han Tae-yang','Lotte Giants',-0.063,4,0,7,0,0,0,0,7),(835,'Kim Seong-hyeon','SSG Landers',-0.069,18,8,90,25,3,20,2,66.15),(836,'Do Tae-hoon','NC Dinos',-0.08,6,1,22,4,1,2,1,18.15),(837,'Lee Seung-won','Kiwoom Heroes',-0.083,1,1,5,1,0,0,1,4),(838,'The best','SSG Landers',-0.087,2,2,18,3,0,2,1,15.1),(839,'Park Gye-beom','Doosan Bears',-0.094,12,3,43.2,11,2,8,1,32.7),(840,'Kim Soo-yoon','SSG Landers',-0.097,7,5,35,14,4,8,2,21.6),(841,'Song Chan\'s','LG Twins',-0.101,3,0,6,0,0,0,0,6),(842,'Jeon Tae-hyun','Kiwoom Heroes',-0.102,13,9,80,19,5,13,1,61.9),(843,'Ryu Ji-hyuk','Samsung Lions',-0.104,11,8,70,15,4,10,1,55.7),(844,'Yeo Dong Wook','Kiwoom Heroes',-0.105,9,5,41,13,6,5,2,28.55),(845,'Seok Jeong-woo','SSG Landers',-0.11,4,3,20,3,0,2,1,17.1),(846,'Son Ho-young','Lotte Giants',-0.116,41,40,349.1,112,32,72,8,242.3),(847,'Kim Kyu-seong','KIA Tigers',-0.127,9,3,38,10,3,7,0,28.5),(848,'Go Young-woo','Kiwoom Heroes',-0.149,2,1,9,2,1,0,1,7.05),(849,'Moon Bo-kyung','LG Twins',-0.212,45,44,365,96,25,64,7,273.45),(850,'Hwang Jae-gyun','KT Wiz',-0.223,28,25,219.2,35,18,16,1,185.9);
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
) ENGINE=InnoDB AUTO_INCREMENT=588 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fielders_C`
--

LOCK TABLES `fielders_C` WRITE;
/*!40000 ALTER TABLE `fielders_C` DISABLE KEYS */;
INSERT INTO `fielders_C` VALUES (553,'Lee Jae-won','Hanwha Eagles',0.519,50,17,208,222,201,20,1,-2.95),(554,'Jang Seong-woo','KT Wiz',0.517,52,48,401.2,383,358,23,2,37.25),(555,'Kang Min-ho','Samsung Lions',0.516,52,43,392.1,353,330,22,1,56.7),(556,'Positive will','Doosan Bears',0.504,40,40,315.1,284,263,19,2,45.2),(557,'Park Dong-won','LG Twins',0.474,54,45,401.1,379,352,25,2,40.95),(558,'Kim Tae-gun','KIA Tigers',0.469,33,27,228.1,212,184,25,3,26.55),(559,'Jo Hyeong-woo','SSG Landers',0.372,37,30,260.2,249,229,19,1,23.6),(560,'Yoo Kang-nam','Lotte Giants',0.288,42,40,269.2,269,252,16,1,13.6),(561,'Kim Gun-hee','Kiwoom Heroes',0.285,27,21,187,149,131,17,1,45.4),(562,'Kim Hyung-jun','NC Dinos',0.284,40,35,296,260,241,17,2,48.9),(563,'Information source','Lotte Giants',0.186,47,17,221.1,221,206,13,2,11.05),(564,'Lee Ji-young','SSG Landers',0.186,26,21,189.2,201,189,11,1,-1.8),(565,'Lee Byung-hun','Samsung Lions',0.155,20,9,77.2,69,65,3,1,11.6),(566,'Han Seung-taek','KIA Tigers',0.136,10,5,50,42,34,8,0,10.1),(567,'Han Jun-su','KIA Tigers',0.114,33,23,204.2,211,193,16,2,3.65),(568,'Lee Joo-heon','LG Twins',0.091,23,12,99,104,99,5,0,0.2),(569,'Kim Jae-seong','Samsung Lions',0.088,10,5,37,37,34,3,0,1.85),(570,'Kim Dong-heon','Kiwoom Heroes',0.087,22,9,96,87,82,4,1,13.3),(571,'Shin Beom-soo','SSG Landers',0.079,15,5,53.1,48,46,2,0,7.5),(572,'Jo Dae-hyun','KT Wiz',0.076,17,3,45.1,41,37,4,0,6.15),(573,'Choi Jae Hoon','Hanwha Eagles',0.071,46,40,301,336,310,24,2,-18.3),(574,'Kim Ki-yeon','Doosan Bears',0.063,33,16,175,153,143,8,2,29.55),(575,'Son Seong-bin','Lotte Giants',0.055,8,1,20.2,10,9,1,0,10.7),(576,'Kim Jae-hyun','Kiwoom Heroes',0.039,43,30,242,209,188,18,3,43.3),(577,'Kim Jeong-ho','NC Dinos',0.035,2,0,9,4,4,0,0,5.2),(578,'An Jung-yeol','NC Dinos',0.012,7,4,34.1,24,20,3,1,11.25),(579,'Kim Sung-woo','LG Twins',0,3,0,7,6,6,0,0,1.3),(580,'Kang Baek-ho','KT Wiz',-0.003,5,4,32.2,25,22,2,1,8.4),(581,'Jang Seung-hyun','Doosan Bears',-0.008,4,1,11,11,10,1,0,0.55),(582,'Park Se-hyuk','NC Dinos',-0.058,26,14,116,109,97,9,3,12.3),(583,'Park Jae-yeop','Lotte Giants',-0.059,2,0,4,5,4,0,1,-0.8),(584,'Ryu Hyun-jun','Doosan Bears',-0.08,2,0,3,5,5,0,0,-1.75),(585,'Kang Hyun Woo','KT Wiz',-0.128,10,3,41.1,39,33,4,2,3.95),(586,'Park Min-jun','Doosan Bears',0,1,0,1,0,0,0,0,1),(587,'Heo In-seo','Hanwha Eagles',0,1,0,1,1,1,0,0,0.05);
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
) ENGINE=InnoDB AUTO_INCREMENT=851 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fielders_CF`
--

LOCK TABLES `fielders_CF` WRITE;
/*!40000 ALTER TABLE `fielders_CF` DISABLE KEYS */;
INSERT INTO `fielders_CF` VALUES (801,'Park Hae-min','LG Twins',0.521,57,52,455.1,116,114,2,0,344.9),(802,'Lee Joo-hyung','Kiwoom Heroes',0.452,40,38,322,112,111,1,0,215.6),(803,'Jang Doo-seong','Lotte Giants',0.382,35,19,213,67,66,1,0,149.35),(804,'Kim Seong-yoon','Samsung Lions',0.337,43,35,328,96,95,1,0,236.8),(805,'Jung Soo-bin','Doosan Bears',0.324,55,55,454.1,102,102,0,0,357.2),(806,'Choi Won-young','LG Twins',0.289,15,2,32,13,13,0,0,19.65),(807,'Estevan Florial','Hanwha Eagles',0.278,56,55,477,131,125,3,3,352.4),(808,'Genius Hwan','NC Dinos',0.204,28,17,161.2,48,48,0,0,115.6),(809,'Park Joo-hong','Kiwoom Heroes',0.19,6,4,35,21,20,1,0,15.05),(810,'Assignment table','KT Wiz',0.168,52,37,357.1,86,84,1,1,275.35),(811,'Chae Hyun Woo','SSG Landers',0.165,4,2,18,6,6,0,0,12.3),(812,'Mel Rojas Jr.','KT Wiz',0.104,5,5,34,7,7,0,0,27.35),(813,'Yoo Jun-gyu','KT Wiz',0.102,7,1,23.2,7,6,1,0,16.55),(814,'Han Seok-hyun','NC Dinos',0.099,21,16,147,39,38,1,0,109.95),(815,'Hyunmin Ahn','KT Wiz',0.078,12,10,72.2,15,15,0,0,57.95),(816,'Park Young-bin','NC Dinos',0.063,3,0,5,2,2,0,0,3.1),(817,'Kim Dong-hyuk','Lotte Giants',0.063,3,1,19,8,8,0,0,11.4),(818,'Lee Jin-young','Hanwha Eagles',0.015,1,1,3,1,1,0,0,2.05),(819,'Shin Min-jae','LG Twins',0.001,2,1,6,0,0,0,0,6),(820,'Yang Do-geun','Samsung Lions',0,2,0,3,0,0,0,0,3),(821,'Won Seong-jun','Kiwoom Heroes',-0.009,1,0,2,0,0,0,0,2),(822,'Kim Dae-han','Doosan Bears',-0.009,1,0,3,0,0,0,0,3),(823,'Kim Byung-jun','KT Wiz',-0.011,1,0,3,0,0,0,0,3),(824,'Song Chan\'s','LG Twins',-0.028,3,2,14,2,2,0,0,12.1),(825,'Jeon Da-min','Doosan Bears',-0.042,4,0,12,5,4,0,1,7.2),(826,'Choi Jeong-won','NC Dinos',-0.046,6,2,20,5,5,0,0,15.25),(827,'Choi Sung-min','KT Wiz',-0.048,3,1,5.1,2,1,0,1,3.15),(828,'Oh Tae-gon','SSG Landers',-0.059,5,2,20,3,3,0,0,17.15),(829,'Park Soo-jong','Kiwoom Heroes',-0.063,7,2,27,10,10,0,0,17.5),(830,'Jang Jin-hyeok','KT Wiz',-0.063,5,3,24,6,6,0,0,18.3),(831,'Assistant','Doosan Bears',-0.063,12,2,33,11,10,0,1,22.5),(832,'Lee Yong-gyu','Kiwoom Heroes',-0.083,7,7,52,18,17,0,1,34.85),(833,'Kim Ho-ryeong','KIA Tigers',-0.086,18,12,127,30,28,0,2,98.4),(834,'Yoon Dong-hee','Lotte Giants',-0.091,12,11,74,23,23,0,0,52.15),(835,'Jang Jae-young','Kiwoom Heroes',-0.101,6,2,24,11,10,0,1,13.5),(836,'Kwon Hee-dong','NC Dinos',-0.103,3,2,13,3,3,0,0,10.15),(837,'Park Geon-woo','NC Dinos',-0.112,7,7,51,14,13,0,1,37.65),(838,'Kim Min-hyeok','KT Wiz',-0.113,1,1,1,0,0,0,0,1),(839,'Park Jeong-woo','KIA Tigers',-0.136,16,12,82,16,16,0,0,66.8),(840,'Lim Byeong-wook','Kiwoom Heroes',-0.136,13,7,63,22,22,0,0,42.1),(841,'Kim Jae-hyuk','Samsung Lions',-0.15,5,0,8,2,2,0,0,6.1),(842,'Choi Ji-hoon','SSG Landers',-0.17,54,52,460.2,97,94,0,3,367.9),(843,'Lee Woo-sung','KIA Tigers',-0.178,3,1,12,4,4,0,0,8.2),(844,'Park Si-won','NC Dinos',-0.2,6,5,31,8,8,0,0,23.4),(845,'Moon Hyun-bin','Hanwha Eagles',-0.215,4,1,14,4,3,1,0,10.2),(846,'Hwang Seong-bin','Lotte Giants',-0.252,27,27,209.2,43,40,1,2,168.25),(847,'Kim Seong-wook','NC Dinos',-0.255,5,4,26.2,8,8,0,0,18.6),(848,'Park Jae-hyun','KIA Tigers',-0.257,15,5,61,11,9,1,1,50.5),(849,'Kim Ji-chan','Samsung Lions',-0.354,23,22,166,46,46,0,0,122.3),(850,'Choi Won-jun','KIA Tigers',-0.472,26,25,201,47,44,2,1,156.3);
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
) ENGINE=InnoDB AUTO_INCREMENT=851 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fielders_LF`
--

LOCK TABLES `fielders_LF` WRITE;
/*!40000 ALTER TABLE `fielders_LF` DISABLE KEYS */;
INSERT INTO `fielders_LF` VALUES (801,'Moon Sung-joo','LG Twins',0.318,21,16,144,41,41,0,0,105.05),(802,'Hanyu Island','SSG Landers',0.223,6,6,44,10,10,0,0,34.5),(803,'Lee Won-seok','Hanwha Eagles',0.211,18,1,47.1,15,14,0,1,32.8),(804,'Lee Jin-young','Hanwha Eagles',0.205,7,5,52,15,14,1,0,37.75),(805,'Ham Chang-geon','LG Twins',0.203,7,5,41,14,14,0,0,27.7),(806,'Lim Byeong-wook','Kiwoom Heroes',0.166,8,6,56,13,13,0,0,43.65),(807,'Kim Heon-gon','Samsung Lions',0.153,19,7,71,17,17,0,0,54.85),(808,'Kim Jae-hwan','Doosan Bears',0.139,15,13,103.2,23,22,1,0,81.35),(809,'Choi Sung-min','KT Wiz',0.138,5,1,8.1,5,4,1,0,3.35),(810,'Song Chan\'s','LG Twins',0.125,18,12,107,27,26,1,0,81.35),(811,'Genius Hwan','NC Dinos',0.114,20,4,67.1,19,18,0,1,49),(812,'Park Jeong-woo','KIA Tigers',0.092,18,1,37,9,9,0,0,28.45),(813,'Jang Jin-hyeok','KT Wiz',0.09,6,0,6.1,5,4,1,0,1.35),(814,'Lim Ji-yeol','Kiwoom Heroes',0.074,5,5,36,10,10,0,0,26.5),(815,'Mel Rojas Jr.','KT Wiz',0.07,19,8,86,19,18,1,0,67.95),(816,'Victor Reyes','Lotte Giants',0.067,38,31,271.1,51,51,0,0,222.65),(817,'Park Si-won','NC Dinos',0.066,2,1,12,6,6,0,0,6.3),(818,'Han Seok-hyun','NC Dinos',0.05,5,2,20.1,1,1,0,0,19.15),(819,'Choi Won-young','LG Twins',0.044,19,1,34,8,8,0,0,26.4),(820,'Jaehyun Choo','Doosan Bears',0.043,8,7,66,15,15,0,0,51.75),(821,'Lee Yu-chan','Doosan Bears',0.032,2,2,13,3,3,0,0,10.15),(822,'Choi Jeong-won','NC Dinos',0.027,2,1,12,4,4,0,0,8.2),(823,'Lee Seong-gyu','Samsung Lions',0.021,1,1,9,2,2,0,0,7.1),(824,'Estevan Florial','Hanwha Eagles',0.019,2,1,11,4,3,1,0,7.2),(825,'Kim Byung-jun','KT Wiz',0.019,3,0,5.1,1,1,0,0,4.15),(826,'Kwon Hyuk Bin','Kiwoom Heroes',0.017,1,0,2,2,2,0,0,0.1),(827,'Park Joo-hong','Kiwoom Heroes',0.016,18,8,82,31,30,1,0,52.55),(828,'Kim Dong-hyuk','Lotte Giants',0.016,14,0,16,6,6,0,0,10.3),(829,'Kim Hyun-soo','LG Twins',0.015,23,22,176.1,34,34,0,0,143.8),(830,'Choi Seung-min','LG Twins',0.008,1,0,2,1,1,0,0,1.05),(831,'Choi Sang-min','SSG Landers',0.006,2,0,4,0,0,0,0,4),(832,'Guillermo Heredia','SSG Landers',0.006,12,12,110,32,30,1,1,79.55),(833,'Kim In-tae','Doosan Bears',0.005,16,13,97,22,22,0,0,76.1),(834,'Son Ah-seop','NC Dinos',0.004,1,1,2,1,1,0,0,1.05),(835,'Lee Sang-hyeok','Hanwha Eagles',0,3,0,5,0,0,0,0,5),(836,'Choi Won-jun','KIA Tigers',-0.001,2,0,4,0,0,0,0,4),(837,'Ko Seung-min','Lotte Giants',-0.001,1,0,2,0,0,0,0,2),(838,'Jeon Tae-hyun','Kiwoom Heroes',-0.001,1,0,1,0,0,0,0,1),(839,'Jang Doo-seong','Lotte Giants',-0.002,3,0,6,0,0,0,0,6),(840,'Park Soo-jong','Kiwoom Heroes',-0.009,1,0,2,1,1,0,0,1.05),(841,'Chae Hyun Woo','SSG Landers',-0.015,7,5,40,10,9,0,1,30.45),(842,'Choi Hyeong-woo','KIA Tigers',-0.017,4,4,27,4,4,0,0,23.2),(843,'Jeon Da-min','Doosan Bears',-0.02,3,0,9,0,0,0,0,9),(844,'Kim Seong-yoon','Samsung Lions',-0.022,1,0,1,0,0,0,0,1),(845,'Right to compensation','Kiwoom Heroes',-0.022,3,2,15,5,5,0,0,10.25),(846,'Won Seong-jun','Kiwoom Heroes',-0.024,4,3,31,8,8,0,0,23.4),(847,'Han Jae-hwan','NC Dinos',-0.028,3,1,9,2,2,0,0,7.1),(848,'Jang Jae-young','Kiwoom Heroes',-0.03,3,0,5,0,0,0,0,5),(849,'Moon Jeong-bin','LG Twins',-0.044,1,1,3,0,0,0,0,3),(850,'Assistant','Doosan Bears',-0.051,24,9,109.2,31,31,0,0,79.75);
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
) ENGINE=InnoDB AUTO_INCREMENT=851 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fielders_RF`
--

LOCK TABLES `fielders_RF` WRITE;
/*!40000 ALTER TABLE `fielders_RF` DISABLE KEYS */;
INSERT INTO `fielders_RF` VALUES (801,'Kim Tae-yeon','Hanwha Eagles',0.296,10,5,47.2,14,13,1,0,33.9),(802,'Jeong Hae-won','KIA Tigers',0.283,7,6,39.1,13,13,0,0,26.75),(803,'Lee Jin-young','Hanwha Eagles',0.271,39,37,282,51,50,1,0,233.55),(804,'Yoon Dong-hee','Lotte Giants',0.261,43,35,326.1,84,81,1,2,246.2),(805,'Heterogeneous','Kiwoom Heroes',0.235,12,6,63.1,17,16,1,0,46.95),(806,'Hyunmin Ahn','KT Wiz',0.235,21,14,128.1,35,30,5,0,94.85),(807,'Lee Seong-gyu','Samsung Lions',0.233,19,12,110,29,27,1,1,82.4),(808,'Jake Cave','Doosan Bears',0.183,48,48,407.1,95,92,2,1,316.8),(809,'Jang Doo-seong','Lotte Giants',0.164,9,6,57,17,16,0,1,40.8),(810,'Lee Won-seok','Hanwha Eagles',0.143,21,4,74.1,17,16,1,0,57.95),(811,'Oh Tae-gon','SSG Landers',0.132,10,6,52.1,13,12,1,0,39.75),(812,'Kim Seong-yoon','Samsung Lions',0.131,14,11,82,21,21,0,0,62.05),(813,'Han Seok-hyun','NC Dinos',0.107,3,1,12.1,4,3,1,0,8.3),(814,'Chae Hyun Woo','SSG Landers',0.104,6,1,21,4,4,0,0,17.2),(815,'McBroom','SSG Landers',0.071,10,10,72,15,15,0,0,57.75),(816,'Song Chan\'s','LG Twins',0.068,17,14,121,25,25,0,0,97.25),(817,'Park Seung-gyu','Samsung Lions',0.063,5,3,29,5,5,0,0,24.25),(818,'Park Jeong-woo','KIA Tigers',0.061,7,1,22.2,5,5,0,0,17.45),(819,'Choi Sung-min','KT Wiz',0.059,14,2,41.1,7,7,0,0,34.45),(820,'An Chi-young','KT Wiz',0.058,3,0,8,2,2,0,0,6.1),(821,'Son Ah-seop','NC Dinos',0.053,30,29,210,43,43,0,0,169.15),(822,'Lee Yu-chan','Doosan Bears',0.052,1,1,8,2,2,0,0,6.1),(823,'Kim Seong-wook','NC Dinos',0.051,2,0,3.1,1,1,0,0,2.15),(824,'Ham Chang-geon','LG Twins',0.048,6,0,12,3,3,0,0,9.15),(825,'Choi Won-young','LG Twins',0.042,9,0,12.1,4,4,0,0,8.3),(826,'Victor Reyes','Lotte Giants',0.01,16,16,121.1,26,25,0,1,96.35),(827,'Lee Min-jae','Hanwha Eagles',0,1,1,5,1,1,0,0,4.05),(828,'Jeon Da-min','Doosan Bears',-0.001,1,0,2,0,0,0,0,2),(829,'Lee Young-bin','LG Twins',-0.001,1,0,1,0,0,0,0,1),(830,'Right to compensation','Kiwoom Heroes',-0.002,2,0,1.2,0,0,0,0,1.2),(831,'Moon Jeong-bin','LG Twins',-0.009,2,1,8,0,0,0,0,8),(832,'Jeong Hyeonseung','SSG Landers',-0.021,1,0,4.2,0,0,0,0,4.2),(833,'Lee Woo-sung','KIA Tigers',-0.022,13,8,85.2,11,11,0,0,74.75),(834,'Jang Jin-hyeok','KT Wiz',-0.035,6,0,11,3,3,0,0,8.15),(835,'Kim Tae-geun','Samsung Lions',-0.035,3,1,11,3,3,0,0,8.15),(836,'Kwon Hee-dong','NC Dinos',-0.038,3,2,7,0,0,0,0,7),(837,'Josejin','Lotte Giants',-0.042,3,1,3,0,0,0,0,3),(838,'Choi Sang-min','SSG Landers',-0.062,14,0,23.2,6,6,0,0,17.5),(839,'Im Jong-chan','Hanwha Eagles',-0.066,13,10,86.1,17,16,0,1,69.9),(840,'Park Kwan Woo','LG Twins',-0.077,1,0,2,1,0,0,1,1),(841,'Jang Jae-young','Kiwoom Heroes',-0.085,2,1,10,0,0,0,0,10),(842,'Lee Sang-hyeok','Hanwha Eagles',-0.086,5,0,12.2,2,2,0,0,10.3),(843,'Kim In-tae','Doosan Bears',-0.088,5,0,6,2,2,0,0,4.1),(844,'Kim Tae-hoon','Samsung Lions',-0.095,1,1,6,0,0,0,0,6),(845,'Won Seong-jun','Kiwoom Heroes',-0.098,4,1,11,2,2,0,0,9.1),(846,'Yoo Jun-gyu','KT Wiz',-0.098,2,2,12,2,2,0,0,10.1),(847,'Genius Hwan','NC Dinos',-0.1,14,4,51,7,6,1,0,44.35),(848,'Moon Sung-joo','LG Twins',-0.113,7,6,53.1,12,11,0,1,41.65),(849,'Choi Jun-woo','SSG Landers',-0.118,3,2,15,5,5,0,0,10.25),(850,'Assistant','Doosan Bears',-0.125,10,3,38,12,12,0,0,26.6);
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
) ENGINE=InnoDB AUTO_INCREMENT=767 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fielders_SS`
--

LOCK TABLES `fielders_SS` WRITE;
/*!40000 ALTER TABLE `fielders_SS` DISABLE KEYS */;
INSERT INTO `fielders_SS` VALUES (721,'Park Sung-han','SSG Landers',0.858,54,52,457.2,261,103,149,9,208.8),(722,'Oh Ji-hwan','LG Twins',0.789,54,44,387.1,180,58,119,3,215.95),(723,'Ha Joo-seok','Hanwha Eagles',0.746,21,18,160.2,68,20,48,0,95.6),(724,'Kim Joo-won','NC Dinos',0.718,53,52,427,237,98,128,11,201.3),(725,'Chan Ho Park','KIA Tigers',0.671,46,45,374,197,76,117,4,186.65),(726,'Lee Jae-hyun','Samsung Lions',0.668,54,54,451,214,83,123,8,247.3),(727,'Sim Woo-jun','Hanwha Eagles',0.374,33,32,261.1,141,50,88,3,127),(728,'Jeon Minjae','Lotte Giants',0.36,35,32,275.1,123,49,68,6,157.95),(729,'Kim Kyu-seong','KIA Tigers',0.31,17,9,96,52,14,35,3,46.45),(730,'Jang Jun-won','KT Wiz',0.256,13,11,94.1,41,18,23,0,55.15),(731,'Oh Myung-jin','Doosan Bears',0.231,16,15,128.1,69,28,39,2,62.45),(732,'Kwon Dong-jin','KT Wiz',0.15,42,33,287,159,62,89,8,135.55),(733,'Lee Do-yoon','Hanwha Eagles',0.147,15,7,86,36,12,22,2,51.7),(734,'Kim Seong-hyeon','SSG Landers',0.125,4,2,19,10,2,8,0,9.5),(735,'Koo Bon-hyeok','LG Twins',0.106,21,13,117,54,15,38,1,65.65),(736,'Park Min-seok','KT Wiz',0.072,7,3,33.1,15,6,8,1,18.8),(737,'Yoon Jun-hyeok','KT Wiz',0.061,3,0,10,3,0,3,0,7.15),(738,'Park Gye-beom','Doosan Bears',0.061,11,5,52,21,8,13,0,32.05),(739,'Hwang Jae-gyun','KT Wiz',0.021,1,0,1,1,0,1,0,0.05),(740,'Anjuhyung','Samsung Lions',0.013,3,0,6,4,1,3,0,2.2),(741,'Park Jun-young','Doosan Bears',0.003,38,34,287,137,54,75,8,156.45),(742,'Kim Jun-sang','Doosan Bears',0.002,1,0,1,0,0,0,0,1),(743,'Yang Do-geun','Samsung Lions',0.001,14,3,50,25,12,12,1,26.2),(744,'Kim Do-young','KIA Tigers',-0.001,1,0,2,0,0,0,0,2),(745,'Kim Hanbyeol','NC Dinos',-0.03,6,1,20,11,4,6,1,9.5),(746,'Song Ji-hoo','Kiwoom Heroes',-0.032,1,0,2,1,1,0,0,1.05),(747,'Lee Yu-chan','Doosan Bears',-0.048,3,2,17,5,4,1,0,12.25),(748,'Jeon Tae-hyun','Kiwoom Heroes',-0.056,3,0,5,2,1,1,0,3.1),(749,'Park Ji Hoon','Doosan Bears',-0.057,5,1,18,8,2,5,1,10.35),(750,'Park Seung-wook','Lotte Giants',-0.074,11,7,58,31,11,18,2,28.45),(751,'Kim Chan-hyung','SSG Landers',-0.077,4,0,5,6,2,3,1,-0.75),(752,'Lee Young-bin','LG Twins',-0.083,2,0,3,0,0,0,0,3),(753,'Yoon Do-hyun','KIA Tigers',-0.085,1,1,9,4,1,2,1,5.15),(754,'Do Tae-hoon','NC Dinos',-0.089,2,0,8.1,5,2,2,1,3.3),(755,'Lee Ho-jun','Lotte Giants',-0.104,27,18,168.1,67,18,44,5,104.2),(756,'Han Tae-yang','Lotte Giants',-0.122,5,1,14,12,5,6,1,2.55),(757,'Lee Jae-sang','Kiwoom Heroes',-0.128,1,1,2,1,0,0,1,1),(758,'Kim Sang-soo','KT Wiz',-0.138,13,11,95.1,48,22,24,2,49.4),(759,'Kim Tae-jin','Kiwoom Heroes',-0.158,32,23,210,87,26,55,6,127.05),(760,'Sang-Hyeon Ahn','SSG Landers',-0.18,6,2,22,4,3,1,0,18.2),(761,'Oh Seon-jin','Kiwoom Heroes',-0.374,26,12,121,51,24,25,2,72.45),(762,'Eojunseo','Kiwoom Heroes',-0.377,34,24,185,90,36,45,9,99.05),(763,'Hong Jong-pyo','KIA Tigers',0,1,0,1,1,0,1,0,0.05),(764,'Lee Seung-hyun','Hanwha Eagles',0,2,0,2,2,2,0,0,0.1),(765,'Park Min','KIA Tigers',0,1,0,1,0,0,0,0,1),(766,'Park Jun-soon','Doosan Bears',0,2,0,2,1,1,0,0,1.05);
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
) ENGINE=InnoDB AUTO_INCREMENT=501 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pitchers`
--

LOCK TABLES `pitchers` WRITE;
/*!40000 ALTER TABLE `pitchers` DISABLE KEYS */;
INSERT INTO `pitchers` VALUES (451,'Cody Ponce','Hanwha Eagles',3.8,12,12,0,0,0,0,8,0,74),(452,'Airel Jurado','Samsung Lions',3.51,12,12,0,1,1,0,5,4,71.6),(453,'Chan-gyu Lim','LG Twins',3.15,11,11,0,1,1,1,8,1,66),(454,'James Naile','KIA Tigers',3.11,12,12,0,0,0,0,3,1,61.1),(455,'Tucker Davidson','Lotte Giants',3.1,12,12,0,0,0,0,6,1,65.5),(456,'Won Tae-in','Samsung Lions',2.87,11,11,0,0,0,0,4,2,59.7),(457,'Drew Anderson','SSG Landers',2.71,11,11,0,0,0,0,4,2,58.1),(458,'Yonny Chirinos','LG Twins',2.65,12,12,0,0,0,0,6,2,62.5),(459,'Ryan Weiss','Hanwha Eagles',2.56,12,12,0,0,0,0,7,2,63.1),(460,'Small Jun','KT Wiz',2.55,10,10,0,0,0,0,4,2,54.5),(461,'Oh Won-seok','KT Wiz',2.45,11,11,0,0,0,0,7,2,60),(462,'Ryu Hyun-jin','Hanwha Eagles',2.41,12,12,0,0,0,0,5,2,58.6),(463,'Zach Logue','Doosan Bears',2.39,12,12,0,0,0,0,3,5,59.9),(464,'Park Se-woong','Lotte Giants',2.28,12,12,0,0,0,0,8,3,63.3),(465,'Song Seung-gi','LG Twins',2.16,10,10,0,0,0,0,5,3,53.6),(466,'Go Young-pyo','KT Wiz',2.04,11,11,0,1,1,1,4,4,53.4),(467,'Adam Oller','KIA Tigers',2.03,11,11,0,0,0,0,5,2,52.8),(468,'Riley Thompson','NC Dinos',2,12,12,0,0,0,0,7,3,59),(469,'Mitch White','SSG Landers',1.78,8,8,0,0,0,0,4,1,41.3),(470,'Kenny Rosenberg','Kiwoom Heroes',1.72,12,12,0,0,0,0,4,4,53.2),(471,'Kim Seo-hyun','Hanwha Eagles',1.64,29,0,29,22,0,0,1,1,-2.6),(472,'Son Dong-hyun','KT Wiz',1.6,29,0,29,4,0,0,3,0,16.5),(473,'Jo Byeong-Hyeon','SSG Landers',1.57,25,0,25,19,0,0,4,1,4.2),(474,'Baek Jeong-hyeon','Samsung Lions',1.45,28,1,27,8,0,0,2,0,11.5),(475,'Kim Kwang Hyun','SSG Landers',1.43,12,12,0,0,0,0,3,6,51.8),(476,'Moon Seung-won','SSG Landers',1.42,9,9,0,0,0,0,3,2,39.7),(477,'Son Joo-young','LG Twins',1.41,11,11,0,0,0,0,6,3,49.6),(478,'Cole Irvin','Doosan Bears',1.4,12,12,0,0,0,0,5,5,53),(479,'Logan Allen','NC Dinos',1.37,12,12,0,0,0,0,2,6,49.7),(480,'Kim Tae-hoon','Samsung Lions',1.36,28,0,28,3,0,0,1,1,13.6),(481,'Kim Do-hyun','KIA Tigers',1.36,11,11,0,0,0,0,2,3,43.1),(482,'Kim Won-joong','Lotte Giants',1.34,23,0,23,19,0,0,2,0,-2.6),(483,'Moon Dong-ju','Hanwha Eagles',1.34,10,10,0,1,1,0,5,2,42.9),(484,'Enmanuel De Jesus','KT Wiz',1.34,11,11,0,0,0,0,4,4,47.4),(485,'Denyi Reyes','Samsung Lions',1.34,8,8,0,0,0,0,4,3,39.9),(486,'Park Young-hyun','KT Wiz',1.3,29,0,29,25,0,0,1,2,-7.5),(487,'Beneficial','SSG Landers',1.22,29,0,29,2,0,0,2,2,16.2),(488,'Shin Min-hyuk','NC Dinos',1.17,10,10,0,0,0,0,2,3,39.2),(489,'Choi Seung-yong','Doosan Bears',1.15,10,10,0,0,0,0,3,2,39),(490,'Noh Kyung-eun','SSG Landers',1.06,30,0,30,3,0,0,0,2,10.6),(491,'Won Sang-hyun','KT Wiz',0.96,27,0,27,1,0,0,0,1,10.1),(492,'Park Sang-won','Hanwha Eagles',0.91,31,0,31,1,0,0,3,2,15.6),(493,'Jo Dong Wook','Hanwha Eagles',0.9,24,0,24,5,0,0,0,0,4),(494,'Jeong Hae-young','KIA Tigers',0.86,24,0,24,22,0,0,1,2,-8.9),(495,'Choi Won-tae','Samsung Lions',0.84,10,10,0,0,0,0,4,2,37.4),(496,'Son Joo-hwan','NC Dinos',0.83,26,0,26,4,0,0,4,1,11.8),(497,'Kim Jin-seong','LG Twins',0.83,31,0,31,2,0,0,1,2,10.8),(498,'Woo Kyu-min','KT Wiz',0.83,23,0,23,5,0,0,1,1,6.3),(499,'Nakyun-an','Lotte Giants',0.81,11,11,0,0,0,0,0,3,34.6),(500,'Jeong Cheol-won','Lotte Giants',0.81,30,0,30,2,0,0,4,1,13.6);
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

-- Dump completed on 2025-06-01 18:55:23
