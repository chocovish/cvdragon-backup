List<String> createQueries = [
                "CREATE TABLE `create-cvsection` (`sectionid` int(11) UNIQUE NOT NULL, `section` int(11) NOT NULL,  `id` bigint(20) NOT NULL,  `contentAdded` int(6) NOT NULL,  `contentStatus` int(11) NOT NULL,`dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,  `status` smallint(6) NOT NULL) ;",

        "CREATE TABLE `create-cvprofilesection` (`psid` int(11) PRIMARY KEY NOT NULL ,  `cvid` int(11) NOT NULL, `id` bigint(20) NOT NULL,  `section` int(11) , `subsection` text , `dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,  `status` tinyint(4) NOT NULL) ;",

        "CREATE TABLE `cv-project` (`projectid` int(11) NOT NULL,  `workid` int(11) NOT NULL,  `organization` varchar(150) NOT NULL,  `id` bigint(20) NOT NULL,`title` varchar(100) NOT NULL,  `designation` varchar(50) NOT NULL,  `duration` varchar(20) NOT NULL,  `location` varchar(50) NOT NULL,  `description` text,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,  `proofRead` tinyint(4) NOT NULL,  `proofReadDate` date NOT NULL,  `status` smallint(1) NOT NULL) ;",
        
        "CREATE TABLE `cv-academic-projects` ( `academicid` int(11) NOT NULL,  `id` bigint(20) NOT NULL, `refID` bigint(30), `title` varchar(100) NOT NULL,  `description` text NOT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,  `proofRead` int(11),  `proofReadDate` date ,  `status` smallint(1) NOT NULL);",

        "CREATE TABLE  `cv-achievements` (`achieveid` int(11) NOT NULL, `id` bigint(20) NOT NULL,`achievement` varchar(255) NOT NULL,  `year` year(4) NOT NULL,  `description` text NOT NULL,`created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,  `proofRead` tinyint(4) NOT NULL, `proofReadDate` date NOT NULL,`status` tinyint(1) NOT NULL);",

        "CREATE TABLE `cv-awards` (`awardid` int(11) UNIQUE NOT NULL ,  `id` bigint(20) NOT NULL,  `title` varchar(100)   NOT NULL,  `organization` varchar(50)   NOT NULL,  `year` year(4) NOT NULL,  `description` mediumtext   NOT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `status` tinyint(1) NOT NULL,  `proofRead` tinyint(4) NOT NULL,`proofReadDate` date NOT NULL)  ;",

      "CREATE TABLE `cv-association` (`associationid` int(11) NOT NULL ,  `id` bigint(20) NOT NULL,  `organization` varchar(100) NOT NULL, `position` varchar(50) NOT NULL, `location` varchar(50) NOT NULL,`description` mediumtext NOT NULL,  `dateJoining` date NOT NULL,`dateLeaving` date DEFAULT NULL,`present` tinyint(4) NOT NULL,`created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,  `proofRead` tinyint(4) NOT NULL,  `proofReadDate` date NOT NULL,  `status` tinyint(1) NOT NULL, PRIMARY KEY (`id`,`organization`,`position`)); ",

      "CREATE TABLE `cv-basic-info` (  `id` bigint(20) NOT NULL,  `cvFullName` varchar(100)   NOT NULL,  `nationality` varchar(50)   NOT NULL,  `gender` varchar(50)   NOT NULL,  `dateBirth` date DEFAULT NULL,  `maritalStatus` varchar(20)   NOT NULL,  `facebookLink` varchar(200)   NOT NULL,  `linkedinLink` varchar(200)   NOT NULL,  `twitterLink` varchar(200)   NOT NULL,  `blogLink` varchar(200)   NOT NULL,  `dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `proofRead` tinyint(4) NOT NULL,  `proofReadDate` date NOT NULL,  `status` smallint(6) NOT NULL,  PRIMARY KEY (`id`));",

      "CREATE TABLE `cv-certification` (  `certificateid` int(11) NOT NULL UNIQUE ,  `id` bigint(20) NOT NULL,  `certificate` varchar(100) NOT NULL,  `authority` varchar(150) NOT NULL,  `year` year(4) NOT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `proofRead` tinyint(4) NOT NULL,  `proofReadDate` date NOT NULL,  `status` tinyint(1) NOT NULL,  PRIMARY KEY (`id`,`certificate`,`authority`,`year`)  ) ;",

      "CREATE TABLE `cv-co-curricular-activities` (  `activityid` int(11) NOT NULL UNIQUE ,  `id` bigint(20) NOT NULL,  `title` varchar(100) NOT NULL,  `description` text NOT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `proofRead` tinyint(4) NOT NULL,  `proofReadDate` date NOT NULL,  `status` smallint(1) NOT NULL,  PRIMARY KEY (`id`,`title`)) ;",

      "CREATE TABLE `cv-contact` (  `id` bigint(20) NOT NULL,  `phoneNumber` varchar(30) DEFAULT NULL,  `emailAddress` varchar(50) NOT NULL,  `location` varchar(50) NOT NULL,  `fullAddress` text NOT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `proofRead` tinyint(4) NOT NULL,  `proofReadDate` date NOT NULL,  `status` smallint(1) NOT NULL,  PRIMARY KEY (`id`)) ;",
      
      "CREATE TABLE `cv-cover` (  `coverid` int(11) NOT NULL , `userid` bigint(20) NOT NULL,  `cover` text NOT NULL,  `created` date NOT NULL,  `status` binary(1) NOT NULL,  PRIMARY KEY (`coverid`)) ;",

      "CREATE TABLE `cv-education` (  `eduid` int(11) NOT NULL ,  `id` bigint(20) NOT NULL,  `category` varchar(10) NOT NULL,  `institute` varchar(100) NOT NULL,  `location` varchar(100) NOT NULL,  `university` varchar(100) NOT NULL,  `specialization` varchar(100) NOT NULL,  `grade` varchar(50) NOT NULL,  `score` varchar(50) NOT NULL,  `year` varchar(4) DEFAULT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `proofRead` tinyint(4) NOT NULL,  `proofReadDate` date NOT NULL,  `status` tinyint(1) NOT NULL,  PRIMARY KEY (`id`,`category`));"

      "CREATE TABLE `cv-images` (  `imageid` int(11) NOT NULL UNIQUE ,  `id` bigint(20) NOT NULL,  `image` varchar(100) NOT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `proofRead` tinyint(4) NOT NULL,  `proofReadDate` date NOT NULL,  `status` tinyint(4) NOT NULL,  PRIMARY KEY (`id`,`image`)) ;",

      "CREATE TABLE `cv-interests` (  `interestid` int(11) NOT NULL UNIQUE,  `id` bigint(20) NOT NULL,  `interest` varchar(150) NOT NULL,  `level` varchar(10) NOT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `proofRead` tinyint(4) NOT NULL,  `proofReadDate` date NOT NULL,  `status` tinyint(1) NOT NULL,  PRIMARY KEY (`id`,`interest`)) ;",

      "CREATE TABLE `cv-internship` (  `internshipid` int(11) NOT NULL UNIQUE ,  `workid` int(11) NOT NULL,  `organization` varchar(50) NOT NULL,  `id` bigint(20) NOT NULL,  `title` varchar(100) NOT NULL,  `designation` varchar(50) NOT NULL,  `duration` varchar(10) NOT NULL,  `location` varchar(50) NOT NULL,  `description` text NOT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP   ,  `proofRead` tinyint(4) NOT NULL,  `proofReadDate` date NOT NULL,  `status` smallint(1) NOT NULL,  PRIMARY KEY (`organization`,`id`,`title`,`designation`));",

      ""

      ];