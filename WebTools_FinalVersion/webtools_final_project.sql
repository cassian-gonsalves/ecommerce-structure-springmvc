-- MySQL dump 10.13  Distrib 8.0.12, for macos10.13 (x86_64)
--
-- Host: localhost    Database: webtools_final_project
-- ------------------------------------------------------
-- Server version	8.0.12

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
-- Table structure for table `WT_address`
--

DROP TABLE IF EXISTS `WT_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `WT_address` (
  `addressId` int(11) NOT NULL AUTO_INCREMENT,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zipCode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`addressId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WT_address`
--

LOCK TABLES `WT_address` WRITE;
/*!40000 ALTER TABLE `WT_address` DISABLE KEYS */;
INSERT INTO `WT_address` VALUES (1,'26A Saint Alphonsus Street','Boston Mas','Bos','USA','Mas','2120'),(2,'14 Fulton Drive','Boston, Mas','Boston','Usa','Massachusetts','390239'),(3,'15 Mass Ave','Boston Mas','Boston','USA','Mas','029384'),(4,'21 North Carolina','North Carolina','Carolina','Usa','North Carolina','012930'),(5,'12 granide street','Mas Bos','Boston','USA','Massachusetts','021202');
/*!40000 ALTER TABLE `WT_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WT_admin`
--

DROP TABLE IF EXISTS `WT_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `WT_admin` (
  `adminId` int(11) NOT NULL,
  PRIMARY KEY (`adminId`),
  CONSTRAINT `FKfspnguhuxfjv222d5ut9qoyjy` FOREIGN KEY (`adminId`) REFERENCES `wt_person` (`personid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WT_admin`
--

LOCK TABLES `WT_admin` WRITE;
/*!40000 ALTER TABLE `WT_admin` DISABLE KEYS */;
INSERT INTO `WT_admin` VALUES (1);
/*!40000 ALTER TABLE `WT_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WT_customer`
--

DROP TABLE IF EXISTS `WT_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `WT_customer` (
  `customerId` int(11) NOT NULL,
  PRIMARY KEY (`customerId`),
  CONSTRAINT `FKklb2b2bmw9859f94ucb1hue59` FOREIGN KEY (`customerId`) REFERENCES `wt_person` (`personid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WT_customer`
--

LOCK TABLES `WT_customer` WRITE;
/*!40000 ALTER TABLE `WT_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `WT_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WT_order`
--

DROP TABLE IF EXISTS `WT_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `WT_order` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(255) DEFAULT NULL,
  `adminId` int(11) DEFAULT NULL,
  `customerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderId`),
  KEY `FKrd2xrvxojhn5wqxqbm8831bov` (`adminId`),
  KEY `FKp9sa0lx2bq3fmcfiba43q0lbx` (`customerId`),
  CONSTRAINT `FKp9sa0lx2bq3fmcfiba43q0lbx` FOREIGN KEY (`customerId`) REFERENCES `wt_customer` (`customerid`),
  CONSTRAINT `FKrd2xrvxojhn5wqxqbm8831bov` FOREIGN KEY (`adminId`) REFERENCES `wt_admin` (`adminid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WT_order`
--

LOCK TABLES `WT_order` WRITE;
/*!40000 ALTER TABLE `WT_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `WT_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WT_orderItem`
--

DROP TABLE IF EXISTS `WT_orderItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `WT_orderItem` (
  `orderItemId` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) DEFAULT NULL,
  `orderId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderItemId`),
  KEY `FK7rm288r9mxc4nlfis71iyhpgw` (`orderId`),
  KEY `FK47hir86w71gm5pd7jbu4tl3rd` (`productId`),
  CONSTRAINT `FK47hir86w71gm5pd7jbu4tl3rd` FOREIGN KEY (`productId`) REFERENCES `wt_product` (`productid`),
  CONSTRAINT `FK7rm288r9mxc4nlfis71iyhpgw` FOREIGN KEY (`orderId`) REFERENCES `wt_order` (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WT_orderItem`
--

LOCK TABLES `WT_orderItem` WRITE;
/*!40000 ALTER TABLE `WT_orderItem` DISABLE KEYS */;
/*!40000 ALTER TABLE `WT_orderItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WT_person`
--

DROP TABLE IF EXISTS `WT_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `WT_person` (
  `personId` int(11) NOT NULL AUTO_INCREMENT,
  `age` int(11) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `middleName` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `addressId` int(11) DEFAULT NULL,
  PRIMARY KEY (`personId`),
  KEY `FKq7loxhfhlqhruhv88qrk78htl` (`addressId`),
  CONSTRAINT `FKq7loxhfhlqhruhv88qrk78htl` FOREIGN KEY (`addressId`) REFERENCES `wt_address` (`addressid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WT_person`
--

LOCK TABLES `WT_person` WRITE;
/*!40000 ALTER TABLE `WT_person` DISABLE KEYS */;
INSERT INTO `WT_person` VALUES (1,30,'admin','Male','admin','admin','4044356713',1),(2,0,NULL,NULL,NULL,NULL,'3827515161',2),(3,0,NULL,NULL,NULL,NULL,'6362617283',3),(4,0,NULL,NULL,NULL,NULL,'2838290193',4),(5,0,NULL,NULL,NULL,NULL,'123345465',5);
/*!40000 ALTER TABLE `WT_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WT_product`
--

DROP TABLE IF EXISTS `WT_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `WT_product` (
  `productId` int(11) NOT NULL AUTO_INCREMENT,
  `availability` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `photoName` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `prod_category` varchar(255) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `supplierId` int(11) DEFAULT NULL,
  PRIMARY KEY (`productId`),
  KEY `FKkm7tyamneocdxextfkvgurvnx` (`supplierId`),
  CONSTRAINT `FKkm7tyamneocdxextfkvgurvnx` FOREIGN KEY (`supplierId`) REFERENCES `wt_supplier` (`supplierid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WT_product`
--

LOCK TABLES `WT_product` WRITE;
/*!40000 ALTER TABLE `WT_product` DISABLE KEYS */;
INSERT INTO `WT_product` VALUES (1,50,'DDR1 - Ram','/cassian/resources/images/DDR1-Ram1556046927725.jpg',200,'Ram','DDR1 - Ram',2),(2,100,'DDR2 - Ram','/cassian/resources/images/DDR2-Ram1556046981258.jpg',230,'Ram','DDR2 - Ram',2),(3,80,'DDR3 - Ram','/cassian/resources/images/DDR3-Ram1556047011259.jpg',240,'Ram','DDR3 - Ram',2),(4,30,'DDR4 - Ram','/cassian/resources/images/DDR4-Ram1556047045164.jpg',290,'Ram','DDR4 - Ram',2),(5,80,'FD-1TB-HDD','/cassian/resources/images/FD-1Tb-Hdd1556047303963.jpg',300,'Portable Hard-Disk','FD-1TB-HDD',3),(6,70,'Segate-1TB-Hdd','/cassian/resources/images/Segate-1Tb-Hdd1556047396460.jpg',250,'Portable Hard-Disk','Segate-1TB-HDD',3),(7,50,'Transcent-1Tb-Hdd','/cassian/resources/images/Transent-1tb-hdd1556047483622.jpg',120,'Portable Hard-Disk','Transcent-1TB-Hdd',3),(8,20,'USBStick-4gb','/cassian/resources/images/UsbStick-4gb1556047795912.jpg',40,'Usb Stick','USBStick-4gb',4),(9,200,'USB Stick - 32gb','/cassian/resources/images/UsbStick-32Gb1556047844722.jpg',120,'Usb Stick','USBStick-32GB',4),(10,190,'UsbStick-128gb','/cassian/resources/images/UsbStick-128Gb1556047879310.jpg',230,'Usb Stick','USBStick-128Gb',4),(11,30,'Hp-omen','/cassian/resources/images/Hp-Omen1556052726902.jpg',2000,'Laptop','HP-Omen',5),(12,40,'HP-pavellion','/cassian/resources/images/Hp-pavellion1556052756694.jpg',2500,'Laptop','HP-pavellion',5),(13,40,'Lenovo B3','/cassian/resources/images/Lenovo-B31556052844973.jpg',1390,'Laptop','Lenovo-B3',5),(14,20,'MacBook Air-Golden','/cassian/resources/images/Macbook-Air-Golden1556052896615.jpg',2000,'Laptop','MacbbokAir-Golden',5),(15,40,'MacBook Air-Pink','/cassian/resources/images/Macbook-Air-Pink1556052953613.jpg',2300,'Laptop','Macbook Air-Pink',5);
/*!40000 ALTER TABLE `WT_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WT_supplier`
--

DROP TABLE IF EXISTS `WT_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `WT_supplier` (
  `supplierName` varchar(255) DEFAULT NULL,
  `supplierId` int(11) NOT NULL,
  `adminId` int(11) DEFAULT NULL,
  PRIMARY KEY (`supplierId`),
  KEY `FKifb7iyr6orwhfyadbty2bvh8q` (`adminId`),
  CONSTRAINT `FKh5rbdea99g31p7xe8pixke87k` FOREIGN KEY (`supplierId`) REFERENCES `wt_person` (`personid`),
  CONSTRAINT `FKifb7iyr6orwhfyadbty2bvh8q` FOREIGN KEY (`adminId`) REFERENCES `wt_admin` (`adminid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WT_supplier`
--

LOCK TABLES `WT_supplier` WRITE;
/*!40000 ALTER TABLE `WT_supplier` DISABLE KEYS */;
INSERT INTO `WT_supplier` VALUES ('Supplier1',2,1),('Supplier2',3,1),('Supplier3',4,1),('Supplier4',5,1);
/*!40000 ALTER TABLE `WT_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WT_userAccount`
--

DROP TABLE IF EXISTS `WT_userAccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `WT_userAccount` (
  `userAccountId` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `personId` int(11) DEFAULT NULL,
  PRIMARY KEY (`userAccountId`),
  KEY `FKnaxl3vg4lhjtl7225vfo8i99m` (`personId`),
  CONSTRAINT `FKnaxl3vg4lhjtl7225vfo8i99m` FOREIGN KEY (`personId`) REFERENCES `wt_person` (`personid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WT_userAccount`
--

LOCK TABLES `WT_userAccount` WRITE;
/*!40000 ALTER TABLE `WT_userAccount` DISABLE KEYS */;
INSERT INTO `WT_userAccount` VALUES (1,'admin','admin','admin',1),(2,'supplier1','supplier','supplier1',2),(3,'supplier2','supplier','supplier2',3),(4,'supplier3','supplier','supplier3',4),(5,'supplier4','supplier','supplier4',5);
/*!40000 ALTER TABLE `WT_userAccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'webtools_final_project'
--

--
-- Dumping routines for database 'webtools_final_project'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-23 17:38:14
