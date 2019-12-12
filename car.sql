-- MySQL dump 10.13  Distrib 5.7.20, for Win64 (x86_64)
--
-- Host: localhost    Database: car
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `dept_inf`
--

DROP TABLE IF EXISTS `dept_inf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dept_inf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `remark` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept_inf`
--

LOCK TABLES `dept_inf` WRITE;
/*!40000 ALTER TABLE `dept_inf` DISABLE KEYS */;
INSERT INTO `dept_inf` VALUES (1,'技术部','技术部'),(2,'运营部','运营部'),(3,'财务部','财务部'),(5,'总公办','总公办'),(6,'市场部','市场部'),(7,'教学部','教学部'),(28,'123','123'),(29,'1','1');
/*!40000 ALTER TABLE `dept_inf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_inf`
--

DROP TABLE IF EXISTS `document_inf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document_inf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `filename` varchar(300) DEFAULT NULL,
  `remark` varchar(300) DEFAULT NULL,
  `create_date` varchar(20) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_inf`
--

LOCK TABLES `document_inf` WRITE;
/*!40000 ALTER TABLE `document_inf` DISABLE KEYS */;
INSERT INTO `document_inf` VALUES (1,'2,2','01.jpg','11',NULL,NULL),(2,'2,2','01.jpg',NULL,NULL,NULL),(3,'4','2.jpg','4',NULL,NULL),(4,'1','1.jpg','1',NULL,NULL),(5,'2','1.jpg','2',NULL,NULL),(6,'2','1.jpg','2',NULL,NULL),(7,'3','5.jpg','3',NULL,NULL),(8,'2','5.jpg','2',NULL,NULL),(9,'额外热污染','tqe.sql','热舞任务二r',NULL,1);
/*!40000 ALTER TABLE `document_inf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_inf`
--

DROP TABLE IF EXISTS `employee_inf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_inf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_id` int(11) DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `card_id` varchar(20) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `post_code` varchar(50) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `qq_num` varchar(10) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `party` varchar(10) DEFAULT NULL,
  `birthday` char(20) DEFAULT NULL,
  `race` varchar(100) DEFAULT NULL,
  `education` varchar(10) DEFAULT NULL,
  `speciality` varchar(20) DEFAULT NULL,
  `hobby` varchar(100) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `create_date` varchar(20) DEFAULT NULL,
  `password` varchar(50) DEFAULT '111111',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_inf`
--

LOCK TABLES `employee_inf` WRITE;
/*!40000 ALTER TABLE `employee_inf` DISABLE KEYS */;
INSERT INTO `employee_inf` VALUES (1,1,8,'xujian','4328011988','广州天河','510000','020-77777777','13902001111','36750066','251425887@qq.com',0,'党员','1980-01-01 00:00:00','满','本科','美声','唱歌','四大天王','2016-03-14 11:35:18','123456'),(2,3,1,'杰克','22623','43234','42427424','42242','4247242','42424','251425887@qq.com',2,NULL,NULL,NULL,'1',NULL,NULL,NULL,'2016-03-14 11:35:18',NULL),(3,1,2,'bb','432801197711251038','广州','510000','020-99999999','13907351532','36750064','36750064@qq.com',1,'党员','1977-11-25 00:00:00','汉','本科','计算机','爬山','无','2016-07-14 09:54:52',NULL),(4,NULL,NULL,'1','2','7',NULL,NULL,'6',NULL,'5',3,NULL,NULL,NULL,'4',NULL,NULL,NULL,NULL,NULL),(6,1,1,'啦啦啦啦','32165498765','ssssss',NULL,NULL,'18435997695',NULL,'xj14368@163.com',1,NULL,NULL,NULL,'本科',NULL,NULL,NULL,'2019-05-12','32165498765');
/*!40000 ALTER TABLE `employee_inf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_inf`
--

DROP TABLE IF EXISTS `job_inf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_inf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `remark` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_inf`
--

LOCK TABLES `job_inf` WRITE;
/*!40000 ALTER TABLE `job_inf` DISABLE KEYS */;
INSERT INTO `job_inf` VALUES (1,'职员1','职员'),(2,'Java开发工程师','Java开发工程师'),(3,'Java中级开发工程师','Java中级开发工程师'),(4,'Java高级开发工程师','Java高级开发工程师'),(6,'架构师','架构师'),(7,'主管','主管'),(8,'经理','经理'),(9,'总经理','总经理'),(10,'2','2'),(11,'1','2,3,4,5,6,7');
/*!40000 ALTER TABLE `job_inf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_inf`
--

DROP TABLE IF EXISTS `leave_inf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leave_inf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` varchar(50) DEFAULT NULL,
  `eid` varchar(255) DEFAULT NULL,
  `leaveid` int(11) DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `reqmessage` varchar(255) DEFAULT NULL,
  `start_time` varchar(50) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `stop_time` varchar(50) DEFAULT NULL,
  `update_time` varchar(50) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `carname` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_inf`
--

LOCK TABLES `leave_inf` WRITE;
/*!40000 ALTER TABLE `leave_inf` DISABLE KEYS */;
INSERT INTO `leave_inf` VALUES (1,'2019-05-10 10:35:24','1',1,'1','我想请个假。可以不可以','2019-05-01 00:00:00','1','2019-05-17 00:00:00','2019-05-10 10:40:11','13天',' 			sdfsd						','A'),(2,'2019-05-05 10:37:50','2',2,'1','我只是想请一个年假','2019-05-14 00:00:00','1','2019-05-25 00:00:00','2019-05-05 13:44:05','10天',NULL,'B'),(3,'2019-05-05 10:42:25','3',1,'1','说是','2019-05-20 00:00:00','2','2019-05-13 00:00:00','2019-05-10 10:41:19','6天',' 			ssfasdfsdafsdafsadfasdsadfsadf						','C'),(76,'2019-05-12 14:06:22','1',11,'1','sdfsdfsaf','2019-05-08 00:00:00','1','2019-05-23 00:00:00','2019-05-12 14:07:02','12天',' 			算了 给你个假把						','D'),(77,'2019-05-12 14:28:16','1',4,NULL,'45435','2019-05-01 00:00:00','0','2019-05-02 00:00:00',NULL,'2天',NULL,'E'),(78,'2019-12-11 23:57:28',NULL,3,NULL,NULL,NULL,'-1',NULL,NULL,NULL,NULL,'324'),(79,'2019-12-11 23:57:28',NULL,3,NULL,NULL,NULL,'-1',NULL,NULL,NULL,NULL,'324'),(80,'2019-12-11 23:57:28',NULL,3,NULL,NULL,NULL,'-1',NULL,NULL,NULL,NULL,'324'),(81,'2019-12-11 23:58:03',NULL,1,NULL,NULL,NULL,'-1',NULL,NULL,NULL,NULL,'34'),(82,'2019-12-11 23:58:04',NULL,1,NULL,NULL,NULL,'-1',NULL,NULL,NULL,NULL,'34'),(83,'2019-12-12 00:02:20',NULL,1,NULL,NULL,NULL,'-1',NULL,NULL,NULL,NULL,'87');
/*!40000 ALTER TABLE `leave_inf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leavetype_inf`
--

DROP TABLE IF EXISTS `leavetype_inf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leavetype_inf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leavetype_inf`
--

LOCK TABLES `leavetype_inf` WRITE;
/*!40000 ALTER TABLE `leavetype_inf` DISABLE KEYS */;
INSERT INTO `leavetype_inf` VALUES (1,'奔驰'),(2,'宝马'),(3,'大众'),(4,'奥迪'),(5,'兰博');
/*!40000 ALTER TABLE `leavetype_inf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice_inf`
--

DROP TABLE IF EXISTS `notice_inf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice_inf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `content` text,
  `create_date` char(20) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice_inf`
--

LOCK TABLES `notice_inf` WRITE;
/*!40000 ALTER TABLE `notice_inf` DISABLE KEYS */;
INSERT INTO `notice_inf` VALUES (1,'1112','132323',NULL,NULL),(2,'444','4444',NULL,NULL);
/*!40000 ALTER TABLE `notice_inf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_inf`
--

DROP TABLE IF EXISTS `user_inf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_inf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `createdate` char(20) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_inf`
--

LOCK TABLES `user_inf` WRITE;
/*!40000 ALTER TABLE `user_inf` DISABLE KEYS */;
INSERT INTO `user_inf` VALUES (1,'admin','123456',2,'2016-03-12 09:34:28','超级管理员1'),(2,'root','123456',NULL,'2016-03-12 09:34:28','root'),(3,'哈哈','123456',NULL,'2016-03-12 09:34:28','哈哈'),(4,'rain','123456',NULL,'2016-03-12 09:34:28','rain'),(5,'lalala','123456',NULL,NULL,'wangtian'),(6,'324','234',NULL,NULL,'234');
/*!40000 ALTER TABLE `user_inf` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-12 21:04:56
