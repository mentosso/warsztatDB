-- MySQL dump 10.13  Distrib 5.6.21, for Win64 (x86_64)
--
-- Host: localhost    Database: warsztatdb
-- ------------------------------------------------------
-- Server version	5.6.21-log

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
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_0e939a4f` (`group_id`),
  KEY `auth_group_permissions_8373b171` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_1356976_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_571f4588_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
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
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_417f1b1c` (`content_type_id`),
  CONSTRAINT `auth_permissi_content_type_id_748da3ad_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add uzytkownik',7,'add_uzytkownik'),(20,'Can change uzytkownik',7,'change_uzytkownik'),(21,'Can delete uzytkownik',7,'delete_uzytkownik'),(22,'Can add samochod',8,'add_samochod'),(23,'Can change samochod',8,'change_samochod'),(24,'Can delete samochod',8,'delete_samochod'),(25,'Can add czesci',9,'add_czesci'),(26,'Can change czesci',9,'change_czesci'),(27,'Can delete czesci',9,'delete_czesci'),(28,'Can add wizyta',10,'add_wizyta'),(29,'Can change wizyta',10,'change_wizyta'),(30,'Can delete wizyta',10,'delete_wizyta'),(31,'Can add sprzet',11,'add_sprzet'),(32,'Can change sprzet',11,'change_sprzet'),(33,'Can delete sprzet',11,'delete_sprzet');
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
  `last_login` datetime(6) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$12000$XqRNiq1GEfpt$VfILfSnmbcQVWMnfrfm9APEX9XERgc68fgNmBMhPXDs=','2015-01-09 11:51:23.655029',1,'marcin','Marcin','Mantke','200633@student.pwr.edu.pl',1,1,'2014-12-29 16:29:36.000000'),(2,'pbkdf2_sha256$12000$azZUDnpRXsMj$cbAAI3xxTBIjjeajKPyDOd3rc4BeFLkLzZAJRRy8FZU=','2015-01-09 10:21:42.000000',1,'root','','','',1,1,'2015-01-09 10:21:42.000000'),(3,'pbkdf2_sha256$12000$xNh9nbSbp7OZ$mXyoEcOv5PKOOAbpyzJi/CpYK0dLb3aK6uoz0xDiVY8=','2015-01-09 10:22:15.000000',1,'grzesiek','','','',1,1,'2015-01-09 10:22:15.000000'),(4,'pbkdf2_sha256$12000$Bep39xtfvk3P$sWX/d9ALxjDVGIHABHrUP8vxSezDTV8xS8M21DsBB7g=','2015-01-09 10:22:37.000000',0,'test1','','','',0,1,'2015-01-09 10:22:37.000000'),(5,'pbkdf2_sha256$12000$Vch0xKJfv243$clVc2knOOHYtGqNH1m1mEkTaJEYWaHJfkGp/Z7EdfGM=','2015-01-09 10:22:54.443360',0,'test2','','','',0,1,'2015-01-09 10:22:54.443360');
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
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_e8701ad4` (`user_id`),
  KEY `auth_user_groups_0e939a4f` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_3e265914_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_4385a069_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_e8701ad4` (`user_id`),
  KEY `auth_user_user_permissions_8373b171` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_15ed5735_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_5a7753c0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  KEY `django_admin_log_417f1b1c` (`content_type_id`),
  KEY `django_admin_log_e8701ad4` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_2bee147c_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_5fd58b4d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2015-01-06 21:40:33.972853','1','marcin',2,'Changed first_name and last_name.',4,1),(2,'2015-01-06 21:48:18.374415','1','Uzytkownik object',1,'',7,1),(3,'2015-01-09 10:21:42.059220','2','root',1,'',4,1),(4,'2015-01-09 10:21:51.829778','2','root',2,'No fields changed.',4,1),(5,'2015-01-09 10:21:58.507160','2','root',2,'Changed is_staff and is_superuser.',4,1),(6,'2015-01-09 10:22:15.858153','3','grzesiek',1,'',4,1),(7,'2015-01-09 10:22:21.484475','3','grzesiek',2,'No fields changed.',4,1),(8,'2015-01-09 10:22:27.632826','3','grzesiek',2,'Changed is_staff and is_superuser.',4,1),(9,'2015-01-09 10:22:37.666400','4','test1',1,'',4,1),(10,'2015-01-09 10:22:44.870812','4','test1',2,'No fields changed.',4,1),(11,'2015-01-09 10:22:54.486362','5','test2',1,'',4,1),(12,'2015-01-09 11:29:51.365114','1','1',1,'',10,1);
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
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_ff87caa_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'log entry','admin','logentry'),(2,'permission','auth','permission'),(3,'group','auth','group'),(4,'user','auth','user'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'uzytkownik','warsztat_app','uzytkownik'),(8,'samochod','warsztat_app','samochod'),(9,'czesci','warsztat_app','czesci'),(10,'wizyta','warsztat_app','wizyta'),(11,'sprzet','warsztat_app','sprzet');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2014-12-29 16:28:57.849631'),(2,'auth','0001_initial','2014-12-29 16:28:59.938750'),(3,'admin','0001_initial','2014-12-29 16:29:00.259768'),(4,'sessions','0001_initial','2014-12-29 16:29:00.377775');
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
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('icpqb4pc7l65utkd35we94awnjn8u0yn','YjI5ZGIxYmQxYTU1YTZiNWEwMTIyNTQ0NGJjYWFkYmNiMTlhOWM1Nzp7Il9hdXRoX3VzZXJfaWQiOjEsIl9hdXRoX3VzZXJfaGFzaCI6ImMwODdiMmU4MjViYTI3ZGRhNjBhNTRiMjBkNGM0MzJkMTAzY2Q4MzIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9','2015-01-22 08:33:34.470711'),('lpz70uiizllo92a1r0w4bb2u2y2hhsil','Y2Q3YTI2YTA2YzdjNmUyNmM5NjYwYWI1MmFkMDQzNzY4MTkzYmRjMzp7Il9hdXRoX3VzZXJfaGFzaCI6ImMwODdiMmU4MjViYTI3ZGRhNjBhNTRiMjBkNGM0MzJkMTAzY2Q4MzIiLCJfYXV0aF91c2VyX2lkIjoxLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9','2015-01-23 11:51:23.665030');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warsztat_app_czesci`
--

DROP TABLE IF EXISTS `warsztat_app_czesci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `warsztat_app_czesci` (
  `id_czesci` int(11) NOT NULL,
  `nazwa` varchar(50) NOT NULL,
  `producent` varchar(50) NOT NULL,
  `cena_w_hurtowni` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_czesci`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warsztat_app_czesci`
--

LOCK TABLES `warsztat_app_czesci` WRITE;
/*!40000 ALTER TABLE `warsztat_app_czesci` DISABLE KEYS */;
INSERT INTO `warsztat_app_czesci` VALUES (1,'Zarowka','Osram',10),(2,'Oslona','Test',10),(3,'ultrices iaculis','Duis Risus Company',63),(4,'lacinia','Ante Ltd',57),(5,'accumsan sed,','Feugiat Metus Corporation',58),(6,'nec tellus.','Cursus A Enim PC',50),(7,'Aliquam','Integer Sem Corp.',87),(8,'metus.','Rutrum Ltd',10),(9,'Aliquam erat','Lectus Pede Ultrices Consulting',32),(10,'venenatis a,','Odio Semper Incorporated',77),(11,'imperdiet','Lorem Luctus Associates',97),(12,'rutrum.','Lorem Auctor Quis Associates',39),(13,'Donec','Egestas Ligula Nullam Corporation',22),(14,'hendrerit neque.','Sit Amet Orci Corporation',66),(15,'sit amet,','In Consequat Industries',68),(16,'sem eget','Nunc Mauris Incorporated',4),(17,'urna. Vivamus','Dictum Corp.',4),(18,'velit','Leo Morbi Associates',69),(19,'Morbi sit','Tempor PC',30),(20,'sed sem','Nibh Sit LLC',52),(21,'Nulla','Diam Limited',53),(22,'pellentesque,','Id Magna Et Foundation',40),(23,'libero. Proin','Lobortis PC',53),(24,'erat neque','Morbi Metus Corporation',93),(25,'lacinia orci,','A Dui Industries',85),(26,'blandit congue.','Orci Lobortis Consulting',8),(27,'venenatis','Elit Foundation',34),(28,'amet','Risus LLP',79),(29,'Nunc ac','Sit Amet Ultricies Limited',58),(30,'erat.','Posuere LLC',22),(31,'augue malesuada','Ante Dictum Cursus Company',7),(32,'et,','Gravida Praesent Eu Institute',62),(33,'magna. Phasellus','Duis Cursus Diam Incorporated',90),(34,'dignissim lacus.','Neque Ltd',30),(35,'at','Risus Corp.',84),(36,'felis purus','Magna Nec Foundation',97),(37,'sociis natoque','Non Foundation',91),(38,'et,','Elit Erat Vitae LLP',35),(39,'Quisque','Pellentesque Tellus Sem Limited',62),(40,'adipiscing elit.','Tincidunt Ltd',35),(41,'iaculis odio.','Fringilla Mi Lacinia Consulting',82),(42,'molestie','Nec Inc.',43),(43,'Etiam','Lacus Pede Sagittis Corporation',2),(44,'quam. Pellentesque','Et Arcu Institute',76),(45,'fames','Eu Tellus Company',68),(46,'dignissim','Amet Nulla Donec Ltd',55),(47,'condimentum. Donec','Sed Orci Lobortis Foundation',72),(48,'et','Eu Odio LLP',71),(49,'lorem','Lorem Donec Corp.',88),(50,'condimentum eget,','Neque LLP',95),(51,'lorem, eget','Facilisis Consulting',27),(52,'quam. Pellentesque','Ut Aliquam Corporation',3),(53,'cursus','Sit Amet Associates',19),(54,'ut','Gravida Sagittis Duis Associates',31),(55,'Nam tempor','Hendrerit A Arcu Corp.',80),(56,'vitae','Lobortis Ultrices Vivamus LLP',52),(57,'libero at','Posuere LLP',47),(58,'luctus,','Orci Inc.',38),(59,'enim','Vitae PC',24),(60,'ligula tortor,','Nonummy Associates',67),(61,'eu,','Ante Company',34),(62,'eu lacus.','Pharetra Ltd',17),(63,'pede,','Ipsum Consulting',97),(64,'magna.','Lectus Ante Limited',82),(65,'aliquet nec,','Mauris Eu Turpis Industries',63),(66,'nunc','Quis PC',24),(67,'nec urna','Nec Industries',69),(68,'eleifend nec,','Iaculis Nec LLC',39),(69,'convallis erat,','Diam Luctus Lobortis Consulting',30),(70,'sed','Aliquam Tincidunt Institute',10),(71,'fames','Libero Foundation',75),(72,'libero. Morbi','Enim Condimentum Eget Institute',38),(73,'taciti sociosqu','Ullamcorper Limited',17),(74,'at,','Amet Consulting',18),(75,'mi lorem,','Tempor Bibendum Corp.',69),(76,'eu dolor','Erat Volutpat Company',41),(77,'libero','Malesuada Augue Ltd',74),(78,'nascetur','Dui Suspendisse Ac Corp.',4),(79,'at,','Parturient Montes Industries',99),(80,'Nulla dignissim.','Eleifend Nec Malesuada Corp.',33),(81,'Duis mi','Et Magna Praesent Inc.',92),(82,'Cras pellentesque.','Id Magna Et Ltd',22),(83,'Nulla eu','At Iaculis Limited',92),(84,'feugiat','Duis Mi Inc.',17),(85,'velit.','Tincidunt Company',68),(86,'mi','Sed Dictum Consulting',30),(87,'sit amet,','Lorem Ac Ltd',94),(88,'nonummy ipsum','Dui Company',80),(89,'molestie','Ante Maecenas Institute',2),(90,'velit eget','Enim Inc.',4),(91,'commodo','Cum Sociis Limited',66),(92,'convallis erat,','Praesent Luctus PC',82),(93,'nec,','Non Cursus Consulting',50),(94,'magna.','Mi Enim Condimentum Corp.',48),(95,'Integer','Fusce Institute',7),(96,'elit,','Torquent Per Inc.',84),(97,'ac','Iaculis Lacus Foundation',45),(98,'purus.','Nunc Nulla Vulputate Consulting',21),(99,'eu,','Libero PC',61),(100,'enim.','Mauris Magna Ltd',17),(101,'dui quis','Nunc Consulting',59),(102,'non,','Cras Company',20),(253,'HDS245NC4V','HNU532LM2C',53),(503,'IBLMKC7LVB','GR8CQFVKRS',58),(680,'3AU3QO2209','E7WHHAMGHU',24),(746,'O2I9X4DWE5','2VJ4U1NJ9A',71),(1073,'016VGAC8YZ','971TD4P42I',49),(1078,'469F9ES5U3','OOGJ09HA4G',15),(1239,'AAM4H702YS','C6XSLWB9NH',38),(1821,'HRUZHCDH8S','PKGKDRS90H',88),(1859,'F0HFUI5KSB','7UPOS6DUTM',1),(1880,'KWUZ95W2UX','BYQX84Z2IU',81),(1937,'KXH00LAULM','BK7WCZQAV9',49),(1942,'5SH1XOH5II','GW5IE3SNCI',54),(2381,'Y4FY47MYMG','IE8TJCULNZ',34),(2414,'XLGX5Y2V50','6WXEU1UPDT',53),(2425,'GFFF24VB2Q','H997UK2CIW',2),(2621,'SLXP4T48KZ','DKV0TQIGMD',24),(2788,'G62VR03EQY','L1RCAOIY08',44),(3132,'FNLMEXOXNA','X6THZ14P44',99),(3554,'VIIT9G3ICH','BITCYPNE73',91),(3815,'D2YSMXMGWO','9M23HYKMDG',50),(4178,'VZ1CLCG24O','AB1QQD0IO3',80),(4215,'97C24EEL17','HVZDKODYZS',3),(4428,'E35RNQT91P','ZE3TEPGEW3',33),(4565,'ZPZFWF6VZS','3XD4H2CDQE',16),(4936,'KZAJQNA797','5KF1Y0JRBE',48),(4954,'L8GX7QFNS4','K54B2KOZ44',34),(4988,'YZ1LL6J10I','7HITASR841',93),(5345,'4IOKPK11Q4','B691T1L1TL',79),(5481,'12VT42JX0Y','SXUB0YVO6E',32),(5524,'ZG60PX8YYP','5KII9UTK9F',68),(5584,'R9N5ZRA415','Y0389DAKBN',57),(6013,'5S1PXGI9XP','VR3VVBSMX7',8),(6188,'WOZ4XUNR7X','2X9U09NJVH',67),(6209,'E4PQLRNQBD','O0EEZLC2WA',56),(6461,'ZKQENIY8EE','BS0L9CZH7S',24),(6515,'GRXDNED0R4','8CN63A1K9T',82),(6887,'ZFOKHTTP6X','CCASVJWV99',92),(6903,'NRU2SOT3DW','XL4PM2CZ2F',26),(6924,'5OC6ET1EU4','NV67WPUE0F',5),(7649,'U9PJYNFLLB','LIJQ77GNGT',40),(7753,'WZG9OIHLIL','FVS313JTMN',43),(7857,'9R1A2CVZYH','UXHRCT9PMY',67),(7869,'V8MLZQMI9U','B1L91H3PMD',71),(7941,'Oslona','Test',85),(7982,'J2ZUCJX2ZI','SQPBCYQ74B',52),(8005,'9DJKFJHU7A','N3CEUV7RVF',70),(8033,'JDABVJ14X5','UWDBNOGGPC',55),(8084,'RAJWDAAK2I','0GBCD818EM',83),(8277,'JI3XJN1NGT','YV4NNRGD3Z',66),(8730,'0Z4XF0WUTQ','JCOQO0W0B0',20),(8999,'8W0FDQP9WA','EQR01MOP0Y',71),(9195,'WFXYM94OI8','CZB7139IPG',80),(9196,'1JPI9EKLBO','WVMZHVN6OX',39),(9347,'G1QJGERZB5','RGCCHBS1UO',81),(9475,'F22U7JJQ9Q','JOUPG79ZCW',43),(9689,'PP9751NBNW','MEFBOCN8L0',21),(9706,'WZBCQZXZK9','H9X5GG2RK1',49);
/*!40000 ALTER TABLE `warsztat_app_czesci` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warsztat_app_samochod`
--

DROP TABLE IF EXISTS `warsztat_app_samochod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `warsztat_app_samochod` (
  `marka` varchar(30) NOT NULL,
  `model` varchar(30) NOT NULL,
  `nr_rejestracyjny` varchar(10) NOT NULL,
  `nr_VIN` varchar(17) NOT NULL,
  `przebieg` int(10) unsigned NOT NULL,
  `id_uzytkownika` int(11) NOT NULL,
  PRIMARY KEY (`nr_rejestracyjny`),
  UNIQUE KEY `nr_VIN` (`nr_VIN`),
  KEY `warsztat_app_samochod_6b8a2a14` (`przebieg`),
  KEY `warsztat_app_samochod_3b17592e` (`id_uzytkownika`),
  CONSTRAINT `id_uzytkownika_refs_id_6f6613aa` FOREIGN KEY (`id_uzytkownika`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warsztat_app_samochod`
--

LOCK TABLES `warsztat_app_samochod` WRITE;
/*!40000 ALTER TABLE `warsztat_app_samochod` DISABLE KEYS */;
INSERT INTO `warsztat_app_samochod` VALUES ('a','sit','AC74683','94694797978736464',708659,1),('dapibus','fringilla','AE90977','94866976225748656',377438,1),('cursus','molestie','BE29541','20597322196699678',510007,3),('Sed','molestie','BN38786','94761510468088096',103014,2),('Mauris','et','BU71731','95956843118183312',352006,2),('nec,','pede','CD81953','49810044034384192',103695,2),('auctor','at,','CK31078','29438539370894432',55592,3),('elit.','tempus','CP29361','77250101477839056',292206,2),('cubilia','et','CP44592','63856794019229712',838763,5),('ultrices','ante.','CX96052','20286462428048254',500938,4),('Nullam','dolor','DD03425','76474964278750120',990993,2),('lorem','malesuada','DF62939','28259050822816788',805321,4),('lobortis','et','DJ60278','38370048250071704',291602,4),('mauris','Aenean','EH49849','68073598034679888',195579,3),('nostra,','est,','EI15779','85895859501324592',15809,5),('gravida','nunc','EN02084','55473279552534224',483466,2),('interdum.','Suspendisse','EP16849','68376484811306000',687204,3),('metus.','luctus','EP24187','77736472096294168',936517,3),('id,','vitae,','ES66047','84741916395723824',184366,3),('a','Phasellus','FD20015','98393993321806192',276210,3),('Maecenas','turpis.','FI21525','45329549955204128',698039,4),('Donec','purus','FR33662','33624583645723760',574919,3),('risus.','Sed','FV61365','33224613014608620',137614,2),('ligula','fermentum','GI41101','53180031664669512',523348,5),('malesuada','dui','GJ91361','97790609952062368',881953,1),('arcu.','ac','GY18077','38219922455027700',818136,2),('Donec','est.','HA60710','58557095262221992',415810,3),('vitae','vel','HH17073','37756608063355088',152912,2),('semper','rutrum','IT39446','73292560749687256',670865,1),('Curabitur','Vestibulum','IU68679','33763204566203056',702774,5),('dolor','netus','JA83356','28316778163425624',481293,2),('id','elit,','JD60146','35445975647307932',788505,1),('faucibus','risus.','JE56278','43574008028954268',267997,4),('turpis.','pede','JL24462','86364386891946192',848480,1),('vulputate,','neque.','JO47851','33160012094303964',893047,3),('Phasellus','Sed','JR15112','17585701202042401',288962,3),('elit,','pede,','KL19070','92612398541532464',511049,2),('Phasellus','Aliquam','KO19286','51322411065921184',802474,1),('sed','mollis.','KS72609','61895591830834744',629700,1),('Nunc','ut','KV48450','58576363162137568',99166,1),('et','ultricies','LO23338','42955788983963428',475248,2),('nunc','Mauris','LO84747','65363302645273504',475022,2),('velit.','aliquet.','LR67700','40022970493882896',893513,5),('elit,','sed','LT42175','12162517691031098',218997,2),('metus.','sapien.','LV00670','89199487771838896',493555,4),('laoreet','tempor,','LW51485','60994073050096632',76946,5),('sit','sit','LX72768','74972278387285768',908514,4),('sapien.','In','MD85477','29922634512186052',668379,5),('Cras','lorem.','MG03512','65877701090648768',140860,2),('penatibus','ante,','MK31053','72925275517627600',177036,2),('egestas.','mattis','MP01021','85327935479581360',890822,4),('rutrum','dis','MY99254','29180744090117516',603896,4),('Quisque','ut','NB54895','73880293974652888',525372,2),('egestas.','faucibus','ND64083','77323622419498864',648199,5),('odio','ac','NG55809','35535123599693180',185359,3),('libero.','Proin','NW50029','98747398331761360',971893,2),('vel','mauris','NX71229','69144339184276760',808278,3),('ut,','enim.','NZ75835','88895283904857936',861430,1),('nibh','nec,','OE11229','36776546407490968',480118,1),('Proin','odio','OG15465','93488714070990688',91787,2),('imperdiet','feugiat.','OM34609','49142868891358376',190249,2),('Vestibulum','parturient','OT08717','68450119746848944',537183,4),('sapien,','scelerisque,','PN70969','73377373623661696',278894,4),('felis','lectus','QI69000','69357913429848848',562702,5),('luctus','Integer','QO02975','77293810043483976',330102,5),('non','erat','QP10861','12862784252502024',272289,1),('est,','vitae,','QP13128','71804151711985472',831713,3),('leo.','eu','QR12018','27971133287064732',116771,1),('eros','risus','QS81046','20189326605759562',301789,3),('Fusce','purus','QU79300','14650221290066838',228843,5),('non','nascetur','RE00052','60494262427091600',905644,1),('magna.','interdum.','RO41405','97458336642012000',760597,1),('augue','mus.','RT50420','29993158001452684',396920,5),('mollis','eget','RT96968','61393599943257872',446283,1),('vel','convallis,','SP68249','61697037201374768',133833,3),('lacinia','tristique','SS92837','51838535051792864',460805,2),('et','per','SV33505','18930402677506208',408647,5),('massa','Integer','TJ90168','55958618484437464',936947,5),('torquent','hendrerit','TO91727','25010352055542172',652829,3),('est,','tristique','UB12035','45261985696852208',886300,1),('et','lacus,','UB97870','34868390518240632',355289,3),('ipsum.','Donec','UY06528','99368441323749728',935668,4),('lacus','Sed','VL98426','94897580817341808',5801,3),('ante.','libero','VO66456','31708866022527216',103654,1),('Suspendisse','Phasellus','VT26018','27818953464739024',575127,4),('Integer','Aliquam','VT52301','73562072212807832',378879,3),('dictum','Ut','VY14653','23924625278450548',549449,3),('augue.','Maecenas','WJ34724','58521586712449792',606141,4),('ornare','dictum','WJ82689','79795431625097992',679676,5),('magna.','eu','WS45561','25378666124306620',976357,2),('quis','commodo','XF05357','15626083821989596',536139,1),('Aenean','quam','XK61162','67879248480312528',351083,2),('Vivamus','venenatis','XT59849','40468116146512328',509592,4),('lorem.','sit','XT93187','38158899475820364',679723,5),('sed','Sed','XW76361','78963424973189832',442801,3),('Nunc','nunc','YA54081','42248544739559292',152262,5),('non','Cras','YM81673','36856433865614236',111861,4),('laoreet','malesuada','YS11991','65645319111645224',951391,3),('faucibus.','vel','ZO06363','11782216704450547',573885,1),('scelerisque','iaculis','ZP13097','99832004657946528',238539,1),('tincidunt','lacus.','ZT11979','69949339930899440',294956,2),('ut,','id','ZU61729','16996440207585692',626370,5);
/*!40000 ALTER TABLE `warsztat_app_samochod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warsztat_app_sprzet`
--

DROP TABLE IF EXISTS `warsztat_app_sprzet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `warsztat_app_sprzet` (
  `id_sprzetu` int(11) NOT NULL,
  `nazwa_sprzetu` varchar(20) NOT NULL,
  `status` varchar(3) NOT NULL,
  `opis` varchar(200) NOT NULL,
  `data_przegladu` date NOT NULL,
  PRIMARY KEY (`id_sprzetu`),
  KEY `warsztat_app_sprzet_7d943bc0` (`nazwa_sprzetu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warsztat_app_sprzet`
--

LOCK TABLES `warsztat_app_sprzet` WRITE;
/*!40000 ALTER TABLE `warsztat_app_sprzet` DISABLE KEYS */;
INSERT INTO `warsztat_app_sprzet` VALUES (1,'sodales','zaj','Fusce feugiat.','2015-10-05'),(2,'tempus','zaj','orci, in consequat enim diam vel arcu.','2015-11-03'),(3,'nulla','wol','nascetur','2015-10-09'),(4,'dui','wol','sed turpis','2015-12-29');
/*!40000 ALTER TABLE `warsztat_app_sprzet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warsztat_app_uzytkownik`
--

DROP TABLE IF EXISTS `warsztat_app_uzytkownik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `warsztat_app_uzytkownik` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `PESEL` decimal(11,0) NOT NULL,
  `NIP` decimal(10,0) DEFAULT NULL,
  `data_zatrudnienia` date NOT NULL,
  `wynagrodzenie` int(10) unsigned DEFAULT NULL,
  `data_urodzenia` date NOT NULL,
  `adres` varchar(50) NOT NULL,
  `nr_telefonu` decimal(9,0) DEFAULT NULL,
  `stanowisko` varchar(4) NOT NULL,
  `dzial` varchar(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `PESEL` (`PESEL`),
  CONSTRAINT `user_id_refs_id_aba8e5a3` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warsztat_app_uzytkownik`
--

LOCK TABLES `warsztat_app_uzytkownik` WRITE;
/*!40000 ALTER TABLE `warsztat_app_uzytkownik` DISABLE KEYS */;
INSERT INTO `warsztat_app_uzytkownik` VALUES (1,1,93060102892,6911314930,'2015-01-06',50000,'1993-06-01','Plac Grunwaldzki 4/14',667715649,'adm','elek'),(2,2,78681966532,NULL,'2009-03-07',9817,'1962-11-25','702-6619 Taciti Road',720707598,'adm','wulk'),(3,3,20395893706,NULL,'2011-12-15',16977,'1967-08-24','9478 Cum Street',411704151,'kli','mech'),(4,4,27146147023,NULL,'2008-01-20',4457,'1987-09-29','703 Turpis Road',210155944,'wlas','mech'),(5,5,80255860672,NULL,'2012-08-15',7921,'1971-09-04','174-5773 Amet Road',924951444,'wlas','elek');
/*!40000 ALTER TABLE `warsztat_app_uzytkownik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warsztat_app_wizyta`
--

DROP TABLE IF EXISTS `warsztat_app_wizyta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `warsztat_app_wizyta` (
  `id_wizyty` int(11) NOT NULL,
  `data` date NOT NULL,
  `status` varchar(6) NOT NULL,
  `id_uzytkownika` int(11) NOT NULL,
  `nr_rejestracyjny` varchar(10) NOT NULL,
  `przebieg_w_momencie_wizyty` int(10) unsigned NOT NULL,
  `opis` varchar(200) NOT NULL,
  `id_czesci` int(11) NOT NULL,
  `cena` int(10) unsigned NOT NULL,
  `czas_pracowników` int(10) unsigned NOT NULL,
  `id_sprzetu` int(11) NOT NULL,
  PRIMARY KEY (`id_wizyty`),
  KEY `nr_rejestracyjny_refs_nr_rejestracyjny_a0df891d` (`nr_rejestracyjny`),
  KEY `warsztat_app_wizyta_3d40d808` (`data`),
  KEY `warsztat_app_wizyta_48fb58bb` (`status`),
  KEY `warsztat_app_wizyta_3b17592e` (`id_uzytkownika`),
  KEY `warsztat_app_wizyta_0e1dc267` (`id_czesci`),
  KEY `warsztat_app_wizyta_c243bc7b` (`id_sprzetu`),
  CONSTRAINT `id_czesci_refs_id_czesci_d79b9e97` FOREIGN KEY (`id_czesci`) REFERENCES `warsztat_app_czesci` (`id_czesci`),
  CONSTRAINT `id_sprzetu_refs_id_sprzetu_40478433` FOREIGN KEY (`id_sprzetu`) REFERENCES `warsztat_app_sprzet` (`id_sprzetu`),
  CONSTRAINT `id_uzytkownika_refs_id_a6f6d7d1` FOREIGN KEY (`id_uzytkownika`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `nr_rejestracyjny_refs_nr_rejestracyjny_a0df891d` FOREIGN KEY (`nr_rejestracyjny`) REFERENCES `warsztat_app_samochod` (`nr_rejestracyjny`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warsztat_app_wizyta`
--

LOCK TABLES `warsztat_app_wizyta` WRITE;
/*!40000 ALTER TABLE `warsztat_app_wizyta` DISABLE KEYS */;
INSERT INTO `warsztat_app_wizyta` VALUES (1,'2015-01-09','rez',1,'VT52301',102056,'wymiana zarowki',1,50,1,2);
/*!40000 ALTER TABLE `warsztat_app_wizyta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-01-09 13:09:59
