-- phpMyAdmin SQL Dump
-- version 5.2.1-1.fc38
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : sam. 16 sep. 2023 à 13:53
-- Version du serveur : 10.5.21-MariaDB
-- Version de PHP : 8.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `Appli_Breizhibus`
--

-- --------------------------------------------------------

--
-- Structure de la table `Arrets`
--

CREATE TABLE `Arrets` (
  `id` int(11) NOT NULL,
  `libelle` varchar(20) NOT NULL,
  `adresse` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `Arrets`
--

INSERT INTO `Arrets` (`id`, `libelle`, `adresse`) VALUES
(1, 'GuÃ©nolÃ©', '6 rue de Saint GuÃ©nolÃ©'),
(2, 'Korrigan', '1 impasse du Korrigan'),
(3, 'Morgana', '2 plage de Morgana'),
(4, 'L\'Ankou', '3 place du CimetiÃ¨re'),
(5, 'Ys', '4 rue de l\'\'Ã®le d\'\'Ys'),
(6, 'Viviane', '5 avenue du Lac');

-- --------------------------------------------------------

--
-- Structure de la table `Bus`
--

CREATE TABLE `Bus` (
  `id` int(11) NOT NULL,
  `numero` varchar(4) NOT NULL,
  `immatriculation` varchar(7) NOT NULL,
  `ligne` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `Bus`
--

INSERT INTO `Bus` (`id`, `numero`, `immatriculation`, `ligne`) VALUES
(24, 'B001', 'AB123CD', 1),
(25, 'B002', 'EF456GH', 2),
(26, 'B003', 'IJ789KL', 3),
(27, 'B004', 'MN012OP', 4),
(28, 'B005', 'QR345ST', 1),
(29, 'B006', 'UV678WX', 2),
(30, 'B007', 'YZ901AB', 3),
(31, 'B008', 'CD234EF', 4);

-- --------------------------------------------------------

--
-- Structure de la table `Frequentation`
--

CREATE TABLE `Frequentation` (
  `id` int(11) NOT NULL,
  `jour` date NOT NULL,
  `nombre_passagers` int(11) NOT NULL,
  `horaire` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `Frequentation`
--

INSERT INTO `Frequentation` (`id`, `jour`, `nombre_passagers`, `horaire`) VALUES
(1, '2023-06-01', 15, 1),
(2, '2023-06-01', 20, 2),
(3, '2023-06-01', 15, 3),
(4, '2023-06-01', 10, 4),
(5, '2023-06-01', 15, 5),
(6, '2023-06-02', 17, 12),
(7, '2023-06-02', 25, 2),
(8, '2023-06-02', 17, 3),
(9, '2023-06-02', 12, 4),
(10, '2023-06-02', 17, 5),
(11, '2023-06-03', 18, 1),
(12, '2023-06-03', 30, 2),
(13, '2023-06-03', 18, 3),
(14, '2023-06-03', 15, 4),
(15, '2023-06-03', 18, 5),
(16, '2023-06-01', 13, 6),
(17, '2023-06-01', 22, 7),
(18, '2023-06-01', 13, 8),
(19, '2023-06-01', 9, 9),
(20, '2023-06-01', 13, 10),
(21, '2023-06-02', 15, 6),
(22, '2023-06-02', 28, 7),
(23, '2023-06-02', 15, 8),
(24, '2023-06-02', 11, 9),
(25, '2023-06-02', 15, 10),
(26, '2023-06-03', 16, 6),
(27, '2023-06-03', 33, 7),
(28, '2023-06-03', 16, 8),
(29, '2023-06-03', 14, 9),
(30, '2023-06-03', 16, 10),
(31, '2023-06-03', 18, 20),
(32, '2023-06-03', 18, 18),
(33, '2023-06-03', 35, 12);

-- --------------------------------------------------------

--
-- Structure de la table `Horaire`
--

CREATE TABLE `Horaire` (
  `id` int(11) NOT NULL,
  `heure` time NOT NULL,
  `ligne` int(11) NOT NULL,
  `arret` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `Horaire`
--

INSERT INTO `Horaire` (`id`, `heure`, `ligne`, `arret`) VALUES
(1, '06:00:00', 1, 1),
(2, '09:00:00', 1, 2),
(3, '12:00:00', 1, 3),
(4, '15:00:00', 1, 4),
(5, '18:00:00', 1, 5),
(6, '07:00:00', 2, 1),
(7, '10:00:00', 2, 2),
(8, '13:00:00', 2, 3),
(9, '16:00:00', 2, 4),
(10, '19:00:00', 2, 5),
(11, '08:00:00', 3, 1),
(12, '11:00:00', 3, 2),
(13, '14:00:00', 3, 3),
(14, '17:00:00', 3, 4),
(15, '20:00:00', 3, 5),
(16, '06:30:00', 4, 1),
(17, '09:30:00', 4, 2),
(18, '12:30:00', 4, 3),
(19, '15:30:00', 4, 4),
(20, '18:30:00', 4, 5);

-- --------------------------------------------------------

--
-- Structure de la table `Lignes`
--

CREATE TABLE `Lignes` (
  `id` int(11) NOT NULL,
  `nom` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `Lignes`
--

INSERT INTO `Lignes` (`id`, `nom`) VALUES
(1, 'Rouge'),
(2, 'Vert'),
(3, 'Bleu'),
(4, 'Noir');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Arrets`
--
ALTER TABLE `Arrets`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Bus`
--
ALTER TABLE `Bus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ligne` (`ligne`);

--
-- Index pour la table `Frequentation`
--
ALTER TABLE `Frequentation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `horaire` (`horaire`);

--
-- Index pour la table `Horaire`
--
ALTER TABLE `Horaire`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ligne` (`ligne`),
  ADD KEY `arret` (`arret`);

--
-- Index pour la table `Lignes`
--
ALTER TABLE `Lignes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Arrets`
--
ALTER TABLE `Arrets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `Bus`
--
ALTER TABLE `Bus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT pour la table `Frequentation`
--
ALTER TABLE `Frequentation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT pour la table `Horaire`
--
ALTER TABLE `Horaire`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `Lignes`
--
ALTER TABLE `Lignes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Bus`
--
ALTER TABLE `Bus`
  ADD CONSTRAINT `Bus_ibfk_1` FOREIGN KEY (`ligne`) REFERENCES `Lignes` (`id`);

--
-- Contraintes pour la table `Frequentation`
--
ALTER TABLE `Frequentation`
  ADD CONSTRAINT `Frequentation_ibfk_1` FOREIGN KEY (`horaire`) REFERENCES `Horaire` (`id`);

--
-- Contraintes pour la table `Horaire`
--
ALTER TABLE `Horaire`
  ADD CONSTRAINT `Horaire_ibfk_1` FOREIGN KEY (`ligne`) REFERENCES `Lignes` (`id`),
  ADD CONSTRAINT `Horaire_ibfk_2` FOREIGN KEY (`arret`) REFERENCES `Arrets` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
