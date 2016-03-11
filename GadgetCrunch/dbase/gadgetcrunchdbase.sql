-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 08, 2015 at 12:01 AM
-- Server version: 5.1.37
-- PHP Version: 5.3.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `gadgetcrunchdbase`
--

-- --------------------------------------------------------

--
-- Table structure for table `tblgadget`
--

CREATE TABLE IF NOT EXISTS `tblgadget` (
  `gadget_id` int(4) NOT NULL AUTO_INCREMENT,
  `brand` varchar(20) NOT NULL,
  `model_code` varchar(30) NOT NULL,
  `description` varchar(50) NOT NULL,
  `category` varchar(20) NOT NULL,
  `price` double(10,2) NOT NULL,
  `gadget_quantity` int(4) NOT NULL,
  PRIMARY KEY (`gadget_id`),
  UNIQUE KEY `model_code` (`model_code`),
  UNIQUE KEY `model_code_2` (`model_code`),
  UNIQUE KEY `model_code_3` (`model_code`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `tblgadget`
--

INSERT INTO `tblgadget` (`gadget_id`, `brand`, `model_code`, `description`, `category`, `price`, `gadget_quantity`) VALUES
(8, 'HHG', 'HGFH', 'HTRRE', 'Tablet', 6544.00, 4),
(3, 'Samsung', 'SAMMODS600', 'Samsung Galaxy S6', 'Phone', 8000.00, 6),
(12, 'LGLAPMODX5', 'LG', 'Laptop i3 Quad Core', 'Computer', 4500.00, 1),
(14, 'APPLEMOD5S', 'Apple', 'iPhone 5S', 'Cellphone', 7500.00, 5);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
