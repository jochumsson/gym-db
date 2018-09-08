-- MySQL dump 10.13  Distrib 5.7.17, for Linux (i686)
--
-- Host: localhost    Database: gym_db
-- ------------------------------------------------------
-- Server version	5.7.17-0ubuntu0.16.04.2

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
-- Table structure for table `apparatus`
--

DROP TABLE IF EXISTS `apparatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apparatus` (
  `apparatus_name` varchar(128) NOT NULL,
  PRIMARY KEY (`apparatus_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `competition`
--

DROP TABLE IF EXISTS `competition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `competition` (
  `competition_name` varchar(128) NOT NULL,
  `competition_date` date NOT NULL,
  `competition_type` varchar(128) DEFAULT NULL,
  `closed` tinyint(1) DEFAULT NULL,
  `team_competition` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`competition_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `competition_gymnast`
--

DROP TABLE IF EXISTS `competition_gymnast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `competition_gymnast` (
  `competition_name` varchar(128) NOT NULL,
  `level` int(11) DEFAULT NULL,
  `gymnast_id` varchar(64) NOT NULL,
  `gymnast_name` varchar(45) DEFAULT NULL,
  `gymnast_club` varchar(128) DEFAULT NULL,
  `gymnast_team` varchar(128) DEFAULT NULL,
  `gymnast_start_number` int(11) DEFAULT '1',
  PRIMARY KEY (`gymnast_id`,`competition_name`),
  KEY `competition_name_fk` (`competition_name`),
  CONSTRAINT `competition_name_fk` FOREIGN KEY (`competition_name`) REFERENCES `competition` (`competition_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `competition_judgement`
--

DROP TABLE IF EXISTS `competition_judgement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `competition_judgement` (
  `competition_name` varchar(128) NOT NULL,
  `apparatus` varchar(128) NOT NULL,
  `level` int(11) NOT NULL,
  `judge_number` int(11) NOT NULL DEFAULT '2',
  `judge_id_1` varchar(64) DEFAULT NULL,
  `judge_id_2` varchar(64) DEFAULT NULL,
  `judge_id_3` varchar(64) DEFAULT NULL,
  `judge_id_4` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`competition_name`,`apparatus`,`level`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `competition_result`
--

DROP TABLE IF EXISTS `competition_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `competition_result` (
  `competition_name` varchar(128) NOT NULL,
  `result_type` varchar(128) NOT NULL,
  `level` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `gymnast_id` varchar(128) NOT NULL,
  `final_score` double DEFAULT NULL,
  PRIMARY KEY (`competition_name`,`result_type`,`level`,`gymnast_id`),
  KEY `result_type_fk` (`result_type`),
  KEY `competition_result_gymnast_id_fk` (`gymnast_id`),
  CONSTRAINT `competition_result_competition_name_fk` FOREIGN KEY (`competition_name`) REFERENCES `competition` (`competition_name`),
  CONSTRAINT `competition_result_gymnast_id_fk` FOREIGN KEY (`gymnast_id`) REFERENCES `competition_gymnast` (`gymnast_id`),
  CONSTRAINT `result_type_fk` FOREIGN KEY (`result_type`) REFERENCES `result` (`result_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `competition_result_cop_view`
--

DROP TABLE IF EXISTS `competition_result_cop_view`;
/*!50001 DROP VIEW IF EXISTS `competition_result_cop_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `competition_result_cop_view` AS SELECT 
 1 AS `competition_name`,
 1 AS `competition_closed`,
 1 AS `team_competition`,
 1 AS `result_type`,
 1 AS `apparatus`,
 1 AS `level`,
 1 AS `position`,
 1 AS `result_final_score`,
 1 AS `gymnast_id`,
 1 AS `gymnast_name`,
 1 AS `gymnast_club`,
 1 AS `gymnast_team`,
 1 AS `score_final_score`,
 1 AS `base_score`,
 1 AS `d_score`,
 1 AS `e1_deduction`,
 1 AS `e2_deduction`,
 1 AS `e3_deduction`,
 1 AS `e4_deduction`,
 1 AS `d_penalty`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `competition_score`
--

DROP TABLE IF EXISTS `competition_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `competition_score` (
  `competition_name` varchar(128) NOT NULL,
  `apparatus` varchar(128) NOT NULL,
  `gymnast_id` varchar(64) NOT NULL,
  `final_score` double DEFAULT NULL,
  `base_score` double DEFAULT NULL,
  `d_score` double DEFAULT NULL,
  `e1_deduction` double DEFAULT NULL,
  `e2_deduction` double DEFAULT NULL,
  `e3_deduction` double DEFAULT NULL,
  `e4_deduction` double DEFAULT NULL,
  `d_penalty` double DEFAULT NULL,
  PRIMARY KEY (`competition_name`,`apparatus`,`gymnast_id`),
  KEY `gymnast_id_fk` (`gymnast_id`),
  KEY `apparatus_fk` (`apparatus`),
  CONSTRAINT `apparatus_fk` FOREIGN KEY (`apparatus`) REFERENCES `apparatus` (`apparatus_name`),
  CONSTRAINT `competition_name` FOREIGN KEY (`competition_name`) REFERENCES `competition` (`competition_name`),
  CONSTRAINT `gymnast_id_fk` FOREIGN KEY (`gymnast_id`) REFERENCES `competition_gymnast` (`gymnast_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `competition_score_cop_view`
--

DROP TABLE IF EXISTS `competition_score_cop_view`;
/*!50001 DROP VIEW IF EXISTS `competition_score_cop_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `competition_score_cop_view` AS SELECT 
 1 AS `competition_name`,
 1 AS `apparatus`,
 1 AS `level`,
 1 AS `final_score`,
 1 AS `d_score`,
 1 AS `base_score`,
 1 AS `e1_deduction`,
 1 AS `e2_deduction`,
 1 AS `e3_deduction`,
 1 AS `d_penalty`,
 1 AS `gymnast_id`,
 1 AS `gymnast_name`,
 1 AS `gymnast_start_number`,
 1 AS `gymnast_club`,
 1 AS `gymnast_team`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `judge`
--

DROP TABLE IF EXISTS `judge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `judge` (
  `name` varchar(128) NOT NULL,
  `id` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `result`
--

DROP TABLE IF EXISTS `result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `result` (
  `result_type` varchar(128) NOT NULL,
  `apparatus` varchar(128) NOT NULL,
  PRIMARY KEY (`result_type`,`apparatus`),
  KEY `result_apparatus_fk` (`apparatus`),
  CONSTRAINT `result_apparatus_fk` FOREIGN KEY (`apparatus`) REFERENCES `apparatus` (`apparatus_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Final view structure for view `competition_result_cop_view`
--

/*!50001 DROP VIEW IF EXISTS `competition_result_cop_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `competition_result_cop_view` AS select `competition_result`.`competition_name` AS `competition_name`,`competition`.`closed` AS `competition_closed`,`competition`.`team_competition` AS `team_competition`,`competition_result`.`result_type` AS `result_type`,`result`.`apparatus` AS `apparatus`,`competition_result`.`level` AS `level`,`competition_result`.`position` AS `position`,`competition_result`.`final_score` AS `result_final_score`,`competition_result`.`gymnast_id` AS `gymnast_id`,`competition_gymnast`.`gymnast_name` AS `gymnast_name`,`competition_gymnast`.`gymnast_club` AS `gymnast_club`,`competition_gymnast`.`gymnast_team` AS `gymnast_team`,`competition_score`.`final_score` AS `score_final_score`,`competition_score`.`base_score` AS `base_score`,`competition_score`.`d_score` AS `d_score`,`competition_score`.`e1_deduction` AS `e1_deduction`,`competition_score`.`e2_deduction` AS `e2_deduction`,`competition_score`.`e3_deduction` AS `e3_deduction`,`competition_score`.`e4_deduction` AS `e4_deduction`,`competition_score`.`d_penalty` AS `d_penalty` from ((((`competition_result` join `competition` on((`competition_result`.`competition_name` = `competition`.`competition_name`))) join `result` on((`competition_result`.`result_type` = `result`.`result_type`))) join `competition_gymnast` on((`competition_result`.`gymnast_id` = `competition_gymnast`.`gymnast_id`))) join `competition_score` on(((`competition_result`.`competition_name` = `competition_score`.`competition_name`) and (`result`.`apparatus` = `competition_score`.`apparatus`) and (`competition_result`.`gymnast_id` = `competition_score`.`gymnast_id`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `competition_score_cop_view`
--

/*!50001 DROP VIEW IF EXISTS `competition_score_cop_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `competition_score_cop_view` AS select `competition_score`.`competition_name` AS `competition_name`,`competition_score`.`apparatus` AS `apparatus`,`competition_gymnast`.`level` AS `level`,`competition_score`.`final_score` AS `final_score`,`competition_score`.`d_score` AS `d_score`,`competition_score`.`base_score` AS `base_score`,`competition_score`.`e1_deduction` AS `e1_deduction`,`competition_score`.`e2_deduction` AS `e2_deduction`,`competition_score`.`e3_deduction` AS `e3_deduction`,`competition_score`.`d_penalty` AS `d_penalty`,`competition_gymnast`.`gymnast_id` AS `gymnast_id`,`competition_gymnast`.`gymnast_name` AS `gymnast_name`,`competition_gymnast`.`gymnast_start_number` AS `gymnast_start_number`,`competition_gymnast`.`gymnast_club` AS `gymnast_club`,`competition_gymnast`.`gymnast_team` AS `gymnast_team` from (`competition_score` join `competition_gymnast` on(((`competition_score`.`competition_name` = `competition_gymnast`.`competition_name`) and (`competition_score`.`gymnast_id` = `competition_gymnast`.`gymnast_id`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-08 15:24:33
