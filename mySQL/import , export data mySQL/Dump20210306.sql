-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: blog
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article` (
  `idArticle` int NOT NULL,
  `title` varchar(45) NOT NULL,
  `brief` longtext NOT NULL,
  `content` longtext NOT NULL,
  `create_date` date NOT NULL,
  `Writer_idWriter` int NOT NULL,
  `Category_idCategory` int NOT NULL,
  `Writer_idWriter1` int NOT NULL,
  PRIMARY KEY (`idArticle`,`Writer_idWriter`,`Category_idCategory`),
  KEY `fk_Article_Category1_idx` (`Category_idCategory`) /*!80000 INVISIBLE */,
  KEY `fk_Article_Writer1_idx` (`Writer_idWriter1`),
  CONSTRAINT `fk_Article_Category1` FOREIGN KEY (`Category_idCategory`) REFERENCES `category` (`idCategory`),
  CONSTRAINT `fk_Article_Writer1` FOREIGN KEY (`Writer_idWriter1`) REFERENCES `writer` (`idWriter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,'non','nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet.','massa rutrum magna. Cras convallis convallis dolor. Quisque tincidunt pede','2021-06-06',1,14,4),(2,'lectus','venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing','lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc','2021-04-14',3,14,3),(3,'Sed','augue, eu tempor erat neque non quam. Pellentesque habitant morbi','nulla at sem molestie sodales. Mauris blandit enim consequat purus.','2021-04-22',4,12,5),(4,'Vestibulum','nec, euismod in, dolor. Fusce feugiat. Lorem ipsum dolor sit','Fusce feugiat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.','2020-06-25',5,12,4),(5,'pulvinar','egestas nunc sed libero. Proin sed turpis nec mauris blandit','at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum','2020-09-25',3,11,5),(6,'turpis.','nulla at sem molestie sodales. Mauris blandit enim consequat purus.','sit amet, risus. Donec nibh enim, gravida sit amet, dapibus','2020-05-26',3,12,5),(7,'mollis','tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque','Vestibulum ante ipsum primis in faucibus orci luctus et ultrices','2020-07-17',2,11,3),(8,'adipiscing','non, feugiat nec, diam. Duis mi enim, condimentum eget, volutpat','nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque','2020-11-29',5,13,3),(9,'nec','orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean','Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci,','2021-08-26',5,14,5),(10,'consequat','dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum vel,','primis in faucibus orci luctus et ultrices posuere cubilia Curae;','2021-08-10',2,11,4);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `idCategory` int NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCategory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (11,'mauris'),(12,'sit'),(13,'Nullam'),(14,'tempor'),(15,'lorem'),(16,'shimi'),(17,'dini');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `idTag` int NOT NULL,
  `title` varchar(45) NOT NULL,
  PRIMARY KEY (`idTag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'In'),(2,'non'),(3,'vel'),(4,'ante.'),(5,'ridiculus');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_has_article`
--

DROP TABLE IF EXISTS `tag_has_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag_has_article` (
  `Tag_idTag` int NOT NULL,
  `Article_idArticle` int NOT NULL,
  `Article_Writer_idWriter` int NOT NULL,
  PRIMARY KEY (`Tag_idTag`,`Article_idArticle`,`Article_Writer_idWriter`),
  KEY `fk_Tag_has_Article_Article1_idx` (`Article_idArticle`,`Article_Writer_idWriter`),
  KEY `fk_Tag_has_Article_Tag1_idx` (`Tag_idTag`),
  CONSTRAINT `fk_Tag_has_Article_Article1` FOREIGN KEY (`Article_idArticle`, `Article_Writer_idWriter`) REFERENCES `article` (`idArticle`, `Writer_idWriter`),
  CONSTRAINT `fk_Tag_has_Article_Tag1` FOREIGN KEY (`Tag_idTag`) REFERENCES `tag` (`idTag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_has_article`
--

LOCK TABLES `tag_has_article` WRITE;
/*!40000 ALTER TABLE `tag_has_article` DISABLE KEYS */;
INSERT INTO `tag_has_article` VALUES (1,1,1),(1,6,3),(2,2,3),(2,7,2),(2,10,2),(3,3,4),(3,8,5),(3,9,5),(4,4,5),(5,5,3);
/*!40000 ALTER TABLE `tag_has_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `writer`
--

DROP TABLE IF EXISTS `writer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `writer` (
  `idWriter` int NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `age` int NOT NULL,
  PRIMARY KEY (`idWriter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `writer`
--

LOCK TABLES `writer` WRITE;
/*!40000 ALTER TABLE `writer` DISABLE KEYS */;
INSERT INTO `writer` VALUES (1,'Macon','Abbott',28),(2,'Denton','Briggs',19),(3,'Devin','Duffy',29),(4,'Ignatius','Benson',19),(5,'Erich','Sutton',21);
/*!40000 ALTER TABLE `writer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-06 20:55:22
