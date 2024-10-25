-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 26, 2024 at 12:27 AM
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
-- Database: `tp4`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `CalculateAvg` (IN `fonctionName` VARCHAR(50))   BEGIN
    SELECT concat(floor(AVG(salaire)),' DH') AS AvgSalaire
    FROM employes
    WHERE fonction = fonctionName;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `changeind` ()   BEGIN
UPDATE employes SET tel = Concat('02',substring(tel,3))
WHERE tel LIKE '04%';
UPDATE employes SET tel = Concat('03',substring(tel,3))
WHERE tel LIKE '05%';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `createvue` ()   BEGIN
CREATE or REPLACE VIEW  MosteviewdMovie AS SELECT numexemplaire,COUNT(*)as watched FROM location GROUP BY numexemplaire HAVING watched>10;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MAJ_CATEGORIE` ()   BEGIN
UPDATE factures SET categorie ='Bon Client' WHERE montant > 1000;
UPDATE factures SET categorie ='Moyen Client' WHERE montant <= 1000;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `NewLocation` (`p_NumClient` INT, `p_NumExemplaire` INT, `p_DateLocation` DATE, `p_DateRetour` DATE)   BEGIN
    INSERT INTO Location(Numclient, Numexemplaire, datelocation, dateRetour)
    VALUES (p_NumClient, p_NumExemplaire, p_DateLocation, p_DateRetour);
END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `EffectifClients` () RETURNS INT(11)  BEGIN
DECLARE nbr int DEFAULT 0;
set nbr =(SELECT COUNT(*) from clients WHERE ville="Oujda");
RETURN nbr;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `codee` varchar(50) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `ville` varchar(50) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`codee`, `nom`, `ville`, `tel`) VALUES
('gfg545433', 'Amine', 'Oujda', '34653623'),
('sadasg78', 'Anas', 'oujda', '767894576');

-- --------------------------------------------------------

--
-- Table structure for table `employes`
--

CREATE TABLE `employes` (
  `code` varchar(50) DEFAULT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `fonction` varchar(50) DEFAULT NULL,
  `salaire` int(11) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employes`
--

INSERT INTO `employes` (`code`, `nom`, `prenom`, `fonction`, `salaire`, `tel`) VALUES
('ff45', 'amine', 'baskad', 'all', 4000, '0350011872'),
('eeer43', 'Hytam', 'Mghnbeer', 'none', 70000, '0277623099'),
('ttr123', 'Mahdi', 'jamai', 'none', 8500, '086543219'),
('ppo980', 'ADhakim', 'Fakhori', 'all', 421345, '018765034');

-- --------------------------------------------------------

--
-- Table structure for table `factures`
--

CREATE TABLE `factures` (
  `num` int(11) NOT NULL,
  `datee` date DEFAULT NULL,
  `montant` float DEFAULT NULL,
  `categorie` varchar(50) DEFAULT NULL,
  `codee` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `factures`
--

INSERT INTO `factures` (`num`, `datee`, `montant`, `categorie`, `codee`) VALUES
(1, '2024-10-29', 11000, 'Bon Client', 'sadasg78'),
(2, '2024-08-14', 500, 'Moyen Client', 'gfg545433');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `numclient` int(11) DEFAULT NULL,
  `numexemplaire` int(11) DEFAULT NULL,
  `datelocation` date DEFAULT NULL,
  `dateRetour` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`numclient`, `numexemplaire`, `datelocation`, `dateRetour`) VALUES
(1, 101, '2024-01-01', '2024-01-05'),
(2, 101, '2024-01-03', '2024-01-07'),
(3, 102, '2024-01-04', '2024-01-08'),
(4, 102, '2024-01-06', '2024-01-10'),
(5, 103, '2024-01-10', '2024-01-15'),
(6, 103, '2024-01-12', '2024-01-16'),
(7, 104, '2024-01-15', '2024-01-20'),
(8, 104, '2024-01-17', '2024-01-22'),
(9, 105, '2024-01-18', '2024-01-23'),
(10, 106, '2024-01-19', '2024-01-24'),
(11, 101, '2024-01-20', '2024-01-25'),
(12, 101, '2024-01-21', '2024-01-26'),
(13, 101, '2024-01-22', '2024-01-27'),
(14, 101, '2024-01-23', '2024-01-28'),
(15, 101, '2024-01-24', '2024-01-29'),
(16, 101, '2024-01-25', '2024-01-30'),
(17, 101, '2024-01-26', '2024-01-31'),
(18, 101, '2024-01-27', '2024-02-01'),
(19, 101, '2024-01-28', '2024-02-02'),
(20, 101, '2024-01-29', '2024-02-03'),
(21, 107, '2024-01-30', '2024-02-05'),
(22, 108, '2024-01-31', '2024-02-06'),
(23, 109, '2024-02-01', '2024-02-07'),
(24, 110, '2024-02-02', '2024-02-08'),
(25, 111, '2024-02-03', '2024-02-09'),
(26, 112, '2024-02-04', '2024-02-10'),
(27, 113, '2024-02-05', '2024-02-11'),
(28, 114, '2024-02-06', '2024-02-12'),
(29, 115, '2024-02-07', '2024-02-13'),
(30, 116, '2024-02-08', '2024-02-14'),
(31, 102, '2024-02-10', '2024-02-15'),
(32, 102, '2024-02-11', '2024-02-16'),
(33, 102, '2024-02-12', '2024-02-17'),
(34, 102, '2024-02-13', '2024-02-18'),
(35, 102, '2024-02-14', '2024-02-19'),
(36, 102, '2024-02-15', '2024-02-20'),
(37, 102, '2024-02-16', '2024-02-21'),
(38, 102, '2024-02-17', '2024-02-22'),
(39, 102, '2024-02-18', '2024-02-23'),
(40, 102, '2024-02-19', '2024-02-24'),
(1, 101, '2024-01-01', '2024-01-05'),
(2, 101, '2024-01-03', '2024-01-07'),
(3, 102, '2024-01-04', '2024-01-08'),
(4, 102, '2024-01-06', '2024-01-10'),
(5, 103, '2024-01-10', '2024-01-15'),
(6, 103, '2024-01-12', '2024-01-16'),
(7, 104, '2024-01-15', '2024-01-20'),
(8, 104, '2024-01-17', '2024-01-22'),
(9, 105, '2024-01-18', '2024-01-23'),
(10, 106, '2024-01-19', '2024-01-24'),
(11, 101, '2024-01-20', '2024-01-25'),
(12, 101, '2024-01-21', '2024-01-26'),
(13, 101, '2024-01-22', '2024-01-27'),
(14, 101, '2024-01-23', '2024-01-28'),
(15, 101, '2024-01-24', '2024-01-29'),
(16, 101, '2024-01-25', '2024-01-30'),
(17, 101, '2024-01-26', '2024-01-31'),
(18, 101, '2024-01-27', '2024-02-01'),
(19, 101, '2024-01-28', '2024-02-02'),
(20, 101, '2024-01-29', '2024-02-03'),
(21, 107, '2024-01-30', '2024-02-05'),
(22, 108, '2024-01-31', '2024-02-06'),
(23, 109, '2024-02-01', '2024-02-07'),
(24, 110, '2024-02-02', '2024-02-08'),
(25, 111, '2024-02-03', '2024-02-09'),
(26, 112, '2024-02-04', '2024-02-10'),
(27, 113, '2024-02-05', '2024-02-11'),
(28, 114, '2024-02-06', '2024-02-12'),
(29, 115, '2024-02-07', '2024-02-13'),
(30, 116, '2024-02-08', '2024-02-14'),
(31, 102, '2024-02-10', '2024-02-15'),
(32, 102, '2024-02-11', '2024-02-16'),
(33, 102, '2024-02-12', '2024-02-17'),
(34, 102, '2024-02-13', '2024-02-18'),
(35, 102, '2024-02-14', '2024-02-19'),
(36, 102, '2024-02-15', '2024-02-20'),
(37, 102, '2024-02-16', '2024-02-21'),
(38, 102, '2024-02-17', '2024-02-22'),
(39, 102, '2024-02-18', '2024-02-23'),
(40, 102, '2024-02-19', '2024-02-24'),
(1, 101, '2024-01-01', '2024-01-05'),
(2, 101, '2024-01-03', '2024-01-07'),
(3, 102, '2024-01-04', '2024-01-08'),
(4, 102, '2024-01-06', '2024-01-10'),
(5, 103, '2024-01-10', '2024-01-15'),
(6, 103, '2024-01-12', '2024-01-16'),
(7, 104, '2024-01-15', '2024-01-20'),
(8, 104, '2024-01-17', '2024-01-22'),
(9, 105, '2024-01-18', '2024-01-23'),
(10, 106, '2024-01-19', '2024-01-24'),
(11, 101, '2024-01-20', '2024-01-25'),
(12, 101, '2024-01-21', '2024-01-26'),
(13, 101, '2024-01-22', '2024-01-27'),
(14, 101, '2024-01-23', '2024-01-28'),
(15, 101, '2024-01-24', '2024-01-29'),
(16, 101, '2024-01-25', '2024-01-30'),
(17, 101, '2024-01-26', '2024-01-31'),
(18, 101, '2024-01-27', '2024-02-01'),
(19, 101, '2024-01-28', '2024-02-02'),
(20, 101, '2024-01-29', '2024-02-03'),
(21, 107, '2024-01-30', '2024-02-05'),
(22, 108, '2024-01-31', '2024-02-06'),
(23, 109, '2024-02-01', '2024-02-07'),
(24, 110, '2024-02-02', '2024-02-08'),
(25, 111, '2024-02-03', '2024-02-09'),
(26, 112, '2024-02-04', '2024-02-10'),
(27, 113, '2024-02-05', '2024-02-11'),
(28, 114, '2024-02-06', '2024-02-12'),
(29, 115, '2024-02-07', '2024-02-13'),
(30, 116, '2024-02-08', '2024-02-14'),
(31, 102, '2024-02-10', '2024-02-15'),
(32, 102, '2024-02-11', '2024-02-16'),
(33, 102, '2024-02-12', '2024-02-17'),
(34, 102, '2024-02-13', '2024-02-18'),
(35, 102, '2024-02-14', '2024-02-19'),
(36, 102, '2024-02-15', '2024-02-20'),
(37, 102, '2024-02-16', '2024-02-21'),
(38, 102, '2024-02-17', '2024-02-22'),
(39, 102, '2024-02-18', '2024-02-23'),
(40, 102, '2024-02-19', '2024-02-24'),
(41, 117, '2024-02-20', '2024-02-25'),
(42, 118, '2024-02-21', '2024-02-26'),
(43, 119, '2024-02-22', '2024-02-27'),
(44, 120, '2024-02-23', '2024-02-28'),
(45, 121, '2024-02-24', '2024-03-01'),
(46, 122, '2024-02-25', '2024-03-02'),
(47, 123, '2024-02-26', '2024-03-03'),
(48, 124, '2024-02-27', '2024-03-04'),
(49, 125, '2024-02-28', '2024-03-05'),
(50, 126, '2024-03-01', '2024-03-06'),
(51, 127, '2024-03-02', '2024-03-07'),
(52, 128, '2024-03-03', '2024-03-08'),
(53, 129, '2024-03-04', '2024-03-09'),
(54, 130, '2024-03-05', '2024-03-10'),
(55, 131, '2024-03-06', '2024-03-11'),
(56, 132, '2024-03-07', '2024-03-12'),
(57, 133, '2024-03-08', '2024-03-13'),
(58, 134, '2024-03-09', '2024-03-14'),
(59, 135, '2024-03-10', '2024-03-15'),
(60, 136, '2024-03-11', '2024-03-16'),
(69, 96, '2009-12-09', '2012-09-12');

-- --------------------------------------------------------

--
-- Stand-in structure for view `mosteviewdmovie`
-- (See below for the actual view)
--
CREATE TABLE `mosteviewdmovie` (
`numexemplaire` int(11)
,`watched` bigint(21)
);

-- --------------------------------------------------------

--
-- Structure for view `mosteviewdmovie`
--
DROP TABLE IF EXISTS `mosteviewdmovie`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `mosteviewdmovie`  AS SELECT `location`.`numexemplaire` AS `numexemplaire`, count(0) AS `watched` FROM `location` GROUP BY `location`.`numexemplaire` HAVING `watched` > 2 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`codee`);

--
-- Indexes for table `factures`
--
ALTER TABLE `factures`
  ADD PRIMARY KEY (`num`),
  ADD KEY `fk_c` (`codee`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `factures`
--
ALTER TABLE `factures`
  ADD CONSTRAINT `fk_c` FOREIGN KEY (`codee`) REFERENCES `clients` (`codee`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
