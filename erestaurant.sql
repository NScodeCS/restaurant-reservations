-- MySQL dump 10.13  Distrib 5.1.57, for Win32 (ia32)
--
-- Host: localhost    Database: erestaurant
-- ------------------------------------------------------
-- Server version	5.1.57-community

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
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restaurant` (
  `restaurantid` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  `address` text,
  `phno` bigint(20) DEFAULT NULL,
  `nooftables` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`restaurantid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (1,'Sara','nicosia.',7878798980,5,'approved'),(2,'Dolphine','larnaka',9845543565,3,'approved'),(3,'aran','lemesos.',8888986879,5,'approved');
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restauranttable`
--

DROP TABLE IF EXISTS `restauranttable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restauranttable` (
  `recid` bigint(20) NOT NULL AUTO_INCREMENT,
  `restaurantid` int(11) DEFAULT NULL,
  `tableno` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `userid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`recid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restauranttable`
--

LOCK TABLES `restauranttable` WRITE;
/*!40000 ALTER TABLE `restauranttable` DISABLE KEYS */;
INSERT INTO `restauranttable` VALUES (1,2,1,'unbooked',NULL),(2,2,2,'unbooked',NULL),(3,2,3,'unbooked',NULL),(4,3,1,'unbooked',NULL),(5,3,2,'unbooked',NULL),(6,3,3,'unbooked',NULL),(7,3,4,'unbooked',NULL),(8,3,5,'unbooked',NULL),(9,1,1,'unbooked',NULL),(10,1,2,'unbooked',NULL),(11,1,3,'unbooked',NULL),(12,1,4,'unbooked',NULL),(13,1,5,'unbooked',NULL);
/*!40000 ALTER TABLE `restauranttable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tablebooking`
--

DROP TABLE IF EXISTS `tablebooking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tablebooking` (
  `bookingid` bigint(20) NOT NULL AUTO_INCREMENT,
  `restaurantid` int(11) DEFAULT NULL,
  `tableno` int(11) DEFAULT NULL,
  `bookingdate` date DEFAULT NULL,
  `bookingtime` time DEFAULT NULL,
  `userid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bookingid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tablebooking`
--

LOCK TABLES `tablebooking` WRITE;
/*!40000 ALTER TABLE `tablebooking` DISABLE KEYS */;
INSERT INTO `tablebooking` VALUES (1,1,3,'2018-06-03','20:00:00','John123'),(2,1,5,'2018-06-03','20:00:00','John123'),(3,1,4,'2018-06-03','18:00:00','John123'),(4,1,1,'2018-06-03','22:00:00','john');
/*!40000 ALTER TABLE `tablebooking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` text,
  `address` text,
  `phno` bigint(20) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'John','Nicosia.',8909876786,'John123','jo123','user'),(2,'Paul','nicosia.',909098789,'Paulraj','paul333','user'),(3,'Kannan','pafos.',7890987690,'Kannan','kannan007','rm'),(4,'nagi','Kerynia.',7689987898,'john','jo12','user');
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

-- Dump completed on 2018-05-30 17:34:10
