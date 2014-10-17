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
-- Table structure for table `MARKET`
--

DROP TABLE IF EXISTS `MARKET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MARKET` (
  `ID` int(11) NOT NULL,
  `LOCATION` varchar(8) DEFAULT NULL,
  `STATUS` char(1) DEFAULT NULL,
  `MANAGER` char(8) DEFAULT NULL,
  `TRADE_NUM` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `MANAGER` (`MANAGER`),
  CONSTRAINT `MARKET_ibfk_1` FOREIGN KEY (`MANAGER`) REFERENCES `USER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MARKET`
--

LOCK TABLES `MARKET` WRITE;
/*!40000 ALTER TABLE `MARKET` DISABLE KEYS */;
INSERT INTO `MARKET` VALUES (1,'서울','O','a1',5),(2,'부산','C','A2',3),(3,'경주','O','A3',1);
/*!40000 ALTER TABLE `MARKET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TRADE`
--

DROP TABLE IF EXISTS `TRADE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TRADE` (
  `TNUM` int(11) NOT NULL AUTO_INCREMENT,
  `SELLER` char(8) DEFAULT NULL,
  `ITEM_NAME` varchar(16) DEFAULT NULL,
  `MARKETID` int(11) DEFAULT NULL,
  PRIMARY KEY (`TNUM`),
  KEY `SELLER` (`SELLER`),
  KEY `MARKETID` (`MARKETID`),
  CONSTRAINT `TRADE_ibfk_2` FOREIGN KEY (`MARKETID`) REFERENCES `MARKET` (`ID`),
  CONSTRAINT `TRADE_ibfk_1` FOREIGN KEY (`SELLER`) REFERENCES `USER` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TRADE`
--

LOCK TABLES `TRADE` WRITE;
/*!40000 ALTER TABLE `TRADE` DISABLE KEYS */;
INSERT INTO `TRADE` VALUES (6,'a1','디아3',1),(7,'a2','마우스',1),(8,'a3','사과',2),(9,'a4','맥주',1),(10,'a3','고양이',1),(11,NULL,'여자친구',1),(12,'a2','크롱',2),(13,'a2','크롱',2),(14,'a3','불국사',3);
/*!40000 ALTER TABLE `TRADE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER`
--

DROP TABLE IF EXISTS `USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER` (
  `ID` char(8) NOT NULL,
  `NAME` varchar(16) DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL,
  `MONEY` decimal(10,0) DEFAULT NULL,
  `TRADE_NUM` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER`
--

LOCK TABLES `USER` WRITE;
/*!40000 ALTER TABLE `USER` DISABLE KEYS */;
INSERT INTO `USER` VALUES ('a1','이인재','2013-08-02 01:18:00',60626050,1),('a2','양지웅','2013-11-09 18:26:00',1777178,3),('a3','장택순','2013-09-01 19:38:00',22266053,3),('a4','정희수','2013-09-27 16:09:00',1648837,1),('a5','채종운','2013-03-20 03:44:00',13483671,0);
/*!40000 ALTER TABLE `USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'popidb'
--
/*!50003 DROP PROCEDURE IF EXISTS `ADD_TRADE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`popi`@`%` PROCEDURE `ADD_TRADE`(IN seller CHAR(8), 
	IN  item varchar(16), 
	IN	market int)
BEGIN
	INSERT INTO TRADE (SELLER, ITEM_NAME, MARKETID) values (seller, item, market);
	UPDATE USER SET TRADE_NUM = TRADE_NUM +1 WHERE ID = seller;
	UPDATE MARKET SET TRADE_NUM = TRADE_NUM +1 WHERE ID = market;
END ;;
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

-- Dump completed on 2014-05-01 17:06:21
