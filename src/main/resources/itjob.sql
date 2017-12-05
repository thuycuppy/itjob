-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 05, 2017 at 05:44 PM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `itjob`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(60) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL,
  `avatar` varchar(255) DEFAULT 'img/avatar/default.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id`, `name`, `password`, `email`, `role`, `avatar`) VALUES
(1, 'Lê Thị Thủy', '$2a$10$LOqePml/koRGsk2YAIOFI.1YNKZg7EsQ5BAIuYP1nWOyYRl21dlne', 'thuy@gmail.com', 'ROLE_CANDIDATE', '/upload/avatar/default.jpg'),
(2, 'Lê Thị Thủy', '$2y$10$FxstkW3S70UptzjSTZCMfOVBQbmp/z0..Fw0CX0df48nU2.noy4cC', 'anh@gmail.com', 'ROLE_CANDIDATE', '/upload/avatar/default.jpg'),
(3, 'Lê Thị Thủy', '$2y$10$FxstkW3S70UptzjSTZCMfOVBQbmp/z0..Fw0CX0df48nU2.noy4cC', 'abc@gmail.com', 'ROLE_COMPANY', '/upload/avatar/default.jpg'),
(4, 'Lê Thị Thủy', '$2y$10$FxstkW3S70UptzjSTZCMfOVBQbmp/z0..Fw0CX0df48nU2.noy4cC', 'tuan@gmail.com', 'ROLE_CANDIDATE', '/upload/avatar/default.jpg'),
(5, 'Lê Thị Thủy', '$2y$10$FxstkW3S70UptzjSTZCMfOVBQbmp/z0..Fw0CX0df48nU2.noy4cC', 'fpt@fsoft.com.vn', 'ROLE_COMPANY', '/upload/avatar/default.jpg'),
(6, 'Lê Thị Thủy', '$2y$10$FxstkW3S70UptzjSTZCMfOVBQbmp/z0..Fw0CX0df48nU2.noy4cC', 'cmc@gmail.com', 'ROLE_COMPANY', '/upload/avatar/default.jpg'),
(7, 'Lê Thị Thủy', '$2y$10$FxstkW3S70UptzjSTZCMfOVBQbmp/z0..Fw0CX0df48nU2.noy4cC', 'ominext@gmail.com', 'ROLE_COMPANY', '/upload/avatar/default.jpg'),
(8, 'Lê Thị Thủy', '$2y$10$FxstkW3S70UptzjSTZCMfOVBQbmp/z0..Fw0CX0df48nU2.noy4cC', 'lethuy@gmail.com', 'ROLE_CANDIDATE', '/upload/avatar/default.jpg'),
(9, 'Lê Thị Thủy', '$2y$10$FxstkW3S70UptzjSTZCMfOVBQbmp/z0..Fw0CX0df48nU2.noy4cC', 'tuananh@gmail.com', 'ROLE_CANDIDATE', '/upload/avatar/default.jpg'),
(10, 'Lê Thị Thủy', '$2y$10$FxstkW3S70UptzjSTZCMfOVBQbmp/z0..Fw0CX0df48nU2.noy4cC', 'cowell@gmail.com', 'ROLE_COMPANY', '/upload/avatar/default.jpg'),
(12, 'Lê Thị Thủy', '$2a$10$obGxAbxMMeUTUu51gZ.jlue5bL67j1AapTNBsOlf7FjAX40RF8B7q', 'thuy@gmail.com2', 'ROLE_CANDIDATE', '/upload/avatar/default.jpg'),
(13, '123', '$2a$10$CihNhkRdAgYVvFiWHeyeBeM0ArrDln6mMlHkZ2P./AEU11vx3JEaG', '123@gmail.com', 'ROLE_CANDIDATE', '/upload/avatar/default.jpg'),
(14, '456', '$2a$10$uYjrSbW0DZ/lBwRXb4Mp.O/FcOqaj.KFdu3jcqq8ioTeErul.ozXO', '456@gmail.com', 'ROLE_CANDIDATE', '/upload/avatar/default.jpg'),
(15, '789', '$2a$10$BI.FPPiWxYsPMJ5SzfzkEuL4Xp/GRU1kjzb8vvwc9tsXF5X9VHzN2', '789@gmail.com', 'ROLE_CANDIDATE', '/upload/avatar/default.jpg'),
(16, '456', '$2a$10$Ax7XeUBNe5g0fwHLOPFDpee2xV1HlR3Q0TU2N3gjE8zwwnm1dKSiK', '123@gmail.com2', 'ROLE_CANDIDATE', '/upload/avatar/default.jpg'),
(17, 'khihieu', '$2a$10$xkxHHCkt9UK2.JQANrwp4OWuzjLPOajaiDcRQANiUf8LuC65ZZCfW', 'khihieu@gmail.com', 'ROLE_CANDIDATE', '/upload/avatar/default.jpg'),
(18, 'k6', '$2a$10$ltYl5W8S5PZfX90zUDyvQ.uUnlJkhaes96gRAQBhAbPOxWDzd/cG2', 'k6@gmail.com', 'ROLE_COMPANY', '/upload/logo/k6.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `application`
--

CREATE TABLE `application` (
  `id` int(10) UNSIGNED NOT NULL,
  `candidate_id` int(10) UNSIGNED NOT NULL,
  `job_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `candidate`
--

CREATE TABLE `candidate` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `phone` varchar(20) NOT NULL,
  `sex` bit(1) NOT NULL,
  `address` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `resume` varchar(255) DEFAULT NULL,
  `account_id` int(11) UNSIGNED NOT NULL,
  `expected_location_id` int(11) UNSIGNED DEFAULT NULL,
  `expected_job_type_id` int(11) UNSIGNED DEFAULT NULL,
  `experience_id` int(11) UNSIGNED DEFAULT NULL,
  `expected_salary` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `candidate`
--

INSERT INTO `candidate` (`id`, `name`, `dob`, `phone`, `sex`, `address`, `description`, `resume`, `account_id`, `expected_location_id`, `expected_job_type_id`, `experience_id`, `expected_salary`) VALUES
(1, 'Nguyễn Tuấn Anh', '1995-06-21', '0973075726', b'1', 'Hà Đông, Hà Nội', NULL, NULL, 2, 1, 2, 2, 500),
(2, '123', '2017-02-02', '123', b'0', '123', NULL, NULL, 13, NULL, NULL, NULL, 0),
(3, '456', '2017-09-08', '123', b'1', '123', NULL, NULL, 14, NULL, NULL, NULL, 0),
(4, '789', '2017-02-02', '123', b'1', '123', NULL, NULL, 15, NULL, NULL, NULL, 0),
(5, '456', '2017-02-02', '123', b'0', '123', NULL, NULL, 16, NULL, NULL, NULL, 0),
(6, 'khihieu', '2017-02-02', '123', b'0', '123', NULL, '/upload/resume/40511_161201410922BuiThiHue.pdf', 17, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `candidate_skill`
--

CREATE TABLE `candidate_skill` (
  `candidate_id` int(11) UNSIGNED NOT NULL,
  `skill_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `candidate_skill`
--

INSERT INTO `candidate_skill` (`candidate_id`, `skill_id`) VALUES
(1, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `company_type_id` int(11) UNSIGNED NOT NULL,
  `quantity` varchar(45) NOT NULL,
  `website` varchar(255) DEFAULT NULL,
  `location_id` int(11) UNSIGNED NOT NULL,
  `address` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `account_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id`, `name`, `company_type_id`, `quantity`, `website`, `location_id`, `address`, `logo`, `description`, `phone`, `account_id`) VALUES
(1, 'FPT Software', 1, '300+', 'www.fpt.com', 1, 'Cầu Giấy, Hà Nội', '/upload/logo/1.png', NULL, '0123456789', 1),
(2, 'Episerver', 1, '51-150', 'www.abc.com', 1, 'Đống Đa, Hà Nội', '/upload/logo/2.png', NULL, '0123456789', 1),
(3, 'Episerver', 1, '51-150', 'www.abc.com', 1, 'Đống Đa, Hà Nội', '/upload/logo/2.png', NULL, '0123456789', 1),
(4, 'Episerver', 1, '51-150', 'www.abc.com', 1, 'Đống Đa, Hà Nội', '/upload/logo/2.png', NULL, '0123456789', 1),
(5, 'Episerver', 1, '51-150', 'www.abc.com', 1, 'Đống Đa, Hà Nội', '/upload/logo/2.png', NULL, '0123456789', 1),
(6, 'Episerver', 1, '51-150', 'www.abc.com', 1, 'Đống Đa, Hà Nội', '/upload/logo/2.png', NULL, '0123456789', 1),
(7, 'Episerver', 1, '51-150', 'www.abc.com', 1, 'Đống Đa, Hà Nội', '/upload/logo/2.png', NULL, '0123456789', 1),
(8, 'Episerver', 1, '51-150', 'www.abc.com', 1, 'Đống Đa, Hà Nội', '/upload/logo/2.png', NULL, '0123456789', 1),
(9, 'Episerver', 1, '51-150', 'www.abc.com', 1, 'Đống Đa, Hà Nội', '/upload/logo/2.png', NULL, '0123456789', 1),
(10, 'Episerver', 1, '51-150', 'www.abc.com', 1, 'Đống Đa, Hà Nội', '/upload/logo/2.png', NULL, '0123456789', 1),
(11, 'k6', 1, '500', '12', 1, 'hà đông', '/upload/logo/k6.jpg', '', '123', 18);

-- --------------------------------------------------------

--
-- Table structure for table `company_type`
--

CREATE TABLE `company_type` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `company_type`
--

INSERT INTO `company_type` (`id`, `name`) VALUES
(1, 'Outsourcing'),
(2, 'Product');

-- --------------------------------------------------------

--
-- Table structure for table `experience`
--

CREATE TABLE `experience` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `experience`
--

INSERT INTO `experience` (`id`, `name`) VALUES
(1, 'fresher'),
(2, 'junior'),
(3, 'senior'),
(4, 'expert');

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

CREATE TABLE `job` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `salary` int(11) UNSIGNED NOT NULL,
  `location_id` int(11) UNSIGNED NOT NULL,
  `description` varchar(1000) NOT NULL,
  `requirement` varchar(1000) NOT NULL,
  `job_type_id` int(11) UNSIGNED NOT NULL,
  `experience_id` int(11) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL,
  `company_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `job`
--

INSERT INTO `job` (`id`, `title`, `salary`, `location_id`, `description`, `requirement`, `job_type_id`, `experience_id`, `created_at`, `company_id`) VALUES
(1, ' Full-stack Java Developer (MVC, SQL)', 500, 1, 'As a Java Developer, you will be responsible for working on enhanced features and a suite of campaign products. The role requires working with Email Marketing software, building up new features as well as maintaining the large running system.\r\n\r\nThis will include day to day work with MVC applications and services, from back-end to front-end development.', '    Excellent experience with the following technologies:\r\n        MVC (Model – View – Controller)\r\n        Spring, Struts framework\r\n        AJAX, JSON and Rest, SOAP\r\n        Html 5/CSS 3\r\n        JavaScript, jQuery\r\n        Java Core, J2SE\r\n        Hibernate and SQL/NoSQL Database\r\n        Elastic search\r\n\r\n    Familiar with Linux system\r\n    Demonstrated ability to develop innovative solutions to build good applications and services\r\n    Excellent problem-solving skills\r\n    Ability to study new things quickly\r\n    Ability to work on multiple projects and in team\r\n    Exposure to an Agile environment\r\n    Understands the value of commitments and puts 100% effort into them\r\n    Good written and verbal English communication skills', 1, 2, '2017-11-17 00:00:00', 2),
(2, 'Senior Java/J2EE Developer – Up to $1600', 1600, 1, '    Study customer’s requirement and framework, create design documents and coding. \r\n    Can communicate with client to make clear requirement/tasks \r\n    Identify software issues and devise solutions to these problems. \r\n    Report to Project Manager ', '    Bachelor degree in IT.\r\n    Proficient in English communication, can communicate directly with customer via emails, conference calls.\r\n    Have at least 03 years programming in J2EE technologies \r\n    Strong OOAD knowledge, Java core, design pattern. \r\n    Strong experience with Java/J2EE, spring framework, Hibernate, Database (SQL, Oracle). \r\n    Experience with Web Service (SOAP and RESTful). \r\n    Experience with application server Weblogic \r\n    Able to manage team from 5-10 persons. \r\n    Willing to go onsite when requested. ', 1, 3, '2017-11-17 00:00:00', 1),
(3, 'Senior Java/J2EE Developer – Up to $1600', 1600, 1, '    Study customer’s requirement and framework, create design documents and coding. \r\n    Can communicate with client to make clear requirement/tasks \r\n    Identify software issues and devise solutions to these problems. \r\n    Report to Project Manager ', '    Bachelor degree in IT.\r\n    Proficient in English communication, can communicate directly with customer via emails, conference calls.\r\n    Have at least 03 years programming in J2EE technologies \r\n    Strong OOAD knowledge, Java core, design pattern. \r\n    Strong experience with Java/J2EE, spring framework, Hibernate, Database (SQL, Oracle). \r\n    Experience with Web Service (SOAP and RESTful). \r\n    Experience with application server Weblogic \r\n    Able to manage team from 5-10 persons. \r\n    Willing to go onsite when requested. ', 1, 3, '2017-11-17 00:00:00', 1),
(4, 'Senior Java/J2EE Developer – Up to $1600', 1600, 1, '    Study customer’s requirement and framework, create design documents and coding. \r\n    Can communicate with client to make clear requirement/tasks \r\n    Identify software issues and devise solutions to these problems. \r\n    Report to Project Manager ', '    Bachelor degree in IT.\r\n    Proficient in English communication, can communicate directly with customer via emails, conference calls.\r\n    Have at least 03 years programming in J2EE technologies \r\n    Strong OOAD knowledge, Java core, design pattern. \r\n    Strong experience with Java/J2EE, spring framework, Hibernate, Database (SQL, Oracle). \r\n    Experience with Web Service (SOAP and RESTful). \r\n    Experience with application server Weblogic \r\n    Able to manage team from 5-10 persons. \r\n    Willing to go onsite when requested. ', 1, 3, '2017-11-17 00:00:00', 1),
(5, 'Senior Java/J2EE Developer – Up to $1600', 1600, 1, '    Study customer’s requirement and framework, create design documents and coding. \r\n    Can communicate with client to make clear requirement/tasks \r\n    Identify software issues and devise solutions to these problems. \r\n    Report to Project Manager ', '    Bachelor degree in IT.\r\n    Proficient in English communication, can communicate directly with customer via emails, conference calls.\r\n    Have at least 03 years programming in J2EE technologies \r\n    Strong OOAD knowledge, Java core, design pattern. \r\n    Strong experience with Java/J2EE, spring framework, Hibernate, Database (SQL, Oracle). \r\n    Experience with Web Service (SOAP and RESTful). \r\n    Experience with application server Weblogic \r\n    Able to manage team from 5-10 persons. \r\n    Willing to go onsite when requested. ', 1, 3, '2017-11-17 00:00:00', 1),
(6, 'Senior Java/J2EE Developer – Up to $1600', 1600, 1, '    Study customer’s requirement and framework, create design documents and coding. \r\n    Can communicate with client to make clear requirement/tasks \r\n    Identify software issues and devise solutions to these problems. \r\n    Report to Project Manager ', '    Bachelor degree in IT.\r\n    Proficient in English communication, can communicate directly with customer via emails, conference calls.\r\n    Have at least 03 years programming in J2EE technologies \r\n    Strong OOAD knowledge, Java core, design pattern. \r\n    Strong experience with Java/J2EE, spring framework, Hibernate, Database (SQL, Oracle). \r\n    Experience with Web Service (SOAP and RESTful). \r\n    Experience with application server Weblogic \r\n    Able to manage team from 5-10 persons. \r\n    Willing to go onsite when requested. ', 1, 3, '2017-11-17 00:00:00', 1),
(7, 'Senior Java/J2EE Developer – Up to $1600', 1600, 1, '    Study customer’s requirement and framework, create design documents and coding. \r\n    Can communicate with client to make clear requirement/tasks \r\n    Identify software issues and devise solutions to these problems. \r\n    Report to Project Manager ', '    Bachelor degree in IT.\r\n    Proficient in English communication, can communicate directly with customer via emails, conference calls.\r\n    Have at least 03 years programming in J2EE technologies \r\n    Strong OOAD knowledge, Java core, design pattern. \r\n    Strong experience with Java/J2EE, spring framework, Hibernate, Database (SQL, Oracle). \r\n    Experience with Web Service (SOAP and RESTful). \r\n    Experience with application server Weblogic \r\n    Able to manage team from 5-10 persons. \r\n    Willing to go onsite when requested. ', 1, 3, '2017-11-17 00:00:00', 1),
(8, 'Senior Java/J2EE Developer – Up to $1600', 1600, 1, '    Study customer’s requirement and framework, create design documents and coding. \r\n    Can communicate with client to make clear requirement/tasks \r\n    Identify software issues and devise solutions to these problems. \r\n    Report to Project Manager ', '    Bachelor degree in IT.\r\n    Proficient in English communication, can communicate directly with customer via emails, conference calls.\r\n    Have at least 03 years programming in J2EE technologies \r\n    Strong OOAD knowledge, Java core, design pattern. \r\n    Strong experience with Java/J2EE, spring framework, Hibernate, Database (SQL, Oracle). \r\n    Experience with Web Service (SOAP and RESTful). \r\n    Experience with application server Weblogic \r\n    Able to manage team from 5-10 persons. \r\n    Willing to go onsite when requested. ', 1, 3, '2017-11-17 00:00:00', 1),
(9, 'Senior Java/J2EE Developer – Up to $1600', 1600, 1, '    Study customer’s requirement and framework, create design documents and coding. \r\n    Can communicate with client to make clear requirement/tasks \r\n    Identify software issues and devise solutions to these problems. \r\n    Report to Project Manager ', '    Bachelor degree in IT.\r\n    Proficient in English communication, can communicate directly with customer via emails, conference calls.\r\n    Have at least 03 years programming in J2EE technologies \r\n    Strong OOAD knowledge, Java core, design pattern. \r\n    Strong experience with Java/J2EE, spring framework, Hibernate, Database (SQL, Oracle). \r\n    Experience with Web Service (SOAP and RESTful). \r\n    Experience with application server Weblogic \r\n    Able to manage team from 5-10 persons. \r\n    Willing to go onsite when requested. ', 1, 3, '2017-11-17 00:00:00', 1),
(10, 'Senior Java/J2EE Developer – Up to $1600', 1600, 1, '    Study customer’s requirement and framework, create design documents and coding. \r\n    Can communicate with client to make clear requirement/tasks \r\n    Identify software issues and devise solutions to these problems. \r\n    Report to Project Manager ', '    Bachelor degree in IT.\r\n    Proficient in English communication, can communicate directly with customer via emails, conference calls.\r\n    Have at least 03 years programming in J2EE technologies \r\n    Strong OOAD knowledge, Java core, design pattern. \r\n    Strong experience with Java/J2EE, spring framework, Hibernate, Database (SQL, Oracle). \r\n    Experience with Web Service (SOAP and RESTful). \r\n    Experience with application server Weblogic \r\n    Able to manage team from 5-10 persons. \r\n    Willing to go onsite when requested. ', 1, 3, '2017-11-17 00:00:00', 1),
(11, 'Senior Java/J2EE Developer – Up to $1600', 1600, 1, '    Study customer’s requirement and framework, create design documents and coding. \r\n    Can communicate with client to make clear requirement/tasks \r\n    Identify software issues and devise solutions to these problems. \r\n    Report to Project Manager ', '    Bachelor degree in IT.\r\n    Proficient in English communication, can communicate directly with customer via emails, conference calls.\r\n    Have at least 03 years programming in J2EE technologies \r\n    Strong OOAD knowledge, Java core, design pattern. \r\n    Strong experience with Java/J2EE, spring framework, Hibernate, Database (SQL, Oracle). \r\n    Experience with Web Service (SOAP and RESTful). \r\n    Experience with application server Weblogic \r\n    Able to manage team from 5-10 persons. \r\n    Willing to go onsite when requested. ', 1, 3, '2017-11-17 00:00:00', 1),
(12, 'Senior Java/J2EE Developer – Up to $1600', 1600, 1, '    Study customer’s requirement and framework, create design documents and coding. \r\n    Can communicate with client to make clear requirement/tasks \r\n    Identify software issues and devise solutions to these problems. \r\n    Report to Project Manager ', '    Bachelor degree in IT.\r\n    Proficient in English communication, can communicate directly with customer via emails, conference calls.\r\n    Have at least 03 years programming in J2EE technologies \r\n    Strong OOAD knowledge, Java core, design pattern. \r\n    Strong experience with Java/J2EE, spring framework, Hibernate, Database (SQL, Oracle). \r\n    Experience with Web Service (SOAP and RESTful). \r\n    Experience with application server Weblogic \r\n    Able to manage team from 5-10 persons. \r\n    Willing to go onsite when requested. ', 1, 3, '2017-11-17 00:00:00', 1),
(13, 'Senior Java/J2EE Developer – Up to $1600', 1600, 1, '    Study customer’s requirement and framework, create design documents and coding. \r\n    Can communicate with client to make clear requirement/tasks \r\n    Identify software issues and devise solutions to these problems. \r\n    Report to Project Manager ', '    Bachelor degree in IT.\r\n    Proficient in English communication, can communicate directly with customer via emails, conference calls.\r\n    Have at least 03 years programming in J2EE technologies \r\n    Strong OOAD knowledge, Java core, design pattern. \r\n    Strong experience with Java/J2EE, spring framework, Hibernate, Database (SQL, Oracle). \r\n    Experience with Web Service (SOAP and RESTful). \r\n    Experience with application server Weblogic \r\n    Able to manage team from 5-10 persons. \r\n    Willing to go onsite when requested. ', 1, 3, '2017-11-17 00:00:00', 1),
(14, 'Senior Java/J2EE Developer – Up to $1600', 1600, 1, '    Study customer’s requirement and framework, create design documents and coding. \r\n    Can communicate with client to make clear requirement/tasks \r\n    Identify software issues and devise solutions to these problems. \r\n    Report to Project Manager ', '    Bachelor degree in IT.\r\n    Proficient in English communication, can communicate directly with customer via emails, conference calls.\r\n    Have at least 03 years programming in J2EE technologies \r\n    Strong OOAD knowledge, Java core, design pattern. \r\n    Strong experience with Java/J2EE, spring framework, Hibernate, Database (SQL, Oracle). \r\n    Experience with Web Service (SOAP and RESTful). \r\n    Experience with application server Weblogic \r\n    Able to manage team from 5-10 persons. \r\n    Willing to go onsite when requested. ', 1, 3, '2017-11-17 00:00:00', 1),
(15, 'Senior Java/J2EE Developer – Up to $1600', 1600, 1, '    Study customer’s requirement and framework, create design documents and coding. \r\n    Can communicate with client to make clear requirement/tasks \r\n    Identify software issues and devise solutions to these problems. \r\n    Report to Project Manager ', '    Bachelor degree in IT.\r\n    Proficient in English communication, can communicate directly with customer via emails, conference calls.\r\n    Have at least 03 years programming in J2EE technologies \r\n    Strong OOAD knowledge, Java core, design pattern. \r\n    Strong experience with Java/J2EE, spring framework, Hibernate, Database (SQL, Oracle). \r\n    Experience with Web Service (SOAP and RESTful). \r\n    Experience with application server Weblogic \r\n    Able to manage team from 5-10 persons. \r\n    Willing to go onsite when requested. ', 1, 3, '2017-11-17 00:00:00', 1),
(16, 'Senior Java/J2EE Developer – Up to $1600', 1600, 1, '    Study customer’s requirement and framework, create design documents and coding. \r\n    Can communicate with client to make clear requirement/tasks \r\n    Identify software issues and devise solutions to these problems. \r\n    Report to Project Manager ', '    Bachelor degree in IT.\r\n    Proficient in English communication, can communicate directly with customer via emails, conference calls.\r\n    Have at least 03 years programming in J2EE technologies \r\n    Strong OOAD knowledge, Java core, design pattern. \r\n    Strong experience with Java/J2EE, spring framework, Hibernate, Database (SQL, Oracle). \r\n    Experience with Web Service (SOAP and RESTful). \r\n    Experience with application server Weblogic \r\n    Able to manage team from 5-10 persons. \r\n    Willing to go onsite when requested. ', 1, 3, '2017-11-17 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `job_skill`
--

CREATE TABLE `job_skill` (
  `job_id` int(10) UNSIGNED NOT NULL,
  `skill_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `job_skill`
--

INSERT INTO `job_skill` (`job_id`, `skill_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 1),
(4, 1),
(4, 2),
(5, 1),
(5, 2),
(6, 1),
(6, 2),
(7, 1),
(7, 2),
(8, 1),
(8, 2),
(9, 1),
(9, 2),
(10, 1),
(10, 2),
(11, 1),
(11, 2),
(12, 1),
(12, 2),
(13, 1),
(13, 2),
(14, 1),
(14, 2),
(15, 1),
(15, 2),
(16, 1),
(16, 2);

-- --------------------------------------------------------

--
-- Table structure for table `job_type`
--

CREATE TABLE `job_type` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `job_type`
--

INSERT INTO `job_type` (`id`, `name`) VALUES
(1, 'Parttime'),
(2, 'Fulltime'),
(3, 'Internship'),
(4, 'Remote');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`id`, `name`) VALUES
(1, 'Ha Noi'),
(2, 'Thanh pho Ho Chi Minh'),
(3, 'Hai Phong'),
(4, 'Thanh Hoa'),
(5, 'Da Nang'),
(6, 'Thai Nguyen'),
(7, 'Hue'),
(8, 'Thai Nguyen'),
(9, 'Bac Ninh'),
(10, 'Vinh');

-- --------------------------------------------------------

--
-- Table structure for table `skill`
--

CREATE TABLE `skill` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `skill`
--

INSERT INTO `skill` (`id`, `name`) VALUES
(1, 'Java'),
(2, 'JavaScript'),
(3, 'PHP'),
(4, 'Ruby'),
(5, 'C++'),
(6, 'C#'),
(7, 'C'),
(8, 'Android'),
(9, 'IOS'),
(10, 'Python');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `application`
--
ALTER TABLE `application`
  ADD PRIMARY KEY (`id`),
  ADD KEY `candidate_id` (`candidate_id`),
  ADD KEY `job_id` (`job_id`);

--
-- Indexes for table `candidate`
--
ALTER TABLE `candidate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `account_id_2` (`account_id`),
  ADD KEY `expected_jobtype_id` (`expected_job_type_id`),
  ADD KEY `expected_location_id` (`expected_location_id`),
  ADD KEY `experience_id` (`experience_id`);

--
-- Indexes for table `candidate_skill`
--
ALTER TABLE `candidate_skill`
  ADD PRIMARY KEY (`candidate_id`,`skill_id`),
  ADD KEY `candidate_id` (`candidate_id`),
  ADD KEY `candidateskill_skill_pk` (`skill_id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`),
  ADD KEY `companytype_id` (`company_type_id`),
  ADD KEY `location_id` (`location_id`),
  ADD KEY `account_id` (`account_id`);

--
-- Indexes for table `company_type`
--
ALTER TABLE `company_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `experience`
--
ALTER TABLE `experience`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`id`),
  ADD KEY `location_id` (`location_id`),
  ADD KEY `type_id` (`job_type_id`),
  ADD KEY `experience_id` (`experience_id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `job_skill`
--
ALTER TABLE `job_skill`
  ADD PRIMARY KEY (`job_id`,`skill_id`),
  ADD KEY `job_id` (`job_id`),
  ADD KEY `skill_id` (`skill_id`);

--
-- Indexes for table `job_type`
--
ALTER TABLE `job_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `skill`
--
ALTER TABLE `skill`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `application`
--
ALTER TABLE `application`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `candidate`
--
ALTER TABLE `candidate`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `company_type`
--
ALTER TABLE `company_type`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `experience`
--
ALTER TABLE `experience`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `job`
--
ALTER TABLE `job`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `job_type`
--
ALTER TABLE `job_type`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `skill`
--
ALTER TABLE `skill`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `application`
--
ALTER TABLE `application`
  ADD CONSTRAINT `application_candidate_pk` FOREIGN KEY (`candidate_id`) REFERENCES `candidate` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `application_job_pk` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `candidate`
--
ALTER TABLE `candidate`
  ADD CONSTRAINT `candidate_account_pk` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `candidate_expected_jobtype_pk` FOREIGN KEY (`expected_job_type_id`) REFERENCES `job_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `candidate_expected_location_pk` FOREIGN KEY (`expected_location_id`) REFERENCES `location` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `candidate_experience_pk` FOREIGN KEY (`experience_id`) REFERENCES `experience` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `candidate_skill`
--
ALTER TABLE `candidate_skill`
  ADD CONSTRAINT `candidateskill_candidate_pk` FOREIGN KEY (`candidate_id`) REFERENCES `candidate` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `candidateskill_skill_pk` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `company_account_pk` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `company_companytype_pk` FOREIGN KEY (`company_type_id`) REFERENCES `company_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `company_location_pk` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `job`
--
ALTER TABLE `job`
  ADD CONSTRAINT `job_company_pk` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `job_experience_pk` FOREIGN KEY (`experience_id`) REFERENCES `experience` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `job_jobtype_pk` FOREIGN KEY (`job_type_id`) REFERENCES `job_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `job_location_pk` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `job_skill`
--
ALTER TABLE `job_skill`
  ADD CONSTRAINT `jobskill_job_pk` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `jobskill_skill_pk` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
