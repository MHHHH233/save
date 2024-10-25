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
-- Database: `fct4`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `Afficher` (IN `x` INT)   BEGIN
    SELECT g.libelleGenre,i.nomIndividu,COUNT(gf.numFilm) AS nombre_films
    FROM genrefilm gf
    JOIN film f ON f.numFilm = gf.numFilm
    JOIN acteur a ON a.numFilm = f.numFilm
    JOIN individu i ON i.numIndividu = a.numIndividu
    JOIN genre g ON g.codeGenre = gf.codeGenre
    WHERE i.numIndividu = x
    GROUP BY g.libelleGenre;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `NombreFilm` (IN `acteur_nom` VARCHAR(255))   BEGIN
    SELECT g.libelleGenre AS categorie, COUNT(f.numFilm) AS nombre_films
    FROM film f,genrefilm ge
    JOIN acteur a ON f.numFilm = ge.numFilm
    JOIN genre g ON ge.codeGenre = g.codeGenre
    WHERE a.numIndividu = acteur_nom
    GROUP BY c.nom;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `acteur`
--

CREATE TABLE `acteur` (
  `numFilm` int(11) NOT NULL,
  `numIndividu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `acteur`
--

INSERT INTO `acteur` (`numFilm`, `numIndividu`) VALUES
(1, 3),
(2, 3),
(3, 3),
(4, 4),
(5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `exemplaire`
--

CREATE TABLE `exemplaire` (
  `numExemplaire` int(11) NOT NULL,
  `numFilm` int(11) DEFAULT NULL,
  `codeSupport` varchar(4) DEFAULT NULL,
  `VO` varchar(16) DEFAULT NULL,
  `probleme` varchar(60) DEFAULT NULL,
  `detailSupport` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exemplaire`
--

INSERT INTO `exemplaire` (`numExemplaire`, `numFilm`, `codeSupport`, `VO`, `probleme`, `detailSupport`) VALUES
(1, 1, 'DVD', 'English', NULL, 'HD'),
(2, 2, 'BluR', 'English', NULL, 'FullHD'),
(3, 3, 'DVD', 'English', 'Scratches', 'SD'),
(4, 4, 'BluR', 'English', NULL, 'FullHD'),
(5, 5, 'DVD', 'English', NULL, 'HD');

-- --------------------------------------------------------

--
-- Table structure for table `film`
--

CREATE TABLE `film` (
  `numFilm` int(11) NOT NULL,
  `titre` varchar(50) DEFAULT NULL,
  `realisateur` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `film`
--

INSERT INTO `film` (`numFilm`, `titre`, `realisateur`) VALUES
(1, 'Inception', 1),
(2, 'Django Unchained', 2),
(3, 'The Wolf of Wall Street', 5),
(4, 'Once Upon a Time in Hollywood', 2),
(5, 'Interstellar', 1);

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `codeGenre` varchar(2) NOT NULL,
  `libelleGenre` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`codeGenre`, `libelleGenre`) VALUES
('AC', 'Action'),
('CO', 'Comedy'),
('DR', 'Drama'),
('SC', 'Science Fiction'),
('TH', 'Thriller');

-- --------------------------------------------------------

--
-- Table structure for table `genrefilm`
--

CREATE TABLE `genrefilm` (
  `numFilm` int(11) NOT NULL,
  `codeGenre` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `genrefilm`
--

INSERT INTO `genrefilm` (`numFilm`, `codeGenre`) VALUES
(1, 'SC'),
(2, 'AC'),
(3, 'DR'),
(4, 'CO'),
(5, 'SC');

-- --------------------------------------------------------

--
-- Table structure for table `individu`
--

CREATE TABLE `individu` (
  `numIndividu` int(11) NOT NULL,
  `nomIndividu` varchar(30) DEFAULT NULL,
  `prenomIndividu` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `individu`
--

INSERT INTO `individu` (`numIndividu`, `nomIndividu`, `prenomIndividu`) VALUES
(1, 'Nolan', 'Christopher'),
(2, 'Tarantino', 'Quentin'),
(3, 'DiCaprio', 'Leonardo'),
(4, 'Pitt', 'Brad'),
(5, 'Scorsese', 'Martin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acteur`
--
ALTER TABLE `acteur`
  ADD PRIMARY KEY (`numFilm`,`numIndividu`),
  ADD KEY `numIndividu` (`numIndividu`);

--
-- Indexes for table `exemplaire`
--
ALTER TABLE `exemplaire`
  ADD PRIMARY KEY (`numExemplaire`),
  ADD KEY `numFilm` (`numFilm`);

--
-- Indexes for table `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`numFilm`),
  ADD KEY `realisateur` (`realisateur`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`codeGenre`);

--
-- Indexes for table `genrefilm`
--
ALTER TABLE `genrefilm`
  ADD PRIMARY KEY (`numFilm`,`codeGenre`),
  ADD KEY `codeGenre` (`codeGenre`);

--
-- Indexes for table `individu`
--
ALTER TABLE `individu`
  ADD PRIMARY KEY (`numIndividu`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `acteur`
--
ALTER TABLE `acteur`
  ADD CONSTRAINT `acteur_ibfk_1` FOREIGN KEY (`numFilm`) REFERENCES `film` (`numFilm`),
  ADD CONSTRAINT `acteur_ibfk_2` FOREIGN KEY (`numIndividu`) REFERENCES `individu` (`numIndividu`);

--
-- Constraints for table `exemplaire`
--
ALTER TABLE `exemplaire`
  ADD CONSTRAINT `exemplaire_ibfk_1` FOREIGN KEY (`numFilm`) REFERENCES `film` (`numFilm`);

--
-- Constraints for table `film`
--
ALTER TABLE `film`
  ADD CONSTRAINT `film_ibfk_1` FOREIGN KEY (`realisateur`) REFERENCES `individu` (`numIndividu`);

--
-- Constraints for table `genrefilm`
--
ALTER TABLE `genrefilm`
  ADD CONSTRAINT `genrefilm_ibfk_1` FOREIGN KEY (`numFilm`) REFERENCES `film` (`numFilm`),
  ADD CONSTRAINT `genrefilm_ibfk_2` FOREIGN KEY (`codeGenre`) REFERENCES `genre` (`codeGenre`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
