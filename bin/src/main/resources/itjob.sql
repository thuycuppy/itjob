-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 11, 2017 at 03:32 AM
-- Server version: 5.7.17-log
-- PHP Version: 5.6.30

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
  `password` varchar(60) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL,
  `avatar` varchar(255) DEFAULT 'img/avatar/default.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id`, `password`, `email`, `role`, `avatar`) VALUES
(1, '$2a$10$LOqePml/koRGsk2YAIOFI.1YNKZg7EsQ5BAIuYP1nWOyYRl21dlne', 'thuy@gmail.com', 'ROLE_CANDIDATE', 'img/avatar/default.jpg'),
(2, '$2y$10$FxstkW3S70UptzjSTZCMfOVBQbmp/z0..Fw0CX0df48nU2.noy4cC', 'anh@gmail.com', 'ROLE_CANDIDATE', 'img/avatar/default.jpg'),
(3, '$2y$10$FxstkW3S70UptzjSTZCMfOVBQbmp/z0..Fw0CX0df48nU2.noy4cC', 'abc@gmail.com', 'ROLE_COMPANY', 'img/avatar/default.jpg'),
(4, '$2y$10$FxstkW3S70UptzjSTZCMfOVBQbmp/z0..Fw0CX0df48nU2.noy4cC', 'tuan@gmail.com', 'ROLE_CANDIDATE', 'img/avatar/default.jpg'),
(5, '$2y$10$FxstkW3S70UptzjSTZCMfOVBQbmp/z0..Fw0CX0df48nU2.noy4cC', 'fpt@fsoft.com.vn', 'ROLE_COMPANY', 'img/avatar/default.jpg'),
(6, '$2y$10$FxstkW3S70UptzjSTZCMfOVBQbmp/z0..Fw0CX0df48nU2.noy4cC', 'cmc@gmail.com', 'ROLE_COMPANY', 'img/avatar/default.jpg'),
(7, '$2y$10$FxstkW3S70UptzjSTZCMfOVBQbmp/z0..Fw0CX0df48nU2.noy4cC', 'ominext@gmail.com', 'ROLE_COMPANY', 'img/avatar/default.jpg'),
(8, '$2y$10$FxstkW3S70UptzjSTZCMfOVBQbmp/z0..Fw0CX0df48nU2.noy4cC', 'lethuy@gmail.com', 'ROLE_CANDIDATE', 'img/avatar/default.jpg'),
(9, '$2y$10$FxstkW3S70UptzjSTZCMfOVBQbmp/z0..Fw0CX0df48nU2.noy4cC', 'tuananh@gmail.com', 'ROLE_CANDIDATE', 'img/avatar/default.jpg'),
(10, '$2y$10$FxstkW3S70UptzjSTZCMfOVBQbmp/z0..Fw0CX0df48nU2.noy4cC', 'cowell@gmail.com', 'ROLE_COMPANY', 'img/avatar/default.jpg'),
(12, '$2a$10$obGxAbxMMeUTUu51gZ.jlue5bL67j1AapTNBsOlf7FjAX40RF8B7q', 'thuy@gmail.com2', 'ROLE_CANDIDATE', 'img/avatar/default.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `candidate`
--

CREATE TABLE `candidate` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  `phone` varchar(255) NOT NULL,
  `sex` bit(1) NOT NULL,
  `address` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `resume` varchar(255) DEFAULT NULL,
  `account_id` int(11) UNSIGNED NOT NULL,
  `expected_location_id` int(11) UNSIGNED NOT NULL,
  `expected_jobtype_id` int(11) UNSIGNED NOT NULL,
  `experience_id` int(11) UNSIGNED NOT NULL,
  `expected_salary` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `candidateskill`
--

CREATE TABLE `candidateskill` (
  `candidate_id` int(11) UNSIGNED NOT NULL,
  `skill_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `companytype_id` int(11) UNSIGNED NOT NULL,
  `quantity` varchar(45) NOT NULL,
  `website` varchar(255) NOT NULL,
  `location_id` int(11) UNSIGNED NOT NULL,
  `address` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `account_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `companytype`
--

CREATE TABLE `companytype` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `companytype`
--

INSERT INTO `companytype` (`id`, `name`) VALUES
(1, 'outsourcing'),
(2, 'product');

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
  `salary` double NOT NULL,
  `location_id` int(11) UNSIGNED NOT NULL,
  `description` varchar(1000) NOT NULL,
  `requirement` varchar(1000) NOT NULL,
  `jobtype_id` int(11) UNSIGNED NOT NULL,
  `experience_id` int(11) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL,
  `company_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jobskill`
--

CREATE TABLE `jobskill` (
  `job_id` int(10) UNSIGNED NOT NULL,
  `skill_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jobtype`
--

CREATE TABLE `jobtype` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jobtype`
--

INSERT INTO `jobtype` (`id`, `name`) VALUES
(1, 'parttime'),
(2, 'fulltime'),
(3, 'internship'),
(4, 'remote');

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
-- Indexes for table `candidate`
--
ALTER TABLE `candidate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `account_id_2` (`account_id`),
  ADD KEY `expected_jobtype_id` (`expected_jobtype_id`),
  ADD KEY `expected_location_id` (`expected_location_id`),
  ADD KEY `experience_id` (`experience_id`);

--
-- Indexes for table `candidateskill`
--
ALTER TABLE `candidateskill`
  ADD PRIMARY KEY (`candidate_id`,`skill_id`),
  ADD KEY `candidate_id` (`candidate_id`),
  ADD KEY `candidateskill_skill_pk` (`skill_id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`),
  ADD KEY `companytype_id` (`companytype_id`),
  ADD KEY `location_id` (`location_id`),
  ADD KEY `account_id` (`account_id`);

--
-- Indexes for table `companytype`
--
ALTER TABLE `companytype`
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
  ADD KEY `type_id` (`jobtype_id`),
  ADD KEY `experience_id` (`experience_id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `jobskill`
--
ALTER TABLE `jobskill`
  ADD PRIMARY KEY (`job_id`,`skill_id`),
  ADD KEY `job_id` (`job_id`),
  ADD KEY `skill_id` (`skill_id`);

--
-- Indexes for table `jobtype`
--
ALTER TABLE `jobtype`
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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `candidate`
--
ALTER TABLE `candidate`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `companytype`
--
ALTER TABLE `companytype`
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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jobtype`
--
ALTER TABLE `jobtype`
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
-- Constraints for table `candidate`
--
ALTER TABLE `candidate`
  ADD CONSTRAINT `candidate_account_pk` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `candidate_expected_jobtype_pk` FOREIGN KEY (`expected_jobtype_id`) REFERENCES `jobtype` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `candidate_expected_location_pk` FOREIGN KEY (`expected_location_id`) REFERENCES `location` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `candidate_experience_pk` FOREIGN KEY (`experience_id`) REFERENCES `experience` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `candidateskill`
--
ALTER TABLE `candidateskill`
  ADD CONSTRAINT `candidateskill_candidate_pk` FOREIGN KEY (`candidate_id`) REFERENCES `candidate` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `candidateskill_skill_pk` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `company_account_pk` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `company_companytype_pk` FOREIGN KEY (`companytype_id`) REFERENCES `companytype` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `company_location_pk` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `job`
--
ALTER TABLE `job`
  ADD CONSTRAINT `job_company_pk` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `job_experience_pk` FOREIGN KEY (`experience_id`) REFERENCES `experience` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `job_jobtype_pk` FOREIGN KEY (`jobtype_id`) REFERENCES `location` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `job_location_pk` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `jobskill`
--
ALTER TABLE `jobskill`
  ADD CONSTRAINT `jobskill_job_pk` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `jobskill_skill_pk` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
