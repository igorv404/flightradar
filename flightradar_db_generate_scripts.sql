CREATE DATABASE  IF NOT EXISTS `flightradar404` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `flightradar404`;

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
-- Table structure for table `airport`
--

DROP TABLE IF EXISTS `airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airport` (
  `id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `city_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_airport_city1_idx` (`city_id`),
  CONSTRAINT `fk_airport_city1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airport`
--

LOCK TABLES `airport` WRITE;
/*!40000 ALTER TABLE `airport` DISABLE KEYS */;
INSERT INTO `airport` VALUES (9,'Josep Tarradellas Barcelona-El Prat',7),(10,'Oostende-Brugge',1),(11,'Cologne Bonn',4),(12,'Kraków',6),(13,'London International',2),(14,'Danylo Halytskiy',8),(15,'Malpensa',5),(16,'Paris Charles de Gaulle',3);
/*!40000 ALTER TABLE `airport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `country_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_city_country1_idx` (`country_name`),
  CONSTRAINT `fk_city_country1` FOREIGN KEY (`country_name`) REFERENCES `country` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Brugge','Belgium'),(2,'London','England'),(3,'Paris','France'),(4,'Keln','Germany'),(5,'Milan','Italy'),(6,'Krakiv','Poland'),(7,'Barcelona','Spain'),(8,'Lviv','Ukraine');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `name` varchar(45) NOT NULL,
  `country_name` varchar(45) NOT NULL,
  `count_of_plane` int NOT NULL,
  PRIMARY KEY (`name`),
  KEY `fk_company_country1_idx` (`country_name`),
  CONSTRAINT `fk_company_country1` FOREIGN KEY (`country_name`) REFERENCES `country` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES ('Air France','France',346),('Emirates','Belgium',142),('Eva Air','Italy',234),('Hainan','Spain',99),('MAU','Ukraine',455),('Qatar','USA',347);
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES ('Belgium'),('Canada'),('England'),('France'),('Germany'),('Italy'),('Poland'),('Spain'),('Ukraine'),('USA');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight`
--

DROP TABLE IF EXISTS `flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight` (
  `id` int NOT NULL,
  `pilot_id` int NOT NULL,
  `plane_id` int NOT NULL,
  `start_terminal` int NOT NULL,
  `end_terminal` int NOT NULL,
  `data` date NOT NULL,
  `time` time NOT NULL,
  `price` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_flight_pilot_idx` (`pilot_id`),
  KEY `fk_flight_plane1_idx` (`plane_id`),
  KEY `fk_flight_terminal1_idx` (`start_terminal`),
  KEY `fk_flight_terminal2_idx` (`end_terminal`),
  CONSTRAINT `fk_flight_pilot` FOREIGN KEY (`pilot_id`) REFERENCES `pilot` (`id`),
  CONSTRAINT `fk_flight_plane1` FOREIGN KEY (`plane_id`) REFERENCES `plane` (`id`),
  CONSTRAINT `fk_flight_terminal1` FOREIGN KEY (`start_terminal`) REFERENCES `terminal` (`id`),
  CONSTRAINT `fk_flight_terminal2` FOREIGN KEY (`end_terminal`) REFERENCES `terminal` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight`
--

LOCK TABLES `flight` WRITE;
/*!40000 ALTER TABLE `flight` DISABLE KEYS */;
INSERT INTO `flight` VALUES (46,41,31,22,19,'2022-09-10','16:00:00',69),(47,37,35,17,26,'2022-08-25','01:30:00',189),(48,42,28,24,25,'2022-09-25','21:15:00',42),(49,44,30,26,20,'2022-10-01','09:45:00',99),(50,45,29,18,25,'2022-10-05','06:10:00',25),(51,42,36,19,23,'2022-11-18','17:30:00',169);
/*!40000 ALTER TABLE `flight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model`
--

DROP TABLE IF EXISTS `model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model` (
  `name` varchar(45) NOT NULL,
  `length` float NOT NULL,
  `wingspan` float NOT NULL,
  `count_of_seats` int NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model`
--

LOCK TABLES `model` WRITE;
/*!40000 ALTER TABLE `model` DISABLE KEYS */;
INSERT INTO `model` VALUES ('Airbus A320',38.9,34.2,180),('Airbus A350',66,64.6,450),('Airbus A380',73.1,80.9,853),('Boeing 737',40,34.7,189),('Boeing 747',71.5,64,366),('Boeing 777',63,64.8,388),('Boeing 787',57.3,60.7,248),('Cessna 525C',16,14.3,9);
/*!40000 ALTER TABLE `model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pilot`
--

DROP TABLE IF EXISTS `pilot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pilot` (
  `id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `age` int NOT NULL,
  `flight_experience` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pilot`
--

LOCK TABLES `pilot` WRITE;
/*!40000 ALTER TABLE `pilot` DISABLE KEYS */;
INSERT INTO `pilot` VALUES (37,'Stepan','Borshch',44,15879),(38,'Alex','Koval',37,9767),(39,'Bogdan','Varenyk',29,1679),(40,'Marko','Kich',31,2666),(41,'Yuriy','Hek',56,34128),(42,'Taras','Kos',33,3107),(43,'Valeriy','Plushch',59,39891),(44,'Oleg','Puhach',38,10611),(45,'Semen','Kos',26,1501),(46,'Maksum','Vovk',47,19510);
/*!40000 ALTER TABLE `pilot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plane`
--

DROP TABLE IF EXISTS `plane`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plane` (
  `id` int NOT NULL,
  `model_name` varchar(45) NOT NULL,
  `company_name` varchar(45) NOT NULL,
  `speed` float NOT NULL,
  `flight_time` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_plane_model1_idx` (`model_name`),
  KEY `fk_plane_company1_idx` (`company_name`),
  CONSTRAINT `fk_plane_company1` FOREIGN KEY (`company_name`) REFERENCES `company` (`name`),
  CONSTRAINT `fk_plane_model1` FOREIGN KEY (`model_name`) REFERENCES `model` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plane`
--

LOCK TABLES `plane` WRITE;
/*!40000 ALTER TABLE `plane` DISABLE KEYS */;
INSERT INTO `plane` VALUES (27,'Boeing 737','MAU',777,8),(28,'Airbus A380','MAU',434,3),(29,'Boeing 737','Eva Air',879,12),(30,'Cessna 525C','Hainan',342,7),(31,'Boeing 777','Air France',111,1),(32,'Airbus A320','Emirates',455,7),(33,'Airbus A320','MAU',397,4),(34,'Boeing 787','Air France',667,9),(35,'Boeing 787','Eva Air',99,1),(36,'Airbus A380','Emirates',544,6);
/*!40000 ALTER TABLE `plane` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terminal`
--

DROP TABLE IF EXISTS `terminal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terminal` (
  `id` int NOT NULL,
  `number` int NOT NULL,
  `airport_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_terminal_airport1_idx` (`airport_id`),
  CONSTRAINT `fk_terminal_airport1` FOREIGN KEY (`airport_id`) REFERENCES `airport` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terminal`
--

LOCK TABLES `terminal` WRITE;
/*!40000 ALTER TABLE `terminal` DISABLE KEYS */;
INSERT INTO `terminal` VALUES (17,3,9),(18,8,12),(19,4,15),(20,2,10),(21,2,16),(22,1,11),(23,10,14),(24,4,9),(25,2,15),(26,7,16);
/*!40000 ALTER TABLE `terminal` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
