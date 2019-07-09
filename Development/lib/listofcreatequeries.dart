List<String> createQueries = [
       "CREATE TABLE `create-cvsection` (`sectionid` int(11) UNIQUE NOT NULL, `section` int(11) NOT NULL,  `id` bigint(20) NOT NULL,  `contentAdded` int(6) NOT NULL,  `contentStatus` int(11) NOT NULL,`dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,  `status` smallint(6) NOT NULL) ;",

       "CREATE TABLE `create-cvprofilesection` (`psid` int(11) PRIMARY KEY NOT NULL ,  `cvid` int(11) NOT NULL, `id` bigint(20) NOT NULL,  `section` int(11) , `subsection` text , `dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,  `status` tinyint(4) NOT NULL) ;",

       "CREATE TABLE `create-cvprofile` (  `cvid` bigint(20) NOT NULL UNIQUE,  `id` bigint(20) NOT NULL,  `profileName` varchar(100)   NOT NULL,  `sections` varchar(255)   NOT NULL,  `design` int(11) NOT NULL,  `font` int(11) NOT NULL,  `setting` int(11) NOT NULL,  `profilePicture` varchar(100)   NOT NULL,  `isPublic` tinyint(4) NOT NULL,  `progressReport` tinyint(4) NOT NULL,  `dateUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `status` smallint(6) NOT NULL,  PRIMARY KEY (`id`,`profileName`,`sections`,`status`));",

       "CREATE TABLE `create-clprofile` (  `clid` bigint(20) NOT NULL UNIQUE,  `cvid` int(11) NOT NULL,  `id` bigint(20) NOT NULL,  `design` int(11) NOT NULL,  `coverName` varchar(100)   NOT NULL,  `coverLetter` text   NOT NULL,  `dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `status` smallint(6) NOT NULL);",

       "CREATE TABLE `cv-academic-projects` ( `academicid` int(11) NOT NULL,  `id` bigint(20) NOT NULL, `refID` bigint(30), `title` varchar(100) NOT NULL,  `description` text NOT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,  `proofRead` int(11),  `proofReadDate` date ,  `status` smallint(1) NOT NULL);",

       "CREATE TABLE `cv-add-section` (  `addid` int(11) NOT NULL ,  `id` bigint(20) NOT NULL,`refID` bigint(30),  `heading` varchar(200) NOT NULL , `subHeading` text NOT NULL,`description` text NOT NULL,  `showAfter` int(11) NOT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `proofRead` tinyint(4) NOT NULL,`proofReadDate` date NOT NULL,  `status` tinyint(4) NOT NULL,  PRIMARY KEY (`addid`)) ;",

       "CREATE TABLE  `cv-achievements` (`achieveid` int(11) NOT NULL, `id` bigint(20) NOT NULL,`refID` bigint(30),`achievement` varchar(255) NOT NULL,  `year` year(4) NOT NULL,  `description` text NOT NULL,`created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,  `proofRead` tinyint(4) NOT NULL, `proofReadDate` date NOT NULL,`status` tinyint(1) NOT NULL);",

       "CREATE TABLE `cv-awards` (`awardid` int(11) UNIQUE NOT NULL ,  `id` bigint(20) NOT NULL, `refID` bigint(30), `title` varchar(100)   NOT NULL,  `organization` varchar(50)   NOT NULL,  `year` year(4) NOT NULL,  `description` mediumtext   NOT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `status` tinyint(1) NOT NULL,  `proofRead` tinyint(4) NOT NULL,`proofReadDate` date NOT NULL)  ;",

       "CREATE TABLE `cv-association` (`associationid` int(11) NOT NULL ,  `id` bigint(20) NOT NULL,`refID` bigint(30),  `organization` varchar(100) NOT NULL, `position` varchar(50) NOT NULL, `location` varchar(50) NOT NULL,`description` mediumtext NOT NULL,  `dateJoining` date NOT NULL,`dateLeaving` date DEFAULT NULL,`present` tinyint(4) NOT NULL,`created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,  `proofRead` tinyint(4) NOT NULL,  `proofReadDate` date NOT NULL,  `status` tinyint(1) NOT NULL, PRIMARY KEY (`id`,`organization`,`position`)); ",

       "CREATE TABLE `cv-basic-info` (  `id` bigint(20) NOT NULL, `refID` bigint(30), `cvFullName` varchar(100)   NOT NULL,  `nationality` varchar(50)   NOT NULL,  `gender` varchar(50)   NOT NULL,  `dateBirth` date DEFAULT NULL,  `maritalStatus` varchar(20)   NOT NULL,  `facebookLink` varchar(200)   NOT NULL,  `linkedinLink` varchar(200)   NOT NULL,  `twitterLink` varchar(200)   NOT NULL,  `blogLink` varchar(200)   NOT NULL,  `dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `proofRead` tinyint(4) NOT NULL,  `proofReadDate` date NOT NULL,  `status` smallint(6) NOT NULL,  PRIMARY KEY (`id`));",

       "CREATE TABLE `cv-certification` (  `certificateid` int(11) NOT NULL UNIQUE ,  `id` bigint(20) NOT NULL,`refID` bigint(30),  `certificate` varchar(100) NOT NULL,  `authority` varchar(150) NOT NULL,  `year` year(4) NOT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `proofRead` tinyint(4) NOT NULL,  `proofReadDate` date NOT NULL,  `status` tinyint(1) NOT NULL,  PRIMARY KEY (`id`,`certificate`,`authority`,`year`)  ) ;",

       "CREATE TABLE `cv-co-curricular-activities` (  `activityid` int(11) NOT NULL UNIQUE ,  `id` bigint(20) NOT NULL,`refID` bigint(30),  `title` varchar(100) NOT NULL,  `description` text NOT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `proofRead` tinyint(4) NOT NULL,  `proofReadDate` date NOT NULL,  `status` smallint(1) NOT NULL,  PRIMARY KEY (`id`,`title`)) ;",

       "CREATE TABLE `cv-contact` (  `id` bigint(20) NOT NULL, `refID` bigint(30), `phoneNumber` varchar(30) DEFAULT NULL,  `emailAddress` varchar(50) NOT NULL,  `location` varchar(50) NOT NULL,  `fullAddress` text NOT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `proofRead` tinyint(4) NOT NULL,  `proofReadDate` date NOT NULL,  `status` smallint(1) NOT NULL,  PRIMARY KEY (`id`)) ;",
      
       "CREATE TABLE `cv-cover` (  `coverid` int(11) NOT NULL , `userid` bigint(20) NOT NULL,  `cover` text NOT NULL,  `created` date NOT NULL,  `status` binary(1) NOT NULL,  PRIMARY KEY (`coverid`)) ;",

       "CREATE TABLE `cv-education` (  `eduid` int(11) NOT NULL ,  `id` bigint(20) NOT NULL, `refID` bigint(30), `category` varchar(10) NOT NULL,  `institute` varchar(100) NOT NULL,  `location` varchar(100) NOT NULL,  `university` varchar(100) NOT NULL,  `specialization` varchar(100) NOT NULL,  `grade` varchar(50) NOT NULL,  `score` varchar(50) NOT NULL,  `year` varchar(4) DEFAULT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `proofRead` tinyint(4) NOT NULL,  `proofReadDate` date NOT NULL,  `status` tinyint(1) NOT NULL,  PRIMARY KEY (`id`,`category`));",

       "CREATE TABLE `cv-images` (  `imageid` int(11) NOT NULL UNIQUE ,  `id` bigint(20) NOT NULL,`refID` bigint(30),  `image` varchar(100) NOT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `proofRead` tinyint(4) NOT NULL,  `proofReadDate` date NOT NULL,  `status` tinyint(4) NOT NULL,  PRIMARY KEY (`id`,`image`)) ;",

       "CREATE TABLE `cv-interests` (  `interestid` int(11) NOT NULL UNIQUE,  `id` bigint(20) NOT NULL,`refID` bigint(30),  `interest` varchar(150) NOT NULL,  `level` varchar(10) NOT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `proofRead` tinyint(4) NOT NULL,  `proofReadDate` date NOT NULL,  `status` tinyint(1) NOT NULL,  PRIMARY KEY (`id`,`interest`)) ;",

       "CREATE TABLE `cv-internship` (  `internshipid` int(11) NOT NULL UNIQUE ,  `workid` int(11) NOT NULL,  `organization` varchar(50) NOT NULL,  `id` bigint(20) NOT NULL, `refID` bigint(30), `title` varchar(100) NOT NULL,  `designation` varchar(50) NOT NULL,  `duration` varchar(10) NOT NULL,  `location` varchar(50) NOT NULL,  `description` text NOT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `proofRead` tinyint(4) NOT NULL,  `proofReadDate` date NOT NULL,  `status` smallint(1) NOT NULL,  PRIMARY KEY (`organization`,`id`,`title`,`designation`));",

       "CREATE TABLE `cv-introduction` (  `introid` int(11) NOT NULL UNIQUE,  `id` bigint(20) NOT NULL, `refID` bigint(30), `introduction` text NOT NULL,  `title` varchar(255)   NOT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `proofRead` tinyint(4) NOT NULL,  `proofReadDate` date NOT NULL,  `status` smallint(1) NOT NULL,  PRIMARY KEY (`introid`)) ;",

       "CREATE TABLE `cv-languages` (  `langid` int(11) NOT NULL UNIQUE,  `id` bigint(20) NOT NULL,  `refID` bigint(30),`language` varchar(50) NOT NULL,  `readLanguage` tinyint(4) NOT NULL,  `writeLanguage` tinyint(4) NOT NULL,  `speakLanguage` tinyint(4) NOT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `proofRead` tinyint(4) NOT NULL,  `proofReadDate` date NOT NULL,  `status` tinyint(1) NOT NULL,  PRIMARY KEY (`id`,`language`,`status`));",

       "CREATE TABLE `cv-patent` (  `patentid` int(11) NOT NULL UNIQUE ,  `id` bigint(20) NOT NULL, `refID` bigint(30), `title` varchar(200) NOT NULL,  `patentOffice` varchar(200) NOT NULL,  `patentStatus` varchar(10) NOT NULL,  `patentApplication` varchar(100) NOT NULL,  `patentDate` varchar(10) NOT NULL,  `description` text NOT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `proofRead` tinyint(4) NOT NULL,  `proofReadDate` date NOT NULL,  `status` tinyint(1) NOT NULL,  PRIMARY KEY (`id`,`title`,`patentApplication`));",

       "CREATE TABLE `cv-POA` (  `poaid` int(11) NOT NULL UNIQUE,  `id` bigint(20) NOT NULL,`refID` bigint(30),  `title` varchar(100) NOT NULL,  `description` text NOT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `proofRead` int(11) NOT NULL,  `proofReadDate` date NOT NULL,  `status` smallint(1) NOT NULL,PRIMARY KEY (`id`,`title`));",

       "CREATE TABLE `cv-preference` (  `prefid` int(11) NOT NULL UNIQUE ,  `id` bigint(20) NOT NULL,`refID` bigint(30),  `passport` tinyint(1) DEFAULT NULL,  `passportDetails` varchar(100) NOT NULL,  `recommendations` tinyint(1) DEFAULT NULL,  `preferredLocation` varchar(50) NOT NULL,  `canRelocate` tinyint(4) NOT NULL,  `noticePeriod` archar(20) NOT NULL,  `canJoin` tinyint(4) NOT NULL,  `expectedCTC` varchar(100) NOT NULL,  `isNegotiate` tinyint(4) NOT NULL,  `declaration` tinyint(1) DEFAULT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `proofRead` tinyint(4) NOT NULL,  `proofReadDate` date NOT NULL,  `status` tinyint(1) NOT NULL,  PRIMARY KEY (`id`) );",

       "CREATE TABLE `cv-presentations` (`activityid` int(11) NOT NULL UNIQUE ,  `id` bigint(20) NOT NULL,`refID` bigint(30),  `title` varchar(200) NOT NULL,  `description` text NOT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `proofRead` tinyint(4) NOT NULL,  `proofReadDate` date NOT NULL,  `status` smallint(1) NOT NULL,  PRIMARY KEY (`id`,`title`)) ;",

       "CREATE TABLE `cv-professional` (  `professionalid` int(11) NOT NULL UNIQUE,  `id` bigint(20) NOT NULL, `refID` bigint(30), `course` varchar(100) NOT NULL,  `organization` varchar(100) NOT NULL,  `university` varchar(100) NOT NULL,  `year` year(4) DEFAULT NULL,  `isPursuing` tinyint(4) DEFAULT NULL,  `grade` varchar(20) NOT NULL,  `score` varchar(20) NOT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `proofRead` tinyint(4) NOT NULL,  `proofReadDate` date NOT NULL,  `status` tinyint(1) NOT NULL,  PRIMARY KEY (`id`,`course`,`organization`));",

       "CREATE TABLE `cv-project` ( `refID` bigint(30), `projectid` int(11) NOT NULL UNIQUE,  `workid` int(11) NOT NULL,  `organization` varchar(150) NOT NULL,  `id` bigint(20) NOT NULL,  `title` varchar(100) NOT NULL,  `designation` varchar(50) NOT NULL,  `duration` varchar(20) NOT NULL,  `location` varchar(50) NOT NULL,  `description` text NOT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `proofRead` tinyint(4) NOT NULL,  `proofReadDate` date NOT NULL,  `status` smallint(1) NOT NULL,  PRIMARY KEY (`organization`,`id`,`title`));",

       "CREATE TABLE `cv-publications` ( `refID` bigint(30), `publishid` int(11) NOT NULL UNIQUE,  `id` bigint(20) NOT NULL,  `title` varchar(200) NOT NULL,  `category` varchar(100) NOT NULL,  `publisher` varchar(200) NOT NULL,  `publishDate` varchar(10) NOT NULL,  `description` text NOT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `proofRead` tinyint(4) NOT NULL,  `proofReadDate` date NOT NULL,  `status` tinyint(1) NOT NULL );",

       "CREATE TABLE `cv-publicprofile` (  `publicid` int(11) NOT NULL UNIQUE ,  `id` bigint(20) NOT NULL,  `dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `status` tinyint(1) NOT NULL);",
       
       "CREATE TABLE `cv-resumedownload` (  `resumeid` int(11) NOT NULL ,  `resume` varchar(150)  NOT NULL,  `profileID` int(11) NOT NULL,  `ProfileSections` varchar(255)  NOT NULL,  `sectionsBreak` varchar(255)  NOT NULL,  `profileDesign` int(11) NOT NULL,  `profileSetting` int(11) NOT NULL,  `profileFont` int(11) NOT NULL,  `imageLink` varchar(200)  NOT NULL,  `workTimeFormat` tinyint(1) NOT NULL,  `fontSize` float NOT NULL,  `id` bigint(20) NOT NULL,  `isPublic` tinyint(4) NOT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `status` tinyint(4) NOT NULL,  PRIMARY KEY (`resumeid`));",

       "CREATE TABLE `cv-skills` ( `refID` bigint(30), `skillid` int(11) NOT NULL UNIQUE ,  `id` bigint(20) NOT NULL,  `skill` varchar(100) NOT NULL,  `description` text NOT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   , `proofRead` tinyint(4) NOT NULL,  `proofReadDate` date NOT NULL,  `status` tinyint(1) NOT NULL,  PRIMARY KEY (`id`,`skill`,`status`)) ;",

       "CREATE TABLE `cv-technical` (  `refID` bigint(30),`technicalid` int(11) NOT NULL ,  `id` bigint(20) NOT NULL,  `technical` varchar(100) NOT NULL,  `type` varchar(100) NOT NULL,  `level` varchar(100) NOT NULL,  `description` text NOT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `proofRead` tinyint(4) NOT NULL,  `proofReadDate` date NOT NULL,  `status` tinyint(4) NOT NULL,  PRIMARY KEY (`id`,`technical`,`level`)) ;",

       "CREATE TABLE `cv-trainings` (  `refID` bigint(30),`trainingid` int(11) NOT NULL UNIQUE ,  `id` bigint(20) NOT NULL,  `training` varchar(100) NOT NULL, `description` text NOT NULL,  `number` int(11) NOT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `proofRead` tinyint(4) NOT NULL,  `proofReadDate` date NOT NULL,  `status` smallint(1) NOT NULL,  PRIMARY KEY (`id`,`training`));",

       "CREATE TABLE `cv-volunteer` ( `refID` bigint(30), `volunteerid` int(11) NOT NULL UNIQUE,  `id` bigint(20) NOT NULL,  `organization` varchar(50) NOT NULL,  `cause` varchar(50) NOT NULL,  `role` varchar(50) NOT NULL,  `dateJoining` date DEFAULT NULL,  `dateLeaving` date DEFAULT NULL,  `present` tinyint(4) NOT NULL,  `description` text NOT NULL,  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'   ,  `proofRead` tinyint(4) NOT NULL,  `proofReadDate` date NOT NULL,  `status` tinyint(1) NOT NULL,  PRIMARY KEY (`id`,`organization`,`cause`));",

       "CREATE TABLE `cv-work` ( `refID` bigint(30), `workid` int(11) NOT NULL ,  `id` bigint(20) NOT NULL,  `organization` varchar(100) NOT NULL,  `designation` varchar(100) NOT NULL,  `location` varchar(30) NOT NULL,  `dateJoined` date NOT NULL,  `dateResigned` date DEFAULT NULL,  `currentWorking` smallint(1) NOT NULL,  `workProfile` text NOT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `proofRead` tinyint(4) NOT NULL,  `proofReadDate` date NOT NULL,  `status` smallint(1) NOT NULL,  PRIMARY KEY (`id`,`organization`,`designation`,`dateJoined`));",

       "CREATE TABLE `user-subscription` (`orderid` bigint(20) NOT NULL UNIQUE,`id` bigint(20) NOT NULL UNIQUE,`design` int(11) NOT NULL,`activate` date NOT NULL,`expiry` date NOT NULL,`securityKey` varchar(19)  NOT NULL UNIQUE,`dateCreated` date NOT NULL,`dateUpdated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,`status` tinyint(4) NOT NULL);",

       "CREATE TABLE `users` (  `id` bigint(20) NOT NULL,`categoryid` int(11) NOT NULL UNIQUE,`affiliateID` int(11) NOT NULL,`referenceID` bigint(20) NOT NULL,`socialType` smallint(6) NOT NULL,`socialid` varchar(100) NOT NULL,`authKey` varchar(100) NOT NULL,`socialToken` varchar(200) NOT NULL,`username` varchar(100) NOT NULL UNIQUE,`userPassword` varchar(100) NOT NULL,`dateUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,`status` smallint(1) NOT NULL,PRIMARY KEY (`id`,`socialid`,`authKey`));",

       "CREATE TABLE `user-proofRead` (`orderid` bigint(20) NOT NULL UNIQUE,`proofReport` text  NOT NULL,`accessGrant` tinyint(4) NOT NULL,`approved` tinyint(4) NOT NULL,`feedback` text  NOT NULL,`rating` float NOT NULL,`proofReadstatus` tinyint(4) NOT NULL,`id` bigint(20) NOT NULL,`resume` varchar(50)  NOT NULL,`snapshot` bigint(11) NOT NULL,`dateRequest` datetime NOT NULL,`dateCompleted` datetime NOT NULL,`dateUpdated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,`proofReader` bigint(20) NOT NULL,`status` tinyint(4) NOT NULL);",

       "CREATE TABLE `user-basic` (`id` bigint(11) NOT NULL UNIQUE,`fullName` varchar(100) NOT NULL,`emailAddress` varchar(200) NOT NULL,`countryCode` int(4) NOT NULL,`phoneNumber` bigint(20) NOT NULL,`profileImageUrl` text NOT NULL,`publicProfile` int(11) NOT NULL,`publicProfileDesign` int(11) NOT NULL,`iconList` tinyint(4) NOT NULL,`showFAQ` tinyint(4) NOT NULL,`showKey` tinyint(4) NOT NULL,`showDatabase` tinyint(4) NOT NULL,`DND` tinyint(4) NOT NULL,`DNE` tinyint(4) NOT NULL,`dateCreated` datetime NOT NULL,`dateUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,`status` smallint(6) NOT NULL,PRIMARY KEY (`id`));",

       "CREATE TABLE `associate-subscription` (`orderid` bigint(20) NOT NULL UNIQUE,`id` bigint(20) NOT NULL,`design` int(11) NOT NULL,`activate` date NOT NULL,`expiry` date NOT NULL,`securityKey` varchar(19)  NOT NULL UNIQUE,`dateCreated` date NOT NULL,`dateUpdated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,`status` tinyint(4) NOT NULL,PRIMARY KEY (`id`,`design`));",

       "CREATE TABLE `associate-proofRead` (`orderid` bigint(20) NOT NULL UNIQUE,`proofReport` text NOT NULL,`approved` tinyint(4) NOT NULL,`rating` float NOT NULL,`proofReadstatus` tinyint(4) NOT NULL,`id` bigint(20) NOT NULL,`resume` bigint(11) NOT NULL,`dateRequest` datetime NOT NULL,`dateCompleted` datetime NOT NULL,`dateUpdated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,`proofReader` bigint(20) NOT NULL,`status` tinyint(4) NOT NULL);",

       "CREATE TABLE `resource-all` (  `keyid` int(11) NOT NULL,  `section` int(11) NOT NULL,  `keyitem` varchar(100) NOT NULL,  `keydescription` text NOT NULL,  `used` int(11) NOT NULL,  `status` tinyint(4) NOT NULL,  PRIMARY KEY (`keyid`)) "
      ];