-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mer. 14 juil. 2021 à 06:04
-- Version du serveur :  10.4.10-MariaDB
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `ge_conge`
--

-- --------------------------------------------------------

--
-- Structure de la table `abscence`
--

DROP TABLE IF EXISTS `abscence`;
CREATE TABLE IF NOT EXISTS `abscence` (
  `cod_abs` int(3) NOT NULL AUTO_INCREMENT,
  `mat_per` varchar(7) NOT NULL,
  `njo_abs` int(11) NOT NULL,
  `ann_abs` varchar(4) NOT NULL,
  `dat_abs` date NOT NULL,
  `lieu_abs` varchar(20) DEFAULT NULL,
  `mot_abs` varchar(10) NOT NULL,
  PRIMARY KEY (`cod_abs`),
  KEY `mat_per` (`mat_per`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `conge`
--

DROP TABLE IF EXISTS `conge`;
CREATE TABLE IF NOT EXISTS `conge` (
  `cod_con` int(3) NOT NULL AUTO_INCREMENT,
  `mat_per` varchar(7) NOT NULL,
  `fra_con` varchar(8) NOT NULL,
  `nbr_con` int(2) NOT NULL,
  `ann_con` varchar(4) NOT NULL,
  `lieu` varchar(20) DEFAULT NULL,
  `dep_con` date NOT NULL,
  `arr_con` date NOT NULL,
  PRIMARY KEY (`cod_con`),
  KEY `mat_per` (`mat_per`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `conge`
--

INSERT INTO `conge` (`cod_con`, `mat_per`, `fra_con`, `nbr_con`, `ann_con`, `lieu`, `dep_con`, `arr_con`) VALUES
(65, '202155', 'premier', 7, '2021', '15', '2021-06-05', '2021-06-12');

-- --------------------------------------------------------

--
-- Structure de la table `fonction_grade`
--

DROP TABLE IF EXISTS `fonction_grade`;
CREATE TABLE IF NOT EXISTS `fonction_grade` (
  `cod_fon` int(4) NOT NULL AUTO_INCREMENT,
  `nom_fon` varchar(70) NOT NULL,
  PRIMARY KEY (`cod_fon`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `fonction_grade`
--

INSERT INTO `fonction_grade` (`cod_fon`, `nom_fon`) VALUES
(17, 'DIRECTEUR ETABLISSEMENT'),
(18, 'SECRETAIRE AFFAIRES COURANTES'),
(19, 'RESPONSABLE SUIVI ET MOUVEMENT PERSONNEL'),
(20, 'SECRETAIRE'),
(21, 'Chef personnel'),
(22, 'CHEF DE SERVICE'),
(23, 'CHEF DE DIVISION'),
(24, 'DIRECTEUR ADJOINT ET TECHNIQUE'),
(25, 'DIRECTEUR DES AFFAIRES ADMINISTRATEUR ET FINANCIERS');

-- --------------------------------------------------------

--
-- Structure de la table `grade`
--

DROP TABLE IF EXISTS `grade`;
CREATE TABLE IF NOT EXISTS `grade` (
  `cod_gra` int(5) NOT NULL AUTO_INCREMENT,
  `nom_gra` varchar(50) NOT NULL,
  PRIMARY KEY (`cod_gra`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `grade`
--

INSERT INTO `grade` (`cod_gra`, `nom_gra`) VALUES
(12, '1er classe 1er echellon');

-- --------------------------------------------------------

--
-- Structure de la table `loginf`
--

DROP TABLE IF EXISTS `loginf`;
CREATE TABLE IF NOT EXISTS `loginf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(10) NOT NULL,
  `password` int(10) NOT NULL,
  `per` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `loginf`
--

INSERT INTO `loginf` (`id`, `username`, `password`, `per`) VALUES
(25, 'andry', 1410, 'administrateur'),
(26, 'chu', 1111, 'Administrateur'),
(27, 'aaaa', 1111, 'Utilisateur');

-- --------------------------------------------------------

--
-- Structure de la table `ordre_mission`
--

DROP TABLE IF EXISTS `ordre_mission`;
CREATE TABLE IF NOT EXISTS `ordre_mission` (
  `cod_ord` int(3) NOT NULL AUTO_INCREMENT,
  `mat_per` varchar(7) NOT NULL,
  `lieu` varchar(20) DEFAULT NULL,
  `motif` text NOT NULL,
  `moy_tra` varchar(20) DEFAULT NULL,
  `dep_ord` date NOT NULL,
  `arr_ord` date NOT NULL,
  PRIMARY KEY (`cod_ord`),
  KEY `mat_per` (`mat_per`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `personnel`
--

DROP TABLE IF EXISTS `personnel`;
CREATE TABLE IF NOT EXISTS `personnel` (
  `mat_per` varchar(7) NOT NULL,
  `nom_per` varchar(50) NOT NULL,
  `cod_fon` varchar(70) NOT NULL,
  `cod_gra` varchar(50) NOT NULL,
  `cod_ser` varchar(60) NOT NULL,
  PRIMARY KEY (`mat_per`),
  KEY `cod_fon` (`cod_fon`),
  KEY `cod_ser` (`cod_ser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `personnel`
--

INSERT INTO `personnel` (`mat_per`, `nom_per`, `cod_fon`, `cod_gra`, `cod_ser`) VALUES
('202155', 'qqqqq', 'DIRECTEUR ETABLISSEMENT', '1er classe 1er echellon', 'Direction'),
('445566', 'aaaa', 'SECRETAIRE', '1er classe 1er echellon', 'Personnel');

-- --------------------------------------------------------

--
-- Structure de la table `service`
--

DROP TABLE IF EXISTS `service`;
CREATE TABLE IF NOT EXISTS `service` (
  `cod_ser` int(4) NOT NULL AUTO_INCREMENT,
  `nom_ser` varchar(60) NOT NULL,
  PRIMARY KEY (`cod_ser`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `service`
--

INSERT INTO `service` (`cod_ser`, `nom_ser`) VALUES
(9, 'Personnel'),
(10, 'COMPTE DE COORDINATION DE QUALITE'),
(11, 'Direction'),
(12, 'TECHIQUE DE L INFORMATION ET DE COMMUNICATION'),
(13, 'FINANCIER');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `abscence`
--
ALTER TABLE `abscence`
  ADD CONSTRAINT `abscence_ibfk_1` FOREIGN KEY (`mat_per`) REFERENCES `personnel` (`mat_per`);

--
-- Contraintes pour la table `conge`
--
ALTER TABLE `conge`
  ADD CONSTRAINT `conge_ibfk_1` FOREIGN KEY (`mat_per`) REFERENCES `personnel` (`mat_per`);

--
-- Contraintes pour la table `ordre_mission`
--
ALTER TABLE `ordre_mission`
  ADD CONSTRAINT `ordre_mission_ibfk_1` FOREIGN KEY (`mat_per`) REFERENCES `personnel` (`mat_per`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
