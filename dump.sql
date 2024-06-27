-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: Hospital
-- ------------------------------------------------------
-- Server version	8.0.35-0ubuntu0.22.04.1

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
-- Table structure for table `Att_Degree`
--

DROP TABLE IF EXISTS `Att_Degree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Att_Degree` (
  `Staff_ID` int NOT NULL,
  `Degree` varchar(100) NOT NULL,
  PRIMARY KEY (`Staff_ID`,`Degree`),
  CONSTRAINT `fk_att_degree_attendant` FOREIGN KEY (`Staff_ID`) REFERENCES `Attendant` (`Staff_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Att_Degree`
--

LOCK TABLES `Att_Degree` WRITE;
/*!40000 ALTER TABLE `Att_Degree` DISABLE KEYS */;
INSERT INTO `Att_Degree` VALUES (1,'Bachelor of Nursing'),(1,'Basic Life Support (BLS) Certification'),(2,'Advanced Cardiovascular Life Support (ACLS) Certification'),(2,'Certified Nursing Assistant'),(3,'Basic Life Support (BLS) Certification'),(3,'Diploma in Healthcare Management'),(4,'Associate Degree in Medical Assisting'),(4,'Emergency Medical Technician (EMT) Certification'),(5,'Advanced Cardiovascular Life Support (ACLS) Certification'),(5,'Bachelor of Nursing'),(6,'Basic Life Support (BLS) Certification'),(6,'Certified Nursing Assistant'),(7,'Diploma in Healthcare Management'),(7,'Emergency Medical Technician (EMT) Certification'),(8,'Advanced Cardiovascular Life Support (ACLS) Certification'),(8,'Associate Degree in Medical Assisting'),(9,'Bachelor of Nursing'),(9,'Basic Life Support (BLS) Certification'),(10,'Certified Nursing Assistant'),(10,'Emergency Medical Technician (EMT) Certification');
/*!40000 ALTER TABLE `Att_Degree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Attendant`
--

DROP TABLE IF EXISTS `Attendant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Attendant` (
  `Staff_ID` int NOT NULL,
  `Fname` varchar(20) NOT NULL,
  `Lname` varchar(20) NOT NULL,
  `DOB` date NOT NULL,
  `Gender` varchar(6) NOT NULL,
  `Mobile` bigint NOT NULL,
  `Salary` int NOT NULL,
  `Av_Day` varchar(50) NOT NULL,
  `Overseen_by` int NOT NULL,
  PRIMARY KEY (`Staff_ID`),
  UNIQUE KEY `unique_name` (`Fname`,`Lname`),
  KEY `fk_attendant_doctor` (`Overseen_by`),
  CONSTRAINT `fk_attendant_doctor` FOREIGN KEY (`Overseen_by`) REFERENCES `Doctor` (`Doctor_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Attendant`
--

LOCK TABLES `Attendant` WRITE;
/*!40000 ALTER TABLE `Attendant` DISABLE KEYS */;
INSERT INTO `Attendant` VALUES (1,'Suman','Kumar','1982-03-15','Male',9876543201,50000,'Monday,Wednesday,Friday',6),(2,'Deepa','Sharma','1985-07-22','Female',8765432102,55000,'Tuesday,Thursday,Saturday',2),(3,'Alok','Verma','1979-11-08','Male',7654321093,52000,'Monday,Wednesday,Friday',6),(4,'Neetu','Mishra','1982-05-25','Female',9876543204,53000,'Tuesday,Thursday,Saturday',2),(5,'Ravi','Patil','1988-09-18','Male',8765432105,54000,'Monday,Wednesday,Friday',6),(6,'Rekha','Rao','1984-12-28','Female',7654321096,51000,'Tuesday,Thursday,Saturday',2),(7,'Rahul','Kumar','1975-02-20','Male',9876543207,50000,'Monday,Wednesday,Friday',9),(8,'Simran','Yadav','1980-11-10','Female',8765432108,52000,'Tuesday,Thursday,Saturday',2),(9,'Vishal','Shah','1978-04-05','Male',7654321099,53000,'Monday,Wednesday,Friday',9),(10,'Aarti','Verma','1986-01-22','Female',9876543210,54000,'Tuesday,Thursday,Saturday',9),(11,'Sunita','Rai','1984-06-20','Female',9876543214,50000,'Monday, Wednesday',6),(12,'Ankit','Gupta','1987-09-15','Male',8765432105,55000,'Tuesday, Thursday',8),(13,'Neha','Kapoor','1989-12-02','Female',7654321096,52000,'Wednesday, Friday',9),(14,'Rahul','Verma','1982-03-18','Male',9876543217,48000,'Monday, Thursday',6),(15,'Simran','Singh','1985-05-25','Female',8765432108,53000,'Tuesday, Friday',8),(16,'Amit','Shah','1988-08-12','Male',7654321099,50000,'Wednesday, Saturday',9),(17,'Kavita','Yadav','1983-11-05','Female',9876543220,47000,'Monday, Friday',6),(18,'Rajat','Patil','1986-02-22','Male',8765432111,52000,'Tuesday, Saturday',8),(19,'Pooja','Rajput','1989-04-10','Female',7654321102,49000,'Wednesday, Sunday',9);
/*!40000 ALTER TABLE `Attendant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Department`
--

DROP TABLE IF EXISTS `Department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Department` (
  `Name` varchar(20) NOT NULL,
  `Loc` int NOT NULL,
  `Medic_cnt` int NOT NULL,
  `Establishment_Date` date DEFAULT NULL,
  `Revenue` int NOT NULL,
  `Managed_By` int DEFAULT NULL,
  PRIMARY KEY (`Name`),
  KEY `fk_department_doctor` (`Managed_By`),
  CONSTRAINT `fk_department_doctor` FOREIGN KEY (`Managed_By`) REFERENCES `Doctor` (`Doctor_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Department`
--

LOCK TABLES `Department` WRITE;
/*!40000 ALTER TABLE `Department` DISABLE KEYS */;
INSERT INTO `Department` VALUES ('Cardio',102,8,'2001-01-01',800000,1),('Dermatology',107,3,'2006-01-01',300000,5),('ENT',108,4,'2007-01-01',400000,2),('Gynecology',106,5,'2005-01-01',450000,8),('Neurology',103,6,'2002-01-01',600000,7),('Oncology',104,7,'2003-01-01',700000,3),('Ortho',101,5,'2000-01-01',500000,10),('Pediatrics',105,4,'2004-01-01',400000,9);
/*!40000 ALTER TABLE `Department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Dependents`
--

DROP TABLE IF EXISTS `Dependents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Dependents` (
  `Fname` varchar(20) NOT NULL,
  `Lname` varchar(20) NOT NULL,
  `DOB` date NOT NULL,
  `Gender` varchar(6) NOT NULL,
  `Mobile` bigint NOT NULL,
  `Dependent_of` int NOT NULL,
  PRIMARY KEY (`Fname`,`Lname`),
  KEY `fk_dependent_patient` (`Dependent_of`),
  CONSTRAINT `fk_dependent_patient` FOREIGN KEY (`Dependent_of`) REFERENCES `Patient` (`Patient_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Dependents`
--

LOCK TABLES `Dependents` WRITE;
/*!40000 ALTER TABLE `Dependents` DISABLE KEYS */;
INSERT INTO `Dependents` VALUES ('Amit','Shah','1990-02-10','Male',8765432117,8),('Anita','Sharma','1995-04-12','Female',9876543220,1),('Neha','Kumar','1996-07-18','Female',8765432114,5),('Pooja','Yadav','1994-05-05','Female',7654321108,9),('Rahul','Verma','2000-08-22','Male',8765432111,2),('Raj','Rao','1997-01-22','Male',9876543229,10),('Rohan','Mishra','2002-03-15','Male',9876543223,4),('Sara','Patel','1998-11-05','Female',7654321102,3),('Simran','Singh','1992-12-20','Female',9876543226,7),('Vikas','Gupta','2000-10-28','Male',7654321105,6);
/*!40000 ALTER TABLE `Dependents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Director`
--

DROP TABLE IF EXISTS `Director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Director` (
  `Employee_ID` int NOT NULL,
  `Fname` varchar(20) NOT NULL,
  `Lname` varchar(20) NOT NULL,
  `DOB` date NOT NULL,
  `Gender` varchar(6) NOT NULL,
  `Mobile` bigint NOT NULL,
  `Addr` varchar(100) NOT NULL,
  `Position` varchar(20) NOT NULL,
  `Salary` int NOT NULL,
  `Assesses` varchar(20) NOT NULL,
  PRIMARY KEY (`Employee_ID`),
  UNIQUE KEY `unique_name` (`Fname`,`Lname`),
  KEY `fk_director_department` (`Assesses`),
  CONSTRAINT `fk_director_department` FOREIGN KEY (`Assesses`) REFERENCES `Department` (`Name`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Director`
--

LOCK TABLES `Director` WRITE;
/*!40000 ALTER TABLE `Director` DISABLE KEYS */;
INSERT INTO `Director` VALUES (1,'Amit','Kumar','1982-07-10','Male',9876543210,'123 Main St, Pune, Maharashtra','Director',100000,'Ortho'),(2,'Priya','Sharma','1984-05-18','Female',8765432109,'456 Oak St, Pune, Maharashtra','Sub director',120000,'Cardio'),(3,'Rajesh','Patel','1979-09-25','Male',7654321098,'789 Pine St, Pune, Maharashtra','Supervisor',110000,'Neurology'),(4,'Sarika','Singh','1988-12-03','Female',9876543211,'101 Rose St, Pune, Maharashtra','Director',105000,'Gynecology'),(5,'Anand','Mishra','1983-02-15','Male',8765432101,'202 Lily St, Pune, Maharashtra','Sub director',115000,'Cardio'),(6,'Meera','Gupta','1975-06-28','Female',7654321092,'303 Sun St, Pune, Maharashtra','Supervisor',125000,'Neurology'),(7,'Rahul','Verma','1980-08-20','Male',9876543212,'404 Sky St, Pune, Maharashtra','Director',110000,'Gynecology'),(8,'Neha','Shah','1987-11-10','Female',8765432103,'505 Cloud St, Pune, Maharashtra','Sub director',100000,'ENT'),(9,'Vikas','Yadav','1978-04-05','Male',7654321094,'606 Star St, Pune, Maharashtra','Supervisor',120000,'Gynecology'),(10,'Preeti','Gupta','1986-01-22','Female',9876543213,'707 Moon St, Pune, Maharashtra','Director',115000,'Ortho');
/*!40000 ALTER TABLE `Director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Doc_Degree`
--

DROP TABLE IF EXISTS `Doc_Degree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Doc_Degree` (
  `Doctor_ID` int NOT NULL,
  `Degree` varchar(50) NOT NULL,
  PRIMARY KEY (`Doctor_ID`,`Degree`),
  CONSTRAINT `fk_doc_degree_doctor` FOREIGN KEY (`Doctor_ID`) REFERENCES `Doctor` (`Doctor_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Doc_Degree`
--

LOCK TABLES `Doc_Degree` WRITE;
/*!40000 ALTER TABLE `Doc_Degree` DISABLE KEYS */;
INSERT INTO `Doc_Degree` VALUES (1,'Diploma in Sports Medicine'),(1,'MD Orthopedics'),(2,'DM Interventional Cardiology'),(2,'MD Cardiology'),(3,'DM Neurology'),(3,'MD Neurology'),(4,'Diploma in Reproductive Medicine'),(4,'MS Obstetrics and Gynecology'),(5,'MCh Cardiothoracic Surgery'),(5,'MD Cardiothoracic Surgery'),(6,'DM Addiction Psychiatry'),(6,'MD Psychiatry'),(7,'Diploma in Joint Replacement Surgery'),(7,'MS Orthopedics'),(8,'DNB Dermatology'),(8,'MD Dermatology'),(9,'Diploma in Otorhinolaryngology'),(9,'MD ENT'),(10,'Diploma in Minimal Access Surgery'),(10,'MS General Surgery');
/*!40000 ALTER TABLE `Doc_Degree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Doc_Expert`
--

DROP TABLE IF EXISTS `Doc_Expert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Doc_Expert` (
  `Doctor_ID` int NOT NULL,
  `Expertise` varchar(50) NOT NULL,
  PRIMARY KEY (`Doctor_ID`,`Expertise`),
  CONSTRAINT `fk_doc_expert_doctor` FOREIGN KEY (`Doctor_ID`) REFERENCES `Doctor` (`Doctor_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Doc_Expert`
--

LOCK TABLES `Doc_Expert` WRITE;
/*!40000 ALTER TABLE `Doc_Expert` DISABLE KEYS */;
INSERT INTO `Doc_Expert` VALUES (1,'Orthopedics'),(1,'Sports Medicine'),(2,'Cardiology'),(2,'Interventional Cardiology'),(3,'Neurology'),(3,'Neurophysiology'),(4,'Obstetrics and Gynecology'),(4,'Reproductive Medicine'),(5,'Cardiothoracic Surgery'),(6,'Addiction Psychiatry'),(6,'Psychiatry'),(7,'Joint Replacement Surgery'),(7,'Orthopedics'),(8,'Dermatology'),(8,'Dermatopathology'),(9,'ENT'),(9,'Otorhinolaryngology'),(10,'General Surgery'),(10,'Minimal Access Surgery');
/*!40000 ALTER TABLE `Doc_Expert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Doctor`
--

DROP TABLE IF EXISTS `Doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Doctor` (
  `Doctor_ID` int NOT NULL,
  `Fname` varchar(20) NOT NULL,
  `Lname` varchar(20) NOT NULL,
  `DOB` date NOT NULL,
  `Gender` varchar(6) NOT NULL,
  `Mobile` bigint NOT NULL,
  `Salary` int NOT NULL,
  `Av_Day` varchar(50) DEFAULT NULL,
  `Works_For` varchar(20) NOT NULL,
  `Supervisor_ID` int NOT NULL,
  PRIMARY KEY (`Doctor_ID`),
  UNIQUE KEY `unique_name` (`Fname`,`Lname`),
  KEY `fk_doctor_department` (`Works_For`),
  KEY `fk_doctor_doctor` (`Supervisor_ID`),
  CONSTRAINT `fk_doctor_department` FOREIGN KEY (`Works_For`) REFERENCES `Department` (`Name`) ON DELETE CASCADE,
  CONSTRAINT `fk_doctor_doctor` FOREIGN KEY (`Supervisor_ID`) REFERENCES `Doctor` (`Doctor_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Doctor`
--

LOCK TABLES `Doctor` WRITE;
/*!40000 ALTER TABLE `Doctor` DISABLE KEYS */;
INSERT INTO `Doctor` VALUES (1,'Amit','Sharma','1980-05-15','Male',9876543210,120000,'Tuesday,Thursday','Ortho',1),(2,'Priya','Verma','1983-08-22','Female',8765432109,150000,'Wednesday','Cardio',1),(3,'Rajesh','Patel','1975-11-10','Male',7654321098,130000,'Friday','Neurology',2),(4,'Sarika','Mishra','1988-02-25','Female',9876543211,110000,'Monday','Ortho',1),(5,'Anand','Kumar','1982-04-18','Male',8765432101,140000,'Thursday,Saturday','Cardio',2),(6,'Meera','Gupta','1975-07-28','Female',7654321092,120000,'Tuesday,Wednesday','Neurology',3),(7,'Rahul','Singh','1980-10-20','Male',9876543212,125000,'Monday,Friday','Ortho',1),(8,'Neha','Shah','1987-02-10','Female',8765432103,115000,'Wednesday,Saturday','Cardio',2),(9,'Vikas','Yadav','1978-05-05','Male',7654321094,135000,'Friday,Sunday','Neurology',3),(10,'Pooja','Rao','1986-01-22','Female',9876543213,125000,'Thursday','Ortho',1);
/*!40000 ALTER TABLE `Doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Equi_Requirement`
--

DROP TABLE IF EXISTS `Equi_Requirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Equi_Requirement` (
  `Generic_Name` varchar(100) NOT NULL,
  `Requirement` varchar(100) NOT NULL,
  PRIMARY KEY (`Generic_Name`,`Requirement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Equi_Requirement`
--

LOCK TABLES `Equi_Requirement` WRITE;
/*!40000 ALTER TABLE `Equi_Requirement` DISABLE KEYS */;
INSERT INTO `Equi_Requirement` VALUES ('Anesthesia Machine','Anesthesia Administration'),('Blood Pressure Monitor','Vital Sign Monitoring'),('Defibrillator','Cardiac Emergency'),('Dermatology Laser','Dermatological Procedures'),('ECG Machine','Cardiac Monitoring'),('EKG Machine','Cardiac Monitoring'),('ENT Scope','Diagnostic Imaging'),('Gynecology Chair','Gynecological Examinations'),('MRI Machine','Diagnostic Imaging'),('Surgical Microscope','Surgical Procedures'),('Ultrasound Scanner','Diagnostic Imaging'),('Ventilator','Respiratory Support'),('X-ray Machine','Diagnostic Imaging');
/*!40000 ALTER TABLE `Equi_Requirement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Equipment`
--

DROP TABLE IF EXISTS `Equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Equipment` (
  `Generic_Name` varchar(50) NOT NULL,
  `Model` varchar(20) NOT NULL,
  `Price` int NOT NULL,
  `Procurement_Date` date NOT NULL,
  `Procured_By` varchar(20) NOT NULL,
  PRIMARY KEY (`Generic_Name`,`Model`),
  KEY `fk_equipment_department` (`Procured_By`),
  CONSTRAINT `fk_equipment_department` FOREIGN KEY (`Procured_By`) REFERENCES `Department` (`Name`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Equipment`
--

LOCK TABLES `Equipment` WRITE;
/*!40000 ALTER TABLE `Equipment` DISABLE KEYS */;
INSERT INTO `Equipment` VALUES ('Anesthesia Machine','56.NT.29',30000,'2022-07-18','Ortho'),('Blood Pressure Monitor','18.FG.22',1000,'2022-04-10','Cardio'),('Defibrillator','13.LM.53',8000,'2022-06-12','Cardio'),('Dermatology Laser','16.DI.29',45000,'2023-01-20','Dermatology'),('ECG Machine','29.PQ.88',20000,'2022-05-05','Cardio'),('EKG Machine','24.KL.79',25000,'2022-10-15','Cardio'),('ENT Scope','08.EF.45',12000,'2022-11-05','ENT'),('Gynecology Chair','53.GH.18',3000,'2022-12-12','Gynecology'),('MRI Machine','39.XY.45',150000,'2022-03-25','Neurology'),('Surgical Microscope','35.RS.62',60000,'2022-09-30','Neurology'),('Ultrasound Scanner','21.BD.12',70000,'2022-02-20','Cardio'),('Ventilator','47.WZ.14',40000,'2022-08-23','Neurology'),('X-ray Machine','42.AC.37',50000,'2022-01-15','Ortho');
/*!40000 ALTER TABLE `Equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Overlooks_After`
--

DROP TABLE IF EXISTS `Overlooks_After`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Overlooks_After` (
  `Patient_ID` int NOT NULL,
  `Staff_ID` int NOT NULL,
  PRIMARY KEY (`Patient_ID`,`Staff_ID`),
  KEY `fk_overlooks_after_attendant` (`Staff_ID`),
  CONSTRAINT `fk_overlooks_after_attendant` FOREIGN KEY (`Staff_ID`) REFERENCES `Attendant` (`Staff_ID`) ON DELETE CASCADE,
  CONSTRAINT `fk_overlooks_after_patient` FOREIGN KEY (`Patient_ID`) REFERENCES `Patient` (`Patient_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Overlooks_After`
--

LOCK TABLES `Overlooks_After` WRITE;
/*!40000 ALTER TABLE `Overlooks_After` DISABLE KEYS */;
INSERT INTO `Overlooks_After` VALUES (2,3),(3,3),(4,5),(5,5),(6,6),(1,10),(10,10),(7,17),(8,17),(9,19);
/*!40000 ALTER TABLE `Overlooks_After` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Patient`
--

DROP TABLE IF EXISTS `Patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Patient` (
  `Patient_ID` int NOT NULL,
  `Fname` varchar(20) NOT NULL,
  `Lname` varchar(20) NOT NULL,
  `DOB` date NOT NULL,
  `Gender` varchar(6) NOT NULL,
  `Mobile` bigint NOT NULL,
  `Room_No` int NOT NULL,
  `Bill_Status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`Patient_ID`),
  UNIQUE KEY `unique_name` (`Fname`,`Lname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Patient`
--

LOCK TABLES `Patient` WRITE;
/*!40000 ALTER TABLE `Patient` DISABLE KEYS */;
INSERT INTO `Patient` VALUES (1,'Arun','Sharma','1980-03-15','Male',9876543210,101,1),(2,'Sneha','Gupta','1985-07-22','Female',8765432109,102,0),(3,'Raj','Singh','1979-11-08','Male',7654321098,103,1),(4,'Anita','Mishra','1982-05-25','Female',9876543211,104,0),(5,'Vikas','Patil','1988-09-18','Male',8765432101,105,1),(6,'Neha','Rao','1984-12-28','Female',7654321092,106,0),(7,'Suresh','Kumar','1975-02-20','Male',9876543212,107,1),(8,'Priya','Yadav','1980-11-10','Female',8765432103,108,0),(9,'Anjali','Shah','1978-04-05','Female',7654321094,109,1),(10,'Rahul','Verma','1986-01-22','Male',9876543213,110,0);
/*!40000 ALTER TABLE `Patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Patient_Ailment`
--

DROP TABLE IF EXISTS `Patient_Ailment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Patient_Ailment` (
  `Patient_ID` int NOT NULL,
  `Ailment` varchar(100) NOT NULL,
  PRIMARY KEY (`Patient_ID`,`Ailment`),
  CONSTRAINT `fk_patient_ailment_patient` FOREIGN KEY (`Patient_ID`) REFERENCES `Patient` (`Patient_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Patient_Ailment`
--

LOCK TABLES `Patient_Ailment` WRITE;
/*!40000 ALTER TABLE `Patient_Ailment` DISABLE KEYS */;
INSERT INTO `Patient_Ailment` VALUES (1,'Fracture'),(1,'Sprain'),(2,'Diabetes'),(2,'Hypertension'),(3,'Epilepsy'),(3,'Migraine'),(4,'High-Risk Pregnancy'),(4,'Pregnancy'),(5,'Coronary Artery Disease'),(5,'Valvular Heart Disease'),(6,'Anxiety'),(6,'Depression'),(7,'Arthritis'),(7,'Osteoarthritis'),(8,'Eczema'),(8,'Psoriasis'),(9,'Ear Infection'),(9,'Sinusitis'),(10,'Appendicitis'),(10,'Gastroenteritis');
/*!40000 ALTER TABLE `Patient_Ailment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Treatment`
--

DROP TABLE IF EXISTS `Treatment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Treatment` (
  `Treatment_ID` int NOT NULL,
  `Fee` int NOT NULL,
  `Medicines` varchar(100) NOT NULL,
  `Visit_Time` varchar(20) NOT NULL,
  `Visit_Date` date NOT NULL,
  PRIMARY KEY (`Treatment_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Treatment`
--

LOCK TABLES `Treatment` WRITE;
/*!40000 ALTER TABLE `Treatment` DISABLE KEYS */;
INSERT INTO `Treatment` VALUES (1,500,'Painkillers, Antibiotics','10:30 AM','2023-01-15'),(2,1000,'Cardiac Medication, Aspirin','02:45 PM','2023-02-20'),(3,800,'Anti-Migraine Medication','11:15 AM','2023-03-25'),(4,1200,'Prenatal Vitamins, Iron Supplement','09:00 AM','2023-04-10'),(5,1500,'Beta-blockers, Statins','03:30 PM','2023-05-05'),(6,600,'Antidepressants','01:45 PM','2023-06-12'),(7,700,'Pain Relievers','12:30 PM','2023-07-18'),(8,900,'Skin Ointment, Antihistamines','09:45 AM','2023-08-23'),(9,1000,'Antibiotics, Ear Drops','02:15 PM','2023-09-30'),(10,850,'Anti-inflammatory Medication','11:00 AM','2023-10-15'),(11,750,'Painkillers, Antibiotics','03:00 PM','2023-11-05'),(12,900,'Antihypertensives, Aspirin','10:15 AM','2023-12-10'),(13,650,'Antiemetics','01:30 PM','2024-01-15'),(14,1100,'Prenatal Vitamins, Calcium Supplement','11:45 AM','2024-02-20'),(15,1300,'Anticoagulants, Beta-blockers','02:30 PM','2024-03-25'),(16,500,'Antidepressants','09:15 AM','2024-04-30'),(17,600,'Pain Relievers','12:00 PM','2024-06-05'),(18,800,'Corticosteroid Cream, Antihistamines','03:45 PM','2024-07-10'),(19,950,'Antibiotics, Ear Drops','10:30 AM','2024-08-15'),(20,700,'Nonsteroidal Anti-inflammatory Drugs','01:15 PM','2024-09-20');
/*!40000 ALTER TABLE `Treatment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Treats`
--

DROP TABLE IF EXISTS `Treats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Treats` (
  `T_ID` int NOT NULL,
  `P_ID` int NOT NULL,
  `D_ID` int NOT NULL,
  PRIMARY KEY (`T_ID`,`P_ID`,`D_ID`),
  KEY `fk_treats_patient` (`P_ID`),
  KEY `fk_treats_doctor` (`D_ID`),
  CONSTRAINT `fk_treats_doctor` FOREIGN KEY (`D_ID`) REFERENCES `Doctor` (`Doctor_ID`) ON DELETE CASCADE,
  CONSTRAINT `fk_treats_patient` FOREIGN KEY (`P_ID`) REFERENCES `Patient` (`Patient_ID`) ON DELETE CASCADE,
  CONSTRAINT `fk_treats_treatment` FOREIGN KEY (`T_ID`) REFERENCES `Treatment` (`Treatment_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Treats`
--

LOCK TABLES `Treats` WRITE;
/*!40000 ALTER TABLE `Treats` DISABLE KEYS */;
INSERT INTO `Treats` VALUES (1,1,1),(11,1,2),(2,2,2),(12,2,3),(3,3,3),(13,3,4),(4,4,4),(14,4,5),(5,5,5),(15,5,6),(6,6,6),(16,6,7),(7,7,7),(17,7,8),(8,8,8),(18,8,9),(9,9,9),(19,9,10),(10,10,10),(20,10,1);
/*!40000 ALTER TABLE `Treats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Utilizes`
--

DROP TABLE IF EXISTS `Utilizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Utilizes` (
  `Gen_Name` varchar(100) NOT NULL,
  `Model` varchar(100) NOT NULL,
  `T_ID` int NOT NULL,
  `Doc_ID` int NOT NULL,
  PRIMARY KEY (`Gen_Name`,`Model`,`T_ID`,`Doc_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Utilizes`
--

LOCK TABLES `Utilizes` WRITE;
/*!40000 ALTER TABLE `Utilizes` DISABLE KEYS */;
INSERT INTO `Utilizes` VALUES ('Anesthesia Machine','56.NT.29',1,1),('Blood Pressure Monitor','18.FG.22',2,2),('Defibrillator','13.LM.53',3,3),('Dermatology Laser','16.DI.29',4,4),('ECG Machine','29.PQ.88',5,5),('EKG Machine','24.KL.79',6,6),('ENT Scope','08.EF.45',7,7),('Gynecology Chair','53.GH.18',8,8),('MRI Machine','39.XY.45',9,9),('Surgical Microscope','35.RS.62',10,10),('Ultrasound Scanner','21.BD.12',11,1),('Ventilator','47.WZ.14',12,2),('X-ray Machine','42.AC.37',13,3);
/*!40000 ALTER TABLE `Utilizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Works_Under`
--

DROP TABLE IF EXISTS `Works_Under`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Works_Under` (
  `Dname` varchar(20) NOT NULL,
  `Staff_ID` int NOT NULL,
  PRIMARY KEY (`Dname`,`Staff_ID`),
  KEY `fk_works_under_attendant` (`Staff_ID`),
  CONSTRAINT `fk_works_under_attendant` FOREIGN KEY (`Staff_ID`) REFERENCES `Attendant` (`Staff_ID`) ON DELETE CASCADE,
  CONSTRAINT `fk_works_under_department` FOREIGN KEY (`Dname`) REFERENCES `Department` (`Name`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Works_Under`
--

LOCK TABLES `Works_Under` WRITE;
/*!40000 ALTER TABLE `Works_Under` DISABLE KEYS */;
INSERT INTO `Works_Under` VALUES ('Ortho',1),('Cardio',2),('Neurology',3),('Ortho',4),('Cardio',5),('Neurology',6),('Ortho',7),('Cardio',8),('Neurology',9),('Ortho',10),('Dermatology',11),('Oncology',12),('Dermatology',13),('Oncology',14),('Dermatology',15),('ENT',16),('Gynecology',17),('ENT',18),('Gynecology',19);
/*!40000 ALTER TABLE `Works_Under` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-03  3:35:54
