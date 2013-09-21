-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generato il: Giu 18, 2013 alle 19:51
-- Versione del server: 5.5.27-log
-- Versione PHP: 5.4.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `book`
--
CREATE DATABASE `book` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `book`;

-- --------------------------------------------------------

--
-- Struttura della tabella `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `ID` int(2) NOT NULL AUTO_INCREMENT,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `nome` text NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dump dei dati per la tabella `admin`
--

INSERT INTO `admin` (`ID`, `username`, `password`, `nome`) VALUES
(2, 'admin', '1234', 'Amministratore');

-- --------------------------------------------------------

--
-- Struttura della tabella `autori`
--

CREATE TABLE IF NOT EXISTS `autori` (
  `autoreID` int(11) NOT NULL AUTO_INCREMENT,
  `autoreNome` text NOT NULL,
  PRIMARY KEY (`autoreID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dump dei dati per la tabella `autori`
--

INSERT INTO `autori` (`autoreID`, `autoreNome`) VALUES
(11, 'Dan Brown'),
(12, 'Ken Follett');

-- --------------------------------------------------------

--
-- Struttura della tabella `editori`
--

CREATE TABLE IF NOT EXISTS `editori` (
  `editoreID` int(11) NOT NULL AUTO_INCREMENT,
  `editoreNome` text NOT NULL,
  PRIMARY KEY (`editoreID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dump dei dati per la tabella `editori`
--

INSERT INTO `editori` (`editoreID`, `editoreNome`) VALUES
(7, 'Mondadori');

-- --------------------------------------------------------

--
-- Struttura della tabella `libri`
--

CREATE TABLE IF NOT EXISTS `libri` (
  `libroID` int(11) NOT NULL AUTO_INCREMENT,
  `isbn` text NOT NULL,
  `titolo` text NOT NULL,
  `prezzo` float NOT NULL,
  `autore` int(11) NOT NULL,
  `editore` int(11) NOT NULL,
  `fotoUrl` text,
  `anteprimaUrl` text,
  PRIMARY KEY (`libroID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Dump dei dati per la tabella `libri`
--

INSERT INTO `libri` (`libroID`, `isbn`, `titolo`, `prezzo`, `autore`, `editore`, `fotoUrl`, `anteprimaUrl`) VALUES
(23, '8866210013', 'Il simbolo perduto', 14, 11, 7, 'http://ecx.images-amazon.com/images/I/41HD6IdxdXL._SL500_AA300_.jpg', 'http://books.google.it/books?id=_yltNA0olusC&printsec=frontcover&hl=it#v=onepage&q&f=false'),
(24, '8804555572', 'Angeli e demoni', 14, 11, 7, 'http://ecx.images-amazon.com/images/I/51yl0XHxqjL._SL500_AA300_.jpg', 'http://books.google.it/books?id=hv7hjasiYhoC&printsec=frontcover&hl=it#v=onepage&q&f=false'),
(25, '8804442476', 'Il terzo gemello', 10.5, 12, 7, 'http://ecx.images-amazon.com/images/I/51UFmF0jKaL._SL500_AA300_.jpg', 'http://books.google.it/books?id=C2Fd9GM3WUQC&printsec=frontcover&hl=it#v=onepage&q&f=false');

-- --------------------------------------------------------

--
-- Struttura della tabella `utenti`
--

CREATE TABLE IF NOT EXISTS `utenti` (
  `nome` text NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `utenti`
--

INSERT INTO `utenti` (`nome`, `username`, `password`) VALUES
('Paolo', 'paolo279', '1234'),
('Fabrizio', 'fabri', '1234'),
('Davide', 'dado', '1234'),
('Marco', 'mark', '1234');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
