
-- phpMyAdmin SQL Dump
-- version 2.11.11.3
-- http://www.phpmyadmin.net
--
-- Host: 166.62.8.12
-- Generation Time: Jun 17, 2019 at 03:28 AM
-- Server version: 5.5.51
-- PHP Version: 5.1.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cvDragon`
--

-- --------------------------------------------------------

--
-- Table structure for table `associate-proofRead`
--

CREATE TABLE `associate-proofRead` (
  `orderid` bigint(20) NOT NULL ,
  `proofReport` text CHARACTER SET utf8 NOT NULL,
  `approved` tinyint(4) NOT NULL,
  `rating` float NOT NULL,
  `proofReadstatus` tinyint(4) NOT NULL,
  `id` bigint(20) NOT NULL,
  `resume` bigint(11) NOT NULL,
  `dateRequest` datetime NOT NULL,
  `dateCompleted` datetime NOT NULL,
  `dateUpdated` timestamp NULL DEFAULT CURRENT_TIMESTAMP   ,
  `proofReader` bigint(20) NOT NULL,
  `status` tinyint(4) NOT NULL,
  UNIQUE KEY `orderid` (`orderid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci =128 ;

-- --------------------------------------------------------

--
-- Table structure for table `associate-subscription`
--

CREATE TABLE `associate-subscription` (
  `orderid` bigint(20) NOT NULL,
  `id` bigint(20) NOT NULL,
  `design` int(11) NOT NULL,
  `activate` date NOT NULL,
  `expiry` date NOT NULL,
  `securityKey` varchar(19)  NOT NULL,
  `dateCreated` date NOT NULL,
  `dateUpdated` timestamp NULL DEFAULT CURRENT_TIMESTAMP   ,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`,`design`),
  UNIQUE KEY `orderid` (`orderid`),
  UNIQUE KEY `securityKey` (`securityKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `create-clprofile`
--done for app

CREATE TABLE `create-clprofile` (  `clid` bigint(20) NOT NULL UNIQUE,  `cvid` int(11) NOT NULL,  `id` bigint(20) NOT NULL,  `design` int(11) NOT NULL,  `coverName` varchar(100)   NOT NULL,  `coverLetter` text   NOT NULL,  `dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `status` smallint(6) NOT NULL);
-- --------------------------------------------------------

--
-- Table structure for table `create-cvprofile`
--DONE FOR APP

CREATE TABLE `create-cvprofile` (  `cvid` bigint(20) NOT NULL UNIQUE,  `id` bigint(20) NOT NULL,  `profileName` varchar(100)   NOT NULL,  `sections` varchar(255)   NOT NULL,  `design` int(11) NOT NULL,  `font` int(11) NOT NULL,  `setting` int(11) NOT NULL,  `profilePicture` varchar(100)   NOT NULL,  `isPublic` tinyint(4) NOT NULL,  `progressReport` tinyint(4) NOT NULL,  `dateUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `status` smallint(6) NOT NULL,  PRIMARY KEY (`id`,`profileName`,`sections`,`status`));

-- --------------------------------------------------------

--
-- Table structure for table `create-cvprofilesection`
--

CREATE TABLE `create-cvprofilesection` (`psid` int(11) NOT NULL ,  `cvid` int(11) NOT NULL,  `id` bigint(20) NOT NULL,  `section` int(11) NOT NULL,  `subsection` text NOT NULL, `dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,  `status` tinyint(4) NOT NULL,  PRIMARY KEY (`psid`),  UNIQUE KEY `cvid` (`cvid`,`section`,`status`),  KEY `psid` (`psid`)) ;

-- --------------------------------------------------------

--
-- Table structure for table `create-cvsection`
--

CREATE TABLE `create-cvsection` (`sectionid` int(11) NOT NULL ,  `section` int(11) NOT NULL,  `id` bigint(20) NOT NULL,  `contentAdded` int(6) NOT NULL,  `contentStatus` int(11) NOT NULL,`dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,  `status` smallint(6) NOT NULL,  PRIMARY KEY (`section`,`id`),  UNIQUE KEY `sectionid_2` (`sectionid`),  KEY `sectionid` (`sectionid`)) ;
----------------------------------------------------------

--
-- Table structure for table `create-notification`
--

CREATE TABLE `create-notification` (
  `nid` int(11) NOT NULL ,
  `notifyid` int(11) NOT NULL,
  `id` bigint(20) NOT NULL,
  `isRead` tinyint(4) NOT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`notifyid`,`id`),
  UNIQUE KEY `nid` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci =1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cv-academic-projects`
--

CREATE TABLE `cv-academic-projects` (
  `academicid` int(11) NOT NULL ,
  `id` bigint(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,
  `proofRead` int(11) NOT NULL,
  `proofReadDate` date NOT NULL,
  `status` smallint(1) NOT NULL,
  PRIMARY KEY (`id`,`title`),
  UNIQUE KEY `trainingid` (`academicid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 =2371 ;

-- --------------------------------------------------------

--
-- Table structure for table `cv-achievements`
--

CREATE TABLE `cv-achievements` (  `achieveid` int(11) NOT NULL ,  `id` bigint(20) NOT NULL,  `achievement` varchar(255) NOT NULL,  `year` year(4) NOT NULL,
  `description` text NOT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `proofRead` tinyint(4) NOT NULL,  `proofReadDate` date NOT NULL,
  `status` tinyint(1) NOT NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cv-add-section`
--

CREATE TABLE `cv-add-section` (  `addid` int(11) NOT NULL ,  `id` bigint(20) NOT NULL,  `heading` varchar(200) NOT NULL , `subHeading` text NOT NULL,
  `description` text NOT NULL,  `showAfter` int(11) NOT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `proofRead` tinyint(4) NOT NULL,
  `proofReadDate` date NOT NULL,  `status` tinyint(4) NOT NULL,  PRIMARY KEY (`addid`)) ;

-- --------------------------------------------------------

--
-- Table structure for table `cv-association`
-- done for app

CREATE TABLE `cv-association` (`associationid` int(11) NOT NULL,  `id` bigint(20) NOT NULL,  `organization` varchar(100)   NOT NULL,  `position` varchar(50)   NOT NULL,  `location` varchar(50)   NOT NULL,  `description` mediumtext NOT NULL,  `dateJoining` date NOT NULL,`dateLeaving` date DEFAULT NULL,  `present` tinyint(4) NOT NULL,`created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,  `proofRead` tinyint(4) NOT NULL,
  `proofReadDate` date NOT NULL,  `status` tinyint(1) NOT NULL,  PRIMARY KEY (`id`,`organization`,`position`) ) ;

-- --------------------------------------------------------

--
-- Table structure for table `cv-awards`
-- done for app

CREATE TABLE `cv-awards` (`awardid` int(11) UNIQUE NOT NULL ,  `id` bigint(20) NOT NULL,  `title` varchar(100)   NOT NULL,  `organization` varchar(50)   NOT NULL,  `year` year(4) NOT NULL,  `description` mediumtext   NOT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `status` tinyint(1) NOT NULL,  `proofRead` tinyint(4) NOT NULL,`proofReadDate` date NOT NULL)  ;

-- --------------------------------------------------------

--
-- Table structure for table `cv-basic-info`
-- done for app

CREATE TABLE `cv-basic-info` (  `id` bigint(20) NOT NULL,  `cvFullName` varchar(100)   NOT NULL,  `nationality` varchar(50)   NOT NULL,  `gender` varchar(50)   NOT NULL,  `dateBirth` date DEFAULT NULL,  `maritalStatus` varchar(20)   NOT NULL,  `facebookLink` varchar(200)   NOT NULL,  `linkedinLink` varchar(200)   NOT NULL,  `twitterLink` varchar(200)   NOT NULL,  `blogLink` varchar(200)   NOT NULL,  `dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `proofRead` tinyint(4) NOT NULL,  `proofReadDate` date NOT NULL,  `status` smallint(6) NOT NULL,  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`));

-- --------------------------------------------------------

--
-- Table structure for table `cv-certification`
-- done for app

CREATE TABLE `cv-certification` (  `certificateid` int(11) NOT NULL ,  `id` bigint(20) NOT NULL,  `certificate` varchar(100) NOT NULL,  `authority` varchar(150) NOT NULL,  `year` year(4) NOT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `proofRead` tinyint(4) NOT NULL,  `proofReadDate` date NOT NULL,  `status` tinyint(1) NOT NULL,  PRIMARY KEY (`id`,`certificate`,`authority`,`year`),  UNIQUE KEY `certificateid` (`certificateid`)) ;

-- --------------------------------------------------------

--
-- Table structure for table `cv-co-curricular-activities`
-- done for app 

CREATE TABLE `cv-co-curricular-activities` (  `activityid` int(11) NOT NULL ,  `id` bigint(20) NOT NULL,  `title` varchar(100) NOT NULL,  `description` text NOT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `proofRead` tinyint(4) NOT NULL,  `proofReadDate` date NOT NULL,  `status` smallint(1) NOT NULL,  PRIMARY KEY (`id`,`title`),  UNIQUE KEY `trainingid` (`activityid`)) ;

-- --------------------------------------------------------

--
-- Table structure for table `cv-contact`
-- done for app

CREATE TABLE `cv-contact` (  `id` bigint(20) NOT NULL,  `phoneNumber` varchar(30) DEFAULT NULL,  `emailAddress` varchar(50) NOT NULL,  `location` varchar(50) NOT NULL,  `fullAddress` text NOT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `proofRead` tinyint(4) NOT NULL,  `proofReadDate` date NOT NULL,  `status` smallint(1) NOT NULL,
  PRIMARY KEY (`id`),  UNIQUE KEY `id` (`id`),  KEY `userid` (`id`)) ;

-- --------------------------------------------------------

--
-- Table structure for table `cv-cover`
-- done for app

CREATE TABLE `cv-cover` (  `coverid` int(11) NOT NULL , `userid` bigint(20) NOT NULL,  `cover` text NOT NULL,  `created` date NOT NULL,  `status` binary(1) NOT NULL,  PRIMARY KEY (`coverid`)) ;

-- --------------------------------------------------------

--
-- Table structure for table `cv-education`
--done for app

CREATE TABLE `cv-education` (  `eduid` int(11) NOT NULL ,  `id` bigint(20) NOT NULL,  `category` varchar(10) NOT NULL,
  `institute` varchar(100) NOT NULL,  `location` varchar(100) NOT NULL,  `university` varchar(100) NOT NULL,  `specialization` varchar(100) NOT NULL,  `grade` varchar(50) NOT NULL,  `score` varchar(50) NOT NULL,
  `year` varchar(4) DEFAULT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `proofRead` tinyint(4) NOT NULL,  `proofReadDate` date NOT NULL,  `status` tinyint(1) NOT NULL,  PRIMARY KEY (`id`,`category`));

-- --------------------------------------------------------

--
-- Table structure for table `cv-images`
-- done for app

CREATE TABLE `cv-images` (  `imageid` int(11) NOT NULL UNIQUE ,  `id` bigint(20) NOT NULL,  `image` varchar(100) NOT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `proofRead` tinyint(4) NOT NULL,  `proofReadDate` date NOT NULL,  `status` tinyint(4) NOT NULL,  PRIMARY KEY (`id`,`image`)) ;

-- --------------------------------------------------------

--
-- Table structure for table `cv-interests`
-- done for app

CREATE TABLE `cv-interests` (  `interestid` int(11) NOT NULL UNIQUE,  `id` bigint(20) NOT NULL,  `interest` varchar(150) NOT NULL,  `level` varchar(10) NOT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `proofRead` tinyint(4) NOT NULL,  `proofReadDate` date NOT NULL,  `status` tinyint(1) NOT NULL,  PRIMARY KEY (`id`,`interest`)) ;

-- --------------------------------------------------------

--
-- Table structure for table `cv-internship`
--

CREATE TABLE `cv-internship` (  `internshipid` int(11) NOT NULL UNIQUE ,  `workid` int(11) NOT NULL,  `organization` varchar(50) NOT NULL,  `id` bigint(20) NOT NULL,  `title` varchar(100) NOT NULL,  `designation` varchar(50) NOT NULL,
  `duration` varchar(10) NOT NULL,  `location` varchar(50) NOT NULL,  `description` text NOT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `proofRead` tinyint(4) NOT NULL,  `proofReadDate` date NOT NULL,
  `status` smallint(1) NOT NULL,  PRIMARY KEY (`organization`,`id`,`title`,`designation`));

-- --------------------------------------------------------

--
-- Table structure for table `cv-introduction`
-- done for app
CREATE TABLE `cv-introduction` (  `introid` int(11) NOT NULL UNIQUE,  `id` bigint(20) NOT NULL,  `introduction` text CHARACTER SET utf8 NOT NULL,  `title` varchar(255)   NOT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `proofRead` tinyint(4) NOT NULL,  `proofReadDate` date NOT NULL,  `status` smallint(1) NOT NULL,  PRIMARY KEY (`introid`)) ;

-- --------------------------------------------------------

--
-- Table structure for table `cv-languages`
-- done for app

CREATE TABLE `cv-languages` (  `langid` int(11) NOT NULL UNIQUE,  `id` bigint(20) NOT NULL,  `language` varchar(50) NOT NULL,  `readLanguage` tinyint(4) NOT NULL,  `writeLanguage` tinyint(4) NOT NULL,  `speakLanguage` tinyint(4) NOT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `proofRead` tinyint(4) NOT NULL,  `proofReadDate` date NOT NULL,  `status` tinyint(1) NOT NULL,  PRIMARY KEY (`id`,`language`,`status`));

-- --------------------------------------------------------

--
-- Table structure for table `cv-patent`
--done for app

CREATE TABLE `cv-patent` (  `patentid` int(11) NOT NULL UNIQUE ,  `id` bigint(20) NOT NULL,  `title` varchar(200) NOT NULL,  `patentOffice` varchar(200) NOT NULL,  `patentStatus` varchar(10) NOT NULL,  `patentApplication` varchar(100) NOT NULL,  `patentDate` varchar(10) NOT NULL,  `description` text NOT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `proofRead` tinyint(4) NOT NULL,  `proofReadDate` date NOT NULL,  `status` tinyint(1) NOT NULL,  PRIMARY KEY (`id`,`title`,`patentApplication`));

-- --------------------------------------------------------

--
-- Table structure for table `cv-POA`
--done for app

CREATE TABLE `cv-POA` (  `poaid` int(11) NOT NULL UNIQUE,  `id` bigint(20) NOT NULL,  `title` varchar(100) NOT NULL,  `description` text NOT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `proofRead` int(11) NOT NULL,  `proofReadDate` date NOT NULL,  `status` smallint(1) NOT NULL,
  PRIMARY KEY (`id`,`title`));

-- --------------------------------------------------------

--
-- Table structure for table `cv-preference`
--done for app

CREATE TABLE `cv-preference` (  `prefid` int(11) NOT NULL UNIQUE ,  `id` bigint(20) NOT NULL,  `passport` tinyint(1) DEFAULT NULL,  `passportDetails` varchar(100) NOT NULL,  `recommendations` tinyint(1) DEFAULT NULL,  `preferredLocation` varchar(50) NOT NULL,  `canRelocate` tinyint(4) NOT NULL,  `noticePeriod` archar(20) NOT NULL,  `canJoin` tinyint(4) NOT NULL,  `expectedCTC` varchar(100) NOT NULL,  `isNegotiate` tinyint(4) NOT NULL,  `declaration` tinyint(1) DEFAULT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `proofRead` tinyint(4) NOT NULL,  `proofReadDate` date NOT NULL,  `status` tinyint(1) NOT NULL,  PRIMARY KEY (`id`) );

-- --------------------------------------------------------

--
-- Table structure for table `cv-presentations`
--done for app

CREATE TABLE `cv-presentations` (`activityid` int(11) NOT NULL UNIQUE ,  `id` bigint(20) NOT NULL,  `title` varchar(200) NOT NULL,  `description` text NOT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `proofRead` tinyint(4) NOT NULL,  `proofReadDate` date NOT NULL,  `status` smallint(1) NOT NULL,  PRIMARY KEY (`id`,`title`)) ;

-- --------------------------------------------------------

--
-- Table structure for table `cv-professional`
-- done for app

CREATE TABLE `cv-professional` (  `professionalid` int(11) NOT NULL UNIQUE,  `id` bigint(20) NOT NULL,  `course` varchar(100) NOT NULL,  `organization` varchar(100) NOT NULL,  `university` varchar(100) NOT NULL,  `year` year(4) DEFAULT NULL,  `isPursuing` tinyint(4) DEFAULT NULL,  `grade` varchar(20) NOT NULL,  `score` varchar(20) NOT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `proofRead` tinyint(4) NOT NULL,  `proofReadDate` date NOT NULL,
  `status` tinyint(1) NOT NULL,  PRIMARY KEY (`id`,`course`,`organization`));

-- --------------------------------------------------------

--
-- Table structure for table `cv-project`
--done for app

CREATE TABLE `cv-project` (  `projectid` int(11) NOT NULL UNIQUE,  `workid` int(11) NOT NULL,  `organization` varchar(150) NOT NULL,  `id` bigint(20) NOT NULL,  `title` varchar(100) NOT NULL,  `designation` varchar(50) NOT NULL,  `duration` varchar(20) NOT NULL,  `location` varchar(50) NOT NULL,  `description` text NOT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `proofRead` tinyint(4) NOT NULL,  `proofReadDate` date NOT NULL,  `status` smallint(1) NOT NULL,
  PRIMARY KEY (`organization`,`id`,`title`));
-- --------------------------------------------------------

--
-- Table structure for table `cv-publications`
--  done for app

CREATE TABLE `cv-publications` (  `publishid` int(11) NOT NULL UNIQUE,  `id` bigint(20) NOT NULL,  `title` varchar(200) NOT NULL,  `category` varchar(100) NOT NULL,  `publisher` varchar(200) NOT NULL,  `publishDate` varchar(10) NOT NULL,  `description` text NOT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `proofRead` tinyint(4) NOT NULL,  `proofReadDate` date NOT NULL,  `status` tinyint(1) NOT NULL );

-- --------------------------------------------------------

--
-- Table structure for table `cv-publicprofile`
--done for app

CREATE TABLE `cv-publicprofile` (  `publicid` int(11) NOT NULL UNIQUE ,  `id` bigint(20) NOT NULL,  `dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `status` tinyint(1) NOT NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cv-resumedownload`
--done for app

CREATE TABLE `cv-resumedownload` (  `resumeid` int(11) NOT NULL ,
  `resume` varchar(150)  NOT NULL,  `profileID` int(11) NOT NULL,
  `ProfileSections` varchar(255)  NOT NULL,  `sectionsBreak` varchar(255)  NOT NULL,  `profileDesign` int(11) NOT NULL,  `profileSetting` int(11) NOT NULL,  `profileFont` int(11) NOT NULL,  `imageLink` varchar(200)  NOT NULL,  `workTimeFormat` tinyint(1) NOT NULL,  `fontSize` float NOT NULL,  `id` bigint(20) NOT NULL,  `isPublic` tinyint(4) NOT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `status` tinyint(4) NOT NULL,  PRIMARY KEY (`resumeid`));

-- --------------------------------------------------------

--
-- Table structure for table `cv-skills`
--done for app

CREATE TABLE `cv-skills` (  `skillid` int(11) NOT NULL UNIQUE ,  `id` bigint(20) NOT NULL,  `skill` varchar(100) NOT NULL,  `description` text NOT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   , `proofRead` tinyint(4) NOT NULL,  `proofReadDate` date NOT NULL,  `status` tinyint(1) NOT NULL,  PRIMARY KEY (`id`,`skill`,`status`)) ;
-- --------------------------------------------------------

--
-- Table structure for table `cv-technical`
--  done for app

CREATE TABLE `cv-technical` (  `technicalid` int(11) NOT NULL ,  `id` bigint(20) NOT NULL,  `technical` varchar(100) NOT NULL,  `type` varchar(100) NOT NULL,  `level` varchar(100) NOT NULL,  `description` text NOT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `proofRead` tinyint(4) NOT NULL,  `proofReadDate` date NOT NULL,  `status` tinyint(4) NOT NULL,  PRIMARY KEY (`id`,`technical`,`level`)) ;

-- --------------------------------------------------------

--
-- Table structure for table `cv-trainings`
--done for app

CREATE TABLE `cv-trainings` (  `trainingid` int(11) NOT NULL UNIQUE ,  `id` bigint(20) NOT NULL,  `training` varchar(100) NOT NULL, `description` text NOT NULL,  `number` int(11) NOT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `proofRead` tinyint(4) NOT NULL,  `proofReadDate` date NOT NULL,  `status` smallint(1) NOT NULL,  PRIMARY KEY (`id`,`training`));

-- --------------------------------------------------------

--
-- Table structure for table `cv-volunteer`
--done for app

CREATE TABLE `cv-volunteer` (  `volunteerid` int(11) NOT NULL UNIQUE,  `id` bigint(20) NOT NULL,  `organization` varchar(50) NOT NULL,  `cause` varchar(50) NOT NULL,  `role` varchar(50) NOT NULL,  `dateJoining` date DEFAULT NULL,  `dateLeaving` date DEFAULT NULL,  `present` tinyint(4) NOT NULL,  `description` text NOT NULL,  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'   ,  `proofRead` tinyint(4) NOT NULL,  `proofReadDate` date NOT NULL,  `status` tinyint(1) NOT NULL,  PRIMARY KEY (`id`,`organization`,`cause`));
-- --------------------------------------------------------

--
-- Table structure for table `cv-work`
-- done for app

CREATE TABLE `cv-work` (  `workid` int(11) NOT NULL ,  `id` bigint(20) NOT NULL,  `organization` varchar(100) NOT NULL,  `designation` varchar(100) NOT NULL,  `location` varchar(30) NOT NULL,  `dateJoined` date NOT NULL,  `dateResigned` date DEFAULT NULL,  `currentWorking` smallint(1) NOT NULL,  `workProfile` text NOT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `proofRead` tinyint(4) NOT NULL,  `proofReadDate` date NOT NULL,  `status` smallint(1) NOT NULL,  PRIMARY KEY (`id`,`organization`,`designation`,`dateJoined`));


-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `sn` int(11) NOT NULL ,
  `orderid` bigint(20) NOT NULL,
  `id` bigint(20) NOT NULL,
  `orderStatus` varchar(20)  NOT NULL,
  `platform` tinyint(4) NOT NULL,
  `platformid` bigint(20) NOT NULL,
  `paymentMode` varchar(50)  NOT NULL,
  `currency` varchar(10)  NOT NULL,
  `netAmount` varchar(10)  NOT NULL,
  `discountAmount` int(11) NOT NULL,
  `totalAmount` int(11) NOT NULL,
  `billing_name` varchar(100)  NOT NULL,
  `billing_tel` varchar(15)  NOT NULL,
  `billing_email` varchar(50)  NOT NULL,
  `billing_address` varchar(200)  NOT NULL,
  `billing_country` varchar(20)  NOT NULL,
  `billing_state` varchar(50)  NOT NULL,
  `billing_city` varchar(50)  NOT NULL,
  `billing_zip` varchar(10)  NOT NULL,
  `offer_type` varchar(10)  NOT NULL,
  `offer_code` varchar(10)  NOT NULL,
  `orderFor` varchar(20)  NOT NULL,
  `orderSection` varchar(10)  NOT NULL,
  `resumeid` bigint(20) NOT NULL,
  `design` int(11) NOT NULL,
  `transactionDate` date DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`orderid`,`orderStatus`),
  UNIQUE KEY `sn` (`sn`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci =1018 ;

-- --------------------------------------------------------

--
-- Table structure for table `resource-academic-projects`
--

CREATE TABLE `resource-academic-projects` (
  `keyid` int(11) NOT NULL ,
  `keyitem` varchar(100) NOT NULL,
  `keydescription` text NOT NULL,
  `used` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`keyid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 =5112241 ;

-- --------------------------------------------------------

--
-- Table structure for table `resource-achievements`
--

CREATE TABLE `resource-achievements` (
  `keyid` int(11) NOT NULL ,
  `keyitem` varchar(100) NOT NULL,
  `keydescription` text NOT NULL,
  `used` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`keyid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 =5111417 ;

-- --------------------------------------------------------

--
-- Table structure for table `resource-articles`
--

CREATE TABLE `resource-articles` (
  `articleid` int(11) NOT NULL ,
  `link` varchar(100) NOT NULL,
  `title` varchar(200) NOT NULL,
  `introduction` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `image` varchar(100) NOT NULL,
  `author` varchar(50) NOT NULL,
  `views` int(11) NOT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`articleid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 =8 ;

-- --------------------------------------------------------

--
-- Table structure for table `resource-assoicates`
--

CREATE TABLE `resource-assoicates` (
  `associateID` int(11) NOT NULL,
  `associateName` varchar(100) NOT NULL,
  `associateDesign` tinyint(4) NOT NULL,
  `associateSubscription` tinyint(4) NOT NULL,
  `associatePR` tinyint(4) NOT NULL,
  `associateSOnline` tinyint(4) NOT NULL,
  `associateSOffline` tinyint(4) NOT NULL,
  `associatePhoto` tinyint(4) NOT NULL,
  `associatePrint` tinyint(4) NOT NULL,
  `associatePrintQuantity` tinyint(4) NOT NULL,
  `associatePreSession` tinyint(4) NOT NULL,
  `associatePostSession` tinyint(4) NOT NULL,
  `associateImage` varchar(100) NOT NULL,
  `associateIntroduction` text NOT NULL,
  `associateCreated` datetime NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`associateID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `resource-bankData`
--

CREATE TABLE `resource-bankData` (
  `bankID` int(11) NOT NULL ,
  `bankHeading` varchar(255) NOT NULL,
  `bankContent` text NOT NULL,
  `bankLink` varchar(255) NOT NULL,
  `bankCategory` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`bankID`),
  UNIQUE KEY `bankLink` (`bankLink`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 =4 ;

-- --------------------------------------------------------

--
-- Table structure for table `resource-cause`
--

CREATE TABLE `resource-cause` (
  `causeid` int(11) NOT NULL ,
  `cause` varchar(50) NOT NULL,
  `status` binary(1) NOT NULL,
  PRIMARY KEY (`causeid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 =1 ;

-- --------------------------------------------------------

--
-- Table structure for table `resource-certificates`
--

CREATE TABLE `resource-certificates` (
  `keyid` int(11) NOT NULL ,
  `keyitem` varchar(100) NOT NULL,
  `keydescription` text NOT NULL,
  `used` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`keyid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 =5111027 ;

-- --------------------------------------------------------

--
-- Table structure for table `resource-co-curricular-activities`
--

CREATE TABLE `resource-co-curricular-activities` (
  `keyid` int(11) NOT NULL ,
  `keyitem` varchar(100) NOT NULL,
  `keydescription` text NOT NULL,
  `used` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`keyid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 =1 ;

-- --------------------------------------------------------

--
-- Table structure for table `resource-faqs`
--

CREATE TABLE `resource-faqs` (  `faqid` int(11) NOT NULL UNIQUE ,  `section` int(11) NOT NULL,  `faq` text  NOT NULL,  `dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `status` tinyint(4) NOT NULL,  PRIMARY KEY (`section`)) ;
-- --------------------------------------------------------

--
-- Table structure for table `resource-grade`
--

CREATE TABLE `resource-grade` (
  `id` int(11) NOT NULL ,
  `grade` varchar(20) NOT NULL,
  `status` binary(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 =1 ;

-- --------------------------------------------------------

--
-- Table structure for table `resource-interests`
--

CREATE TABLE `resource-interests` (
  `keyid` int(11) NOT NULL ,
  `keyitem` varchar(100) NOT NULL,
  `keydescription` text NOT NULL,
  `used` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`keyid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 =5111930 ;

-- --------------------------------------------------------

--
-- Table structure for table `resource-introduction`
--

CREATE TABLE `resource-introduction` (
  `keyid` int(11) NOT NULL ,
  `keyitem` varchar(255) NOT NULL,
  `keydescription` text NOT NULL,
  `used` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`keyid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 =5110314 ;

-- --------------------------------------------------------

--
-- Table structure for table `resource-location`
--

CREATE TABLE `resource-location` (
  `id` int(11) NOT NULL ,
  `location` varchar(30) NOT NULL,
  `status` binary(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 =1 ;

-- --------------------------------------------------------

--
-- Table structure for table `resource-notifications`
--

CREATE TABLE `resource-notifications` (
  `notifyid` int(11) NOT NULL ,
  `notifyLevel` int(11) NOT NULL,
  `notifyHeading` varchar(200)  NOT NULL,
  `notifyContent` text  NOT NULL,
  `notifyUserCategory` tinyint(4) NOT NULL,
  `notifyAuthor` varchar(100)  NOT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`notifyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci =1 ;

-- --------------------------------------------------------

--
-- Table structure for table `resource-profiledesign`
--

CREATE TABLE `resource-profiledesign` (  `designid` int(11) NOT NULL ,
  `designName` varchar(100)  NOT NULL,  `content` text  NOT NULL,
  `designPrice` int(11) NOT NULL,  `category` varchar(50)  NOT NULL,
  `isPrivate` tinyint(4) NOT NULL,  `sections` varchar(255)  NOT NULL,
  `isDownload` tinyint(11) NOT NULL,  `author` varchar(100)  NOT NULL,
  `rating` float NOT NULL,  `downloadTimes` int(11) NOT NULL,  `status` tinyint(4) NOT NULL,  PRIMARY KEY (`designid`)) ;

-- --------------------------------------------------------

--
-- Table structure for table `resource-profilefont`
--

CREATE TABLE `resource-profilefont` (  `fontid` int(11) NOT NULL ,`fontTypeName` varchar(100)  NOT NULL,  `fontType` varchar(200)  NOT NULL,  `fontSize` int(11) NOT NULL,  `appliedOn` text  NOT NULL,  `downloadTime` int(11) NOT NULL,  `status` tinyint(4) NOT NULL,  PRIMARY KEY (`fontid`));

-- --------------------------------------------------------

--
-- Table structure for table `resource-profilesetting`
--

CREATE TABLE `resource-profilesetting` (  `settingid` int(11) NOT NULL ,
  `name` varchar(100)  NOT NULL,  `content` text  NOT NULL,  `heading` varchar(10)  NOT NULL,  `color1` varchar(10)  DEFAULT NULL,  `color2` varchar(10)  DEFAULT NULL,  `color3` varchar(10)  DEFAULT NULL,  `color4` varchar(10)  DEFAULT NULL,  `downloadTimes` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,  PRIMARY KEY (`settingid`)) ;

-- --------------------------------------------------------

--
-- Table structure for table `resource-section`
--

CREATE TABLE `resource-section` (  `section` int(11) NOT NULL,
  `main` tinyint(4) NOT NULL,  `defaultSection` tinyint(4) NOT NULL,  `sectionContent` text NOT NULL,  `sectionContentApp` varchar(100) NOT NULL,  `sectionName` varchar(50) NOT NULL,  `sectionLink` varchar(100) NOT NULL,  `sectionTable` varchar(20) NOT NULL,  `status` smallint(6) NOT NULL,  PRIMARY KEY (`section`)) ;

-- --------------------------------------------------------

--
-- Table structure for table `resource-securityKeys`
--

CREATE TABLE `resource-securityKeys` (
  `secureID` int(11) NOT NULL ,
  `assignID` int(11) NOT NULL,
  `assignTo` varchar(150) NOT NULL,
  `securityVoucher` bigint(20) NOT NULL,
  `securityKey` varchar(19) NOT NULL,
  `design` int(11) NOT NULL,
  `timePeriod` int(11) NOT NULL,
  `message` text NOT NULL,
  `id` bigint(20) NOT NULL,
  `note` varchar(250) NOT NULL,
  `dateUpdated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'   ,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`securityVoucher`,`securityKey`),
  UNIQUE KEY `secureID` (`secureID`),
  UNIQUE KEY `securityKey` (`securityKey`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 =6536 ;

-- --------------------------------------------------------

--
-- Table structure for table `resource-service-request`
--

CREATE TABLE `resource-service-request` (
  `serviceid` int(11) NOT NULL ,
  `serviceType` int(11) NOT NULL,
  `id` bigint(20) NOT NULL,
  `userName` varchar(100)  NOT NULL,
  `userPhone` varchar(20)  NOT NULL,
  `userEmail` varchar(50)  NOT NULL,
  `service` text  NOT NULL,
  `isResolved` tinyint(4) NOT NULL,
  `dateResolved` datetime NOT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(4) NOT NULL,
  UNIQUE KEY `feedbackid` (`serviceid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci =12 ;

-- --------------------------------------------------------

--
-- Table structure for table `resource-skills`
--

CREATE TABLE `resource-skills` (
  `keyid` int(11) NOT NULL ,
  `keyitem` varchar(100) NOT NULL,
  `keydescription` text NOT NULL,
  `used` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`keyid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 =5111863 ;

-- --------------------------------------------------------

--
-- Table structure for table `resource-spoken-language`
--

CREATE TABLE `resource-spoken-language` (
  `keyid` int(11) NOT NULL ,
  `keyitem` varchar(100) NOT NULL,
  `keydescription` text NOT NULL,
  `used` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`keyid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 =511210 ;

-- --------------------------------------------------------

--
-- Table structure for table `resource-technical-knowledge`
--

CREATE TABLE `resource-technical-knowledge` (
  `keyid` int(11) NOT NULL ,
  `keyitem` varchar(100) NOT NULL,
  `keydescription` text NOT NULL,
  `used` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`keyid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 =5111417 ;

-- --------------------------------------------------------

--
-- Table structure for table `resource-tips`
--

CREATE TABLE `resource-tips` (  `tipid` int(11) NOT NULL UNIQUE,  `section` int(11) NOT NULL UNIQUE,  `tip` text  NOT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `status` tinyint(4) NOT NULL,  PRIMARY KEY (`section`)) ;

-- --------------------------------------------------------

--
-- Table structure for table `resource-training-conducted`
--

CREATE TABLE `resource-training-conducted` (
  `keyid` int(11) NOT NULL ,
  `keyitem` varchar(100) NOT NULL,
  `keydescription` text NOT NULL,
  `used` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`keyid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 =5110739 ;

-- --------------------------------------------------------

--
-- Table structure for table `storeActivity`
--

CREATE TABLE `storeActivity` (
  `activityID` int(11) NOT NULL ,
  `userID` bigint(20) NOT NULL,
  `ipAddress` varchar(50) NOT NULL,
  `currentPage` varchar(150) NOT NULL,
  `referer` varchar(150) NOT NULL,
  `dateTime` datetime NOT NULL,
  `dateTime_Server` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`activityID`),
  KEY `activityID` (`activityID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 =165248 ;

-- --------------------------------------------------------

--
-- Table structure for table `user-basic`
--

CREATE TABLE `user-basic` (
  `id` bigint(11) NOT NULL,
  `fullName` varchar(100) NOT NULL,
  `emailAddress` varchar(200) NOT NULL,
  `countryCode` int(4) NOT NULL,
  `phoneNumber` bigint(20) NOT NULL,
  `profileImageUrl` text NOT NULL,
  `publicProfile` int(11) NOT NULL,
  `publicProfileDesign` int(11) NOT NULL,
  `iconList` tinyint(4) NOT NULL,
  `showFAQ` tinyint(4) NOT NULL,
  `showKey` tinyint(4) NOT NULL,
  `showDatabase` tinyint(4) NOT NULL,
  `DND` tinyint(4) NOT NULL,
  `DNE` tinyint(4) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,
  `status` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_2` (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user-feedback`
--

CREATE TABLE `user-feedback` (
  `feedbackid` int(11) NOT NULL ,
  `id` bigint(20) NOT NULL,
  `userName` varchar(100)  NOT NULL,
  `userPhone` varchar(20)  NOT NULL,
  `userEmail` varchar(50)  NOT NULL,
  `feedback` text  NOT NULL,
  `isResolved` tinyint(4) NOT NULL,
  `dateResolved` datetime NOT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(4) NOT NULL,
  UNIQUE KEY `feedbackid` (`feedbackid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci =219 ;

-- --------------------------------------------------------

--
-- Table structure for table `user-notification`
--

CREATE TABLE `user-notification` (
  `notifyuserid` int(11) NOT NULL ,
  `id` bigint(20) NOT NULL,
  `notifyid` int(11) NOT NULL,
  `isView` tinyint(4) NOT NULL,
  `dateView` datetime NOT NULL,
  `dateSent` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`,`notifyid`),
  UNIQUE KEY `notifyuserid` (`notifyuserid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci =1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user-proofRead`
--

CREATE TABLE `user-proofRead` (
  `orderid` bigint(20) NOT NULL,
  `proofReport` text  NOT NULL,
  `accessGrant` tinyint(4) NOT NULL,
  `approved` tinyint(4) NOT NULL,
  `feedback` text  NOT NULL,
  `rating` float NOT NULL,
  `proofReadstatus` tinyint(4) NOT NULL,
  `id` bigint(20) NOT NULL,
  `resume` varchar(50)  NOT NULL,
  `snapshot` bigint(11) NOT NULL,
  `dateRequest` datetime NOT NULL,
  `dateCompleted` datetime NOT NULL,
  `dateUpdated` timestamp NULL DEFAULT CURRENT_TIMESTAMP   ,
  `proofReader` bigint(20) NOT NULL,
  `status` tinyint(4) NOT NULL,
  UNIQUE KEY `orderid` (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user-review`
--

CREATE TABLE `user-review` (
  `reviewID` int(11) NOT NULL ,
  `code` int(11) NOT NULL,
  `id` bigint(20) NOT NULL,
  `review` text NOT NULL,
  `rating` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`reviewID`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 =22 ;

-- --------------------------------------------------------

--
-- Table structure for table `user-subscription`
--

CREATE TABLE `user-subscription` (
  `orderid` bigint(20) NOT NULL,
  `id` bigint(20) NOT NULL,
  `design` int(11) NOT NULL,
  `activate` date NOT NULL,
  `expiry` date NOT NULL,
  `securityKey` varchar(19)  NOT NULL,
  `dateCreated` date NOT NULL,
  `dateUpdated` timestamp NULL DEFAULT CURRENT_TIMESTAMP   ,
  `status` tinyint(4) NOT NULL,
  UNIQUE KEY `orderid` (`orderid`),
  UNIQUE KEY `securityKey` (`securityKey`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `categoryid` int(11) NOT NULL,
  `affiliateID` int(11) NOT NULL,
  `referenceID` bigint(20) NOT NULL,
  `socialType` smallint(6) NOT NULL,
  `socialid` varchar(100) NOT NULL,
  `authKey` varchar(100) NOT NULL,
  `socialToken` varchar(200) NOT NULL,
  `username` varchar(100) NOT NULL,
  `userPassword` varchar(100) NOT NULL,
  `dateUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,
  `status` smallint(1) NOT NULL,
  PRIMARY KEY (`id`,`socialid`,`authKey`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userVoucherDetails`
--

CREATE TABLE `userVoucherDetails` (
  `sn` int(11) NOT NULL ,
  `id` bigint(20) NOT NULL,
  `userName` varchar(200) NOT NULL,
  `userEmail` varchar(200) NOT NULL,
  `userPhone` varchar(10) NOT NULL,
  `userInstitute` varchar(200) NOT NULL,
  `userLocation` varchar(50) NOT NULL,
  `userEducation` varchar(50) NOT NULL,
  `userPassYear` int(4) NOT NULL,
  `voucherSN` int(11) NOT NULL,
  `voucherCode` varchar(19) NOT NULL,
  `voucherDesign` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`sn`),
  UNIQUE KEY `voucherSN` (`voucherSN`,`voucherCode`),
  UNIQUE KEY `voucherCode` (`voucherCode`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 =2279 ;
