-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 14, 2015 at 10:03 AM
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
-- Table structure for table `tbladminlogin`
--

CREATE TABLE IF NOT EXISTS `tbladminlogin` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbladminlogin`
--

INSERT INTO `tbladminlogin` (`admin_id`, `username`, `password`) VALUES
(1, 'adminLucas', 'Administrator');

-- --------------------------------------------------------

--
-- Table structure for table `tblclient`
--

CREATE TABLE IF NOT EXISTS `tblclient` (
  `client_id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `surname` varchar(25) NOT NULL,
  `id_number` bigint(13) NOT NULL,
  `gender` varchar(6) NOT NULL,
  PRIMARY KEY (`client_id`),
  UNIQUE KEY `id_number` (`id_number`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `tblclient`
--

INSERT INTO `tblclient` (`client_id`, `name`, `surname`, `id_number`, `gender`) VALUES
(1, 'fdd', 'dfgdfg', 453453453, 'Male'),
(2, 'Gontse', 'Mokgale', 930308526208, 'Female'),
(3, 'Tshidi', 'Nkoana', 9109195262082, 'Male'),
(4, 'hTes', 'Test', 44444544, 'Male'),
(5, 'Test2', 'Test2', 920919526200, 'Male'),
(6, 'Gie', 'Mokgale', 9898956565458, 'Female'),
(8, 'ttt', 'ttt', 4545454545454, 'Male'),
(9, 'Jerry', 'Nkoana', 5006195262082, 'Male'),
(10, 'Amanda', 'Madiba', 8905125468088, 'Male'),
(11, 'tust', 'tust', 5564564, 'Male'),
(12, 'hfjhf', 'hfjh', 333, 'Male'),
(13, 'sda', 'asdas', 4332, 'Male'),
(14, 'asdasd', 'sadsad', 434234, 'Male'),
(15, 'Itumeleng', 'Sifiso', 9306065262082, 'Female'),
(16, 'Lesego', 'Tshepe', 9209195262000, 'Female'),
(17, 'asd', 'Nkoana', 91091952620544, 'Male'),
(18, 'asdasd', 'ASDsad', 213123, 'Male'),
(19, '', '', 212112, 'Female'),
(20, 'gfhgfh', 'fghfghfgh', 12123213, 'Male');

-- --------------------------------------------------------

--
-- Table structure for table `tblclientcontact`
--

CREATE TABLE IF NOT EXISTS `tblclientcontact` (
  `contact_id` int(4) NOT NULL,
  `email` varchar(30) NOT NULL DEFAULT 'N/A',
  `contact_number` varchar(13) NOT NULL,
  PRIMARY KEY (`contact_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblclientcontact`
--

INSERT INTO `tblclientcontact` (`contact_id`, `email`, `contact_number`) VALUES
(1, 'asdasd@yahoo.com', '43566456'),
(2, 'gontse@yahoo.com', '0762364545'),
(8, 'lucas.nkoana@yahoo.com', '89898989'),
(9, 'jerry@yahoo.com', '0784524587'),
(10, 'amanda@yahoo.com', '07123545654'),
(11, 'lucas@yahoo.com', '5454545'),
(12, 'ggg@g.com', '5444'),
(13, 'fsd', '4321'),
(14, 'fsdfsdf@dsfdf', '34234'),
(15, 'lucas.nkoana@yahoo.com', '0792359260'),
(16, 'lesego@yahoo.com', '0792222'),
(18, 'kjljkl', 'kjljkl'),
(20, 'jlkjljkl', 'jkljkljkl');

-- --------------------------------------------------------

--
-- Table structure for table `tblclientlogin`
--

CREATE TABLE IF NOT EXISTS `tblclientlogin` (
  `login_id` int(4) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblclientlogin`
--

INSERT INTO `tblclientlogin` (`login_id`, `username`, `password`) VALUES
(1, 'adminLuca', 'null'),
(2, 'gontse', 'null');

-- --------------------------------------------------------

--
-- Table structure for table `tblgadget`
--

CREATE TABLE IF NOT EXISTS `tblgadget` (
  `gadget_id` int(4) NOT NULL AUTO_INCREMENT,
  `model_code` varchar(25) NOT NULL,
  `brand` varchar(20) NOT NULL,
  `description` varchar(50) NOT NULL,
  `category` varchar(20) NOT NULL,
  `price` double(10,2) NOT NULL,
  `gadget_quantity` int(11) NOT NULL,
  PRIMARY KEY (`gadget_id`),
  UNIQUE KEY `model_code` (`model_code`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=51 ;

--
-- Dumping data for table `tblgadget`
--

INSERT INTO `tblgadget` (`gadget_id`, `model_code`, `brand`, `description`, `category`, `price`, `gadget_quantity`) VALUES
(1, 'APPMODV56S', 'Apple', 'iPhone 5 4G', 'Cellphone', 7500.00, 12),
(13, 'BLCMOD93', 'Blackberry', 'Blackberry 9300 Black', 'Cellphone', 1200.00, 3),
(12, 'HUAMODAC', 'Huawei', 'Huawei Ascend 7', 'Computer', 7855.00, 2),
(6, 'APPWATV1', 'Apple', 'Apple Watch V1', 'Wearable', 8500.00, 6),
(14, 'BLCMOD9320', 'Blackberry', 'Blackberry 9320 Assorted', 'Cellphone', 1500.00, 4),
(11, 'BLKBZ3MOD10', 'Blackberry', 'Blackberry 10 Z3', 'Cellphone', 3500.00, 5),
(15, 'BLCMODZ10', 'Blackberry', 'Blackberry Z10', 'Cellphone', 5690.00, 10),
(16, 'SONMODXZ3', 'SONY', 'Sony Xperia Z3', 'Cellphone', 2000.00, 3),
(17, 'ACELUQMOD5', 'ACER', 'Liquid Z520', 'Cellphone', 1500.00, 6),
(18, 'ACELUQMOD7', 'ACER', 'Liquid E700', 'Cellphone', 5000.00, 2),
(19, 'ACELUQMODJ', 'ACER', 'Luqiud Jade', 'Cellphone', 2500.00, 6),
(20, 'HTCMOD1E9', 'HTC', 'One E9+', 'Cellphone', 3200.00, 6),
(21, 'HTCMODD6', 'HTC', 'Desire 626', 'Cellphone', 5680.00, 5),
(22, 'LGMODMAG1', 'LG', 'Magna', 'Cellphone', 4000.00, 5),
(23, 'LGMOSSPRT', 'LG', 'Spirit', 'Cellphone', 7450.00, 6),
(24, 'LGMODG3D', 'LG', 'G3 Dual-LTE', 'Cellphone', 5620.00, 2),
(25, 'LGMODG2M', 'LG', 'G2 mini', 'Cellphone', 2500.00, 5),
(26, 'LGMOD320', 'LG', 'L70 D320N', 'Cellphone', 5600.00, 4),
(27, 'LUMMOD73', 'NOKIA', 'Lumia 730 Dual Sim', 'Cellphone', 4500.00, 6),
(28, 'LUMMOD530', 'NOKIA', 'Lumia 530', 'Cellphone', 2600.00, 4),
(29, 'LUMMOD930', 'NOKIA', 'Lumia 930', 'Cellphone', 5900.00, 3),
(32, 'kjllkjlk', 'kljlkjkl', 'lkjkljkljklj', 'Computer', 2323.00, 2),
(31, 'MOTMODZ3', 'MOTOROLA', 'Z3 Slim', 'Cellphone', 1500.00, 6),
(33, 'SAMGALGM09', 'Samsung', 'Galaxy Grand Neo', 'Cellphone', 7500.00, 5),
(34, 'SAMLAP10', 'SAMSUNG', 'Intel Dual Core Laptop ', 'Laptop', 2500.00, 2),
(35, 'SAMLAP20', 'SAMSUNG', 'Intel Quad Core Laptop', 'Laptop', 3500.00, 5),
(36, 'ACEMOD10', 'ACER', '2GB DDR2 LAPTOP', 'Laptop', 1500.00, 2),
(37, 'ACEMOD20', 'ACER', 'Acer X Gaming Notebook', 'Laptop', 7540.00, 2),
(38, 'HPZ3100', 'HP', 'Business Pro Notebook', 'Laptop', 5500.00, 3),
(39, 'HPZ400G', 'HP', 'Student Plus Notebook', 'Laptop', 6500.00, 2),
(40, 'MODAIRAPP09', 'APPLE', 'Mac Book Air', 'Laptop', 5500.00, 5),
(41, 'MODPROMAC005', 'APPLE', 'Mac Book Pro 13-inch', 'Laptop', 14500.00, 5),
(42, 'MODPROQ6', 'APPLE', 'Mac Pro Quad Core', 'Laptop', 5560.00, 8),
(43, 'SHAPDON', 'DONDROID', 'Dondoid Sharp SA', 'Cellphone', 1500.00, 2),
(44, 'APPWATCHMO56', 'APPLE', 'Apple Watch Sport', 'Wearable', 7500.00, 30),
(45, 'APPWATCMO57', 'APPLE', 'Apple Watch', 'Wearable', 4500.00, 21),
(46, 'SONYWA006', 'SONY', 'Digital wristband Pro', 'Wearable', 1500.00, 11);

-- --------------------------------------------------------

--
-- Table structure for table `tbllogin`
--

CREATE TABLE IF NOT EXISTS `tbllogin` (
  `login_id` int(4) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `role` varchar(25) NOT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbllogin`
--

INSERT INTO `tbllogin` (`login_id`, `username`, `password`, `role`) VALUES
(1, 'adminLucas', 'adminlucas', 'Admin'),
(8, 'username', 'username', 'Client'),
(9, 'jerry', 'null', 'Client'),
(10, 'amanda', 'amanda', 'Client'),
(11, 'user', 'null', 'Client'),
(12, '5555', '5555', 'Client'),
(13, 'gfdg', 'gfgf', 'Client'),
(14, '4343434', '3434', 'Client'),
(15, 'itumeleng', 'itumeleng', 'Client'),
(16, 'lesego', 'lesego', 'Client'),
(18, 'jkljkl', 'jkljkl', 'Client'),
(20, 'jkljkljkl', 'jkljkl', 'Client');

-- --------------------------------------------------------

--
-- Table structure for table `tblorder`
--

CREATE TABLE IF NOT EXISTS `tblorder` (
  `order_id` int(3) NOT NULL AUTO_INCREMENT,
  `client_id` int(3) NOT NULL,
  `orderDescription` varchar(1000) NOT NULL,
  `amountDue` double NOT NULL,
  `orderDate` varchar(50) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `tblorder`
--

INSERT INTO `tblorder` (`order_id`, `client_id`, `orderDescription`, `amountDue`, `orderDate`) VALUES
(1, 15, 'iPhone 5 4G\n', 7500, 'Tue May 12 12:24:41 PDT 2015'),
(2, 15, 'Intel Dual Core Laptop \nIntel Quad Core Laptop\n', 6000, 'Tue May 12 12:34:31 PDT 2015'),
(3, 15, 'Intel Quad Core Laptop\n2GB DDR2 LAPTOP\n', 5000, 'Tue May 12 12:38:29 PDT 2015'),
(4, 10, 'Intel Quad Core Laptop\n2GB DDR2 LAPTOP\n', 5000, 'Thu May 14 02:55:39 PDT 2015'),
(5, 10, 'Intel Dual Core Laptop \nIntel Quad Core Laptop\n2GB DDR2 LAPTOP\n', 7500, 'Thu May 14 03:17:52 PDT 2015'),
(6, 15, 'Intel Dual Core Laptop \nIntel Quad Core Laptop\nAcer X Gaming Notebook\n', 13540, 'Thu May 14 03:41:16 PDT 2015'),
(7, 15, 'Blackberry 9300 Black\nBlackberry 9320 Assorted\n', 2700, 'Thu May 14 05:42:15 PDT 2015'),
(8, 15, 'Intel Dual Core Laptop \nIntel Quad Core Laptop\n', 6000, 'Thu May 14 05:58:58 PDT 2015');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
