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
-- Table structure for table `storicoiscrizioni`
--

DROP TABLE IF EXISTS `storicoiscrizioni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storicoiscrizioni` (
  `IDClasse` varchar(255) NOT NULL,
  `CFAlunno` varchar(17) NOT NULL,
  `AnnoScolastico` int NOT NULL,
  `Data` date DEFAULT NULL,
  PRIMARY KEY (`IDClasse`,`CFAlunno`,`AnnoScolastico`),
  KEY `storicoiscrizioni_ibfk_1` (`CFAlunno`),
  CONSTRAINT `storicoiscrizioni_ibfk_1` FOREIGN KEY (`CFAlunno`) REFERENCES `alunno` (`cf`),
  CONSTRAINT `storicoiscrizioni_ibfk_2` FOREIGN KEY (`IDClasse`) REFERENCES `classe` (`IDClasse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storicoiscrizioni`
--

LOCK TABLES `storicoiscrizioni` WRITE;
/*!40000 ALTER TABLE `storicoiscrizioni` DISABLE KEYS */;
INSERT INTO `storicoiscrizioni` VALUES ('C1','CF10',2005,'2020-08-08'),('C1','CF11',2005,'2020-08-08'),('C1','CF12',2005,'2020-08-08'),('C1','CF13',2005,'2020-08-08'),('C1','CF2',2005,NULL),('C1','CF3',2005,'2020-08-08'),('C1','CF4',2005,'2020-08-08'),('C1','CF5',2005,'2020-08-08'),('C1','CF6',2005,'2020-08-08'),('C1','CF7',2005,'2020-08-08'),('C1','CF8',2005,'2020-08-08'),('C1','CF9',2005,'2020-08-08'),('C2','CF15',2005,NULL),('C2','CF16',2005,NULL),('C2','CF17',2005,NULL),('C2','CF18',2005,NULL),('C2','CF19',2005,NULL),('C2','CF20',2005,NULL),('C2','CF21',2005,NULL),('C2','CF22',2005,NULL),('C2','CF23',2005,NULL),('C2','CF24',2005,NULL),('C2','CF25',2005,NULL),('C2','CF26',2005,NULL),('C2','CF27',2005,NULL),('C2','CF28',2005,NULL),('C2','CF29',2005,NULL),('C2','CF30',2005,NULL),('C2','CF31',2005,NULL),('C2','CF32',2005,NULL),('C2','CF33',2005,NULL),('C2','CF34',2005,NULL),('C2','CF35',2005,NULL),('C2','CF36',2005,NULL),('C2','CF37',2005,NULL),('C2','CF38',2005,NULL),('C2','CF40',2006,NULL);
/*!40000 ALTER TABLE `storicoiscrizioni` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `nonpermetto` BEFORE INSERT ON `storicoiscrizioni` FOR EACH ROW BEGIN
	
	IF (SELECT count(*) FROM storicoiscrizioni WHERE AnnoScolastico = new.AnnoScolastico AND IDClasse = new.IDClasse) = (SELECT Capienza FROM aula, associata WHERE associata.IDClasse = new.IDClasse AND aula.ID = associata.IDAula GROUP BY IDAula)
         THEN
			 SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "TROPPI ALUNNI, STAI A CASEDA!";
	end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `numer` BEFORE INSERT ON `storicoiscrizioni` FOR EACH ROW BEGIN
	     
     IF (SELECT count(*) FROM storicoiscrizioni WHERE AnnoScolastico = new.AnnoScolastico)>=25
		 THEN
			UPDATE associata SET numerosa=true WHERE associata.IDClasse = new.IDClasse AND associata.AnnoScolastico = new.AnnoScolastico;
	end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `nonumer` BEFORE DELETE ON `storicoiscrizioni` FOR EACH ROW BEGIN
	DECLARE conta int;
    SELECT count(*) INTO conta FROM storicoiscrizioni WHERE AnnoScolastico = old.AnnoScolastico;
    
     IF conta<=25
		 THEN
			 UPDATE associata SET numerosa = FALSE WHERE associata.IDClasse = old.IDClasse AND associata.AnnoScolastico = old.AnnoScolastico;
	end if;
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

-- Dump completed on 2023-05-10 22:31:34
