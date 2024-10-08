-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th9 12, 2024 lúc 09:47 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `nhan_vien`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `depasrments`
--

CREATE TABLE `depasrments` (
  `department_id` int(11) NOT NULL,
  `department_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `depasrments`
--

INSERT INTO `depasrments` (`department_id`, `department_name`) VALUES
(1, 'HR'),
(2, 'Marketing'),
(3, 'IT'),
(4, 'Finance'),
(5, 'Operations');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `employeeroles`
--

CREATE TABLE `employeeroles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `employeeroles`
--

INSERT INTO `employeeroles` (`role_id`, `role_name`) VALUES
(1, 'Manager'),
(2, 'Employee'),
(3, 'Intern'),
(4, 'Analyst'),
(5, 'Director');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `employees`
--

CREATE TABLE `employees` (
  `employee_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `department_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `employees`
--

INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `department_id`, `role_id`) VALUES
(1, 'John', 'Doe', 1, 1),
(2, 'Jane', 'Smith', 2, 2),
(3, 'Michael', 'Johnson', 1, 3),
(4, 'Emily', 'Williams', 2, 1),
(5, 'David', 'Brown', 3, 3);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `depasrments`
--
ALTER TABLE `depasrments`
  ADD PRIMARY KEY (`department_id`);

--
-- Chỉ mục cho bảng `employeeroles`
--
ALTER TABLE `employeeroles`
  ADD PRIMARY KEY (`role_id`);

--
-- Chỉ mục cho bảng `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `department_id` (`department_id`,`role_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `depasrments` (`department_id`),
  ADD CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `employeeroles` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
