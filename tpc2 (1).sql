-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 26, 2024 at 12:26 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tpc2`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `Exercice1` ()   BEGIN
DECLARE idemp1 int;
DECLARE nomemp1 varchar(50);
DECLARE sal1 float;
DECLARE deptno1 int;
DECLARE nbr int DEFAULT 0 ;
DECLARE i int DEFAULT 0;
DECLARE c CURSOR For  SELECT Idemp ,NomEmp ,Sal ,Deptno FROM emp;
SET nbr =(SELECT COUNT(*) FROM emp);
OPEN c;
WHILE (i < nbr) DO
FETCH c INTO idemp1,nomemp1,sal1,deptno1;
IF (sal1 > 3000)THEN
INSERT INTO emp1 VALUES(idemp1,nomemp1,sal1,deptno1);
ELSE
INSERT INTO emp2 VALUES(idemp1,nomemp1,sal1,deptno1);
END IF;
SET i = i+i;
END WHILE;
CLOSE c;
SELECT 'Le nombre totale de Employes est',nbr;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Exercice1q3` (IN `x` INT, IN `y` INT)   BEGIN
DECLARE idemp1 int;
DECLARE nomemp1 varchar(50);
DECLARE sal1 float;
DECLARE deptno1 int;
DECLARE nbr int DEFAULT 0 ;
DECLARE i int DEFAULT 0;
DECLARE c CURSOR For  SELECT Idemp ,NomEmp ,Sal ,Deptno FROM emp WHERE Sal  BETWEEN x AND y;
SET nbr =(SELECT COUNT(*) FROM emp);
OPEN c;
WHILE (i < nbr) DO
FETCH c INTO idemp1,nomemp1,sal1,deptno1;
INSERT INTO emp1 VALUES(idemp1,nomemp1,sal1,deptno1);
SET i = i+i;
END WHILE;
CLOSE c;
SELECT COUNT(*) AS TotalEmployees FROM Emp WHERE Sal BETWEEN X AND Y;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Toarchive` ()   BEGIN
DECLARE id1 int;
DECLARE nom1 varchar(50);
DECLARE service1 float;
DECLARE sale1 int;
DECLARE nbr int DEFAULT 0 ;
DECLARE i int DEFAULT 0;
DECLARE c CURSOR For  SELECT Id ,Nom ,Service ,Salaire FROM vendeurs;
SET nbr =(SELECT COUNT(*) FROM emp);
OPEN c;
WHILE (i< nbr) DO
FETCH c INTO id1,nom1,service1,sale1;
INSERT INTO archive1 VALUES(id1,nom1,service1,sale1);
SET i = i+i;
END WHILE;
CLOSE c;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Topsellers` (`x` INT)   BEGIN
DECLARE id1 int;
DECLARE nom1 varchar(50);
DECLARE service1 float;
DECLARE sale1 int;
DECLARE nbr int DEFAULT 0 ;
DECLARE i int DEFAULT 0;
DECLARE c CURSOR For  SELECT Id ,Nom ,Service ,Salaire FROM vendeurs ORDER BY Salaire LIMIT x;
SET nbr =(SELECT COUNT(*) FROM emp);
OPEN c;
CREATE OR REPLACE TABLE archive1 (Id INT PRIMARY KEY,Nom VARCHAR(100),Service VARCHAR(100),Salaire INT);
WHILE (i< nbr) DO
FETCH c INTO id1,nom1,service1,sale1;
INSERT INTO archive1 VALUES(id1,nom1,service1,sale1);
SET i = i+i;
END WHILE;
CLOSE c;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `archive1`
--

CREATE TABLE `archive1` (
  `Id` int(11) NOT NULL,
  `Nom` varchar(100) DEFAULT NULL,
  `Service` varchar(100) DEFAULT NULL,
  `Salaire` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `archive1`
--

INSERT INTO `archive1` (`Id`, `Nom`, `Service`, `Salaire`) VALUES
(1, 'Vendeur 1', '10', 2500),
(5, 'Vendeur 5', '10', 2300),
(8, 'Vendeur 8', '10', 2800);

-- --------------------------------------------------------

--
-- Table structure for table `emp`
--

CREATE TABLE `emp` (
  `Idemp` int(11) NOT NULL,
  `NomEmp` varchar(100) DEFAULT NULL,
  `Sal` float(10,2) DEFAULT NULL,
  `Deptno` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `emp`
--

INSERT INTO `emp` (`Idemp`, `NomEmp`, `Sal`, `Deptno`) VALUES
(1, 'Ahmed', 5000.00, 10),
(2, 'Sara', 2800.00, 20),
(3, 'Khalid', 3500.00, 30),
(4, 'Fatima', 2000.00, 20),
(5, 'Omar', 4500.00, 10);

-- --------------------------------------------------------

--
-- Table structure for table `emp1`
--

CREATE TABLE `emp1` (
  `Idemp` int(11) NOT NULL,
  `NomEmp` varchar(100) DEFAULT NULL,
  `Sal` float(10,2) DEFAULT NULL,
  `Deptno` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `emp1`
--

INSERT INTO `emp1` (`Idemp`, `NomEmp`, `Sal`, `Deptno`) VALUES
(1, 'Ahmed', 5000.00, 10),
(3, 'Khalid', 3500.00, 30),
(5, 'Omar', 4500.00, 10),
(1, 'Ahmed', 5000.00, 10),
(3, 'Khalid', 3500.00, 30),
(5, 'Omar', 4500.00, 10),
(1, 'Ahmed', 5000.00, 10),
(3, 'Khalid', 3500.00, 30),
(5, 'Omar', 4500.00, 10),
(1, 'Ahmed', 5000.00, 10),
(5, 'Omar', 4500.00, 10),
(1, 'Ahmed', 5000.00, 10),
(1, 'Ahmed', 5000.00, 10),
(2, 'Sara', 2800.00, 20),
(3, 'Khalid', 3500.00, 30),
(4, 'Fatima', 2000.00, 20),
(5, 'Omar', 4500.00, 10);

-- --------------------------------------------------------

--
-- Table structure for table `emp2`
--

CREATE TABLE `emp2` (
  `Idemp` int(11) NOT NULL,
  `NomEmp` varchar(100) DEFAULT NULL,
  `Sal` float(10,2) DEFAULT NULL,
  `Deptno` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `emp2`
--

INSERT INTO `emp2` (`Idemp`, `NomEmp`, `Sal`, `Deptno`) VALUES
(2, 'Sara', 2800.00, 20),
(4, 'Fatima', 2000.00, 20),
(2, 'Sara', 2800.00, 20),
(4, 'Fatima', 2000.00, 20),
(2, 'Sara', 2800.00, 20),
(4, 'Fatima', 2000.00, 20);

-- --------------------------------------------------------

--
-- Table structure for table `vendeurs`
--

CREATE TABLE `vendeurs` (
  `Id` int(11) NOT NULL,
  `Nom` varchar(100) DEFAULT NULL,
  `Service` varchar(100) DEFAULT NULL,
  `Salaire` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vendeurs`
--

INSERT INTO `vendeurs` (`Id`, `Nom`, `Service`, `Salaire`) VALUES
(1, 'Vendeur 1', '10', 2500),
(2, 'Vendeur 2', '10', 3200),
(3, 'Vendeur 3', '10', 2900),
(4, 'Vendeur 4', '10', 3400),
(5, 'Vendeur 5', '10', 2300),
(6, 'Vendeur 6', '10', 3600),
(7, 'Vendeur 7', '10', 3100),
(8, 'Vendeur 8', '10', 2800),
(9, 'Vendeur 9', '10', 3700),
(10, 'Vendeur 10', '10', 3300);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `archive1`
--
ALTER TABLE `archive1`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `vendeurs`
--
ALTER TABLE `vendeurs`
  ADD PRIMARY KEY (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
