-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: test_itechart
-- ------------------------------------------------------
-- Server version	8.0.15

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
-- Table structure for table `exam_result`
--

DROP TABLE IF EXISTS `exam_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `exam_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `training_course_id` int(11) DEFAULT NULL,
  `lecturer_id` int(11) DEFAULT NULL,
  `result` int(11) DEFAULT NULL,
  `date_exam` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  KEY `training_course_id` (`training_course_id`),
  KEY `lecturer_id` (`lecturer_id`),
  CONSTRAINT `exam_result_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`),
  CONSTRAINT `exam_result_ibfk_2` FOREIGN KEY (`training_course_id`) REFERENCES `training_course` (`id`),
  CONSTRAINT `exam_result_ibfk_3` FOREIGN KEY (`lecturer_id`) REFERENCES `lecturer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_result`
--

LOCK TABLES `exam_result` WRITE;
/*!40000 ALTER TABLE `exam_result` DISABLE KEYS */;
INSERT INTO `exam_result` VALUES (1,2,1,2,2,'2020-05-01'),(2,3,2,2,4,'2020-05-05'),(3,2,1,2,4,'2020-05-05'),(4,4,3,1,3,'2020-05-05'),(5,5,4,3,4,'2020-05-05'),(6,1,5,3,4,'2020-05-05'),(7,3,5,3,2,'2020-05-05'),(8,5,4,3,5,'2020-05-05'),(9,19,4,3,5,'2020-05-05'),(10,19,4,3,5,'2019-05-08'),(11,19,4,3,3,'1964-01-02');
/*!40000 ALTER TABLE `exam_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecturer`
--

DROP TABLE IF EXISTS `lecturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lecturer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecturer`
--

LOCK TABLES `lecturer` WRITE;
/*!40000 ALTER TABLE `lecturer` DISABLE KEYS */;
INSERT INTO `lecturer` VALUES (1,'Boris','Skarino'),(2,'Aleksandr','Homchenko'),(3,'Anton','Lapitskiy');
/*!40000 ALTER TABLE `lecturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Ivan','Fedorov'),(2,'Vladimir','Innokentiy'),(3,'Kiril','Goncharov'),(4,'Boris','Krasnov'),(5,'Egor','Kyklov'),(19,'Roger','Rog');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_result`
--

DROP TABLE IF EXISTS `student_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `student_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `training_course_id` int(11) DEFAULT NULL,
  `lecturer_id` int(11) DEFAULT NULL,
  `result` int(11) DEFAULT NULL,
  `date_exam` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  KEY `training_course_id` (`training_course_id`),
  KEY `lecturer_id` (`lecturer_id`),
  CONSTRAINT `student_result_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`),
  CONSTRAINT `student_result_ibfk_2` FOREIGN KEY (`training_course_id`) REFERENCES `training_course` (`id`),
  CONSTRAINT `student_result_ibfk_3` FOREIGN KEY (`lecturer_id`) REFERENCES `lecturer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_result`
--

LOCK TABLES `student_result` WRITE;
/*!40000 ALTER TABLE `student_result` DISABLE KEYS */;
INSERT INTO `student_result` VALUES (1,1,1,2,8,'2020-05-05');
/*!40000 ALTER TABLE `student_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_training`
--

DROP TABLE IF EXISTS `student_training`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `student_training` (
  `student_id` int(11) NOT NULL,
  `training_course_id` int(11) NOT NULL,
  KEY `student_id` (`student_id`),
  KEY `training_course_id` (`training_course_id`),
  CONSTRAINT `student_training_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`),
  CONSTRAINT `student_training_ibfk_2` FOREIGN KEY (`training_course_id`) REFERENCES `training_course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_training`
--

LOCK TABLES `student_training` WRITE;
/*!40000 ALTER TABLE `student_training` DISABLE KEYS */;
INSERT INTO `student_training` VALUES (1,2),(1,1),(2,3),(2,2),(3,1),(3,4),(3,5),(4,4),(5,5);
/*!40000 ALTER TABLE `student_training` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `training_course`
--

DROP TABLE IF EXISTS `training_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `training_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training_course`
--

LOCK TABLES `training_course` WRITE;
/*!40000 ALTER TABLE `training_course` DISABLE KEYS */;
INSERT INTO `training_course` VALUES (1,'Math'),(2,'Physics'),(3,'Automatization \r\n'),(4,'Security IT'),(5,'SUBD');
/*!40000 ALTER TABLE `training_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `training_course_lecturer`
--

DROP TABLE IF EXISTS `training_course_lecturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `training_course_lecturer` (
  `training_course_id` int(11) NOT NULL,
  `lecturer_id` int(11) NOT NULL,
  KEY `training_course_id` (`training_course_id`),
  KEY `lecturer_id` (`lecturer_id`),
  CONSTRAINT `training_course_lecturer_ibfk_1` FOREIGN KEY (`training_course_id`) REFERENCES `training_course` (`id`),
  CONSTRAINT `training_course_lecturer_ibfk_2` FOREIGN KEY (`lecturer_id`) REFERENCES `lecturer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training_course_lecturer`
--

LOCK TABLES `training_course_lecturer` WRITE;
/*!40000 ALTER TABLE `training_course_lecturer` DISABLE KEYS */;
INSERT INTO `training_course_lecturer` VALUES (3,1),(2,2),(1,2),(4,3),(5,3);
/*!40000 ALTER TABLE `training_course_lecturer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-15 15:07:51
