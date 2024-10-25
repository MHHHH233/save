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
-- Database: `tpcursor4`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `afficher` ()   BEGIN
DECLARE num1 int;
DECLARE nom1 varchar(50);
DECLARE i int DEFAULT 0;
DECLARE nbr int DEFAULT 0;
DECLARE c CURSOR FOR SELECT numero,nom FROM departement WHERE numero < 100;
SET nbr=(SELECT COUNT(*) FROM departement WHERE numero <100);
OPEN c;
WHILE(i <nbr)DO
FETCH c INTO num1,nom1;
SELECT num1 as Numero,nom1 AS NOM ;
SET i = i+1;
END WHILE ;
CLOSE c;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `calcmpy` ()   BEGIN
DECLARE m10 FLOAT DEFAULT 0;
DECLARE m60 FLOAT DEFAULT 0;
DECLARE i int DEFAULT 0;
DECLARE nbr int DEFAULT 0;
DECLARE salaire1 float DEFAULT 0;
DECLARE depar1 int ;
DECLARE c CURSOR FOR SELECT salaire,depar FROM emp WHERE depar=10 OR
depar = 60;
SET nbr =(SELECT count(*) FROM emp WHERE depar=10 OR depar = 60);
OPEN c;
WHILE (i < nbr)do
FETCH c INTO salaire1,depar1;
if(depar1 = 10)THEN
SET m10 = m10 + salaire1;
ELSE
SET m60 = m60 + salaire1;
END IF;
SET i =i +1;
END WHILE ;
CLOSE c;
SELECT 'moyenne des salaires départements 10 : ',m10,'DH';
SELECT 'moyenne des salaires départements 60 : ',m60,'DH';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `emp_cursor` ()   BEGIN 
DECLARE salaire1 float ;
DECLARE i int DEFAULT 0;
DECLARE nbr int DEFAULT 0;
DECLARE c CURSOR FOR SELECT salaire FROM emp ORDER BY salaire  LIMIT 15;
SET nbr=(SELECT COUNT(*) FROM emp ORDER BY salaire LIMIT 10 ); 
OPEN c;
CREATE or REPLACE TABLE top_salaries (id int PRIMARY KEY AUTO_INCREMENT,salary float);
WHILE(i < nbr) DO
FETCH c INTO salaire1;
INSERT INTO top_salaries(top_salaries.salary) VALUES(salaire1);
SET i =i+1;
END WHILE;
CLOSE c;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `departement`
--

CREATE TABLE `departement` (
  `numero` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departement`
--

INSERT INTO `departement` (`numero`, `nom`) VALUES
(10, 'Human Resources'),
(20, 'Finance'),
(30, 'Marketing'),
(40, 'IT Support'),
(50, 'Sales');

-- --------------------------------------------------------

--
-- Table structure for table `emp`
--

CREATE TABLE `emp` (
  `nom` varchar(39) DEFAULT NULL,
  `prenom` varchar(39) DEFAULT NULL,
  `salaire` float DEFAULT NULL,
  `id` int(11) NOT NULL,
  `depar` int(11) DEFAULT NULL,
  `poste` varchar(50) DEFAULT NULL,
  `date_d_embauche` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `emp`
--

INSERT INTO `emp` (`nom`, `prenom`, `salaire`, `id`, `depar`, `poste`, `date_d_embauche`) VALUES
('Smith', 'John', 75000, 136, 10, 'Manager', '2022-01-15'),
('Doe', 'Jane', 82000, 137, 20, 'Accountant', '2021-03-22'),
('Johnson', 'Chris', 91000, 138, 10, 'Analyst', '2020-05-10'),
('Brown', 'Alex', 67000, 139, 30, 'Marketer', '2019-07-14'),
('Williams', 'Pat', 93000, 140, 40, 'IT Support', '2021-11-30'),
('Jones', 'Taylor', 88000, 141, 10, 'Supervisor', '2020-02-19'),
('Miller', 'Jordan', 70000, 142, 20, 'Finance Analyst', '2022-08-09'),
('Davis', 'Morgan', 64000, 143, 50, 'Sales Rep', '2019-10-01'),
('Garcia', 'Casey', 76000, 144, 40, 'Tech Lead', '2021-01-25'),
('Rodriguez', 'Jamie', 72000, 145, 30, 'Marketing Coordinator', '2020-09-14'),
('Martinez', 'Lee', 84000, 146, 50, 'Sales Manager', '2022-06-17'),
('Hernandez', 'Kim', 97000, 147, 10, 'Operations Manager', '2018-03-05'),
('Lopez', 'Sam', 68000, 148, 20, 'Budget Analyst', '2019-12-20'),
('Gonzalez', 'Alexis', 78000, 149, 50, 'Account Executive', '2020-04-13'),
('Wilson', 'Jessie', 86000, 150, 40, 'Software Engineer', '2021-02-22'),
('Anderson', 'Robin', 83000, 151, 30, 'Digital Strategist', '2022-09-08'),
('Thomas', 'Kris', 90000, 152, 10, 'Senior Analyst', '2019-08-15'),
('Taylor', 'Jordan', 95000, 153, 50, 'Director', '2020-06-12'),
('Moore', 'Blake', 87000, 154, 40, 'Systems Analyst', '2021-04-29'),
('Jackson', 'Riley', 93000, 155, 10, 'Project Manager', '2019-11-01');

-- --------------------------------------------------------

--
-- Table structure for table `top_salaries`
--

CREATE TABLE `top_salaries` (
  `id` int(11) NOT NULL,
  `salary` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `top_salaries`
--

INSERT INTO `top_salaries` (`id`, `salary`) VALUES
(1, 64000),
(2, 67000),
(3, 68000),
(4, 70000),
(5, 72000),
(6, 75000),
(7, 76000),
(8, 78000),
(9, 82000),
(10, 84000),
(11, 86000),
(12, 88000),
(13, 91000),
(14, 93000),
(15, 97000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `departement`
--
ALTER TABLE `departement`
  ADD PRIMARY KEY (`numero`);

--
-- Indexes for table `emp`
--
ALTER TABLE `emp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_d` (`depar`);

--
-- Indexes for table `top_salaries`
--
ALTER TABLE `top_salaries`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `emp`
--
ALTER TABLE `emp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT for table `top_salaries`
--
ALTER TABLE `top_salaries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `emp`
--
ALTER TABLE `emp`
  ADD CONSTRAINT `fk_d` FOREIGN KEY (`depar`) REFERENCES `departement` (`numero`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
