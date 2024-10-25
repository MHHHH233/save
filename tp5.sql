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
-- Database: `tp5`
--

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `id_client` int(11) NOT NULL,
  `cin` varchar(20) DEFAULT NULL,
  `nom` varchar(20) DEFAULT NULL,
  `prenom` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`id_client`, `cin`, `nom`, `prenom`, `email`, `password`) VALUES
(1, 'EE75433', 'Amine', 'Baskad', 'aminebaskad@gmail.com', 'www.com123'),
(2, 'QE44567', 'Mahdi', 'Jamai', 'Jamaimrmahdi@gmail.com', 'Jamai2003ee'),
(3, 'QQ89342', 'Othman', 'Baz', 'Baz2002er@gmail.com', 'bAzothman23'),
(4, 'EE656534', 'Khalil', 'Knifli', 'Khalilknifli2005@gmail.com', 'K2005knifli@'),
(5, 'EE12345', 'Yassin', 'Ouldhouis', 'Yassinhaker@gmail.com', 'Yasinlhbil1234'),
(7, 'EE44532', 'Anas', 'Bagari', 'Anas2998bagari@gmail.com', 'Anas2998bagari@gmail');

-- --------------------------------------------------------

--
-- Table structure for table `immobilier`
--

CREATE TABLE `immobilier` (
  `id_imobilier` int(11) NOT NULL,
  `titre` varchar(20) DEFAULT NULL,
  `adresse` varchar(20) DEFAULT NULL,
  `prixlocation` float DEFAULT NULL,
  `id_type` int(11) DEFAULT NULL,
  `disponible` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `immobilier`
--

INSERT INTO `immobilier` (`id_imobilier`, `titre`, `adresse`, `prixlocation`, `id_type`, `disponible`) VALUES
(1, 'imobilier1', 'kech', 50000, 3, 1),
(2, 'imobilier2', 'Rabat', 700000, 6, 0),
(3, 'imobilier3', 'agadir', 46000, 3, 0),
(4, 'imobilier4', 'casa', 80009, 4, 1),
(5, 'imobilier5', 'tanger', 100000, 2, 0),
(6, 'imobilier6', 'fes', 300000, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `id_location` int(11) NOT NULL,
  `id_imobilier` int(11) DEFAULT NULL,
  `id_client` int(11) DEFAULT NULL,
  `date_dlocation` date DEFAULT NULL,
  `date_flocation` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`id_location`, `id_imobilier`, `id_client`, `date_dlocation`, `date_flocation`) VALUES
(1, 2, 7, '2024-06-20', '2024-06-28'),
(2, 3, 1, '2024-06-02', '2024-06-24'),
(3, 5, 5, '2024-06-21', '2024-06-29'),
(4, 5, 3, '2024-06-22', '2024-07-25'),
(5, 3, 2, '2024-08-03', '2024-10-23'),
(6, 1, 5, '2024-06-26', '2024-08-15'),
(7, 5, 3, '2024-06-02', '2024-06-29'),
(8, 6, 2, '2024-06-12', '2024-06-27'),
(9, 4, 5, '2024-06-05', '2024-08-01');

-- --------------------------------------------------------

--
-- Table structure for table `typeblmmo`
--

CREATE TABLE `typeblmmo` (
  `id_type` int(11) NOT NULL,
  `libel` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `typeblmmo`
--

INSERT INTO `typeblmmo` (`id_type`, `libel`) VALUES
(1, 'libelde_1'),
(2, 'libelde_2'),
(3, 'libelde_3'),
(4, 'libelde_4'),
(5, 'libelde_5'),
(6, 'libelde_6');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`);

--
-- Indexes for table `immobilier`
--
ALTER TABLE `immobilier`
  ADD PRIMARY KEY (`id_imobilier`),
  ADD KEY `fk_type` (`id_type`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id_location`),
  ADD KEY `fk_client` (`id_client`),
  ADD KEY `fk_imoblier` (`id_imobilier`);

--
-- Indexes for table `typeblmmo`
--
ALTER TABLE `typeblmmo`
  ADD PRIMARY KEY (`id_type`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `immobilier`
--
ALTER TABLE `immobilier`
  MODIFY `id_imobilier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `id_location` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `typeblmmo`
--
ALTER TABLE `typeblmmo`
  MODIFY `id_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `immobilier`
--
ALTER TABLE `immobilier`
  ADD CONSTRAINT `fk_type` FOREIGN KEY (`id_type`) REFERENCES `typeblmmo` (`id_type`);

--
-- Constraints for table `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `fk_client` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`),
  ADD CONSTRAINT `fk_imoblier` FOREIGN KEY (`id_imobilier`) REFERENCES `immobilier` (`id_imobilier`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
