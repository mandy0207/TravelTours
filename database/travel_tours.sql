-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 31, 2021 at 05:25 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `travel tours`
--

-- --------------------------------------------------------

--
-- Table structure for table `flights`
--

DROP TABLE IF EXISTS `flights`;
CREATE TABLE IF NOT EXISTS `flights` (
  `FlightNumber` varchar(255) NOT NULL,
  `Source` varchar(255) NOT NULL,
  `Destination` varchar(255) NOT NULL,
  `DepartureDate` varchar(255) NOT NULL,
  `Price` int(255) NOT NULL,
  PRIMARY KEY (`FlightNumber`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `flights`
--

INSERT INTO `flights` (`FlightNumber`, `Source`, `Destination`, `DepartureDate`, `Price`) VALUES
('CAN2324', 'India', 'Canada', '2021-04-10', 4500),
('AUS2324', 'India', 'Australia', '2021-04-12', 45000),
('USA2324', 'India', 'USA', '2021-04-17', 67000),
('USA2325', 'Montreal', 'NewYork', '2021-04-16', 61000),
('AI2324', 'Delhi', 'Montreal', '2021-04-15', 87000),
('SWIS2324', 'New Delhi', 'Toronto', '2021-04-12', 97000),
('LUF2324', 'Mumbai', 'Vancouver', '2021-04-19', 62000),
('SWIS2394', 'New Delhi', 'Toronto', '2021-04-12', 97000),
('SWIS230', 'New Delhi', 'Toronto', '2021-04-12', 97000),
('LUF2884', 'Mumbai', 'Vancouver', '2021-04-19', 62000),
('AI2325', 'Kolkata', 'Zurich', '2021-04-15', 43000),
('Spicejet2324', 'Mumbai', 'Delhi', '2021-04-24', 7000),
('Air Canada2324', 'Montreal', 'Winipeg', '2021-04-07', 12000),
('Swoop2324', 'Toronto', 'Montreal', '2021-04-03', 4000),
('SW7172', 'Bern', 'London', '2021-04-11', 12000),
('LUF6161', 'Dubai', 'Mumbai', '2021-04-18', 13000),
('MAN2324', 'Karachi', 'Istanbul', '2021-05-02', 32000);

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

DROP TABLE IF EXISTS `packages`;
CREATE TABLE IF NOT EXISTS `packages` (
  `Source` varchar(255) NOT NULL,
  `Destination` varchar(255) NOT NULL,
  `Date` date NOT NULL,
  `Travellers` int(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`Source`, `Destination`, `Date`, `Travellers`) VALUES
('Delhi', 'Montreal', '2021-05-12', 1),
('Mumbai', 'Zurich', '2021-06-12', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
CREATE TABLE IF NOT EXISTS `tickets` (
  `Name` varchar(256) NOT NULL,
  `EmailId` varchar(255) NOT NULL,
  `Source` varchar(255) NOT NULL,
  `Destination` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`Name`, `EmailId`, `Source`, `Destination`) VALUES
('hola', 'hola@gmail.com', 'India ', 'Australia'),
('nisha', 'nisha@yahoo.in', 'India ', 'Australia'),
('minta', 'minta@gmail.com', 'Delhi ', 'Montreal'),
('kelli', 'kelli@gmail.com', 'India ', 'USA'),
('gopi', 'gopi@gmail.com', 'New Delhi ', 'Toronto'),
('happy', 'happ@gmail.com', 'India ', 'USA'),
('Navjeet Sharma', 'navjeet@gmail.com', 'India ', 'Australia'),
('Kirat', 'Kirat@yahoo.in', 'India ', 'USA'),
('Bhinda', 'bhinda@yahoo.in', 'India ', 'USA'),
('Mehak', 'min@gmail.com', 'India ', 'USA'),
('Shinda shaunki', 'shaunki@gmail.com', 'India ', 'Canada'),
('manjinder', 'manjinder@gmail.com', 'India ', 'Canada'),
('pooja ', 'pooja@gmail.com', 'India ', 'Canada');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `name` varchar(225) NOT NULL,
  `email` varchar(225) NOT NULL,
  `username` varchar(225) NOT NULL,
  `password` varchar(225) NOT NULL,
  `country` varchar(225) NOT NULL,
  `city` varchar(225) NOT NULL,
  `zipcode` varchar(225) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`name`, `email`, `username`, `password`, `country`, `city`, `zipcode`) VALUES
('undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined'),
('Bruce Banner', 'hulk@avengers.com', 'The Hulk', 'gsdxcefvg', 'dscbhj', 'hjb km', 'bhik jm'),
('Bruce Banner', 'hulk@avengers.com', 'The Hulk', 'gsdxcefvg', 'dscbhj', 'hjb km', 'bhik jm'),
('Bruce Banner', 'hulk@avengers.com', 'The Hulk', 'gsdxcefvg', 'dscbhj', 'hjb km', 'bhik jm'),
('Tony Stark', 'ironman@avengers.com', 'ironman', 'iamironman', 'Canada', 'Montreal', 'H1W 1K9'),
('Tony Stark', 'ironman@avengers.com', 'ironman', 'admin112', 'Canada', 'Montreal', 'H1W 1K9'),
('fgchjkio', 'fcghvjbkl', 'jgcfv bhngfch', 'admin1234', 'hgvjbknkm', 'h gvhjbnjk', 'hgvjbjknk'),
('fgchjkio', 'fcghvjbkl', 'jgcfv bhngfch', 'abcd', 'hgvjbknkm', 'h gvhjbnjk', 'hgvjbjknk'),
('pawan', 'p@gmail.com', 'pkp', 'pkp', 'Canada', 'Montreal', 'H1W 1K9'),
('Bruce', 'hulkk@avengers.com', 'wderfvgb', 'abcd1234', 'Canada', 'Montreal', 'H1W 1K9'),
('mandy', 'mandy@gmail.com', 'mandy112', 'mandy112', 'c', '', ''),
('sdjvbwiu', 'ncdd@jdnfvj.com', 'sdjvnwui', '123', 'Canada', 'Montreal', 'H1W 1K9'),
('pawan', 'p@gmail.com', 'cwbnjw', '123', 'Canada', 'Montreal', 'H1W 1K9'),
('pawan', 'p@gmail.com', 'cwbnjw', '123', 'Canada', 'Montreal', 'H1W 1K9'),
('Pandey', 'pkp3246@gmail.com', 'dwefrgt', 'abcd', 'Canada', 'Montreal', 'H1W 1K9'),
('Pandey', 'p@gmail.com', 'bghjk,', 'abcd', 'Canada', 'Montreal', 'H1W 1K9'),
('Pandey', 'p@gmail.com', 'bghjk,', 'abcd', 'Canada', 'Montreal', 'H1W 1K9'),
('Pandey', 'p@gmail.com', 'bghjk,', 'abcd', 'Canada', 'Montreal', 'H1W 1K9'),
('Stephen Strange', 'doctor@gmail.com', 'Doctor Strange', 'abcd', 'fd', 'vhubj', 'vhuvbj'),
('virdiShab', 'p@gmail.com', 'mrVirdi', 'bbd', 'Canada', 'Montreal', 'H1W 1K9'),
('virdiShab', 'p@gmail.com', 'mrVirdi', 'bbd', 'Canada', 'Montreal', 'H1W 1K9'),
('virdiShab', 'p@gmail.com', 'mrVirdi', 'bbd', 'Canada', 'Montreal', 'H1W 1K9'),
('virdiShab', 'virdi@gmail.com', 'mrVirdi', 'vvd', 'ca', '', ''),
('qdwefrgt', '', '', '', '', '', ''),
('Hello', '3246@gmail.com', 'hello', 'abcd', 'Canada', 'Montreal', 'H1W 1K9'),
('Ross Geller', 'unagi@gmail', 'Ross', 'rachel', 'usa', 'long-Island', 'LO1HD'),
('pkp', 'p@gmail.com', 'yhguyg', '123', 'Canada', 'Montreal', 'H1W 1K9'),
('kl', 'kl@gmail.com', 'kl', 'kl', 'Canada', 'Montreal', 'H1W 1K9'),
('Rahul', 'rahul@gmail.com', 'Rahul', 'admin123', 'Canada', 'Montreal', 'H1W 1K9'),
('pawan', 'pp@gmail.com', 'pp', 'pp', 'Canada', 'Montreal', 'H1W 1K9'),
('mandy', 'mandy@gmail.com', 'mandy24', 'mandy2324', 'india', 'gurdaspur', '143521'),
('killo', 'killo24@gmail.com', 'killo2324', 'killo23245', 'india', 'gurdaspur', '143521');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
