-- MySQL dump 10.13  Distrib 5.5.16, for Linux (x86_64)
--
-- Host: localhost    Database: MyIMDB
-- ------------------------------------------------------
-- Server version	5.5.16-log

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
-- Table structure for table `actors`
--

DROP TABLE IF EXISTS `actors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actors` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `name` char(100) DEFAULT NULL,
  `bdate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actors`
--

LOCK TABLES `actors` WRITE;
/*!40000 ALTER TABLE `actors` DISABLE KEYS */;
INSERT INTO `actors` VALUES (0,'Brad Pitt','1963-12-18'),(1,'Edward Norton','1966-05-26'),(2,'Helena Bonham Carter','1969-08-18'),(3,'Morgan Freeman','1937-06-01'),(5,'Kevin Spacey','0000-00-00');
/*!40000 ALTER TABLE `actors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) DEFAULT NULL,
  `pass` varchar(100) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'admin','21232f297a57a5a743894a0e4a801fc3','admin@my_imdb.com');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `comment` char(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'test test test test'),(2,'alt commment, alt commnet');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genres` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `genre` char(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (0,'drama'),(1,'crime'),(2,'thriller');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `name` char(100) DEFAULT NULL,
  `launch_date` date DEFAULT NULL,
  `duration` int(255) DEFAULT NULL,
  `rating` smallint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (0,'Fight Club','1999-10-15',139,3),(1,'Seven','1995-09-22',127,3),(10,'test',NULL,NULL,NULL),(99999,'99',NULL,NULL,NULL);
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies_actors`
--

DROP TABLE IF EXISTS `movies_actors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies_actors` (
  `movie_id` int(100) NOT NULL DEFAULT '0',
  `actor_id` int(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`movie_id`,`actor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies_actors`
--

LOCK TABLES `movies_actors` WRITE;
/*!40000 ALTER TABLE `movies_actors` DISABLE KEYS */;
INSERT INTO `movies_actors` VALUES (0,0),(0,1),(0,2),(1,3),(1,5);
/*!40000 ALTER TABLE `movies_actors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies_comments`
--

DROP TABLE IF EXISTS `movies_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies_comments` (
  `movie_id` int(100) NOT NULL DEFAULT '0',
  `comment_id` int(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`movie_id`,`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies_comments`
--

LOCK TABLES `movies_comments` WRITE;
/*!40000 ALTER TABLE `movies_comments` DISABLE KEYS */;
INSERT INTO `movies_comments` VALUES (1,1),(1,2);
/*!40000 ALTER TABLE `movies_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies_genres`
--

DROP TABLE IF EXISTS `movies_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies_genres` (
  `movie_id` int(100) NOT NULL DEFAULT '0',
  `genre_id` int(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`movie_id`,`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies_genres`
--

LOCK TABLES `movies_genres` WRITE;
/*!40000 ALTER TABLE `movies_genres` DISABLE KEYS */;
INSERT INTO `movies_genres` VALUES (0,0),(1,0),(1,1),(1,2);
/*!40000 ALTER TABLE `movies_genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies_users_comments`
--

DROP TABLE IF EXISTS `movies_users_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies_users_comments` (
  `movie_id` int(100) NOT NULL DEFAULT '0',
  `user_id` int(100) NOT NULL DEFAULT '0',
  `comment_id` int(100) NOT NULL AUTO_INCREMENT,
  `comment` char(150) DEFAULT NULL,
  PRIMARY KEY (`comment_id`,`movie_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies_users_comments`
--

LOCK TABLES `movies_users_comments` WRITE;
/*!40000 ALTER TABLE `movies_users_comments` DISABLE KEYS */;
INSERT INTO `movies_users_comments` VALUES (1,5,1,'test test test comment'),(1,5,2,'another test comment'),(0,5,3,'dasdas'),(0,5,4,'dsadsadas');
/*!40000 ALTER TABLE `movies_users_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `pass` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (5,'us','0b3b97fa66886c5688ee4ae80ec0c3c2','us@us.us'),(6,'test2','ad0234829205b9033196ba818f7a872b','test@test2.ds');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_actors`
--

DROP TABLE IF EXISTS `users_actors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_actors` (
  `user_id` int(100) NOT NULL DEFAULT '0',
  `actor_id` int(100) NOT NULL DEFAULT '0',
  `favorited` char(1) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`actor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_actors`
--

LOCK TABLES `users_actors` WRITE;
/*!40000 ALTER TABLE `users_actors` DISABLE KEYS */;
INSERT INTO `users_actors` VALUES (5,0,'y'),(5,2,'y'),(5,3,'y'),(5,5,'y'),(6,0,'y');
/*!40000 ALTER TABLE `users_actors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_movies`
--

DROP TABLE IF EXISTS `users_movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_movies` (
  `user_id` int(100) NOT NULL DEFAULT '0',
  `movie_id` int(100) NOT NULL DEFAULT '0',
  `rated` char(1) DEFAULT 'n',
  `favorited` char(1) DEFAULT 'n',
  PRIMARY KEY (`user_id`,`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_movies`
--

LOCK TABLES `users_movies` WRITE;
/*!40000 ALTER TABLE `users_movies` DISABLE KEYS */;
INSERT INTO `users_movies` VALUES (5,0,'y','y'),(5,1,'n','y');
/*!40000 ALTER TABLE `users_movies` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-07-03 11:07:19
