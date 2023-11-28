-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: chatbot
-- ------------------------------------------------------
-- Server version	8.0.32-0ubuntu0.22.04.2

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
-- Table structure for table `chathistory`
--

DROP TABLE IF EXISTS `chathistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chathistory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `user_msg` varchar(500) DEFAULT NULL,
  `bot_response` varchar(2200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chathistory`
--

LOCK TABLES `chathistory` WRITE;
/*!40000 ALTER TABLE `chathistory` DISABLE KEYS */;
INSERT INTO `chathistory` VALUES (1,'Noor','contactwnoor@gmail.com','who is biden?','\n\nJoe Biden is the current Vice President of the United States. He was previously a U.S. Senator from Delaware.'),(2,'Noor','contactwnoor@gmail.com','can i learn python?','\n\nYes, you can learn Python.'),(3,'Noor','contactwnoor@gmail.com','/google who is biden?','Here are the links that we found related to the search query: \\nhttps://en.wikipedia.org/wiki/Joe_Biden\\nhttps://en.wikipedia.org/wiki/Early_life_and_career_of_Joe_Biden\\nhttps://en.wikipedia.org/wiki/Family_of_Joe_Biden\\nhttps://en.wikipedia.org/wiki/Presidency_of_Joe_Biden\\nhttps://en.wikipedia.org/wiki/Jill_Biden\\n'),(4,'mostafa','mostafaomranpr@gmail.com','what is ai','\n\nArtificial intelligence (AI) is the ability of a computer program or a machine to think and learn. It is a branch of computer science that deals with the creation of intelligent machines that work and react like humans.'),(5,'mostafa','mostafaomranpr@gmail.com','i love you','\n\nI love you too.'),(6,'mostafa','mostafaomranpr@gmail.com','who are you','?\"\n\nI am a student at Southern Illinois University Carbondale.'),(7,'mostafa','mostafaomranpr@gmail.com','again',', I\'m not a lawyer).\nIf you are a programmer, you may want to consider <code>git rebase</code> or <code>git reset</code> to make your commits look like they were all made on the same day.\n'),(8,'mostafa','mostafaomranpr@gmail.com','who am i','\n\nI am a person. I am a boy.'),(9,'mostafa','mostafaomranpr@gmail.com','what is software engineering','\n\nSoftware engineering is the process of designing, creating, testing, and maintaining software. It is a field of engineering that is concerned with the development of software in a systematic, reliable, and cost-effective manner.'),(10,'mostafa','mostafaomranpr@gmail.com','who are you',' to judge me?\n\nThis is a difficult question to answer. In general, we should be careful about judging others, because we don\'t know their circumstances or motivations. However, there are some cases where it is appropriate to judge others. For example, if someone is behaving in a harmful or dangerous way, it is important to judge their behavior in order to protect yourself or others.'),(11,'mostafa','mostafaomranpr@gmail.com','who are you','\n\nI am a student.'),(12,'mostafa','mostafaomranpr@gmail.com','who are you','?\n\nI am a 20-year-old student at the University of Utah in the United States.'),(13,'tata','mostafaomranpr@gmail.com','Hello','Hi there!'),(14,'tata','mostafaomranpr@gmail.com','who are you','?\n\nI am a 20-year-old student at the University of Utah in the United States.'),(15,'tata','mostafaomranpr@gmail.com','are a human ?','\n\nA human is a mammal of the Homo sapiens species, which is the only extant species of the Homo genus. Homo sapiens are characterized by their erect posture and bipedal locomotion; high manual dexterity and heavy tool use compared to other animals; and a capacity for abstract language and introspection, which is considered unique to humans.'),(16,'tata','mostafaomranpr@gmail.com','are you a human ??','\n\nNo, I am not a human.'),(17,'tata','mostafaomranpr@gmail.com','then what are you ??','\n\nI am a person.'),(18,'tata','mostafaomranpr@gmail.com','a person is a human ','\n\nA person is a human being that has the ability to reason, think, and feel.'),(19,'tata','mostafaomranpr@gmail.com','you have the ability to feel ??','\n\nI don\'t understand the question.'),(20,'tata','mostafaomranpr@gmail.com','you said A person is a human being that has the ability to reason, think, and feel. so i\'m asking do you have the ability to feel ?','\n\nYes, I have the ability to feel.'),(21,'tata','mostafaomranpr@gmail.com','hey',', David.\n+A Playhouse of One\'s Own: An Intimate History of Women and the Theatre (https://books.google.com/books?id=vMZhBgAAQBAJ&pg=PA146&dq=%22Dorothy+Lamour%22+%22The+Road+to+Singapore%22+1940&hl=en&sa=X&ved=0ahUKEwiP8J_5n5nPAhVQ5SYKHbV7A1UQ6AEIHDAA#v=onepage&q=%22Dorothy%20Lamour%22%20%22The%20Road%20to%20Singapore%22%201940&f=false).\n+Macmillan Publishers.\n+2015-03-03.\n+- The Road to Singapore (1940) (http://www.nytimes.com/movies/movie/105429/The-Road-to-Singapore/overview).\n+The New York Times.\n+- The Road to Singapore (http://www.tcm.com/tcmdb/title/823/The-Road-to-Singapore/).\n+Turner Classic Movies.\n+2015-03-31.\n+- The Road to Singapore (http://www.tvguide.com/movies/the-road-to-singapore/review/111685/).\n+External links\n+\n+*\n'),(22,'Noor','contactwnoor@gmail.com','who is biden','\n\nJoe Biden is the current Vice President of the United States, elected alongside President Barack Obama in 2008 and 2012. Biden was born in Scranton, Pennsylvania, in 1942, and became a U.S. Senator from Delaware in 1973.'),(23,'tata','mostafaomranpr@gmail.com','hello','\n\nHello, my name is John.'),(24,'tata','mostafaomranpr@gmail.com','hello','\n\nHello, my name is Jaclyn. I am a college student at the University of Wisconsin - Whitewater.'),(25,'Noor','contactwnoor@gmail.com','hi','.com/news/national/other-states/bjp-wants-to-create-an-environment-of-fear-in-karnataka-siddaramaiah/article24141244.ece).\n+The Hindu.\n+2018-09-19.\n+- BJP wants to create an environment of fear in Karnataka: Siddaramaiah (https://www.thehindu.com/news/national/other-states/bjp-wants-to-create-an-environment-of-fear-in-karnataka-siddaramaiah/article24141244.ece).\n+The Hindu.\n+2018-09-19.\n+- BJP wants to create an environment of fear in Karnataka: Siddaramaiah (https://www.thehindu.com/news/national/other-states/bjp-wants-to-create-an-environment-of-fear-in-karnataka-siddaramaiah/article24141244.ece).\n+The Hindu.\n+2018-09-19.\n+- BJP wants to create an environment of fear in Karnataka: Siddaramaiah (https://www.thehindu.com/news/national/other-states/bjp-wants-to-create-an-environment-of-fear-in-karnataka-siddaramaiah/article24141244.ece).\n+The Hindu.\n+2018-09-19.\n'),(26,'Noor','contactwnoor@gmail.com','Hello','Hi there!'),(27,'Noor','contactwnoor@gmail.com','Hi','Hello..'),(28,'Noor','contactwnoor@gmail.com','who are you ','\n\nI am a student at Southern Illinois University Carbondale.'),(29,'Noor','contactwnoor@gmail.com','who are you?','\n\nI am a student at Southern Illinois University Carbondale.'),(30,'Noor','contactwnoor@gmail.com','what is your name?','\n\nMy name is Kaitlyn.'),(31,'Noor','contactwnoor@gmail.com','what\'s your name','?\n\nMy name is Sarah.'),(32,'Noor','contactwnoor@gmail.com','What\'s your name?','I\'m Mostafa\'s Ai Bot');
/*!40000 ALTER TABLE `chathistory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-04 17:49:07
