-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: canigou
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adherent`
--

DROP TABLE IF EXISTS `adherent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `adherent` (
  `codeAdherent` int(11) NOT NULL,
  `nomAdherent` varchar(45) DEFAULT NULL,
  `prenomAdherent` varchar(45) DEFAULT NULL,
  `dateNaissance` date DEFAULT NULL,
  PRIMARY KEY (`codeAdherent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adherent`
--

LOCK TABLES `adherent` WRITE;
/*!40000 ALTER TABLE `adherent` DISABLE KEYS */;
/*!40000 ALTER TABLE `adherent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `annee`
--

DROP TABLE IF EXISTS `annee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `annee` (
  `annee` year(4) NOT NULL,
  `pxCotisationAd` float DEFAULT NULL,
  `pxCotisationMineur` float DEFAULT NULL,
  PRIMARY KEY (`annee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `annee`
--

LOCK TABLES `annee` WRITE;
/*!40000 ALTER TABLE `annee` DISABLE KEYS */;
/*!40000 ALTER TABLE `annee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cotisation`
--

DROP TABLE IF EXISTS `cotisation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cotisation` (
  `codeAdherent` int(11) NOT NULL,
  `annee` year(4) NOT NULL,
  KEY `codeAdherent_idx` (`codeAdherent`),
  KEY `annee_idx` (`annee`),
  CONSTRAINT `annee` FOREIGN KEY (`annee`) REFERENCES `annee` (`annee`),
  CONSTRAINT `codeAdherent` FOREIGN KEY (`codeAdherent`) REFERENCES `adherent` (`codeadherent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cotisation`
--

LOCK TABLES `cotisation` WRITE;
/*!40000 ALTER TABLE `cotisation` DISABLE KEYS */;
/*!40000 ALTER TABLE `cotisation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lieu`
--

DROP TABLE IF EXISTS `lieu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lieu` (
  `lieu` varchar(45) NOT NULL,
  PRIMARY KEY (`lieu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lieu`
--

LOCK TABLES `lieu` WRITE;
/*!40000 ALTER TABLE `lieu` DISABLE KEYS */;
/*!40000 ALTER TABLE `lieu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marche`
--

DROP TABLE IF EXISTS `marche`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `marche` (
  `codeMarche` int(11) NOT NULL,
  `dateMarche` date DEFAULT NULL,
  `lieu` varchar(45) DEFAULT NULL,
  `difficulte` enum('facile','moyen','difficile','competition') DEFAULT NULL,
  PRIMARY KEY (`codeMarche`),
  KEY `lieu_idx` (`lieu`),
  CONSTRAINT `lieu` FOREIGN KEY (`lieu`) REFERENCES `lieu` (`lieu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marche`
--

LOCK TABLES `marche` WRITE;
/*!40000 ALTER TABLE `marche` DISABLE KEYS */;
/*!40000 ALTER TABLE `marche` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realisation`
--

DROP TABLE IF EXISTS `realisation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `realisation` (
  `codeAdherent` int(11) NOT NULL,
  `codeMarche` int(11) NOT NULL,
  KEY `codeAdherent_idx` (`codeAdherent`),
  KEY `codeMarche_idx` (`codeMarche`),
  CONSTRAINT `fkRealisationCodeAdherent` FOREIGN KEY (`codeAdherent`) REFERENCES `adherent` (`codeadherent`),
  CONSTRAINT `fkRealisationCodeMarche` FOREIGN KEY (`codeMarche`) REFERENCES `marche` (`codemarche`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realisation`
--

LOCK TABLES `realisation` WRITE;
/*!40000 ALTER TABLE `realisation` DISABLE KEYS */;
/*!40000 ALTER TABLE `realisation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-04 14:29:39
