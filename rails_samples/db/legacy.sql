-- MySQL dump 10.9
--
-- Host: localhost    Database: rails_samples_development
-- ------------------------------------------------------
-- Server version	5.0.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE="NO_AUTO_VALUE_ON_ZERO" */;

--
-- Table structure for table `hrMEM002`
--
-- codecite legacy
/* This is the MySQL version; see below for SQLite3. */
DROP TABLE IF EXISTS `hrMEM002`;
CREATE TABLE `hrMEM002` (
  `memID` int(11) NOT NULL auto_increment,
  `memFN` varchar(50) default NULL,
  `memLN` varchar(50) default NULL,
  `memSSN` int(9) default NULL,
  PRIMARY KEY  (`memID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `hrPOL001`
--

DROP TABLE IF EXISTS `hrPOL001`;
CREATE TABLE `hrPOL001` (
  `polID` int(11) NOT NULL auto_increment,
  `polTYPE` varchar(50) default NULL,
  `polNUMBER` varchar(50) default NULL,
  `polHOLDER` int(11) default NULL,
  PRIMARY KEY  (`polID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/* or, for SQLite3:

DROP TABLE IF EXISTS `hrMEM002`;
CREATE TABLE `hrMEM002` (
  `memID` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  `memFN` varchar(50) default NULL,
  `memLN` varchar(50) default NULL,
  `memSSN` int(9) default NULL
);

DROP TABLE IF EXISTS `hrPOL001`;
CREATE TABLE `hrPOL001` (
  `polID` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  `polTYPE` varchar(50) default NULL,
  `polNUMBER` varchar(50) default NULL,
  `polHOLDER` int(11) default NULL
);

*/
-- codecite legacy
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

