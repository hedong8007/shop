-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: localhost    Database: shop
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.18.04.1

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
-- Current Database: `shop`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `shop` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `shop`;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add user profile',7,'add_userprofile'),(20,'Can change user profile',7,'change_userprofile'),(21,'Can delete user profile',7,'delete_userprofile'),(22,'Can add category',8,'add_category'),(23,'Can change category',8,'change_category'),(24,'Can delete category',8,'delete_category'),(25,'Can add goods',9,'add_goods'),(26,'Can change goods',9,'change_goods'),(27,'Can delete goods',9,'delete_goods'),(28,'Can add cart',10,'add_cart'),(29,'Can change cart',10,'change_cart'),(30,'Can delete cart',10,'delete_cart'),(31,'Can add check',11,'add_check'),(32,'Can change check',11,'change_check'),(33,'Can delete check',11,'delete_check'),(34,'Can add checkout',12,'add_checkout'),(35,'Can change checkout',12,'change_checkout'),(36,'Can delete checkout',12,'delete_checkout'),(37,'Can add record_trade',13,'add_record_trade'),(38,'Can change record_trade',13,'change_record_trade'),(39,'Can delete record_trade',13,'delete_record_trade');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_num` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` varchar(30) NOT NULL,
  `goods_price` decimal(5,2) NOT NULL,
  `unit` varchar(10) NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_goods_id_a0c55193_fk_goods_id` (`goods_id`),
  KEY `cart_user_id_1361a739_fk_user_profile_username` (`user_id`),
  CONSTRAINT `cart_goods_id_a0c55193_fk_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`),
  CONSTRAINT `cart_user_id_1361a739_fk_user_profile_username` FOREIGN KEY (`user_id`) REFERENCES `user_profile` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (24,1,6,'hedong',30.00,'斤','6.jpg'),(25,1,105,'hedong',15.00,'斤','玉米.jpg');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typename` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'蔬菜'),(2,'meat'),(3,'fruits');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `check`
--

DROP TABLE IF EXISTS `check`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `check` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_num` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `check_goods_id_02595913_fk_goods_id` (`goods_id`),
  KEY `check_user_id_276b1d27_fk_user_profile_username` (`user_id`),
  CONSTRAINT `check_goods_id_02595913_fk_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`),
  CONSTRAINT `check_user_id_276b1d27_fk_user_profile_username` FOREIGN KEY (`user_id`) REFERENCES `user_profile` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `check`
--

LOCK TABLES `check` WRITE;
/*!40000 ALTER TABLE `check` DISABLE KEYS */;
/*!40000 ALTER TABLE `check` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkout`
--

DROP TABLE IF EXISTS `checkout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checkout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datetime` datetime(6) NOT NULL,
  `goods_price` decimal(5,2) NOT NULL,
  `name` varchar(10) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `adress` varchar(50) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` varchar(30) NOT NULL,
  `r_id` int(11) NOT NULL,
  `goods_num` varchar(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `checkout_goods_id_d330d964_fk_goods_id` (`goods_id`),
  KEY `checkout_user_id_cb006dab_fk_user_profile_username` (`user_id`),
  CONSTRAINT `checkout_goods_id_d330d964_fk_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`),
  CONSTRAINT `checkout_user_id_cb006dab_fk_user_profile_username` FOREIGN KEY (`user_id`) REFERENCES `user_profile` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=589 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkout`
--

LOCK TABLES `checkout` WRITE;
/*!40000 ALTER TABLE `checkout` DISABLE KEYS */;
INSERT INTO `checkout` VALUES (497,'2019-10-08 11:53:07.783739',30.00,'hedong','15661608007','重庆市渝北区加州花园',6,'hedong',205,'0'),(498,'2019-10-08 11:53:07.825471',30.00,'hedong','15661608007','重庆市渝北区加州花园',6,'hedong',206,'0'),(499,'2019-10-08 11:53:07.956637',25.00,'hedong','15661608007','重庆市渝北区加州花园',50,'hedong',205,'0'),(500,'2019-10-08 11:53:07.957487',25.00,'hedong','15661608007','重庆市渝北区加州花园',50,'hedong',206,'0'),(501,'2019-10-08 11:53:08.039432',20.80,'hedong','15661608007','重庆市渝北区加州花园',103,'hedong',206,'0'),(502,'2019-10-08 11:53:08.077650',20.80,'hedong','15661608007','重庆市渝北区加州花园',103,'hedong',205,'0'),(503,'2019-10-08 11:53:08.127088',30.00,'hedong','15661608007','重庆市渝北区加州花园',6,'hedong',206,'0'),(504,'2019-10-08 11:53:08.167858',30.00,'hedong','15661608007','重庆市渝北区加州花园',6,'hedong',205,'0'),(505,'2019-10-09 03:09:36.759621',30.00,'hedong','15661608007','重庆市渝北区加州花园',6,'hedong',208,'0'),(506,'2019-10-09 03:09:36.759991',30.00,'hedong','15661608007','重庆市渝北区加州花园',6,'hedong',207,'0'),(507,'2019-10-09 03:09:36.817750',25.00,'hedong','15661608007','重庆市渝北区加州花园',50,'hedong',207,'0'),(508,'2019-10-09 03:09:36.908354',25.00,'hedong','15661608007','重庆市渝北区加州花园',50,'hedong',208,'0'),(509,'2019-10-09 03:09:37.006500',20.80,'hedong','15661608007','重庆市渝北区加州花园',103,'hedong',207,'0'),(510,'2019-10-09 03:09:37.102947',20.80,'hedong','15661608007','重庆市渝北区加州花园',103,'hedong',208,'0'),(511,'2019-10-09 03:09:37.151644',30.00,'hedong','15661608007','重庆市渝北区加州花园',6,'hedong',207,'0'),(512,'2019-10-09 03:09:37.202404',30.00,'hedong','15661608007','重庆市渝北区加州花园',6,'hedong',208,'0'),(513,'2019-10-09 03:14:04.544602',30.00,'hedong','15661608007','重庆市渝北区加州花园',6,'hedong',210,'0'),(514,'2019-10-09 03:14:04.583177',30.00,'hedong','15661608007','重庆市渝北区加州花园',6,'hedong',209,'0'),(515,'2019-10-09 03:14:04.631789',25.00,'hedong','15661608007','重庆市渝北区加州花园',50,'hedong',210,'0'),(516,'2019-10-09 03:14:04.677532',25.00,'hedong','15661608007','重庆市渝北区加州花园',50,'hedong',209,'0'),(517,'2019-10-09 03:14:04.729381',20.80,'hedong','15661608007','重庆市渝北区加州花园',103,'hedong',210,'0'),(518,'2019-10-09 03:14:04.829165',30.00,'hedong','15661608007','重庆市渝北区加州花园',6,'hedong',210,'0'),(519,'2019-10-09 03:14:04.883436',20.80,'hedong','15661608007','重庆市渝北区加州花园',103,'hedong',209,'0'),(520,'2019-10-09 03:14:04.978148',30.00,'hedong','15661608007','重庆市渝北区加州花园',6,'hedong',209,'0'),(521,'2019-10-09 03:31:45.523760',30.00,'hedong','15661608007','重庆市渝北区加州花园',6,'hedong',211,'0'),(522,'2019-10-09 03:31:45.571323',30.00,'hedong','15661608007','重庆市渝北区加州花园',6,'hedong',212,'0'),(523,'2019-10-09 03:31:45.643994',25.00,'hedong','15661608007','重庆市渝北区加州花园',50,'hedong',212,'0'),(524,'2019-10-09 03:31:45.697346',25.00,'hedong','15661608007','重庆市渝北区加州花园',50,'hedong',211,'0'),(525,'2019-10-09 03:31:45.736664',20.80,'hedong','15661608007','重庆市渝北区加州花园',103,'hedong',212,'0'),(526,'2019-10-09 03:31:45.788476',20.80,'hedong','15661608007','重庆市渝北区加州花园',103,'hedong',211,'0'),(527,'2019-10-09 03:31:45.864725',30.00,'hedong','15661608007','重庆市渝北区加州花园',6,'hedong',211,'0'),(528,'2019-10-09 03:31:45.906204',30.00,'hedong','15661608007','重庆市渝北区加州花园',6,'hedong',212,'0'),(529,'2019-10-09 03:33:06.604011',30.00,'hedong','15661608007','重庆市渝北区加州花园',6,'hedong',213,'0'),(530,'2019-10-09 03:33:06.709514',25.00,'hedong','15661608007','重庆市渝北区加州花园',50,'hedong',213,'0'),(531,'2019-10-09 03:33:06.664473',30.00,'hedong','15661608007','重庆市渝北区加州花园',6,'hedong',214,'0'),(532,'2019-10-09 03:33:06.842683',20.80,'hedong','15661608007','重庆市渝北区加州花园',103,'hedong',213,'0'),(533,'2019-10-09 03:33:06.891495',25.00,'hedong','15661608007','重庆市渝北区加州花园',50,'hedong',214,'0'),(534,'2019-10-09 03:33:06.945957',30.00,'hedong','15661608007','重庆市渝北区加州花园',6,'hedong',213,'0'),(535,'2019-10-09 03:33:06.968904',20.80,'hedong','15661608007','重庆市渝北区加州花园',103,'hedong',214,'0'),(536,'2019-10-09 03:33:07.046777',30.00,'hedong','15661608007','重庆市渝北区加州花园',6,'hedong',214,'0'),(537,'2019-10-10 02:48:21.781340',30.00,'hedong','15661608007','重庆市渝北区加州花园',6,'hedong',215,'0'),(538,'2019-10-10 02:48:21.840136',30.00,'hedong','15661608007','重庆市渝北区加州花园',6,'hedong',216,'0'),(539,'2019-10-10 02:48:21.880573',25.00,'hedong','15661608007','重庆市渝北区加州花园',50,'hedong',215,'0'),(540,'2019-10-10 02:48:21.932649',25.00,'hedong','15661608007','重庆市渝北区加州花园',50,'hedong',216,'0'),(541,'2019-10-10 02:48:21.980374',20.80,'hedong','15661608007','重庆市渝北区加州花园',103,'hedong',215,'0'),(542,'2019-10-10 02:48:22.034657',20.80,'hedong','15661608007','重庆市渝北区加州花园',103,'hedong',216,'0'),(543,'2019-10-10 02:48:22.096305',30.00,'hedong','15661608007','重庆市渝北区加州花园',6,'hedong',215,'0'),(544,'2019-10-10 02:48:22.137217',30.00,'hedong','15661608007','重庆市渝北区加州花园',6,'hedong',216,'0'),(545,'2019-10-10 02:48:22.823945',30.00,'hedong','15661608007','重庆市渝北区加州花园',6,'hedong',217,'0'),(546,'2019-10-10 02:48:22.875846',25.00,'hedong','15661608007','重庆市渝北区加州花园',50,'hedong',217,'0'),(547,'2019-10-10 02:48:22.988883',30.00,'hedong','15661608007','重庆市渝北区加州花园',6,'hedong',219,'0'),(548,'2019-10-10 02:48:22.989234',30.00,'hedong','15661608007','重庆市渝北区加州花园',6,'hedong',218,'0'),(549,'2019-10-10 02:48:23.034247',20.80,'hedong','15661608007','重庆市渝北区加州花园',103,'hedong',217,'0'),(550,'2019-10-10 02:48:23.094696',25.00,'hedong','15661608007','重庆市渝北区加州花园',50,'hedong',219,'0'),(551,'2019-10-10 02:48:23.097667',25.00,'hedong','15661608007','重庆市渝北区加州花园',50,'hedong',218,'0'),(552,'2019-10-10 02:48:23.129946',30.00,'hedong','15661608007','重庆市渝北区加州花园',6,'hedong',217,'0'),(553,'2019-10-10 02:48:23.184253',20.80,'hedong','15661608007','重庆市渝北区加州花园',103,'hedong',218,'0'),(554,'2019-10-10 02:48:23.185128',20.80,'hedong','15661608007','重庆市渝北区加州花园',103,'hedong',219,'0'),(555,'2019-10-10 02:48:23.251616',30.00,'hedong','15661608007','重庆市渝北区加州花园',6,'hedong',219,'0'),(556,'2019-10-10 02:48:23.253972',30.00,'hedong','15661608007','重庆市渝北区加州花园',6,'hedong',218,'0'),(557,'2019-10-10 08:53:54.140475',30.00,'hedong','15661608007','重庆市渝北区加州花园',6,'hedong',220,'0'),(558,'2019-10-10 08:53:54.232915',25.00,'hedong','15661608007','重庆市渝北区加州花园',50,'hedong',220,'0'),(559,'2019-10-10 08:53:54.292352',30.00,'hedong','15661608007','重庆市渝北区加州花园',6,'hedong',221,'0'),(560,'2019-10-10 08:53:54.341715',20.80,'hedong','15661608007','重庆市渝北区加州花园',103,'hedong',220,'0'),(561,'2019-10-10 08:53:54.391566',25.00,'hedong','15661608007','重庆市渝北区加州花园',50,'hedong',221,'0'),(562,'2019-10-10 08:53:54.444059',30.00,'hedong','15661608007','重庆市渝北区加州花园',6,'hedong',220,'0'),(563,'2019-10-10 08:53:54.486269',20.80,'hedong','15661608007','重庆市渝北区加州花园',103,'hedong',221,'0'),(564,'2019-10-10 08:53:54.542365',15.00,'hedong','15661608007','重庆市渝北区加州花园',105,'hedong',220,'0'),(565,'2019-10-10 08:53:54.583579',30.00,'hedong','15661608007','重庆市渝北区加州花园',6,'hedong',221,'0'),(566,'2019-10-10 08:53:54.633977',15.00,'hedong','15661608007','重庆市渝北区加州花园',105,'hedong',220,'0'),(567,'2019-10-10 08:53:54.797557',15.00,'hedong','15661608007','重庆市渝北区加州花园',105,'hedong',220,'0'),(568,'2019-10-10 08:53:54.798452',15.00,'hedong','15661608007','重庆市渝北区加州花园',105,'hedong',221,'0'),(569,'2019-10-10 08:53:54.861294',105.00,'hedong','15661608007','重庆市渝北区加州花园',54,'hedong',220,'0'),(570,'2019-10-10 08:53:54.909946',15.00,'hedong','15661608007','重庆市渝北区加州花园',105,'hedong',221,'0'),(571,'2019-10-10 08:53:55.002799',15.00,'hedong','15661608007','重庆市渝北区加州花园',105,'hedong',221,'0'),(572,'2019-10-10 08:53:55.067518',105.00,'hedong','15661608007','重庆市渝北区加州花园',54,'hedong',221,'0'),(573,'2019-10-10 08:55:00.210750',30.00,'hedong','15661608007','重庆市渝北区加州花园',6,'hedong',223,'0'),(574,'2019-10-10 08:55:00.162067',30.00,'hedong','15661608007','重庆市渝北区加州花园',6,'hedong',222,'0'),(575,'2019-10-10 08:55:00.333066',25.00,'hedong','15661608007','重庆市渝北区加州花园',50,'hedong',222,'0'),(576,'2019-10-10 08:55:00.426821',20.80,'hedong','15661608007','重庆市渝北区加州花园',103,'hedong',222,'0'),(577,'2019-10-10 08:55:00.472887',25.00,'hedong','15661608007','重庆市渝北区加州花园',50,'hedong',223,'0'),(578,'2019-10-10 08:55:00.507305',30.00,'hedong','15661608007','重庆市渝北区加州花园',6,'hedong',222,'0'),(579,'2019-10-10 08:55:00.549786',20.80,'hedong','15661608007','重庆市渝北区加州花园',103,'hedong',223,'0'),(580,'2019-10-10 08:55:00.592179',15.00,'hedong','15661608007','重庆市渝北区加州花园',105,'hedong',222,'0'),(581,'2019-10-10 08:55:00.635872',30.00,'hedong','15661608007','重庆市渝北区加州花园',6,'hedong',223,'0'),(582,'2019-10-10 08:55:00.668038',15.00,'hedong','15661608007','重庆市渝北区加州花园',105,'hedong',222,'0'),(583,'2019-10-10 08:55:00.708507',15.00,'hedong','15661608007','重庆市渝北区加州花园',105,'hedong',223,'0'),(584,'2019-10-10 08:55:00.750898',15.00,'hedong','15661608007','重庆市渝北区加州花园',105,'hedong',222,'0'),(585,'2019-10-10 08:55:00.800683',15.00,'hedong','15661608007','重庆市渝北区加州花园',105,'hedong',223,'0'),(586,'2019-10-10 08:55:00.846844',105.00,'hedong','15661608007','重庆市渝北区加州花园',54,'hedong',222,'0'),(587,'2019-10-10 08:55:00.888035',15.00,'hedong','15661608007','重庆市渝北区加州花园',105,'hedong',223,'0'),(588,'2019-10-10 08:55:00.962665',105.00,'hedong','15661608007','重庆市渝北区加州花园',54,'hedong',223,'0');
/*!40000 ALTER TABLE `checkout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkout_record_trade`
--

DROP TABLE IF EXISTS `checkout_record_trade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checkout_record_trade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_price` decimal(8,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkout_record_trade`
--

LOCK TABLES `checkout_record_trade` WRITE;
/*!40000 ALTER TABLE `checkout_record_trade` DISABLE KEYS */;
INSERT INTO `checkout_record_trade` VALUES (205,126.60),(206,126.60),(207,126.60),(208,126.60),(209,126.60),(210,126.60),(211,126.60),(212,126.60),(213,126.60),(214,126.60),(215,126.60),(216,126.60),(217,126.60),(218,126.60),(219,126.60),(220,276.60),(221,276.60),(222,276.60),(223,276.60);
/*!40000 ALTER TABLE `checkout_record_trade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(10,'cart','cart'),(11,'checkout','check'),(12,'checkout','checkout'),(13,'checkout','record_trade'),(5,'contenttypes','contenttype'),(8,'goods','category'),(9,'goods','goods'),(6,'sessions','session'),(7,'users','userprofile');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-09-29 12:05:32.082412'),(2,'auth','0001_initial','2019-09-29 12:05:41.781597'),(3,'admin','0001_initial','2019-09-29 12:05:43.934509'),(4,'admin','0002_logentry_remove_auto_add','2019-09-29 12:05:44.077679'),(5,'admin','0003_logentry_add_action_flag_choices','2019-09-29 12:05:44.146128'),(6,'admin','0004_auto_20190929_1518','2019-09-29 12:05:44.218437'),(7,'contenttypes','0002_remove_content_type_name','2019-09-29 12:05:45.490868'),(8,'auth','0002_alter_permission_name_max_length','2019-09-29 12:05:46.304279'),(9,'auth','0003_alter_user_email_max_length','2019-09-29 12:05:47.190159'),(10,'auth','0004_alter_user_username_opts','2019-09-29 12:05:47.257418'),(11,'auth','0005_alter_user_last_login_null','2019-09-29 12:05:47.892902'),(12,'auth','0006_require_contenttypes_0002','2019-09-29 12:05:47.936071'),(13,'auth','0007_alter_validators_add_error_messages','2019-09-29 12:05:48.023328'),(14,'auth','0008_alter_user_username_max_length','2019-09-29 12:05:49.812378'),(15,'auth','0009_alter_user_last_name_max_length','2019-09-29 12:05:50.629637'),(16,'auth','0010_auto_20190929_1518','2019-09-29 12:05:51.478526'),(17,'users','0001_initial','2019-09-29 12:05:51.835579'),(18,'goods','0001_initial','2019-09-29 12:05:53.366251'),(19,'cart','0001_initial','2019-09-29 12:05:55.487901'),(20,'checkout','0001_initial','2019-09-29 12:05:59.595993'),(21,'sessions','0001_initial','2019-09-29 12:06:00.262575'),(22,'cart','0002_cart_goods_price','2019-10-05 07:46:01.987336'),(23,'cart','0003_cart_unit','2019-10-05 07:55:44.004099'),(24,'cart','0004_cart_image','2019-10-05 08:04:20.800000'),(25,'checkout','0002_auto_20191008_1511','2019-10-08 07:12:32.578867'),(26,'checkout','0003_auto_20191008_1511','2019-10-08 07:12:32.645990'),(27,'checkout','0004_remove_checkout_goods_num_price','2019-10-08 08:45:25.679068'),(28,'checkout','0005_checkout_goods_num','2019-10-08 09:16:12.325366');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsname` varchar(30) NOT NULL,
  `price` decimal(5,2) NOT NULL,
  `unit` varchar(10) NOT NULL,
  `introduction` varchar(30) NOT NULL,
  `image` varchar(100) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_category_id_565f1bd9_fk_category_id` (`category_id`),
  CONSTRAINT `goods_category_id_565f1bd9_fk_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (1,'水蜜桃',23.50,'斤','个大皮薄,芳香四溢','1.jpg',3),(2,'苹果',10.50,'斤','甜美无比 甘甜适口 余味无穷','2.jpg',3),(3,'香蕉',15.40,'斤','成熟的香蕉是黄澄澄的,把它竖起来像个电话桶,横起来像一座拱桥','3.jpg',3),(4,'葡萄',20.50,'斤','葡萄皮是翠绿色的,像一颗颗碧玉似的翡翠,晶莹剔透','4.jpg',3),(5,'草莓',24.50,'斤','柔嫩汁多、形美味甜、芳香味浓、完莓演绎、演绎莓丽、鲜嫩欲滴、','5.jpg',3),(6,'樱桃',30.00,'斤','大又红的樱桃好似珍珠玛瑙般晶莹剔透,味道很甜','6.jpg',3),(7,'柠檬',15.30,'斤','柠檬是酸酸的心,盐是咸咸的泪,融在一起,就是爱情','7.jpg',3),(8,'梨',13.30,'斤','烟台梨,个大皮黄,咬一口,甜滋滋的梨水流在舌头上,','8.jpg',3),(50,'鸡腿',25.00,'斤','珍馐美味 色香味浓 外焦里嫩 清脆滑爽 玉盘珍馐','鸡腿.jpg',2),(51,'牛尾骨',66.00,'斤','牛尾巴营养价值极高,宜炖食','牛尾骨.jpg',2),(52,'三文鱼切片',78.00,'斤','三文鱼口感爽滑,肥而不腻,真滴好吃','三文鱼切片.jpg',2),(53,'小龙虾',128.00,'斤','鲜嫩的虾肉都会口水不止的流','小龙虾.jpg',2),(54,'新鲜牛腩',105.00,'斤','芳香四溢 香飘十里 油而不腻 质嫩爽口','新鲜牛腩.jpg',2),(55,'新鲜牛排',150.00,'斤','滋滋有味的牛排 香飘四溢的牛排','新鲜牛排.jpg',2),(56,'新鲜猪肉',45.00,'斤','脂肪洁白,肌肉有光泽,红色均匀,外表微干或微湿润','新鲜猪肉.jpg',2),(57,'新鲜猪排',65.00,'斤','优质蛋白质、脂肪，尤其是丰富的钙质','新鲜猪排.jpg',2),(101,'生菜',4.50,'斤','老一生鲜 西餐蔬菜 新鲜绿萝莎生菜 沙拉菜 500g','生菜.jpg',1),(102,'紫菊苣',28.80,'250g','地球紫菊苣西餐凉拌沙拉蔬菜','紫菊苣.jpg',1),(103,'西蓝花',20.80,'500g','有机西兰花 西蓝花 新鲜蔬菜 供港生鲜有机蔬菜','西蓝花.jpg',1),(104,'小油菜',13.50,'500g','火锅食材,新鲜蔬菜','小油菜.jpg',1),(105,'玉米',15.00,'斤','傲货玉米,黄糯玉米棒','玉米.jpg',1),(106,'红薯',16.80,'斤','沙地红薯地瓜小番薯','红薯.jpg',1),(107,'四季豆',13.80,'500g','有机宽芸豆,四季豆,新鲜蔬菜','四季豆.jpg',1),(108,'洋芋',16.60,'斤','绿鲜知,荷兰土豆,洋芋','洋芋.jpg',1);
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_profile`
--

DROP TABLE IF EXISTS `user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_profile` (
  `username` varchar(30) NOT NULL,
  `nickname` varchar(30) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `address` varchar(50) NOT NULL,
  `sign` varchar(50) NOT NULL,
  `info` varchar(150) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profile`
--

LOCK TABLES `user_profile` WRITE;
/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;
INSERT INTO `user_profile` VALUES ('hedong','hedong','982209077@qq.com','e10adc3949ba59abbe56e057f20f883e','15661608007','重庆市渝北区加州花园','无敌一样的存在','集性感与奔放与一身','avatar/0_u7edxsG.jpg');
/*!40000 ALTER TABLE `user_profile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-17 15:18:57
