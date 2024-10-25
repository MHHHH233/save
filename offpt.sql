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
-- Database: `offpt`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertStagiaire` (IN `nom1` VARCHAR(50), IN `prenom1` VARCHAR(50), IN `datenaiss1` DATE, IN `adresse1` VARCHAR(100), IN `tel1` VARCHAR(15), IN `Filiere_Name` VARCHAR(50))   BEGIN
DECLARE dateinsr date ;
DECLARE idfiliere int DEFAULT 0;
SET dateinsr = CURRENT_DATE();
SET idfiliere = (SELECT idF FROM filiere WHERE intitulefil = Filiere_Name);
INSERT INTO stagiaire(nom , prenom, datenaiss,dateinscri,adresse,tel,idF)VALUES(nom1,prenom1,datenaiss1,dateinsr,adresse1,tel1,idfiliere);
SELECT'Stagiaire Ajouter Aver Succes.';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updatenote` ()   BEGIN
DECLARE x int DEFAULT 0;
set x = (SELECT MIN(note) from notation WHERE note > 0) ;
UPDATE notation SET note = x WHERE note =0;
SELECT'UPdate it Successfuly';
END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `Increament` () RETURNS INT(11)  BEGIN
DECLARE x int DEFAULT 0;
SET x =(SELECT Max(idS) from stagiaire);
SET x =x +1;
RETURN x;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `InsertStagiaireF` (`nom1` VARCHAR(50), `prenom1` VARCHAR(50), `datenaiss1` DATE, `adresse1` VARCHAR(100), `tel1` INT, `Filiere_Name` VARCHAR(50)) RETURNS INT(11)  BEGIN
DECLARE dateinsr date ;
DECLARE idfiliere int DEFAULT 0;
DECLARE idnext int DEFAULT 0;
SET idnext = Increament();
SET dateinsr = CURRENT_DATE();
SET idfiliere = (SELECT idF FROM filiere WHERE intitulefil = Filiere_Name);
INSERT INTO stagiaire(nom , prenom, datenaiss,dateinscri,adresse,tel,idF)VALUES(nom1,prenom1,datenaiss1,dateinsr,adresse1,tel1,idfiliere);
RETURN idnext;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `nbrfilier` () RETURNS INT(11)  BEGIN
DECLARE x int DEFAULT 0;
set x =(SELECT COUNT(idF) from filiere);

RETURN x;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `filiere`
--

CREATE TABLE `filiere` (
  `idF` int(11) NOT NULL,
  `intitulefil` varchar(50) DEFAULT NULL,
  `capacite` int(11) DEFAULT NULL,
  `nbrannees` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `filiere`
--

INSERT INTO `filiere` (`idF`, `intitulefil`, `capacite`, `nbrannees`) VALUES
(1, 'Dev', 25, 2),
(2, 'Info', 30, 2),
(3, 'Id', 20, 2),
(4, 'Gestion', 30, 3);

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE `module` (
  `idM` int(11) NOT NULL,
  `intitulemod` varchar(50) DEFAULT NULL,
  `masse_horaire` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `module`
--

INSERT INTO `module` (`idM`, `intitulemod`, `masse_horaire`) VALUES
(1, 'oop', 90),
(2, 'javasript', 110),
(3, 'php', 100),
(4, 'web statique', 70);

-- --------------------------------------------------------

--
-- Table structure for table `notation`
--

CREATE TABLE `notation` (
  `idN` int(11) NOT NULL,
  `idS` int(11) DEFAULT NULL,
  `idM` int(11) DEFAULT NULL,
  `note` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notation`
--

INSERT INTO `notation` (`idN`, `idS`, `idM`, `note`) VALUES
(1, 1, 2, 27),
(2, 2, 3, 20),
(3, 2, 4, 20),
(4, 1, 3, 20),
(5, 2, 1, 17),
(6, 1, 1, 17);

-- --------------------------------------------------------

--
-- Table structure for table `stagiaire`
--

CREATE TABLE `stagiaire` (
  `idS` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `datenaiss` date DEFAULT NULL,
  `dateinscri` date DEFAULT NULL,
  `adresse` varchar(100) DEFAULT NULL,
  `tel` varchar(15) DEFAULT NULL,
  `idF` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stagiaire`
--

INSERT INTO `stagiaire` (`idS`, `nom`, `prenom`, `datenaiss`, `dateinscri`, `adresse`, `tel`, `idF`) VALUES
(1, 'Amine', 'Baskad', '2005-10-16', '2024-10-01', 'Socoma 1', '0650011872', 1),
(2, 'Mahdi', 'Jamai', '2003-09-12', '2024-10-01', 'Masera 2', '09999999', 1),
(3, 'Khalkil', '9nifli', '2006-01-19', '2024-10-01', 'asdsadad', '43242351', 1),
(5, 'saghgga', 'asghheg', '2007-07-09', '2024-10-01', 'asdsadsad', '32426236', 1),
(7, 'dasdasdas', 'dasdsadasdas', '1999-01-01', '2024-10-01', 'adasdsad', '0', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `filiere`
--
ALTER TABLE `filiere`
  ADD PRIMARY KEY (`idF`);

--
-- Indexes for table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`idM`);

--
-- Indexes for table `notation`
--
ALTER TABLE `notation`
  ADD PRIMARY KEY (`idN`),
  ADD KEY `fk_S` (`idS`),
  ADD KEY `fk_M` (`idM`);

--
-- Indexes for table `stagiaire`
--
ALTER TABLE `stagiaire`
  ADD PRIMARY KEY (`idS`),
  ADD KEY `fk_F` (`idF`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `filiere`
--
ALTER TABLE `filiere`
  MODIFY `idF` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `module`
--
ALTER TABLE `module`
  MODIFY `idM` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `notation`
--
ALTER TABLE `notation`
  MODIFY `idN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `stagiaire`
--
ALTER TABLE `stagiaire`
  MODIFY `idS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `notation`
--
ALTER TABLE `notation`
  ADD CONSTRAINT `fk_M` FOREIGN KEY (`idM`) REFERENCES `module` (`idM`),
  ADD CONSTRAINT `fk_S` FOREIGN KEY (`idS`) REFERENCES `stagiaire` (`idS`);

--
-- Constraints for table `stagiaire`
--
ALTER TABLE `stagiaire`
  ADD CONSTRAINT `fk_F` FOREIGN KEY (`idF`) REFERENCES `filiere` (`idF`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
