-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 07, 2017 at 11:39 AM
-- Server version: 5.7.18-0ubuntu0.16.04.1
-- PHP Version: 7.0.15-0ubuntu0.16.04.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `afpacar`
--

-- --------------------------------------------------------

--
-- Table structure for table `carpooling`
--

CREATE TABLE `carpooling` (
  `id` int(11) NOT NULL,
  `user` int(11) DEFAULT NULL,
  `establishment` int(11) DEFAULT NULL,
  `description` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `establishment`
--

CREATE TABLE `establishment` (
  `id` int(11) NOT NULL,
  `name` varchar(256) CHARACTER SET utf8 NOT NULL,
  `region` int(11) DEFAULT NULL,
  `address` varchar(512) CHARACTER SET utf8 NOT NULL,
  `postal` int(5) NOT NULL,
  `city` varchar(128) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `establishment`
--

INSERT INTO `establishment` (`id`, `name`, `region`, `address`, `postal`, `city`) VALUES
(1, 'Centre de Brest', 13, '15 rue du Petit Spernot ', 29200, 'BREST'),
(2, 'Centre d\'Auray Saint Goustan', 13, '12 rue de la promenade de Stanguy ', 56400, 'AURAY'),
(3, 'Centre d\'Auray Kervhal en Brech', 13, 'Kervalh', 56400, 'AURAY'),
(4, 'Centre de Saint-Malo', 13, '75 boulevard Gambetta ', 35400, 'ST MALO'),
(5, 'Centre de Saint-Brieuc Cote d\'Emeraude', 13, '29 rue des Madieres ', 22360, 'LES GREVES LANGUEUX'),
(6, 'Centre de Rennes', 13, '6 avenue du Haut Sance', 35000, 'RENNES'),
(7, 'Centre de Quimper', 13, '25 27 rue de Saint Alor ', 29337, 'QUIMPER'),
(8, 'Centre de Morlaix', 13, '39 rue de la Madeleine ', 29600, 'MORLAIX'),
(9, 'Centre de Loudeac', 13, 'rue Chateaubriand', 22600, 'LOUEDAC'),
(10, 'Centre de Nice', 1, '244 route de Turin', 6300, 'NICE'),
(11, 'Centre de Marseille St Jérôme', 1, '54 boulevard Laveran', 13013, 'MARSEILLE'),
(12, 'Centre de Marseille Pointe Rouge', 1, '3 port de la Pointe Rouge', 13008, 'MARSEILLE'),
(13, 'Centre de Marseille la Treille', 1, 'chemin de la Clue', 13011, 'MARSEILLE'),
(14, 'Centre de Gap', 1, 'rue des Lauriers', 5000, 'GAP'),
(15, 'Centre de Cannes la Bocca', 1, '161 avenue Francis Tonner', 6150, 'CANNES'),
(16, 'Centre d\'Avignon Le-Pontet', 1, '56 avenue Emile Zola', 84130, 'LE PONTET'),
(17, 'Centre d\'Istres', 1, 'avenue Felix Gouin', 13800, 'ISTRES'),
(18, 'Centre de Toulon La Valette', 1, '395 avenue de la Liberation', 83160, 'LA VALETTE DU VAR LA VALETTE DU VAR'),
(19, 'Centre de Lyon Vénissieux', 4, '35 boulevard Jodino', 69200, 'VENISSIEUX'),
(20, 'Centre de Lyon St Priest', 4, '97 rue Aristide Briand', 69800, 'ST PRIEST'),
(21, 'Centre de Lyon Rillieux', 4, '8 chemin des Iles', 69144, 'RILLIEUX LA PAPE'),
(22, 'Centre de Grenoble Pt de Claix', 4, '38 avenue Victor Hugo', 38800, 'LE PONT DE CLAIX'),
(23, 'Centre de Chambéry', 4, '81 avenue du Grand Arietaz', 73000, 'CHAMBERY'),
(24, 'Centre de Bourg en Bresse', 4, 'route de Seillon', 1000, 'BOURG EN BRESSE'),
(25, 'Centre d\'Annecy Poisy', 4, '675 route de Macully ', 74330, 'POISY'),
(26, 'Centre du Teil', 4, '37 avenue de l\'Europe', 7400, 'LE TEIL'),
(27, 'Centre de Valence', 4, '336 rue de ChabeuiL', 42000, 'ST ETIENNE'),
(28, 'Centre de Romans', 4, 'avenue des Allobroges', 26100, 'ROMANS SUR ISERE'),
(29, 'Centre de Roanne', 4, '13 avenue du Polygone', 42300, 'ROANNE'),
(30, 'Centre de Moulins', 4, '44 avenue Meunier', 3000, 'MOULINS MOULINS'),
(31, 'Centre de Montluçon', 4, 'rue Alexandre Duchet', 3100, 'MONTLUCON'),
(32, 'Centre de Clermont la Sarre', 4, '38 boulevard Gustave Flaubert', 63000, 'CLERMONT FERRAND'),
(33, 'Centre de Clermont Beaumont', 4, '16 rue Vercingetorix', 63110, 'BEAUMONT'),
(34, 'Centre d\'Aurillac', 4, '4 rue Ampère', 15000, 'AURILLAC AURILLAC'),
(35, 'Centre du Puy en Velay', 4, 'ZI de Blavozy', 43700, 'ST GERMAIN LAPRADE'),
(36, 'Centre de Vichy', 4, '1 rue Paul Bert', 3200, 'VICHY'),
(37, 'Centre de Perpignan Rivesaltes', 2, '2 avenue Clément Ader', 66600, 'RIVESALTES'),
(38, 'Centre de Montpellier St Jean', 2, '12 rue Jean Mermoz', 34430, 'ST JEAN DE VEDAS'),
(39, 'Centre de La Grand Combe', 2, '6 rue des Erables', 30318, 'ALES'),
(40, 'Centre de Carcassonne', 2, '1 allée Bernard Palissy', 11860, 'CARCASSONNE'),
(41, 'Centre de Béziers', 2, '34 rue de Costesèque', 34500, 'BEZIERS'),
(42, 'Centre d\'Alès', 2, '160 montée des Lauriers', 30318, 'ALES'),
(43, 'Centre de St Chély d Apcher', 2, 'chemin du Readet', 48200, 'ST CHELY D\'APCHER'),
(44, 'Centre de Nîmes', 2, '168 route de Beaucaire', 30000, 'NIMES'),
(45, 'Centre de Pamiers', 2, 'impasse Mercure', 9100, 'PAMIERS'),
(46, 'Centre de Montauban', 2, '325 avenue de Montech', 82000, 'MONTAUBAN'),
(47, 'Centre de Foix', 2, '6 cours Irénée Cros', 9000, 'FOIX'),
(48, 'Centre de Decazeville', 2, 'rue Alexis Monteil ', 12300, 'DECAZEVILLE'),
(49, 'Centre de Cahors Regourd', 2, '381 quai de Regourd', 46000, 'CAHORS'),
(50, 'Centre d\'Albi', 2, 'rue des Trois Buissons', 81000, 'ALBI'),
(51, 'Centre Toulouse-Balma Tertiaire', 2, '73 rue Saint Jean', 31130, 'BALMA'),
(52, 'Centre de Toulouse Palays', 2, '1 allée Jean Griffon ', 31400, 'TOULOUSE'),
(53, 'Centre de Toulouse Balma', 2, '73 rue Saint Jean', 31130, 'BALMA'),
(54, 'Centre de Tarbes', 2, '92 rue Alsace Lorraine', 65000, 'TARBES'),
(55, 'Centre de Rodez', 2, 'rue Jean Ferrieu', 12000, 'RODEZ'),
(56, 'Centre de Portet sur Garonne', 2, 'chemin de Côte de Gabard', 31270, 'VILLENEUVE TOLOSANE');

-- --------------------------------------------------------

--
-- Table structure for table `region`
--

CREATE TABLE `region` (
  `id` int(11) NOT NULL,
  `region` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `region`
--

INSERT INTO `region` (`id`, `region`) VALUES
(1, 'Provence-Alpes-Côte-d-Azur'),
(2, 'Languedoc-Roussillon-Midi-Pyrénées'),
(3, 'Aquitaine-Limousin-Poitou-Charentes'),
(4, 'Auvergne-Rhône-Alpes'),
(5, 'Bourgogne-Franche-Comté'),
(6, 'Centre'),
(7, 'Pays-de-la-Loire'),
(8, 'Normandie'),
(9, 'Nord-Pas-de-Calais-Picardie'),
(10, 'Alsace-Champagne-Ardenne-Lorraine'),
(11, 'Corse'),
(12, 'Ile-de-France'),
(13, 'Bretagne');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(64) DEFAULT NULL,
  `lastname` varchar(64) DEFAULT NULL,
  `password` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` int(11) DEFAULT NULL,
  `mail` varchar(64) NOT NULL,
  `expire` datetime DEFAULT NULL,
  `establishment` int(11) DEFAULT NULL,
  `plainpassword` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `firstname`, `lastname`, `password`, `telephone`, `mail`, `expire`, `establishment`, `plainpassword`) VALUES
(5, 'Root', NULL, NULL, '$2y$13$PqAqtRGkXBK9zFaasroQg.fHdP6DgooFqcTxTw77ONMk4qsEzyZbS', NULL, 'root@email.com', NULL, NULL, 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carpooling`
--
ALTER TABLE `carpooling`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_etablishmentID` (`establishment`),
  ADD KEY `FK_userID` (`user`);

--
-- Indexes for table `establishment`
--
ALTER TABLE `establishment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `region` (`region`);

--
-- Indexes for table `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_8D93D649DBEFB1EE` (`establishment`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carpooling`
--
ALTER TABLE `carpooling`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `establishment`
--
ALTER TABLE `establishment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;
--
-- AUTO_INCREMENT for table `region`
--
ALTER TABLE `region`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `carpooling`
--
ALTER TABLE `carpooling`
  ADD CONSTRAINT `FK_etablishmentID` FOREIGN KEY (`establishment`) REFERENCES `establishment` (`id`),
  ADD CONSTRAINT `FK_userID` FOREIGN KEY (`user`) REFERENCES `user` (`id`);

--
-- Constraints for table `establishment`
--
ALTER TABLE `establishment`
  ADD CONSTRAINT `FK_regionID` FOREIGN KEY (`region`) REFERENCES `region` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_8D93D649DBEFB1EE` FOREIGN KEY (`establishment`) REFERENCES `establishment` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
