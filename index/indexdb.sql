-- MySQL dump 10.13  Distrib 5.6.16, for Win64 (x86_64)
--
-- Host: localhost    Database: indexdb
-- ------------------------------------------------------
-- Server version	5.6.16

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `ID` char(16) NOT NULL,
  `NAME` varchar(16) DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL,
  `MONEY` decimal(10,0) DEFAULT NULL,
  `CHOO` char(8) DEFAULT NULL,
  `TRADE_NUM` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `CHOO` (`CHOO`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`CHOO`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;