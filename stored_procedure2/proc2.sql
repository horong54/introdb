-- MySQL dump 10.13  Distrib 5.5.37, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: popidb
-- ------------------------------------------------------
-- Server version	5.5.37-0ubuntu0.12.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `market`
--

DROP TABLE IF EXISTS `market`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `market` (
  `ID` int(11) NOT NULL,
  `LOCATION` varchar(8) DEFAULT NULL,
  `STATUS` char(1) DEFAULT NULL,
  `MANAGER` char(8) DEFAULT NULL,
  `trade_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `MANAGER` (`MANAGER`),
  CONSTRAINT `market_ibfk_1` FOREIGN KEY (`MANAGER`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market`
--

LOCK TABLES `market` WRITE;
/*!40000 ALTER TABLE `market` DISABLE KEYS */;
INSERT INTO `market` VALUES (1,'서울','O','a1',NULL),(2,'부산','C','A2',NULL),(3,'경주','O','A3',NULL);
/*!40000 ALTER TABLE `market` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trade`
--

DROP TABLE IF EXISTS `trade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trade` (
  `TNUM` int(11) NOT NULL AUTO_INCREMENT,
  `SELLER` char(8) DEFAULT NULL,
  `ITEM_NAME` varchar(16) DEFAULT NULL,
  `MARKETID` int(11) DEFAULT NULL,
  PRIMARY KEY (`TNUM`),
  KEY `SELLER` (`SELLER`),
  KEY `MARKETID` (`MARKETID`),
  CONSTRAINT `trade_ibfk_2` FOREIGN KEY (`MARKETID`) REFERENCES `market` (`ID`),
  CONSTRAINT `trade_ibfk_1` FOREIGN KEY (`SELLER`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trade`
--

LOCK TABLES `trade` WRITE;
/*!40000 ALTER TABLE `trade` DISABLE KEYS */;
INSERT INTO `trade` VALUES (6,'a1','디아3',1),(7,'a2','마우스',1),(8,'a3','사과',2),(9,'a4','맥주',1),(10,'a3','고양이',1),(11,NULL,'여자친구',1);
/*!40000 ALTER TABLE `trade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `ID` char(8) NOT NULL,
  `NAME` varchar(16) DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL,
  `MONEY` decimal(10,0) DEFAULT NULL,
  `trade_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('a1','이인재','2013-08-02 01:18:00',60626050,NULL),('a2','양지웅','2013-11-09 18:26:00',1777178,NULL),('a3','장택순','2013-09-01 19:38:00',22266053,NULL),('a4','정희수','2013-09-27 16:09:00',1648837,NULL),('a5','채종운','2013-03-20 03:44:00',13483671,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-05-01 15:59:48
