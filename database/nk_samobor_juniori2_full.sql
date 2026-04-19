-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 20, 2026 at 12:31 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nk_samobor_juniori2`
--

-- --------------------------------------------------------

--
-- Table structure for table `igraci`
--

CREATE TABLE `igraci` (
  `id_igraca` int(11) NOT NULL,
  `ime` varchar(50) NOT NULL,
  `prezime` varchar(50) NOT NULL,
  `godiste` year(4) NOT NULL,
  `broj_dresa` int(11) DEFAULT NULL,
  `primarna_pozicija` varchar(50) NOT NULL,
  `alternativna_pozicija` varchar(50) DEFAULT NULL,
  `status_u_klubu` varchar(30) NOT NULL DEFAULT 'aktivan',
  `golovi` int(11) NOT NULL DEFAULT 0,
  `zuti_kartoni` int(11) NOT NULL DEFAULT 0,
  `crveni_kartoni` int(11) NOT NULL DEFAULT 0,
  `broj_nastupa` int(11) NOT NULL DEFAULT 0,
  `broj_minuta` int(11) NOT NULL DEFAULT 0,
  `zapoceo_utakmicu` int(11) NOT NULL DEFAULT 0,
  `usao_s_klupe` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `igraci`
--

INSERT INTO `igraci` (`id_igraca`, `ime`, `prezime`, `godiste`, `broj_dresa`, `primarna_pozicija`, `alternativna_pozicija`, `status_u_klubu`, `golovi`, `zuti_kartoni`, `crveni_kartoni`, `broj_nastupa`, `broj_minuta`, `zapoceo_utakmicu`, `usao_s_klupe`) VALUES
(1, 'Ivano', 'Čarapar', '2010', 1, 'vratar', NULL, 'aktivan', 0, 0, 0, 1, 90, 1, 0),
(2, 'Karlo', 'Sauer', '2008', 15, 'vratar', NULL, 'aktivan', 0, 0, 0, 2, 161, 2, 0),
(3, 'Alek', 'Vodopija', '2008', 1, 'vratar', NULL, 'aktivan', 0, 0, 0, 20, 1800, 20, 0),
(4, 'Borna', 'Belak', '2010', 20, 'bek', 'stoper', 'aktivan', 0, 0, 0, 2, 116, 1, 1),
(5, 'Ivan', 'Biber', '2008', 28, 'špica', 'krilo', 'otišao', 0, 1, 0, 4, 312, 4, 0),
(6, 'Borna', 'Bogut', '2008', 11, 'krilo', NULL, 'otišao', 0, 0, 0, 4, 141, 0, 4),
(7, 'Josip', 'Bošnjak', '2008', 6, 'zadnji vezni', 'stoper', 'aktivan', 0, 4, 0, 10, 354, 1, 9),
(8, 'Fran', 'Bradač', '2008', 30, 'krilo', 'bek', 'otišao', 2, 0, 0, 6, 365, 3, 3),
(9, 'Roko', 'Brković', '2008', 14, 'stoper', 'bek', 'aktivan', 1, 3, 0, 17, 1399, 16, 1),
(10, 'Paulino', 'Joao Kandimba Bulika', '2007', 14, 'krilo', 'špica', 'aktivan', 3, 0, 0, 9, 777, 9, 0),
(11, 'Ano ', 'Dah Rađenović', '2008', 22, 'krilo', 'prednji vezni', 'otišao', 1, 0, 0, 2, 180, 2, 0),
(12, 'Kristijan', 'Dobranić', '2008', 96, 'bek', 'krilo, zadnji vezni', 'aktivan', 0, 2, 0, 22, 1961, 22, 0),
(13, 'Noa', 'Dodig', '2007', 15, 'zadnji vezni', 'stoper', 'aktivan', 0, 2, 0, 2, 180, 2, 0),
(14, 'Jakov', 'Ferina', '2009', 49, 'krilo', 'vezni', 'aktivan', 0, 0, 0, 8, 211, 1, 7),
(15, 'Ivan', 'Fulir', '2008', 4, 'stoper', NULL, 'aktivan', 0, 3, 0, 14, 1084, 13, 1),
(16, 'Bruno', 'Galeković', '2007', 4, 'stoper', NULL, 'aktivan', 0, 0, 0, 1, 90, 1, 0),
(17, 'Filip', 'Grozdanić', '2008', 32, 'špica', NULL, 'aktivan', 4, 1, 0, 14, 978, 13, 1),
(18, 'Roko', 'Ilijašić', '2008', 11, 'krilo', 'špica', 'aktivan', 1, 0, 0, 16, 989, 11, 5),
(19, 'David', 'Jagodić', '2009', 27, 'zadnji vezni', 'stoper', 'aktivan', 0, 0, 0, 2, 135, 2, 0),
(20, 'Luka', 'Kamenić', '2009', 35, 'stoper', NULL, 'aktivan', 0, 1, 0, 4, 308, 4, 0),
(21, 'Matej', 'Kruhan', '2008', 3, 'bek', 'stoper', 'aktivan', 1, 2, 0, 19, 1696, 19, 0),
(22, 'Luka', 'Krvarić', '2007', 17, 'zadnji vezni', 'stoper', 'aktivan', 0, 1, 0, 10, 900, 10, 0),
(23, 'Matija', 'Marković', '2008', 10, 'krilo', 'vezni', 'aktivan', 6, 6, 0, 20, 1742, 20, 0),
(24, 'Jakov', 'Mauzer', '2007', 37, 'bek', 'stoper', 'aktivan', 0, 0, 0, 3, 270, 3, 0),
(25, 'Filip', 'Miščević', '2008', 24, 'krilo', 'bek, vezni', 'aktivan', 2, 2, 0, 21, 1733, 21, 0),
(26, 'Adrian Adem', 'Pašić', '2007', 5, 'bek', 'stoper', 'aktivan', 0, 0, 0, 1, 90, 1, 0),
(27, 'Roko', 'Pernar', '2009', 13, 'bek', NULL, 'aktivan', 0, 1, 0, 14, 700, 8, 6),
(28, 'Ivan', 'Primorac', '2007', 18, 'špica', 'krilo', 'aktivan', 1, 1, 0, 2, 180, 2, 0),
(29, 'Arnaldo', 'Francisco Quileri', '2007', 41, 'vezni', NULL, 'aktivan', 0, 0, 0, 1, 90, 1, 0),
(30, 'Robert', 'Raić', '2009', 15, 'vezni', NULL, 'aktivan', 0, 0, 0, 1, 28, 0, 1),
(32, 'Luka Michael', 'Rujnić', '2009', 7, 'krilo', NULL, 'aktivan', 0, 0, 0, 1, 90, 1, 0),
(33, 'Dario', 'Smolčić', '2010', 26, 'bek', NULL, 'aktivan', 0, 0, 0, 1, 11, 0, 1),
(34, 'Vito', 'Solar', '2008', 99, 'krilo', NULL, 'aktivan', 0, 0, 0, 3, 51, 0, 3),
(35, 'Borna', 'Stupar', '2008', 8, 'vezni', NULL, 'aktivan', 1, 3, 0, 7, 545, 6, 1),
(36, 'Antonio', 'Škarica', '2009', 17, 'bek', 'stoper', 'aktivan', 0, 2, 0, 6, 329, 3, 3),
(37, 'Sebastian', 'Šokić', '2007', 29, 'špica', 'krilo', 'otišao', 0, 0, 0, 3, 270, 3, 0),
(38, 'Dominik', 'Šoštar', '2009', 33, 'bek', NULL, 'aktivan', 0, 0, 0, 1, 2, 0, 1),
(39, 'Borna', 'Štefinec', '2009', 23, 'krilo', NULL, 'aktivan', 0, 0, 0, 2, 26, 0, 2),
(40, 'Domagoj', 'Štrkalj', '2008', 16, 'bek', NULL, 'otišao', 0, 0, 0, 1, 19, 0, 1),
(41, 'Ian', 'Udovič', '2009', 19, 'stoper', NULL, 'aktivan', 0, 0, 0, 2, 104, 1, 1),
(42, 'Niko', 'Vlajčević', '2007', 31, 'stoper', NULL, 'otišao', 0, 2, 0, 2, 180, 2, 0),
(43, 'Ivan', 'Vojvoda', '2007', 11, 'špica', 'krilo', 'aktivan', 0, 0, 0, 3, 270, 3, 0),
(44, 'Patrik', 'Vukelić', '2007', 9, 'krilo', 'špica, vezni', 'aktivan', 0, 0, 0, 6, 540, 6, 0),
(45, 'Bruno', 'Vurušić', '2009', 5, 'vezni', NULL, 'aktivan', 0, 0, 0, 4, 264, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `osoblje`
--

CREATE TABLE `osoblje` (
  `id_osoblja` int(11) NOT NULL,
  `ime` varchar(50) NOT NULL,
  `prezime` varchar(50) NOT NULL,
  `uloga` varchar(100) NOT NULL,
  `status_u_klubu` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `osoblje`
--

INSERT INTO `osoblje` (`id_osoblja`, `ime`, `prezime`, `uloga`, `status_u_klubu`) VALUES
(1, 'Ivan Anton', 'Vasilj', 'trener', 'aktivan druga ekipa'),
(2, 'Perica', 'Ivetić', 'trener', 'otišao'),
(3, 'Toni', 'Lučić', 'trener', 'aktivan'),
(4, 'Patrick', 'Kenda', 'kondicijski trener', 'aktivan'),
(5, 'Stanislav', 'Kljutić', 'trener prve ekipe', 'otišao'),
(6, 'Tomislav', 'Barišić', 'trener prve ekipe', 'otišao'),
(7, 'Marko', 'Lucić', 'trener prve ekipe', 'otišao'),
(8, 'Mario', 'Kožul', 'trener prve ekipe', 'aktivan'),
(9, 'Sebastijan', 'Živković', 'fizioterapeut', 'aktivan');

-- --------------------------------------------------------

--
-- Table structure for table `prisustvo`
--

CREATE TABLE `prisustvo` (
  `id_prisustva` int(11) NOT NULL,
  `id_treninga` int(11) NOT NULL,
  `id_igraca` int(11) NOT NULL,
  `status` enum('prisutan','izostao','opravdano','ozlijeden') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `prisustvo`
--

INSERT INTO `prisustvo` (`id_prisustva`, `id_treninga`, `id_igraca`, `status`) VALUES
(1, 1, 3, 'prisutan'),
(2, 1, 9, 'prisutan'),
(3, 1, 12, 'prisutan'),
(4, 1, 15, 'prisutan'),
(5, 1, 17, 'prisutan'),
(6, 1, 18, 'prisutan'),
(7, 1, 21, 'prisutan'),
(8, 1, 23, 'prisutan'),
(9, 1, 25, 'prisutan'),
(10, 1, 34, 'prisutan'),
(11, 1, 7, 'ozlijeden'),
(12, 2, 9, 'prisutan'),
(13, 2, 12, 'prisutan'),
(14, 2, 15, 'prisutan'),
(15, 2, 18, 'prisutan'),
(16, 2, 21, 'prisutan'),
(17, 2, 23, 'prisutan'),
(18, 2, 25, 'prisutan'),
(19, 2, 3, 'izostao'),
(20, 2, 17, 'izostao'),
(21, 2, 34, 'izostao'),
(22, 2, 7, 'ozlijeden'),
(23, 3, 3, 'prisutan'),
(24, 3, 9, 'prisutan'),
(25, 3, 12, 'prisutan'),
(26, 3, 15, 'prisutan'),
(27, 3, 17, 'prisutan'),
(28, 3, 21, 'prisutan'),
(29, 3, 23, 'prisutan'),
(30, 3, 34, 'prisutan'),
(31, 3, 18, 'opravdano'),
(32, 3, 25, 'opravdano'),
(33, 3, 7, 'ozlijeden'),
(34, 4, 12, 'prisutan'),
(35, 4, 15, 'prisutan'),
(36, 4, 17, 'prisutan'),
(37, 4, 18, 'prisutan'),
(38, 4, 21, 'prisutan'),
(39, 4, 25, 'prisutan'),
(40, 4, 3, 'izostao'),
(41, 4, 34, 'izostao'),
(42, 4, 9, 'opravdano'),
(43, 4, 23, 'opravdano'),
(44, 4, 7, 'ozlijeden'),
(45, 5, 3, 'prisutan'),
(46, 5, 7, 'prisutan'),
(47, 5, 9, 'prisutan'),
(48, 5, 12, 'prisutan'),
(49, 5, 15, 'prisutan'),
(50, 5, 17, 'prisutan'),
(51, 5, 18, 'prisutan'),
(52, 5, 21, 'prisutan'),
(53, 5, 23, 'prisutan'),
(54, 5, 25, 'prisutan'),
(55, 5, 34, 'prisutan'),
(56, 6, 7, 'prisutan'),
(57, 6, 9, 'prisutan'),
(58, 6, 15, 'prisutan'),
(59, 6, 18, 'prisutan'),
(60, 6, 21, 'prisutan'),
(61, 6, 23, 'prisutan'),
(62, 6, 25, 'prisutan'),
(63, 6, 17, 'izostao'),
(64, 6, 34, 'izostao'),
(65, 6, 3, 'opravdano'),
(66, 6, 12, 'opravdano'),
(67, 7, 3, 'prisutan'),
(68, 7, 9, 'prisutan'),
(69, 7, 12, 'prisutan'),
(70, 7, 15, 'prisutan'),
(71, 7, 17, 'prisutan'),
(72, 7, 21, 'prisutan'),
(73, 7, 23, 'prisutan'),
(74, 7, 7, 'izostao'),
(75, 7, 34, 'izostao'),
(76, 7, 18, 'opravdano'),
(77, 7, 25, 'opravdano'),
(78, 8, 9, 'prisutan'),
(79, 8, 15, 'prisutan'),
(80, 8, 17, 'prisutan'),
(81, 8, 18, 'prisutan'),
(82, 8, 21, 'prisutan'),
(83, 8, 23, 'prisutan'),
(84, 8, 34, 'prisutan'),
(85, 8, 7, 'izostao'),
(86, 8, 3, 'opravdano'),
(87, 8, 25, 'opravdano'),
(88, 8, 12, 'ozlijeden'),
(89, 9, 3, 'prisutan'),
(90, 9, 7, 'prisutan'),
(91, 9, 9, 'prisutan'),
(92, 9, 12, 'prisutan'),
(93, 9, 17, 'prisutan'),
(94, 9, 21, 'prisutan'),
(95, 9, 23, 'prisutan'),
(96, 9, 25, 'prisutan'),
(97, 9, 34, 'prisutan'),
(98, 9, 18, 'opravdano'),
(99, 9, 15, 'ozlijeden'),
(100, 10, 3, 'prisutan'),
(101, 10, 9, 'prisutan'),
(102, 10, 12, 'prisutan'),
(103, 10, 15, 'prisutan'),
(104, 10, 21, 'prisutan'),
(105, 10, 23, 'prisutan'),
(106, 10, 25, 'prisutan'),
(107, 10, 7, 'izostao'),
(108, 10, 17, 'izostao'),
(109, 10, 34, 'izostao'),
(110, 10, 18, 'opravdano'),
(111, 11, 7, 'prisutan'),
(112, 11, 9, 'prisutan'),
(113, 11, 12, 'prisutan'),
(114, 11, 15, 'prisutan'),
(115, 11, 17, 'prisutan'),
(116, 11, 18, 'prisutan'),
(117, 11, 21, 'prisutan'),
(118, 11, 23, 'prisutan'),
(119, 11, 25, 'prisutan'),
(120, 11, 34, 'prisutan'),
(121, 11, 3, 'opravdano'),
(122, 12, 3, 'prisutan'),
(123, 12, 9, 'prisutan'),
(124, 12, 15, 'prisutan'),
(125, 12, 23, 'prisutan'),
(126, 12, 25, 'prisutan'),
(127, 12, 7, 'izostao'),
(128, 12, 17, 'izostao'),
(129, 12, 12, 'opravdano'),
(130, 12, 34, 'opravdano'),
(131, 12, 18, 'ozlijeden'),
(132, 12, 21, 'ozlijeden'),
(133, 13, 3, 'prisutan'),
(134, 13, 7, 'prisutan'),
(135, 13, 9, 'prisutan'),
(136, 13, 12, 'prisutan'),
(137, 13, 15, 'prisutan'),
(138, 13, 17, 'prisutan'),
(139, 13, 18, 'prisutan'),
(140, 13, 21, 'prisutan'),
(141, 13, 23, 'prisutan'),
(142, 13, 25, 'prisutan'),
(143, 13, 34, 'prisutan'),
(144, 14, 7, 'prisutan'),
(145, 14, 9, 'prisutan'),
(146, 14, 12, 'prisutan'),
(147, 14, 15, 'prisutan'),
(148, 14, 18, 'prisutan'),
(149, 14, 21, 'prisutan'),
(150, 14, 23, 'prisutan'),
(151, 14, 25, 'prisutan'),
(152, 14, 17, 'izostao'),
(153, 14, 34, 'izostao'),
(154, 14, 3, 'opravdano'),
(155, 15, 3, 'prisutan'),
(156, 15, 7, 'prisutan'),
(157, 15, 15, 'prisutan'),
(158, 15, 17, 'prisutan'),
(159, 15, 18, 'prisutan'),
(160, 15, 21, 'prisutan'),
(161, 15, 23, 'prisutan'),
(162, 15, 25, 'prisutan'),
(163, 15, 12, 'izostao'),
(164, 15, 34, 'izostao'),
(165, 15, 9, 'opravdano'),
(166, 16, 9, 'prisutan'),
(167, 16, 12, 'prisutan'),
(168, 16, 15, 'prisutan'),
(169, 16, 17, 'prisutan'),
(170, 16, 18, 'prisutan'),
(171, 16, 21, 'prisutan'),
(172, 16, 23, 'prisutan'),
(173, 16, 25, 'prisutan'),
(174, 16, 3, 'izostao'),
(175, 16, 7, 'izostao'),
(176, 16, 34, 'izostao'),
(177, 17, 3, 'prisutan'),
(178, 17, 9, 'prisutan'),
(179, 17, 12, 'prisutan'),
(180, 17, 15, 'prisutan'),
(181, 17, 21, 'prisutan'),
(182, 17, 23, 'prisutan'),
(183, 17, 25, 'prisutan'),
(184, 17, 34, 'prisutan'),
(185, 17, 7, 'izostao'),
(186, 17, 17, 'opravdano'),
(187, 17, 18, 'opravdano');

-- --------------------------------------------------------

--
-- Table structure for table `treninzi`
--

CREATE TABLE `treninzi` (
  `id_treninga` int(11) NOT NULL,
  `datum` date NOT NULL,
  `vrsta_treninga` varchar(50) NOT NULL,
  `trajanje_min` int(11) NOT NULL,
  `lokacija` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `treninzi`
--

INSERT INTO `treninzi` (`id_treninga`, `datum`, `vrsta_treninga`, `trajanje_min`, `lokacija`) VALUES
(1, '2026-03-02', 'oporavak', 60, 'umjetna trava'),
(2, '2026-03-03', 'kondicijski', 90, 'umjetna trava'),
(3, '2026-03-05', 'taktičko-tehnički', 90, 'pomoćni teren'),
(4, '2026-03-06', 'taktički', 70, 'umjetna trava'),
(5, '2026-03-09', 'oporavak', 60, 'umjetna trava'),
(6, '2026-03-10', 'kondicijski', 80, 'pomoćni teren'),
(7, '2026-03-12', 'taktičko-tehnički', 90, 'pomoćni teren'),
(8, '2026-03-13', 'taktički', 70, 'umjetna trava'),
(9, '2026-03-16', 'oporavak', 70, 'umjetna trava'),
(10, '2026-03-17', 'kondicijski', 90, 'umjetna trava'),
(11, '2026-03-19', 'taktičko-tehnički', 80, 'pomoćni teren'),
(12, '2026-03-20', 'taktički', 80, 'glavni teren'),
(13, '2026-03-23', 'oporavak', 70, 'umjetna trava'),
(14, '2026-03-24', 'kondicijski', 100, 'umjetna trava'),
(15, '2026-03-25', 'kondicijski', 100, 'umjetna trava'),
(16, '2026-03-27', 'taktičko-tehnički', 80, 'umjetna trava'),
(17, '2026-03-28', 'kondicijski', 90, 'glavni teren');

-- --------------------------------------------------------

--
-- Table structure for table `utakmice`
--

CREATE TABLE `utakmice` (
  `id_utakmice` int(11) NOT NULL,
  `datum_vrijeme` datetime NOT NULL,
  `protivnik` varchar(100) NOT NULL,
  `lokacija` varchar(150) NOT NULL,
  `domacin_gost` enum('Domaćin','Gost') NOT NULL,
  `kolo` int(11) NOT NULL,
  `natjecanje` varchar(100) NOT NULL DEFAULT 'PRVA NL CENTAR JUNIORI 25/26',
  `golovi_samobor` int(11) DEFAULT NULL,
  `golovi_protivnik` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `utakmice`
--

INSERT INTO `utakmice` (`id_utakmice`, `datum_vrijeme`, `protivnik`, `lokacija`, `domacin_gost`, `kolo`, `natjecanje`, `golovi_samobor`, `golovi_protivnik`) VALUES
(1, '2025-08-31 17:30:00', 'NK Sesvete', 'SC Samobor, Samobor', 'Domaćin', 1, 'PRVA NL CENTAR JUNIORI 25/26', 1, 3),
(2, '2025-10-15 15:00:00', 'GNK Dinamo', 'Stadion Maksimir, Zagreb', 'Gost', 2, 'PRVA NL CENTAR JUNIORI 25/26', 1, 3),
(3, '2025-09-14 11:00:00', 'NK Vrapče', 'SC Samobor, Samobor', 'Domaćin', 3, 'PRVA NL CENTAR JUNIORI 25/26', 2, 3),
(4, '2025-09-21 17:00:00', 'HNK Gorica s.d.d.', 'SC Samobor, Samobor', 'Domaćin', 4, 'PRVA NL CENTAR JUNIORI 25/26', 0, 4),
(5, '2025-09-28 11:00:00', 'NK Lokomotiva (Z)', 'Kajzerica, Zagreb', 'Gost', 5, 'PRVA NL CENTAR JUNIORI 25/26', 0, 7),
(6, '2025-11-05 19:00:00', 'NK Špansko', 'Špansko, Zagreb', 'Gost', 6, 'PRVA NL CENTAR JUNIORI 25/26', 0, 4),
(7, '2025-10-12 10:00:00', 'NK Rudeš', 'ŠC Rudeš, Zagreb', 'Gost', 7, 'PRVA NL CENTAR JUNIORI 25/26', 2, 7),
(8, '2025-10-19 10:00:00', 'NK Maksimir', 'SC Samobor, Samobor', 'Domaćin', 8, 'PRVA NL CENTAR JUNIORI 25/26', 0, 1),
(9, '2025-10-26 19:00:00', 'NK Ponikve', 'Špansko, Zagreb', 'Gost', 9, 'PRVA NL CENTAR JUNIORI 25/26', 1, 7),
(10, '2025-11-01 11:30:00', 'NK Zagreb City', 'SC Samobor, Samobor', 'Domaćin', 10, 'PRVA NL CENTAR JUNIORI 25/26', 0, 1),
(11, '2025-11-08 14:30:00', 'NK Hrvatski Dragovoljac (Z)', 'ŠNC Stjepan Spajić, Siget', 'Gost', 11, 'PRVA NL CENTAR JUNIORI 25/26', 2, 0),
(12, '2025-11-16 11:30:00', 'NK Kurilovec', 'SC Samobor, Samobor', 'Domaćin', 12, 'PRVA NL CENTAR JUNIORI 25/26', 0, 1),
(13, '2025-11-22 15:30:00', 'NK Hašk', 'Pešćenica, Zagreb', 'Gost', 13, 'PRVA NL CENTAR JUNIORI 25/26', 1, 5),
(14, '2025-11-30 11:00:00', 'NK Trešnjevka', 'SC Samobor, Samobor', 'Domaćin', 14, 'PRVA NL CENTAR JUNIORI 25/26', 0, 1),
(15, '2025-12-07 11:00:00', 'NK Kustošija', 'Prečko, Zagreb', 'Gost', 15, 'PRVA NL CENTAR JUNIORI 25/26', 3, 5),
(16, '2026-03-01 11:00:00', 'NK Sesvete', 'Sesvete, Sesvete', 'Gost', 16, 'PRVA NL CENTAR JUNIORI 25/26', 1, 2),
(17, '2026-03-08 11:00:00', 'GNK Dinamo', 'SC Samobor, Samobor', 'Domaćin', 17, 'PRVA NL CENTAR JUNIORI 25/26', 0, 6),
(18, '2026-03-15 11:00:00', 'NK Vrapče', 'Vrapče, Zagreb', 'Gost', 18, 'PRVA NL CENTAR JUNIORI 25/26', 2, 4),
(19, '2026-03-21 19:00:00', 'HNK Gorica s.d.d.', 'Gradski stadion, Velika Gorica', 'Gost', 19, 'PRVA NL CENTAR JUNIORI 25/26', 2, 5),
(20, '2026-04-15 18:00:00', 'NK Lokomotiva (Z)', 'SC Samobor, Samobor', 'Domaćin', 20, 'PRVA NL CENTAR JUNIORI 25/26', 3, 3),
(21, '2026-04-01 17:15:00', 'NK Špansko', 'SC Samobor, Samobor', 'Domaćin', 21, 'PRVA NL CENTAR JUNIORI 25/26', 1, 2),
(22, '2026-04-12 11:00:00', 'NK Rudeš', 'SC Samobor, Samobor', 'Domaćin', 22, 'PRVA NL CENTAR JUNIORI 25/26', 1, 1),
(23, '2026-04-19 17:30:00', 'NK Maksimir', 'Oboj, Zagreb', 'Gost', 23, 'PRVA NL CENTAR JUNIORI 25/26', NULL, NULL),
(24, '2026-04-26 11:00:00', 'NK Ponikve', 'SC Samobor, Samobor', 'Domaćin', 24, 'PRVA NL CENTAR JUNIORI 25/26', NULL, NULL),
(25, '2026-05-03 11:00:00', 'NK Zagreb City', 'Borovje, Zagreb', 'Gost', 25, 'PRVA NL CENTAR JUNIORI 25/26', NULL, NULL),
(26, '2026-05-10 11:00:00', 'NK Hrvatski Dragovoljac (Z)', 'SC Samobor, Samobor', 'Domaćin', 26, 'PRVA NL CENTAR JUNIORI 25/26', NULL, NULL),
(27, '2026-05-17 11:00:00', 'NK Kurilovec', 'SRC UDARNIK, Velika Gorica', 'Gost', 27, 'PRVA NL CENTAR JUNIORI 25/26', NULL, NULL),
(28, '2026-05-24 11:00:00', 'NK Hašk', 'SC Samobor, Samobor', 'Domaćin', 28, 'PRVA NL CENTAR JUNIORI 25/26', NULL, NULL),
(29, '2026-05-31 11:00:00', 'NK Trešnjevka', 'Graba, Zagreb', 'Gost', 29, 'PRVA NL CENTAR JUNIORI 25/26', NULL, NULL),
(30, '2026-06-07 11:00:00', 'NK Kustošija', 'SC Samobor, Samobor', 'Domaćin', 30, 'PRVA NL CENTAR JUNIORI 25/26', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `igraci`
--
ALTER TABLE `igraci`
  ADD PRIMARY KEY (`id_igraca`);

--
-- Indexes for table `osoblje`
--
ALTER TABLE `osoblje`
  ADD PRIMARY KEY (`id_osoblja`);

--
-- Indexes for table `prisustvo`
--
ALTER TABLE `prisustvo`
  ADD PRIMARY KEY (`id_prisustva`),
  ADD KEY `fk_prisustvo_trening` (`id_treninga`),
  ADD KEY `fk_prisustvo_igrac` (`id_igraca`);

--
-- Indexes for table `treninzi`
--
ALTER TABLE `treninzi`
  ADD PRIMARY KEY (`id_treninga`);

--
-- Indexes for table `utakmice`
--
ALTER TABLE `utakmice`
  ADD PRIMARY KEY (`id_utakmice`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `igraci`
--
ALTER TABLE `igraci`
  MODIFY `id_igraca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `osoblje`
--
ALTER TABLE `osoblje`
  MODIFY `id_osoblja` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `prisustvo`
--
ALTER TABLE `prisustvo`
  MODIFY `id_prisustva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=188;

--
-- AUTO_INCREMENT for table `treninzi`
--
ALTER TABLE `treninzi`
  MODIFY `id_treninga` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `utakmice`
--
ALTER TABLE `utakmice`
  MODIFY `id_utakmice` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `prisustvo`
--
ALTER TABLE `prisustvo`
  ADD CONSTRAINT `fk_prisustvo_igrac` FOREIGN KEY (`id_igraca`) REFERENCES `igraci` (`id_igraca`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_prisustvo_trening` FOREIGN KEY (`id_treninga`) REFERENCES `treninzi` (`id_treninga`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
