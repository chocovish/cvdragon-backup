-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2019 at 12:26 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cvdragon`
--

-- --------------------------------------------------------

--
-- Table structure for table `cv-academic-projects`
--

CREATE TABLE `cv-academic-projects` (
  `academicid` int(11) NOT NULL,
  `id` bigint(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `proofRead` int(11) NOT NULL,
  `proofReadDate` date NOT NULL,
  `status` smallint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cv-achievements`
--

CREATE TABLE `cv-achievements` (
  `achieveid` int(11) NOT NULL,
  `id` bigint(20) NOT NULL,
  `achievement` varchar(255) NOT NULL,
  `year` year(4) NOT NULL,
  `description` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `proofRead` tinyint(4) NOT NULL,
  `proofReadDate` date NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cv-add-section`
--

CREATE TABLE `cv-add-section` (
  `addid` int(11) NOT NULL,
  `id` bigint(20) NOT NULL,
  `heading` varchar(200) NOT NULL,
  `subHeading` text NOT NULL,
  `description` text NOT NULL,
  `showAfter` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `proofRead` tinyint(4) NOT NULL,
  `proofReadDate` date NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cv-association`
--

CREATE TABLE `cv-association` (
  `associationid` int(11) NOT NULL,
  `id` bigint(20) NOT NULL,
  `organization` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `position` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `dateJoining` date NOT NULL,
  `dateLeaving` date DEFAULT NULL,
  `present` tinyint(4) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `proofRead` tinyint(4) NOT NULL,
  `proofReadDate` date NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cv-awards`
--

CREATE TABLE `cv-awards` (
  `awardid` int(11) NOT NULL,
  `id` bigint(20) NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `organization` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `year` year(4) NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL,
  `proofRead` tinyint(4) NOT NULL,
  `proofReadDate` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cv-basic-info`
--

CREATE TABLE `cv-basic-info` (
  `id` bigint(20) NOT NULL,
  `cvFullName` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `nationality` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `dateBirth` date DEFAULT NULL,
  `maritalStatus` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `facebookLink` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `linkedinLink` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `twitterLink` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `blogLink` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `proofRead` tinyint(4) NOT NULL,
  `proofReadDate` date NOT NULL,
  `status` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cv-certification`
--

CREATE TABLE `cv-certification` (
  `certificateid` int(11) NOT NULL,
  `id` bigint(20) NOT NULL,
  `certificate` varchar(100) NOT NULL,
  `authority` varchar(150) NOT NULL,
  `year` year(4) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `proofRead` tinyint(4) NOT NULL,
  `proofReadDate` date NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cv-co-curricular-activities`
--

CREATE TABLE `cv-co-curricular-activities` (
  `activityid` int(11) NOT NULL,
  `id` bigint(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `proofRead` tinyint(4) NOT NULL,
  `proofReadDate` date NOT NULL,
  `status` smallint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cv-contact`
--

CREATE TABLE `cv-contact` (
  `id` bigint(20) NOT NULL,
  `phoneNumber` varchar(30) DEFAULT NULL,
  `emailAddress` varchar(50) NOT NULL,
  `location` varchar(50) NOT NULL,
  `fullAddress` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `proofRead` tinyint(4) NOT NULL,
  `proofReadDate` date NOT NULL,
  `status` smallint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cv-cover`
--

CREATE TABLE `cv-cover` (
  `coverid` int(11) NOT NULL,
  `userid` bigint(20) NOT NULL,
  `cover` text NOT NULL,
  `created` date NOT NULL,
  `status` binary(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cv-education`
--

CREATE TABLE `cv-education` (
  `eduid` int(11) NOT NULL,
  `id` bigint(20) NOT NULL,
  `category` varchar(10) NOT NULL,
  `institute` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `university` varchar(100) NOT NULL,
  `specialization` varchar(100) NOT NULL,
  `grade` varchar(50) NOT NULL,
  `score` varchar(50) NOT NULL,
  `year` varchar(4) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `proofRead` tinyint(4) NOT NULL,
  `proofReadDate` date NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cv-images`
--

CREATE TABLE `cv-images` (
  `imageid` int(11) NOT NULL,
  `id` bigint(20) NOT NULL,
  `image` varchar(100) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `proofRead` tinyint(4) NOT NULL,
  `proofReadDate` date NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cv-preference`
--

CREATE TABLE `cv-preference` (
  `prefid` int(11) NOT NULL,
  `id` bigint(20) NOT NULL,
  `passport` tinyint(1) DEFAULT NULL,
  `passportDetails` varchar(100) NOT NULL,
  `recommendations` tinyint(1) DEFAULT NULL,
  `preferredLocation` varchar(50) NOT NULL,
  `canRelocate` tinyint(4) NOT NULL,
  `noticePeriod` varchar(20) NOT NULL,
  `canJoin` tinyint(4) NOT NULL,
  `expectedCTC` varchar(100) NOT NULL,
  `isNegotiate` tinyint(4) NOT NULL,
  `declaration` tinyint(1) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `proofRead` tinyint(4) NOT NULL,
  `proofReadDate` date NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cv-presentations`
--

CREATE TABLE `cv-presentations` (
  `activityid` int(11) NOT NULL,
  `id` bigint(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `proofRead` tinyint(4) NOT NULL,
  `proofReadDate` date NOT NULL,
  `status` smallint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cv-professional`
--

CREATE TABLE `cv-professional` (
  `professionalid` int(11) NOT NULL,
  `id` bigint(20) NOT NULL,
  `course` varchar(100) NOT NULL,
  `organization` varchar(100) NOT NULL,
  `university` varchar(100) NOT NULL,
  `year` year(4) DEFAULT NULL,
  `isPursuing` tinyint(4) DEFAULT NULL,
  `grade` varchar(20) NOT NULL,
  `score` varchar(20) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `proofRead` tinyint(4) NOT NULL,
  `proofReadDate` date NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cv-project`
--

CREATE TABLE `cv-project` (  `projectid` int(11) NOT NULL,  `workid` int(11) NOT NULL,  `organization` varchar(150) NOT NULL,
  `id` bigint(20) NOT NULL,  `title` varchar(100) NOT NULL,  `designation` varchar(50) NOT NULL,  `duration` varchar(20) NOT NULL,
  `location` varchar(50) NOT NULL,  `description` text NOT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `proofRead` tinyint(4) NOT NULL,  `proofReadDate` date NOT NULL,  `status` smallint(1) NOT NULL) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cv-academic-projects`
--
ALTER TABLE `cv-academic-projects`
  ADD PRIMARY KEY (`id`,`title`),
  ADD UNIQUE KEY `trainingid` (`academicid`);

--
-- Indexes for table `cv-achievements`
--
ALTER TABLE `cv-achievements`
  ADD UNIQUE KEY `achieveid` (`achieveid`),
  ADD UNIQUE KEY `id` (`id`,`achievement`,`year`);

--
-- Indexes for table `cv-add-section`
--
ALTER TABLE `cv-add-section`
  ADD PRIMARY KEY (`addid`);

--
-- Indexes for table `cv-association`
--
ALTER TABLE `cv-association`
  ADD PRIMARY KEY (`id`,`organization`,`position`) USING BTREE,
  ADD UNIQUE KEY `associationid` (`associationid`);

--
-- Indexes for table `cv-awards`
--
ALTER TABLE `cv-awards`
  ADD PRIMARY KEY (`id`,`title`,`year`),
  ADD UNIQUE KEY `awardid` (`awardid`);

--
-- Indexes for table `cv-basic-info`
--
ALTER TABLE `cv-basic-info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `cv-certification`
--
ALTER TABLE `cv-certification`
  ADD PRIMARY KEY (`id`,`certificate`,`authority`,`year`),
  ADD UNIQUE KEY `certificateid` (`certificateid`);

--
-- Indexes for table `cv-co-curricular-activities`
--
ALTER TABLE `cv-co-curricular-activities`
  ADD PRIMARY KEY (`id`,`title`),
  ADD UNIQUE KEY `trainingid` (`activityid`);

--
-- Indexes for table `cv-contact`
--
ALTER TABLE `cv-contact`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `userid` (`id`);

--
-- Indexes for table `cv-cover`
--
ALTER TABLE `cv-cover`
  ADD PRIMARY KEY (`coverid`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `cv-education`
--
ALTER TABLE `cv-education`
  ADD PRIMARY KEY (`id`,`category`),
  ADD KEY `eduid` (`eduid`);

--
-- Indexes for table `cv-images`
--
ALTER TABLE `cv-images`
  ADD PRIMARY KEY (`id`,`image`),
  ADD UNIQUE KEY `imageid` (`imageid`);

--
-- Indexes for table `cv-preference`
--
ALTER TABLE `cv-preference`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `profileid` (`prefid`);

--
-- Indexes for table `cv-presentations`
--
ALTER TABLE `cv-presentations`
  ADD PRIMARY KEY (`id`,`title`),
  ADD UNIQUE KEY `trainingid` (`activityid`);

--
-- Indexes for table `cv-professional`
--
ALTER TABLE `cv-professional`
  ADD PRIMARY KEY (`id`,`course`,`organization`),
  ADD UNIQUE KEY `professionalid` (`professionalid`);

--
-- Indexes for table `cv-project`
--
ALTER TABLE `cv-project`
  ADD PRIMARY KEY (`organization`,`id`,`title`),
  ADD UNIQUE KEY `projectid` (`projectid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cv-academic-projects`
--
ALTER TABLE `cv-academic-projects`
  MODIFY `academicid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cv-achievements`
--
ALTER TABLE `cv-achievements`
  MODIFY `achieveid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cv-add-section`
--
ALTER TABLE `cv-add-section`
  MODIFY `addid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cv-association`
--
ALTER TABLE `cv-association`
  MODIFY `associationid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cv-awards`
--
ALTER TABLE `cv-awards`
  MODIFY `awardid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cv-certification`
--
ALTER TABLE `cv-certification`
  MODIFY `certificateid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cv-co-curricular-activities`
--
ALTER TABLE `cv-co-curricular-activities`
  MODIFY `activityid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cv-cover`
--
ALTER TABLE `cv-cover`
  MODIFY `coverid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cv-education`
--
ALTER TABLE `cv-education`
  MODIFY `eduid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cv-images`
--
ALTER TABLE `cv-images`
  MODIFY `imageid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2223;

--
-- AUTO_INCREMENT for table `cv-preference`
--
ALTER TABLE `cv-preference`
  MODIFY `prefid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cv-presentations`
--
ALTER TABLE `cv-presentations`
  MODIFY `activityid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cv-professional`
--
ALTER TABLE `cv-professional`
  MODIFY `professionalid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cv-project`
--
ALTER TABLE `cv-project`
  MODIFY `projectid` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
