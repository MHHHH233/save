-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 25 oct. 2024 à 13:57
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `exercicecurseur1`
--

DELIMITER $$
--
-- Procédures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `cursorex1` ()   BEGIN
DECLARE nom1 varchar(20) DEFAULT "";
DECLARE prenom1 varchar(20) DEFAULT "";
DECLARE nbr int DEFAULT 0;
DECLARE i int DEFAULT 1;
DECLARE c CURSOR FOR 
SELECT nompers,prenompers FROM personnel;
SET nbr=(SELECT COUNT(*) AS nbr FROM personnel);
OPEN c; 
WHILE(i<nbr)DO
FETCH c INTO nom1,prenom1;
INSERT INTO client(nomcli,prenomcli) VALUES(nom1,prenom1);
SET i=i+1;
END WHILE;
CLOSE c;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `cursorex2` ()   BEGIN
DECLARE numcli1 int;
DECLARE nomcli1 varchar(20) DEFAULT "";
DECLARE prenomcli1 varchar(20) DEFAULT "";
DECLARE adresse1 varchar(60) DEFAULT "";
DECLARE tel1 varchar(10) DEFAULT "";
DECLARE c CURSOR FOR 
SELECT  numcli,nomcli,prenomcli,adresse,tel FROM personnel ORDER BY numcli DESC LIMIT 1;
OPEN c; 
FETCH c INTO numcli1,nomcli1,prenomcli1,adresse1,tel1 ;
INSERT INTO personnel VALUES(numcli1,nomcli1,prenomcli1,adresse1,tel1);
CLOSE c;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `numcli` int(11) DEFAULT NULL,
  `nomcli` varchar(30) DEFAULT NULL,
  `prenomcli` varchar(30) DEFAULT NULL,
  `Adresse` varchar(60) DEFAULT NULL,
  `tel` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `compte_client`
--

CREATE TABLE `compte_client` (
  `numcli` int(11) DEFAULT NULL,
  `num_ccl` int(11) DEFAULT NULL,
  `numtype_ccl` int(11) DEFAULT NULL,
  `date_ccl` date NOT NULL DEFAULT curdate(),
  `numpers` int(11) DEFAULT NULL,
  `Solde` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personnel`
--

CREATE TABLE `personnel` (
  `numpers` int(11) DEFAULT NULL,
  `nompers` varchar(30) DEFAULT NULL,
  `prenompers` varchar(30) DEFAULT NULL,
  `manager` int(11) DEFAULT NULL,
  `salaire` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
