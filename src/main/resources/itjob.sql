-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: itjob
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'thuycuppy','$2a$10$LOqePml/koRGsk2YAIOFI.1YNKZg7EsQ5BAIuYP1nWOyYRl21dlne','thuy@gmail.com','ROLE_CANDIDATE','img/avatar/default.jpg'),(2,'anh','$2y$10$FxstkW3S70UptzjSTZCMfOVBQbmp/z0..Fw0CX0df48nU2.noy4cC','anh@gmail.com','ROLE_CANDIDATE','img/avatar/default.jpg'),(3,'abc','$2y$10$FxstkW3S70UptzjSTZCMfOVBQbmp/z0..Fw0CX0df48nU2.noy4cC','abc@gmail.com','ROLE_COMPANY','img/avatar/default.jpg'),(4,'tuan','$2y$10$FxstkW3S70UptzjSTZCMfOVBQbmp/z0..Fw0CX0df48nU2.noy4cC','tuan@gmail.com','ROLE_CANDIDATE','img/avatar/default.jpg'),(5,'FPT','$2y$10$FxstkW3S70UptzjSTZCMfOVBQbmp/z0..Fw0CX0df48nU2.noy4cC','fpt@fsoft.com.vn','ROLE_COMPANY','img/avatar/default.jpg'),(6,'CMC','$2y$10$FxstkW3S70UptzjSTZCMfOVBQbmp/z0..Fw0CX0df48nU2.noy4cC','cmc@gmail.com','ROLE_COMPANY','img/avatar/default.jpg'),(7,'Ominext','$2y$10$FxstkW3S70UptzjSTZCMfOVBQbmp/z0..Fw0CX0df48nU2.noy4cC','ominext@gmail.com','ROLE_COMPANY','img/avatar/default.jpg'),(8,'lethuy','$2y$10$FxstkW3S70UptzjSTZCMfOVBQbmp/z0..Fw0CX0df48nU2.noy4cC','lethuy@gmail.com','ROLE_CANDIDATE','img/avatar/default.jpg'),(9,'tuananh','$2y$10$FxstkW3S70UptzjSTZCMfOVBQbmp/z0..Fw0CX0df48nU2.noy4cC','tuananh@gmail.com','ROLE_CANDIDATE','img/avatar/default.jpg'),(10,'Cowell','$2y$10$FxstkW3S70UptzjSTZCMfOVBQbmp/z0..Fw0CX0df48nU2.noy4cC','cowell@gmail.com','ROLE_COMPANY','img/avatar/default.jpg');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `candidate`
--

LOCK TABLES `candidate` WRITE;
/*!40000 ALTER TABLE `candidate` DISABLE KEYS */;
/*!40000 ALTER TABLE `candidate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `candidateskill`
--

LOCK TABLES `candidateskill` WRITE;
/*!40000 ALTER TABLE `candidateskill` DISABLE KEYS */;
/*!40000 ALTER TABLE `candidateskill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Ha Noi'),(2,'Thanh pho Ho Chi Minh'),(3,'Hai Phong'),(4,'Thanh Hoa'),(5,'Da Nang'),(6,'Thai Nguyen'),(7,'Hue'),(8,'Thai Nguyen'),(9,'Bac Ninh'),(10,'Vinh');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `companytype`
--

LOCK TABLES `companytype` WRITE;
/*!40000 ALTER TABLE `companytype` DISABLE KEYS */;
INSERT INTO `companytype` VALUES (1,'outsourcing'),(2,'product');
/*!40000 ALTER TABLE `companytype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `experience`
--

LOCK TABLES `experience` WRITE;
/*!40000 ALTER TABLE `experience` DISABLE KEYS */;
INSERT INTO `experience` VALUES (1,'fresher'),(2,'junior'),(3,'senior'),(4,'expert');
/*!40000 ALTER TABLE `experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `jobskill`
--

LOCK TABLES `jobskill` WRITE;
/*!40000 ALTER TABLE `jobskill` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobskill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `jobtype`
--

LOCK TABLES `jobtype` WRITE;
/*!40000 ALTER TABLE `jobtype` DISABLE KEYS */;
INSERT INTO `jobtype` VALUES (1,'parttime'),(2,'fulltime'),(3,'internship'),(4,'remote');
/*!40000 ALTER TABLE `jobtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `recruitment`
--

LOCK TABLES `recruitment` WRITE;
/*!40000 ALTER TABLE `recruitment` DISABLE KEYS */;
/*!40000 ALTER TABLE `recruitment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `skill`
--

LOCK TABLES `skill` WRITE;
/*!40000 ALTER TABLE `skill` DISABLE KEYS */;
INSERT INTO `skill` VALUES (1,'Java'),(2,'JavaScript'),(3,'PHP'),(4,'Ruby'),(5,'C++'),(6,'C#'),(7,'C'),(8,'Android'),(9,'IOS'),(10,'Python');
/*!40000 ALTER TABLE `skill` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-10 22:36:34
