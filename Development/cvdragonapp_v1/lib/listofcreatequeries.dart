List<String> createQueries = [
        "CREATE TABLE `cv-academic-projects` ( `academicid` int(11) NOT NULL,  `id` bigint(20) NOT NULL, `refID` bigint(30), `title` varchar(100) NOT NULL,  `description` text NOT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,  `proofRead` int(11),  `proofReadDate` date ,  `status` smallint(1) NOT NULL);",

        "CREATE TABLE  `cv-achievements` (`achieveid` int(11) NOT NULL, `id` bigint(20) NOT NULL,`achievement` varchar(255) NOT NULL,  `year` year(4) NOT NULL,  `description` text NOT NULL,`created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,  `proofRead` tinyint(4) NOT NULL, `proofReadDate` date NOT NULL,`status` tinyint(1) NOT NULL);",

        "CREATE TABLE `create-cvsection` (`sectionid` int(11) UNIQUE NOT NULL, `section` int(11) NOT NULL,  `id` bigint(20) NOT NULL,  `contentAdded` int(6) NOT NULL,  `contentStatus` int(11) NOT NULL,`dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,  `status` smallint(6) NOT NULL) ;",

        "CREATE TABLE `create-cvprofilesection` (`psid` int(11) PRIMARY KEY NOT NULL ,  `cvid` int(11) NOT NULL, `id` bigint(20) NOT NULL,  `section` int(11) , `subsection` text , `dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,  `status` tinyint(4) NOT NULL) ;",

        "CREATE TABLE `cv-project` (`projectid` int(11) NOT NULL,  `workid` int(11) NOT NULL,  `organization` varchar(150) NOT NULL,  `id` bigint(20) NOT NULL,`title` varchar(100) NOT NULL,  `designation` varchar(50) NOT NULL,  `duration` varchar(20) NOT NULL,  `location` varchar(50) NOT NULL,  `description` text,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,  `proofRead` tinyint(4) NOT NULL,  `proofReadDate` date NOT NULL,  `status` smallint(1) NOT NULL) ;"
      ];