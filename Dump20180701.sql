CREATE DATABASE  IF NOT EXISTS `Horarios` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `Horarios`;
-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: Horarios
-- ------------------------------------------------------
-- Server version	5.5.5-10.3.5-MariaDB-10.3.5+maria~jessie

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
-- Table structure for table `Estudiante`
--

DROP TABLE IF EXISTS `Estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Estudiante` (
  `Carnet` varchar(25) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Contraseña` varchar(45) NOT NULL,
  PRIMARY KEY (`Carnet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Estudiante`
--

LOCK TABLES `Estudiante` WRITE;
/*!40000 ALTER TABLE `Estudiante` DISABLE KEYS */;
INSERT INTO `Estudiante` VALUES ('AHKDKJSA','kljsaldk1','831798'),('CA18958','Carlos','1234'),('GM13006','Sergio ','sdg123'),('HGFTTFYF','yguyg','123'),('HL15848','Hola','hola'),('HOLA8','sadjlaksj','asodoa'),('JHGSAJHDG','jskabdkjh','1234'),('JSHDKHA','aodjsoij','12345'),('JSKHAKDJH','klsajdlk','saljdlkas'),('KHSAJKDHAS','skjdfksdf','jsakdaj'),('KWHDAKSJ','hola1','jsakd'),('PRUEBA','sajdlk','ksaljd'),('PRUEBA6','jasdk','dasdas');
/*!40000 ALTER TABLE `Estudiante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Horario`
--

DROP TABLE IF EXISTS `Horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Horario` (
  `idHorario` int(11) NOT NULL,
  `HoraEntrada` varchar(45) NOT NULL,
  `HoraSalida` varchar(45) NOT NULL,
  `Dia` varchar(45) NOT NULL,
  PRIMARY KEY (`idHorario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Horario`
--

LOCK TABLES `Horario` WRITE;
/*!40000 ALTER TABLE `Horario` DISABLE KEYS */;
INSERT INTO `Horario` VALUES (1,'6:45','10:45','Lunes'),(2,'6:45','10:05','Martes'),(3,'6:45','10:05','Miercoles'),(4,'6:45','10:05','Jueves'),(5,'6:45','10:05','Viernes');
/*!40000 ALTER TABLE `Horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HorariosEstudiante`
--

DROP TABLE IF EXISTS `HorariosEstudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HorariosEstudiante` (
  `Carnet` varchar(25) NOT NULL,
  `idHorario` int(11) NOT NULL,
  PRIMARY KEY (`Carnet`,`idHorario`),
  KEY `Horario_idx` (`idHorario`),
  CONSTRAINT `Carnet` FOREIGN KEY (`Carnet`) REFERENCES `Estudiante` (`Carnet`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Horario` FOREIGN KEY (`idHorario`) REFERENCES `Horario` (`idHorario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HorariosEstudiante`
--

LOCK TABLES `HorariosEstudiante` WRITE;
/*!40000 ALTER TABLE `HorariosEstudiante` DISABLE KEYS */;
INSERT INTO `HorariosEstudiante` VALUES ('AHKDKJSA',2),('AHKDKJSA',5),('CA18958',1),('gm13006',1),('gm13006',3),('HGFTTFYF',1),('HL15848',2),('HOLA8',1),('HOLA8',2),('JHGSAJHDG',1),('JHGSAJHDG',2),('JSHDKHA',1),('JSKHAKDJH',3),('JSKHAKDJH',5),('KHSAJKDHAS',2),('KHSAJKDHAS',5),('KWHDAKSJ',1),('KWHDAKSJ',2),('KWHDAKSJ',4),('PRUEBA',1),('PRUEBA',2),('PRUEBA6',1),('PRUEBA6',2),('PRUEBA6',3),('PRUEBA6',5);
/*!40000 ALTER TABLE `HorariosEstudiante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ingresos`
--

DROP TABLE IF EXISTS `Ingresos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ingresos` (
  `idIngreso` varchar(45) NOT NULL,
  `Carnet` varchar(25) NOT NULL,
  `Fecha` date NOT NULL,
  PRIMARY KEY (`Carnet`,`idIngreso`),
  CONSTRAINT `CarnetIngresos` FOREIGN KEY (`Carnet`) REFERENCES `Estudiante` (`Carnet`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ingresos`
--

LOCK TABLES `Ingresos` WRITE;
/*!40000 ALTER TABLE `Ingresos` DISABLE KEYS */;
INSERT INTO `Ingresos` VALUES ('1','gm13006','2018-06-25'),('2','gm13006','2018-06-26'),('3','HL15848','2018-06-25');
/*!40000 ALTER TABLE `Ingresos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-01 22:05:23
