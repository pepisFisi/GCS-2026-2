/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `foots`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foots` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `goalkeepers`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goalkeepers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `player_id` int NOT NULL,
  `gk_diving` int NOT NULL,
  `gk_handling` int NOT NULL,
  `gk_kicking` int NOT NULL,
  `gk_positioning` int NOT NULL,
  `gk_reflexes` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_goalkeepers_player` (`player_id`),
  CONSTRAINT `fk_goalkeepers_player` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `leagues`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leagues` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `nation_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_leagues_nation` (`nation_id`),
  CONSTRAINT `fk_leagues_nation` FOREIGN KEY (`nation_id`) REFERENCES `nations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nations`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `play_styles`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `play_styles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `players`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `players` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ranking` int NOT NULL,
  `name` varchar(40) NOT NULL,
  `ovr` int NOT NULL,
  `pac` int NOT NULL,
  `sho` int NOT NULL,
  `pas` int NOT NULL,
  `dri` int NOT NULL,
  `def` int NOT NULL,
  `phy` int NOT NULL,
  `weak_foot` int NOT NULL,
  `skill_moves` int NOT NULL,
  `height` int NOT NULL,
  `weight` int NOT NULL,
  `age` int NOT NULL,
  `url` varchar(200) NOT NULL,
  `position_id` int NOT NULL,
  `nation_id` int NOT NULL,
  `team_id` int NOT NULL,
  `foot_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_players_position` (`position_id`),
  KEY `fk_players_nation` (`nation_id`),
  KEY `fk_players_team` (`team_id`),
  KEY `fk_players_foot` (`foot_id`),
  CONSTRAINT `fk_players_foot` FOREIGN KEY (`foot_id`) REFERENCES `foots` (`id`),
  CONSTRAINT `fk_players_nation` FOREIGN KEY (`nation_id`) REFERENCES `nations` (`id`),
  CONSTRAINT `fk_players_position` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`),
  CONSTRAINT `fk_players_team` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `players_play_styles`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `players_play_styles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `player_id` int NOT NULL,
  `play_style_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_players_play_styles_player` (`player_id`),
  KEY `fk_players_play_styles_play_style` (`play_style_id`),
  CONSTRAINT `fk_players_play_styles_play_style` FOREIGN KEY (`play_style_id`) REFERENCES `play_styles` (`id`),
  CONSTRAINT `fk_players_play_styles_player` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `players_positions`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `players_positions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `player_id` int NOT NULL,
  `position_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_players_positions_player` (`player_id`),
  KEY `fk_players_positions_position` (`position_id`),
  CONSTRAINT `fk_players_positions_player` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`),
  CONSTRAINT `fk_players_positions_position` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `positions`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `positions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schema_migrations`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(128) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `teams`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `league_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_teams_league` (`league_id`),
  CONSTRAINT `fk_teams_league` FOREIGN KEY (`league_id`) REFERENCES `leagues` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'fifa25'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed

--
-- Dbmate schema migrations
--

LOCK TABLES `schema_migrations` WRITE;
INSERT INTO `schema_migrations` (version) VALUES
  ('20260912215023'),
  ('20260912220928'),
  ('20260912221127'),
  ('20260912221249'),
  ('20260912221505'),
  ('20260912222836'),
  ('20260912223016'),
  ('20260912223526'),
  ('20260912223721'),
  ('20260912223753'),
  ('20260912223850'),
  ('20260912225213'),
  ('20260919223649'),
  ('20260919230151'),
  ('20260919231550');
UNLOCK TABLES;
