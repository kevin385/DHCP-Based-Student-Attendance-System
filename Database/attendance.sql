-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 07, 2019 at 06:32 AM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `attendance`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `admin_id` int(11) NOT NULL,
  `admin_user_name` varchar(100) NOT NULL,
  `admin_password` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`admin_id`, `admin_user_name`, `admin_password`) VALUES
(1, 'admin', '$2y$10$D74Zy1qMkATvmGRoVeq7hed4ajWof2aqDGnEaD3yPHABA.p.e7f4u');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_attendance`
--

CREATE TABLE `tbl_attendance` (
  `attendance_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `attendance_status` enum('Present','Absent') NOT NULL,
  `attendance_date` date NOT NULL,
  `teacher_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_attendance`
--

INSERT INTO `tbl_attendance` (`attendance_id`, `student_id`, `attendance_status`, `attendance_date`, `teacher_id`) VALUES
(1, 9, 'Present', '2019-11-01', 3),
(2, 10, 'Present', '2019-11-01', 3),
(3, 11, 'Absent', '2019-11-01', 3),
(4, 12, 'Present', '2019-11-01', 3),
(5, 5, 'Present', '2019-11-01', 2),
(6, 6, 'Present', '2019-11-01', 2),
(7, 7, 'Absent', '2019-11-01', 2),
(8, 8, 'Present', '2019-11-01', 2),
(9, 1, 'Present', '2019-11-01', 1),
(10, 2, 'Present', '2019-11-01', 1),
(11, 3, 'Absent', '2019-11-01', 1),
(12, 4, 'Absent', '2019-11-01', 1),
(13, 13, 'Absent', '2019-11-01', 4),
(14, 14, 'Present', '2019-11-01', 4),
(15, 15, 'Present', '2019-11-01', 4),
(16, 16, 'Present', '2019-11-01', 4),
(17, 1, 'Absent', '2019-11-02', 1),
(18, 2, 'Present', '2019-11-02', 1),
(19, 3, 'Present', '2019-11-02', 1),
(20, 4, 'Present', '2019-11-02', 1),
(21, 5, 'Present', '2019-11-02', 2),
(22, 6, 'Present', '2019-11-02', 2),
(23, 7, 'Present', '2019-11-02', 2),
(24, 8, 'Present', '2019-11-02', 2),
(215, 1, 'Present', '2019-11-03', 1),
(222, 2, 'Absent', '2019-11-03', 1),
(223, 3, 'Absent', '2019-11-03', 1),
(224, 4, 'Absent', '2019-11-03', 1),
(241, 1, 'Present', '2019-11-04', 1),
(242, 2, 'Absent', '2019-11-04', 1),
(243, 3, 'Absent', '2019-11-04', 1),
(244, 4, 'Absent', '2019-11-04', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_student`
--

CREATE TABLE `tbl_student` (
  `student_id` int(11) NOT NULL,
  `student_name` varchar(150) NOT NULL,
  `student_roll_number` int(11) NOT NULL,
  `student_dob` date NOT NULL,
  `student_subject_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_student`
--

INSERT INTO `tbl_student` (`student_id`, `student_name`, `student_roll_number`, `student_dob`, `student_subject_id`) VALUES
(1, 'Kevin Biju', 101, '1998-03-04', 1),
(2, 'Jaison Saji', 102, '1998-05-12', 1),
(3, 'Nischal Neupane', 103, '1998-09-21', 1),
(4, 'Ankit Bista', 104, '1998-06-13', 1),
(5, 'Kevin Biju', 101, '1998-03-04', 2),
(6, 'Jaison Saji', 102, '1998-05-12', 2),
(7, 'Nischal Neupane', 103, '1998-09-21', 2),
(8, 'Ankit Bista', 104, '1998-06-13', 2),
(9, 'Kevin Biju', 101, '1998-03-04', 3),
(10, 'Jaison Saji', 102, '1998-05-12', 3),
(11, 'Nischal Neupane', 103, '1998-09-21', 3),
(12, 'Ankit Bista', 104, '1998-06-13', 3),
(13, 'Kevin Biju', 101, '1998-03-04', 4),
(14, 'Jaison Saji', 102, '1998-05-12', 4),
(15, 'Nischal Neupane', 103, '1998-09-21', 4),
(16, 'Ankit Bista', 104, '1998-06-13', 4);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_studentlog`
--

CREATE TABLE `tbl_studentlog` (
  `student_id` int(11) NOT NULL,
  `student_emailid` varchar(120) NOT NULL,
  `student_password` varchar(120) NOT NULL,
  `student_ip` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_studentlog`
--

INSERT INTO `tbl_studentlog` (`student_id`, `student_emailid`, `student_password`, `student_ip`) VALUES
(101, 'student1@gmail.com', '$2y$10$s2MmR/Ml6ohRRrrFY0SRQ.vWohGvthVsKe59zgLOIvm3Qd0PzavD2', '192.168.43.209'),
(102, 'student2@gmail.com', '$2y$10$s2MmR/Ml6ohRRrrFY0SRQ.vWohGvthVsKe59zgLOIvm3Qd0PzavD2', '192.168.0.102'),
(103, 'student3@gmail.com', '$2y$10$s2MmR/Ml6ohRRrrFY0SRQ.vWohGvthVsKe59zgLOIvm3Qd0PzavD2', '192.168.0.100'),
(104, 'student4@gmail.com', '$2y$10$s2MmR/Ml6ohRRrrFY0SRQ.vWohGvthVsKe59zgLOIvm3Qd0PzavD2', '192.168.1.101');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_subject`
--

CREATE TABLE `tbl_subject` (
  `subject_id` int(11) NOT NULL,
  `subject_name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_subject`
--

INSERT INTO `tbl_subject` (`subject_id`, `subject_name`) VALUES
(1, 'M&E'),
(2, 'CN'),
(3, 'ATC'),
(4, 'DBMS');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_teacher`
--

CREATE TABLE `tbl_teacher` (
  `teacher_id` int(11) NOT NULL,
  `teacher_name` varchar(150) NOT NULL,
  `teacher_address` text NOT NULL,
  `teacher_emailid` varchar(100) NOT NULL,
  `teacher_password` varchar(100) NOT NULL,
  `teacher_qualification` varchar(100) NOT NULL,
  `teacher_doj` date NOT NULL,
  `teacher_image` varchar(100) NOT NULL,
  `teacher_subject_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_teacher`
--

INSERT INTO `tbl_teacher` (`teacher_id`, `teacher_name`, `teacher_address`, `teacher_emailid`, `teacher_password`, `teacher_qualification`, `teacher_doj`, `teacher_image`, `teacher_subject_id`) VALUES
(1, 'Peter Parker', '27, Paxal Tower, Opp Vani Vilas Hospital, K R Road, Bangalore', 'teacher1@gmail.com', '$2y$10$s2MmR/Ml6ohRRrrFY0SRQ.vWohGvthVsKe59zgLOIvm3Qd0PzavD2', 'B.Sc, B.Ed', '2018-08-14', '5cdd2ed638edc.jpg', 1),
(2, 'Anish Badal', '701, Sri Krishna Complex, Chickpet, Bangalore', 'teacher2@gmail.com', '$2y$10$s2MmR/Ml6ohRRrrFY0SRQ.vWohGvthVsKe59zgLOIvm3Qd0PzavD2', 'M.Sc, B. Ed', '2017-12-31', '5ce53488d50ec.jpg', 2),
(3, 'Opal Nadkarni', '780, New Tharagupet,  Bangalore', 'teacher3@gmail.com', '$2y$10$s2MmR/Ml6ohRRrrFY0SRQ.vWohGvthVsKe59zgLOIvm3Qd0PzavD2', 'B.Sc', '2019-02-14', '5cdd2f35be8fa.jpg', 3),
(4, 'Dushkriti Deol', '65 , Bhel Officers Lyt, Byrasandra, Bangalore', 'teacher4@gmail.com', '$2y$10$s2MmR/Ml6ohRRrrFY0SRQ.vWohGvthVsKe59zgLOIvm3Qd0PzavD2', 'M.Sc', '2018-04-18', '5cdd2f767568c.jpg', 4);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_teacherlog`
--

CREATE TABLE `tbl_teacherlog` (
  `teacher_id` int(11) NOT NULL,
  `login_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_teacherlog`
--

INSERT INTO `tbl_teacherlog` (`teacher_id`, `login_status`) VALUES
(2, 0),
(1, 0),
(3, 0),
(4, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `tbl_attendance`
--
ALTER TABLE `tbl_attendance`
  ADD PRIMARY KEY (`attendance_id`);

--
-- Indexes for table `tbl_student`
--
ALTER TABLE `tbl_student`
  ADD PRIMARY KEY (`student_id`);

--
-- Indexes for table `tbl_studentlog`
--
ALTER TABLE `tbl_studentlog`
  ADD PRIMARY KEY (`student_id`);

--
-- Indexes for table `tbl_subject`
--
ALTER TABLE `tbl_subject`
  ADD PRIMARY KEY (`subject_id`);

--
-- Indexes for table `tbl_teacher`
--
ALTER TABLE `tbl_teacher`
  ADD PRIMARY KEY (`teacher_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_attendance`
--
ALTER TABLE `tbl_attendance`
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=245;

--
-- AUTO_INCREMENT for table `tbl_student`
--
ALTER TABLE `tbl_student`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tbl_studentlog`
--
ALTER TABLE `tbl_studentlog`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `tbl_subject`
--
ALTER TABLE `tbl_subject`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_teacher`
--
ALTER TABLE `tbl_teacher`
  MODIFY `teacher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
