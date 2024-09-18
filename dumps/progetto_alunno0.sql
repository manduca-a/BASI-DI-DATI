-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: progetto
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
-- Table structure for table `alunno`
--

DROP TABLE IF EXISTS `alunno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alunno` (
  `cf` varchar(17) NOT NULL,
  `nome` varchar(20) DEFAULT NULL,
  `cognome` varchar(30) DEFAULT NULL,
  `data_Nascita` date DEFAULT NULL,
  `sostegno` binary(1) DEFAULT NULL,
  PRIMARY KEY (`cf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alunno`
--

LOCK TABLES `alunno` WRITE;
/*!40000 ALTER TABLE `alunno` DISABLE KEYS */;
INSERT INTO `alunno` VALUES ('A','A','A2','2000-08-08',_binary '0'),('B','A','A2','2000-08-08',_binary '0'),('C','A','A2','2000-08-08',_binary '0'),('CF10','A','A1',NULL,_binary '0'),('CF11','A','A1',NULL,_binary '0'),('CF12','A','A1',NULL,_binary '0'),('CF13','A','A1',NULL,_binary '0'),('CF14','A','A1',NULL,_binary '0'),('CF15','A','A1',NULL,_binary '0'),('CF16','A','A1',NULL,_binary '0'),('CF17','B','B1',NULL,_binary '1'),('CF18','B','B1',NULL,_binary '1'),('CF19','B','B1',NULL,_binary '1'),('CF2','A','A2',NULL,_binary '0'),('CF20','B','B1',NULL,_binary '1'),('CF21','B','B1',NULL,_binary '1'),('CF22','B','B1',NULL,_binary '1'),('CF23','B','B1',NULL,_binary '1'),('CF24','B','B1',NULL,_binary '1'),('CF25','B','B1',NULL,_binary '1'),('CF26','B','B1',NULL,_binary '1'),('CF27','B','B1',NULL,_binary '1'),('CF28','B','B1',NULL,_binary '1'),('CF29','B','B1',NULL,_binary '1'),('CF3','A','A1',NULL,_binary '0'),('CF30','B','B1',NULL,_binary '1'),('CF31','B','B1',NULL,_binary '1'),('CF32','B','B1',NULL,_binary '1'),('CF33','B','B1',NULL,_binary '1'),('CF34','B','B1',NULL,_binary '1'),('CF35','B','B1',NULL,_binary '1'),('CF36','B','B1',NULL,_binary '1'),('CF37','B','B1',NULL,_binary '1'),('CF38','B','B1',NULL,_binary '1'),('CF39','B','B1',NULL,_binary '1'),('CF4','A','A1',NULL,_binary '0'),('CF40','B','B1',NULL,_binary '1'),('CF5','A','A1',NULL,_binary '0'),('CF6','A','A1',NULL,_binary '0'),('CF7','A','A1',NULL,_binary '0'),('CF8','A','A1',NULL,_binary '0'),('CF9','A','A1',NULL,_binary '0'),('D','A','A2','2000-08-08',_binary '0'),('E','A','A2','2000-08-08',_binary '0'),('G','A','A2','2000-08-08',_binary '0'),('H','A','A2','2000-08-08',_binary '0'),('I','A','A2','2000-08-08',_binary '0'),('J','A','A2','2000-08-08',_binary '0'),('K','A','A2','2000-08-08',_binary '0'),('L','A','A2','2000-08-08',_binary '0'),('M','A','A2','2000-08-08',_binary '0'),('N','A','A2','2000-08-08',_binary '0'),('O','A','A2','2000-08-08',_binary '0');
/*!40000 ALTER TABLE `alunno` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `falso` AFTER INSERT ON `alunno` FOR EACH ROW BEGIN
	IF new.sostegno = null
		THEN 
			UPDATE alunno SET sostegno=FALSE;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-10 22:31:35
