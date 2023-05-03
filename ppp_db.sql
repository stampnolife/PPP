-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 22, 2023 at 08:24 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ppp_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `mem_id` int(11) NOT NULL,
  `product_price` double NOT NULL,
  `cart_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `mem_id` int(11) NOT NULL COMMENT 'รหัสพนักงาน',
  `mem_fname` varchar(40) NOT NULL COMMENT 'ชื่อ',
  `mem_lname` varchar(40) NOT NULL COMMENT 'นามสกุล',
  `mem_email` varchar(80) NOT NULL COMMENT 'อีเมลล์',
  `mem_tel` varchar(10) NOT NULL COMMENT 'เบอร์',
  `mem_address` varchar(100) NOT NULL COMMENT 'ที่อยู่',
  `mem_username` varchar(30) NOT NULL COMMENT 'ชื่อผู้ใช้',
  `mem_password` varchar(60) NOT NULL COMMENT 'รหัสผ่าน',
  `mem_create_at` varchar(15) NOT NULL,
  `mem_status` enum('admin','personnel','user') NOT NULL DEFAULT 'user' COMMENT 'สถานะ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`mem_id`, `mem_fname`, `mem_lname`, `mem_email`, `mem_tel`, `mem_address`, `mem_username`, `mem_password`, `mem_create_at`, `mem_status`) VALUES
(1, 'admin', 'admin', 'admin@admin.com', '0894969999', '-', 'admin', '$2y$10$1Psji12WhAwbKQ8YYgIXL.CW8kRXKRt9fG6ORTWTU2hPZdeLBWQem', '2020-04-08', 'admin'),
(2, 'maiteng', 'naja', 'maiteng@gmail.com', '0123456789', 'ประเทศไทย ', 'maiteng', '$2y$10$I96gw3G0wNdeD2VQQd8fbONEyILhpL6jH1/LxV5GI6xYj..M2ur8O', '2023-02-24', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `new_id` int(11) NOT NULL COMMENT 'รหัสข่าว',
  `new_title` varchar(30) NOT NULL COMMENT 'หัวข้อข่าว',
  `new_image` varchar(100) NOT NULL COMMENT 'รูปข่าว',
  `new_date` date NOT NULL COMMENT 'วันที่ลงข่าว'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`new_id`, `new_title`, `new_image`, `new_date`) VALUES
(3, 'หน้าร้าน', '16769802574839.png', '2023-02-23');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `order_number` varchar(20) NOT NULL,
  `mem_id` int(11) NOT NULL,
  `address` varchar(100) NOT NULL,
  `order_shipping` varchar(2) NOT NULL,
  `price_total` int(8) NOT NULL,
  `order_status` int(1) NOT NULL,
  `order_date` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `order_detail_id` int(11) NOT NULL,
  `order_number` varchar(20) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `mem_id` int(11) NOT NULL,
  `payment_file` varchar(100) NOT NULL,
  `payment_price` varchar(10) NOT NULL,
  `payment_bank` varchar(50) NOT NULL,
  `payment_Detail` text NOT NULL,
  `payment_date` date NOT NULL,
  `payment_time` time NOT NULL,
  `payment_status` enum('ตรวจสอบ','ชำระเรียบร้อย','จัดส่งเรียบร้อย') NOT NULL DEFAULT 'ตรวจสอบ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(30) NOT NULL,
  `product_detail` varchar(500) NOT NULL,
  `product_image` varchar(50) NOT NULL,
  `product_code` varchar(10) NOT NULL,
  `product_price` double(10,2) NOT NULL,
  `product_tag` varchar(30) NOT NULL,
  `product_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_detail`, `product_image`, `product_code`, `product_price`, `product_tag`, `product_date`) VALUES
(1, 'กัญชาไฮบริด', 'กัญชาสายพันธุ์ไฮบริดไม่มีถิ่นกำเนิด แต่เกิดจากการผสมพันธุ์ข้ามสายพันธุ์ของนักปลูก เพื่อให้ได้กลิ่นใหม่ๆ และการออกฤทธิ์แบบใหม่ \r\nขนาดสูง 20-30cm', '16770803319453.jpg', 'PPP_001', 300.00, 'สายพันธุ์ต้นไม้อื่นๆ', '2023-02-25'),
(2, 'กระท่อม', 'ต้นกระท่อมสมัยโบราณมีการใช้ใบกระท่อมเพื่อรักษาการติดเชื้อในลำไส้ บรรเทาอาการปวดกล้ามเนื้อ ลดไข้ บรรเทาอาการไอและท้องร่วง โดยใช้ใบสดหรือใบแห้งนำมาเคี้ยว สูบ หรือชงเป็นน้ำชา นอกจากนี้ยังมีการใช้กระท่อมในกลุ่มของผู้ใช้แรงงานเพื่อกดความรู้สึกเมื่อยล้า 30-50 cm', '16770803613263.jpg', 'PPP_002', 200.00, 'สายพันธุ์ต้นไม้อื่นๆ', '2023-02-25'),
(3, 'ชมพู่เขียวอำพัน', 'ชมพู่เขียวอําพัน กิ่งปักชำพร้อมปลูก ลูกสีเขียว ลูกใหญ่ หวานอร่อย\r\nขนาดสูง 30-70cm รับประกันสายพันธุ์เเท้จากสวนโดยตรง', '16770962596354.jpg', 'PPP_003', 15.00, 'สายพันธุ์ต้นชมพู่', '2023-02-25'),
(4, 'ชมพู่ไถหนาน', 'ต้นชมพู่ไถหนาน ชมพู่ไถหนาน ลูกใหญ่มากๆ นํ้าหนักดี หวานกรอบอร่อย\r\nกิ่งพร้อมปลูก ขนาดสูง 40-60 cm', '16770965393487.jpg', 'PPP_004', 40.00, 'สายพันธุ์ต้นชมพู่', '2023-02-25'),
(5, 'ชมพู่ทับทิม', 'กิ่งพันธุ์ชมพู่ทับทิม พันธุ์ดีลูกยาวรับประกันพันธุ์จากสวนโดยตรง ขนาดสูง 30-50 cm', '16770966326521.jpg', 'PPP_005', 15.00, 'สายพันธุ์ต้นชมพู่', '2023-02-25'),
(6, 'ฝรั่งกิมจู', 'รสชาติหวานกรอบ หวาน อร่อย และให้ผลดก ลักษณะเด่นคือ ลูกใหญ่ ออกลูกดก ติดลูกเร็ว ปลูกดูแลบำรุง 6-7 เดือนก็สามารถเก็บผลผลิตได้ \r\nขนาดสูง 40-50 cm', '16770967622689.jpg', 'PPP_006', 15.00, 'สายพันธุ์ต้นฝรั่ง', '2023-02-25'),
(7, 'ฝรั่งหงส์เป่าสือ', 'ฝรั่งหงส์เป่าสือเป็นไม้ยืนต้นเป็นฝรั่งสายพันธุ์ใหม่ลักษณะผลลูกกลมแป้นเนื้อหรือไส้กลางเป็นสีแดงเมล็ดน้อยหอมเหมือนกลิ่นสตอเบอร์รี่\r\nขนาดสูง 40-80 cm', '16770969999298.jpg', 'PPP_007', 50.00, 'สายพันธุ์ต้นฝรั่ง', '2023-02-25'),
(8, 'มะพร้าวน้ำหอม', 'พันธุ์มะพร้าวน้ำหอมต้นเตี้ย​ แท้100%  ต้นแม่มีอายุมากกว่า20ปี​ มั่นใจได้อย่างแน่นอน มะพร้าวน้ำหอมมีลักษณะ​ ลูกกลมรีมีรสหอมหวาน​ กลิ่นคล้ายใบเตย​ เนื้อเยอะเหมาะกับที่ท้องตลาดต้องการ\r\nขนาดสูง 30-40 cm', '16770972624756.jpg', 'PPP_008', 30.00, 'สายพันธุ์ต้นมะพร้าว', '2023-02-25'),
(9, 'ส้มโอขาวน้ำผึ้ง', 'ส้มโอขาวน้ำผึ้งผลไร้เมล็ด เนื้อเป็นสีเหลืองอ่อน เนื้อไม่แฉะ กรอบหวาน หอมคล้ายกลิ่นน้ำผึ้ง จึงถูกตั้งชื่อตามรสชาติของเนื้อว่า “ส้มโอขาวน้ำผึ้ง” \r\nขนาดสูง80-95cm', '16770973840850.jpg', 'PPP_009', 50.00, 'สายพันธุ์ต้นส้มโอ', '2023-02-25'),
(10, 'ส้มโอทับทิมสยาม', 'ต้นส้มโอทับทิมสยามเสียบยอด พร้อมปลูก 3-4ปีได้รับผล ต้นอ้วนสมบูรณ์​ดี ใบใหญ่ ไม่ผิดหวัง \r\nขนาดต้นสูง 40-60 cm', '16770975275097.jpg', 'PPP_010', 70.00, 'สายพันธุ์ต้นส้มโอ', '2023-02-25'),
(11, 'พลูเขียว', ' พลูเขียว หรือบางท้องที่จะนิยมเรียกว่า พลูใบใหญ่ ใบมีขนาดใหญ่ป้อม ๆ แต่ใบบาง ลักษณะใบเหมือนใบโพธิ์ มีสีเขียวเข้มกว่าพันธุ์อื่น มีรสเผ็ดมาก \r\nขนาดสูง 20-30 cm', '16771545795184.jpg', 'PPP_011', 20.00, 'สายพันธุ์ต้นพลู', '2023-02-25'),
(12, 'พลูเหลือง', 'พลูเหลือง พลูทอง พลูกินหมาก เป็นที่นิยมของตลาด ใบหนา ทนโรค ต้นกล้าชำพร้อมปลูก  \r\nขนาดสูง 20-30 cm', '16771546863481.jpg', 'PPP_012', 25.00, 'สายพันธุ์ต้นพลู', '2023-02-25');

-- --------------------------------------------------------

--
-- Table structure for table `product_tag`
--

CREATE TABLE `product_tag` (
  `product_tag_id` int(11) NOT NULL,
  `product_tag_name` varchar(50) NOT NULL,
  `product_tag_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_tag`
--

INSERT INTO `product_tag` (`product_tag_id`, `product_tag_name`, `product_tag_date`) VALUES
(1, 'สายพันธุ์ต้นฝรั่ง', '2023-02-25'),
(2, 'สายพันธุ์ต้นชมพู่', '2023-02-25'),
(3, 'สายพันธุ์ต้นส้มโอ', '2023-02-25'),
(4, 'สายพันธุ์ต้นลำไย', '2023-02-25'),
(5, 'สายพันธุ์ต้นมะพร้าว', '2023-02-25'),
(6, 'สายพันธุ์ต้นพลู', '2023-02-23'),
(7, 'สายพันธุ์มะนาว', '2023-02-25'),
(8, 'สายพันธุ์ต้นมะม่วง', '2023-02-25'),
(9, 'สายพันธุ์ต้นไม้อื่นๆ', '2023-02-25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`mem_id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`new_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`order_detail_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_tag`
--
ALTER TABLE `product_tag`
  ADD PRIMARY KEY (`product_tag_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `mem_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสพนักงาน', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `new_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสข่าว', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `order_detail_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `product_tag`
--
ALTER TABLE `product_tag`
  MODIFY `product_tag_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
