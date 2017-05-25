-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 25, 2017 at 11:09 PM
-- Server version: 5.5.54
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
  `IdAdministrator` bigint(20) NOT NULL,
  `KorisnickoIme` varchar(64) NOT NULL,
  `Email` varchar(64) NOT NULL,
  `Sifra` varchar(20) NOT NULL,
  `Ime` varchar(64) NOT NULL,
  `Prezime` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ekipa`
--

CREATE TABLE `ekipa` (
  `IdEkipa` bigint(20) NOT NULL,
  `Naziv` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `igrac`
--

CREATE TABLE `igrac` (
  `IdIgrac` bigint(20) NOT NULL,
  `Ime` varchar(64) NOT NULL,
  `Prezime` varchar(64) NOT NULL,
  `DatumRodjenja` datetime NOT NULL,
  `Pozicija` char(2) NOT NULL,
  `Nacionalnost` varchar(64) NOT NULL,
  `Cena` int(11) NOT NULL,
  `IdEkipa` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kolo`
--

CREATE TABLE `kolo` (
  `IdKolo` bigint(20) NOT NULL,
  `Datum` datetime NOT NULL,
  `Zavrseno` char(1) NOT NULL DEFAULT 'F'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `korisnik`
--

CREATE TABLE `korisnik` (
  `IdKorisnik` bigint(20) NOT NULL,
  `KorisnickoIme` varchar(64) NOT NULL,
  `Ime` varchar(64) NOT NULL,
  `Prezime` varchar(64) NOT NULL,
  `Email` varchar(64) NOT NULL,
  `Sifra` varchar(20) NOT NULL,
  `Aktivan` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `prelaznirok`
--

CREATE TABLE `prelaznirok` (
  `IdPrelazniRok` bigint(20) NOT NULL,
  `Trenutno` char(1) DEFAULT NULL,
  `Od` varchar(64) DEFAULT NULL,
  `Do` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tim`
--

CREATE TABLE `tim` (
  `IdKorisnik` bigint(20) NOT NULL,
  `Naziv` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tim_igrac`
--

CREATE TABLE `tim_igrac` (
  `IdIgrac` bigint(20) NOT NULL,
  `IdKorisnik` bigint(20) NOT NULL,
  `JeRezerva` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ucinakigrac`
--

CREATE TABLE `ucinakigrac` (
  `IdIgrac` bigint(20) NOT NULL,
  `IdKolo` bigint(20) NOT NULL,
  `Poeni` int(11) NOT NULL,
  `Asistencije` int(11) DEFAULT NULL,
  `Skokovi` int(11) DEFAULT NULL,
  `Faulovi` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ucinakkorisnik`
--

CREATE TABLE `ucinakkorisnik` (
  `IdKorisnik` bigint(20) NOT NULL,
  `IdKolo` bigint(20) NOT NULL,
  `UcinakPoeni` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`IdAdministrator`);

--
-- Indexes for table `ekipa`
--
ALTER TABLE `ekipa`
  ADD PRIMARY KEY (`IdEkipa`);

--
-- Indexes for table `igrac`
--
ALTER TABLE `igrac`
  ADD PRIMARY KEY (`IdIgrac`),
  ADD KEY `R_2` (`IdEkipa`);

--
-- Indexes for table `kolo`
--
ALTER TABLE `kolo`
  ADD PRIMARY KEY (`IdKolo`);

--
-- Indexes for table `korisnik`
--
ALTER TABLE `korisnik`
  ADD PRIMARY KEY (`IdKorisnik`),
  ADD UNIQUE KEY `KorisnickoIme` (`KorisnickoIme`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `prelaznirok`
--
ALTER TABLE `prelaznirok`
  ADD PRIMARY KEY (`IdPrelazniRok`);

--
-- Indexes for table `tim`
--
ALTER TABLE `tim`
  ADD PRIMARY KEY (`IdKorisnik`);

--
-- Indexes for table `ucinakigrac`
--
ALTER TABLE `ucinakigrac`
  ADD PRIMARY KEY (`IdIgrac`),
  ADD KEY `R_7` (`IdKolo`);

--
-- Indexes for table `ucinakkorisnik`
--
ALTER TABLE `ucinakkorisnik`
  ADD PRIMARY KEY (`IdKorisnik`,`IdKolo`),
  ADD KEY `R_9` (`IdKolo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administrator`
--
ALTER TABLE `administrator`
  MODIFY `IdAdministrator` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `igrac`
--
ALTER TABLE `igrac`
  MODIFY `IdIgrac` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `kolo`
--
ALTER TABLE `kolo`
  MODIFY `IdKolo` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `korisnik`
--
ALTER TABLE `korisnik`
  MODIFY `IdKorisnik` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `prelaznirok`
--
ALTER TABLE `prelaznirok`
  MODIFY `IdPrelazniRok` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tim`
--
ALTER TABLE `tim`
  MODIFY `IdKorisnik` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `igrac`
--
ALTER TABLE `igrac`
  ADD CONSTRAINT `R_2` FOREIGN KEY (`IdEkipa`) REFERENCES `ekipa` (`IdEkipa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tim`
--
ALTER TABLE `tim`
  ADD CONSTRAINT `R_1` FOREIGN KEY (`IdKorisnik`) REFERENCES `korisnik` (`IdKorisnik`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `ucinakigrac`
--
ALTER TABLE `ucinakigrac`
  ADD CONSTRAINT `R_5` FOREIGN KEY (`IdIgrac`) REFERENCES `igrac` (`IdIgrac`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `R_7` FOREIGN KEY (`IdKolo`) REFERENCES `kolo` (`IdKolo`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `ucinakkorisnik`
--
ALTER TABLE `ucinakkorisnik`
  ADD CONSTRAINT `R_9` FOREIGN KEY (`IdKolo`) REFERENCES `kolo` (`IdKolo`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `R_8` FOREIGN KEY (`IdKorisnik`) REFERENCES `tim` (`IdKorisnik`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
