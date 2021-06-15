CREATE DATABASE  IF NOT EXISTS `vaalikone` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `vaalikone`;
-- MySQL dump 10.13  Distrib 5.7.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: vaalikone
-- ------------------------------------------------------
-- Server version	5.7.33-log

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pwd` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'Anna','Kot','anna@anna.anna','2ac9cb7dc02b3c0083eb70898e549b63'),(2,'Cihan','Erenler','cihan@cihan.cihan','2ac9cb7dc02b3c0083eb70898e549b63');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `can_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer` enum('1','2','3','4','5') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `can_id` (`can_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`can_id`) REFERENCES `candidate` (`id`) ON DELETE CASCADE,
  CONSTRAINT `answer_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=254 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
INSERT INTO `answer` VALUES (29,9,1,'5'),(30,9,2,'3'),(31,9,3,'1'),(32,9,4,'3'),(33,9,6,'5'),(34,10,1,'3'),(35,10,2,'5'),(36,10,3,'5'),(37,10,4,'3'),(38,10,6,'3'),(39,11,1,'5'),(40,11,2,'4'),(41,11,3,'2'),(42,11,4,'2'),(43,11,6,'4'),(44,9,7,'1'),(45,10,7,'4'),(46,11,7,'5'),(47,12,1,'5'),(48,12,2,'3'),(49,12,3,'1'),(50,12,4,'3'),(51,12,6,'5'),(52,12,7,'1'),(69,14,1,'1'),(70,14,2,'2'),(71,14,3,'3'),(72,14,4,'4'),(73,14,6,'5'),(74,14,7,'4'),(76,9,10,'1'),(77,10,10,'1'),(78,11,10,'3'),(79,12,10,'2'),(81,14,10,'3'),(82,9,11,'3'),(83,10,11,'3'),(84,11,11,'5'),(85,12,11,'1'),(87,14,11,'1'),(115,9,14,'4'),(116,10,14,'3'),(117,11,14,'2'),(118,12,14,'3'),(119,14,14,'4'),(120,18,1,'1'),(121,18,2,'2'),(122,18,3,'3'),(123,18,4,'2'),(124,18,6,'4'),(125,18,7,'3'),(126,18,10,'1'),(127,18,11,'5'),(128,18,14,'1'),(129,20,1,'5'),(130,20,2,'5'),(131,20,3,'3'),(132,20,4,'3'),(133,20,6,'5'),(134,20,7,'1'),(135,20,10,'1'),(136,20,11,'5'),(137,20,14,'3'),(138,21,1,'5'),(139,21,2,'5'),(140,21,3,'3'),(141,21,4,'3'),(142,21,6,'5'),(143,21,7,'5'),(144,21,10,'5'),(145,21,11,'1'),(146,21,14,'3'),(147,9,15,'2'),(148,10,15,'1'),(149,11,15,'5'),(150,12,15,'2'),(151,14,15,'4'),(152,18,15,'5'),(154,20,15,'1'),(155,21,15,'5'),(156,9,16,'4'),(157,10,16,'1'),(158,11,16,'1'),(159,12,16,'2'),(160,14,16,'5'),(161,18,16,'3'),(163,20,16,'2'),(164,21,16,'3'),(165,9,17,'4'),(166,10,17,'5'),(167,11,17,'2'),(168,12,17,'4'),(169,14,17,'2'),(170,18,17,'3'),(171,20,17,'3'),(172,21,17,'3'),(173,9,18,'1'),(174,10,18,'5'),(175,11,18,'1'),(176,12,18,'3'),(177,14,18,'1'),(178,18,18,'3'),(179,20,18,'3'),(180,21,18,'5'),(181,9,19,'2'),(182,10,19,'3'),(183,11,19,'4'),(184,12,19,'1'),(185,14,19,'1'),(186,18,19,'4'),(187,20,19,'1'),(188,21,19,'3'),(189,9,20,'3'),(190,10,20,'5'),(191,11,20,'4'),(192,12,20,'4'),(193,14,20,'2'),(194,18,20,'2'),(195,20,20,'2'),(196,21,20,'1');
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidate`
--

DROP TABLE IF EXISTS `candidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `profession` varchar(255) NOT NULL,
  `political_party` varchar(255) NOT NULL,
  `why_candidate` text NOT NULL,
  `about` text NOT NULL,
  `profile_pic` text NOT NULL,
  `ref_num` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidate`
--

LOCK TABLES `candidate` WRITE;
/*!40000 ALTER TABLE `candidate` DISABLE KEYS */;
INSERT INTO `candidate` VALUES (9,'Rubeus','Hagrid','London',74,'Teacher','Hogwart','Professor Rubeus Hagrid (b. 6 December 1928)[11][12] was an English half-giant wizard, son of Mr Hagrid and the giantess Fridwulfa, and elder half-brother of the giant Grawp.\r\n\r\nHagrid attended Hogwarts School of Witchcraft and Wizardry in 1940 and was sorted into Gryffindor house. In Hagrid\'s third year, he was framed by Tom Riddle for the crime of opening the Chamber of Secrets and using his pet Acromantula to attack several Muggle-born students and eventually killing one of them. Though Hagrid\'s wand was snapped and he was expelled, he was trained as gamekeeper of Hogwarts and allowed to live on the school grounds at the request of Albus Dumbledore.\r\n\r\nIn 1991, Hagrid was given the task of reintroducing Harry Potter to the wizarding world. In 1993, Hagrid would assume the post of Care of Magical Creatures professor after the retirement of Professor Silvanus Kettleburn. As a member of both the original and the re-instated Order of the Phoenix, Hagrid fought in several battles of the First and the Second Wizarding Wars, including the Battle of Hogwarts in 1998. By 2017, he was still living, and presumably still teaching and tending to his gamekeeping duties at Hogwarts, inviting Harry\'s son Albus Severus for tea when he joined the school as Harry informed him at the station, just as Hagrid had done to his father, Ron Weasley and Hermione Granger.','Hagrid: \"If he wants ter go, a great Muggle like you won\'t stop him. Stop Lily an\' James Potter\'s son goin\' ter Hogwarts! Yer mad. His name\'s been down ever since he was born. He\'s off ter the finest school of witchcraft and wizardry in the world. Seven years there and he won\'t know himself. He\'ll be with youngsters of his own sort, fer a change, an\' he\'ll be under the greatest headmaster Hogwarts ever had, Albus Dumbled—\"\"\r\nVernon Dursley: \"I AM NOT PAYING FOR SOME CRACKPOT OLD FOOL TO TEACH HIM MAGIC TRICKS!\"\"\r\nHagrid: \"NEVER-INSULT-ALBUS-DUMBLEDORE-IN-FRONT-OF-ME!\"','/img/rubeus-hagrid.jpg','1617704788549'),(10,'Bruce','Wayne','Gotham',55,'Superhero','Justice League','Batman is the superhero protector of Gotham City, a tortured, brooding vigilante dressed as a sort of human bat who fights against evil and strikes fear into the hearts of criminals everywhere. In his public identity he is Bruce Wayne, billionaire industrialist and notorious playboy. Although he has no superhuman abilities, he is one of the world\'s smartest men and greatest fighters. His physical prowess, technical ingenuity, and tactical thinking make him an incredibly dangerous opponent. He is also a founding member of the Justice League.','His parents died when he was so young. Shot. Killed right in front of him. He was raised alone. A kid in a huge mansion. With his memories of his mother and father. He had love, and they took it from him. He should be a killer. He should want to tear the world apart for what it did. And yet he took that pain. That shock of death. And he turned it into hope.','/img/batman.jpg','1617704864742'),(11,'James','Howlett','Noclue',134,'Superhero','X-men','Wolverine (birth name: James Howlett;[1] alias: Logan and Weapon X) is a fictional character appearing in American comic books published by Marvel Comics, mostly in association with the X-Men. He is a mutant who possesses animal-keen senses, enhanced physical capabilities, a powerful regenerative ability known as a healing factor, and three retractable claws in each hand. Wolverine has been depicted variously as a member of the X-Men, Alpha Flight, and the Avengers.','The character appeared in the last panel of The Incredible Hulk #180 before having a larger role in #181 (cover-dated November 1974). He was created by Marvel editor-in-chief Roy Thomas,[2] writer Len Wein,[3] and Marvel art director John Romita Sr. Romita designed the character\'s costume, but the character was first drawn for publication by Herb Trimpe. Wolverine then joined a revamped version of the superhero team the X-Men, where eventually writer Chris Claremont and artist-writer John Byrne would play significant roles in the character\'s development. Artist Frank Miller collaborated with Claremont and helped revise the character with a four-part eponymous limited series from September to December 1982, which debuted Wolverine\'s catchphrase, \"I\'m the best there is at what I do, but what I do best isn\'t very nice.\"','/img/wolverine.jpg','1617704923139'),(12,'Minerva','McGonagall','London',65,'Teacher','Hogwart','Professor Minerva McGonagall, O.M. (First Class),[13] was a Scottish half-blood witch, the only daughter of Muggle Robert McGonagall and witch Isobel Ross. She also was the older sister of Malcolm and Robert Jnr. Minerva attended Hogwarts School of Witchcraft and Wizardry and was Sorted into Gryffindor House, but it took the Sorting Hat five and a half minutes to decide if she was Gryffindor or Ravenclaw, which made her a Hatstall. During her seventh year, she was appointed Head Girl.\r\n\r\nAfter her education, Minerva worked for two years at the Ministry of Magic and later returned to Hogwarts, where she became Head of Gryffindor House and the Transfiguration professor. Though she wasn\'t a member of the Order of the Phoenix during the First Wizarding War, Minerva greatly helped the Ministry of Magic\'s resistance through spying on Death Eaters and bringing the Aurors crucial information on their activities.','Transfiguration is some of the most complex and dangerous magic you will learn at Hogwarts. Anyone messing around in my class will leave and not come back. You have been warned.\"\r\n— McGonagall\'s sternness and belief in her field','/img/minerva.jpg','1617712621102'),(14,'Kratos','The God','Valhalla',4424,'God','Gods','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis hendrerit convallis felis, et varius orci pellentesque at. Aliquam nulla lectus, auctor eget velit aliquet, interdum consequat nunc. Ut fringilla velit et enim convallis ornare ac a metus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Integer id lacus vitae lacus ultrices euismod. Fusce mollis libero nec ex tincidunt, at sodales nisl sodales. Morbi rhoncus mi eu felis ultrices lobortis. Suspendisse et hendrerit justo. Vestibulum vehicula in odio ac rutrum. Nunc eu lacus ultricies, mattis ipsum sit amet, laoreet odio. In pharetra euismod lectus et vulputate. Donec vestibulum vel diam in varius. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Proin nisl erat, faucibus in quam vel, efficitur imperdiet magna. Integer lobortis scelerisque nulla eget malesuada.\r\n','I AM A GOD!','/img/kratos.jpg','1617714307974'),(18,'Beard','Guy','New York',34,'Barber','Barber Party','Donec porttitor sagittis vehicula. Cras non est ac purus blandit pulvinar et sed purus. Maecenas nec nisi vehicula, ornare erat ut, vulputate dui. Interdum et malesuada fames ac ante ipsum primis in faucibus. Integer non suscipit mi. Morbi et augue accumsan massa fermentum maximus. Nulla maximus lacinia ante, sit amet gravida velit dictum et. Donec non sem blandit, mollis orci ut, semper nisl. Sed suscipit ac nulla quis congue. Pellentesque ultrices tristique metus sit amet condimentum. Donec egestas porttitor sem. Mauris viverra, ligula a semper viverra, dolor velit blandit lorem, in imperdiet turpis nulla non libero.\r\n\r\n','Quisque eu libero sed risus condimentum condimentum fermentum dictum nulla. Cras commodo, ex a commodo congue, nisl est tincidunt lectus, in tristique turpis elit ut purus. Nam ornare, risus eget viverra ultrices, nulla leo rutrum lacus, vitae accumsan neque nibh porta leo. Donec orci odio, vulputate a blandit vel, vestibulum quis eros. Maecenas convallis mauris velit. Sed vel eleifend eros. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae;','/img/craig-mckay-jmURdhtm7Ng-unsplash.jpg','1617814331457'),(20,'Spike','The Dog','Dogland',10,'Dog','Dogs','Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof !','Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof Woof !!!','/img/marliese-streefland-2l0CWTpcChI-unsplash.jpg','1617815102224'),(21,'Santtu','The Cat','Catland',12,'Cat','Cats','Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow MEOW!','Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow Meow ','/img/images.jpeg','1617815371417');
/*!40000 ALTER TABLE `candidate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `question_ref` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,'I am always protecting animals rights and their well-being',NULL),(2,'I prefer anarchy over the order.',NULL),(3,'Military action that defies international law is sometimes justified.',NULL),(4,'There is now a worrying fusion of information and entertainment.',NULL),(6,'McGonagall is way cooler than Snape.',NULL),(7,'Earth is flat.','1617704953297'),(10,'Cats are awesome for real.','1617714340061'),(11,'I am a dog person.','1617727355258'),(14,'I prefer pizza over ice cream.','1617814106857'),(15,'Santa doesn\'t exist.','1617815568475'),(16,'Lakes are better than sea and mountain.','1617816037930'),(17,'Batman should be a president of Gotham.','1617817623911'),(18,'Computer games are good for developing cat-like reflexes.','1617817666144'),(19,'Tokio Ghoul is the best anime.','1617817722549'),(20,'Superman should wear his underwear inside of his pants.','1617817753648');
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-13 14:56:58
