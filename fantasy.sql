-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 25, 2017 at 02:23 PM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fantasy`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrator`
--

CREATE TABLE `administrator` (
  `idAdm` char(18) NOT NULL,
  `imePrezime` char(18) DEFAULT NULL,
  `email` char(18) DEFAULT NULL,
  `sifra` char(18) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `igrac`
--

CREATE TABLE `igrac` (
  `idIgr` char(18) NOT NULL,
  `ime` char(18) DEFAULT NULL,
  `prezime` char(18) DEFAULT NULL,
  `datumRodjenja` char(18) DEFAULT NULL,
  `pozicija` char(18) DEFAULT NULL,
  `nacionalnost` char(18) DEFAULT NULL,
  `cena` char(18) DEFAULT NULL,
  `idTim` char(18) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kolo`
--

CREATE TABLE `kolo` (
  `idKol` char(18) NOT NULL,
  `datum` char(18) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `korisnik`
--

CREATE TABLE `korisnik` (
  `idKor` char(18) NOT NULL,
  `korisnickoIme` char(18) DEFAULT NULL,
  `imePrezime` char(18) DEFAULT NULL,
  `nacionalnost` char(18) DEFAULT NULL,
  `email` char(18) DEFAULT NULL,
  `password` char(18) DEFAULT NULL,
  `aktivan` char(18) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `prelaznirok`
--

CREATE TABLE `prelaznirok` (
  `idPrk` char(18) NOT NULL,
  `aktivan` char(18) DEFAULT NULL,
  `od` char(18) DEFAULT NULL,
  `do` char(18) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `timkorisnik`
--

CREATE TABLE `timkorisnik` (
  `idKor` char(18) NOT NULL,
  `naziv` char(18) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `timkorisnik_igrac`
--

CREATE TABLE `timkorisnik_igrac` (
  `idKor` char(18) NOT NULL,
  `idIgr` char(18) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `timpravi`
--

CREATE TABLE `timpravi` (
  `idTim` char(18) NOT NULL,
  `naziv` char(18) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ucinakigraca`
--

CREATE TABLE `ucinakigraca` (
  `idKol` char(18) NOT NULL,
  `idIgr` char(18) NOT NULL,
  `igrao` char(18) DEFAULT NULL,
  `poeni` char(18) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ucinakkorisnik`
--

CREATE TABLE `ucinakkorisnik` (
  `idKor` char(18) NOT NULL,
  `idKol` char(18) NOT NULL,
  `ostvarenoPoena` char(18) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`idAdm`);

--
-- Indexes for table `igrac`
--
ALTER TABLE `igrac`
  ADD PRIMARY KEY (`idIgr`),
  ADD KEY `R_3` (`idTim`);

--
-- Indexes for table `kolo`
--
ALTER TABLE `kolo`
  ADD PRIMARY KEY (`idKol`);

--
-- Indexes for table `korisnik`
--
ALTER TABLE `korisnik`
  ADD PRIMARY KEY (`idKor`);

--
-- Indexes for table `prelaznirok`
--
ALTER TABLE `prelaznirok`
  ADD PRIMARY KEY (`idPrk`);

--
-- Indexes for table `timkorisnik`
--
ALTER TABLE `timkorisnik`
  ADD PRIMARY KEY (`idKor`);

--
-- Indexes for table `timkorisnik_igrac`
--
ALTER TABLE `timkorisnik_igrac`
  ADD PRIMARY KEY (`idKor`,`idIgr`),
  ADD KEY `R_5` (`idIgr`);

--
-- Indexes for table `timpravi`
--
ALTER TABLE `timpravi`
  ADD PRIMARY KEY (`idTim`);

--
-- Indexes for table `ucinakigraca`
--
ALTER TABLE `ucinakigraca`
  ADD PRIMARY KEY (`idKol`,`idIgr`),
  ADD KEY `R_7` (`idIgr`);

--
-- Indexes for table `ucinakkorisnik`
--
ALTER TABLE `ucinakkorisnik`
  ADD PRIMARY KEY (`idKor`,`idKol`),
  ADD KEY `R_9` (`idKol`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
