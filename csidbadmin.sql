-- phpMyAdmin SQL Dump
-- version 2.11.11.3
-- http://www.phpmyadmin.net
--
-- Host: 10.6.171.202
-- Generation Time: Sep 22, 2015 at 12:40 PM
-- Server version: 5.5.33
-- PHP Version: 5.3.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `csidbadmin`
--

USE csidbadmin;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` varchar(256) NOT NULL,
  `password` varchar(512) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` VALUES(1, 'greg', '81899aecf5f2ecbc23b49c552d4faa38c8a40648d0c025bb492b991662d830406b6c67a85371ed804ac6747c026200eb554699997f5355651407a274e56f196b');
INSERT INTO `clients` VALUES(2, 'kirk.thunderwood@tanpeat.com', '77CPqSLRgJVEdx6bSzzym2gFXcVg3uxkXtq9QUAttcFj2FeAYFsAzW96bWHgDeVGu7jSqvDYTV8KNfQQfszPFHZQLPjq8wAGsdemYYc43Q85u3Vfh9H6Jwcgk3h754kl');
INSERT INTO `clients` VALUES(3, 'jessica.metzger@tanpeat.com', '6mMAsxR5Bsx3md3jySb3akXMxphwAkLgtQhWjsf5rXKNeSy8j23gwgjxMErvUy3NBMmWKFrbe5fpEg4caTdnzmVeqQRECn48tqAYyALLUWujRaV5ENwf3R6UAa5hNaXN');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` bigint(20) NOT NULL,
  `recipient` varchar(128) NOT NULL,
  `sender` varchar(128) NOT NULL,
  `subject` varchar(512) NOT NULL,
  `message` varchar(1300) NOT NULL,
  `priority` enum('low','normal','high') NOT NULL DEFAULT 'normal',
  `sentdate` datetime NOT NULL,
  `recdate` datetime NOT NULL,
  `size` mediumint(9) NOT NULL,
  `messagetype` binary(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` VALUES(1, 1, 'Greg Johnson', 'Paul Wortman', 'This will be nice if it works', 'This might take longer than I thought. But, it will be nice if it works', 'normal', '2015-09-18 13:55:45', '2015-09-18 13:55:55', 12, '0');
INSERT INTO `messages` VALUES(2, 2, 'Kirk Thunderwood', 'Gordon Liddy', 'Welcome to Tantechi Peace Tech', 'Welcome new comers,<br><br>Welcome to your new work at Tantechi Peace Tech.  We hope that you all will be enjoying you\'re time working for us.  Each of you has been brought here thanks to your unique skills and history.  We figured that a more personal greeting would help you all feel more at home with your new colleges.  We hope each of you will get to know each other and help the company grow as a team.<br><br>Kirk Thunderwood (kirk.thunderwood@tanpeat.com):  Welcome Kirk to Tantechi Peace Tech.  After so many years leading your own teams and people we are delighted to have you join us here.<br><br>Jessica Metzger (jessica.metzger@tanpeat.com): Welcome Jessica to Tantechi Peace Tech.  We can\'t wait to have your network and systems knowledge join our IT department as we continue to tackle the cyberphysical growth we continue to face for the foreseeable future.<br><br>If any of you are having trouble getting settled into your new accounts and email, please contact tech support at XXX-XXX-XXXX.  Hope that you all enjoy working with Tantechi Peace Tech as much as the rest of us have.<br><br>&nbsp&nbsp&nbsp&nbsp&nbsp-&nbspGordon Liddy<br>&nbsp&nbsp&nbsp&nbsp&nbspTantechi Peace Tech IT Admin', 'normal', '2015-10-28 09:55:45', '2015-10-28 09:55:55', 12, '0');
INSERT INTO `messages` VALUES(3, 3, 'Jessica Metzger', 'Gordon Liddy', 'Welcome to Tantechi Peace Tech', 'Welcome new comers,<br><br>Welcome to your new work at Tantechi Peace Tech.  We hope that you all will be enjoying you\'re time working for us.  Each of you has been brought here thanks to your unique skills and history.  We figured that a more personal greeting would help you all feel more at home with your new colleges.  We hope each of you will get to know each other and help the company grow as a team.<br><br>Kirk Thunderwood (kirk.thunderwood@tanpeat.com):  Welcome Kirk to Tantechi Peace Tech.  After so many years leading your own teams and people we are delighted to have you join us here.<br><br>Jessica Metzger (jessica.metzger@tanpeat.com): Welcome Jessica to Tantechi Peace Tech.  We can\'t wait to have your network and systems knowledge join our IT department as we continue to tackle the cyberphysical growth we continue to face for the foreseeable future.<br><br>If any of you are having trouble getting settled into your new accounts and email, please contact tech support at XXX-XXX-XXXX.  Hope that you all enjoy working with Tantechi Peace Tech as much as the rest of us have.<br><br>&nbsp&nbsp&nbsp&nbsp&nbsp-&nbspGordon Liddy<br>&nbsp&nbsp&nbsp&nbsp&nbspTantechi Peace Tech IT Admin', 'normal', '2015-10-28 09:55:45', '2015-10-28 09:55:55', 12, '0');
INSERT INTO `messages` VALUES(4, 3, 'Jessica Metzger', 'Thomas Crowe', 'Team Update', 'Hello Everyone,<br><br>Continuing our weekly sync-ups, here are the important details for the week:<br><br>Work on the development and production web servers continues<br>&nbsp&nbsp&nbsp&nbsp&nbspi) Move from development to production going smoothly.<br>&nbsp&nbsp&nbsp&nbsp&nbspii) Database information has been shifted correctly. Development server (namegame.phonebook.net) being phased out<br>&nbsp&nbsp&nbsp&nbsp&nbspi) Final implementations being ported to production level server<br><br>So that everyone is aware, we have some new members joining out crew.  I\'ve CC\'ed them on this email, so please start asking questions and becoming familiar with the group to help us keep pace for the coming weeks.<br><br>&nbsp&nbsp&nbsp&nbsp&nbsp- Thomas Crowe', 'normal', '2015-10-28 13:55:45', '2015-10-28 13:55:55', 12, '0');
INSERT INTO `messages` VALUES(5, 3, 'Jessica Metzger', 'John Sharma', 'Help Me Out?', 'Hello Jessica,<br><br>I hear that you are the new network systems expert for the company.  Well, I would love to get your opinion on the diagram I will be presenting on later today!  I know that you are not as familiar with our internal systems, you being a new hire and all, but it would still mean a lot to have an experienced set of eyes look over my work before this big presentation.  Please let me know if you spot anything that looks incorrect or out of place.<br><br>&nbsp&nbsp&nbsp&nbsp&nbsp- John Sharma', 'normal', '2015-10-29 08:55:45', '2015-10-29 08:55:55', 12, '0');
-- --------------------------------------------------------

--
-- Table structure for table `secanswers`
--

CREATE TABLE `secanswers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` bigint(20) NOT NULL,
  `questionid` bigint(20) NOT NULL,
  `answer` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `secanswers`
--

INSERT INTO `secanswers` VALUES(1, 1, 1, 'Smith');
INSERT INTO `secanswers` VALUES(2, 1, 2, 'Hartford');
INSERT INTO `secanswers` VALUES(3, 1, 3, 'Fido');
INSERT INTO `secanswers` VALUES(4, 1, 4, 'black');
INSERT INTO `secanswers` VALUES(5, 1, 5, 'How to Solve It');
INSERT INTO `secanswers` VALUES(6, 1, 6, 'SRV');
INSERT INTO `secanswers` VALUES(7, 1, 7, 'The Big Bang Theory');
INSERT INTO `secanswers` VALUES(8, 1, 8, 'Fletch');
INSERT INTO `secanswers` VALUES(9, 1, 9, 'Hartford');
INSERT INTO `secanswers` VALUES(10, 1, 10, '0');

--
-- Information for Kirk Thunderwood
--

INSERT INTO `secanswers` VALUES(11, 2, 1, 'Flournoy');
INSERT INTO `secanswers` VALUES(12, 2, 2, 'London');
INSERT INTO `secanswers` VALUES(13, 2, 3, 'Sparky');
INSERT INTO `secanswers` VALUES(14, 2, 4, 'pink');
INSERT INTO `secanswers` VALUES(15, 2, 5, 'How to Be Always Well');
INSERT INTO `secanswers` VALUES(16, 2, 6, 'Pixies');
INSERT INTO `secanswers` VALUES(17, 2, 7, 'Cheers');
INSERT INTO `secanswers` VALUES(18, 2, 8, 'Beetlejuice');
INSERT INTO `secanswers` VALUES(19, 2, 9, 'Cheesequake');
INSERT INTO `secanswers` VALUES(20, 2, 10, '10');

--
-- Information for Jessica Metzger
--

INSERT INTO `secanswers` VALUES(21, 3, 1, 'Smith');
INSERT INTO `secanswers` VALUES(22, 3, 2, 'Hartford');
INSERT INTO `secanswers` VALUES(23, 3, 3, 'Fido');
INSERT INTO `secanswers` VALUES(24, 3, 4, 'black');
INSERT INTO `secanswers` VALUES(25, 3, 5, 'How to Solve It');
INSERT INTO `secanswers` VALUES(26, 3, 6, 'SRV');
INSERT INTO `secanswers` VALUES(27, 3, 7, 'The Big Bang Theory');
INSERT INTO `secanswers` VALUES(28, 3, 8, 'Fletch');
INSERT INTO `secanswers` VALUES(29, 3, 9, 'Hartford');
INSERT INTO `secanswers` VALUES(30, 3, 10, '0');

-- --------------------------------------------------------

--
-- Table structure for table `secquestions`
--

CREATE TABLE `secquestions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `question` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `secquestions`
--

INSERT INTO `secquestions` VALUES(1, 'What is your mother''s maiden name?');
INSERT INTO `secquestions` VALUES(2, 'What is your hometown?');
INSERT INTO `secquestions` VALUES(3, 'What is the name of your childhood pet?');
INSERT INTO `secquestions` VALUES(4, 'What is your favorite color?');
INSERT INTO `secquestions` VALUES(5, 'What is your favorite book?');
INSERT INTO `secquestions` VALUES(6, 'What is your favorite recording artist?');
INSERT INTO `secquestions` VALUES(7, 'What is your favorite television show?');
INSERT INTO `secquestions` VALUES(8, 'What is your favorite movie?');
INSERT INTO `secquestions` VALUES(9, 'Where were you born?');
INSERT INTO `secquestions` VALUES(10, 'What is your favorite number?');
