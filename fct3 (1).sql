-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 26, 2024 at 12:28 AM
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
-- Database: `fct3`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `Afficher` ()   BEGIN 
SELECT article.numa ,article.desa FROM article;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CompPeriode` (`x` DATE, `y` DATE)   BEGIN
SELECT c.* FROM commande c WHERE c.datec BETWEEN x AND y;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EnregistrerLigneCom` (IN `numa1` INT, IN `numc1` INT, IN `qtec1` INT)   BEGIN
DECLARE maxa int DEFAULT 0;
DECLARE maxc int DEFAULT 0;
DECLARE maxq int DEFAULT 0;
SET maxa =(SELECT COUNT(numa) FROM article);
SET maxc =(SELECT COUNT(numc) FROM commande);
SET maxq = (SELECT article.qteAen FROM article WHERE article.numa = numa1);
IF (numa1 > maxa OR maxq < qtec1 ) THEN
SELECT('Error 400');
ELSEIF (numc1 > maxc) THEN
INSERT INTO commande VALUES(numc1,CURRENT_DATE());
ELSEIF (numa1<= maxa and numc1 <= maxc AND  maxq < qtec1) THEN
UPDATE lignc SET lignc.qtec =qtec1 WHERE lignc.numc =numc1 AND lignc.numa = numa1;
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ListeArticle` (`x` INT)   BEGIN
SELECT a.* FROM lignc l JOIN article a ON a.numa =l.numa JOIN commande c ON c.numc=l.numc
WHERE x = l.numc;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `NbrArtCom` (IN `x` INT)   BEGIN
SELECT a.desa,COUNT(c.numc) AS NombreFoisCommander FROM lignc l JOIN article a ON a.numa =l.numa JOIN commande c ON c.numc=l.numc WHERE x = a.numa;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `nbrArticle` ()   BEGIN
SELECT c.numc,COUNT(l.numa) FROM lignc l  JOIN commande c ON c.numc= l.numc  GROUP BY c.numc;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `NbrCommandes` ()   BEGIN
SELECT COUNT(*) AS NbrCommandes FROM commande;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `TypeComPeriode` (IN `date_debut` DATE, IN `date_fin` DATE)   BEGIN
    DECLARE nombre_commandes INT;

    
   set nombre_commandes =( SELECT COUNT(*) 
    FROM commande
    WHERE datec BETWEEN date_debut AND date_fin);

   
    SELECT numc, datec
    FROM commande
    WHERE datec BETWEEN date_debut AND date_fin;

   
    IF nombre_commandes > 100 THEN
        SELECT 'Periode rouge' AS type_periode;
    ELSEIF  nombre_commandes BETWEEN 50 AND 100 THEN
        SELECT 'Periode jaune' AS type_periode;
    ELSE
        SELECT 'Periode blanche' AS type_periode;
    END IF;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `numa` int(11) NOT NULL,
  `desa` varchar(50) DEFAULT NULL,
  `puar` varchar(50) DEFAULT NULL,
  `qteAen` int(11) DEFAULT NULL,
  `seuilmi` int(11) DEFAULT NULL,
  `seuilma` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`numa`, `desa`, `puar`, `qteAen`, `seuilmi`, `seuilma`) VALUES
(1, 'Laptop', '1000', 50, 5, 100),
(2, 'Smartphone', '700', 30, 3, 50),
(3, 'Headphones', '200', 100, 10, 200),
(4, 'Monitor', '300', 20, 2, 40),
(5, 'Keyboard', '50', 200, 15, 300);

-- --------------------------------------------------------

--
-- Table structure for table `commande`
--

CREATE TABLE `commande` (
  `numc` int(11) NOT NULL,
  `datec` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `commande`
--

INSERT INTO `commande` (`numc`, `datec`) VALUES
(1, '2024-10-01'),
(2, '2024-10-02'),
(3, '2024-10-03'),
(4, '2024-10-04'),
(5, '2024-10-05'),
(6, '2024-09-06'),
(7, '2024-09-07'),
(8, '2024-09-08'),
(9, '2024-09-09'),
(10, '2024-09-10'),
(11, '2024-09-11'),
(12, '2024-09-12'),
(13, '2024-09-13'),
(14, '2024-09-14'),
(15, '2024-09-15'),
(16, '2024-09-16'),
(17, '2024-09-17'),
(18, '2024-09-18'),
(19, '2024-09-19'),
(20, '2024-09-20'),
(21, '2024-09-21'),
(22, '2024-09-22'),
(23, '2024-09-23'),
(24, '2024-09-24'),
(25, '2024-09-25'),
(26, '2024-09-26'),
(27, '2024-09-27'),
(28, '2024-09-28'),
(29, '2024-09-29'),
(30, '2024-09-30'),
(31, '2024-10-01'),
(32, '2024-10-02'),
(33, '2024-10-03'),
(34, '2024-10-04'),
(35, '2024-10-05'),
(36, '2024-10-06'),
(37, '2024-10-07'),
(38, '2024-10-08'),
(39, '2024-10-09'),
(40, '2024-10-10'),
(41, '2024-10-11'),
(42, '2024-10-12'),
(43, '2024-10-13'),
(44, '2024-10-14'),
(45, '2024-10-15'),
(46, '2024-10-16'),
(47, '2024-10-17'),
(48, '2024-10-18'),
(49, '2024-10-19'),
(50, '2024-10-20'),
(51, '2024-10-21'),
(52, '2024-10-22'),
(53, '2024-10-23'),
(54, '2024-10-24'),
(55, '2024-10-25'),
(56, '2024-10-26'),
(57, '2024-10-27'),
(60, '2024-10-11'),
(61, '2024-10-11');

-- --------------------------------------------------------

--
-- Table structure for table `lignc`
--

CREATE TABLE `lignc` (
  `numc` int(11) DEFAULT NULL,
  `numa` int(11) DEFAULT NULL,
  `qtec` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lignc`
--

INSERT INTO `lignc` (`numc`, `numa`, `qtec`) VALUES
(1, 1, 5),
(2, 2, 3),
(3, 3, 10),
(4, 4, 2),
(5, 5, 15),
(5, 1, 34);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`numa`);

--
-- Indexes for table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`numc`);

--
-- Indexes for table `lignc`
--
ALTER TABLE `lignc`
  ADD KEY `fk_a` (`numa`),
  ADD KEY `fk_c` (`numc`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `lignc`
--
ALTER TABLE `lignc`
  ADD CONSTRAINT `fk_a` FOREIGN KEY (`numa`) REFERENCES `article` (`numa`),
  ADD CONSTRAINT `fk_c` FOREIGN KEY (`numc`) REFERENCES `commande` (`numc`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
