-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 24, 2025 lúc 05:40 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `database`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(255) NOT NULL,
  `admin_name` varchar(128) NOT NULL,
  `admin_phone` varchar(20) NOT NULL,
  `admin_password` varchar(128) NOT NULL,
  `authority` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_name`, `admin_phone`, `admin_password`, `authority`) VALUES
(1, 'Phong', '0987123008', '$2y$10$iMcuq0ReAL72vKQNXuczUeLCNkpfJbdengs2DzQx7AcdTkqba8J/K', 1),
(2, 'Son Codew', '0356188976', '$2y$10$iMcuq0ReAL72vKQNXuczUeLCNkpfJbdengs2DzQx7AcdTkqba8J/K', 1),
(3, 'Trung', '0111111111', '$2y$10$iMcuq0ReAL72vKQNXuczUeLCNkpfJbdengs2DzQx7AcdTkqba8J/K', 1),
(4, 'Haicac', '0987987987', '$2y$10$iMcuq0ReAL72vKQNXuczUeLCNkpfJbdengs2DzQx7AcdTkqba8J/K', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brand`
--

CREATE TABLE `brand` (
  `brand_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `brand_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Đang đổ dữ liệu cho bảng `brand`
--

INSERT INTO `brand` (`brand_id`, `brand_name`) VALUES
('ACE', 'Acer'),
('MSI', 'MSI'),
('GIG', 'Gigabyte'),
('LEN', 'Lenovo'),
('LOG', 'Logitech'),
('HPC', 'HP'),
('CLM', 'Cooler Master'),
('INT', 'Intel'),
('AMD', 'AMD'),
('ASU', 'Asus'),
('SAM', 'Samsung'),
('XMI', 'Xiaomi'),
('NVD', 'NVIDIA'),
('PET', 'Pegatron'),
('HZH', 'Huananzhi'),
('STC', 'SSTC'),
('AOR', 'Aorus'),
('MOB', 'Mobo'),
('TGB', 'Tiger Black'),
('KSC', 'KingSpec'),
('KGB', 'KingBank'),
('BRV', 'Billion Reservoir'),
('TGR', 'TeamGroup'),
('ADA', 'Adata'),
('COL', 'Colorful'),
('KIT', 'Kingston'),
('SKH', 'SK Hynix'),
('SEA', 'Seagate'),
('VSP', 'VSP'),
('LGS', 'LG'),
('DEL', 'DELL'),
('DUA', 'DUAN'),
('CTR', 'Centaur'),
('SPM', 'SuperMicro'),
('TMR', 'THERMALRIGHT'),
('TPL', 'TP-Link'),
('TED', 'Tenda'),
('LBL', 'LB-Link'),
('HNT', 'Homa Neptune'),
('NEM', 'Newmen'),
('FUH', 'FUHLEN'),
('EDR', 'EDRA'),
('SDM', 'SoundMax'),
('FEN', 'FENDA'),
('LPP', 'LAPOP'),
('MRL', 'MICROLAP'),
('LRF', 'Leerfei'),
('NAV', 'N/A');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `build`
--

CREATE TABLE `build` (
  `user_id` int(128) NOT NULL,
  `product_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `user_id` int(128) NOT NULL,
  `product_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `cart`
--

INSERT INTO `cart` (`user_id`, `product_id`, `qty`) VALUES
(1, 'CAS02', 1),
(2, 'CAS01', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `category_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `category_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`category_id`, `category_name`) VALUES
('CPU', 'Vi xử lý'),
('VGA', 'Card đồ họa'),
('PSU', 'Nguồn'),
('RAM', 'RAM'),
('MOR', 'Màn hình'),
('HDD', 'HDD'),
('SSD', 'SSD'),
('COL', 'Tản nhiệt'),
('SPK', 'Loa'),
('MOU', 'Chuột'),
('KEY', 'Bàn phím'),
('PHK', 'Phụ kiện khác'),
('CAM', 'Camera'),
('MNC', 'Main máy tính'),
('PHO', 'Tai nghe'),
('ITT', 'Thiết bị mạng'),
('CAS', 'Case máy tính');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `transaction_id` int(255) NOT NULL,
  `order_id` int(255) NOT NULL,
  `product_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `amount` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `data` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `product_id` varchar(128) NOT NULL,
  `category_id` varchar(128) NOT NULL,
  `product_name` varchar(128) NOT NULL,
  `brand_id` varchar(128) NOT NULL,
  `price` int(15) NOT NULL DEFAULT 0,
  `description` text NOT NULL,
  `discount` int(11) NOT NULL,
  `image_link` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `date_first_available` int(11) NOT NULL DEFAULT 0,
  `saledate` date NOT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `sold` int(11) NOT NULL DEFAULT 0,
  `product_thongso` varchar(10000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`product_id`, `category_id`, `product_name`, `brand_id`, `price`, `description`, `discount`, `image_link`, `date_first_available`, `saledate`, `amount`, `sold`, `product_thongso`) VALUES
('CAS01', 'CAS', 'Vỏ Case Centaur Nova Trắng - Đen', 'CTR', 858000, 'Vỏ Case Centaur Nova Trắng - Đen là một vỏ case máy tính với thiết kế đẹp mắt, phối màu trắng và đen, mang lại vẻ ngoài hiện đại và sang trọng. Case này có khả năng tản nhiệt tốt, hỗ trợ lắp đặt nhiều linh kiện như card đồ họa, ổ cứng, và các bộ tản nhiệt hiệu suất cao. Thích hợp cho các cấu hình máy tính chơi game hoặc làm việc mạnh mẽ.', 0, '../uploads/case-centaur-nova-trang-den.jpg', 2023, '0000-00-00', 101, -6, 'Kích thước sản phẩm: 434 x 245 x 473 mm -Form Factor:ATX/MATX/ITX - Hỗ trợ bộ nguồn:ATX - Khoang ổ đĩa	1 x 2.5″\r\n     2 x 2.5″\r\n    ODD: None -    Chiều cao tối đa CPU Cooler	:  Support max CPU Cooler 160mm - Độ dài tối đa VGA:	    Support max VGA Card 420mm - Cổng I/O	:    USB 3.0 * 1 USB 2.0 * 1\r\n    HD AUDIO * 1 -   Hỗ trợ Fan Case	:   Right : 120mm * 3 -  Bottom : 120mm * 1 - Top : 120mm * 3 - Rear : 120mm * 1 -Water Cooling:	    120/240/280/360 Radiator -  Phụ kiện đi kèm:	    Ốc vít, chân ốc cố định Mainboard'),
('CAS02', 'CAS', 'Vỏ Case VSP Aquanaut AX4 | ATX Trắng', 'VSP', 858000, 'Vỏ Case VSP Aquanaut AX4 | ATX Trắng là một vỏ case máy tính dạng ATX với màu trắng thanh lịch, thiết kế không gian rộng rãi, dễ dàng lắp đặt các linh kiện máy tính như bo mạch chủ, card đồ họa và bộ tản nhiệt. Sản phẩm này cũng có khả năng tản nhiệt tốt, giúp duy trì hiệu suất làm việc ổn định.', 0, '../uploads/case-VSP_Aquanaut_AX4-ATX_white.webp', 2023, '0000-00-00', 101, -6, 'Mã hàng: VSP AX4 - Màu: Đen / Trắng - Chất liệu: Tempered glass, SPCC - Hỗ trợ Mainboard: ATX, M ATX, ITX - Cổng kết nối: 01*USB3.0/ 2*USB2.0/ HD Audio - Hỗ trợ ổ đĩa: 3.5” x2| 2.5” x 2 - Khe mở rộng: 7slots - Hỗ trợ VGA: 400mm - Hỗ trợ CPU Cooler: 175mm - Hai mặt kính cường lực - Hổ trợ gắn Fan:  SLIDE B:2x120MM/TOP:120MMx3 (140MMX2) (options), PSU COVER: 3 x120MM/ BACK: 1 x120MM(options), REAR: 120MM /TOP:240/280/360MM, Radiator: 120/240/360mm (Options)'),
('CAS03', 'CAS', 'Vỏ Case VSP Aquanaut AX4 | ATX Đen', 'VSP', 836000, 'Vỏ Case VSP Aquanaut AX4 | ATX Đen là một vỏ case máy tính dạng ATX với màu đen tinh tế, thiết kế tối giản và hiện đại. Vỏ case này cung cấp không gian rộng rãi để lắp đặt các linh kiện mạnh mẽ như card đồ họa, ổ cứng, và tản nhiệt. Nó cũng hỗ trợ tản nhiệt tốt và dễ dàng tối ưu hóa cho các hệ thống máy tính chơi game hoặc làm việc chuyên nghiệp.', 0, '../uploads/case-VSP_Aquanaut_AX4-ATX-black.jpg', 2023, '0000-00-00', 101, -6, 'Mã sản phẩm: AX4 - Màu sắc: Đen - Kiểu dáng: ATX Chassis - Chất liệu: Mặt trước &amp; mặt hông case: kính cường lực - Kích thước tiêu chuẩn Case để lắp PSU: ATX - Khay HDD &amp; SDD: 3.5\\&quot; HDD x2; 2.5\\&quot; SDD x2 - Thiết bị kết nối ngoại vi I/O: USB 3.0 x1; USB 2.0 x2; Audio x1/Mic x1 - Quạt tản nhiệt: - Số lượng quạt gắn thêm được vào tối đa: 9 quạt - Mặt hông B: 2x120mm/Phía trên: 120mmx3 (140mmx2) (Tùy chọn) - PSU COVER: 3x120mm/Phía sau: 1x120mm (Tùy chọn) - Kích thước Tản nhiệt nước có thể gắn vào: Phía sau 120mm/Phía trên: 240/280/360mm - Chiều cao tản nhiệt CPU tối đa: 175 mm - Chiều dài thẻ VGA tối đa: 400mm'),
('CAS04', 'CAS', 'Vỏ Case VSP V3 ĐEN + 3 FAN - FULL ATX', 'VSP', 572000, 'Vỏ Case VSP V3 Đen + 3 FAN - Full ATX là một vỏ case máy tính dạng Full ATX với màu đen, đi kèm 3 quạt tản nhiệt (fan) giúp tăng cường khả năng làm mát cho hệ thống. Thiết kế này tạo không gian rộng rãi để lắp đặt các linh kiện mạnh mẽ như card đồ họa, ổ cứng và bộ tản nhiệt. VSP V3 phù hợp cho các cấu hình máy tính gaming hoặc làm việc với hiệu suất cao.', 0, '../uploads/case-VSP_V3_black_3_FAN-FULL_ATX.jpg', 2023, '0000-00-00', 101, -6, 'Mã sản phẩm : V3 - Màu sắc : Đen - Kiểu dáng : Tower - Chất liệu : SPCC 0.4mm Black Matt - Kích thước tiêu chuẩn Case để lắp PSU : ATX - Khe cắm HDD &amp; SDD : 3.5\\&quot; HDD x2/2.5\\&quot; SSD x2 - Khe cắm mở rộng : 7 khe - Thiết bị kết nối ngoại vi I/O : USB3.0 x1/USB2.0 x2/MIC/Audio x1 - Quạt tản nhiệt - Mặt trước: 3x120 (Bao gồm) - Mặt trên: 3x120/2x140 (Tùy chọn) - Mặt sau: 1x120mm (tùy chọn) - Tản nhiệt nước: - Mặt trước: Lên đến 280mm (Tùy chọn) - Mặt trên: Lên đến 240mm (Tùy chọn) - Chiều cao tản nhiệt CPU tối đa : 160mm - Chiều dài thẻ VGA tối đa : 325mm - Hỗ trợ bo mạch chủ : ATX/M || ATX/ITX - Kích thước vỏ case - Sp: 370D x 200W X 440H mm - Bao bì: 493D x 254W x 428H mm'),
('CAS05', 'CAS', 'Vỏ Case VSP X2 Đen Mini', 'VSP', 396000, 'Vỏ Case VSP X2 Đen Mini là một vỏ case máy tính dạng Mini ATX với màu đen, thiết kế nhỏ gọn, phù hợp với những không gian làm việc hạn chế hoặc các cấu hình máy tính di động. Mặc dù có kích thước nhỏ, VSP X2 vẫn cung cấp đủ không gian để lắp đặt các linh kiện cơ bản và có khả năng tản nhiệt tốt, giúp đảm bảo hiệu suất của hệ thống.', 0, '../uploads/case-VSP_VSP_X2___en_Mini.webp', 2023, '0000-00-00', 101, -6, 'Model/Mã sản phẩm: X2 Aquanaut - Color/Màu sắc: Đen/Trắng - Chassis: Middle Tower - Material/Chất liệu: 0.5mm SPCC, Black (Feet 2.0) - PSU Foam Factor: ATX - HDD &amp; SDD Tray/Khay HDD &amp; SDD: 3.5″ HDD x1; 2.5″SSD x1 - Expansion slot/Khe cắm mở rộng: 4 Slot - I/O . Peripheral Connection Devices/Thiết bị kết nối ngoại vi I/O: USB3.0x1; USB2.0 x2 ; HD Audio - Cooling/quạt tản nhiệt: TOP: 12CMx2 (OPTIONAL) REAR: 12CMx1 (OPTIONAL) SLIDE B/FRONT: 12CMx 2 (OPTIONAL) BOTTON: 12CMx2 (OPTIONAL) - Max CPU Cooler Height/Chiều cao tản nhiệt CPU tối đa: 155mm - Max VGA card Leight/Chiều dài thẻ VGA tối đa: 340mm - Mainboard support/Hỗ trợ mainboard: MICRO-ATX/MINI-ATX - Case Size/Kích thước Case'),
('CAS06', 'CAS', 'Vỏ Case VSP X2 Trắng Mini', 'VSP', 418000, 'Vỏ Case VSP VSP X2 Trắng Mini là một vỏ case máy tính dạng Mini ATX với màu trắng, thiết kế nhỏ gọn, lý tưởng cho các hệ thống máy tính tiết kiệm không gian. Mặc dù có kích thước mini, vỏ case này vẫn hỗ trợ các linh kiện cơ bản và cung cấp khả năng tản nhiệt hợp lý, giúp duy trì hiệu suất ổn định cho máy tính.', 0, '../uploads/678d12915b23d_case-VSP_VSP_X2_Tr___ng_Mini.jpg', 2023, '2025-01-19', 101, -6, 'Màu sắc: Trắng - Kiểu dáng: Middle Tower - Chất liệu: 0.5mm SPCC - Kích thước tiêu chuẩn Case để lắp PSU: ATX - Khe HDD/SSD: 3.5\\\" HDD x1; 2.5\\\"SSD x1 - Thiết bị kết nối ngoại vi I/O: USB3.0x1; usb2.0 X2; HD Audio - Quạt tản nhiệt: Số lượng quạt gắn thêm được vào tối đa: 6 quạt - Trước: 2x120mm (Tùy chọn) - Trên: 2x120mm (Tùy chọn) - Sau: 1x120mm (Tùy chọn) - Dưới: 2x120mm (Tùy chọn) - Tản nhiệt nước có thể gắn vào - Phía trước 240mm - Phía trên: 120mm - Chiều cao tản nhiệt CPU tối đa: 155mm - Chiều dài thẻ VGA tối đa: 340mm'),
('CAS07', 'CAS', 'Vỏ Case VSP ES1 ( có sẵn 4 bảng led ) đủ 3 màu - Trắng - Hồng', 'VSP', 858000, 'Vỏ Case VSP ES1 là một vỏ case máy tính có thiết kế đặc biệt với 4 bảng LED có thể phát sáng với đủ 3 màu mang lại sự nổi bật và phong cách cho hệ thống của bạn. Vỏ case này hỗ trợ các linh kiện máy tính tiêu chuẩn, có không gian rộng rãi và khả năng tản nhiệt tốt, phù hợp cho các cấu hình máy tính chơi game hoặc làm việc.', 0, 'uploads/case-VSP_ES1___4_leds_________3_m__u_-_tr___ng-h___ng.jpg', 2023, '2025-01-15', 101, -6, 'Màu sắc: Hồng/Trắng/Đen - Kiểu dáng: Micro super gaming case - Chất liệu: Tấm kim loại 1.0 -1.2mm + Kính cường lực 4.0mm - Kích thước tiêu chuẩn Case để lắp PSU: ATX - Khe cắm HDD & SDD: 3.5\'\' HDD x 2; 2.5\'\' SSDx2 - Thiết bị kết nối ngoại vi I/O: USB2.0 x2; USB3.0 x1; HD audio - Quạt tản nhiệt: Tản nhiệt nước: Phía trên 240mm/Phía sau 120mm - Mặt trước: 2x12cm - Mặt trên: 2x12cm - Mặt sau: 2x12cm/14cm - Chiều cao tản nhiệt CPU tối đa:165mm - Chiều dài thẻ VGA tối đa: 275mm\r\n'),
('CAS08', 'CAS', 'Vỏ Case VSP Xstar Robot (Có Sẵn 4 Bảng LED + 3 Fan LED + Hub Khiển)', 'VSP', 869000, 'Vỏ Case VSP Xstar Robot là một vỏ case máy tính có thiết kế nổi bật với 4 bảng LED cùng 3 quạt LED tích hợp, mang đến hiệu ứng ánh sáng đẹp mắt và hỗ trợ hệ thống làm mát hiệu quả. Vỏ case này còn được trang bị hub điều khiển, giúp người dùng dễ dàng điều chỉnh ánh sáng và tốc độ quạt. Thiết kế này rất phù hợp cho các máy tính gaming với khả năng tùy chỉnh ánh sáng và tản nhiệt tốt.', 0, 'uploads/case-Xstar_Robot__C___S___n_4_B___ng_LED___3_Fan_LED___Hub_Khi___n_.jpg', 2023, '2025-01-15', 101, -6, 'Model:  XSTAR\r\n\r\n-Chassis:Micro super gaming case\r\n\r\n-Vật liệu:Metal panel 1.0 > 1.2mm + Tempered class 4.0mm\r\n\r\n-PSU Foam Factor: MATX\r\n\r\n-Trọng lượng:5.4Kg/6.5Kg\r\n\r\n-Khay HDD/SSD:3.5” HDD x 1; 2.5” SSDx2\r\n\r\n-Khe mở rộng:4 slot\r\n\r\n-Thiết bị kết nối ngoại vi I/O:USB2.0 x2; USB3.0 x1; HD audio\r\n\r\n-Mainboard support:M-ATX/Mini ITX\r\n\r\n-Kích thước Case: 575 x 245 x 475 mm (LxWxH)'),
('CAS09', 'CAS', 'Vỏ Case VSP Office V2876', 'VSP', 176000, 'Vỏ Case VSP Office V2876 là một vỏ case máy tính được thiết kế dành cho môi trường văn phòng, với kiểu dáng đơn giản và gọn gàng. Vỏ case này thường có không gian rộng rãi, hỗ trợ các linh kiện máy tính cơ bản, dễ dàng lắp đặt và bảo trì. Thiết kế của VSP Office V2876 mang lại sự thuận tiện cho người sử dụng trong các công việc hàng ngày.', 0, 'uploads/case-VSP-office-V2876.jpg', 2023, '2025-01-15', 101, -6, 'Màu sắc: Đen - Kiểu dáng: M-Tower - Chất liệu: Thép 0.35mm SGCC với lớp phủ màu đen - Kích thước tiêu chuẩn Case để lắp PSU: ATX - Khe cắm HDD & SSD: 1* HDD 2* SSD - Thiết bị kết nối ngoại vi I/O: USB 2.1x2, HD audio - Quạt tản nhiệt: Mặt sau 8cm và mặt phải 12cm (Tùy chọn) - Chiều cao tản nhiệt CPU tối đa: 145mm - Chiều dài thẻ VGA tối đa: 225mm\r\n'),
('CAS10', 'CAS', 'Vỏ Case VSP V3 - 604 - ĐEN mặt meka trong full ATX', 'VSP', 253000, 'Vỏ Case VSP V3 - 604 - Đen mặt Meka trong Full ATX là một vỏ case máy tính dạng Full ATX với thiết kế mặt trước meka trong suốt giúp người dùng có thể nhìn thấy bên trong máy tính, tạo điểm nhấn cho hệ thống. Vỏ case này cung cấp không gian rộng rãi cho các linh kiện và hỗ trợ các quạt tản nhiệt hiệu quả, giúp duy trì hiệu suất máy tính ổn định. Với thiết kế hiện đại và tính năng thuận tiện, đây là lựa chọn lý tưởng cho những ai cần một vỏ case đơn giản nhưng hiệu quả.', 0, 'uploads/case-VSP_V3_-_604_-___EN_m___t_meka_trong_full_ATX.jpg', 2023, '2025-01-15', 101, -6, 'Màu sắc: Đen - Kiểu dáng: Tower - Chất liệu: SPCC 0.4mm, Black interior - Kích thước tiêu chuẩn Case để lắp PSU: ATX - Khe cắm HDD & SDD: 5.25\" EXT. x2/ hỗ trợ 3.5\" HDD X2/ 2.5\" SSD X2 - Thiết bị kết nối ngoại vi I/O: Hỗ trợ USB 3.0/USB 2.0; HD Audio - Quạt tản nhiệt: Mặt trước: 2x120mm/Mặt sau: 1x120mm/2 mặt bên: 1x120/140mm - Chiều cao tản nhiệt CPU tối đa: 160mm - Chiều dài thẻ VGA tối đa: 320mm\r\n'),
('CAS11', 'CAS', 'Vỏ Case VSP V2 BLACK', 'VSP', 330000, 'Vỏ Case VSP V2 Black là một vỏ case máy tính với thiết kế đơn giản và tinh tế, phù hợp cho các hệ thống máy tính văn phòng hoặc cá nhân. Vỏ case này có màu đen chủ đạo, hỗ trợ các linh kiện cơ bản và không gian lắp đặt khá rộng rãi. Với khả năng tản nhiệt tốt và dễ dàng lắp đặt các bộ quạt làm mát, VSP V2 Black mang đến một lựa chọn hợp lý cho người dùng cần một vỏ case đáng tin cậy với thiết kế tối giản.', 0, 'uploads/case-VSP_V2_BLACK.jpg', 2023, '2025-01-15', 101, -6, 'Màu sắc: Trắng/Đen - Kiểu dáng: Mid Tower - Chất liệu: SPCC 0.5mm, Black Interior - Kích thước tiêu chuẩn Case để lắp PSU: ATX - Khe cắm HDD & SDD: 3.5\" HDD x1; 2.5\" SDD x1 - Thiết bị kết nối ngoại vi I/O: USB 3.0 x1; USB 1.0 x2; HD Audio x1 - Quạt tản nhiệt: Mặt trước: 3 x120mm (Tùy chọn) - Mặt trên: 2 x 120mm (Tùy chọn) - Phía sau: 1 x 120mm (Tùy chọn) - Chiều cao tản nhiệt CPU tối đa: 170mm - Chiều dài thẻ VGA tối đa: 320mm\r\n'),
('CAS12', 'CAS', 'Vỏ Case VSP X7 - Đen - MATX', 'VSP', 572000, 'Vỏ Case VSP X7 - Đen - MATX là một vỏ case máy tính nhỏ gọn, được thiết kế cho các bo mạch chủ MATX. Với màu đen chủ đạo và cấu trúc đơn giản, vỏ case này thích hợp cho những ai cần một hệ thống máy tính tiết kiệm không gian nhưng vẫn đảm bảo hiệu suất. VSP X7 cung cấp không gian đủ rộng để lắp đặt các linh kiện cơ bản và hỗ trợ khả năng tản nhiệt tốt, giúp duy trì hoạt động ổn định cho hệ thống máy tính.', 0, 'uploads/case-VSP_X7_-___en_-_MATX.webp', 2023, '2025-01-15', 101, -6, 'Màu sắc: Đen - Kiểu dáng: Middle Tower - Chất liệu: 0.6mm SPCC - Kích thước tiêu chuẩn Case để lắp PSU: ATX - Khe HDD/SSD: 3.5\" HDD x1; 2.5\"SSD x1 - Thiết bị kết nối ngoại vi I/O: USB3.0x1; usb2.0 X2; HD Audio - Số lượng quạt gắn thêm được vào tối đa: 7 quạt - Trên: 2x120mm (Tùy chọn) - Sau: 1x120mm (Tùy chọn) - Cạnh Hông: 2x120mm (Tùy chọn) - Dưới: 2x120mm (Tùy chọn) - Chiều cao tản nhiệt CPU tối đa: 155mm - Chiều dài thẻ VGA tối đa: 330mm\r\n'),
('CAS13', 'CAS', 'Vỏ Case VSP X7 - Trắng - MATX', 'VSP', 605000, 'Vỏ Case VSP X7 - Trắng - MATX là một vỏ case máy tính có thiết kế đơn giản và hiện đại với màu trắng chủ đạo, phù hợp cho các bo mạch chủ MATX. VSP X7 - Trắng cung cấp không gian lắp đặt linh kiện cơ bản, hỗ trợ tản nhiệt tốt và dễ dàng quản lý cáp. Với kiểu dáng nhỏ gọn và tinh tế, nó là lựa chọn lý tưởng cho các hệ thống máy tính không chiếm quá nhiều không gian nhưng vẫn đảm bảo hiệu suất và tính thẩm mỹ cao.', 0, 'uploads/case-VSP_X7_-_Tr___ng_-_MATX.webp', 2023, '2025-01-15', 101, -6, 'Màu sắc: Trắng - Kiểu dáng: Middle Tower - Chất liệu: 0.6mm SPCC - Kích thước tiêu chuẩn Case để lắp PSU: ATX - Khe HDD/SSD: 3.5\" HDD x1; 2.5\"SSD x1 - Thiết bị kết nối ngoại vi I/O: USB3.0x1; usb2.0 X2; HD Audio - Số lượng quạt gắn thêm được vào tối đa: 7 quạt - Trên: 2x120mm (Tùy chọn) - Sau: 1x120mm (Tùy chọn) - Cạnh Hông: 2x120mm (Tùy chọn) - Dưới: 2x120mm (Tùy chọn) - Chiều cao tản nhiệt CPU tối đa: 155mm - Chiều dài thẻ VGA tối đa: 330mm\r\n'),
('COL01', 'COL', 'FAN CPU BÓC MÁY XỊN', 'INT', 55000, 'FAN CPU là bộ quạt làm mát được thiết kế đặc biệt để giảm nhiệt độ cho vi xử lý (CPU) trong quá trình hoạt động, giúp bảo vệ CPU khỏi tình trạng quá nhiệt và duy trì hiệu suất hoạt động ổn định.', 0, 'uploads/fan-CPU.webp', 2012, '2025-01-15', 101, -6, 'Fan tản nhiệt cho CPU INTEL -\r\nHỗ trợ CPU dòng G/i3/i5/i7 -\r\nHỗ trợ Socket 1156/1155/1150 -\r\nChạy bền bỉ, êm, tản nhiệt tốt.'),
('COL02', 'COL', 'FAN BOX Lõi Đồng SK1700', 'INT', 143000, 'FAN BOX Lõi Đồng SK1700 là một quạt tản nhiệt dành cho các bộ vi xử lý, được trang bị lõi đồng giúp tăng hiệu quả tản nhiệt. Thiết kế quạt này hướng đến việc làm mát hiệu quả cho các hệ thống máy tính với hiệu suất ổn định.', 0, '../uploads/FAN-BOX-copper-SK1700.webp', 2012, '2025-01-18', 101, -6, ' CPU socket: 	Intel LGA 1700 thế hệ 12-\r\nChất liệu : 	Nhôm + lõi đồng-\r\n 	Tản nhiệt nhôm với quạt PWM-\r\n 	Lõi đồng kèm sẵn kem tản nhiệt zin-\r\nĐầu nối quạt :4 pin-\r\nTương thích với bộ xử lý :Intel G / i3 / i5 / i7'),
('COL03', 'COL', 'FAN CPU HR-1200', 'COL', 121000, 'FAN CPU HR-1200 là một quạt tản nhiệt dành cho CPU với thiết kế giúp tăng hiệu quả làm mát cho vi xử lý. Quạt này thường được sử dụng trong các hệ thống máy tính để giữ nhiệt độ CPU ổn định.', 0, 'uploads/fan-CPU_HR-1200.jpg', 2012, '2025-01-15', 101, -6, ' Kích thước tản nhiệt: 93*67*128 mm - Jack cắm nguồn: 3 Pin (Vẫn cắm được jack fan CPU và SYS Fan 4 pin) - Kích thước quạt: 92*92*25 mm - Tốc độ quạt: 2300 RPM - Lưu lượng gió: 36 CFM - Độ ồn: 30.5 Dba (MAX) - Điện áp: 12v - Khối lượng: 310g - Hỗ trợ các socket: Intel: 775/1150/1151/1155/1156/1200 - AMD: AM4/AM3+/AM3/AM2+/AM2/FM2/FM2+/FM1\r\n'),
('COL04', 'COL', 'FAN CPU T400i', 'CLM', 253000, 'FAN CPU T400i là một quạt tản nhiệt cho CPU, được thiết kế để giảm nhiệt độ của vi xử lý, giúp hệ thống hoạt động ổn định hơn trong các môi trường tải cao.', 0, 'uploads/fan-CPU_T400i.jpg', 2012, '2025-01-15', 101, -6, ' Kích thước bộ tản nhiệt: 127 x 82 160mm - Kích thước tản nhiệt: 123 x 53 x 160mm - Kích thước quạt: 120 x 120 x 25mm - Số lượng ống dẫn nhiệt: 4 - Tốc độ quạt: 800-1500 RPM (PWM)+/-10% - Trọng lượng: 706g/ Connector: 4 pin - Đầu nối: 4 - Vòng bi: Rifle Bearing - Điện áp đầu vào: 7 VDC - Mức điện áp: 12 VDC\r\n'),
('COL05', 'COL', 'FAN VSP CPU V620 PRO PLUS 6 ỐNG ĐỒNG', 'VSP', 385000, 'FAN VSP CPU V620 PRO PLUS là quạt tản nhiệt cho CPU với thiết kế sử dụng 6 ống đồng giúp tăng khả năng tản nhiệt hiệu quả hơn, giữ cho CPU hoạt động ổn định.', 0, 'uploads/fan-CPU_V620_PRO_6____NG______NG.jpg', 2012, '2025-01-15', 101, -6, ' Model: V620 PRO PLUS\r\n\r\n- Product size: 120L x 73W 156 H (mm)\r\n\r\n- Fan size: 120 x 120 x 25mm LED RGB\r\n\r\n- Number of heat pipes: 6 - Dynamic Hydro Bearing\r\n\r\n- Fan speed: 800 - 2000 RPM (PWM)+/-10%\r\n\r\n- Weight: 650g\r\n\r\n- Connector: 4 PIN + 3 PIN synC\r\n\r\n- Bearing Type: Rifle Bearing 0.02+/-10%\r\n\r\n- Starting voltage: 7 VDC\r\n\r\n- Rated voltage: 12 VDC 3,96W\r\n\r\n- Rated Current: 0,2A +/-10%\r\n\r\n- Noise: 10 - 18 dBA+/-10%\r\n\r\n- Life: 45,000 Hours'),
('COL06', 'COL', 'TẢN NƯỚC THERMALRIGHT AE V3 240 ARGB ĐEN - TRẮNG', 'TMR', 1265000, 'Tản nước Thermalright AE V3 240 ARGB là hệ thống tản nhiệt nước với radiator 240mm, thiết kế ARGB cho hiệu ứng ánh sáng đẹp mắt, phù hợp với cả các build PC có yêu cầu về tính thẩm mỹ và hiệu suất tản nhiệt cao. Sản phẩm có màu đen và trắng, giúp người dùng dễ dàng lựa chọn theo phong cách build của mình.', 0, 'uploads/cool-THERMALRIGHT_AE_V3_240_ARGB___EN_-_TR___NG.jpg', 2020, '2025-01-15', 101, -6, 'Thương hiệu - THERMALRIGHT - Bảo hành - 24 tháng - Dạng tản nhiệt - Tản nước AIO - Loại tản AIO - AIO 240mm - Socket được hỗ trợ - AMD AM4, AMD AM5, Intel LGA 1200, Intel LGA 1700, Intel LGA 20XX, Intel LGA115X - TDP - None - Kích thước quạt - 120×120×25mm - Tốc độ quạt - 1500 RPM±10% (MAX) - Luồng khí - 66.17 CFM (MAX) - Số lượng quạt - 2 - Màu sắc đèn LED - ARGB - Màu sắc - Đen, Trắng\r\n'),
('COL07', 'COL', 'Tản nước THERMALRIGHT 360 ARGB - TRẮNG - ĐEN', 'TMR', 1925000, 'Tản nước Thermalright 360 ARGB là hệ thống tản nhiệt nước với radiator 360mm, thiết kế ARGB để tạo hiệu ứng ánh sáng sắc nét và đẹp mắt. Phiên bản này có màu trắng và đen, phù hợp với các build PC hiện đại, giúp tối ưu hóa hiệu suất tản nhiệt trong khi vẫn giữ được tính thẩm mỹ cao.', 0, 'uploads/cool-THERMALRIGHT_360_ARGB-_TR___NG_-___EN.jpg', 2021, '2025-01-15', 101, -6, ' Tương thích - Intel LGA 115X/1200/1700/2011/2066 - AMD AM4/AM2/AM2+/AM3/AM3+/FM1/FM2/FM2+ - Vận tốc - 2600RPM±10% - Điện áp - 12V - Độ ồn - ≤30dBA - Giao diện ARGB - +5V/3pin - Tuổi thọ - 40000 Hours - Tốc độ tối đa - 1550RPM ± 10% - Áp lực gió - 1.53mm H20 (MAX) - Khối lượng Không khí - 66.17CFM (MAX) - Độ ồn - ≤25.6DBA - Giao diện - 4pin PWM\r\n'),
('COL08', 'COL', 'Tản nước THERMALRIGHT Frozen Warframe 240 - ĐEN', 'TMR', 1705000, 'Tản nước Thermalright Frozen Warframe 240 là một hệ thống tản nhiệt nước với radiator 240mm, đi kèm với màn hình LCD hiển thị thông tin nhiệt độ hoặc các hiệu ứng tùy chỉnh. Thiết kế màu đen mang lại sự sang trọng và phù hợp với nhiều phong cách build PC.', 0, '../uploads/cool-THERMALRIGHT-Frozen-Warframe-240.webp', 2021, '0000-00-00', 101, -6, 'Màn hình LCD tùy chỉnh - Tương thích - AMD AM4, AMD AM5, Intel LGA 1200, Intel LGA 1700, Intel LGA 20XX, Intel LGA115X - Tốc độ FAN - 2000 RPM±10% (MAX) - Độ ồn - 23 dBA (MAX) - Tốc độ bơm - 3000 RPM±10% (MAX) - Chất liệu - Nhôm'),
('COL09', 'COL', 'FAN ĐK Redmoon F3 - ĐEN + TRẮNG', 'COL', 66000, 'FAN ĐK Redmoon F3 là một quạt tản nhiệt với thiết kế đặc biệt bao gồm màu đen và trắng, giúp tăng hiệu suất làm mát trong các build máy tính. Quạt này thường được trang bị LED RGB, tạo ra ánh sáng đẹp mắt cho hệ thống.', 0, 'uploads/fan-__K_ZEDMON_F3_-___EN___TR___NG.jpg', 2023, '2025-01-15', 101, -6, ' Kích thước Fan : 120x120x25mm - Tốc độ quay : 800 _1800 RPM - Công suất : 4.5W - Lưu lượng gió : 71CFM - Độ ồn : 23dBA - Tuổi thọ : 60000H - Led : RGB\r\n'),
('COL10', 'COL', 'FAN Led LC- 30 ARGB Mirro HaLo Pro Gương Vô Cực Đen - Trắng', 'COL', 110000, 'FAN Led LC-30 ARGB Mirro HaLo Pro là một quạt tản nhiệt cao cấp với thiết kế gương vô cực (Infinity Mirror) mang lại hiệu ứng ánh sáng đặc biệt, tạo vẻ ngoài bắt mắt cho hệ thống máy tính. Quạt này có khả năng đổi màu với ARGB, cho phép người dùng tùy chỉnh màu sắc theo sở thích. Phiên bản Đen - Trắng mang đến sự phối hợp màu sắc tinh tế, phù hợp với nhiều kiểu build máy tính.', 0, 'uploads/fan-Led_LC-_30_ARGB_Mirro_HaLo_Pro_G____ng_V___C___c___en_-_Tr___ng.webp', 2021, '2025-01-15', 101, -6, ' Phiên bản mới nhất của dòng quạt tản nhiệt LovingCool - Thiết kế dạng khối vuông, mặt ngang có tích hợp led dạng vô cực đẹp mắt - Kích thước - 12cm x 12cm x 2,5cm - Tốc độ quay - 650~1800 ± 10%rpm - Nguồn điện - 12v - Model - LC-30 Black Pro - Màu sắc - thiết kế toàn bộ là màu đen, họa tiết vân chia sáng, và gương vô cực bên hông quạt - Luồng khí đạt mức - 61 giao động 10% - Chuẩn cắm - 6Pin hoặc 5v 3Pin ARGB\r\n'),
('COL11', 'COL', 'FAN LED có HUB', 'COL', 93500, 'FAN LED có HUB là loại quạt tản nhiệt có tích hợp HUB (Hub điều khiển) cho phép đồng bộ hóa và quản lý nhiều quạt LED cùng lúc. HUB này giúp bạn dễ dàng điều chỉnh ánh sáng LED và tốc độ quạt mà không cần phải kết nối từng quạt với bo mạch chủ, mang lại sự tiện lợi và cải thiện thẩm mỹ cho hệ thống máy tính.', 0, 'uploads/fan-LED_c___HUB.png', 2020, '2025-01-15', 101, -6, '  Kích thước: 120 x 120 x 25mm -  Cánh màu trắng -  Đệm cao su chống rung -  Chiều dài dây: 50cm -  Tốc độ gió: 1200 - 1400RPM - Lượng gió: 33.5 - 37.8 CFM -  Độ ồn: 20 - 25dBA -  Điện áp định mức: DC12V + 5V -  Giao diện cổng cắm: 6 PIN - Cắm qua bộ Hub Coolmoon -  Tuổi thọ: 30.000 - 40.000H\r\n'),
('COL12', 'COL', 'FAN LED DM1 CÓ HUB ARGB', 'COL', 132000, 'FAN LED DM1 có HUB ARGB là quạt tản nhiệt được thiết kế với ánh sáng ARGB (Addressable RGB), cho phép bạn tùy chỉnh màu sắc của từng bóng LED trên quạt để tạo ra các hiệu ứng ánh sáng đặc sắc. Điều đặc biệt ở sản phẩm này là nó đi kèm với một HUB ARGB, giúp bạn điều khiển ánh sáng của nhiều quạt LED thông qua một điểm điều khiển duy nhất, thay vì phải điều chỉnh từng quạt một.', 0, 'uploads/fan-LED_DM1_C___HUB_ARGB.webp', 2021, '2025-01-15', 101, -6, 'Chất liệu: Nhựa ABS - Kích thước: 120mm x 120mm x 25mm (Dài x Rộng x Cao) - Trọng lượng: 150g - Tốc độ : 800~1800 (±10%) RPM - Lưu lượng khí tối đa: 71 (±10%) CFM - Độ ồn của quạt: 10~23 dBA ± 10% - Loại trục quay: Hydro Bearing - Điện thế: 12V (Quạt) | 5V (LED) - Công suất tiêu thụ: 4.5W - Tuổi thọ trung bình: 60.000h\r\n'),
('COL13', 'COL', 'Fan F6 vô cực ko cần khiển', 'COL', 44000, 'Fan F6 vô cực là loại quạt làm mát với thiết kế đặc biệt, có thể tạo ra hiệu ứng ánh sáng \"vô cực\" (infinity mirror effect) nhờ vào các đèn LED được bố trí xung quanh các cánh quạt, tạo ra cảm giác như ánh sáng đang phản chiếu vô tận. Thiết kế này không chỉ mang lại hiệu suất làm mát cao mà còn tạo điểm nhấn về mặt thẩm mỹ cho hệ thống máy tính.', 0, 'uploads/fan-F6.webp', 2022, '2025-01-15', 101, -6, ' Kích thước: 120mm x 120mm x 25mm - Tốc độ quạt: 765 ~ 1800 RPM + 10% - Lưu lượng gió: 61.5 CFM + 10% - Áp suất gió: 2.0mmH2O - Độ ồn: 6 ~ 30 dBa - Giao diện: 4pin RPM, 3Pin ARGB - Loại vòng bi: Hydro Bearing - Điện áp: DC12V, LED DC5V - Tiêu thụ điện: 0.25A\r\n'),
('COL14', 'COL', 'Tản khí - ĐEN- THERMALRIGHT- PA 120SE ARGB - 6 ỐNG - 2 FAN', 'TMR', 825000, 'Tản khí Thermalright PA 120SE ARGB là một bộ tản nhiệt khí với thiết kế mạnh mẽ và hiệu quả, có tính năng ARGB (chế độ ánh sáng RGB điều khiển được) để tăng tính thẩm mỹ cho hệ thống máy tính. Tản nhiệt này có 6 ống dẫn nhiệt giúp cải thiện khả năng truyền nhiệt và giảm nhiệt độ CPU, đồng thời đi kèm với 2 quạt làm mát giúp tăng cường luồng khí cho hệ thống. Màu sắc đen tạo sự tinh tế và dễ dàng kết hợp với nhiều loại linh kiện khác trong hệ thống máy tính.', 0, 'uploads/cool-__EN-_THERMALRIGHT-_PA_120SE_ARGB_-_6____NG_-_2_FAN.jpg', 2021, '2025-01-15', 101, -6, ' Kích thước: 125mm × 110mm × 155mm -\r\nCân nặng: 730g -\r\nỐng đồng: 6mm × 6 units -\r\nLá tản: T = 0.4 mm; Gap = 1.8 mm -\r\nSố lượng lá tản: 50 -\r\nKích thước: 120mm × 120mm × 25mm -\r\nTốc độ: 1550 RPM±10%(MAX) - \r\nĐộ ồn: 25.6 dBA Air -\r\nLưu lượng gió: 66.17 CFM(MAX) -\r\nÁp suất khí: 1.53mm H2O (MAX) -\r\nAmpe: 0.2A -\r\nLoại kết nối: 4Pin PWM / 3Pin ARGB '),
('CPU01', 'CPU', 'CPU G 32xx', 'INT', 66000, 'CPU Intel Xeon G32xx là dòng vi xử lý dành cho máy chủ và workstation, hỗ trợ đa nhiệm và xử lý dữ liệu lớn. Dòng CPU này sử dụng socket LGA 1151, có từ 4 đến 8 lõi và hỗ trợ Hyper-Threading.', 0, 'uploads/cpu-g32xx.png', 2013, '2025-01-13', 101, -6, 'Phân đoạn thẳng: Desktop -\r\n\r\nSố hiệu Bộ xử lý: G3240 -\r\n\r\nThuật in thạch bản22 nm -\r\nSố lõi: 2 -\r\n\r\nSố luồng: 2 -\r\n\r\nTần số cơ sở của bộ xử lý3.10 GHz -\r\n\r\nBộ nhớ đệm: 3 MB SmartCache -\r\n\r\nBus Speed: 5 GT/s DMI2 -\r\n\r\nTDP: 53 W\r\nDung lượng bộ nhớ tối Đa (tùy vào loại bộ nhớ)32 GB -\r\n\r\nCác loại bộ nhớ: DDR3 1333, DDR3L 1333 @ 1.5V -\r\n\r\nSố Kênh Bộ Nhớ Tối Đa2 - \r\n\r\nBăng thông bộ nhớ tối đa21.3 GB/s -\r\n\r\nHỗ trợ Bộ nhớ ECC ‡Có   \r\nĐồ họa bộ xử lý ‡Đồ họa HD Intel® cho bộ xử lý Intel® thế hệ thứ 4 -\r\n\r\nTần số cơ sở đồ họa: 350 MHz -\r\n\r\nTần số động tối đa đồ họa1.10 GHz -\r\n\r\nBộ nhớ tối đa video đồ họa1.7 GB -\r\n\r\nĐầu ra đồ họa: eDP/DP/HDMI/DVI/VGA -\r\n\r\nĐộ Phân Giải Tối Đa (HDMI 1.4)‡1920×1080@60Hz     -\r\n\r\nĐộ Phân Giải Tối Đa (DP)‡2560×1600@60Hz -\r\n\r\nĐộ Phân Giải Tối Đa (eDP – Integrated Flat Panel)‡2560×1600@60Hz -\r\n\r\nĐộ Phân Giải Tối Đa (VGA)‡1920×1200@60Hz -\r\n\r\nHỗ Trợ DirectX*11.1/12 -\r\n\r\nHỗ Trợ OpenGL*4.3 -\r\n\r\nĐồng bộ nhanh hình ảnh Intel®Có -\r\n\r\nCông nghệ video HD rõ nét Intel®Có -\r\n\r\nSố màn hình được hỗ trợ ‡3 -\r\nKhả năng mở rộng: 1S Only -\r\n \r\nPhiên bản PCI Express: Up to 3.0 -\r\n\r\nCấu hình PCI Express ‡Up to 1×16, 2×8, 1×8 2×4 -\r\n\r\nSố cổng PCI Express tối đa16 '),
('CPU02', 'CPU', 'CPU I3 4150', 'INT', 110000, 'CPU Intel Core i3-4150 là bộ vi xử lý thuộc dòng Intel Core i3 thế hệ thứ 4 (Haswell), sử dụng socket LGA 1150. Nó có 2 lõi và 4 luồng, với xung nhịp cơ bản là 3.5 GHz. CPU này được thiết kế cho các máy tính bàn tầm trung, cung cấp hiệu suất tốt cho các tác vụ văn phòng và giải trí nhẹ.', 0, 'uploads/cpu-i3-4150.png', 2014, '2025-01-13', 101, -6, '  Hãng sản xuất: Intel\r\n- Chủng loại: Intel Core i\r\n- Dòng CPU: Intel Core i\r\n- Tốc độ: 1.70nbsp;GHznbsp;\r\n- Bus Ram hỗ trợ: DDR4 2666MHz\r\n- Nhân CPU: 2\r\n- Luồng CPU: 4\r\n- Bộ nhớ đệm: 3 MB\r\n- Tính năng, đặc điểm: Intel® SSE4.2, Intel® AVX, Intel® AVX2, Intel® AVX\r\n-512\r\n- Dây truyền công nghệ: 14 nm\r\n- TDP: 51W\r\n- Phụ Kiện đi Kèm nbsp;'),
('CPU03', 'CPU', 'CPU I5 4XXX', 'INT', 440000, 'CPU Intel Core i5 4XXX là bộ vi xử lý thuộc dòng Intel Core i5 thế hệ thứ 4 (Haswell), sử dụng socket LGA 1150. Dòng này bao gồm các model với 4 lõi và 4 đến 8 luồng, xung nhịp dao động từ 2.5 GHz đến 3.5 GHz (tùy model). Các CPU i5 thế hệ 4 cung cấp hiệu suất tốt cho nhiều tác vụ như chơi game, làm việc văn phòng, và các ứng dụng đa nhiệm nhẹ đến trung bình.', 0, 'uploads/cpu-i5-4xxx.png', 2014, '2025-01-13', 101, -6, ' Series  Intel : Core i5\r\n- Socket type Intel : Socket LGA 1150\r\n -Manufacturing Technology ( Công nghệ sản xuất ): 22 nm\r\n- Codename (Tên mã) :  Intel – Haswell\r\n - Số lượng Cores : 4\r\n- Số lượng Threads  :  4\r\n－CPU Speed (Tốc độ CPU)  3.20GHz\r\n－Max Turbo Frequency 3.60GHz\r\n－Bus Speed / HyperTransport  5.0 GT/s ( 5000 MT/s – 2.5 Gb/s)\r\n－L2 Cache    1 MB\r\n－L3 Cache    6 MB\r\n－Đồ họa tích hợp Intel HD Graphics 4600\r\n－Graphics Frequency (MHz)    350'),
('CPU04', 'CPU', 'CPU G4400', 'INT', 110000, 'CPU Intel Pentium G4400 là bộ vi xử lý thuộc dòng Pentium của Intel, sử dụng socket LGA 1151 và thuộc thế hệ Skylake. CPU này có 2 lõi và 2 luồng, với xung nhịp cơ bản 3.3 GHz. G4400 được thiết kế cho các hệ thống máy tính bàn phổ thông, cung cấp hiệu suất tốt cho các tác vụ cơ bản như duyệt web, xem video và làm việc văn phòng.', 0, 'uploads/cpu-g4400.png', 2016, '2025-01-13', 101, -6, 'Thương hiệu : intel-\r\nLoại ổ cắm :CPU-\r\nLGA :1151-\r\nHạn bảo hành : 1 tháng-\r\nLoại bảo hành : Bảo hành nhà cung cấp-\r\nTần số CPU : 3.3Ghz-\r\nBộ xử lý : G4400'),
('CPU05', 'CPU', 'CPU I3 6100', 'INT', 308000, 'CPU Intel Core i3-6100 là bộ vi xử lý thuộc dòng Intel Core i3 thế hệ thứ 6 (Skylake), sử dụng socket LGA 1151. Nó có 2 lõi và 4 luồng, với xung nhịp cơ bản 3.7 GHz. i3-6100 cung cấp hiệu suất ổn định cho các tác vụ văn phòng, lướt web, và chơi game nhẹ.', 0, 'uploads/cpu-i3-6100.png', 2015, '2025-01-13', 101, -6, 'Hãng sản xuất	:Intel\r\nSocket:	1151 -\r\nChủng loại	:CPU Intel Core i3 6100 -\r\nSố lõi:	2-\r\nSố Luồng : 4-\r\nTần số cơ sở của bộ xử lý : 3.7GHz-\r\nBộ nhớ đệm	: 3 MB Intel® Smart Cache-\r\nCác loại bộ nhớ	: DDR4 2133/2400, DDR3L 1333/1600-\r\nĐồ họa :	Đồ họa HD Intel® 630-\r\nĐộ Phân Giải Tối Đa  (HDMI) : 4096×2304@24Hz-\r\nĐộ Phân Giải Tối Đa (DP) : 	4096×2304@60Hz-\r\nCông nghệ :	14 nm-\r\nTDP	: 51W-\r\n '),
('CPU06', 'CPU', 'CPU I5 6500', 'INT', 748000, 'CPU Intel Core i5-6500 là bộ vi xử lý thuộc dòng Intel Core i5 thế hệ thứ 6 (Skylake), sử dụng socket LGA 1151. Nó có 4 lõi và 4 luồng, với xung nhịp cơ bản 3.2 GHz và có thể tăng tốc lên đến 3.6 GHz. CPU này cung cấp hiệu suất tốt cho các tác vụ đa nhiệm, chơi game và ứng dụng văn phòng.', 0, 'uploads/cpu-i5-6500.png', 2015, '2025-01-13', 101, -6, 'Hãng sản xuất:Intel-\r\nSocket:115-\r\nChủng loại :	CPU Intel Core i5 6500-\r\nSố lõi: 4-\r\nSố Luồng :	4-\r\nTần số cơ sở của bộ xử lý: 3.2GHz turbo 3.6GHz-\r\nBộ nhớ đệm: 6 MB Intel® Smart Cache-\r\nCác loại bộ nhớ	: DDR4 2133/2400, DDR3L 1333/1600-\r\nĐồ họa	: Đồ họa HD Intel® 630-\r\nĐộ Phân Giải Tối Đa (HDMI) : 4096×2304@24Hz-\r\nĐộ Phân Giải Tối Đa (DP)  :4096×2304@60Hz-\r\nCông nghệ: 14 nm-\r\nTDP :	65W-'),
('CPU07', 'CPU', 'CPU I3 8100', 'INT', 770000, 'CPU Intel Core i3-8100 là bộ vi xử lý thuộc dòng Intel Core i3 thế hệ thứ 8 (Coffee Lake), sử dụng socket LGA 1151. Nó có 4 lõi và 4 luồng, với xung nhịp cơ bản 3.6 GHz. i3-8100 cung cấp hiệu suất ổn định cho các tác vụ đa nhiệm, chơi game nhẹ và ứng dụng văn phòng.', 0, 'uploads/cpu-i3-8100.png', 2017, '2025-01-13', 101, -6, 'Sản phẩm: Bộ vi sử lý ( CPU )-\r\nHãng sản xuất: Intel -\r\nMã CPU	:Coffee Lake i3 8100-\r\nIGP	: Intel UHD Graphics 630-\r\nTốc Độ	:3.60GHz -\r\nSóc két	: 1151-\r\nBus ram hỗ trợ	: DDR4 - 2400-\r\nNhân CPU:	 4 core-\r\nLuồng CPU	: 4 Threads-\r\nĐiện áp tiêu thụ	: 65 W'),
('CPU08', 'CPU', 'CPU I3 9100F', 'INT', 715000, 'CPU Intel Core i3-9100F là bộ vi xử lý thuộc dòng Intel Core i3 thế hệ thứ 9 (Coffee Lake), sử dụng socket LGA 1151. Nó có 4 lõi và 4 luồng, với xung nhịp cơ bản 3.6 GHz và có thể tăng tốc lên đến 4.2 GHz. Phiên bản F không có đồ họa tích hợp, yêu cầu người dùng sử dụng card đồ họa rời.', 0, 'uploads/cpu-i3-9100f.png', 2019, '2025-01-13', 101, -6, 'CPU: Core i 9100F-\r\nSeries:Core i3-\r\nSocket:1151 v2-\r\nSố nhân xử lý:4-\r\nSố luồng xử lý:4-\r\nKiến trúc:Coffee Lake (14 nm)-\r\nCode name:Coffee Lake-\r\nThế hệ:Intel Core thế hệ thứ 9-\r\nTốc độ xử lý:3.60 GHz > 4.20 GHz-\r\nCache:6MB-\r\nTDP:65W-\r\nBộ nhớ hỗ trợ:DDR4 Dual channel'),
('CPU09', 'CPU', 'CPU I5 9400F', 'INT', 1210000, 'CPU Intel Core i5-9400F là bộ vi xử lý thuộc dòng Intel Core i5 thế hệ thứ 9 (Coffee Lake), sử dụng socket LGA 1151. Nó có 6 lõi và 6 luồng, với xung nhịp cơ bản 2.9 GHz và có thể tăng tốc lên đến 4.1 GHz. Phiên bản F không có đồ họa tích hợp, yêu cầu người dùng sử dụng card đồ họa rời.', 0, 'uploads/cpu-i5-9400f.png', 2019, '2025-01-13', 101, -6, 'Hãng sản xuất:Intel-\r\nSocket:1151 v2-\r\nChủng loại:CPU Core i5 9400F-\r\nSố lõi:	6-\r\nSố Luồng	:6-\r\nTần số cơ sở của bộ xử lý	:2.9 GHz turbo 4.1GHz-\r\nBộ nhớ đệm:	9 MB Intel® Smart Cache-\r\nCác loại bộ nhớ	: DDR4 2666-\r\nĐồ họa : Không kèm sẵn iGPU, cần sử dụng cùng VGA rời-\r\nCông nghệ: 14 nm-\r\nTDP  :65W'),
('CPU10', 'CPU', 'CPU I3 8400/8500', 'INT', 1210000, 'CPU Intel Core i3-8400 và Intel Core i3-8500 thuộc dòng Intel Core i3 thế hệ thứ 8 (Coffee Lake), sử dụng socket LGA 1151.\r\n\r\ni3-8400 có 6 lõi và 6 luồng, với xung nhịp cơ bản 2.8 GHz và có thể tăng tốc lên đến 4.0 GHz.\r\ni3-8500 có 6 lõi và 6 luồng, với xung nhịp cơ bản 3.0 GHz và có thể tăng tốc lên đến 4.1 GHz.', 10, 'uploads/cpu-i3-8400-8500.png', 2018, '2025-01-13', 101, -6, '\r\nSocket: LGA 1151 v2 , Intel Core thế hệ thứ 9-\r\nTốc độ xử lý: 3.6 GHz > 4.2GHz( 4 nhân, 4 luồng)-\r\nBộ nhớ đệm: 9MB-\r\nKhông GPU'),
('CPU11', 'CPU', 'CPU I3 10100 Tray', 'INT', 2530000, 'CPU Intel Core i3-10100 Tray là bộ vi xử lý thuộc dòng Intel Core i3 thế hệ thứ 10 (Comet Lake), sử dụng socket LGA 1200. Nó có 4 lõi và 8 luồng, với xung nhịp cơ bản 3.6 GHz và có thể tăng tốc lên đến 4.3 GHz. Phiên bản Tray là phiên bản không có hộp đựng, chỉ bao gồm CPU.', 15, 'uploads/cpu-i3-10100-tray.png', 2020, '2025-01-13', 101, -6, ' Bộ xử lý: I3 10100  Comet Lake-\r\nBộ nhớ đệm: 6 MB Cache-\r\nTần số cơ sở của bộ xử lý: 3.60 GHz-\r\nTần số turbo tối đa: 4.30 GHz-\r\nHỗ trợ socket: FCLGA1200-\r\nSố lõi: 4, Số luồng: 8-\r\nTDP: 65 W-\r\nCác loại bộ nhớ: DDR4 2666-\r\nĐồ họa tích hợp:  Đồ họa Intel® UHD 630'),
('CPU12', 'CPU', 'CPU I3 10100F Box', 'INT', 1430000, 'CPU Intel Core i3-10100F Box là bộ vi xử lý thuộc dòng Intel Core i3 thế hệ thứ 10 (Comet Lake), sử dụng socket LGA 1200. Nó có 4 lõi và 8 luồng, với xung nhịp cơ bản 3.6 GHz và có thể tăng tốc lên đến 4.3 GHz. Phiên bản F không có đồ họa tích hợp, yêu cầu người dùng sử dụng card đồ họa rời. Phiên bản Box đi kèm với quạt tản nhiệt.', 0, 'uploads/cpu-i3-10100f.png', 2020, '2025-01-13', 101, -6, 'Model : I3-10100F -\r\n\r\nSocket : FCLGA1200 -\r\n \r\n\r\nTốc độ cơ bản : 3.6GHz-\r\nCache : 6MB-\r\n\r\nNhân CPU : 4 Nhân-\r\n\r\nLuồng CPU : 8 Luồng-\r\n\r\nVXL đồ họa : Không Có-\r\n\r\nBộ nhớ hỗ trợ : Tối đa 128GB, DDR4 2666Mhz-\r\nDây chuyền công nghệ : 14nm-\r\n\r\nĐiện áp tiêu thụ tối đa : 65W-\r\n\r\nNhiệt độ tối đa : 100 độ C'),
('CPU13', 'CPU', 'CPU I3 10105F Tray', 'INT', 1430000, 'CPU Intel Core i3-10105F Tray là bộ vi xử lý thuộc dòng Intel Core i3 thế hệ thứ 10 (Comet Lake), sử dụng socket LGA 1200. Nó có 4 lõi và 8 luồng, với xung nhịp cơ bản 3.7 GHz và có thể tăng tốc lên đến 4.4 GHz. Phiên bản F không có đồ họa tích hợp, yêu cầu người dùng sử dụng card đồ họa rời. Phiên bản Tray không đi kèm hộp đựng và tản nhiệt.', 0, 'uploads/cpu-i3-10105f-tray.png', 2020, '2025-01-13', 101, -6, 'CPU INTEL CORE I3 10105F (3.7GHZ TURBO UP TO 4.4GHZ, 4 NHÂN 8 LUỒNG, 6MB CACHE, 65W)  SOCKET INTEL LGA 1200 -\r\nDòng CPU Core i thế hệ thứ 10 của Intel -\r\nSocket: LGA 1200 -\r\nThế hệ: Rocket Lake -\r\nSố nhân: 4 -\r\nSố luồng: 8 -\r\nXung nhịp: 3.7 >  4.4 Ghz'),
('CPU14', 'CPU', 'Cpu I3-10105-H510', 'INT', 1760000, 'CPU Intel Core i3-10105 là bộ vi xử lý thuộc dòng Intel Core i3 thế hệ thứ 10 (Comet Lake), sử dụng socket LGA 1200. Nó có 4 lõi và 8 luồng, với xung nhịp cơ bản 3.7 GHz và có thể tăng tốc lên đến 4.4 GHz. Phiên bản này không có đồ họa tích hợp, yêu cầu người dùng sử dụng card đồ họa rời.\r\n\r\nTuy nhiên, \"H510\" không phải là một phần của tên CPU mà có thể ám chỉ chipset H510, là chipset hỗ trợ cho vi xử lý này.', 5, 'uploads/cpu-i3-10105-h510.png', 2020, '2025-01-13', 101, -6, 'Bộ xử lý: I3 10105 – Comet Lake Refresh -\r\nBộ nhớ đệm: 6 MB Cache-\r\nTần số cơ sở của bộ xử lý: 3.70 GHz-\r\nTần số turbo tối đa: 4.40 GHz-\r\nHỗ trợ socket: FCLGA1200-\r\nSố lõi: 4, Số luồng: 8-\r\nTDP: 65 W-\r\nĐồ họa tích hợp: UHD 630\r\n'),
('CPU15', 'CPU', 'CPU I3 10105F BOX', 'INT', 1727000, 'CPU Intel Core i3-10105F BOX là bộ vi xử lý thuộc dòng Intel Core i3 thế hệ thứ 10 (Comet Lake), sử dụng socket LGA 1200. Nó có 4 lõi và 8 luồng, với xung nhịp cơ bản 3.7 GHz và có thể tăng tốc lên đến 4.4 GHz. Phiên bản F không có đồ họa tích hợp, yêu cầu người dùng sử dụng card đồ họa rời. Phiên bản BOX đi kèm với quạt tản nhiệt.', 0, 'uploads/cpu-i3-10105f-tray.png', 2020, '2025-01-13', 101, -6, 'Model : Intel Core i3 10105F   Cpu Core i3 Thế hệ thứ 10-\r\n\r\nSocket : LGA1200-\r\nSố nhân : 4-\r\nSố luồng : 8-\r\nTốc độ : 3.7 Ghz  Turbo 4.4 GHZ-\r\nBộ nhớ đệm : 12 MB Intel Smart Cache-\r\nTình trạng :Cpu Tray, Mới 100%, Bảo hành 36 Tháng'),
('CPU16', 'CPU', 'CPU I5 10400F BOX', 'INT', 2838000, 'CPU Intel Core i5-10400F BOX là bộ vi xử lý thuộc dòng Intel Core i5 thế hệ thứ 10 (Comet Lake), sử dụng socket LGA 1200. Nó có 6 lõi và 12 luồng, với xung nhịp cơ bản 2.9 GHz và có thể tăng tốc lên đến 4.3 GHz. Phiên bản F không có đồ họa tích hợp, yêu cầu người dùng sử dụng card đồ họa rời. Phiên bản BOX đi kèm với quạt tản nhiệt.', 0, 'uploads/cpu-i5-10400f.png', 2020, '2025-01-13', 101, -6, 'Dòng Core i thế hệ thứ 10 dành cho máy bàn của Intel -\r\n6 nhân & 12 luồng-\r\nXung nhịp: 2.9GHz (Cơ bản) / 4.3GHz (Boost)-\r\nSocket: LGA1200-\r\nĐã kèm sẵn tản nhiệt hãng-\r\nKhông tích hợp sẵn iGPU'),
('CPU17', 'CPU', 'CPU I5 11400F - H510-GG', 'INT', 3850000, 'CPU Intel Core i5-11400F - H510-GG là bộ vi xử lý thuộc dòng Intel Core i5 thế hệ thứ 11 (Rocket Lake), sử dụng socket LGA 1200. Nó có 6 lõi và 12 luồng, với xung nhịp cơ bản 2.6 GHz và có thể tăng tốc lên đến 4.4 GHz. Phiên bản F không có đồ họa tích hợp, yêu cầu người dùng sử dụng card đồ họa rời. \"H510-GG\" có thể là tên mã của chipset H510 hoặc của bo mạch chủ (mainboard) hỗ trợ vi xử lý này.', 20, 'uploads/cpu-i5-11400f-h510-gg.png', 2021, '2025-01-13', 101, -6, 'Bộ xử lý: I5 11400F – Rocket Lake-\r\n\r\nBộ nhớ đệm: 12 MB Cache-\r\n\r\nTần số cơ sở của bộ xử lý: 2.60 GHz-\r\n\r\nTần số turbo tối đa: 4.40 GHz-\r\n\r\nHỗ trợ socket: FCLGA1200-\r\n\r\nSố lõi: 6, Số luồng: 12-\r\n\r\nTDP: 65 W-\r\n\r\nĐồ họa tích hợp: Không'),
('CPU18', 'CPU', 'CPU I5-10400 - H510', 'INT', 3916000, 'CPU Intel Core i5-10400 - H510 là bộ vi xử lý thuộc dòng Intel Core i5 thế hệ thứ 10 (Comet Lake), sử dụng socket LGA 1200. Nó có 6 lõi và 12 luồng, với xung nhịp cơ bản 2.9 GHz và có thể tăng tốc lên đến 4.3 GHz. Phiên bản này có đồ họa tích hợp Intel UHD Graphics 630. \"H510\" có thể là tên mã của chipset H510 hoặc của bo mạch chủ (mainboard) hỗ trợ vi xử lý này.', 0, 'uploads/cpu-i5-10400.png', 2020, '2025-01-13', 101, -6, ' Loại CPU : Core i5 10400-\r\n    Hãng sản xuất : Intel-\r\n    Số nhân	: 6-\r\n    Số luồng : 12-\r\n    Tốc độ xung nhịp : 2.90  4.30 GHz-\r\n    Bộ nhớ cache : 12 MB Intel Smart Cache-\r\n    Công nghệ sản xuất : 14 nm-\r\n    TDP : 65W-\r\n    Socket : LGA1200-\r\n    Hỗ trợ RAM : DDR4 2666'),
('CPU19', 'CPU', 'CPU I5-11400 - H510', 'INT', 4290000, 'CPU Intel Core i5-11400 - H510 là bộ vi xử lý thuộc dòng Intel Core i5 thế hệ thứ 11 (Rocket Lake), sử dụng socket LGA 1200. Nó có 6 lõi và 12 luồng, với xung nhịp cơ bản 2.6 GHz và có thể tăng tốc lên đến 4.4 GHz. Vi xử lý này đi kèm với đồ họa tích hợp Intel UHD Graphics 730. \"H510\" có thể là tên mã của chipset H510 hoặc của bo mạch chủ hỗ trợ vi xử lý này.', 0, 'uploads/cpu-i5-11400f-h510-gg.png', 2021, '2025-01-13', 101, -6, 'Loại CPU : Core i5 10400-\r\n    Hãng sản xuất : Intel-\r\n    Số nhân	: 6-\r\n    Số luồng : 12-\r\n    Tốc độ xung nhịp : 2.90  4.30 GHz-\r\n    Bộ nhớ cache : 12 MB Intel Smart Cache-\r\n    Công nghệ sản xuất : 14 nm-\r\n    TDP : 65W-\r\n    Socket : LGA1200-\r\n    Hỗ trợ RAM : DDR4 2666'),
('CPU20', 'CPU', 'CPU I3 12100', 'INT', 3190000, 'CPU Intel Core i3-12100 là bộ vi xử lý thuộc dòng Intel Core i3 thế hệ thứ 12 (Alder Lake), sử dụng socket LGA 1700. Nó có 4 lõi và 8 luồng, với xung nhịp cơ bản 3.3 GHz và có thể tăng tốc lên đến 4.3 GHz. Vi xử lý này có đồ họa tích hợp Intel UHD Graphics 730.', 0, 'uploads/cpu-i3-12100.png', 2022, '2025-01-13', 101, -6, ' CPU Intel Core i3 thế hệ 12-\r\n Socket: FCLGA1700-\r\n Số nhân/luồng: 4/8-\r\n Xung nhịp tối đa: 4.3Ghz-\r\n Bộ nhớ đệm: 12MB  L2 5MB-\r\n Điện năng tiêu thụ cơ bản: 58 89W-\r\n Chip đồ họa tích hợp: Intel® UHD Graphics 730-\r\n Ngày phát hành: Q1\'22'),
('CPU21', 'CPU', 'CPU I3 12100F', 'INT', 2200000, 'CPU Intel Core i3-12100F là bộ vi xử lý thuộc dòng Intel Core i3 thế hệ thứ 12 (Alder Lake), sử dụng socket LGA 1700. Nó có 4 lõi và 8 luồng, với xung nhịp cơ bản 3.3 GHz và có thể tăng tốc lên đến 4.3 GHz. Phiên bản F không có đồ họa tích hợp, yêu cầu người dùng sử dụng card đồ họa rời.', 0, 'uploads/cpu-i3-12100f.png', 2022, '2025-01-13', 101, -6, 'Model : Bộ vi xử lý Intel Core i3 gen 12th-\r\nSố hiệu xử lí : i3 12100F-\r\nSố nhân	: 4-\r\nSố luồng : 8-\r\nTần số turbo tối đa : 4.30 GHz-\r\nTần số turbo tối đa của lõi hiệu suất : 4.30 GHz-\r\nTần số cơ bản của lõi hiệu suất	: 3.30 GHz-\r\nBộ nhớ đệm : 12 MB Intel Smart Cache-\r\nTotal L2 cache	: 5 MB-\r\nCông suất cơ bản : 58 W-\r\nCông suất tối đa : 89 W-\r\nCác loại bộ nhớ	: Up to DDR5 4800 MT/s-\r\nUp to DDR4 : 3200 MT/s-\r\nDung lượng tối đa : 128 GB-\r\nBộ nhớ đa kênh : 2-\r\nBăng thông tối đa : 76.8 GB/s-\r\nPhiên bản PCI Express : 5.0 và 4.0-\r\nCấu hình PCI Express  : Up to 1x16+4, 2x8+4-\r\nSố cổng PCI Express tối đa : 20-\r\nHỗ trợ socket	: FCLGA1700-\r\nCấu hình CPU tối đa	: 1-\r\nKích thước : 45.0 mm x 37.5 mm'),
('CPU22', 'CPU', 'CPU I5 12400', 'INT', 4125000, 'CPU Intel Core i5-12400 là bộ vi xử lý thuộc dòng Intel Core i5 thế hệ thứ 12 (Alder Lake), sử dụng socket LGA 1700. Nó có 6 lõi và 12 luồng, với xung nhịp cơ bản 2.5 GHz và có thể tăng tốc lên đến 4.4 GHz. Vi xử lý này có đồ họa tích hợp Intel UHD Graphics 730.', 5, 'uploads/cpu-i5-12400.png', 2022, '2025-01-13', 101, -6, 'Thương hiệu:Intel-\r\n\r\nLoại CPU:Dành cho máy bàn-\r\n\r\nThế hệ:Core i5 Thế hệ thứ 12-\r\n\r\nTên gọi:Core i5-12400-\r\n\r\nSocket:FCLGA 1700-\r\n\r\nTên thế hệ:AlderLake-\r\n\r\nSố nhân:6-\r\n\r\nSố luồng:12'),
('CPU23', 'CPU', 'CPU I5 12400F', 'INT', 3190000, 'CPU Intel Core i5-12400F là bộ vi xử lý thuộc dòng Intel Core i5 thế hệ thứ 12 (Alder Lake), sử dụng socket LGA 1700. Nó có 6 lõi và 12 luồng, với xung nhịp cơ bản 2.5 GHz và có thể tăng tốc lên đến 4.4 GHz. Phiên bản F không có đồ họa tích hợp, yêu cầu người dùng sử dụng card đồ họa rời.', 0, 'uploads/cpu-i5-12400f.png', 2022, '2025-01-13', 101, -6, ' Loại CPU : Intel Core i5 Cache12400F-\r\n    Hãng sản xuất : Intel-\r\n    Số nhân	: 6-\r\n    Số luồng : 12-\r\n    Tốc độ xung nhịp : 2.50 > 4.40 GHz-\r\n    Bộ nhớ cache : 18 MB Intel Smart Cache-\r\n    Công nghệ sản xuất : Intel 7-\r\n    TDP : 65W-\r\n    Socket : LGA1700-\r\n    Hỗ trợ RAM : DDR4 3200/ DDR5 4800'),
('CPU24', 'CPU', 'CPU I7 12700KF', 'INT', 7689000, 'CPU Intel Core i7-12700KF là bộ vi xử lý thuộc dòng Intel Core i7 thế hệ thứ 12 (Alder Lake), sử dụng socket LGA 1700. Nó có 12 lõi (8 lõi hiệu năng + 4 lõi hiệu quả) và 20 luồng, với xung nhịp cơ bản 3.6 GHz và có thể tăng tốc lên đến 5.0 GHz. Phiên bản KF không có đồ họa tích hợp, yêu cầu người dùng sử dụng card đồ họa rời.', 0, 'uploads/cpu-i7-12700kf.png', 2022, '2025-01-13', 101, -6, ' Socket : FCLGA1700-\r\nDòng CPU : Core i7-\r\nCPU	: Intel® Core® i7 12700KF (Alder Lake)-\r\nSố nhân	: 12-\r\nSố luồng : 20-\r\nTốc độ xử lý : 3.6 GHz-\r\nTốc độ xử lý tối đa	: 5.0 GHz-\r\nĐiện năng tiêu thụ	: 125 W-\r\nCông nghệ CPU : Alder Lake-\r\nBộ nhớ đệm : 25MB Intel® Smart Cache'),
('CPU25', 'CPU', 'CPU I7 12700K', 'INT', 8426000, 'CPU Intel Core i7-12700K là bộ vi xử lý thuộc dòng Intel Core i7 thế hệ thứ 12 (Alder Lake), sử dụng socket LGA 1700. Nó có 12 lõi (8 lõi hiệu năng + 4 lõi hiệu quả) và 20 luồng, với xung nhịp cơ bản 3.6 GHz và có thể tăng tốc lên đến 5.0 GHz. Phiên bản K có thể ép xung và có đồ họa tích hợp Intel UHD Graphics 770.', 0, 'uploads/cpu-i7-12700k.png', 2022, '2025-01-13', 101, -6, ' Tên mã: Alder Lake-\r\nThuật in thạch bản: Intel 7-\r\nSố lõi: 12 / Số luồng: 20-\r\nSố Pcore: 8 / Số Ecore: 4-\r\nTần số turbo tối đa: 5.00 GHz-\r\nTần số cơ sở của Pcore: 3.60 GHz (Tần số turbo tối đa của Pcore: 4.90 GHz)-\r\nBộ nhớ đệm: 25 MB Intel® Smart Cache (Tổng bộ nhớ đệm L2: 12 MB)-\r\nCông suất cơ bản của bộ xử lý: 125 W (Công suất turbo Tối đa: 190 W)-\r\nDung lượng bộ nhớ tối đa (tùy vào loại bộ nhớ): 128 GB-\r\nCác loại bộ nhớ: Up to DDR5 5600 MT/s hoặc Up to DDR4 3200 MT/s-\r\nHỗ trợ socket: FCLGA1700-\r\nBo mạch đề nghị: Intel Z690 hoặc Z790-\r\nYêu cầu VGA: Không'),
('CPU26', 'CPU', 'CPU Xeon® E5-2680 v4 3.30 GHz 14 Nhân 28 Luồng', 'INT', 528000, 'CPU Intel Xeon® E5-2680 v4 là một bộ vi xử lý server với 14 nhân và 28 luồng, có tốc độ xung nhịp cơ bản là 3.30 GHz. Được xây dựng trên kiến trúc Skylake, dòng vi xử lý này sử dụng socket LGA 2011-v3 và hỗ trợ bộ nhớ DDR4. CPU này hướng đến các hệ thống máy chủ và làm việc với các tác vụ đa nhiệm, như ảo hóa, phân tích dữ liệu, hoặc ứng dụng có yêu cầu xử lý song song mạnh mẽ.', 0, '../uploads/Xeon-E5-2680-v4-3-30-GHz-14x28.webp', 2016, '2025-01-19', 101, -6, '  Số nhân/luồng: 14 nhân, 28 luồng    \r\n- Xung nhịp cơ bản: 2.4 GHz    \r\n- Xung nhịp tối đa: 3.3 GHz (Turbo Boost)    \r\n- Bộ nhớ cache: 35MB Intel Smart Cache    \r\n- Hỗ trợ bộ nhớ: DDR4 2400/2133/1866 MHz    \r\n- Socket: LGA 2011_3    \r\n- Công suất tiêu thụ (TDP): 120W    \r\n- Công nghệ: 14nm, hỗ trợ Intel VT_x, VT_d, EPT, AES_NI, và Intel Hyper_Threading  '),
('CPU27', 'CPU', 'CPU Xeon® E5-2696 v3 3.6 GHz 18 Nhân 36 Luồng', 'INT', 1155000, 'CPU Intel Xeon® E5-2696 v3 là một bộ vi xử lý server với 22 nhân và 44 luồng, có tốc độ xung nhịp cơ bản là 3.6 GHz. Được xây dựng trên kiến trúc Haswell và sử dụng socket LGA 2011-v3, vi xử lý này hỗ trợ bộ nhớ DDR4. Với số lượng nhân và luồng lớn, E5-2696 v3 là lựa chọn lý tưởng cho các ứng dụng yêu cầu sức mạnh tính toán mạnh mẽ như ảo hóa, xử lý dữ liệu lớn, và các tác vụ đa nhiệm phức tạp.', 0, '../uploads/xeon-E5-2696-v3-3-6-GHz-22-nhan-44-luong.png', 2014, '0000-00-00', 101, -6, 'CPU Xeon E5 2696V3 \r\n- Số nhân/luồng: 18 nhân, 36 luồng \r\n- Xung nhịp cơ bản: 2.3 GHz \r\n- Xung nhịp tối đa: 3.6 GHz (Turbo Boost) \r\n- Bộ nhớ cache: 45MB Intel Smart Cache \r\n- Hỗ trợ bộ nhớ: DDR4 2133/1866/1600 MHz, 4 kênh \r\n- Socket: LGA 2011_3 \r\n- Công suất tiêu thụ (TDP): 145W'),
('CPU28', 'CPU', 'CPU Xeon® E5-2696 v4 3.6 GHz 22 Nhân 44 Luồng', 'INT', 3905000, 'CPU Intel Xeon® E5-2696 v4 là một bộ vi xử lý server với 22 nhân và 44 luồng, có tốc độ xung nhịp cơ bản là 3.6 GHz. Được xây dựng trên kiến trúc Broadwell và sử dụng socket LGA 2011-v3, vi xử lý này hỗ trợ bộ nhớ DDR4 và có khả năng xử lý mạnh mẽ cho các ứng dụng đòi hỏi tài nguyên tính toán cao như ảo hóa, xử lý dữ liệu lớn, và các tác vụ đa nhiệm.', 0, '../uploads/xeon-E5-2696-v4-3-6GHz-22-nhan-44-luong.webp', 2016, '0000-00-00', 101, -6, 'Tần số cơ bản: Up to 3.6 GHz -\r\nSố lõi/ luồng: 22 Nhân 44 Luồng -\r\nBộ nhớ đệm: 55 MB Cache -\r\nBus ram hỗ trợ: DDR4 1600/1866/2133/2400 -\r\nSocket: Intel LGA 2011_3'),
('CPU29', 'CPU', 'CPU Xeon® E5-2686 v4 3.0 GHz 18 Nhân 36 Luồng', 'INT', 1100000, 'CPU Intel Xeon® E5-2686 v4 là một bộ vi xử lý server với 18 nhân và 36 luồng, có tốc độ xung nhịp cơ bản là 3.0 GHz. Được xây dựng trên kiến trúc Broadwell và sử dụng socket LGA 2011-v3, vi xử lý này hỗ trợ bộ nhớ DDR4 và được tối ưu hóa cho các tác vụ đa nhiệm, xử lý dữ liệu lớn và ảo hóa.', 0, '../uploads/xeon-E5-2686-v4-3-0-GHz-18-nhan-36-luong.jpg', 2016, '0000-00-00', 101, -6, 'CPU Xeon E5_2686 V4 \r\n-Số nhân/luồng: 18 nhân, 36 luồng \r\n-Xung nhịp cơ bản: 2.3 GHz \r\n-Xung nhịp tối đa: 3.5 GHz (Turbo Boost) \r\n-Bộ nhớ cache: 45MB Intel Smart Cache \r\n-Hỗ trợ bộ nhớ: DDR4 2400/2133/1866 MHz \r\n-Socket: LGA 2011_3 \r\n-Công suất tiêu thụ (TDP): 120W \r\n-Công nghệ: 14nm, hỗ trợ Intel VT_x, VT_d, EPT, AES_NI, và Intel Hyper_Threading'),
('HDD01', 'HDD', 'HDD 500GB', 'SEA', 0, 'HDD 500GB là ổ cứng cơ học (HDD) với dung lượng lưu trữ 500GB, phù hợp cho việc lưu trữ dữ liệu thông thường như tài liệu, hình ảnh, video, và ứng dụng. Sản phẩm có kích thước phổ biến 3.5 inch cho máy tính để bàn hoặc 2.5 inch cho laptop. Tốc độ quay thông thường từ 5400 RPM đến 7200 RPM, tùy thuộc vào model.', 0, 'uploads/hdd-500g.png', 2010, '2025-01-14', 101, -6, ' Hãng sản xuất : Seagate-\r\n\r\nModel (P/N) : ST500DM002-\r\n\r\nLoại ổ : HDD-\r\n\r\nDung lượng : 500Gb-\r\n\r\nTốc độ quay  : 7200rpm-\r\n\r\nBộ nhớ Cache : 16Mb-\r\n\r\nChuẩn giao tiếp : SATA3-\r\n\r\nKích thước : 3.5Inch'),
('HDD02', 'HDD', 'HDD 1TB', 'SEA', 1342000, 'HDD 1TB là ổ cứng cơ học với dung lượng lưu trữ 1TB, lý tưởng cho việc lưu trữ dữ liệu lớn như hình ảnh, video, game và phần mềm. Sản phẩm có các kích thước thông dụng 3.5 inch cho máy tính để bàn và 2.5 inch cho laptop. Tốc độ quay thường là 5400 RPM hoặc 7200 RPM, tùy thuộc vào dòng sản phẩm.', 0, 'uploads/hdd-1t.png', 2012, '2025-01-14', 101, -6, ' Dung lượng: 1TB-\r\nKích thước: 3.5 inch-\r\nTốc độ quay: 7200RPM-\r\nGiao diện: SATA III 6Gb/s-\r\nBộ nhớ đệm: 64MB-\r\nTốc độ đọc/ghi tối đa: 190MB/s-\r\nMức tiêu thụ điện: 7.2W-\r\nĐộ ồn: 26.7 dBA (nhàn rỗi), 30 dBA (hoạt động)-\r\nTuổi thọ: 1 triệu giờ'),
('HDD03', 'HDD', 'HDD 2TB', 'SEA', 1760000, 'HDD 2TB là ổ cứng cơ học với dung lượng lưu trữ 2TB, phù hợp cho việc lưu trữ dữ liệu lớn như video 4K, game, và ứng dụng nặng. Sản phẩm thường có kích thước 3.5 inch cho máy tính để bàn hoặc 2.5 inch cho laptop, với tốc độ quay phổ biến từ 5400 RPM đến 7200 RPM.', 0, 'uploads/hdd-2t.png', 2014, '2025-01-14', 101, -6, ' Dung lượng: 2TB\r\n- Kích thước: 3.5\"\r\n- Kết nối: SATA 3\r\n- Tốc độ vòng quay: 7200RPM\r\n- Cache: 256MB'),
('HDD04', 'HDD', 'HDD 3TB', 'SEA', 0, 'HDD 3TB là ổ cứng cơ học với dung lượng lưu trữ 3TB, được thiết kế cho nhu cầu lưu trữ dữ liệu lớn như game, phim chất lượng cao, và các ứng dụng đòi hỏi không gian lưu trữ nhiều. Ổ cứng này thường có kích thước 3.5 inch dành cho máy tính để bàn, với tốc độ quay phổ biến từ 5400 RPM đến 7200 RPM.', 0, 'uploads/hdd-3t.png', 2015, '2025-01-14', 101, -6, ' Chuẩn kết nối: SATA 3 (6Gb/s) -\r\nDung lượng lưu trữ: 3TB (3000GB) -\r\nKích thước / Loại: 3.5 inch -\r\nCông nghệ Advanced Format (AF): Có -\r\nChứng nhận tiêu chuẩn RoHS -\r\nTốc độ truyền dữ liệu (max) -\r\nTốc độ chuẩn kết nối: 6 Gb/s -\r\nTốc độ ghi dữ liệu: 147 MB/s -\r\nTốc độ vòng quay: 5400 RPM -\r\nBộ nhớ đệm: 256 MB -\r\nSố lượng vòng tải / đăng tải: 300.000 -\r\nLỗi đọc không phục hồi mỗi bit: < 1 in 10^14 ');
INSERT INTO `product` (`product_id`, `category_id`, `product_name`, `brand_id`, `price`, `description`, `discount`, `image_link`, `date_first_available`, `saledate`, `amount`, `sold`, `product_thongso`) VALUES
('HDD05', 'HDD', 'HDD 6TB', 'SEA', 0, 'HDD 6TB là ổ cứng cơ học với dung lượng lưu trữ 6TB, phù hợp cho các hệ thống lưu trữ dữ liệu lớn, máy chủ, và ứng dụng đòi hỏi không gian lưu trữ cao như lưu trữ video 4K, sao lưu dữ liệu doanh nghiệp, hoặc game khủng. Kích thước phổ biến là 3.5 inch, với tốc độ quay từ 5400 RPM đến 7200 RPM, tùy dòng sản phẩm.', 0, 'uploads/hdd-6t-wd-purple.png', 2016, '2025-01-14', 101, -6, ' Dung lượng: 6TB -\r\nKích thước: 3.5\" -\r\nKết nối: SATA 3 -\r\nTốc độ vòng quay: 5400RPM -\r\nCache: 64MB\r\n '),
('HDD06', 'HDD', 'HDD 8TB', 'SEA', 0, 'HDD 8TB là ổ cứng cơ học với dung lượng lưu trữ 8TB, lý tưởng cho các hệ thống lưu trữ dữ liệu lớn như máy chủ, NAS (Network Attached Storage), sao lưu dữ liệu, và lưu trữ video chất lượng cao. Sản phẩm có kích thước phổ biến 3.5 inch cho máy tính để bàn, với tốc độ quay từ 5400 RPM đến 7200 RPM.', 0, 'uploads/hdd-8t.png', 2017, '2025-01-14', 101, -6, ' Model (P/N)	Purple : 8TB WD84PURZ -\r\nLoại ổ : HDD -\r\nDung lượng : 8Tb -\r\nTốc độ quay : 5640rpm -\r\nBộ nhớ Cache : 128Mb -\r\nChuẩn giao tiếp : SATA3 -\r\nKích thước : 3.5Inch'),
('HDD07', 'HDD', 'HDD 10TB', 'SEA', 0, 'HDD 10TB là ổ cứng cơ học với dung lượng lưu trữ 10TB, lý tưởng cho các hệ thống lưu trữ dữ liệu quy mô lớn như máy chủ, NAS, sao lưu dữ liệu hoặc lưu trữ video chất lượng cao. Sản phẩm thường có kích thước 3.5 inch cho máy tính để bàn, với tốc độ quay phổ biến từ 5400 RPM đến 7200 RPM.', 0, 'uploads/hdd-10t.png', 2018, '2025-01-14', 101, -6, ' Thích hợp trong hệ thống camera -\r\nChuẩn kết nối: SATA 3 (6Gb/s) -\r\nVòng quay : 7200RPM -\r\nBộ nhớ đệm : 256MB -\r\nKích thước : 3.5 inch'),
('ITT01', 'ITT', 'HUB Thường', 'COL', 82500, 'HUB Thường là một thiết bị chia cổng kết nối, cho phép bạn mở rộng số lượng cổng USB hoặc các loại cổng khác để kết nối nhiều thiết bị cùng lúc với máy tính. Nó không có tính năng nâng cao như các hub có tích hợp sạc hoặc hỗ trợ dữ liệu tốc độ cao.', 0, 'uploads/hub-Th_____ng.jpg', 2021, '2025-01-15', 101, -6, 'Hub có từ 4 đến 24 cổng, nhưng cũng có các loại có số cổng nhiều hơn. Đa phần Hub được sử dụng trong các mạng 10BASE-T hoặc là mạng 100BASE-T. Trong cấu trúc liên kết mạng – Hình sao (tất cả các trạm đã được kết nối với Hub ở vị trí trung tâm với vai trò thiết lập các liên kết Point to Point.'),
('ITT02', 'ITT', 'HUB ARGB', 'COL', 110000, 'HUB ARGB (Addressable RGB Hub) là một thiết bị dùng để kết nối và điều khiển các thiết bị có đèn RGB, như quạt, đèn LED và các linh kiện khác trong hệ thống máy tính. HUB ARGB cho phép bạn đồng bộ hóa ánh sáng RGB của các thiết bị này thông qua một phần mềm điều khiển, mang đến một hiệu ứng ánh sáng đẹp mắt và tùy chỉnh được.', 0, 'uploads/hub-ARGB.webp', 2021, '2025-01-15', 101, -6, ' Bộ Hub mới của Coolmoon cho phép bạn cấp nguồn cho quạt 4Pin 3pin, và cả hệ thống fan có sử dụng Led 5v ARGB. -\r\nTích hợp điều khiển đi kèm để khiển màu sắc cho quạt và tốc độ quay quạt. -\r\nTính năng đồng bộ tốc độ quạt với quạt CPU Fan, giúp bạn có hệ thống gió lưu thông ổn định, giảm độ ồn không cần thiết. -\r\nBộ Hub cấp nguồn cho 8 fan sử dụng Led 5v ARGB, ngoài ra bạn có thể sử dụng thêm dây chia nếu cần cấp nguồn cho nhiều thiết bị hơn. -\r\nCó thêm tính năng nháy theo âm thanh, hub tích hợp thêm mic thu âm, nháy theo hiệu ứng tích hợp sẵn. -\r\nBộ Hub cấp nguồn 4Pin PWM cho 5 quạt, ngoài ra có thể sử dụng thêm dây chia nếu cần cắm thêm quạt. -\r\nNote: phương án dùng thêm dây chia là phương án phụ, anh em nên sử dụng 2 Hub để đảm bảo nguồn ổn định.'),
('ITT03', 'ITT', 'WIFI TP-LINK Archer C50- 4 RÂU- 2 BĂNG TẦN', 'TPL', 462000, 'TP-LINK Archer C50 là bộ router Wi-Fi hỗ trợ 4 râu và 2 băng tần (2.4GHz và 5GHz), cung cấp tốc độ lên đến AC1200 (300Mbps ở băng tần 2.4GHz và 867Mbps ở băng tần 5GHz). Thiết bị này thích hợp cho việc sử dụng internet trong gia đình hoặc văn phòng nhỏ, với khả năng kết nối ổn định và phạm vi phủ sóng rộng.', 0, 'uploads/wifi-TP-LINK_Archer_C50-_4_R__U-_2_B__NG_T___N.jpg', 2019, '2025-01-15', 101, -6, ' Router Wi_Fi Băng Tần Kép AC1200 -\r\n4 Ăng ten cho tốc độ phát và phủ sóng mạnh -\r\nHỗ trợ chuẩn 802.11ac – chuẩn Wi_Fi thế hệ tiếp theo. -\r\nKết nối đồng thời ở hai băng tần 2.4GHz (tốc độ 300Mbps) và băng tần 5GHz (867Mbps) cho tổng băng thông khả dụng lên đến 1200 Mbps. -\r\n4 ăng ten ngoài cung cấp kết nối Wi_Fi ổn định và vùng phủ rộng lớn. -\r\nDễ dàng quản lý hệ thống mạng của bạn với ứng dụng Tether của TP_Link. -\r\nHỗ trợ IGMP Proxy/Snooping, Cầu nối và Tag VLAN để tối ưu hóa luồng IPTV. -\r\nHỗ trợ chế độ điểm truy cập để tạo ra một điểm truy cập Wi_Fi mới.'),
('ITT04', 'ITT', 'WIFI TP-LINK WR841N- 300MB- 2.4GHZ', 'TPL', 308000, 'TP-LINK WR841N là bộ router Wi-Fi hỗ trợ 300Mbps với băng tần 2.4GHz. Thiết bị này thích hợp cho nhu cầu sử dụng Internet cơ bản như lướt web, xem video và kết nối các thiết bị trong môi trường gia đình hoặc văn phòng nhỏ.', 0, 'uploads/wifi-P-LINK_WR841N-_300MB-_2.4GHZ.jpg', 2015, '2025-01-15', 101, -6, ' Hiệu suất: Tốc độ Wi_Fi chuẩn N lên đến 300Mbps, rất thuận lợi để sử dụng cho các ứng dụng tiêu thụ băng thông lớn như xem video HD trực tuyến. -\r\nMạng khách: cung cấp quyền truy cập riêng biệt cho khách trong khi vẫn đảm bảo mạng gia đình. -\r\nIPv6: tương thích với IPv6 (Internet Protocol version 6). -\r\nNút WPS: mã hóa bảo mật không dây dễ dàng bằng cách nhấn nút WPS. -\r\nIPTV: hỗ trợ IGMP Proxy/Snooping, Cầu nối và Tag VLAN để tối ưu hóa luồng IPTV. -\r\nKiểm soát băng thông: gán thiết bị ưa thích của bạn với nhiều băng thông hơn. -\r\nQuyền kiểm soát của phụ huynh: quản lý thời gian và cách thức các thiết bị được kết nối có thể truy cập internet. !'),
('ITT05', 'ITT', 'WIFI TP-LINK TL-WR840N 300MB', 'TPL', 275000, 'TP-LINK TL-WR840N là bộ router Wi-Fi hỗ trợ 300Mbps với băng tần 2.4GHz. Thiết bị này phù hợp cho các hoạt động mạng cơ bản trong gia đình hoặc văn phòng nhỏ, bao gồm lướt web, xem video và chơi game trực tuyến nhẹ.', 0, 'uploads/wifi-TP-LINK_TL-WR840N_300MB.jpg', 2015, '2025-01-15', 101, -6, ' Tốc độ Wi_Fi 300Mbps lý tưởng cho những ứng dụng yêu cầu độ trễ thấp như xem video HD trực tuyến -\r\nTrang bị 3 ăng_ten làm tăng đáng kể phạm vi phủ sóng và tính ổn định cho thiết bị -\r\nCài đặt mã hóa bảo mật Wi_Fi dễ dàng bằng cách nhấn nút WPS -\r\nKiểm soát băng thông dựa trên địa chỉ IP cho phép người quản lý giám sát lượng băng thông tiêu thụ trên mỗi máy tính -\r\nTương thích với hầu hết các giao thức IPv6 -\r\nDễ dàng quản lý và cài đặt thiết bị với ứng dụng Tether TP_LINK trên thiết bị di động'),
('ITT06', 'ITT', 'WIFI TP-LINK WR820N - 2.4HZ', 'TPL', 231000, 'TP-LINK WR820N là bộ router Wi-Fi hỗ trợ 300Mbps với băng tần 2.4GHz. Thiết bị này được thiết kế để cung cấp kết nối ổn định cho các nhu cầu sử dụng Internet cơ bản như lướt web, xem video và chơi game trực tuyến nhẹ.', 0, 'uploads/wifi-TP-LINK_WR820N_-_2.4HZ.webp', 2015, '2025-01-15', 101, -6, ' Tốc độ Wi_Fi 300Mbps trên băng tần 2.4GHz đáp ứng hoàn toàn nhu cầu của gia đình bạn. -\r\nThiết bị mạng TP_Link WR820N được trang bị hai ăng ten 5dBi mạnh mẽ và công nghệ MIMO 2x2 tăng cường truyền tải Wi_Fi cho vùng phủ sóng rộng hơn và cường độ tín hiệu tốt hơn -\r\nQuản lý mạng gia đình của bạn dễ dàng với công cụ tích hợp linh hoạt, bao gồm Quyền kiểm soát của phụ huynh, Mạng khách, QoS và hơn thế nữa.'),
('ITT07', 'ITT', 'SWITCH TP-Link 5Port LAN 100MB', 'TPL', 154000, 'TP-Link 5Port LAN 100MB là một switch mạng với 5 cổng LAN, hỗ trợ tốc độ 100Mbps. Thiết bị này được sử dụng để mở rộng mạng, kết nối nhiều thiết bị mạng với nhau.', 0, 'uploads/switch-TP-Link_5Port_LAN_100MB.jpg', 2015, '2025-01-15', 101, -6, ' Hộp chia mạng Lan 5 cổng TP-Link Switch 5 port Thiết bị TL-SF1005D là một bộ chia tín hiệu nhỏ nhắn với 5 cổng có tốc độ 10/100Mbps mang lại cho người dùng một phương thức dễ dàng trong việc mở rộng hệ thống mạng đi dây.'),
('ITT08', 'ITT', 'SWITCH TP-LINK 5PORT- GIGA- LAN 100/1000MB', 'TPL', 264000, 'TP-Link 5Port GIGA LAN 100/1000MB là một switch mạng với 5 cổng LAN, hỗ trợ tốc độ 1000Mbps (Gigabit Ethernet), giúp truyền tải dữ liệu nhanh chóng và ổn định hơn so với các switch chỉ hỗ trợ 100Mbps.', 0, 'uploads/switch-TP-LINK_5PORT-_GIGA-_LAN_100-1000MB.jpg', 2015, '2025-01-15', 101, -6, ' Thương hiệu: TP_LINK  -\r\nModel: TL_SG1005D -\r\nPort: 5 cổng RJ45 10/100/1000 Mbps -\r\nTiêu thụ điện tối đa: 3.1W (220V/50Hz) -\r\nCông nghệ xanh thân thiện với môi trường -\r\nThiết kế không quạt phù hợp với môi trường văn phòng và gia đình'),
('ITT09', 'ITT', 'SWITCH TP-LINK 8PORT LAN 100MB', 'TPL', 187000, 'TP-Link 8Port LAN 100MB là một switch mạng với 8 cổng LAN, hỗ trợ tốc độ 100Mbps. Nó thích hợp cho các môi trường mạng cơ bản, không yêu cầu tốc độ truyền tải cao.', 0, 'uploads/switch-TP-LINK_8PORT_LAN_100MB.jpg', 2015, '2025-01-15', 101, -6, ' 8 Cổng RJ45 10/100Mbps tự động đàm phán, hỗ trợ tự động_MDI / MDIX -\r\nCông nghệ Green Ethernet tiết kiệm điện năng tiêu thụ -\r\nKiểm soát luồng IEEE 802.3X cung cấp truyền dữ liệu đáng tin cậy -\r\nVỏ nhựa và thiết kế để bàn -\r\nCắm và chạy, không cần cấu hình -\r\nThiết kế không quạt đảm bảo hoạt động yên tĩnh. !'),
('ITT10', 'ITT', 'SWITCH TP-LINK 8Port- GIGA- LAN-100/1000MB', 'TPL', 440000, 'TP-Link 8Port GIGA LAN 100/1000MB là một switch mạng với 8 cổng LAN, hỗ trợ tốc độ 100/1000Mbps (Gigabit), giúp nâng cao hiệu suất mạng cho các thiết bị kết nối. Switch này thích hợp cho việc mở rộng mạng trong các môi trường văn phòng hoặc gia đình với nhu cầu băng thông lớn.', 0, 'uploads/switch-TP-LINK_8Port-_GIGA-_LAN-100-1000MB.webp', 2015, '2025-01-15', 101, -6, ' 8 cổng RJ45 Gigabit Auto_Negotiation, hỗ trợ MDI/MDIX tự động -\r\nCông nghệ Ethernet thân thiện với môi trường tiết kiệm năng lượng đến 80% -\r\nVỏ nhựa, thiết kế để bàn hoặc đế treo tường -\r\nCắm vào và sử dụng, không đòi hỏi phải cấu hình'),
('ITT11', 'ITT', 'SWITCH TP-LINK 16PORT LAN 100MB', 'TPL', 440000, 'TP-Link 16Port LAN 100MB là một switch mạng với 16 cổng LAN, hỗ trợ tốc độ 100Mbps. Đây là lựa chọn thích hợp cho các mạng LAN với nhu cầu kết nối nhiều thiết bị mà không yêu cầu tốc độ cao hơn.', 0, 'uploads/switch-TP-LINK_16PORT_LAN_100MB.jpg', 2015, '2025-01-15', 101, -6, ' 16 cổng RJ45 10/100Mbps với kỹ thuật chiếm quyền điều khiển cáp (Auto_Negotiation) và hỗ trợ tính năng MDI / MDIX -\r\nCông nghệ xanh giúp tiết kiệm điện năng lên đến 70% -\r\nKiểm soát lưu lượng IEEE 802.3x mang lại khả năng chuyển tải dữ liệu đáng tin cậy -\r\nHộp bằng nhựa, thiết kế để bàn và có thể treo tường -\r\nChỉ cần cắm vào là xài, không cần phải tinh chỉnh cấu hình'),
('ITT12', 'ITT', 'SWITCH TP-LINK 16PORT- GIGA- LAN 100/1000MB', 'TPL', 1287000, 'TP-Link 16Port GIGA LAN 100/1000MB là một switch mạng với 16 cổng LAN, hỗ trợ tốc độ 100/1000Mbps (Gigabit Ethernet). Thiết bị này lý tưởng cho các mạng LAN lớn, cung cấp khả năng kết nối nhanh chóng và ổn định cho nhiều thiết bị.', 0, 'uploads/switch-TP-LINK_16PORT-_GIGA-_LAN_100-1000MB.jpg', 2015, '2025-01-15', 101, -6, ' Tốc độ LAN: Gigabit (1000Mbps) -\r\nSố cổng: 16 Cổng -\r\nCổng kết nối: 16x cổng RJ45 10/100/1000 Mbps -\r\n(Tự động thỏa thuận/MDI tự động/MDIX) -\r\nSwitch cổng quang: Không tích hợp -\r\nSwitch quản lý: Unmanaged Switch -\r\nSwitch POE: Không tích hợp -\r\nKiểu Switch: Switch Gigabit (1000Mbps) -\r\nChất liệu vỏ: Vỏ Thép -\r\nMô tả khác: Công nghệ năng lượng hiệu quả sáng tạo giúp tiết kiệm năng lượng -\r\nHỗ trợ tự học địa chỉ MAC, tự động MDI/MDIX và tự động đàm phán -\r\nThiết kế cắm vào và sử dụng '),
('ITT13', 'ITT', 'SWITCH TP-LINK 24PORT LAN 100MB', 'TPL', 1023000, 'TP-Link 24Port LAN 100MB là một switch mạng với 24 cổng LAN, hỗ trợ tốc độ 100Mbps (Fast Ethernet). Thiết bị này thường được sử dụng trong các môi trường văn phòng hoặc doanh nghiệp nhỏ, nơi cần kết nối nhiều thiết bị mạng với tốc độ tiêu chuẩn.', 0, 'uploads/switch-TP-LINK_24PORT_LAN_100MB.jpg', 2015, '2025-01-15', 101, -6, ' 24 cổng RJ45 10/100M. -\r\nHỗ trợ MAC address selflearning và auto MDI/MDIX. -\r\nHộp thép chuẩn 13 inch.'),
('ITT14', 'ITT', 'SWITCH TPLink 24PORT GIGA -LAN 100/1000Mbs', 'TPL', 1826000, 'TP-Link 24Port GIGA LAN 100/1000Mbps là một switch mạng với 24 cổng LAN, hỗ trợ tốc độ 100/1000Mbps (Gigabit Ethernet). Thiết bị này cho phép kết nối mạng với tốc độ cao, phù hợp với môi trường cần băng thông lớn như văn phòng, doanh nghiệp hoặc trung tâm dữ liệu.', 0, 'uploads/switch-TPLink_24PORT_GIGA_-LAN_100-1000Mbs.jpg', 2015, '2025-01-15', 101, -6, ' 24 cổng RJ45 10/100/1000 Mb/giây -\r\nCông nghệ quản lý năng lượng tiên tiến có thể tiết kiệm tới 20% năng lượng -\r\nHỗ trợ tự động học địa chỉ, MDI/MDIX tự động và tự động đàm phán -\r\nMô hình cắm và chạy'),
('ITT15', 'ITT', 'WIFI TP-LINK WN722N USB - 150Mb', 'TPL', 209000, 'TP-Link WN722N USB - 150Mb là một USB Wi-Fi adapter hỗ trợ kết nối mạng không dây với tốc độ tối đa 150Mbps. Thiết bị này giúp bạn kết nối máy tính hoặc các thiết bị không hỗ trợ Wi-Fi với mạng không dây một cách dễ dàng thông qua cổng USB.', 0, 'uploads/wifi-TPLINK__WN722N_USB-_150Mb.webp', 2015, '2025-01-15', 101, -6, ' Tốc độ không dây lên tới 150Mbps mang lại trải nghiệm tốt nhất cho xem video hoặc gọi điện trên internet -\r\nMã hóa bảo mật không dây dễ dàng chỉ với 1 nút nhấn WPS -\r\nĂng ten 4dBi tháo rời được, tăng cường tối ưu độ mạnh tín hiệu của bộ chuyển đổi USB -\r\nWindows 10/8.1/8/7/XP, Mac OS X, Linux'),
('ITT16', 'ITT', 'WIFI TP-Link - AC600 - USB - 400Mb - 5GHz', 'TPL', 319000, 'TP-Link AC600 USB Wi-Fi Adapter hỗ trợ tốc độ tối đa 600Mbps, trong đó 400Mbps trên băng tần 5GHz và 200Mbps trên băng tần 2.4GHz. Thiết bị này giúp cải thiện kết nối mạng không dây cho các máy tính và thiết bị hỗ trợ USB.', 0, '../uploads/WIFI-TPlink-AC600-USB-400Mb-5GHz-1.jpg', 2015, '0000-00-00', 101, -6, 'Giao diện : USB 2.0 -\r\n \r\nKích thước ( R x D x C ) : 57.8 × 18 × 173.4 mm -\r\nĂng ten : 5dBi -\r\n \r\nChuẩn Wi_Fi : IEEE 802.11b/g/n 2.4 GHz, IEEE 802.11a/n/ac 5 GHz -\r\nTốc độ Wi_Fi : 600 Mbps (200 Mbps trên băng tần 2.4 GHz, 433 Mbps trên băng tần 5 GHz) -\r\nBăng tần : 2.4 GHz, 5 GHz\r\nChế độ Wi_Fi : Ad_Hoc / Infrastructure Mode -\r\nBảo mật Wi_Fi : WEP, WPA/WPA2, WPA_PSK/WPA2_PSK -\r\nModulation Technology : DBPSK, DQPSK, CCK, OFDM, 16_QAM, 64_QAM, 256_QAM -\r\n \r\nChứng chỉ : FCC, CE, RoHS\r\nSản phẩm bao gồm : Bộ Chuyển Đổi USB Wi_Fi Băng Tần Kép Độ Lợi Cao AC600 Archer T2U Plus -\r\n \r\n \r\nMôi trường	Nhiệt Độ Hoạt Động: 0°C~40°C (32°F ~104°F) -\r\nNhiệt Độ Lưu Trữ: _40°C~70°C (_40°F ~158°F) -\r\nĐộ Ẩm Hoạt Động: 10%~90% không ngưng tụ -\r\nĐộ Ẩm Lưu Trữ: 5%~90% không ngưng tụ'),
('ITT17', 'ITT', 'WIFI TP-LINK WN725N - USB - 150MB', 'TPL', 154000, 'TP-Link WN725N USB Wi-Fi Adapter là một bộ chuyển đổi Wi-Fi không dây có khả năng hỗ trợ tốc độ tối đa 150Mbps trên băng tần 2.4GHz. Thiết bị này nhỏ gọn, dễ dàng kết nối vào cổng USB của máy tính và thích hợp cho việc sử dụng Internet cơ bản như lướt web, xem video trực tuyến, và chơi game nhẹ.', 0, '../uploads/wifi-TP-LINK WN725N - USB - 150MB.webp', 2015, '0000-00-00', 101, -6, 'Kích thước : Dài 1.86cm x Ngang 1.5cm x Dày 0.71cm -\r\nChuẩn Wi_Fi : 802.11n -\r\nĐộ mạnh của sóng (các thiết bị mạng) : Lên đến 150Mbps -\r\nCổng giao tiếp : USB -\r\nHãng sản xuất : TP_Link -\r\nTính năng khác : Tương thích Windows 10/8.1/8/7/XP, Mac OS X, Linux'),
('ITT18', 'ITT', 'WIFI TP-LINK - WN881ND - PCI - 300Mb - 2 râu', 'TPL', 297000, 'TP-Link WN881ND là một Wi-Fi PCI adapter hỗ trợ chuẩn 802.11n và có tốc độ truyền tải lên đến 300Mbps trên băng tần 2.4GHz. Thiết bị này được cắm vào khe PCI của bo mạch chủ, giúp kết nối máy tính để bàn với mạng không dây.', 0, 'uploads/wifi-TP-LINK_-_WN881ND_-_PCI_-_300Mb_-_2_r__u.webp', 2017, '2025-01-15', 101, -6, ' Tốc độ không dây chuẩn N lên tới 300Mbps lý tưởng cho xem Video trực tuyến, chơi game trực tuyến và gọi điện thoại internet -\r\nCông nghệ MIMO với khả năng xuyên thấu tín hiệu mạnh mẽ hơn, phủ sóng không dây rộng hơn, cung cấp hiệu suất tốt hơn và ổn định hơn -\r\nDễ dàng thiết lập một liên kết bảo mật không dây cao với WPS™ (Wi_Fi Protected Setup)\r\n '),
('ITT19', 'ITT', 'WIFI TP-LINK - WN781ND - PCI - 150Mp - 1 râu', 'TPL', 209000, 'TP-Link WN781ND là một bộ chuyển đổi Wi-Fi PCI được thiết kế để cài vào khe cắm PCI của máy tính để bàn. Nó hỗ trợ chuẩn 802.11n, với tốc độ tối đa lên đến 150Mbps trên băng tần 2.4GHz.', 0, 'uploads/wifi-TP-Link_-_WN781ND_-_PCI_-_150Mp_-_1_r__u.jpg', 2014, '2025-01-15', 101, -6, ' Tốc độ truyền dữ liệu không dây lên tới 150Mbps -\r\nCung cấp giao diện PCI Express -\r\nKết nối bảo mật nâng cao với mã hóa WPA/WPA2 -\r\nTiện ích đi kèm cho phép quản lý dễ dàng'),
('ITT20', 'ITT', 'WIFI TENDA N301', 'TED', 225500, 'Tenda N301 là một bộ phát Wi-Fi (router) giá rẻ, được thiết kế cho các hộ gia đình hoặc các văn phòng nhỏ, cung cấp kết nối Wi-Fi với tốc độ cơ bản cho các thiết bị sử dụng mạng không dây.', 0, 'uploads/wifi-TENDA_N301.webp', 2013, '2025-01-15', 101, -6, ' Tenda N301 là Router WiFi thiết kế dành riêng cho gia đình. -\r\nVới giao diện dễ cài đặt, bạn có thể nhanh chóng thiết lập mạng WIFi của riêng mình chỉ với vài bước đơn giản -\r\nCung cấp WiFi chuẩn N tốc độ 300Mbps, Tenda N301 đảm bảo nhu cầu lướt web , xem phim…. mượt mà -\r\nTenda N301 hỗ trợ nhiều chế độ hoạt động như Router/AP/Repeater'),
('ITT21', 'ITT', 'USB Wifi 150MBs', 'TPL', 77000, 'USB Wifi 150Mbps thường có một số sản phẩm phổ biến từ các thương hiệu như TP-Link, Tenda, và Asus. Đây là các thiết bị chuyển đổi tín hiệu WiFi từ mạng không dây sang máy tính thông qua cổng USB, giúp kết nối internet cho các máy tính không có card mạng WiFi tích hợp.', 0, '../uploads/USB-Wifi-150MBs-4.jpg', 2015, '0000-00-00', 101, -6, 'Tốc độ không dây lên tới 150Mbps trên băng tần 2.4 GHz -\r\nKiểu dáng đẹp, thiết kế nhỏ gọn, khi cắm vào có thể để trong cổng USB của laptop -\r\nBảo mật nâng cao: Hỗ trợ mã hóa WEP 64/128, WPA, PA2/WPA_PSK/WPA2_PSK(TKIP/AES)'),
('ITT22', 'ITT', 'WIFI HOMA NEPTUNE 2 Băng Tần 2.4Ghz, 5Ghz', 'HNT', 440000, 'HOMA NEPTUNE Wi-Fi là một bộ phát Wi-Fi hai băng tần hỗ trợ cả 2.4GHz và 5GHz, cho phép người dùng lựa chọn giữa hai băng tần này để có thể tận dụng tối đa hiệu suất mạng không dây. Bộ phát này thường được sử dụng cho các môi trường có nhiều thiết bị kết nối hoặc yêu cầu băng thông cao hơn, như xem video chất lượng cao, chơi game online hoặc truyền tải dữ liệu lớn.', 0, 'uploads/wifi-HOMA_NEPTUNE_2_B__ng_T___n_2.4Ghz__5Ghz.webp', 2017, '2025-01-15', 101, -6, ' Công Nghệ Mạng	Hỗ trợ chuẩn IoT: WiFi, Zigbee 3.0, Zwave (dongle), LTE (dongle), GbE, G.hn PLC, KNX và MODBUS TCP -\r\nTốc độ data : Tri_band 8_stream WiFi Router AC3000 -\r\nTốc độ Wi_Fi : 2.4G 2×2 802.11n: lên đến 400 Mbps,5GL 2×2 802.11ac: lên đến 867 Mbps,5GH 4×4 802.11ac: lên đến 1733 Mbps -\r\nSóng : 2.4 GHz & 5 Ghz -\r\nChịu tải : 200 user ( theo nhà sản xuất ) khuyến cáo 100_150 user -\r\nKết Nối : Gigabit WAN Port x 1,Gigabit LAN Port x 1,USB 3.0 Port x1 -\r\nPhần cứng : CPU QuaLlcomm,RAM 512MB DDR3,Flash 4GB eMMC -\r\nMở rộng : Truyền internet qua điện (thêm phụ kiện) -\r\nPhụ kiện : Đế gắn, vít, sách hướng dẫn, Adapter DC, Lan 1m -\r\nNguồn điện : Adapter DC out 12V_3A, PoE (đầu chuyển PoE_DC) công suất 36W -\r\nKích thước : (mm)	205.3 x 205.3 x 45.9 -\r\nTrọng lượng : 750g\r\n'),
('ITT23', 'ITT', 'Dây mạng CAT 6 LB-LINK lõi 0.5 nhôm mạ đồng', 'LBL', 583000, 'Dây mạng CAT 6 LB-LINK với lõi 0.5mm nhôm mạ đồng là loại dây cáp mạng có khả năng truyền tải dữ liệu ở tốc độ cao và độ ổn định tốt. Dây này thường được sử dụng trong các môi trường văn phòng, gia đình, hoặc các hệ thống mạng yêu cầu tốc độ truyền tải từ 1Gbps đến 10Gbps với tần số lên đến 250MHz.', 0, 'uploads/cat-CAT_6_IT-LINK_l__i_0.5_nh__m_m_________ng.jpg', 2017, '2025-01-15', 101, -6, ' Thương hiệu: LB_Link là một thương hiệu chuyên sản xuất các sản phẩm liên quan đến mạng và kết nối. -\r\nLoại cáp: Cat6 UTP (Unshielded Twisted Pair) _ Đây là loại cáp mạng không có lớp che chắn, thích hợp cho các ứng dụng truyền dẫn dữ liệu mạng. -\r\nLõi dẫn: Sử dụng lõi dẫn CCA (Copper Clad Aluminum) hợp kim . Lõi này được làm từ nhôm phủ đồng, giúp giảm chi phí so với việc sử dụng đồng nguyên chất. -\r\nĐường kính cáp: Sử dụng cáp có đường kính 23AWG (American Wire Gauge), đo lường kích thước của dây dẫn.Đường kính lõi 0.5mm -\r\nĐiện áp : 30v ( 305m/cuộn ) -\r\nVỏ cáp: Vỏ cáp màu trắng, thường là vỏ PVC (Polyvinyl Chloride) hoặc vật liệu tương tự để bảo vệ lõi dẫn và cách điện giữa các cặp xoắn. -\r\nCó lỗi nhựa ở trung tâm chia cắt 4 cặp dây giúp chống nhiễu chéo(cross talt), cùng với dây dù trợ lực bên trong dây mạng giúp tăng độ bền và khả năng chịu tải cao -\r\nĐộ dài cuộn : 305m, có số mét trên dây.'),
('ITT24', 'ITT', 'Dây mạng CAT 6E LB-LINK lõi đồng 0.5mm', 'LBL', 2541000, 'Dây mạng CAT 6E LB-LINK với lõi đồng 0.5mm là loại dây cáp mạng chất lượng cao, được thiết kế để đáp ứng các tiêu chuẩn Ethernet tốc độ cao. Dây này hỗ trợ tốc độ truyền tải lên đến 10Gbps và tần số 250MHz, phù hợp với các mạng LAN yêu cầu băng thông cao.', 0, 'uploads/cat-CAT_6E_LB-LINK_l__i______ng_0.5mm.jpg', 2017, '2025-01-15', 101, -6, ' Cáp Mạng LB LINK -\r\nCÁP 6E UTP CCA 0.5mm -\r\nĐường Kính Lõi : 0.5mm CCA -\r\nĐiện Áp : 30V ( 305m/Cuộn ) -\r\nChất Liệu: Vỏ bộc Nhựa PVC, Lỗi Bằng Hợp kim nhôm bọc đồng,Có lỗi nhựa ở trung tâm chia cắt 4 cặp dây giúp chống nhiễu chéo(Cross Talt), cùng với dây dù trợ lực bên trong dây mạng giúp tăng độ bền và khả năng chịu tải cao -\r\nMàu Dây : Trắng -\r\nĐộ Dài : 30 -\r\n5m, Có số mét Trên Dây,Fullbox'),
('ITT25', 'ITT', 'Hạt mạng lõi đồng', 'INT', 990, 'Hạt mạng lõi đồng là một thành phần quan trọng trong quá trình lắp đặt và kết nối dây cáp mạng. Đây là loại hạt dùng để kết nối các dây dẫn trong cáp mạng vào các đầu nối (jack RJ45), giúp đảm bảo tín hiệu truyền tải ổn định và hiệu quả.', 0, 'uploads/H___t_m___ng_l__i______ng.jpg', 2012, '2025-01-15', 101, -6, ' Loại đầu bấm: nhựa trọng suốt -\r\nDùng đầu bấm cho dây mạng, cáp mạng các loại. -\r\nĐường kính ruột dẫn: 0.5 mm BC/CCA. -\r\nĐường kính bao ngoài vỏ cách điện: 0.9 mm. -\r\nĐường kính dây: 5.3 ± 0.1 mm. -\r\nTiêu chuẩn tham khảo: UL 1581, TIA/EIA 568.'),
('ITT26', 'ITT', 'Kìm bấm mạng BOSI', 'INT', 99000, 'Kìm bấm mạng BOSI Loại 1 là một công cụ được sử dụng để bấm và nối các đầu hạt mạng vào cáp Ethernet, giúp tạo các kết nối ổn định cho các hệ thống mạng. Đây là công cụ quan trọng trong việc thi công, sửa chữa hoặc lắp đặt mạng LAN.', 0, '../uploads/kim-bosi-1.jpeg', 2020, '0000-00-00', 101, -6, 'Chất liệu thép không gỉ. -\r\nBấm đầu RJ45. -\r\nBấm đầu Rj11. -\r\nThiết kế mạnh mẽ, chắc chắn . -\r\nTay cầm nhựa dễ sử dụng. -\r\nKích thước: 20cm &gt; 8cm'),
('KEY01', 'KEY', 'Bàn phím Newmen M007', 'NEM', 115500, 'Bàn phím Newmen M007 là một bàn phím cơ có thiết kế đơn giản, phù hợp cho công việc văn phòng và chơi game nhẹ. Nó thường được trang bị các công tắc cơ học cho cảm giác gõ mượt mà và độ bền cao. Mẫu bàn phím này có thể có các tính năng như đèn nền, các phím chức năng đa dạng và khả năng kết nối qua USB.', 0, 'uploads/key-Newmen_M007.jpg', 2020, '2025-01-15', 101, -6, '  Bộ Bàn phím  Newmen T007\r\n\r\n- Chuẩn kết nối: USB\r\n\r\n- Bàn phím chuẩn fullsize 104 phím\r\n\r\n \r\n\r\n- Phù hợp cho công việc văn phòng và giải trí nhẹ nhàng'),
('KEY02', 'KEY', 'Bàn phím Fuhlen L411', 'FUH', 176000, 'Bàn phím Fulhen L411 là một bàn phím có thiết kế đơn giản và hiện đại, phù hợp với nhu cầu sử dụng văn phòng hoặc giải trí cơ bản. Nó có các phím bấm chắc chắn và cảm giác gõ khá êm. Bàn phím này sử dụng kết nối USB, hỗ trợ nhiều hệ điều hành và dễ dàng sử dụng mà không cần cài đặt phần mềm.', 0, 'uploads/key-Fulhen_L411.jpg', 2021, '2025-01-15', 101, -6, ' Bàn phím Fuhlen L411 -\r\nKiểu kết nối: Có dây -\r\nChuẩn kết nối: USB -\r\nPhím chức năng: Standard -\r\nMàu: Đen'),
('KEY03', 'KEY', 'Bàn phím EDRA- EK501', 'EDR', 93500, 'Bàn phím EDRA-EK501 là bàn phím cơ học có thiết kế đơn giản, thích hợp cho công việc văn phòng và giải trí. Bàn phím này có các phím với độ bền cao và phản hồi nhanh, giúp mang lại trải nghiệm gõ thoải mái. Nó cũng hỗ trợ kết nối qua cổng USB và thường đi kèm với các tính năng như đèn nền LED.', 0, 'uploads/key-EDRA-_EK501.jpg', 2021, '2025-01-15', 101, -6, ' Giao diện: USB 2.0;\r\n- Số lượng phím: 104\r\n- Cáp bàn phím dài: 1.6M\r\n- Switch Life: 10 triệu lần\r\n- Tương thích hệ điều hành: Windows 98 / 2000 / ME / NT / XP / win 7\r\n- Màu sắc: màu đen; ( EK501); -\r\nKey thích hợp cho văn phòng với mức giá phù hợp.'),
('MNC01', 'MNC', 'Main H61 Samsung', 'SAM', 374000, 'Mainboard Samsung H61 là dòng main tầm giá rẻ của Samsung sẽ đáp ứng tốt nền tảng cho cả bộ PC của bạn. Mainboard Samsung H61 chính hãng đang được bán tại linh kiện Nam Anh với giá ưu đãi.', 0, '../uploads/6787e1d668c23_main-h61-samsung.png', 2011, '2025-01-15', 101, -6, ' CPU hỗ trợ : Intel Core i3/i5/i7/Pentium/Celeron -\r\nChipset : Intel® H61 -\r\nRAM hỗ trợ : DDR3 ( 1333,1600 ) -\r\nCARD đồ họa : VGA onboard -\r\nCARD Lan : 1000 MBit/s ( RTL8111G) Audio : ALC662 -\r\nCổng giao tiếp : 1x VGA, 1x DVI, 4x usb, 2x PS2, 1x LPT -\r\nKích thước : m_ATX'),
('MNC02', 'MNC', 'Main Gigabyte H81M-DS2', 'GIG', 616000, 'Bo mạch chủ GIGABYTE Series 8 hỗ trợ bộ xử lý Intel ® Core™ thế hệ thứ 4 mới nhất , kết hợp các tính năng và công nghệ độc đáo, mang đến nền tảng tối ưu tuyệt đối cho bản dựng PC tiếp theo của bạn', 0, 'uploads/main-giga-h81m-ds2.png', 2013, '2025-01-12', 101, -6, ' Hỗ trợ bộ xử lý Intel ® Core™ thế hệ thứ 4 -\r\nCông nghệ GIGABYTE Ultra Durable™ 4 Plus -\r\nGIGABYTE UEFI DualBIOS™ -\r\nCổng USB 3.0 với nguồn USB GIGABYTE 3x -\r\nGIGABYTE On/Off Charge™ dành cho thiết bị USB -\r\nLAN có khả năng bảo vệ ESD cao -\r\nCổng LPT, COM, D_SUB ở mặt sau -\r\nThiết kế tất cả tụ điện rắn'),
('MNC03', 'MNC', 'Main Asus B85M-E', 'ASU', 715000, 'Main Asus B85M-G cũ tháo máy văn phòng còn sạch đẹp như mới, không han rỉ nguyên zin 100%, chạy rất ổn định, chạy full các đời chip socket 1150, rấ phù hợp dựng cấu hình văn phòng, gaming - đồ hoạ, hỗ trợ tối đa cho các dòng chip đói cao như cori i5, i7 sk 1150, hỗ trợ 4 khe cắm ram rất tiện cho việc nâng cấp, dùng thay thế cho những chiếc main lỗi, main kém chất lượng', 0, 'uploads/asus-b85m-e.png', 2013, '2025-01-13', 101, -6, ' Main Asus B85M_E sk 1150 -\r\n\r\nHàng tháo máy, nhập từ KOREA - \r\n\r\nĐẹp như mới 98%, Nguyên zin 100% -\r\n\r\nĐủ chặn main -\r\n\r\nFull cổng kết nối: VGA, DVI, HDMI, Display port -\r\n\r\n4 Khe cắm Ram'),
('MNC04', 'MNC', 'Main H81 Asus', 'ASU', 616000, 'Mainboard Asus H81M-K hỗ trợ Intel® Socket 1150 for 4th Generation Core™ i7/Core™ i5/Core™ i3/Pentium®/Celeron®, Hỗ trợ Intel® 22 nm CPU,Hỗ trợ công nghệ Intel® Turbo Boost 2.0, chipset Intel® H81', 0, 'uploads/main-h81-asus.png', 2013, '2025-01-13', 101, -6, ' UEFI BIOSmới thân thiện, dễ sử dụng hơn vàtrực quan hơnvà tăng thêm thong tin hữu ích. -\r\nTăng tốc USB 3.0 Boost (Hỗ trợ UASP)   Tốc độ truyền nhanh hơn 170% so với USB 3.0 truyền thống -\r\nAI Suite 3 Chỉ một giao diện để đến với các ứng dụng tiên tiến của ASUS -\r\nGPU Boost Thăng Cấp Tới mức giới hạn với iGPU! -\r\nEPU   Hiệu quả năng lượngtoàn diệnvàthiết lập chi tiếtcông suất CPU'),
('MNC05', 'MNC', 'Main H81 Intel', 'INT', 572000, 'Main H81 là một bo mạch chủ (motherboard) được phát triển bởi Intel và được ra mắt vào năm 2013. Đây là một bo mạch chủ thuộc dòng 8 Series của Intel, cụ thể là dòng bo mạch chủ dành cho vi xử lý Intel Core thế hệ thứ 4 (Haswell) và thế hệ thứ 5 (Broadwell) với socket LGA 1150.', 0, 'uploads/main-h81-intel.png', 2013, '2025-01-13', 101, -6, ' Hãng sản xuất Intel -\r\nChipset: Intel H81 -\r\nSocket: 1150 -\r\nSố khe cắm ram: 2 -\r\nLoại ram: Ddr3 -\r\nHỗ trợ CPU đến: Intel Core I7'),
('MNC06', 'MNC', 'Main H81 Pegatron', 'PET', 572000, 'Main H81 Pegatron được thiết kế với các thành phần cấp độ quân sự, giải pháp năng lượng được nâng cấp và một bộ tùy chọn làm mát toàn diện, bo mạch chủ này mang lại hiệu suất vững chắc với độ ổn định cao khi chơi game và độ bền đã được kiểm chứng.', 0, 'uploads/main-h81-pegatron.png', 2013, '2025-01-13', 101, -6, ' Hãng sản xuất : Pegatron -\r\nKích thước : microATX Socket : 1150 -\r\nCPU hỗ trợ : Intel Core i3/i5/i7/Pentium/Celeron -\r\nChipset : H81 Ram : DDR3 ( 1333,1600 ) -\r\nLan : 1000 MBit/s ( RTL8111G) Audio : ALC662 -\r\nGiao tiếp : 1x VGA, 1x DVI, 8x usb, 2x PS2, 1x LPT, 1x COM -\r\nXuất Xứ	 : Hàn Quốc'),
('MNC07', 'MNC', 'Main H110 Pegatron', 'PET', 693000, 'Mainboard Pegatron H110 là một bo mạch chủ micro-ATX khá phổ biến nhờ các tính năng quanh CPU Intel® LGA 1151, hỗ trợ tối đa các CPU thế hệ thứ 6 và 7 của Intel như Core™ i7, i5, và i3. Với bộ nhớ DDR4 hỗ trợ tới 32GB (lên đến 2133 MHz), đồ họa tích hợp Intel HD, âm thanh 6 kênh từ Realtek, và các khe PCIe như 1 x PCIe 3.0/2.0 x16. Nó cũng đi kèm với các cổng kết nối đa dạng như SATA 6Gbps, USB 3.0/2.0 và LAN 100/1000 Mbps.', 0, 'uploads/main-h110-pegatron.png', 2015, '2025-01-13', 101, -6, ' Bộ xử lý: Intel Socket 1151 cho Bộ xử lý Core i7/Core i5/Core i3/Pentium/Celeron thế hệ thứ 6,Hỗ trợ CPU Intel 14 nm -\r\nBộ vi mạch	: IntelH110 -\r\nĐồ họa trên bo mạch	: Bộ xử lý đồ họa tích hợp Hỗ trợ Intel HD Graphics -\r\nHỗ trợ bộ nhớ	: Bộ nhớ kênh đôi DDR4 2133MHz lên đến 32GB -\r\nĐộ mờ	: 2 khe cắm bộ nhớ (Tối đa 16GB mỗi khe) -\r\nVÀ	: Trên bo mạch Realtek RTL8105E 10/100 Mbps giao diện card mạng thích ứng -\r\nÂm thanh	: Chip tích hợp Realtek 661 trên bo mạch, Hỗ trợ âm thanh ra 6 kênh -\r\nChỗ	: 1 x Khe cắm PCI Express x16 -\r\nGIỜ	: 4 cổng SATA -\r\nCổng: I/O nội bộ , 1 x Đầu nối nguồn ATX 24 chân,1 x đầu cắm USB 3.0 hỗ trợ thêm 2 cổng USB 3.0,2 x đầu cắm USB 2.0 hỗ trợ thêm 4 cổng USB 2.0,1 x Đầu nối âm thanh mặt trước,1 x Đầu nối bảng điều khiển hệ thống -\r\nCổng: I/O phía sau , 1 x cổng bàn phím USB 2.0,1 x cổng chuột USB 2.0,1x VGA,1xHDMI,2xUSB 2.0,2xUSB 3.0,1 x giắc cắm LAN -\r\nBIOS	: BIOS AMI -\r\nYếu tố hình thức	: Micro ATX – 190 x 170 mm -\r\nPhụ kiện: 1 x Đĩa CD trình điều khiển,1 x Hướng dẫn sử dụng,1 x Bảng mạch I/O'),
('MNC08', 'MNC', 'Main H110 Asus', 'ASU', 748000, 'ASUS H110 là bo mạch chủ micro-ATX, hỗ trợ CPU Intel® LGA 1151, RAM DDR4 đến 32GB, kết nối VGA/DVI-D, âm thanh HD, cổng PCIe 3.0/2.0 x16, USB 3.1 Gen 1, và các tính năng bảo vệ nâng cao của ASUS 5X Protection II. Nó cung cấp giải pháp mạnh mẽ và bền bỉ cho nhiều ứng dụng đa dạng.', 0, 'uploads/main-h110-asus.png', 2015, '2025-01-13', 101, -6, ' Chipset: Intel H110 -\r\nCPU hỗ trợ: Intel Gen 7th, Intel Gen 6th, Pentium Gold, Celeron Processors -\r\nSocket: Socket 1151 -\r\nLoại Ram: DDR4 -\r\nKích thước: Micro ATX (22.6 cm x 18.3 cm) -\r\nDung lượng Ram hỗ trợ tối đa: 32 GB'),
('MNC09', 'MNC', 'Main MSI H310- HDMI', 'MSI', 1012000, 'MSI H310M PRO-VDH là một bo mạch chủ micro-ATX với** socket Intel LGA 1151** phù hợp cho các CPU thế hệ 8 và 9. Nó hỗ trợ** 2 khe RAM DDR4** với dung lượng tối đa 32GB và tần số lên tới 2666 MHz, cùng với các cổng xuất hình ảnh như HDMI, DVI-D và VGA. Bên cạnh đó, bo mạch chủ này cung cấp các cổng kết nối đa dạng bao gồm** 4 x SATA 6Gbps, 4 x USB 2.0 và 2 x USB 3.1**, cùng với thiết kế nhỏ gọn phù hợp với nhiều loại case khác nhau.', 0, 'uploads/main-msi-h310-hdmi.png', 2018, '2025-01-13', 101, -6, ' Model : H310M PRO_VDH -\r\nSocket : LGA1151 -\r\nHỗ trợ CPU : Supports 8th Generation Intel® Core™ Processors, Pentium® Gold and Celeron® Processors for Socket LGA1151 -\r\nChipset	Intel : H310 -\r\nHỗ trợ RAM : 2 x DDR4 Supports DDR4 2666/ 2400/ 2133 MHz - Max 32Gb -\r\nCạc đồ họa : VGA onboard -\r\nÂm thanh : Realtek® ALC887 Codec. 7.1-Channel High Definition Audio -\r\nCạc mạng : 1 x RTL8111H Gigabit LAN controller -\r\nKhe cắm trong : 1 x PCIE 3.0 x16, 2 x PCIe2.0 x1, 4 x SATA3 -\r\nCổng giao tiếp ngoài : 1 x PS/2, 1 x D-Sub, 1 x DVI-D, 1 x HDMI, 4 x USB 2.0, 2 x USB 3.1 -\r\nKích thước : mATX -\r\nTính năng khác : Chống ẩm, chống tĩnh điện, chống nhiễu điện từ, chống đoản mạch, chống quá nhiệt, chống quá dòng, tích hợp đèn led báo lỗi CPU,RAM,VGA -\r\nPhụ kiện kèm theo : Sách, đĩa, cáp SATA, …'),
('MNC10', 'MNC', 'Main H310 Asus', 'ASU', 1012000, 'Mainboard H310 Asus là bo mạch chủ sử dụng chipset Intel H310, hỗ trợ các bộ vi xử lý Intel Core thế hệ thứ 8 và 9. Sản phẩm có thiết kế nhỏ gọn với chuẩn Micro-ATX, hỗ trợ RAM DDR4, khe cắm PCIe x16 cho card đồ họa, và các cổng kết nối cơ bản như USB 3.1, SATA III, và LAN.', 0, 'uploads/main-h310-asus.png', 2018, '2025-01-13', 101, -6, ' Thương hiệu : ASUS -\r\nChipset : H310 -\r\nHỗ trợ Socket : LGA 1151_ v  -\r\nChuẩn Mainboard : Micro_ATX -\r\nHỗ trợ RAM : 2 khe DDR4, tối đa 32GB -\r\nLưu trữ : 3 x SATA 6Gb/s -\r\nCổng xuất hình : 1 x VGA/D_sub -\r\nKhe PCI : 1 x PCIe 3.0 x 16,1 x PCIe 2.0 x 1 -\r\nSố cổng USB : 2 x USB 3.1 (tối đa 4),4 x USB 2.0 (tối đa 6) -\r\nÂm thanh : Realtek RTL8111H'),
('MNC11', 'MNC', 'Main H310 Gigabyte', 'GIG', 1012000, 'Mainboard H310 Gigabyte (Giga) là bo mạch chủ sử dụng chipset Intel H310, tương thích với bộ vi xử lý Intel Core thế hệ thứ 8 và 9. Sản phẩm được thiết kế với chuẩn Micro-ATX hoặc ATX tùy model, hỗ trợ RAM DDR4, cổng PCIe x16 cho card đồ họa, và các cổng kết nối như USB 3.1, SATA III, và LAN. Đặc điểm nổi bật của dòng main Gigabyte là công nghệ Ultra Durable cho độ bền cao, thiết kế tản nhiệt tốt và tính năng bảo vệ mạch điện ổn định, phù hợp với hệ thống máy tính phổ thông và văn phòng.', 0, 'uploads/main-h310-giga.png', 2018, '2025-01-13', 101, -6, ' \r\nSản phẩm : Bo mạch chủ -\r\nTên Hãng : Gigabyte -\r\nModel : H310M_DS2 -\r\nSocket : LGA1151 -\r\nHỗ trợ CPU : Support for 8th Generation Intel® Core™ i7 processors/Intel® Core™ i5 processors/Intel® Core™ i3 processors/Intel® Pentium® processors/Intel® Celeron® processors in the LGA1151 package -\r\nChipset : Intel H310 -\r\nHỗ trợ RAM : 2 x DDR4 DIMM. Support for DDR4 2666/2400/2133 MHz memory modules. Max 32Gb. -\r\nCạc đồ họa : VGA onboard -\r\nÂm thanh : Realtek® ALC887 codec -\r\nCạc mạng : Intel® GbE LAN chip (10/100/1000 Mbit) -\r\nKhe cắm trong : 1x PCIE 3.0 x16(X16), 2 x PCIe x1, 4 x SATA6 -\r\nCổng giao tiếp ngoài : 2 x PS/2, 1 x D_Sub, 1 x parallel, 1 x serial, 2 x USB 3.1 Gen 1, 4 x USB 2.0/1.1, -\r\nKích thước : mATX -\r\nTính năng khác : Intel H310 Ultra Durable motherboard with GIGABYTE 8118 Gaming LAN, Anti_Sulfur Resistor, Smart Fan5, CEC 2019 ready -\r\nPhụ kiện kèm theo : Sách, đĩa, cáp SATA, …'),
('MNC12', 'MNC', 'Main Gigabyte B365 - M2', 'GIG', 1969000, 'Mainboard Gigabyte B365M M.2 là bo mạch chủ sử dụng chipset Intel B365, được thiết kế với chuẩn Micro-ATX, tương thích với bộ vi xử lý Intel Core thế hệ thứ 8 và 9. Nó hỗ trợ RAM DDR4 dual-channel với dung lượng tối đa 64GB, có khe cắm M.2 PCIe NVMe cho SSD tốc độ cao, cổng PCIe x16 cho card đồ họa, và nhiều kết nối như USB 3.1, HDMI, VGA. Sản phẩm tích hợp công nghệ Ultra Durable của Gigabyte để tăng cường độ bền và khả năng hoạt động ổn định.', 20, 'uploads/main-giga-b365-m2.png', 2019, '2025-01-13', 101, -6, '  Chipset: Intel B365\r\n- Socket: LGA1151\r\n- Hỗ trợ CPU: Support for 9th and 8th Generation Intel® Core™ i9 processors/Intel® Core™ i7 processors/Intel® Core™ i5 processors/ Intel® Core™ i3 processors/Intel® Pentium® processors/Intel® Celeron® processors in the LGA1151 package\r\n- Cạc đồ họa: VGA onboard\r\n- Kích thước: mATX'),
('MNC13', 'MNC', 'Main ASUS B360/B365', 'ASU', 1045000, 'Mainboard ASUS B360 và B365 là bo mạch chủ sử dụng chipset Intel B360 và B365, tương thích với bộ vi xử lý Intel Core thế hệ 8 và 9 (socket LGA 1151). Cả hai dòng đều hỗ trợ RAM DDR4 dual-channel với dung lượng tối đa 64GB, cung cấp khe cắm PCIe x16 cho card đồ họa, và tích hợp kết nối lưu trữ hiện đại như SATA III và M.2 PCIe NVMe cho SSD.\r\n\r\nVề cổng kết nối, chúng có đầy đủ USB 3.1, HDMI, VGA hoặc DisplayPort (tùy model). Dòng B365 là phiên bản nâng cấp với một số cải tiến về quy trình sản xuất và khả năng hỗ trợ thiết bị lưu trữ tốt hơn so với B360.\r\n\r\nCác bo mạch chủ này được ra mắt trong khoảng từ năm 2018 (B360) đến năm 2019 (B365), thích hợp cho hệ thống máy tính tầm trung với hiệu năng ổn định.', 0, 'uploads/main-asus-b360-b365.png', 2018, '2025-01-13', 101, -6, ' Loại: mATX -\r\nModel: Nhiều loại -\r\nLoại Socket: LGA 1151 v1 -\r\nChipset: Intel B365 -\r\nSố khe Ram: 2 -\r\nDung lượng Ram tối đa: 32GB -\r\nLoại Ram: DDR4 2133, DDR4 2400, DDR4 2666'),
('MNC14', 'MNC', 'Main Gigabyte Z370', 'GIG', 1265000, 'Mainboard Gigabyte Z370 là bo mạch chủ sử dụng chipset Intel Z370, hỗ trợ bộ vi xử lý Intel Core thế hệ 8 và 9 trên socket LGA 1151. Đây là dòng mainboard thuộc phân khúc cao cấp, được thiết kế để tối ưu hiệu năng với khả năng ép xung (overclocking) CPU và RAM.', 0, 'uploads/main-giga-z370.png', 2017, '2025-01-13', 101, -6, ' Hỗ trợ vi xử lý Intel® Core™ thế hệ thứ 8 -\r\nBộ nhớ kênh đôi Non_ECC Unbuffered DDR4, 4 khe ram -\r\nSẵn sàng cho Intel® Optane™ Memory -\r\nHỗ trợ cấu hình đồ họa 2_Way CrossFire™ -\r\nCard mạng Intel® GbE LAN Gaming tích hợp phần mềm cFosSpeed giúp tăng tốc Internet -\r\nBảo vệ chống sốc điện cổng LAN 15KV và Ultra Durable™ 25KV ESD -\r\nTụ điện âm thanh chất lượng cao và đường chống nhiễu âm kèm đèn LED phát sáng -\r\nKhe M.2 siêu nhanh hỗ trợ giao diện PCIe Gen3 x4 và SATA -\r\nCông nghệ RGB FUSION hỗ trợ dây đèn LED RGB bảy màu -\r\nSmart Fan 5 tích hợp nhiều cảm biến nhiệt và đầu cấp nguồn quạt lai hỗ trợ FAN STOP -\r\nThiết kế điện trở Anti_Sulfur (chống lưu huỳnh) -\r\nAPP Center gồm tiện ích EasyTune™ và Cloud Station™'),
('MNC15', 'MNC', 'Main Gigabyte B760M Gaming Plus Wifi DDR4', 'GIG', 3135000, 'Mainboard Gigabyte B760M Gaming Plus WiFi DDR4 là bo mạch chủ chuẩn Micro-ATX, sử dụng chipset Intel B760, hỗ trợ các bộ vi xử lý Intel Core thế hệ 12, 13 và 14 trên socket LGA 1700.', 0, 'uploads/main-giga-b760m-gaming-plus-wifi-ddr4.png', 2023, '2025-01-13', 101, -6, ' Thương hiệu: GIGABYTE -\r\n\r\n\r\nSocket: LGA 1700 -\r\n\r\n\r\nHỗ trợ CPU: Intel Core 14th/ 13th /12th processors -\r\n\r\n\r\nHỗ trợ Ram: 4 khe DDR4 (Tối đa 128GB)'),
('MNC16', 'MNC', 'Main Asus H510M-K', 'ASU', 157300, 'Mainboard ASUS H510M-K là bo mạch chủ sử dụng chipset Intel H510, hỗ trợ CPU Intel Core thế hệ 10 và 11 trên socket LGA 1200. Sản phẩm thuộc phân khúc phổ thông với thiết kế Micro-ATX, hỗ trợ RAM DDR4 dual-channel tối đa 64GB, có khe cắm PCIe x16 cho card đồ họa và khe M.2 cho SSD NVMe. Cổng kết nối bao gồm USB 3.2, HDMI, và LAN Gigabit.', 0, 'uploads/main-asus-h510m-k.png', 2021, '2025-01-13', 101, -6, ' Ổ cắm Intel ® LGA 1200: Sẵn sàng cho Bộ xử lý Intel ® thế hệ thứ 11 và thứ 10 -\r\nKết nối cực nhanh: PCIe 4.0, khe cắm M.2 32Gbps, Ethernet 1 Gb và USB 3.2 Gen 1 -\r\nLàm mát toàn diện: Tản nhiệt PCH và Fan Xpert -\r\n5X Protection III: Nhiều biện pháp bảo vệ phần cứng để bảo vệ toàn diện'),
('MNC17', 'MNC', 'Main Huananzhi B760M-D4-B', 'HZH', 1738000, 'Mainboard HUANANZHI B760M-D4-B là bo mạch chủ chuẩn Micro-ATX, sử dụng chipset Intel B760, hỗ trợ các bộ vi xử lý Intel Core thế hệ 12 và 13 trên socket LGA 1700.', 0, 'uploads/main-huananzhi-b760m-d4-b.png', 2023, '2025-01-13', 101, -6, ' Support Intel LGA1700 -\r\n2 x DDR4 memory slot，Max support 64GB -\r\nSupport Dual channels DDR4 3200/2666/2400/2133MHz -\r\n4xSATA3.0 6Gbps interfaces -\r\n1xPCI Expressx164.0@5.0，1xPCI Expressx4 4.0 -\r\n2xM.2 22110 NVME PCIE X4 4.0 -\r\n10 phase power supply -\r\n1 xCOMPIN，1x Debug pin'),
('MNC18', 'MNC', 'Main MSI H510M-B Pro', 'MSI', 1485000, 'Mainboard MSI H510M-B PRO là bo mạch chủ chuẩn Micro-ATX, sử dụng chipset Intel H510, hỗ trợ bộ vi xử lý Intel Core thế hệ 10 và 11 trên socket LGA 1200. Đây là bo mạch chủ thuộc phân khúc phổ thông, cung cấp các tính năng cơ bản cho người dùng văn phòng và các hệ thống máy tính gia đình.', 0, 'uploads/main-msi-h510m-b.png', 2021, '2025-01-13', 101, -6, ' Socket: LGA 1200 chỉ hỗ trợ 10th Gen Intel Core and Pentium Gold/Celeron, không hỗ trợ 11th gen Intel processors -\r\nKích thước: mATX -\r\nKhe cắm RAM: 2 khe (Tối đa 64GB) -\r\nKhe cắm mở rộng: 1x PCI_E x16 slot, 1x PCI_E x1 slot'),
('MNC19', 'MNC', 'Main Gigabyte H510M-H', 'GIG', 2079000, 'Mainboard Gigabyte H510M-H là bo mạch chủ chuẩn Micro-ATX, sử dụng chipset Intel H510, hỗ trợ các bộ vi xử lý Intel Core thế hệ 10 và 11 trên socket LGA 1200.', 13, 'uploads/main-giga-h510m-h.png', 2021, '2025-01-13', 101, -6, ' Chipset: Intel H510 -\r\nSocket: LGA 1200 -\r\nKích thước: M_ATX -\r\nSố khe RAM: 2'),
('MNC20', 'MNC', 'Main SSTC H510M-HDV - 2M2', 'STC', 1320000, 'Mainboard SSTC H510M-HDV-2M.2 là bo mạch chủ chuẩn Micro-ATX, sử dụng chipset Intel H510, hỗ trợ các bộ vi xử lý Intel Core thế hệ 10 và 11 trên socket LGA 1200.', 0, 'uploads/main-sstc-h510m-2m2.png', 2020, '2025-01-13', 101, -6, ' Nền tảng : Micro ATX 2 x DDR4 -\r\nMẫu / SKU : H510M_HDV_2M.2 - \r\nĐặc điểm nổi bật : Hỗ trợ 2 khe M.2 đa dạng: NVMe, SATA, Wifi, Trang bị đủ 3 cổng đầu ra màn hình tiêu chuẩn : HDMI, DisplayPort, D_sub (VGA) -\r\nHỗ trợ bộ vi xử lý : Intel Socket LGA 1200 thế hệ 10 11 Core i3 i5 i7 -\r\nBộ vi mạch : Intel H470 / H510, Bộ nhớ	2 kênh DDR4 xung tối đa 2933Mhz hoặc thấp hơn., Hỗ trợ tối đa 64GB -\r\nKết nối mạng : Realtek 10/100/1000 Mbs -\r\nÂm thanh : Realtek ALC897 -\r\nKhe mở rộng : 1 x khe PCIe 4.0 X16, 1 x khe PCIe 4.0 X1, Lưu trữ	4 x SATA 3 6Gbs, 1 x M.2 NVMe 2280 Pcie 3.0 (3 x 4) -\r\nCổng kết nối sau : 2 x chuột bàn phím P/S 2, 1 x DP 1.4 hỗ trợ độ phân giải 4K, 1 x HDMI 2.0 hỗ trợ độ phân giải 4K, 1 x VGA, 4 x USB 3.2 Gen 1, 1 x LAN RJ45, 3 x Âm thanh 3,5 inch -\r\nChân cắm mở rộng : 1 x M.2 Wifi, 2 x USB 2.0, 2 x USB 3.2, 1 x COM RSS232, 1 x TMP 2.0, 1 x Âm thanh bảng mặt trước, 1 x Bảng điều khiển hệ thống (Nguồn, Led), 2 x Đèn quạt hệ thống dự đoán\r\n'),
('MNC21', 'MNC', 'Main Gigabyte H610 M-H', 'GIG', 1848000, 'Mainboard Gigabyte H610M-H là bo mạch chủ chuẩn Micro-ATX sử dụng chipset Intel H610, hỗ trợ các bộ vi xử lý Intel Core thế hệ 12 và 13 trên socket LGA 1700.', 0, 'uploads/main-giga-h610m-h.png', 2022, '2025-01-13', 101, -6, ' Hỗ trợ bộ vi xử lý Intel ® Core™ thế hệ 14/13/12 -\r\nKênh đôi Không ECC Không đệm DDR4, 2 DIMM -\r\nThiết kế VRM kỹ thuật số lai 6+1+1 -\r\nIntel ®  GbE LAN với phần mềm tăng tốc Internet cFosSpeed -\r\nNVMe PCIe 3.0 x4 M.2 -\r\nTụ điện âm thanh chất lượng cao và bộ lọc tiếng ồn âm thanh -\r\nSmart Fan 6 có nhiều cảm biến nhiệt độ, đầu cắm quạt lai với FAN STOP -\r\nGIGABYTE APP Center, sử dụng đơn giản và dễ dàng -\r\nThiết kế điện trở chống lưu huỳnh'),
('MNC22', 'MNC', 'Main MSI H610M-E PRO', 'MSI', 1859000, 'Mainboard MSI H610M-E PRO là bo mạch chủ chuẩn Micro-ATX, sử dụng chipset Intel H610, hỗ trợ các bộ vi xử lý Intel Core thế hệ 12 và 13 trên socket LGA 1700.', 0, 'uploads/main-msi-h610m-e-pro.png', 2022, '2025-01-13', 101, -6, ' Socket: LGA1700 hỗ trợ CPU Intel thế hệ thứ 12, 13 và 14 -\r\nKích thước: mATX -\r\nKhe cắm RAM: 2 khe (Tối đa 64GB) -\r\nKhe cắm mở rộng: 1x PCIe x16 slot, 1x PCIe x1 slot -\r\nKhe cắm ổ cứng: 4x SATA 6Gb/s ports, 1x M.2 slot'),
('MNC23', 'MNC', 'Main Asus H610 M-K D4', 'ASU', 1793000, 'Mainboard ASUS H610M-K D4 là bo mạch chủ chuẩn Micro-ATX sử dụng chipset Intel H610, hỗ trợ các bộ vi xử lý Intel Core thế hệ 12 và 13 trên socket LGA 1700.', 0, 'uploads/main-asus-h610m-k-d4.png', 2021, '2025-01-13', 101, -6, ' Socket: Intel® LGA1700 hỗ trợ CPU Intel thế hệ thứ 12, 13 và 14 -\r\nKích thước: mATX -\r\nKhe cắm RAM: 2 khe (Tối đa 64GB) -\r\nKhe cắm mở rộng: 1 x PCIe 4.0 x16 slot, 1 x PCIe 3.0 x1 slot -\r\nKhe cắm ổ cứng: M.2 slot (Key M), 4 x SATA 6Gb/s ports'),
('MNC24', 'MNC', 'Main MSI Pro B760M-E DDR4', 'MSI', 2420000, 'Mainboard MSI PRO B760M-E DDR4 là bo mạch chủ Micro-ATX, sử dụng chipset Intel B760, hỗ trợ Intel Core thế hệ 12 và 13 (LGA 1700). Nó có 4 khe DDR4 (tối đa 64GB), khe PCIe 4.0 x16, 2 khe M.2 NVMe và các cổng kết nối như USB 3.2, HDMI, LAN.', 5, 'uploads/main-msi-pro-b760m-e-ddr4.png', 2023, '2025-01-13', 101, -6, ' Socket: LGA1700 hỗ trợ CPU Intel thế hệ thứ 12, 13 và 14 -\r\nKích thước: mATX -\r\nKhe cắm RAM: 2 khe (Tối đa 64GB) -\r\nKhe cắm mở rộng: 1x PCI_E x16 slot, 1x PCI_E x1 slot -\r\nKhe cắm ổ cứng: 1x M.2 slot, 4x SATA 6G port'),
('MNC25', 'MNC', 'Main Asus TUF GAMING B760M-E D4', 'ASU', 3190000, 'Mainboard ASUS TUF GAMING B760M-E D4 là bo mạch chủ Micro-ATX, sử dụng chipset Intel B760, hỗ trợ Intel Core thế hệ 12 và 13 (LGA 1700). Nó có 4 khe DDR4 (tối đa 64GB), khe PCIe 4.0 x16, 2 khe M.2 NVMe, cùng với các cổng kết nối USB 3.2, HDMI, LAN.', 10, 'uploads/main-asus-tuf-gaming-b760m-e-d4.png', 2023, '2025-01-13', 101, -6, ' Socket: LGA1700 -\r\nChipset: B760 -\r\nKích thước: Micro ATX -\r\nKhe cắm RAM: 4 khe (Tối đa 128GB) -\r\nKhe cắm ổ cứng: M.2 connectors, 4 x SATA 6Gb/s ports'),
('MNC26', 'MNC', 'Main Z690M Aorus Elite - D4', 'AOR', 4345000, 'Gigabyte Z690M Aorus Elite - D4 là một bo mạch chủ gaming thuộc dòng Aorus nổi tiếng của Gigabyte, được thiết kế cho các hệ thống máy tính để bàn. Nó sử dụng chipset Intel Z690, hỗ trợ các CPU Intel thế hệ 12 và 13, và có form factor mATX, rất phù hợp cho những chiếc case máy tính có kích thước vừa phải.', 0, 'uploads/main-z690m-aorus-elite-d4.png', 2021, '2025-01-13', 101, -6, ' Chipset: Intel Z690 -\r\nSocket: Intel LGA 1700 -\r\nKích thước Main: M_ATX -\r\nHỗ trợ CPU: LGA1700 socket: Support for the 14th, 13th, and 12th Generation Intel® Core™, Pentium® Gold and Celeron® Processors -\r\nKhe cắm RAM: 4 khe ram -\r\nLoại RAM: DDR4'),
('MNC27', 'MNC', 'Main Mobo B760M4 Plus - DDR4', 'MOB', 1628000, 'Mainboard Mobo B760M4 Plus DDR4 là bo mạch chủ Micro-ATX, sử dụng chipset Intel B760, hỗ trợ Intel Core thế hệ 12 và 13 (LGA 1700). Nó có 4 khe DDR4 (tối đa 64GB), khe PCIe 4.0 x16, 2 khe M.2 NVMe, và các cổng kết nối như USB 3.2, HDMI, LAN.', 0, 'uploads/main-mobo-b760m4-plus-d4.png', 2023, '2025-01-13', 101, -6, ' Đặc điểm nổi bật : Thiết kế Tripple Power Phase VRM hỗ trợ CPU công suất lên tới 300W, Trang bị toàn bộ tản nhiệt cho toàn bộ dãy Power Phase VRM, Khung kim loại chống cong và tản nhiệt cho khe cắm PCIe X16, Trang bị đủ 3 cổng xuất hình tiêu chuẩn : HDMI, DisplayPort, D, sub (VGA) -\r\nHỗ trợ bộ vi xử lý : Intel Socket LGA 1700 thế hệ 12, 13, 14, Core i3 i5 i7 -\r\nChipset : Intel B760 -\r\nBộ nhớ : 2 kênh DDR4 xung tối đa 3200Mhz hoặc thấp hơn, Tối đa hỗ trợ 128GB, Hỗ trợ tăng tốc bộ nhớ XMP -\r\nKết nối mạng : Realtek 10/100/1000 Mbs -\r\nÂm thanh : Realtek ALC897 -\r\nKhe mở rộng : 1 x khe PCIe 4.0 X16, 1 x khe PCIe 4.0 X1 -\r\nLưu trữ : 4 x SATA 3 6Gbs (3 cổng Sata + 1 cổng M.2 SATA), 2 x M.2 NVMe 2280 Pcie 4.0 (4 x 4) -\r\nCổng kết nối sau : 2 x P/S 2 keyboard mouse, 1 x DP 1.4 hỗ trợ độ phân giải 4K, 1 x HDMI 2.0 hỗ trợ độ phân giải 4K, 1 x VGA, 2 x USB 2.0, 4 x USB 3.2, 1 x LAN RJ45, 3 x Audio 3.5″ -\r\nChân cắm mở rộng : 1 x M.2 Wifi, 2 x USB 2.0, 2 x USB 3.2, 1 x COM RSS232, 1 x TMP 2.0, 1 x Front Panel Audio, 1 x System Panel (Power , Led), 2 x System Fan '),
('MNC28', 'MNC', 'Main Mobo H610M-V2 DDR4', 'MOB', 1408000, 'Mainboard Mobo H610M-V2 DDR4 là bo mạch chủ Micro-ATX, sử dụng chipset Intel H610, hỗ trợ Intel Core thế hệ 12 và 13 (LGA 1700). Nó có 2 khe DDR4 (tối đa 64GB), khe PCIe 4.0 x16, 1 khe M.2 NVMe, và các cổng kết nối như USB 3.2, HDMI, LAN.', 0, 'uploads/main-mobo-h610m-v2-d4.png', 2022, '2025-01-13', 101, -6, ' Hỗ trợ bộ vi xử lý Intel ® Core™ thế hệ 14/13/12 -\r\nKênh đôi Không ECC Không đệm DDR4, 2 DIMM -\r\nThiết kế VRM kỹ thuật số lai 6+1+1 -\r\nGbE LAN với Quản lý băng thông -\r\nNVMe PCIe 3.0 x4 M.2 -\r\nTụ điện âm thanh chất lượng cao và bộ lọc tiếng ồn âm thanh -\r\nSmart Fan 6 có nhiều cảm biến nhiệt độ, đầu cắm quạt lai với FAN STOP -\r\nGIGABYTE APP Center, sử dụng đơn giản và dễ dàng -\r\nThiết kế điện trở chống lưu huỳnh'),
('MNC29', 'MNC', 'Main HUANANZHI X99 TFQ Đơn', 'HZH', 2255000, 'Main HUANANZHI X99 TFQ Đơn là một bo mạch chủ hỗ trợ nền tảng Intel X99, dành cho các bộ vi xử lý Intel Xeon E5 và Core i7 đời cũ. Mainboard này thiết kế cho các hệ thống workstation hoặc máy tính hiệu suất cao, với hỗ trợ nhiều khe cắm RAM DDR4 và nhiều cổng kết nối. Về mặt tính năng, X99 TFQ Đơn thường được trang bị khả năng mở rộng tốt với các khe PCIe và cổng USB đa dạng. Nó thích hợp cho các ứng dụng đòi hỏi cấu hình mạnh mẽ.', 0, 'uploads/main-HUANANZHI_X99_TFQ_____n.webp', 2019, '2025-01-15', 101, -6, ' Hỗ trợ CPU: NVIDIA and AMD Graphics Cards -\r\nSocket: LGA2011_3 -\r\nHỗ trợ Ram: 4 x DDR4+4 x DDR3 memory slot -\r\nKích thước: ATX'),
('MNC30', 'MNC', 'Main HUANANZHI X99 - QD4', 'HZH', 1705000, 'Main HUANANZHI X99 - QD4 là một bo mạch chủ sử dụng chipset Intel X99, hỗ trợ các bộ vi xử lý Intel Xeon E5 và Core i7 đời cũ. Mainboard này thường được thiết kế cho các hệ thống workstation, với nhiều khe cắm RAM DDR4, hỗ trợ tính năng mở rộng qua các khe PCIe và kết nối USB đa dạng. Bảng mạch này cung cấp khả năng xử lý mạnh mẽ cho các ứng dụng đòi hỏi hiệu suất cao, chẳng hạn như thiết kế đồ họa, xử lý video, hoặc các công việc tính toán nặng.', 0, 'uploads/main-HUANANZHI_X99_-_QD4.webp', 2019, '2025-01-15', 101, -6, ' Support Intel LGA201_3 platform processor -\r\nSupport four channel DDR4 2400/2133/1866MHz Memory -\r\n6 x SATA 3.0 6Gbps -\r\n1 x PCI Express3.0 x16，1xPCI Express3.0 x4，1xPCI Express2.0x1 -\r\n2x M.2 2280 NVME PCIE X4 3.0 32Gb/s -\r\nRealtek High Fidelity Audio -\r\n2xUSB3.0，4xUSB2.0，2 x USB2.0 PIN，1 x USB3.0 PIN');
INSERT INTO `product` (`product_id`, `category_id`, `product_name`, `brand_id`, `price`, `description`, `discount`, `image_link`, `date_first_available`, `saledate`, `amount`, `sold`, `product_thongso`) VALUES
('MNC31', 'MNC', 'Main HUANANZHI X99 F8D Plus', 'HZH', 3795000, 'Main HUANANZHI X99 F8D Plus là một bo mạch chủ dựa trên chipset Intel X99, thiết kế dành cho các bộ vi xử lý Intel Xeon E5 và Core i7 đời cũ. Bo mạch này hỗ trợ bộ nhớ DDR4, nhiều khe PCIe cho các card mở rộng và có các cổng kết nối đa dạng. Nó được tối ưu hóa cho các ứng dụng đòi hỏi hiệu suất cao như workstation hoặc máy tính chơi game cao cấp.', 0, 'uploads/main-HUANANZHI_X99_F8D_Plus.jpg', 2019, '2025-01-15', 101, -6, ' Sản phẩm : Bo mạch chủ -\r\nModel : X99_F8D Plus ( Dual Xeon) -\r\nSocket : LGA 2011_3 và LGA2011, Hỗ trợ E5 2678V3 / 2676V3 / 2673V3 / 2629V3 / 2649V3 / 2669V3 / 2696V3 -\r\n\r\nCấu trúc : M_ATX -\r\nVGA ổ cắm  : 2 * PCI_E X 16 -\r\nCổng nguồn  : 24Pin + 8Pin -\r\nBộ nhớ ổ cắm  : 8 * DDR4 -\r\nTối đa : 256GB -\r\nSố lượng quạt Giao diện  : 4 -\r\nHỗ trợ giao tiếp : NON_ECC / REG ECC / ECC'),
('MNC32', 'MNC', 'Main HUANANZHI X99 F8D Đôi - DDR4', 'HZH', 3355000, 'Main HUANANZHI X99 F8D Đôi - DDR4 là bo mạch chủ sử dụng chipset Intel X99, hỗ trợ các bộ vi xử lý Intel Xeon E5 và Core i7 đời cũ. Với thiết kế hỗ trợ bộ nhớ DDR4, mainboard này cung cấp khả năng mở rộng mạnh mẽ nhờ các khe PCIe cho card đồ họa và thiết bị ngoại vi. Đặc biệt, phiên bản \"Đôi\" này hỗ trợ nhiều khe RAM và các tính năng mở rộng khác, phù hợp cho các hệ thống workstation và máy tính hiệu năng cao.', 0, 'uploads/main-HUANANZHI_X99_F8D_____i_-_DDR4.png', 2019, '2025-01-15', 101, -6, ' Hãng: HUANANZHI -\r\n Chipset: X99 -\r\n Socket: FCLGA2011_3 -\r\n Hỗ trợ CPU: Intel Xeon Family e5, Intel Core 5th & 6th/ Intel Core X 5th & 6th LGA2011 & 2011_3 -\r\n RAM: 8xDDR4 Quad_channel, max 512GB 2400MHz (non_ECC & ECC) -\r\n Khe cắm mở rộng: 3xPCI3.0 x16, 3xPCI 3.0 x8 -\r\n Khe cắm M2: 2xM.2 22110 NVME PCIE X4 3.0, 1x M.2 2280 NVME PCIE X4 2.0'),
('MNC33', 'MNC', 'Main HUANANZHI X99 T8D Đôi - DDR3', 'HZH', 3245000, 'Main HUANANZHI X99 T8D Đôi - DDR3 là bo mạch chủ sử dụng chipset Intel X99, hỗ trợ bộ vi xử lý Intel Xeon E5 và Core i7 đời cũ. Phiên bản \"Đôi\" của bo mạch chủ này hỗ trợ hai khe bộ nhớ, sử dụng RAM DDR3 thay vì DDR4 như các bo mạch khác cùng dòng. Đây là lựa chọn tốt cho các hệ thống workstation hoặc các máy tính đòi hỏi hiệu suất mạnh mẽ nhưng với ngân sách hạn chế, vì DDR3 có giá thành thấp hơn so với DDR4.', 0, 'uploads/main-HUANANZHI_X99_T8D_____i_-_DDR3.webp', 2019, '2025-01-15', 101, -6, ' Support E5 2678V3/2676V3/2673V3/2629V3/2649V3/2669V3/2696V3 -\r\n8xDDR3 Memory Slot, DDR3 1866/1600/1333 MHz -\r\nSupport NON_ECC/REG ECC/ECC memory -\r\nM.2 NVME +M.2 NGFF interface -\r\n12 layer PCB, 6+6Phases power supply -\r\n6 x USB 3.0 port(s) (4 at back panel, 2 at mid_board),4 x USB 2.0 port(s) -\r\n10*SATA 3.0 interface -\r\n3*PCIe 3.0/2.0 x16 (x16 mode) -\r\nRJ45 Gigabit Ethernet Card*2'),
('MOR01', 'MOR', 'Màn hình LG 24MR400- IPS -100HZ-5ms', 'LGS', 2255000, 'Màn hình LG 24MR400 là màn hình có kích thước 24 inch với tấm nền IPS, cho góc nhìn rộng và màu sắc chính xác. Sản phẩm hỗ trợ tần số quét 100Hz và thời gian phản hồi 5ms, lý tưởng cho các nhu cầu chơi game và xem video. Màn hình này cung cấp độ sáng và độ tương phản cao, giúp trải nghiệm thị giác mượt mà và sắc nét.', 0, 'uploads/M__n_h__nh_LG_24MR400-_IPS_-100HZ-5ms.jpg', 2020, '2025-01-14', 101, -6, ' Tên sản phẩm: Màn hình LG 24MR400-B -\r\nThương hiệu: LG -\r\nKích thước: 24\" -\r\nĐộ phân giải: Full HD (1920x1080) -\r\nKiểu thiết kế: 16:9 - Phẳng -\r\nTấm nền: IPS -\r\nTần số quét: 100Hz -\r\nThời gian đáp ứng: 5 ms (GtG nhanh hơn) -\r\nCổng kết nối: 1x D-sub, 1x HDMI -\r\nHỗ trợ sử dụng tay treo: 100x100 -\r\nTích hợp loa: không'),
('MOR02', 'MOR', 'Màn hình LG 27GQ50F -VA 165HZ-5ms', 'LGS', 3685000, 'Màn hình LG 27GQ50F là màn hình kích thước 27 inch sử dụng tấm nền VA, mang lại độ tương phản cao và màu đen sâu. Sản phẩm hỗ trợ tần số quét 165Hz và thời gian phản hồi 5ms, tối ưu cho chơi game với trải nghiệm hình ảnh mượt mà và giảm hiện tượng xé hình. Màn hình có các công nghệ cải thiện chất lượng hiển thị và bảo vệ mắt người dùng.', 0, 'uploads/man-hinh-LG_27GQ50F_-VA_165HZ-5ms.jpg', 2022, '2025-01-14', 101, -6, ' Kích thước màn hình: 27 inch -\r\n\r\nĐộ phân giải: 1920 x 1080 Pixels -\r\n\r\nChuẩn màn hình: FHD -\r\n\r\nĐộ sáng: 250 nits -\r\n\r\nĐộ tương phản: 3000:1 -\r\n\r\nTấm nền: VA -\r\n\r\nTần số quét: 165 Hz -\r\n\r\nTỷ lệ màn hình: 16:09 -\r\n\r\nMàu màn hình: 16.7 Triệu -\r\n\r\nMàn hình cảm ứng: Không'),
('MOR03', 'MOR', 'Màn hình SAMSUNG 24C310 75HZ', 'SAM', 2420000, 'Màn hình Samsung 24C310 là màn hình kích thước 24 inch với thiết kế hiện đại, phù hợp cho cả công việc và giải trí. Sản phẩm hỗ trợ tần số quét 75Hz, mang lại hình ảnh mượt mà hơn so với màn hình 60Hz truyền thống, giúp cải thiện trải nghiệm xem phim và chơi game. Công nghệ hiển thị tiên tiến cho màu sắc sống động và góc nhìn tốt.', 0, 'uploads/man-hinh-SAMSUNG_24C310_75HZ.jpg', 2021, '2025-01-14', 101, -6, ' Loại màn hình: Màn hình phẳng -\r\n\r\nKích thước màn hình: 24 inch -\r\n\r\nCông nghệ màn hình:IPS -\r\n\r\nĐộ phân giải: 1920 x 1080 Pixels -\r\n\r\nChuẩn màn hình: FHD -\r\n\r\nĐộ sáng: 250 nits -\r\n\r\nĐộ tương phản: 1000:1 -\r\n\r\nTấm nền: IPS -\r\n\r\nTần số quét: 75 Hz'),
('MOR04', 'MOR', 'Màn hình DELL ULTRASHARP U2424H -120Hz-5ms', 'DEL', 5995000, 'Màn hình Dell UltraSharp U2424H là màn hình kích thước 24 inch, nổi bật với chất lượng hiển thị cao cấp. Tấm nền IPS mang lại màu sắc chính xác và góc nhìn rộng. Sản phẩm hỗ trợ tần số quét 120Hz và thời gian phản hồi 5ms, lý tưởng cho công việc sáng tạo nội dung và giải trí. UltraSharp cũng đi kèm với khả năng hiệu chỉnh màu sắc chuyên nghiệp và thiết kế viền mỏng hiện đại.', 0, 'uploads/man-hinh-DELL_ULTRASHARP_U2424H_-120Hz-5ms.webp', 2023, '2025-01-14', 101, -6, ' Loại màn hình: LED -\r\n\r\nKích thước màn hình: 24 inch -\r\n\r\nCông nghệ màn hình: IPS LCD -\r\n\r\nĐộ phân giải: 1920 x 1080 Pixels -\r\n\r\nChuẩn màn hình: FHD -\r\n\r\nĐộ sáng: 250 nits -\r\n\r\nĐộ tương phản:1000:1 -\r\n\r\nTấm nền: IPS -\r\n\r\nTần số quét: 120Hz -\r\n\r\nTỷ lệ màn hình: 16:09 -\r\n\r\nMàu màn hình: 16.7 Triệu'),
('MOR05', 'MOR', 'Màn hình DUAN IP25F180 IPS - 1ms', 'DUA', 2310000, 'Màn hình DUAN IP25F180 là màn hình kích thước 25 inch với tấm nền IPS, cho màu sắc trung thực và góc nhìn rộng. Sản phẩm có thời gian phản hồi 1ms và tần số quét cao (thường từ 165Hz đến 180Hz, tùy phiên bản), phù hợp cho game thủ và các ứng dụng yêu cầu phản hồi nhanh. Thiết kế hiện đại và các tính năng giảm mỏi mắt giúp tăng cường trải nghiệm người dùng.', 0, 'uploads/man-hinh-DUAN_IP25F180_IPS_-_1ms.webp', 2022, '2025-01-14', 101, -6, ' Loại màn hình: LED -\r\n\r\nKích thước màn hình: 25 inch -\r\n\r\nCông nghệ màn hình: IPS LCD -\r\n\r\nĐộ phân giải: 1920 x 1080 Pixels -\r\n\r\nChuẩn màn hình: FHD -\r\n\r\nĐộ sáng: 300 nits -\r\n\r\nĐộ tương phản: 1000:1 -\r\n\r\nTấm nền: IPS -\r\n\r\nTần số quét: 180 Hz -\r\n\r\nThời gian phản hồi: 1 ms -\r\n\r\nTỷ lệ màn hình: 16:9 -\r\n\r\nMàu màn hình: 16.7 triệu màu\r\n'),
('MOR06', 'MOR', 'Màn hình DUAN V2218s 75HZ- 2ms - ĐEN', 'DUA', 1375000, 'Màn hình DUAN V2218s là màn hình kích thước 21.5 inch với thiết kế viền mỏng hiện đại. Sản phẩm hỗ trợ tần số quét 75Hz và thời gian phản hồi 2ms, phù hợp cho nhu cầu văn phòng, giải trí và chơi game cơ bản. Màn hình mang đến chất lượng hiển thị sắc nét với màu đen sâu, giúp tăng cường trải nghiệm hình ảnh.', 0, 'uploads/man-hinh-DUAN_V2218s_75HZ-_2ms_-___EN.webp', 2021, '2025-01-14', 101, -6, ' Loại màn hình: LED -\r\n\r\nKích thước màn hình: 22 inch -\r\n\r\nCông nghệ màn hình: IPS LCD -\r\n\r\nĐộ phân giải: 1920 x 1080 Pixels -\r\n\r\nChuẩn màn hình: FHD -\r\n\r\nĐộ sáng: 250 nits -\r\n\r\nĐộ tương phản: 1000:1 -\r\n\r\nTấm nền: IPS -\r\n\r\nTần số quét: 75 Hz -\r\n\r\nThời gian phản hồi: 2 ms -\r\n\r\nTỷ lệ màn hình: 16:9 -\r\n\r\nMàu màn hình: 16.7 triệu màu'),
('MOR07', 'MOR', 'Màn hình DUAN 24 DA-IP248S Tấm nền IPS 75Hz', 'DUA', 1628000, 'Màn hình DUAN 24 DA-IP248S là màn hình kích thước 24 inch với tấm nền IPS, mang lại góc nhìn rộng và màu sắc chính xác. Sản phẩm hỗ trợ tần số quét 75Hz, giúp hiển thị hình ảnh mượt mà hơn so với các màn hình thông thường 60Hz, phù hợp cho công việc văn phòng, giải trí và chơi game cơ bản.', 0, 'uploads/man-hinh-DUAN_24_DA-IP248S_T___m_n___n_IPS_75Hz.jpg', 2022, '2025-01-15', 101, -6, ' Loại màn hình: LED -\r\n\r\nKích thước màn hình: 24 inch -\r\n\r\nCông nghệ màn hình: IPS LCD -\r\n\r\nĐộ phân giải: 1920 x 1080 Pixels -\r\n\r\nChuẩn màn hình: FHD -\r\n\r\nĐộ sáng: 250 nits -\r\n\r\nĐộ tương phản: 1000:1 -\r\n\r\nTấm nền: IPS -\r\n\r\nTần số quét: 75 Hz -\r\n\r\nThời gian phản hồi: 5 ms -\r\n\r\nTỷ lệ màn hình: 16:9 -\r\n\r\nMàu màn hình: 16.7 triệu màu\r\n'),
('MOR08', 'MOR', 'Màn hình DUAN VG2709H- Cong - 100hz - Đen', 'DUA', 2530000, 'Màn hình Duan VG2709H là màn hình cong kích thước 27 inch với thiết kế hiện đại và trải nghiệm hình ảnh bao quanh. Sản phẩm hỗ trợ tần số quét 100Hz, mang lại hình ảnh mượt mà, cùng màu sắc sống động phù hợp cho cả chơi game và giải trí. Thiết kế màu đen với phong cách tối giản và công nghệ bảo vệ mắt giúp tăng cường sự thoải mái khi sử dụng lâu dài.', 0, 'uploads/man-hinh-Duan_VG2709H-_Cong_-_100hz_-___en.webp', 2023, '2025-01-15', 101, -6, ' Loại màn hình: LED -\r\n\r\nKích thước màn hình: 27 inch -\r\n\r\nCông nghệ màn hình: VA -\r\n\r\nĐộ phân giải: 1920 x 1080 Pixels -\r\n\r\nChuẩn màn hình: FHD -\r\n\r\nĐộ sáng: 300 nits -\r\n\r\nĐộ tương phản: 3000:1 -\r\n\r\nTấm nền: VA -\r\n\r\nTần số quét: 100 Hz -\r\n\r\nThời gian phản hồi: 1 ms -\r\n\r\nTỷ lệ màn hình: 16:9 -\r\n\r\nMàu màn hình: 16.7 triệu màu'),
('MOR09', 'MOR', 'Màn hình DUAN DA272QP 2K- 100HZ 2ms- Đen', 'DUA', 3190000, 'Màn hình DUAN DA272QP là màn hình kích thước 27 inch với độ phân giải 2K (2560 x 1440), cho hình ảnh sắc nét và chi tiết. Sản phẩm hỗ trợ tần số quét 100Hz và thời gian phản hồi 2ms, lý tưởng cho chơi game và công việc đồ họa. Màu sắc đen hiện đại và thiết kế viền mỏng mang lại trải nghiệm xem ấn tượng.', 0, 'uploads/man-hinh-DUAN_DA272QP_2K-_100HZ_2ms-___en.png', 2023, '2025-01-15', 101, -6, ' Loại màn hình: LED -\r\n\r\nKích thước màn hình: 27 inch -\r\n\r\nCông nghệ màn hình: IPS LCD -\r\n\r\nĐộ phân giải: 2560 x 1440 Pixels (2K) -\r\n\r\nChuẩn màn hình: QHD -\r\n\r\nĐộ sáng: 350 nits -\r\n\r\nĐộ tương phản: 1000:1 -\r\n\r\nTấm nền: IPS -\r\n\r\nTần số quét: 100 Hz -\r\n\r\nThời gian phản hồi: 2 ms -\r\n\r\nTỷ lệ màn hình: 16:9 -\r\n\r\nMàu màn hình: 16.7 triệu màu'),
('MOR10', 'MOR', 'Màn hình DUAN IP278S- 180Hz- 1ms - Đen', 'DUA', 3245000, 'Màn hình DUAN IP278S là màn hình kích thước 27 inch với tấm nền IPS, cho màu sắc trung thực và góc nhìn rộng. Sản phẩm hỗ trợ tần số quét 180Hz và thời gian phản hồi 1ms, phù hợp cho game thủ cần độ mượt mà và phản hồi nhanh. Thiết kế màu đen với kiểu dáng hiện đại giúp tăng trải nghiệm thị giác và hiệu suất chơi game.', 0, 'uploads/man-hinh-DUAN_IP278S-_180Hz-_1ms_-___EN.png', 2023, '2025-01-15', 101, -6, ' Loại màn hình: LED -\r\n\r\nKích thước màn hình: 27 inch -\r\n\r\nCông nghệ màn hình: IPS LCD -\r\n\r\nĐộ phân giải: 1920 x 1080 Pixels -\r\n\r\nChuẩn màn hình: FHD -\r\n\r\nĐộ sáng: 300 nits -\r\n\r\nĐộ tương phản: 1000:1 -\r\n\r\nTấm nền: IPS -\r\n\r\nTần số quét: 180 Hz -\r\n\r\nThời gian phản hồi: 1 ms -\r\n\r\nTỷ lệ màn hình: 16:9 -\r\n\r\nMàu màn hình: 16.7 triệu màu'),
('MOR11', 'MOR', 'Màn hình VSP ELSA 27Q7 IPS - 2K QHD 170Hz', 'VSP', 4620000, 'Màn hình VSP ELSA 27Q7 là màn hình kích thước 27 inch với tấm nền IPS, mang lại góc nhìn rộng và màu sắc chính xác. Độ phân giải 2K QHD (2560 x 1440) cung cấp hình ảnh sắc nét và chi tiết. Sản phẩm hỗ trợ tần số quét 170Hz, lý tưởng cho chơi game tốc độ cao, cùng khả năng tái tạo hình ảnh mượt mà.', 9, 'uploads/man-hinh-VSP_ELSA_27Q7_IPS_-_2K_QHD_170Hz.jpg', 2023, '2025-01-15', 101, -6, ' Loại màn hình: LED -\r\n\r\nKích thước màn hình: 27 inch -\r\n\r\nCông nghệ màn hình: IPS LCD -\r\n\r\nĐộ phân giải: 2560 x 1440 Pixels (2K) -\r\n\r\nChuẩn màn hình: QHD -\r\n\r\nĐộ sáng: 350 nits -\r\n\r\nĐộ tương phản: 1000:1 -\r\n\r\nTấm nền: IPS -\r\n\r\nTần số quét: 170 Hz -\r\n\r\nThời gian phản hồi: 1 ms -\r\n\r\nTỷ lệ màn hình: 16:9 -\r\n\r\nMàu màn hình: 16.7 triệu màu'),
('MOR12', 'MOR', 'Màn hình DUAN 2409S 100HZ', 'DUA', 1628000, 'Màn hình DUAN 2409S là màn hình kích thước 24 inch với thiết kế hiện đại, phù hợp cho nhu cầu giải trí và làm việc. Sản phẩm hỗ trợ tần số quét 100Hz, cho trải nghiệm hình ảnh mượt mà hơn so với màn hình 60Hz thông thường, thích hợp cho chơi game và xem phim.', 0, 'uploads/man-hinh-DUAN_2409S_100HZ.webp', 2023, '2025-01-15', 101, -6, ' Loại màn hình: LED -\r\n\r\nKích thước màn hình: 24 inch -\r\n\r\nCông nghệ màn hình: IPS LCD -\r\n\r\nĐộ phân giải: 1920 x 1080 Pixels -\r\n\r\nChuẩn màn hình: FHD -\r\n\r\nĐộ sáng: 250 nits -\r\n\r\nĐộ tương phản: 1000:1 -\r\n\r\nTấm nền: IPS -\r\nTần số quét: 100 Hz -\r\n\r\nThời gian phản hồi: 5 ms -\r\n\r\nTỷ lệ màn hình: 16:9 -\r\n\r\nMàu màn hình: 16.7 triệu màu'),
('MOR13', 'MOR', 'Màn hình DUAN 27 DA-IP2709S Tấm nền IPS 100Hz', 'DUA', 2255000, 'Màn hình DUAN 27 DA-IP2709S là màn hình kích thước 27 inch với tấm nền IPS, mang lại màu sắc trung thực và góc nhìn rộng. Sản phẩm hỗ trợ tần số quét 100Hz, cung cấp hình ảnh mượt mà và trải nghiệm xem thoải mái, phù hợp cho cả giải trí và công việc.', 0, 'uploads/man-hinh-DUAN_27_DA-IP2709S_IPS_100Hz.jpg', 2023, '2025-01-15', 101, -6, ' Loại màn hình: LED -\r\n\r\nKích thước màn hình: 27 inch -\r\n\r\nCông nghệ màn hình: IPS LCD -\r\n\r\nĐộ phân giải: 1920 x 1080 Pixels (FHD) -\r\n\r\nChuẩn màn hình: FHD -\r\n\r\nĐộ sáng: 250 nits -\r\n\r\nĐộ tương phản: 1000:1 -\r\n\r\nTấm nền: IPS -\r\n\r\nTần số quét: 100 Hz -\r\n\r\nThời gian phản hồi: 5 ms -\r\n\r\nTỷ lệ màn hình: 16:9 -\r\n\r\nMàu màn hình: 16.7 triệu màu'),
('MOR14', 'MOR', 'Màn hình VSP V2204H - 100Hz màu đen', 'VSP', 1485000, 'Màn hình VSP V2204H là màn hình kích thước 22 inch với thiết kế màu đen hiện đại. Sản phẩm hỗ trợ tần số quét 100Hz, mang lại hình ảnh mượt mà, phù hợp cho nhu cầu làm việc, giải trí và chơi game nhẹ.', 0, 'uploads/man-hinh-VSP_V2204H_-_100Hz_m__u___en.jpg', 2023, '2025-01-15', 101, -6, ' Loại màn hình: LED -\r\n\r\nKích thước màn hình: 22 inch -\r\n\r\nCông nghệ màn hình: IPS LCD -\r\n\r\nĐộ phân giải: 1920 x 1080 Pixels (FHD) -\r\n\r\nChuẩn màn hình: FHD -\r\n\r\nĐộ sáng: 250 nits -\r\n\r\nĐộ tương phản: 1000:1 -\r\n\r\nTấm nền: IPS -\r\n\r\nTần số quét: 100 Hz -\r\n\r\nThời gian phản hồi: 5 ms -\r\n\r\nTỷ lệ màn hình: 16:9 -\r\n\r\nMàu màn hình: 16.7 triệu màu'),
('MOR15', 'MOR', 'Màn hình VSP V2204H - 75Hz màu trắng', 'VSP', 1485000, 'Màn hình VSP V2204H là màn hình kích thước 22 inch với thiết kế màu trắng thanh lịch. Sản phẩm hỗ trợ tần số quét 75Hz, mang lại trải nghiệm hình ảnh mượt mà hơn so với 60Hz, phù hợp cho công việc văn phòng và giải trí cơ bản.', 0, 'uploads/man-hinh-VSP_V2204H_-_75Hz_m__u_tr___ng.jpg', 2023, '2025-01-15', 101, -6, ' Loại màn hình: LED -\r\n\r\nKích thước màn hình: 22 inch -\r\n\r\nCông nghệ màn hình: IPS LCD -\r\n\r\nĐộ phân giải: 1920 x 1080 Pixels (FHD) -\r\n\r\nChuẩn màn hình: FHD -\r\n\r\nĐộ sáng: 250 nits -\r\n\r\nĐộ tương phản: 1000:1 -\r\n\r\nTấm nền: IPS -\r\n\r\nTần số quét: 100 Hz -\r\n\r\nThời gian phản hồi: 5 ms -\r\n\r\nTỷ lệ màn hình: 16:9 -\r\n\r\nMàu màn hình: 16.7 triệu màu'),
('MOR16', 'MOR', 'màn hình VSP IP2407S - 100hz- 1ms - đen', 'VSP', 1760000, 'Màn hình VSP IP2407S là màn hình kích thước 24 inch với tấm nền IPS, cho màu sắc trung thực và góc nhìn rộng. Sản phẩm hỗ trợ tần số quét 100Hz và thời gian phản hồi 1ms, phù hợp cho chơi game và trải nghiệm hình ảnh mượt mà. Thiết kế màu đen hiện đại.', 0, 'uploads/man-hinh-VSP_IP2407S_-_100hz-_1ms_-___en.jpg', 2023, '2025-01-15', 101, -6, ' Loại màn hình: LED -\r\n\r\nKích thước màn hình: 24 inch -\r\n\r\nCông nghệ màn hình: IPS LCD -\r\n\r\nĐộ phân giải: 1920 x 1080 Pixels (FHD) -\r\n\r\nChuẩn màn hình: FHD -\r\n\r\nĐộ sáng: 250 nits -\r\n\r\nĐộ tương phản: 1000:1 -\r\n\r\nTấm nền: IPS -\r\n\r\nTần số quét: 100 Hz -\r\n\r\nThời gian phản hồi: 1 ms -\r\n\r\nTỷ lệ màn hình: 16:9 -\r\n\r\nMàu màn hình: 16.7 triệu màu'),
('MOR17', 'MOR', 'Màn hình VSP V2407S IPS-75Hz', 'VSP', 1650000, 'Màn hình VSP V2407S là màn hình kích thước 24 inch với tấm nền IPS, mang lại góc nhìn rộng và màu sắc chính xác. Sản phẩm hỗ trợ tần số quét 75Hz, thích hợp cho công việc văn phòng, giải trí nhẹ và các nhu cầu sử dụng cơ bản.', 0, 'uploads/man-hinh-VSP_V2407S_IPS-75Hz.jpg', 2023, '2025-01-15', 101, -6, ' Loại màn hình: LED -\r\n\r\nKích thước màn hình: 24 inch -\r\n\r\nCông nghệ màn hình: IPS LCD -\r\n\r\nĐộ phân giải: 1920 x 1080 Pixels (FHD) -\r\n\r\nChuẩn màn hình: FHD -\r\n\r\nĐộ sáng: 250 nits -\r\n\r\nĐộ tương phản: 1000:1 -\r\n\r\nTấm nền: IPS -\r\n\r\nTần số quét: 75 Hz -\r\n\r\nThời gian phản hồi: 5 ms -\r\n\r\nTỷ lệ màn hình: 16:9 -\r\n\r\nMàu màn hình: 16.7 triệu màu'),
('MOR18', 'MOR', 'Màn hình VSP 27 IP2706SG Tấm nền IPS 100Hz 1ms', 'VSP', 2310000, 'Màn hình VSP 27 IP2706SG là màn hình kích thước 27 inch với tấm nền IPS, mang lại màu sắc chính xác và góc nhìn rộng. Sản phẩm hỗ trợ tần số quét 100Hz và thời gian phản hồi 1ms, giúp trải nghiệm chơi game và xem phim mượt mà. Thiết kế hiện đại với màu sắc tối giản.', 0, 'uploads/man-hinh-VSP_27_IP2706SG_T___m_n___n_IPS_100Hz_1ms.webp', 2023, '2025-01-15', 101, -6, ' Loại màn hình: LED -\r\n\r\nKích thước màn hình: 27 inch -\r\n\r\nCông nghệ màn hình: IPS LCD -\r\n\r\nĐộ phân giải: 1920 x 1080 Pixels (FHD) -\r\n\r\nChuẩn màn hình: FHD -\r\n\r\nĐộ sáng: 300 nits -\r\n\r\nĐộ tương phản: 1000:1 -\r\n\r\nTấm nền: IPS -\r\n\r\nTần số quét: 100 Hz -\r\n\r\nThời gian phản hồi: 1 ms -\r\n\r\nTỷ lệ màn hình: 16:9 -\r\n\r\nMàu màn hình: 16.7 triệu màu'),
('MOR19', 'MOR', 'Màn hình VSP IP2518S4 180HZ - 1ms', 'VSP', 2805000, 'Màn hình VSP IP2518S4 là màn hình kích thước 25 inch với tấm nền IPS, hỗ trợ tần số quét 180Hz và thời gian phản hồi 1ms, lý tưởng cho chơi game và các tác vụ đòi hỏi độ chính xác cao. Màn hình còn tích hợp loa ngoài, mang đến trải nghiệm âm thanh trực tiếp mà không cần loa rời.', 0, '../uploads/67885f692aaba_man-hinh-VSP IP2518S4 180HZ- 1ms.jpg', 2023, '2025-01-16', 101, -6, ' Loại màn hình: LED -\r\n\r\nKích thước màn hình: 25 inch -\r\n\r\nCông nghệ màn hình: IPS LCD -\r\n\r\nĐộ phân giải: 1920 x 1080 Pixels (FHD) -\r\n\r\nChuẩn màn hình: FHD -\r\n\r\nĐộ sáng: 300 nits -\r\n\r\nĐộ tương phản: 1000:1 -\r\n\r\nTấm nền: IPS -\r\n\r\nTần số quét: 180 Hz -\r\n\r\nThời gian phản hồi: 1 ms -\r\n\r\nTỷ lệ màn hình: 16:9 -\r\n\r\nMàu màn hình: 16.7 triệu màu'),
('MOR20', 'MOR', 'Màn hình VSP 27 Tấm nền IPS 75Hz IP2704S Hồng - Trắng', 'VSP', 2640000, 'Màn hình VSP 27 IP2704S là màn hình kích thước 27 inch với tấm nền IPS, mang lại màu sắc sống động và góc nhìn rộng. Sản phẩm hỗ trợ tần số quét 75Hz, phù hợp cho công việc văn phòng và nhu cầu giải trí cơ bản. Thiết kế màu hồng - trắng tinh tế, tạo điểm nhấn nổi bật cho không gian sử dụng.', 0, 'uploads/man-hinh-VSP_27_IPS_75Hz_IP2704S_H___ng_-_Tr___ng.jpg', 2023, '2025-01-15', 101, -6, ' Loại màn hình: LED -\r\n\r\nKích thước màn hình: 27 inch -\r\n\r\nCông nghệ màn hình: IPS LCD -\r\n\r\nĐộ phân giải: 1920 x 1080 Pixels (FHD) -\r\n\r\nChuẩn màn hình: FHD -\r\n\r\nĐộ sáng: 250 nits -\r\n\r\nĐộ tương phản: 1000:1 -\r\n\r\nTấm nền: IPS -\r\n\r\nTần số quét: 75 Hz -\r\n\r\nThời gian phản hồi: 5 ms -\r\n\r\nTỷ lệ màn hình: 16:9 -\r\n\r\nMàu màn hình: 16.7 triệu màu -\r\n\r\nMàu sắc: Hồng _ Trắng'),
('MOR21', 'MOR', 'Màn hình VSP 24 IP2407S 100Hz Trắng', 'VSP', 1870000, 'Màn hình VSP 24 IP2407S là màn hình kích thước 24 inch với tấm nền IPS, cho màu sắc trung thực và góc nhìn rộng. Sản phẩm hỗ trợ tần số quét 100Hz, mang lại trải nghiệm hình ảnh mượt mà và thích hợp cho chơi game cũng như làm việc. Thiết kế màu trắng hiện đại và tinh tế.', 0, 'uploads/man-hinh-VSP_24_IP2407S_100Hz_Tr___ng.webp', 2023, '2025-01-15', 101, -6, ' Loại màn hình: LED -\r\n\r\nKích thước màn hình: 24 inch -\r\n\r\nCông nghệ màn hình: IPS LCD -\r\n\r\nĐộ phân giải: 1920 x 1080 Pixels (FHD) -\r\n\r\nChuẩn màn hình: FHD -\r\n\r\nĐộ sáng: 250 nits -\r\n\r\nĐộ tương phản: 1000:1 -\r\n\r\nTấm nền: IPS -\r\n\r\nTần số quét: 100 Hz -\r\n\r\nThời gian phản hồi: 5 ms -\r\n\r\nTỷ lệ màn hình: 16:9 -\r\n\r\nMàu màn hình: 16.7 triệu màu'),
('MOR22', 'MOR', 'Màn hình cong - VSP VA2718G - 180HZ - 1ms', 'VSP', 3410000, 'Màn hình cong VSP VA2718G có kích thước 27 inch, sử dụng tấm nền VA mang lại màu sắc sống động và độ tương phản cao. Sản phẩm hỗ trợ tần số quét 180Hz và thời gian phản hồi 1ms, lý tưởng cho trải nghiệm chơi game mượt mà và đắm chìm. Thiết kế màn hình cong giúp cải thiện góc nhìn và tăng cường trải nghiệm trực quan.', 0, 'uploads/man-hinh-cong_-_VSP_VA2718G_-_180HZ_-_1ms.jpg', 2023, '2025-01-15', 101, -6, ' Loại màn hình: LED -\r\n\r\nKích thước màn hình: 27 inch -\r\n\r\nCông nghệ màn hình: VA -\r\n\r\nĐộ phân giải: 1920 x 1080 Pixels (FHD) -\r\n\r\nChuẩn màn hình: FHD -\r\n\r\nĐộ sáng: 300 nits -\r\n\r\nĐộ tương phản: 3000:1 -\r\n\r\nTấm nền: VA -\r\n\r\nTần số quét: 180 Hz -\r\n\r\nThời gian phản hồi: 1 ms -\r\n\r\nTỷ lệ màn hình: 16:9 -\r\n\r\nMàu màn hình: 16.7 triệu màu -\r\n\r\nMàn hình cong: có'),
('MOR23', 'MOR', 'Màn hình cong VSP CM2710H 100HZ - Đen', 'VSP', 3168000, 'Màn hình cong VSP CM2710H có kích thước 27 inch, sử dụng thiết kế màn hình cong giúp nâng cao trải nghiệm xem. Sản phẩm hỗ trợ tần số quét 100Hz, mang lại hình ảnh mượt mà, phù hợp cho cả công việc và giải trí. Màn hình có màu đen tinh tế, dễ dàng phối hợp với nhiều không gian sử dụng.', 7, 'uploads/man-hinh-cong-VSP_CM2710H_100HZ_-___en.webp', 2023, '2025-01-15', 101, -6, ' Loại màn hình: LED -\r\n\r\nKích thước màn hình: 27 inch -\r\n\r\nCông nghệ màn hình: VA -\r\n\r\nĐộ phân giải: 1920 x 1080 Pixels (FHD) -\r\n\r\nChuẩn màn hình: FHD -\r\n\r\nĐộ sáng: 250 nits -\r\n\r\nĐộ tương phản: 3000:1 -\r\n\r\nTấm nền: VA -\r\n\r\nTần số quét: 100 Hz -\r\n\r\nThời gian phản hồi: 5 ms -\r\n\r\nTỷ lệ màn hình: 16:9 -\r\n\r\nMàu màn hình: 16.7 triệu màu -\r\n\r\nMàn hình cong: Có -\r\n\r\nMàu sắc: Đen'),
('MOU01', 'MOU', 'Chuột Newmen M005', 'NEM', 715000, 'Chuột Newmen M005 là một chuột máy tính có thiết kế đơn giản, dễ sử dụng, thích hợp cho người dùng văn phòng và những người sử dụng chuột trong thời gian dài. Chuột thường có cảm biến quang học, độ phân giải tùy chỉnh và các nút chức năng cơ bản. Mẫu chuột này có thể có thiết kế vừa tay, tạo cảm giác thoải mái khi sử dụng.', 0, 'uploads/mouse-Newmen_M005.jpg', 2020, '2025-01-15', 101, -6, ' Chuột của Newmen có 3 nút điều khiển, click kailh huyền thoại, nói không với double click, đạt mức 1000dpi cho độ bền lên đến 20 triệu lượt nhấn. -\r\n\r\nChuẩn giao tiếp: USB -\r\n\r\nMẫu chuột máy tính dành cho dân văn phòng, sử dụng êm ái, giúp bạn sử dụng trong thời gian dài mà không mỏi tay. -\r\n\r\nThiết kế chắc chắn, bền với vật liệu chất lượng cao,  Vật liệu thân thiện môi trường đảm bảo an toàn cho bạn khi '),
('MOU02', 'MOU', 'Chuột Fuhlen L102', 'FUH', 110000, 'Chuột Fuhlen L102 là một chuột có thiết kế đơn giản, nhẹ nhàng và dễ sử dụng, thích hợp cho công việc văn phòng, học tập và giải trí cơ bản. Chuột có cảm giác di chuyển mượt mà, với độ nhạy ổn định và dễ dàng kết nối qua cổng USB.', 0, 'uploads/mouse-Fuhlen_L102.jpg', 2021, '2025-01-15', 101, -6, '  Kiểu kết nối: Có dây\r\n- Dạng cảm biến: Optical\r\n- Độ phân giải: 1000 DPI\r\n- Màu sắc: Đen'),
('MOU03', 'MOU', 'Chuột Không Dây HP 200', 'HPC', 110000, 'Chuột Không Dây HP 200 là một chuột không dây với thiết kế đơn giản, thoải mái và dễ sử dụng. Chuột này có độ nhạy tốt, kết nối ổn định qua công nghệ không dây 2.4GHz, và có thiết kế nhỏ gọn, phù hợp với cả người dùng máy tính để bàn và laptop.', 0, 'uploads/ke-wireless-HP_200.webp', 2021, '2025-01-15', 101, -6, ' Kích thước: 107 x 62 x 36 mm -\r\nTrọng lượng: 80 gram -\r\nKết nối: Không dây 2.4GHz -\r\nPhạm vi hoạt động: 10 mét -\r\nNút: 2 nút chính, 1 nút cuộn, 1 nút bấm bên trái -\r\nPin: 2 pin AAA'),
('MOU04', 'MOU', 'Chuột EDRA-EM601', 'EDR', 60500, 'Chuột EDRA-EM601 là một chuột có thiết kế ergonomic, với cảm giác cầm nắm thoải mái, thích hợp cho người sử dụng lâu dài. Chuột có độ phân giải cao, cho độ chính xác khi di chuyển tốt và thích hợp cho công việc văn phòng hoặc sử dụng thông thường. Nó cũng hỗ trợ kết nối qua cổng USB.', 0, 'uploads/mouse-EDRA-EM601.jpg', 2021, '2025-01-15', 101, -6, ' Chuột Edra EM601 v2 -\r\nChuẩn kết nối USB -\r\nĐộ phân giải: 1600 DPI -\r\nSwitch Huano độ bền 5 triệu lần nhấn'),
('PHK01', 'PHK', 'AMR F80', 'NAV', 363000, 'Giá treo màn hình AMR F80 là giá treo tay đòn linh hoạt, được thiết kế cho màn hình từ 17 đến 27 inch, hỗ trợ trọng lượng tối đa khoảng 6.5 kg. Sản phẩm có khả năng xoay, nghiêng và điều chỉnh chiều cao, giúp tối ưu hóa không gian làm việc và tạo sự thoải mái cho người dùng.', 0, 'uploads/amr-F80.webp', 2023, '2025-01-15', 101, -6, ' Chuẩn VESA 75 x 75mm, 100 x 100mm -\r\nNâng hạ độ cao 260mm -\r\nGóc xoay dọc 360 độ -\r\nGóc xoay ngang 180 độ -\r\nGóc lật màn hình 85 độ đến _30 độ -\r\nKích cỡ màn hình hỗ trợ 17 _ 30 inch -\r\nTải trọng màn hình tối đa 9kg'),
('PHK02', 'PHK', 'AMR F160', 'NAV', 693000, 'Giá treo màn hình AMR F160 là giá treo tay đôi linh hoạt, hỗ trợ hai màn hình kích thước từ 17 đến 27 inch, với khả năng chịu tải lên đến 6.5 kg mỗi màn hình. Sản phẩm cho phép điều chỉnh góc nghiêng, xoay và chiều cao, giúp tối ưu hóa không gian làm việc và tăng tính tiện dụng.', 0, 'uploads/amr-F160.webp', 2023, '2025-01-15', 101, -6, ' Phù hợp với màn hình từ 17_27 inch -\r\nTải trọng: 3 > 9 kg -\r\nXoay: 360° -\r\nQuay: 180 ° -\r\nGóc nghiêng từ +35° tới _50 ° -\r\nĐóng gói: 67 x 18 x 15 cm -\r\nTrọng lượng: 4,8 kg -\r\nHình ảnh thực tế của sản phẩm:'),
('PHK03', 'PHK', 'Bàn chữ K - Z', 'NAV', 462000, 'Bàn chữ K - Z là loại bàn có thiết kế khung chữ K hoặc chữ Z, mang lại sự vững chãi và ổn định cho mặt bàn. Thường được sử dụng trong không gian làm việc hiện đại, giúp tiết kiệm diện tích và có thể điều chỉnh độ cao tùy theo nhu cầu. Bàn này có thể được làm từ các chất liệu như gỗ, kim loại, hoặc hợp kim để tăng tính bền vững.', 0, 'uploads/desk-K_-_Z.jpg', 2023, '2025-01-15', 101, -6, ' Mặt bàn gỗ công nghiệp MDF phủ Melamine.\r\n- Kích thước: 100x48x75cm hoặc 120x60x75cm (Dài x Rộng x Cao)\r\n- Chân bàn được làm bằng sắt hộp sơn tĩnh điện.\r\n- Thiết kế tinh tế, hiện đại, dễ setup không gian làm việc.\r\n- Kết cấu vững chắc, đảm bảo an toàn trong suốt quá trình ngồi.\r\n- Chất liệu cao cấp, có độ bền cao.\r\n- Khung chân sắt hộp sơn tĩnh điện bền đẹp, chống gỉ, khả năng chịu lực tốt, thiết kế các đinh ốc xoắn giúp bạn có thể dễ dàng tháo rời từng bộ phận tiện lợi cho việc đóng hộp khi di chuyển. \r\n- Mặt bàn rộng có thể thoải mái để setup dàn máy tính và các đồ vật trang trí khác.'),
('PHK04', 'PHK', 'Bàn học sinh 3 cấp', 'NAV', 1782000, 'Bàn học sinh 3 cấp là loại bàn được thiết kế với 3 tầng hoặc ngăn chứa để giúp học sinh sắp xếp sách vở, đồ dùng học tập một cách gọn gàng và dễ dàng truy cập. Bàn thường có kiểu dáng tiện dụng, phù hợp với trẻ em, giúp tối ưu hóa không gian học tập. Mặt bàn có thể điều chỉnh độ cao để phù hợp với sự phát triển của trẻ.', 0, '../uploads/ban-hoc-sinh-3-cap.jpg', 2023, '2025-01-17', 101, -6, ' 1600 x 600 x 1800mm. -\r\nGỗ MFC mặt phủ Melamine cao cấp . -\r\nGỗ có nhiều màu sắc cho khách hàng lựa chọn.'),
('PHK05', 'PHK', 'Bàn học sinh 2 cấp', 'NAV', 748000, 'Bàn học sinh 2 cấp là loại bàn học được thiết kế với 2 ngăn hoặc tầng, giúp học sinh dễ dàng sắp xếp sách vở, dụng cụ học tập. Kiểu dáng thường đơn giản, gọn gàng và tiện dụng, giúp tiết kiệm không gian và tạo sự ngăn nắp cho góc học tập. Các bàn này thường có thiết kế phù hợp với chiều cao và nhu cầu của học sinh.', 0, 'uploads/student-desk-2.jpg', 2023, '2025-01-15', 101, -6, ' Chất liệu : Gỗ MDF nhập khẩu 1,7cm và Khung Thép 2cmx5cm Sơn Tĩnh Điện \r\nMàu sắc : Vân Gỗ  Sáng + Màu Nâu óc chó \r\nKích Thước : Bàn 1m x60cm Cao Mặt Bàn 75cm -Cao tổng 1m15'),
('PHK06', 'PHK', 'Ghế Akali đen AK01 - chân bánh xe', 'CTR', 3630000, 'Ghế Akali đen AK01 - chân bánh xe là loại ghế gaming thiết kế hiện đại với kiểu dáng thể thao, màu sắc chủ đạo là đen. Ghế có tựa lưng cao, bọc da PU hoặc vải chất lượng cao, kèm đệm ngồi êm ái và tay vịn điều chỉnh linh hoạt. Chân ghế có bánh xe giúp dễ dàng di chuyển, phù hợp cho game thủ hoặc người dùng văn phòng.', 0, 'uploads/chair-Akali___en_AK01_-_ch__n_b__nh_xe.jpg', 2024, '2025-01-15', 101, -6, ' Ghế Game Centaur Akali -\r\nChất liệu: Da PU -\r\nChất liệu khung: Kim loại -\r\nĐệm ngồi đúc nguyên khối mật độ cao, đàn hồi tốt -\r\nĐộ ngả lưng tối đa: 180 độ -\r\nKê tay 4D -\r\nBệ đỡ con cóc -\r\nChân ghế kim loại -\r\nTải trọng tối đa 150kg\r\n'),
('PHK07', 'PHK', 'Ghế Champion - đỏ đen - CP01 - chân quỳ', 'CTR', 1925000, 'Ghế Champion - đỏ đen - CP01 - chân quỳ là ghế văn phòng hoặc gaming kiểu dáng thể thao, kết hợp hai tông màu đỏ và đen nổi bật. Ghế có thiết kế tựa lưng cao, bọc da PU cao cấp với đệm ngồi êm ái. Chân ghế dạng quỳ bằng kim loại chắc chắn, phù hợp cho không gian làm việc, học tập hoặc chơi game.', 0, 'uploads/chair-Champion_-_________en_-_CP01_-_ch__n_qu___.webp', 2024, '2025-01-15', 101, -6, ' Chất liệu: Da cao cấp PU Kết hợp đường viền nhung -\r\nChất liệu khung: Kim loại Đệm ngồi đúc nguyên khối mật độ cao, đàn hồi tốt -\r\nĐộ ngả lưng tối đa: 180 độ Kê tay 1D Bệ đỡ con cóc Chân ghế quỳ kim loại'),
('PHK08', 'PHK', 'Ghế SOVA ĐEN TRẮNG - BÁNH XE', 'CTR', 3960000, 'Ghế SOVA Đen Trắng - Bánh Xe là ghế làm việc hoặc chơi game có thiết kế hiện đại với tông màu đen và trắng phối hợp. Tựa lưng và đệm ngồi được bọc da PU hoặc vải lưới, mang lại cảm giác thoải mái. Ghế được trang bị hệ thống bánh xe xoay 360 độ và khả năng điều chỉnh chiều cao phù hợp với nhu cầu sử dụng.', 0, 'uploads/chair-SOVA___EN_TR___NG_-_B__NH_XE.webp', 2024, '2025-01-15', 101, -6, '  Chất liệu: Da cao cấp PU\r\n- Chất liệu khung: Kim loại\r\n- Đệm ngồi đúc nguyên khối mật độ cao, đàn hồi tốt\r\n- Độ ngả lưng tối đa: 180 độ\r\n- Kê tay 4D\r\n- Bệ đỡ con cóc\r\n- Chân ghế kim loại\r\n- Tải trọng tối đa 150kg'),
('PHK09', 'PHK', 'Ghế xoay E-DRA EGC234 ĐỎ / ĐEN', 'EDR', 1430000, 'Ghế xoay E-DRA EGC234 Đỏ/Đen là dòng ghế chơi game hoặc làm việc với thiết kế mạnh mẽ, phối màu đỏ/đen tạo phong cách thể thao năng động. Ghế có tựa lưng cao, đệm êm ái bọc da PU, khả năng điều chỉnh chiều cao, tựa lưng ngả linh hoạt, cùng bánh xe xoay 360 độ giúp di chuyển dễ dàng.', 0, 'uploads/chair-E-DRA_EGC234______-__EN.jpg', 2024, '2025-01-15', 101, -6, ' Chất liệu: Da cao cấp. -\r\nĐệm mút -\r\nKê tay 1D. -\r\nGóc đứng: 92° ± 2° -\r\nĐộ cao của điểm tựa tay: 70 ± 5mm -\r\nChân nhựa: 320mm -\r\nTrọng tải theo góc đứng: 100 -\r\nBệ bướm điều chỉnh lên xuống và ngả -\r\nKhung chân: Khung kim loại, chân nhựa, bánh xe được thiết kế ko gây tiếng ồn. -\r\nPiston thủy lực Class 2 -\r\nMàu sắc: Đen, Đỏ'),
('PHK10', 'PHK', 'Ghế công thái học E-DRA EEC219', 'EDR', 2640000, 'Ghế công thái học E-DRA EEC219 là ghế thiết kế chuyên dụng để hỗ trợ tư thế ngồi chuẩn, giảm căng thẳng cho cột sống và cổ khi làm việc lâu dài. Ghế có tựa đầu điều chỉnh, tựa lưng bằng lưới thoáng khí, khung chắc chắn, và khả năng ngả lưng linh hoạt với cơ chế hỗ trợ công thái học hiện đại.', 0, 'uploads/chair-E-DRA_EEC219.jpg', 2024, '2025-01-15', 101, -6, '   Chất liệu: lưới chất lượng cao cho cảm giác thông thoáng. Đệm đúc cao cấp, êm ái.\r\n - Tựa đầu 2D điều chỉnh độ cao\r\n - Kê tay nhựa PP cố định\r\n - Bệ đỡ đa chức năng với 3 mức ngả khác nhau\r\n - Chân kim loại đường kính 350mm\r\n - Trụ thủy lực Class 3 chứng nhận TUV\r\n - Bánh xe PU\r\n - Kích thước: 113_133x64x65cm\r\n - Kích thước hộp: 70x37.5x64cm\r\n - Cân nặng: không hộp 14kg, cả hộp 15.3kg\r\n - Màu sắc: Black\r\n - Cân nặng người sử dụng tối đa: 120kg'),
('PHK11', 'PHK', 'Ghế xoay E-DRA EGC200 ĐEN', 'EDRed', 2310000, 'Ghế xoay E-DRA EGC200 ĐEN là ghế gaming với thiết kế hiện đại, lớp đệm êm ái, chất liệu giả da cao cấp, và khả năng điều chỉnh độ cao linh hoạt. Ghế có tựa đầu và tay vịn hỗ trợ thoải mái khi sử dụng trong thời gian dài.', 0, 'uploads/chair-E-DRA_EGC200___EN.jpg', 2024, '2025-01-15', 101, -6, ' Chất liệu: da cao cấp PU dễ dàng bảo quản.\r\n- Góc đứng: 92° ± 2°\r\n- Góc nằm max: 150°\r\n- Góc quay điểm tựa tay:\r\n- Độ cao của điểm tựa tay: 70 mm\r\n- Đường kính chân: 60cm\r\n- Trọng tải theo góc đứng: 120kg\r\n- Khung chân: Khung, chân nhựa, bánh xe được thiết kế ko gây tiếng ồn.\r\n- Kích thước: 1250x530x670mm\r\n- Màu sắc: Màu đỏ, xanh, trắng, đen, hồng'),
('PHK12', 'PHK', 'Ghế công thái học E-DRA EEC222', 'EDR', 2035000, 'Ghế công thái học E-DRA EEC222 được thiết kế để hỗ trợ tư thế ngồi thoải mái và đúng chuẩn, giảm áp lực lên cột sống và cổ. Ghế có lưới thoáng khí, tựa đầu, và tựa lưng điều chỉnh linh hoạt, cùng với chân xoay bánh xe bền bỉ.', 0, 'uploads/chair-E-DRA_EEC222.jpg', 2024, '2025-01-15', 101, -6, ' Chất liệu: lưới chất lượng cao.\r\n- Đệm ngồi: Lưới chất lượng cao\r\n- Tựa đầu: điều chỉnh độ ngả\r\n- Kê tay: 1D\r\n- Bệ đỡ: đa năng\r\n- Chân nhựa đường kính 66cm\r\n- Trụ thủy lực: Class 2\r\n- Bánh xe PU\r\n- Kích thước hộp: 720*320*650mm\r\n- Cân nặng: không hộp 13.5kg, cả hộp 15kg\r\n- Màu sắc: Black.\r\n'),
('PHK13', 'PHK', 'Vỉ pin cmos', 'NAV', 16500, 'Vỉ pin CMOS là linh kiện chứa pin dự phòng cho bo mạch chủ máy tính, giúp duy trì thời gian hệ thống và các thiết lập BIOS ngay cả khi máy tính không được cấp điện.', 0, 'uploads/pin-cmos.png', 2016, '2025-01-15', 101, -6, ' Kích thước: 20*3.2 mm.-\r\n\r\nSử dụng cho các thiết bị hàng ngày : máy ảnh, máy tính, khóa xe, máy trợ thính, đồng hồ, RFID (Nhãn / thẻ điện tử), màn hình / bộ điều khiển công nghiệp, Remote keyless entry, thiết bị bảo mật, Nguồn điện dự phòng của máy POS và các thiết bị điện khác-\r\n\r\nThời gian sử dụng tối đa : 5 năm (tùy theo mục đích sử dụng)'),
('PHK14', 'PHK', 'Lót chuột 20x30', 'NAV', 15400, 'Lót chuột 20x30 là phụ kiện dùng để tăng độ chính xác và mượt mà khi di chuyển chuột, phù hợp cho cả làm việc và chơi game.', 0, 'uploads/mouse-blket-20x30.webp', 2018, '2025-01-15', 101, -6, '  Sợi vải cấu trúc đặc biệt tối ưu hóa khả năng điều khiển chuột.\r\n- Đế cao su chống trượt đảm bảo chuột di chuyển mượt mà.\r\n- Màu sắc : xanh , ghi đen\r\n- Kích cỡ : 20x30 cm\r\n- Chất liệu: vải, cao su.'),
('PHK15', 'PHK', 'Lót chuột 30x70 - 30x80cm', 'NAV', 33000, 'Lót chuột 30x70 - 30x80cm là phụ kiện bàn làm việc hoặc chơi game kích thước lớn, mang lại không gian thoải mái cho cả chuột và bàn phím.', 0, 'uploads/mouse-blket-30x70_-_30x80cm.jpg', 2018, '2025-01-15', 101, -6, ' Lót chuột cỡ lớn 30x80, 30x70\r\n- Độ dày 3.5MM của miếng lót, mang lại cảm giác êm ái hơn hẳn các loại lót chuột bình thường.\r\n- Mặt lót chuột bằng vải, in chuyển nhiệt, chống phai màu, có thể giặt bằng nước lạnh sau 1 thời gian sử dụng.\r\n- Mặt đế lót chuột bằng cao su tự nhiên, giúp chống trượt và tăng độ êm ái khi đặt tay lên rê chuột.\r\n- Lót chuột được may bo viền 360 độ, đảm bảo độ bền của bàn di chuột.'),
('PHK16', 'PHK', 'Lót chuột 30x35cm', 'FUH', 41800, 'Lót chuột 30x35cm là phụ kiện nhỏ gọn nhưng tiện dụng, phù hợp với những không gian làm việc hoặc chơi game có diện tích bàn hạn chế.', 0, 'uploads/mouse-blket-30x35cm.jpg', 2018, '2025-01-15', 101, -6, ' Kích thước 26x21cm & 30x35cm -\r\nLót khâu bo viền -\r\nHình in đẹp mắt nhiều mẫu hình -\r\nBàn di chuột siêu nhạy chất liệu cao su chống trượt có độ đàn hồi cao  bề mặt sản phẩm mềm mịn giúp bạn thao tác chuột dễ dàng  nhẹ nhàng hơn. -\r\nMiếng lót chuột còn bảo vệ chuột yêu của bạn khỏi những va chạm thường gặp như trên các bề mặt khác  tăng tuổi thọ và độ bền của chuột  Đường viền được may chắc chắn tăng tuổi thọ miếng lót. -\r\nBàn di chuột cho việc điều khiển chuột nhanh nhạy và chính xác  Sợi vải cấu trúc đặc biệt tối ưu hóa khả năng điều khiển chuột.  Theo dõi và xác định mục tiêu chính xác. -\r\nĐế cao su chống trượt đảm bảo chuột di chuyển mượt mà.  Giúp tăng tuổi thọ cho chuột máy tính nhà bạn.\r\n'),
('PHK17', 'PHK', 'Lót chuột Fuhlen 30x70cm', 'FUH', 38500, 'Lót chuột Fuhlen 30x70cm là một sản phẩm được thiết kế để mang đến trải nghiệm mượt mà và chính xác cho người sử dụng, đặc biệt là các game thủ và những người làm việc văn phòng.', 0, '../uploads/lot-chuot-30x70-fuhlen.jpg', 2018, '2025-01-17', 101, -6, ' Thiết kế tỉ mỉ, góc viền bo tròn, sử dụng vải chất lượng cao tăng tuổi thọ cho sản phẩm, không bị bạc màu theo thời gian.\r\n\r\n- Bề mặt được làm từ vải mịn, êm ái, độ ma sát thấp, giúp người sử dụng di chuyển nhanh nhạy hơn, trơn hơn, cho khả năng xử lí chính xác.\r\n\r\n- Tương thích với mọi loại mắt cảm biến của chuột.\r\n\r\n- Mặt dưới là lớp cao su chống trơn trượt có thể bám chặt trên nhiều loại mặt phẳng khác từ gỗ, kính,...\r\n\r\n- Sản phẩm có độ dày êm ái, có thể sử dụng như một lớp đệm giúp cho người dùng không bị mỏi trong quá trình sử dụng.\r\n\r\n- Kích thước 300*700*4 mm\r\n\r\n- Kích thước 230*300*3.5 mm'),
('PHK18', 'PHK', 'Dây VGA xanh', 'NAV', 22000, 'Dây VGA xanh loại 1 là một loại dây cáp dùng để kết nối máy tính với màn hình hoặc các thiết bị hiển thị khác, sử dụng chuẩn tín hiệu VGA (Video Graphics Array). Đây là loại dây cáp truyền tín hiệu hình ảnh analog phổ biến, thường được sử dụng trong các hệ thống máy tính cũ hoặc các thiết bị hiển thị không hỗ trợ cổng HDMI hoặc DisplayPort.', 0, '../uploads/wire-VGA-xanh.jpg', 2015, '0000-00-00', 101, -6, 'Dây vga được đặc biệt thiết kế cho việc truyền tải tín hiệu video, audio từ các thiết bị xem phim trong gia đình và các thiết bị chiếu phim chuyên nghiệp tại các rạp chiếu phim.\r\n - Tất cả các cáp vga đều được sản xuất để đưa đi các tín hiệu với chất lượng âm thanh, hình ảnh cao nhất, đáp ứng nhu cầu sử dụng của người sử dụng. Dây vga sang dvi có thể hỗ trợ tất cả các định danh HDTV như: 480p, 720p, 1080i và 1080p.\r\n - Dây cáp vga đã được trả qua tất cả các bài kiểm tra về chất lượng kỹ thuật, đáp ứng các tiêu chuẩn của DDWG. Dây vga có thể cung cấp đầy đủ băng thông với độ phân giải lên đến 2048 x 1536 và cho phép tốc độ đường truyền lên đến 9.9 Gbps.'),
('PHK19', 'PHK', 'Dây VGA bóc máy', 'NAV', 30800, 'Dây VGA là một loại dây cáp dùng để kết nối máy tính với màn hình hoặc các thiết bị hiển thị khác, sử dụng chuẩn tín hiệu VGA (Video Graphics Array). Đây là loại dây cáp truyền tín hiệu hình ảnh analog phổ biến, thường được sử dụng trong các hệ thống máy tính cũ hoặc các thiết bị hiển thị không hỗ trợ cổng HDMI hoặc DisplayPort.', 0, 'uploads/wire-VGA_xanh_lo___i_1.jpg', 2015, '2025-01-15', 101, -6, ' Dây cáp VGA cắm máy tính PC hàng bóc máy đồng bộ là loại cáp xịn nhất có lọc nhiễu cho tất cá các loại màn hình to nhỏ có trên thị trường.\r\n Cách phân biệt cáp này là cầm đầu dây lên lắc phát ra tiếng kêu đặc trưng và lỗ vít xoáy ốc là lỗ vít 4 cạnh, loại cáp bình thường là lỗ vít 2 cạnh và lắc đầu dây ko phát tiếng kêu'),
('PHK20', 'PHK', 'Dây nguồn lõi đồng', 'NAV', 16500, 'Dây nguồn lõi đồng là một loại dây cáp được sử dụng để truyền tải điện năng từ nguồn điện đến các thiết bị điện tử, điện gia dụng, máy tính, và các thiết bị khác. Dây nguồn lõi đồng có đặc điểm nổi bật là sử dụng lõi đồng nguyên chất, giúp đảm bảo hiệu suất truyền tải điện năng ổn định và an toàn.', 0, 'uploads/copper-wire.webp', 2011, '2025-01-15', 101, -6, ' Số lõi: 03 lõi -\r\n Chiều dài: 3m -\r\n Lõi dây: Đồng -\r\n Tiết diện lõi dây: 3x1.5mm (3 lõi, mỗi lõi có tiết diện 1.5mm²) -\r\n Chất liệu vỏ bọc: PVC hoặc cao su chịu nhiệt -\r\n Màu sắc: Đen, trắng hoặc theo yêu cầu của khách hàng -\r\nNhiệt độ làm việc: _10°C đến 70°C (tùy thuộc vào chất liệu vỏ bọc) -\r\nĐiện áp định mức: Thường là 220V AC, tuy nhiên cũng có thể sản xuất theo yêu cầu của khách hàng -\r\n công suất 16A_250V '),
('PHK21', 'PHK', 'Dây HDMI 1.5M', 'NAV', 22000, 'Dây HDMI (High-Definition Multimedia Interface) là một loại dây cáp được sử dụng để truyền tải tín hiệu video và âm thanh số chất lượng cao giữa các thiết bị điện tử, chẳng hạn như máy tính, tivi, máy chiếu, đầu Blu-ray, máy chơi game, và các thiết bị đa phương tiện khác.', 0, 'uploads/wire-HDMI_1.5M.jpg', 2011, '2025-01-15', 101, -6, ' Màu sắc: Đen-\r\nChiều dài: 150cm  -\r\nĐầu chuyển: HDMI  ,  HDMI -\r\nDây cáp mềm mại, chống đứt ngầm, độ bền cao'),
('PHK22', 'PHK', 'Dây HDMI 10M', 'NAV', 99000, 'Dây HDMI (High-Definition Multimedia Interface) là một loại dây cáp được sử dụng để truyền tải tín hiệu video và âm thanh số chất lượng cao giữa các thiết bị điện tử, chẳng hạn như máy tính, tivi, máy chiếu, đầu Blu-ray, máy chơi game, và các thiết bị đa phương tiện khác.', 0, 'uploads/wire-HDMI_1.5M.jpg', 2011, '2025-01-15', 101, -6, '  Chất lượng tốt Dùng cho máy tính + tivi box và các thiết bị chuyên dụng khác như máy chiếu …\r\n- Dây cắm cổng HDMI qua HDMI Chiều dài 10m\r\n- Chất lượng dây tốt không bị nhiễu HDMI'),
('PHK23', 'PHK', 'Dây HDMI 3M', 'NAV', 44000, 'Dây HDMI (High-Definition Multimedia Interface) là một loại dây cáp được sử dụng để truyền tải tín hiệu video và âm thanh số chất lượng cao giữa các thiết bị điện tử, chẳng hạn như máy tính, tivi, máy chiếu, đầu Blu-ray, máy chơi game, và các thiết bị đa phương tiện khác.', 0, 'uploads/wire-HDMI_1.5M.jpg', 2011, '2025-01-15', 101, -6, '   Bọc lưới đảm bảo chất lượng không bị suy giảm tín hiệu. -\r\nCó thể kết nối với TV, đầu ghi,…. -\r\nCáp HDMI được dùng chủ yếu cho những kết nối tới các thiết bị cần độ phân giải cao. -\r\nThao tác kết nối đơn giản, cắm một đầu cáp vào cổng HDMI Input ở HDTV, còn đầu kia cắm vào cổng HDMI output. -\r\nCác loại cáp HDMI đều được thông qua kiểm tra, kiểm duyệt trước khi giao cho khách hàng. -\r\nKhách hàng sẽ được kiểm tra và test cáp trước khi có quyết định mua hàng. -\r\nĐộ dài: 3m'),
('PHK24', 'PHK', 'Dây HDMI 5M', 'NAV', 55000, 'Dây HDMI (High-Definition Multimedia Interface) là một loại dây cáp được sử dụng để truyền tải tín hiệu video và âm thanh số chất lượng cao giữa các thiết bị điện tử, chẳng hạn như máy tính, tivi, máy chiếu, đầu Blu-ray, máy chơi game, và các thiết bị đa phương tiện khác.', 0, 'uploads/wire-HDMI_1.5M.jpg', 2011, '2025-01-15', 101, -6, ' Chiều dài: 5M -\r\nCổng kết nối: mạ vàng -\r\nTốc độ : băng thông rộng giúp truyền dữ liệu mạnh mẽ lên tới 10Gb/s -\r\nCông nghệ HDCP compliant giúp bảo mật dữ liệu âm thanh, video, hình ảnh -\r\nTính năng Audio Return Channel: giúp loại bỏ việc sử dụng cáp âm thanh composite riêng biệt biệt, một cáp quang khi kết nối bộ thu Audio/Video (A/V) hoặc hệ thống âm thanh vòm với TV. -\r\nHỗ trợ 4K với độ phân giải cực cao 3840 x 2160 pixel ở 24Hz/25Hz/30Hz, 4096 x 2160 pixel ở 24Hz -\r\nHỗ trợ 3D giúp chơi game 3D và các ứng dụng thực tế ảo tại nhà.'),
('PHK25', 'PHK', 'Dây HDMI 15M', 'NAV', 154000, 'Dây HDMI (High-Definition Multimedia Interface) là một loại dây cáp được sử dụng để truyền tải tín hiệu video và âm thanh số chất lượng cao giữa các thiết bị điện tử, chẳng hạn như máy tính, tivi, máy chiếu, đầu Blu-ray, máy chơi game, và các thiết bị đa phương tiện khác.', 0, 'uploads/wire-HDMI_1.5M.jpg', 2011, '2025-01-15', 101, -6, '  Chất lượng tốt Dùng cho máy tính + tivi box và các thiết bị chuyên dụng khác như máy chiếu … -\r\n Dây cắm cổng HDMI qua HDMI Chiều dài 15m -\r\n Chất lượng dây tốt không bị nhiễu HDMI'),
('PHK26', 'PHK', 'Dây HDMI 20M', 'NAV', 187000, 'Dây HDMI (High-Definition Multimedia Interface) là một loại dây cáp được sử dụng để truyền tải tín hiệu video và âm thanh số chất lượng cao giữa các thiết bị điện tử, chẳng hạn như máy tính, tivi, máy chiếu, đầu Blu-ray, máy chơi game, và các thiết bị đa phương tiện khác.', 0, 'uploads/wire-HDMI_1.5M.jpg', 2011, '2025-01-15', 101, -6, ' \r\n Độ dài: 20m -\r\nMàu sắc: đen -\r\nChuẩn HDMI 1.4 hỗ trợ độ phân giải 3D, 4K*2K, tốc độ 10,2 Gbps -\r\nTính năng truyền dẫn mạng Ethernet -\r\nHDMI Unitek Y_C144M tương thích với hầu hết các thiết bị hỗ trợ chuẩn HDMI. -\r\nCáp HDMI dài 20m Y_C144M hỗ trợ độ phân giải cao 3D, 4K x 2K  cho hình ảnh sắc nét. -\r\nTính năng Audio Return Chanel. (Âm thanh chạy qua chạy lại 2 chiều trên 1 sơi cáp HDMI từ TV đến Receiver và ngược lại)'),
('PHO01', 'PHO', 'Tai nghe 7.1 usb', 'FUH', 143000, 'Tai nghe 7.1 USB là tai nghe hỗ trợ âm thanh vòm 7.1, giúp tạo ra trải nghiệm âm thanh sống động và chi tiết. Thông qua kết nối USB, tai nghe có thể dễ dàng sử dụng trên nhiều nền tảng như PC, laptop và các thiết bị hỗ trợ âm thanh 7.1. Chúng thường đi kèm với các tính năng như micro chống ồn, đệm tai êm ái và điều khiển âm lượng trực tiếp trên tai nghe.', 0, 'uploads/Tai_nghe_7.1_usb.jpg', 2018, '2025-01-15', 101, -6, ' Tai nghe qua jack USB -\r\n \r\nLoại đầu nối: 3.5mm -\r\nSử dụng: Máy tính để bàn, Laptop, Smartphone, PC, PS4, Xbox, Mobile, … -\r\nCó micro đàm thoại -\r\nCó đèn LED trên tai nghe, cấp nguồn qua jack USB -\r\nDải tần số: 20hz_20kHz -\r\nCảm biến: 105 dB -\r\nTrở kháng: 32 Ohm. -\r\nCông suất tối đa đầu tiên: 15 – 50mW -\r\nChiều dài dây mic 1.5m -\r\nKích thước hộp (D x R x C): 200x 115 x 240 (mm) -\r\nTrọng lượng: 450 (g)'),
('PHO02', 'PHO', 'Tai nghe 7.1 usb  Gaming', 'FUH', 286000, 'Tai nghe 7.1 USB Gaming là một loại tai nghe chuyên dụng cho game thủ, hỗ trợ âm thanh vòm 7.1 để mang lại trải nghiệm âm thanh đa chiều và chính xác. Chúng thường được trang bị micro chống ồn, giúp giao tiếp trong trò chơi rõ ràng hơn. Các tai nghe này kết nối qua cổng USB, giúp cung cấp âm thanh chất lượng cao và dễ dàng sử dụng mà không cần cài đặt thêm driver phức tạp.', 0, 'uploads/Tai_nghe_7.1_usb_Gaming.webp', 2018, '2025-01-15', 101, -6, 'Tai nghe qua jack USB -\r\nHiệu ứng: giả lập 7.1 -\r\nLoại đầu nối: 3.5mm -\r\nSử dụng: Máy tính để bàn, Laptop, Smartphone, PC, PS4, Xbox, Mobile, … -\r\nCó micro đàm thoại -\r\nCó đèn LED trên tai nghe, cấp nguồn qua jack USB -\r\nDải tần số: 20hz_20kHz -\r\nCảm biến: 105 dB -\r\nTrở kháng: 32 Ohm. -\r\nCông suất tối đa đầu tiên: 15 – 50mW -\r\nChiều dài dây mic 1.5m -\r\nKích thước hộp (D x R x C): 200x 115 x 240 (mm) -\r\nTrọng lượng: 450 (g)'),
('PSU01', 'PSU', 'Nguồn văn phòng VSP ATX650', 'VSP', 220000, 'Nguồn VSP ATX650 là nguồn máy tính dạng ATX với công suất 650W, phù hợp cho các hệ thống văn phòng, máy tính cơ bản và các ứng dụng không yêu cầu công suất quá cao. Nguồn có hiệu suất ổn định và bảo vệ an toàn cho các linh kiện trong máy tính.', 0, 'uploads/nguon-VSP_ATX650_-_210W.jpg', 2023, '2025-01-15', 101, -6, ' Model: Vision VSP 650W -\r\nLoại: Nguồn ATX 12V -\r\nKích thước: 150 x 140 x 86 mm -\r\nĐiện thế đầu vào: 220V_230V -\r\nDải tần đầu vào: 47 ~ 63 Hz -\r\nThời gian đáp ứng: 100 ~ 500 ms -\r\nThời gian tích điện: 17 ms -\r\nCông suất: 650W -\r\nHiệu suất: 70% -\r\nNhiệt độ hoạt động: 0~45°C -\r\nChức năng bảo vệ: OVP / OCP (Tự ngắt khi quá Volt / quá dòng)'),
('PSU02', 'PSU', 'Nguồn VSP 350W DELTA', 'VSP', 341000, 'Nguồn VSP 350W DELTA là nguồn máy tính với công suất 350W, sản xuất bởi hãng Delta, nổi bật với hiệu suất ổn định và bảo vệ an toàn cho các linh kiện máy tính. Đây là lựa chọn phù hợp cho các hệ thống văn phòng, máy tính cơ bản không yêu cầu công suất quá cao.', 0, 'uploads/nguon-VSP_350W_DELTA.jpg', 2023, '2025-01-15', 101, -6, ' Màu sắc: Đen -\r\nHãng sản xuất: VSP -\r\nCông suất định danh: 350W -\r\nNguồn đầu vào: 200_240V AC 5A 50_60Hz -\r\nKích thước: ATX/ 165x150x86 mm -\r\nLoại fan : HBF 120MM fan both silent and efficient -\r\nTính năng bảo vệ: OVP, SCP -\r\nPFC: N/A -\r\nĐầu cấp điện cho main: _ 1x 24pin mainboard/ 1x 8(4+4 pin) ATX12V, CPU -\r\nĐầu cấp điện cho hệ thống:  1x 8 pin (6+2pin) VGA/ 2x Sata/ 2x Molex'),
('PSU03', 'PSU', 'Nguồn VSP 450W DELTA', 'VSP', 440000, 'Nguồn VSP 450W DELTA là nguồn máy tính với công suất 450W, sản xuất bởi hãng Delta, cung cấp hiệu suất ổn định và bảo vệ an toàn cho các linh kiện máy tính. Đây là lựa chọn phù hợp cho các hệ thống máy tính văn phòng hoặc sử dụng các cấu hình trung bình.', 0, 'uploads/nguon-VSP_450W_DELTA.webp', 2023, '2025-01-15', 101, -6, ' Màu sắc: Đen -\r\nHãng sản xuất: VSP -\r\nCông suất định danh: 450W -\r\nNguồn đầu vào: 200 _ 240V AC 5A 50_60Hz -\r\nKích thước: ATX/ 165x150x86 mm -\r\nLoại quạt: HBF 120MM fan both silent and efficient -\r\nTính năng bảo vệ: OVP, SCP, UVP -\r\nActive PFC: N/A'),
('PSU04', 'PSU', 'Nguồn Centaur 450W', 'CTR', 440000, 'Nguồn CENTAUR 450W là nguồn máy tính với công suất 450W, cung cấp hiệu suất ổn định và bảo vệ an toàn cho các linh kiện máy tính. Đây là lựa chọn phổ biến cho các hệ thống máy tính văn phòng và cấu hình trung bình, đáp ứng tốt nhu cầu sử dụng hàng ngày.', 0, 'uploads/nguon-centaur-450w.webp', 2023, '2025-01-15', 101, -6, ' Kích thước: 150x85x140(mm) -\r\nCổng kết nối: 20 + 4pin*1/ CPU 4 + 4pin*1/PCI_E 6 + 2pin*2/ SATA*2/Molex 4pin*2 -\r\nTuổi thọ: 100.000 giờ -\r\nOutput: 12V 35A(432W) -\r\nHãng sản xuất: Centaur -\r\nCông suất nguồn: 450W -\r\nHiệu suất: 80+ -\r\nCông nghệ bảo vệ: OPP/UVP/OVP/SCP -\r\nQuạt làm mát: 1x120mm\r\n'),
('PSU05', 'PSU', 'Nguồn VSP DELTA 550W', 'VSP', 528000, 'Nguồn VSP DELTA 550W là nguồn máy tính với công suất 550W, sản xuất bởi hãng Delta, cung cấp hiệu suất ổn định và bảo vệ an toàn cho các linh kiện máy tính. Đây là lựa chọn phù hợp cho các hệ thống máy tính với cấu hình tầm trung hoặc cao hơn, đáp ứng nhu cầu sử dụng đa dạng.', 0, 'uploads/nguon-VSP_DELTA_550W.jpg', 2023, '2025-01-15', 101, -6, '  Màu sắc: Đen -\r\nHãng sản xuất: VSP -\r\nCông suất định danh: 550W -\r\nNguồn đầu vào: 180_240V AC 5A 50_60Hz -\r\nKích thước: ATX/ 165x150x86 mm -\r\nLoại quạt : HBF 120MM fan both silent and efficient -\r\nTính năng bảo vệ:  OVP (Over Voltage Protection)_Bảo vệ quá áp, SCP (Short Circuit Protection)_Bảo vệ chạm tải, UVP (Under Voltage Protection)_Bảo vệ thấp áp. -\r\nPFC: N/A -\r\nChứng nhận quy chuẩn SX: CE, Rohs,');
INSERT INTO `product` (`product_id`, `category_id`, `product_name`, `brand_id`, `price`, `description`, `discount`, `image_link`, `date_first_available`, `saledate`, `amount`, `sold`, `product_thongso`) VALUES
('PSU06', 'PSU', 'Nguồn VSP ELITE Cao cấp 565W', 'VSP', 638000, 'Nguồn VSP ELITE Cao cấp 565W là nguồn máy tính với công suất 565W, thuộc dòng sản phẩm cao cấp của VSP. Nguồn cung cấp hiệu suất ổn định, tiết kiệm năng lượng và bảo vệ an toàn cho các linh kiện máy tính, thích hợp cho các hệ thống máy tính có cấu hình cao hoặc yêu cầu hiệu suất mạnh mẽ hơn.', 0, 'uploads/nguon-VSP_ELITE_Cao_c___p_565W.jpg', 2023, '2025-01-15', 101, -6, ' Màu sắc: Đen - \r\nHãng sản xuất: VSP -\r\nCông suất định danh: 565W -\r\nNguồn đầu vào: 180_240V AC 5A 5_0Hz -\r\nKích thước: ATX/ 165x150x86 mm -\r\nLoạt quạt: 120mm -\r\nTính năng bảo vệ: OVP, OPP, SCP -\r\nPFC : PFC active -\r\nChứng nhận quy chuẩn SX: CE, Rohs \r\n'),
('PSU07', 'PSU', 'Nguồn Cooler Master 750W 80PLUS Platinum', 'CLM', 1540000, 'Nguồn Cooler Master 750W 80PLUS Platinum là nguồn máy tính có công suất 750W và đạt chứng nhận 80PLUS Platinum, cho hiệu suất năng lượng rất cao và khả năng tiết kiệm điện vượt trội. Nguồn này phù hợp cho các hệ thống máy tính cao cấp hoặc máy tính chơi game, làm việc với yêu cầu cấu hình mạnh mẽ, đồng thời đảm bảo hoạt động ổn định và tiết kiệm năng lượng.', 0, 'uploads/nguon-cooler-master-750W_80PLUS_Platinum.webp', 2023, '2025-01-15', 101, -6, ' Chủng loại: Nguồn máy tính -\r\nĐiện áp đầu vào: 100_240V -\r\nCông suất: 750W -\r\nQuạt: 135mm -\r\nTiêu chuẩn: Active PFC -\r\nKích thước (CxRxD): 160 x 150 x 86 mm -\r\nMTBF: >100.000 giờ -\r\nModular: Full Modular -\r\nĐầu kết nối ATX 24 Pin: 1 -\r\nĐầu nối 4 + 4 pin EPS: 1 -\r\nĐầu nối 8 pin EPS: 1 -\r\nKết nối SATA: 12 -\r\nĐầu nối 4 Pin ngoại vi: 4 -\r\nĐầu kết nối PCI_e 6+2 Pin: 4 -\r\nHiệu suất: 92% -\r\nActive : PFC'),
('PSU08', 'PSU', 'Nguồn VSP DELTA 700W', 'VSP', 913000, 'Nguồn VSP DELTA 700W là nguồn máy tính có công suất 700W, sản xuất bởi hãng Delta, cung cấp hiệu suất ổn định và bảo vệ an toàn cho các linh kiện máy tính. Đây là lựa chọn lý tưởng cho các hệ thống máy tính có cấu hình mạnh mẽ, bao gồm cả máy tính chơi game và các ứng dụng cần hiệu suất cao.', 0, 'uploads/nguon-VSP_DELTA_700w.jpg', 2023, '2025-01-15', 101, -6, ' Màu sắc: đen -\r\nHãng sản xuất: VSP -\r\nCông suất định danh: 700W -\r\nNguồn đầu vào: 200~240VAC, 50_60Hz -\r\nLoại quạt: VSP,12V 0.4A, Max 2200RPM -\r\nTính năng bảo vệ: OCP/ Bảo vệ quá dòng -\r\nOPP/ Bảo vệ quá tải -\r\nSCP/ Bảo vệ ngắn mạch -\r\nActive PFC: No PFC -\r\nChứng nhận an toàn: CE/CB/Rohs -\r\nĐầu cấp điện cho bo mạch:_1x 24pin MB: 45cm_2x 4+4pin ATX12V: 70cm '),
('PSU09', 'PSU', 'Nguồn VSP ELITE Cao cấp 700W', 'VSP', 0, 'Nguồn VSP ELITE Cao cấp 700W là nguồn máy tính với công suất 700W, thuộc dòng sản phẩm cao cấp của VSP. Sản phẩm này cung cấp hiệu suất ổn định, bảo vệ an toàn cho các linh kiện máy tính, phù hợp cho các hệ thống máy tính có cấu hình mạnh, đặc biệt là các máy tính chơi game hoặc các ứng dụng yêu cầu hiệu suất cao.', 0, 'uploads/nguon-VSP_ELITE_Cao_c___p_700W.webp', 2023, '2025-01-15', 101, -6, ' Màu sắc: Đen -\r\nHãng sản xuất: VSP -\r\nCông suất định danh: 700W DC to DC -\r\nNguồn đầu vào: 180_240V AC 5A 50_60Hz -\r\nKích thước: ATX/ 165x150x86 mm -\r\nLoại quạt: 120mm -\r\nTính năng bảo vệ: OCP, OPP, SCP -\r\nPFC : Active PFC -\r\nChứng nhận quy chuẩn SX: CE, Rohs,'),
('PSU10', 'PSU', 'Nguồn VSP VGP750- 80 PLUS BRONZE', 'VSP', 1078000, 'Nguồn VSP VGP750 80 PLUS BRONZE là nguồn máy tính với công suất 750W và đạt chứng nhận 80 PLUS Bronze, đảm bảo hiệu suất năng lượng tối thiểu 82% ở tải 20%, 50% và 100%. Đây là lựa chọn lý tưởng cho các hệ thống máy tính chơi game hoặc cấu hình cao, mang lại hiệu quả sử dụng năng lượng tốt và độ bền cao.', 0, 'uploads/nguon-VSP_VGP750-_80_PLUS_BRONZE.jpg', 2023, '2025-01-15', 101, -6, ' Màu sắc: Đen -\r\nHãng sản xuất: VSP -\r\nChứng nhận 80 Plus: CLEAResult® 80 PLUS®_Bronze -\r\nCông suất định danh: 750W -\r\nNguồn đầu vào: AC 100~240V, 10_15A, 60/50Hz -\r\nLoại quạt: Quạt HBF kích thước 120mm vận hành êm ái và hiệu quả -\r\nTính năng bảo vệ: OVP/UVP/OPP/SCP/OTP -\r\nActive PFC: Yes  -\r\nTích hợp DC TO DC Converter: Yes -\r\nChứng nhận quy chuẩn SX: CB, CE, FC, RoHS '),
('PSU11', 'PSU', 'Nguồn VSP 1000W 80 PLUS GOLD', 'VSP', 2365000, 'Nguồn VSP 1000W 80 PLUS GOLD là nguồn máy tính với công suất 1000W và đạt chứng nhận 80 PLUS Gold, đảm bảo hiệu suất năng lượng cao lên tới 90% hoặc hơn ở tải 50%, giúp tiết kiệm điện và giảm phát thải nhiệt. Sản phẩm này thích hợp cho các hệ thống máy tính cao cấp, đặc biệt là các cấu hình chơi game mạnh mẽ hoặc máy tính làm việc chuyên nghiệp.', 0, 'uploads/nguon-VSP_1000W_80_PLUS_GOLD.jpg', 2023, '2025-01-15', 101, -6, ' Màu sắc: Đen -\r\nHãng sản xuất: VSP -\r\nChứng nhận 80 Plus: CLEAResult® 80 PLUS®_Gold -\r\nCông suất định danh: 1000W -\r\nNguồn đầu vào: AC 100~240V, 12/6A, 60/50Hz -\r\nKích thước: ATX_165 x 150 x 86 (mm) -\r\nLoại quạt: Quạt HBF kích thước 120mm vận hành êm ái và hiệu quả -\r\nTính năng bảo vệ: OCP/OPP/SCP/ -\r\nActive PFC: Yes /CM6500UNX\r\n'),
('PSU12', 'PSU', 'Nguồn ACER AC550 80 PLUS BRONZE', 'ACE', 726000, 'Nguồn ACER AC550 80 PLUS BRONZE là nguồn máy tính với công suất 550W và đạt chứng nhận 80 PLUS Bronze, giúp cung cấp hiệu suất năng lượng tốt, tiết kiệm điện và giảm nhiệt độ khi hoạt động. Đây là lựa chọn phù hợp cho các hệ thống máy tính văn phòng hoặc các cấu hình máy tính có nhu cầu không quá cao về công suất.', 0, 'uploads/nguon-ACER_AC550_80_PLUS_BRONZE.webp', 2023, '2025-01-15', 101, -6, ' Thương hiệut: machines Acer gadget -\r\nQuy chuẩn cáp: Full modular -\r\nChứng nhận 80 Plus: 80 plus Bronze -\r\nCông suất định danh: 550W -\r\nNguồn đầu vào: Full Range 90V_260V, 6A, 60/50Hz -\r\nTính năng bảo vệ: OVP/UVP/OPP/SCP/OTP -\r\nActive PFC: Yes / DC TO DC Converter -\r\nChứng nhận quy chuẩn SX: CE, RoHS -\r\nĐầu cấp điện cho bo mạch: _Mainboard: 1x 24pin : 55cm_CPU: 2x 4+4pin ATX12V: 60cm + 15cm -\r\nĐầu cấp điện cho hệ thống: _2x 6+2pin PCIe: 55cm_5x SATA: 50cm + 15cm + 15cm_3x ATA: 50cm + 15cm + 15cm'),
('PSU13', 'PSU', 'Nguồn ACER AC650 80 PLUS BRONZE', 'ACE', 1155000, 'Nguồn ACER AC650 80 PLUS BRONZE là nguồn máy tính có công suất 650W và đạt chứng nhận 80 PLUS Bronze, đảm bảo hiệu suất năng lượng tối thiểu 82% ở tải 20%, 50% và 100%. Sản phẩm này phù hợp cho các hệ thống máy tính tầm trung hoặc các cấu hình chơi game yêu cầu hiệu suất ổn định và tiết kiệm năng lượng.', 0, 'uploads/nguon-ACER_AC650_80_PLUS_BRONZE.webp', 2023, '2025-01-15', 101, -6, ' Thương hiệut: emachines Acer gadget  -\r\nQuy chuẩn cáp: Full modular -\r\nChứng nhận 80 Plus: 80 plus Bronze -\r\nCông suất định danh: 650W -\r\nNguồn đầu vào: Full Range 90V_260V, 7A, 60/50Hz -\r\nTính năng bảo vệ: OVP/UVP/OPP/SCP/OTP -\r\nActive PFC: Yes / DC TO DC Converter -\r\nChứng nhận quy chuẩn SX: CE, RoHS -\r\nĐầu cấp điện cho bo mạch: _Mainboard: 1x 24pin : 55cm_CPU: 2x 4+4pin ATX12V: 60cm + 15cm -\r\nĐầu cấp điện cho hệ thống: _2x 6+2pin PCIe: 55cm_5x SATA: 50cm + 15cm + 15cm_3x ATA: 50cm + 15cm + 15cm'),
('PSU14', 'PSU', 'Nguồn ACER AC750 80 PLUS BRONZE', 'ACE', 1419000, 'Nguồn ACER AC750 80 PLUS BRONZE là nguồn máy tính với công suất 750W và đạt chứng nhận 80 PLUS Bronze, đảm bảo hiệu suất năng lượng tối thiểu 82% ở tải 20%, 50% và 100%. Nguồn này phù hợp cho các hệ thống máy tính chơi game hoặc máy tính có cấu hình cao, mang lại hiệu quả sử dụng năng lượng tốt và độ bền cao.', 0, 'uploads/nguon-ACER_AC750_80_PLUS_BRONZE.webp', 2023, '2025-01-15', 101, -6, ' Hãng sản xuất: emachines Acer Gadget -\r\nQuy chuẩn cáp: Full modular -\r\nChứng nhận 80 Plus: 80 plus Bronze -\r\nCông suất định danh: 750W -\r\nNguồn đầu vào: 230V  8A max  43_67Hz -\r\nTính năng bảo vệ: OVP/UVP/OPP/SCP/OTP -\r\nActive PFC: Yes / DC TO DC Converter -\r\nChứng nhận quy chuẩn SX: CE, RoHS -\r\nĐầu cấp điện cho bo mạch: _Mainboard: 1x 24pin : 55cm_CPU: 2x 4+4pin ATX12V: 60cm + 30cm -\r\nĐầu cấp điện cho hệ thống: -\r\n2x 6+2pin PCIe: 55cm* -\r\n1x 12VHPWR/PCIe5.0: 55cm -\r\n5x SATA: 50cm + 15cm + 15cm -\r\n3x ATA: 50cm + 15cm + 15cm'),
('PSU15', 'PSU', 'Nguồn ACER - AC1000 - 80+ PLUS GOLD', 'ACE', 2860000, 'Nguồn ACER AC1000 80 PLUS GOLD là nguồn máy tính với công suất 1000W và đạt chứng nhận 80 PLUS Gold, đảm bảo hiệu suất năng lượng cao, tối thiểu 90% ở tải 50%. Sản phẩm này thích hợp cho các hệ thống máy tính cao cấp, đặc biệt là các cấu hình chơi game mạnh mẽ hoặc máy tính làm việc chuyên nghiệp, giúp tiết kiệm điện và giảm nhiệt.', 0, 'uploads/nguon-ACER_-_AC1000_-_80__PLUS_GOLD.jpg', 2023, '2025-01-15', 101, -6, ' Thương hiệu: emachines Acer gadget  -\r\nQuy chuẩn cáp: Full modular -\r\nChứng nhận 80 Plus: 80 plus Gold -\r\nCông suất định danh: 1000W -\r\nNguồn đầu vào:Full Range 90V_260V, 11A, 60/50Hz -\r\nTính năng bảo vệ: OCP/OVP/UVP/OPP/SCP/OTP -\r\nActive PFC: Yes / DC TO DC Converter -\r\nChứng nhận quy chuẩn SX: CE, RoHS -\r\nĐầu cấp điện cho bo mạch: _Mainboard: 1x 24pin : 55cm_CPU: 2x 4+4pin ATX12V: 60cm + 15cm -\r\nĐầu cấp điện cho hệ thống: _3x 6+2pin PCIe: 55cm_1x 12VHPWR/PCIe5.0: 55cm_5x SATA: 50cm + 15cm + 15cm_3x ATA: 50cm + 15cm + 15cm'),
('PSU16', 'PSU', 'Dây LED nguồn', 'COL', 275000, 'Dây LED RGB nguồn là loại dây cáp được sử dụng để kết nối các bộ phận hoặc linh kiện có đèn RGB (như quạt, dải LED) với nguồn điện trong máy tính. Dây này giúp cấp nguồn cho các thiết bị LED RGB hoạt động, đồng thời có thể hỗ trợ đồng bộ hóa màu sắc và hiệu ứng ánh sáng giữa các thiết bị trong hệ thống máy tính.', 0, 'uploads/psu-LED_ngu___n.webp', 2021, '2025-01-15', 101, -6, ' Sản phẩm bao gồm: rắc cắm + bộ nguồn chuyển đổi + chân kim + nút bảo vệ -\r\nRắc cắm có 4 loại chân kim khác nhau tương ứng với các loại đèn led dây khác nhau. -\r\nChân kim 16,5mm sử dụng cho đèn led dây 5730 2 hàng -\r\nChân kim 13,5mm sử dụng cho đèn led dây 3 hàng 2835 -\r\nChân kim 11,5mm sử dụng cho đèn led dây 2 hàng 2835 -\r\nChân kim 6mm sử dụng cho đèn led dây 1 hàng 3014'),
('RAM01', 'RAM', 'Ram DDR3 4G/1600 Đồng Bộ', 'SPM', 77000, 'RAM DDR3 4GB/1600MHz Đồng Bộ là bộ nhớ RAM sử dụng công nghệ DDR3 với dung lượng 4GB và tốc độ bus 1600MHz, thường được sử dụng trong các hệ thống máy tính cũ hoặc các dòng máy đồng bộ. Loại RAM này có băng thông phù hợp cho các tác vụ cơ bản và cấu hình văn phòng.', 0, 'uploads/ram-ddr3-4g-1600.png', 2010, '2025-01-15', 101, -6, ' Sản phẩm : DDR3-4G- bus 1600/1333 -\r\nHãng sản xuất : Ram bóc máy đồng bộ Samsung, Hynix, Dell, HP -\r\nDung lượng : 4G -\r\nBus : 1600 Mhz hoặc 1333 Mhz -\r\nType : DDR3  Ram  PC  -\r\nĐiện thế : 1.5V '),
('RAM02', 'RAM', 'RAM DDR4 4GB 2400 Đồng Bộ', 'SPM', 165000, 'RAM DDR4 4GB/2400MHz Đồng Bộ là bộ nhớ RAM sử dụng công nghệ DDR4 với dung lượng 4GB và tốc độ bus 2400MHz. Nó được thiết kế cho các hệ thống máy tính thế hệ mới, bao gồm cả máy đồng bộ, mang lại hiệu suất tốt hơn và tiêu thụ năng lượng thấp hơn so với DDR3.', 0, 'uploads/ram-ddr4-4gb-2400.png', 2016, '2025-01-15', 101, -6, ' Hãng sản xuất: Kingston, Hynix, Samsung... -\r\nHàng tháo máy đồng bộ -\r\nDung lượng: 4 GB -\r\nLoại bus: 2400 MHz\r\n '),
('RAM03', 'RAM', 'RAM 8GB/1600 Tiger Black', 'TGB', 187000, 'RAM 8GB/1600MHz Tiger Black là bộ nhớ RAM sử dụng công nghệ DDR3 với dung lượng 8GB và tốc độ bus 1600MHz, thường được sử dụng trong các hệ thống máy tính hỗ trợ DDR3. Sản phẩm thuộc dòng Tiger Black có thiết kế với màu sắc nổi bật và bền bỉ, phù hợp cho cả nhu cầu chơi game và làm việc.', 0, 'uploads/ram-8gb-1600.png', 2013, '2025-01-14', 101, -6, ' RAM : 8GB -\r\nBộ nhớ : DDR3 -\r\nHạn bảo hành : 3 năm -\r\nLoại bảo hành : Bảo hành nhà cung cấp -\r\nROM : 8GB -\r\n Kích thước (dài x rộng x cao) : 12cm x 6cm -\r\nTốc độ đồng hồ bộ nhớ : 1600MHz'),
('RAM04', 'RAM', 'RAM KingSpec 8G - 2666/3200', 'KSC', 385000, 'RAM KingSpec 8GB/2666MHz là bộ nhớ RAM sử dụng công nghệ DDR4 với dung lượng 8GB và tốc độ bus 2666MHz. Sản phẩm này được thiết kế để cải thiện hiệu suất hệ thống, phù hợp cho cả máy tính để bàn và laptop hỗ trợ DDR4, đáp ứng nhu cầu chơi game, làm việc đa nhiệm và các tác vụ đòi hỏi tốc độ cao.', 0, 'uploads/ram-kingspec-8g-16g-2666-3200.png', 2020, '2025-01-14', 101, -6, ' Model/Mã sản phẩmDDR4 -2666 MHz-8Gb (HS Code:84717010) -\r\nApplication/Hỗ trợPC DDR4 U-DIM -\r\nBus Ram/Bus hỗ trợ2666MHz -\r\nCapacity/Dung lượng8G -\r\nInput Voltage/Điện ápDC 1.2V/1.35V (±0.075v); -\r\nDimension/ Kích thước133.35mm length * 31.25mm wide * 4.0mm height error±0.15mm; -\r\nInterface/Giao diện chân Ram288pin -\r\nOperating Temp/Nhiệt độ hoạt động0℃--+85℃ -\r\nBaud Rate/Tốc độ BaudPC4-19200 -\r\nStorage Temp/Nhiệt độ bảo quản-20℃--+100℃'),
('RAM05', 'RAM', 'RAM KingSpec 16G - 2666/3200', 'KSC', 660000, 'RAM KingSpec 16GB - 2666/3200MHz là bộ nhớ RAM sử dụng công nghệ DDR4 với dung lượng 16GB, có hai phiên bản tốc độ bus 2666MHz và 3200MHz. Sản phẩm phù hợp cho các hệ thống máy tính để bàn và laptop hiện đại, đáp ứng tốt nhu cầu chơi game, xử lý đa nhiệm và các tác vụ nặng.', 0, 'uploads/ram-kingspec-8g-16g-2666-3200.png', 2020, '2025-01-14', 101, -6, ' Model/Mã sản phẩm : DDR4 3200 Mhz 16Gb   -\r\nApplication/Hỗ trợ : PC DDR4 U-DIM -\r\nBus Ram/Bus hỗ trợ : 3200MHz -\r\nCapacity/Dung lượng : 16GB -\r\nInput Voltage/Điện áp : 1.2V -\r\nDimension/ Kích thước : L133mm*W30mm -\r\nInterface/Giao diện chân Ram : 288pin -\r\nOperating Temp/Nhiệt độ hoạt động : 0℃--+85℃ -\r\nBaud Rate/Tốc độ Baud : PC4-19200 -\r\nStorage Temp/Nhiệt độ bảo quản : -20℃--+100℃'),
('RAM06', 'RAM', 'RAM KingBank 8G - 1600/2666/3200', 'KGB', 385000, 'RAM KingBank 8GB - 1600/2666/3200MHz là bộ nhớ RAM với các phiên bản:\r\n\r\nDDR3 1600MHz phù hợp cho các hệ thống cũ hỗ trợ DDR3.\r\nDDR4 2666MHz và DDR4 3200MHz dành cho các hệ thống mới hơn, tối ưu hiệu suất cho chơi game, làm việc đa nhiệm, và xử lý tác vụ nặng.', 10, 'uploads/ram-kingbank-8g-16g-2666-3200.png', 2017, '2025-01-14', 101, -6, ' Thương hiệu : Kingbank -\r\n    Dung lượng : 8GB -\r\n    Tần số : 1600/2666/3200 -\r\n    Loại : DDR4 -\r\n    Điện áp : 1.35V -\r\n    CAS Latency	 : 19_19_19_43 -\r\n    \r\n    Tính năng khác : Phù hợp với nhiều loại mainboard, Tản nhiệt, Công nghệ bảo vệ dữ liệu tốt -\r\n    Kích thước : 133.35 x 34 x 7.2mm  -\r\n    Khối lượng : 22g -\r\n    Chất liệu : Thiết kế tản nhiệt nhôm đơn'),
('RAM07', 'RAM', 'RAM KingBank 16G - 2666/3200', 'KGB', 649000, 'RAM KingBank 16GB - 2666/3200MHz là bộ nhớ RAM sử dụng công nghệ DDR4 với dung lượng 16GB, có hai tùy chọn tốc độ bus 2666MHz và 3200MHz. Sản phẩm này phù hợp cho các máy tính để bàn và laptop hiện đại, đáp ứng tốt nhu cầu chơi game, xử lý đa nhiệm, và các tác vụ nặng cần băng thông lớn.', 0, 'uploads/ram-kingbank-8g-16g-2666-3200.png', 2020, '2025-01-14', 101, -6, ' Dung lượng: 16GB -\r\nThế hệ: DDR4 -\r\nBus: 2666/3200MHz  -\r\nTản nhiệt: có'),
('RAM08', 'RAM', 'RAM Adata LED DDR4 16G/3200', 'ADA', 979000, 'RAM Adata LED DDR4 16GB/3200MHz là bộ nhớ RAM sử dụng công nghệ DDR4 với dung lượng 16GB và tốc độ bus 3200MHz. RAM này được trang bị hệ thống LED RGB tạo hiệu ứng ánh sáng sinh động, phù hợp cho các cấu hình máy tính chơi game và máy trạm hiệu suất cao, giúp nâng cao trải nghiệm và thẩm mỹ cho hệ thống.', 0, 'uploads/ram-adata-led-ddr4-16g-3200.png', 2021, '2025-01-14', 101, -6, ' Ram PC SPECTRIX D35G RGB -\r\nDung lượng 16GB (1 x 16GB) -\r\nLoại DDR4 Tốc độ 3200 MHz -\r\nHiệu ứng ánh sáng RGB có thể tùy chỉnh -\r\nTương thích với các nền tảng AMD mới nhất -\r\nHỗ trợ Intel XMP 2.0 để dễ dàng ép xung'),
('RAM09', 'RAM', 'RAM Team Delta - LED - DDR4 - 8G/3200', 'TGR', 539000, 'RAM Team Delta LED DDR4 8GB/3200MHz là bộ nhớ RAM thuộc dòng Team Delta, sử dụng công nghệ DDR4 với dung lượng 8GB và tốc độ bus 3200MHz. RAM này có thiết kế với hệ thống LED RGB nổi bật, mang đến hiệu ứng ánh sáng phong cách và hỗ trợ đồng bộ RGB trên nhiều bo mạch chủ, phù hợp cho cấu hình máy tính chơi game và đồ họa cao cấp.', 0, 'uploads/ram-teamDelta-led-ddr4-8g-3200.png', 2020, '2025-01-14', 101, -6, ' Ram cho máy tính để bàn -\r\nLoại: DDR4 -\r\nDung lượng: 8GB (1x8GB) -\r\nTốc độ bus: 3200 Mhz'),
('RAM10', 'RAM', 'RAM Team Vulcan Z - DDR4 - 8g/16g-3200 - đỏ', 'TGR', 429000, 'RAM Team Vulcan Z DDR4 - 8GB/16GB - 3200MHz (Màu Đỏ) là bộ nhớ RAM thuộc dòng Vulcan Z của TeamGroup, với hai tùy chọn dung lượng 8GB và 16GB và tốc độ bus 3200MHz. Sản phẩm có thiết kế tản nhiệt bằng nhôm màu đỏ nổi bật, giúp cải thiện hiệu quả làm mát, phù hợp cho các cấu hình máy tính chơi game và hiệu năng cao.', 0, 'uploads/ram-teamVulkanZ-ddr4-8g-16g-3200-red.png', 2020, '2025-01-14', 101, -6, ' Dung lượng: 16GB -\r\nBus: 3200Mhz -\r\nĐộ trễ: CL16_18_18_38 -\r\nĐiện áp: 1.35V -\r\nTản nhiệt: Có'),
('RAM11', 'RAM', 'RAM -Billion Reservoir BR- 16G/3200 DDR4- Tản Nhôm', 'BRV', 660000, 'RAM Billion Reservoir BR 16GB/3200MHz DDR4 - Tản Nhôm là bộ nhớ RAM sử dụng công nghệ DDR4 với dung lượng 16GB và tốc độ bus 3200MHz. Sản phẩm có thiết kế tản nhiệt bằng nhôm giúp cải thiện khả năng làm mát và hiệu suất hệ thống, phù hợp cho các máy tính chơi game và các tác vụ đòi hỏi hiệu năng cao.', 0, 'uploads/ram-billion-RBR-16g-3200-aluminium.png', 2020, '2025-01-14', 101, -6, ' Hiệu suất cao : RAM DDR4 Billion Reservoir Elite HeatSink 16GB 3200MHz  -\r\n tốc độ : 3200MHz  -\r\n  Dung lượng : 16GB -\r\n   Thiết kế : tản nhiệt nhôm '),
('RAM12', 'RAM', 'RAM -Billion Reservoir LED RGB- 8G/16g-3200 DDR4-Trắng', 'BRV', 858000, 'RAM Billion Reservoir LED RGB 8GB/16GB - 3200MHz DDR4 (Màu Trắng) là bộ nhớ RAM sử dụng công nghệ DDR4 với dung lượng 8GB và 16GB, tốc độ bus 3200MHz. Sản phẩm có hệ thống LED RGB với hiệu ứng ánh sáng sắc nét và có màu sắc chủ đạo trắng, mang lại sự nổi bật cho hệ thống máy tính. Phù hợp với các máy tính chơi game và các hệ thống có yêu cầu hiệu suất cao cùng thẩm mỹ nổi bật.', 0, 'uploads/ram-billion-RBR-8g-16g-3200-white.png', 2020, '2025-01-14', 101, -6, 'Dung lượng : 8GB  -\r\n    Tần số : 3200MHz -\r\n    Loại : DDR4 -\r\n    Điện áp : 1.35V ~ 1.5V -\r\n    CAS Latency	 : CL16 _ 20 _20 -\r\n     \r\n    Tính năng khác : Phù hợp với nhiều loại mainboard, Tản nhiệt, Hỗ trợ XMP 2.0, RGB -'),
('RAM13', 'RAM', 'RAM SSTC 8GB/16G - 3200 DDR4', 'STC', 594000, 'RAM SSTC 8GB/16GB - 3200MHz DDR4 là bộ nhớ RAM sử dụng công nghệ DDR4 với dung lượng 8GB và 16GB, cùng tốc độ bus 3200MHz. Sản phẩm này phù hợp cho các hệ thống máy tính hiện đại, tối ưu cho các tác vụ chơi game, làm việc đa nhiệm và xử lý dữ liệu nhanh chóng.', 0, 'uploads/ram-sstc-8g-16g-3200-ddr4.png', 2020, '2025-01-14', 101, -6, ' Dung lượng: 8GB/16G16G (1x8GB) \r\nLoại RAM: DDR4 \r\nTốc độ bus: 3200MHz \r\nĐộ trễ (CAS Latency): 16_20_20_40 \r\nĐiện áp: 1.35V \r\nHỗ trợ XMP/EXPO: Có \r\nTản nhiệt: Nhôm, màu đen, không có LED '),
('RAM14', 'RAM', 'RAM ECC DDR4 32GB/2133', 'SPM', 748000, 'RAM ECC DDR4 32GB/2133 là bộ nhớ với dung lượng 32GB sử dụng chuẩn DDR4 và tốc độ 2133 MHz. RAM này được trang bị công nghệ ECC (Error-Correcting Code), giúp phát hiện và sửa lỗi dữ liệu trong quá trình truyền tải, mang lại độ ổn định cao hơn, rất phù hợp cho các máy chủ, hệ thống yêu cầu tính chính xác cao.', 0, 'uploads/ram-ECC_DDR4_32GB-2133.webp', 2016, '2025-01-15', 101, -6, ' Dung lượng: 32GB -\r\nLoại RAM: DDR4 ECC (Error_Correcting Code) -\r\nTốc độ bus: 2133MHz (PC4_17000) -\r\nĐiện áp hoạt động: 1.2V -\r\nLoại: Registered (RDIMM) -\r\nTản nhiệt: Không có tản nhiệt -\r\nỨng dụng: Dùng cho máy chủ (Server) và máy trạm (Workstation)'),
('RAM15', 'RAM', 'RAM ECC DDR4 32GB/2400', 'SPM', 858000, 'RAM ECC DDR4 32GB/2400 là bộ nhớ 32GB sử dụng chuẩn DDR4 với tốc độ 2400 MHz. Bộ nhớ này hỗ trợ ECC (Error-Correcting Code), giúp tự động phát hiện và sửa lỗi dữ liệu, mang lại hiệu suất ổn định, đặc biệt hữu ích trong các hệ thống máy chủ hoặc các ứng dụng cần tính chính xác cao.', 0, 'uploads/ram-ECC_DDR4_32GB-2400.png', 2017, '2025-01-15', 101, -6, ' Dung lượng: 32GB -\r\nLoại RAM: DDR4 ECC (Error_Correcting Code) -\r\nTốc độ bus: 2400MHz (PC4_19200) -\r\nĐiện áp hoạt động: 1.2V -\r\nLoại DIMM: Registered (RDIMM) -\r\nTản nhiệt: Không có tản nhiệt -\r\nỨng dụng: Dùng cho máy chủ (Server) và máy trạm (Workstation)'),
('RAM16', 'RAM', 'RAM ECC DDR3 32GB/1600', 'SPM', 495000, 'RAM ECC DDR3 32GB/1600 là bộ nhớ 32GB sử dụng chuẩn DDR3 với tốc độ 1600 MHz. Bộ nhớ này hỗ trợ ECC (Error-Correcting Code), giúp phát hiện và sửa lỗi dữ liệu, nâng cao độ tin cậy và ổn định, đặc biệt được sử dụng trong các máy chủ hoặc hệ thống yêu cầu tính chính xác cao trong xử lý dữ liệu.', 0, 'uploads/ram-ECC_DDR3_32GB-1600.jpg', 2015, '2025-01-15', 101, -6, ' Dung lượng: 32GB -\r\nLoại RAM: DDR3 ECC (Error_Correcting Code) -\r\nTốc độ bus: 1600MHz -\r\nĐiện áp hoạt động: 1.5V -\r\nLoại DIMM: Registered (RDIMM) -\r\nTản nhiệt: Không có tản nhiệt -\r\nỨng dụng: Dùng cho máy chủ (Server) và máy trạm (Workstation)'),
('SPK01', 'SPK', 'LOA GỖ M1017', 'LRF', 77000, 'Loa Gỗ M1017 là một loại loa với vỏ ngoài làm từ gỗ, giúp mang lại âm thanh ấm và tự nhiên. Loa này thường được thiết kế với chất liệu gỗ để giảm thiểu độ rung và cải thiện chất lượng âm thanh. Loa Gỗ M1017 phù hợp cho việc nghe nhạc, xem phim hoặc làm loa phụ trong hệ thống âm thanh gia đình.', 0, 'uploads/loa-wood-M1017.jpg', 2019, '2025-01-15', 101, -6, ' Loa có 2 đầu cắm: 1 đầu vào ổ USB, 1 đầu vào ổ loa -\r\nKiểu loa: 2.0 (bộ 2 loa) -\r\nCông suất: 6W -\r\nSNR: 60 >= dB -\r\nTần số: 90HZ_20KHZ -\r\nNguồn: USB 5v (lấy trực tiếp từ máy tính, laptop hoặc cổng usb bất kỳ) -\r\nTỷ số nén nhiễu: >= 70dB -\r\nJack cắm loa: chuẩn jack 3.5mm -\r\nKích thước 10x20x10 cm x 2 loa'),
('SPK02', 'SPK', 'LOA - Soundmax A700 2.1( full VAT)', 'SDM', 407000, 'Loa SoundMax A700 2.1 là một hệ thống loa 2.1 với một loa subwoofer và hai loa vệ tinh, mang đến âm thanh mạnh mẽ và bass sâu. Loa này thường được sử dụng cho các hệ thống giải trí gia đình, chơi game, xem phim, hoặc nghe nhạc. Với thiết kế đơn giản và tính năng kết nối đa dạng, loa SoundMax A700 2.1 phù hợp cho những không gian vừa và nhỏ.', 0, 'uploads/loa-Soundmax_A700_2.1__full_VAT_.jpg', 2017, '2025-01-15', 101, -6, ' Hệ thống loa: 2.1 kênh, thùng loa màu đen -\r\nCấu hình: 2 loa vệ tinh, 1 loa siêu trầm (Subwoofer) -\r\nChống nhiễm từ: có -\r\nĐiều chỉnh âm thanh: Volume, Bass,Treble, -\r\nTổng công suất: 16W (RMS) -\r\nĐáp ứng tần số: 20Hz _ 20KHz -\r\nMàu loa: Màu Đen -\r\nĐiều khiển từ xa: Không -\r\nKích thước Loa siêu trầm: 180 x 157 x 132 mm (WxDxH,mm) -\r\nKích thước Loa vệ tinh: 80 x 80 x 115 mm (WxDxH,mm) -\r\nNguồn: DC 5V -\r\nChất liệu: Nhựa -\r\nTrọng lượng: 1.3kg'),
('SPK03', 'SPK', 'LOA FENDA A180 2.1', 'FEN', 759000, 'Loa Fenda A180 2.1 là hệ thống loa 2.1 bao gồm một loa subwoofer và hai loa vệ tinh, mang đến âm thanh mạnh mẽ và bass sâu. Loa này phù hợp cho việc nghe nhạc, chơi game và xem phim, đặc biệt với thiết kế nhỏ gọn và dễ dàng kết nối với nhiều thiết bị khác nhau.', 0, 'uploads/loa-FENDA_A180_2-1.jpg', 2018, '2025-01-15', 101, -6, ' Thương hiệu	: Fenda -\r\nMã sản phẩm	: A180X/2.1 -\r\nSố kênh	: 2.1 -\r\nĐiều khiển từ xa:	: Có -\r\nKết nối : Bluetooth -\r\nThẻ nhớ : USB -\r\n \r\nXuất xứ	: Chính hãng'),
('SPK04', 'SPK', 'LOA LAPOP A55 2.0', 'LPP', 154000, 'Loa LAPOP A55 2.0 là hệ thống loa 2.0 đơn giản gồm hai loa vệ tinh, cung cấp âm thanh stereo phù hợp cho việc nghe nhạc và xem phim trên máy tính hoặc laptop. Với thiết kế nhỏ gọn, sản phẩm này dễ dàng bố trí trên bàn làm việc.', 0, 'uploads/loa-LAPOP_A55_2-0.png', 2022, '2025-01-15', 101, -6, '  Kích thước: 25x10cm\r\n- Tương thích với nhiều thiết bị như laptop, PC, điện thoại...\r\n- Lấy tín hiệu từ jack cắm 3.5mm\r\n- Chất liệu: nhựa, gỗ\r\n- Điện trực tiếp từ cổng USB của máy tính'),
('SPK05', 'SPK', 'LOA LAPOP A58 2.0', 'LPP', 143000, 'Loa LAPOP A58 2.0 là loa máy tính hai kênh (2.0) với thiết kế nhỏ gọn, phù hợp cho nhu cầu nghe nhạc, xem phim hoặc sử dụng giải trí cơ bản trên máy tính. Sản phẩm có kiểu dáng hiện đại và thường kết nối qua cổng 3.5mm hoặc USB.', 0, 'uploads/loa-LAPOP_A58_2-0.webp', 2023, '2025-01-15', 101, -6, 'Model sản phẩm: A58 -\r\nHệ thống loa: 2.0 -\r\nSố lượng loa: 2 loa -\r\nCông suất: 3W x 2 loa -\r\nChất liệu vỏ: gỗ -\r\nKiểu thiết kế: Liền khối chữ nhật -\r\nKết nối nguồn điện: Cổng USB 5V'),
('SPK06', 'SPK', 'LOA Microlab M105 - 2.1', 'MRL', 495000, 'Loa Microlab M105 - 2.1 là hệ thống loa 2.1 gồm 1 loa siêu trầm và 2 loa vệ tinh, mang lại âm thanh mạnh mẽ và chất lượng bass tốt, phù hợp cho việc nghe nhạc, xem phim và chơi game trên máy tính. Sản phẩm có thiết kế đơn giản, dễ sử dụng với các nút điều chỉnh âm lượng tiện lợi.', 0, 'uploads/loa-Microlab_M105-_2-1.jpg', 2022, '2025-01-15', 101, -6, ' Hãng sản xuất : Microlab -\r\nModel : M105 -\r\nChuẩn âm thanh : 2.1 -\r\nTổng công suất loa : 10W -\r\nCS loa siêu trầm/ vệ tinh : 5W + 5W (2.5Wx2) -\r\nTần số đáp ứng : 40Hz_20kHz -\r\nĐiều khiển từ xa : Không -\r\nCổng tín hiệu vào : 3.5mm stereo -\r\nKích thước : 135x215x165 mm'),
('SPK07', 'SPK', 'LOA Microlab M900 - 4.1', 'MRL', 1320000, 'Loa Microlab M900 - 4.1 là hệ thống loa gồm 4 loa vệ tinh và 1 loa siêu trầm, mang lại trải nghiệm âm thanh vòm mạnh mẽ, sống động, phù hợp cho nhu cầu giải trí như xem phim, nghe nhạc, và chơi game. Sản phẩm có thiết kế hiện đại, điều khiển dễ dàng với các nút chức năng trên loa.', 0, 'uploads/loa-Microlab_M900_-_4-1.webp', 2023, '2025-01-15', 101, -6, '  Công suất loa: 50W(9Wx4+14W)\r\n- Loa có Tần số đáp ứng: 35Hz_20KKHz\r\n- Tỷ số nén nhiễu S/n(dB): >60- \r\nĐộ nhạy loa: >40 db- \r\nMàu loa: Đen- \r\nLoa vệ tinh:92x102x120mm.\r\n- Loa siêu trầm:245x235x230mm'),
('SPK08', 'SPK', 'LOA Microlab M108', 'MRL', 539000, 'Loa Microlab M108 là hệ thống loa 2.1 với thiết kế đơn giản, bao gồm 2 loa vệ tinh và 1 loa siêu trầm, mang đến âm thanh trầm ấm và chi tiết cho nhu cầu giải trí cơ bản như nghe nhạc và xem phim. Sản phẩm tích hợp nút điều chỉnh âm lượng và âm trầm tiện lợi.', 0, 'uploads/loa-Microlab_M108.png', 2022, '2025-01-15', 101, -6, ' Công suất: 6.3 Watt -\r\nTần số đáp ứng: 35Hz_20kHz -\r\nHệ thống loa 2.1 cho âm thanh chất lượng cao -\r\nTỷ số nén nhiễu S/N >75dB -\r\nKích thước (WxHxD): loa trầm 149x210x190 mm -\r\nKích thước loa vệ tinh 96x136x94 mm'),
('SPK09', 'SPK', 'LOA MINI 2.0 E - 1053 / E - 1046', 'LRF', 66000, 'Loa Mini 2.0 E-1053 / E-1046 là dòng loa mini 2.0 nhỏ gọn, thiết kế đơn giản với âm thanh phù hợp cho nhu cầu nghe nhạc, học tập hoặc giải trí nhẹ nhàng. Các mẫu này thường có kết nối qua cổng 3.5mm hoặc USB.', 0, 'uploads/loa-MINI_2.0_E_-_1053_-_E_-_1046.jpg', 2023, '2025-01-15', 101, -6, ' Thương hiệu : OEM -\r\nThiết bị âm thanh tương thích : điện thoại di động -\r\nTần số tối đa : 20000Hz -\r\nTần số tối thiểu : 45Hz -\r\nĐộ nhạy : 86dB -\r\n \r\nKết nối đầu vào : USB, Khác, 3.5 -\r\nKiểu kết nối : Có dây -\r\nKích thước (dài x rộng x cao) : Loa Mini'),
('SSD01', 'SSD', 'SSD 2.5 SamSung 120G - 128G', 'SAM', 264000, 'SSD 2.5 Samsung 120GB - 128GB là ổ cứng thể rắn (SSD) kích thước 2.5 inch với dung lượng lưu trữ 120GB hoặc 128GB. Sản phẩm này sử dụng công nghệ NAND Flash và có hiệu suất đọc/ghi nhanh, giúp tăng tốc độ khởi động hệ điều hành và tải ứng dụng so với ổ cứng HDD truyền thống.', 0, 'uploads/ssd-2.5-samsung-120G-250G-128gb.png', 2018, '2025-01-14', 101, -6, ' Model:	MZ_75E120B/AM -\r\n \r\nDung lượng:	120 GB -\r\nForm Factor:	2.5 Inch -\r\nGiao tiếp:	SATA -\r\nGiao thức:	AHCI -\r\nNAND Flash:	TLC (Samsung V_NAND 3bit MLC) -\r\nBộ điều khiển:	Samsung MGX Controller -\r\nTuổi thọ đọc ghi:	75 TBW -\r\nĐộ bền (MTBF):	1,5 Triệu giờ -\r\nDRAM Cache Memory:	256 MB (Low Power DDR3)'),
('SSD02', 'SSD', 'SSD 2.5 SamSung 250G', 'SAM', 1516900, 'SSD 2.5 Samsung 250GB là ổ cứng thể rắn (SSD) kích thước 2.5 inch với dung lượng lưu trữ 250GB, sử dụng công nghệ NAND Flash. Sản phẩm này mang lại hiệu suất cao, giúp tăng tốc độ đọc/ghi dữ liệu và cải thiện thời gian khởi động hệ điều hành, lý tưởng cho các máy tính để bàn và laptop.', 15, 'uploads/ssd-2.5-samsung-120G-250G-128gb.png', 2019, '2025-01-14', 101, -6, ' Dung lượng: 250GB -\r\nTốc độ đọc (SSD): 560MB/s -\r\nTốc độ ghi (SSD): 530MB/s -\r\nChuẩn giao tiếp: SATA3 -\r\nKích thước: 2.5Inch'),
('SSD03', 'SSD', 'SSD 256GB/1TB COLORFUL', 'COL', 396000, 'SSD 256GB/1TB COLORFUL là ổ cứng thể rắn (SSD) từ thương hiệu Colorful, có hai tùy chọn dung lượng 256GB và 1TB. Sản phẩm này cung cấp hiệu suất đọc/ghi nhanh chóng, giúp tăng tốc độ khởi động hệ điều hành, tải ứng dụng, và cải thiện tổng thể hiệu năng hệ thống.', 0, 'uploads/ssd-256g-1t-colorful.png', 2020, '2025-01-14', 101, -6, ' Model	CN600 PRO (256Gb>1TB) M2 NVMe _ CN600 DDR (512GB) -\r\nDung lượng: 256GB_ 512GB_1TB\r\n- 256GB: Đọc tuần tự	1200 MB/s, Ghi tuần tự	3200 MB/s\r\n\r\n- 512GB: Đọc tuần tự	2600 MB/s, Ghi tuần tự	3300 MB/s\r\n\r\n- 1 TB: Đọc tuần tự	3100 MB/s, Ghi tuần tự	3400 MB/s -\r\n\r\nChuẩn giao tiếp	:NVME'),
('SSD04', 'SSD', 'SSD SSTC 128GB/256GB/512GB', 'STC', 748000, 'SSD SSTC 128GB/256GB/512GB là ổ cứng thể rắn (SSD) với các tùy chọn dung lượng 128GB, 256GB, và 512GB. Sản phẩm sử dụng công nghệ NAND Flash với hiệu suất đọc/ghi nhanh, phù hợp cho việc nâng cấp máy tính để cải thiện thời gian khởi động, tốc độ tải ứng dụng, và hiệu năng tổng thể.', 0, 'uploads/ssd-sstc-128g-256g-512g-sata-3.png', 2021, '2025-01-14', 101, -6, '  \r\n Chuẩn giao tiếp: SATA III 6gb/s\r\n- Dung lượng: 256 GB/ 512GB\r\n- Tốc độ đọc: Up to 560 MB/s \r\n- Tốc độ ghi: Up to 470MB/s\r\n- Kích thước : 2.5 inch\r\n- TBW: 80TB/  100TB'),
('SSD05', 'SSD', 'SSD NVME KingBank BR 256GB/1TB', 'KGB', 1419000, 'SSD NVMe KingBank BR 256GB/1TB là ổ cứng thể rắn (SSD) sử dụng giao tiếp NVMe PCIe với dung lượng 256GB hoặc 1TB. Sản phẩm có tốc độ đọc/ghi cao, phù hợp cho các hệ thống cần hiệu suất nhanh để khởi động hệ điều hành, tải ứng dụng và xử lý dữ liệu lớn.', 0, 'uploads/ssd-nvme-br-256g.png', 2022, '2025-01-14', 101, -6, '  \r\n \r\n Dung lượng: 240GB\r\n- Kích thước: M.2 2280\r\n- Giao tiếp: NVMe PCIe\r\n- Tốc độ đọc/ghi (Up to): 2000MB/s(R) _ 1700MB/s (W)\r\n- 4K IOPs(up to): 80K(R) 128K(W)\r\n- MTBF/ TBW: 1,800,000 hours\r\n- Điện áp: 3.3V\r\n- Flash: 3D NAND\r\n \r\n '),
('SSD06', 'SSD', 'SSD NVME - M2 Kingston 1TB - 2280', 'KIT', 1595000, 'SSD NVMe M.2 Kingston 1TB - 2280 là ổ cứng thể rắn sử dụng chuẩn M.2 2280 với giao thức NVMe PCIe và dung lượng 1TB. Sản phẩm cung cấp hiệu suất đọc/ghi vượt trội, giúp tối ưu hóa tốc độ khởi động hệ điều hành, tải ứng dụng, và xử lý các tác vụ nặng, phù hợp cho máy tính hiệu suất cao và laptop gaming.', 0, 'uploads/ssd-nvme-m2-kingston-1tb-2280.png', 2021, '2025-01-14', 101, -6, ' Dung lượng: 1TB -\r\nKích thước: M.2 2280 -\r\nGiao diện: PCIe 4.0 x4 NVMe -\r\nTốc độ đọc tuần tự tối đa: 3.500 MB/giây -\r\nTốc độ ghi tuần tự tối đa: 2.100 MB/giây -\r\nĐộ bền (TBW): 320 TB -\r\nTuổi thọ trung bình (MTBF): 1.500.000 giờ -\r\nNhiệt độ hoạt động: 0°C ~ 70°C -\r\nĐộ rung khi hoạt động: 2,17 G (7_800 Hz)'),
('SSD07', 'SSD', 'SSD NVME SK Hynix 256G/512G', 'SKH', 902000, 'SSD NVMe SK Hynix 256GB/512GB là ổ cứng thể rắn sử dụng giao thức NVMe PCIe với các dung lượng 256GB và 512GB. Sản phẩm được trang bị công nghệ NAND Flash tiên tiến của SK Hynix, cung cấp hiệu suất đọc/ghi tốc độ cao, giúp tăng tốc thời gian khởi động hệ điều hành và cải thiện tốc độ xử lý dữ liệu.', 0, 'uploads/ssd-nvme-hynix-256g-512g-allGen.png', 2021, '2025-01-14', 101, -6, ' Dung lượng: 256GB/512G  -\r\nKích thước: M.2 2230 (22x30mm) -\r\nGiao diện: PCIe 3.0 x4 NVMe -\r\nTốc độ đọc tuần tự: Lên đến 2.850 MB/s -\r\nTốc độ ghi tuần tự: Lên đến 1.400 MB/s -\r\nLoại NAND Flash: TLC -\r\nController: SK Hynix\r\n'),
('SSD08', 'SSD', 'NVME SSTC 256GB/512Gb Gen3X4', 'STC', 858000, 'SSD NVMe SSTC 256GB/512GB Gen3x4 là ổ cứng thể rắn sử dụng giao tiếp NVMe PCIe Gen 3x4 với các tùy chọn dung lượng 256GB và 512GB. Sản phẩm có tốc độ đọc/ghi cao, phù hợp cho các hệ thống yêu cầu hiệu suất cao, giúp cải thiện thời gian khởi động, tốc độ tải ứng dụng và hiệu năng xử lý dữ liệu.', 0, 'uploads/ssd-nvme-sstc-256g-512g-allGen.png', 2021, '2025-01-14', 101, -6, ' Dung lượng: 256GB -\r\nGiao diện: NVMe PCIe Gen 3x4 -\r\nTốc độ đọc tuần tự: Lên đến 2.400 MB/s -\r\nTốc độ ghi tuần tự: Lên đến 1.400 MB/s -\r\nKích thước: M.2 2280 (22x80mm)'),
('VGA01', 'VGA', 'VGA WINMAX- GTX 1060 - 3G - DDR5', 'NVD', 2640000, 'VGA WINMAX GTX 1060 - 3GB - DDR5 là card đồ họa sử dụng GPU NVIDIA GeForce GTX 1060 với bộ nhớ 3GB GDDR5, phù hợp cho các tác vụ chơi game tầm trung và xử lý đồ họa. Đây là phiên bản của thương hiệu WINMAX, mang lại hiệu suất tốt trong các tựa game ở độ phân giải Full HD với cài đặt trung bình đến cao.', 0, 'uploads/vga-WINMAX-_GTX_1060_-_3G_-_DDR5.png', 2016, '2025-01-15', 101, -6, '  Chip đồ họa: NVIDIA GeForce GTX 1060 -\r\nSố nhân CUDA: 1152 -\r\nXung nhịp cơ bản: 1506 MHz -\r\nBộ nhớ: 3GB GDDR5 -\r\nBăng thông bộ nhớ: 192_bit -\r\nXung nhịp bộ nhớ: 8008 MHz -\r\nGiao diện: PCI Express 3.0 x16 -\r\nCổng kết nối: 192_bit1 x HDMI, 192_bit1 x DVI, 192_bit3 x DisplayPort -\r\nHỗ trợ DirectX: 12 -\r\nYêu cầu nguồn: Công suất tối thiểu 400W'),
('VGA02', 'VGA', 'VGA 1050TI 4G', 'NVD', 1760000, 'VGA GeForce GTX 1050 Ti 4GB là một card đồ họa phổ biến của NVIDIA thuộc dòng Pascal, được thiết kế cho các game thủ phổ thông và nhu cầu đồ họa tầm trung.', 0, 'uploads/vga-1050TI_4G.png', 2016, '2025-01-15', 101, -6, ' GPU: NVIDIA GeForce GTX 1050 Ti -\r\nSố nhân CUDA: 768 -\r\nXung nhịp cơ bản: Khoảng 1290 MHz -\r\nXung nhịp tăng cường: Khoảng 1392 MHz -\r\nBộ nhớ: 4GB GDDR5 -\r\n \r\nBăng thông bộ nhớ: Khoảng 112 GB/s -\r\nGiao diện kết nối: PCI Express 3.0 x16 -\r\nCổng kết nối: 1 x DisplayPort 1.4, 1 x HDMI 2.0, 1 x DVI-D -\r\nHỗ trợ DirectX: 12 -\r\nHỗ trợ OpenGL: 4.5 -\r\nĐộ phân giải kỹ thuật số tối đa: 7680x4320 -\r\nSố màn hình hỗ trợ tối đa: 3 -\r\nCông suất tiêu thụ: 75W -\r\nNguồn đề nghị: 300W'),
('VGA03', 'VGA', 'VGA GT730 2G/DDR5', 'NVD', 990000, 'VGA GT730 2G/DDR5 là card đồ họa thuộc phân khúc phổ thông phù hợp cho các tác vụ cơ bản như xem phim, làm việc văn phòng, hoặc chơi các tựa game nhẹ.', 0, 'uploads/vga-GT730_2G-DDR5.webp', 2014, '2025-01-15', 101, -6, ' GPU: NVIDIA GeForce GT 730 -\r\nSố nhân CUDA: 384 -\r\nXung nhịp nhân: 902 MHz -\r\nBộ nhớ: 2GB GDDR5 -\r\nGiao diện bộ nhớ: 64_bit -\r\nTốc độ bộ nhớ: 5000 MHz -\r\nBăng thông bộ nhớ: 40 GB/s -\r\nGiao diện kết nối: PCI Express 2.0 -\r\nCổng kết nối: 1 x DVI_D, 1 x HDMI, 1 x D_Sub -\r\nĐộ phân giải kỹ thuật số tối đa: 4096 x 2160 (qua cổng HDMI) -\r\nHỗ trợ DirectX: 12 -\r\nHỗ trợ OpenGL: 4.4 -\r\nSố màn hình hỗ trợ tối đa: 3 -\r\nCông suất nguồn đề nghị: 300W -\r\nKích thước: 164 x 111 x 23 mm'),
('VGA04', 'VGA', 'VGA WINMAX RX580 8G D5', 'NVD', 2530000, 'VGA WINMAX RX580 8G D5 là card đồ họa sử dụng GPU RX 580 với bộ nhớ 8GB GDDR5. RX 580 được thiết kế dựa trên kiến trúc Polaris 20 của AMD, cung cấp hiệu năng tốt cho các tác vụ chơi game và đồ họa ở độ phân giải Full HD và 2K với khả năng hỗ trợ DirectX 12 và Vulkan. Sản phẩm thích hợp cho gaming tầm trung và các ứng dụng đồ họa phổ thông.', 0, 'uploads/vga-WINMAX_RX580_8G_D5.jpg', 2017, '2025-01-15', 101, -6, ' GPU: AMD Radeon RX 580 -\r\nBộ nhớ: 8GB GDDR5 -\r\nGiao diện bộ nhớ: 256_bit -\r\nXung nhịp lõi: 1290 MHz -\r\nTốc độ bộ nhớ: 7000 MHz -\r\nGiao diện kết nối: PCI Express 3.0 x16 -\r\nCổng kết nối: 1 x DVI, 1 x DisplayPort, 1 x HDMI -\r\nNguồn yêu cầu: 450W -\r\nKích thước: 210 x 125 x 40 mm -\r\nChứng nhận: CE/RoHS'),
('VGA05', 'VGA', 'VGA MSI Ventus GTX1650 4G- XS OC- DDR6', 'NVD', 3795000, 'VGA MSI Ventus GTX1650 4G XS OC GDDR6 là card đồ họa sử dụng GPU NVIDIA GeForce GTX 1650 với bộ nhớ 4GB GDDR6. Dòng Ventus của MSI có thiết kế tản nhiệt kép giúp cải thiện hiệu suất làm mát, trong khi phiên bản OC (Overclocked) được tối ưu hóa xung nhịp để tăng hiệu năng chơi game. GTX 1650 hỗ trợ công nghệ NVIDIA Turing cho khả năng xử lý đồ họa tốt ở độ phân giải Full HD.', 0, 'uploads/vga-MSI_Ventus_GTX1650_4G-_XS_OC-_DDR6.jpg', 2020, '2025-01-15', 101, -6, ' GPU: NVIDIA GeForce GTX 1650 -\r\nBộ nhớ: 4GB GDDR6 -\r\nGiao diện bộ nhớ: 128_bit -\r\nXung nhịp lõi: Boost: 1620 MHz -\r\nSố nhân CUDA: 896 -\r\nGiao diện kết nối: 1 x DisplayPort 1.4a, 1 x HDMI 2.0b (hỗ trợ 4K@60Hz), 1 x DVI_D -\r\nCông suất tiêu thụ: 75W -\r\nNguồn đề nghị: 300W -\r\nKích thước: 177 x 111 x 38 mm -\r\nHỗ trợ DirectX: 12 API -\r\nHỗ trợ OpenGL: 4.6 -\r\nHỗ trợ G_SYNC: Có -\r\nĐộ phân giải tối đa: 7680 x 4320'),
('VGA06', 'VGA', 'VGA Colorful/Gigabyte/Asus/MSI GTX 1660S SUPER 6GB/192Bit/D6', 'NVD', 3630000, 'VGA GTX 1660 Super 6GB 192Bit GDDR6 là card đồ họa thuộc dòng NVIDIA GeForce GTX 1660 Super, sử dụng bộ nhớ 6GB GDDR6 với băng thông 192-bit. GTX 1660 Super mang lại hiệu suất cao hơn so với GTX 1660 thường, được tối ưu hóa để chơi game ở độ phân giải Full HD (1080p) với mức cấu hình cao. Đây là lựa chọn lý tưởng cho các game thủ yêu cầu đồ họa mượt mà trong các tựa game hiện đại mà không cần đến card đồ họa RTX.', 0, 'uploads/vga-Colorful-Gigabyte-Asus-MSI_GTX_1660S_SUPER_6GB-192Bit-D6.jpg', 2019, '2025-01-15', 101, -6, ' GPU: NVIDIA GeForce GTX 1660 Super -\r\nBộ nhớ: 6GB GDDR6 -\r\nGiao diện bộ nhớ: 192_bit -\r\nXung nhịp lõi: 1530 MHz (Base), 1830 MHz (Boost) -\r\nTốc độ bộ nhớ: 14 Gbps -\r\nCổng kết nối: 1 x HDMI 2.0b, 3 x DisplayPort 1.4 -\r\nNguồn yêu cầu: 450W -\r\nKích thước: 225.65 x 122.02 x 40.5 mm -\r\nNguồn phụ: 1 x 8_pin -\r\nHỗ trợ DirectX: 12 -\r\nHỗ trợ OpenGL: 4.5 -\r\nĐộ phân giải tối đa: 7680 x 4320 -\r\nSố màn hình hỗ trợ tối đa: 3 -\r\nTDP: 125W'),
('VGA07', 'VGA', 'VGA Colorful/MSI/Asus RTX 3050 6G - DDR6', 'NVD', 5170000, 'VGA RTX 3050 6GB DDR6 là card đồ họa thuộc dòng NVIDIA GeForce RTX 3050, sử dụng bộ nhớ 6GB GDDR6. Đây là card đồ họa tầm trung của NVIDIA với tính năng Ray Tracing và DLSS, giúp tối ưu hóa hiệu suất chơi game ở độ phân giải Full HD (1080p) và hỗ trợ các tựa game hiện đại. RTX 3050 là lựa chọn lý tưởng cho các game thủ muốn trải nghiệm đồ họa Ray Tracing mà không cần chi quá nhiều tiền cho card đồ họa cao cấp hơn.', 0, '../uploads/678b16780810e_VGA COLOFUL-MSI - ASUS - RTX 3050 6G - DDR6 - 1.webp', 2022, '2025-01-18', 101, -6, ' GPU: NVIDIA GeForce RTX 3050 -\r\nNhân CUDA: 2304 -\r\nBộ nhớ: 6GB GDDR6 -\r\nGiao diện bộ nhớ: 96_bit -\r\nXung nhịp GPU: Tối đa 1470 MHz -\r\nCổng kết nối: 1 x DisplayPort 1.4a, 1 x HDMI 2.1, 1 x DVI_D -\r\nNguồn đề xuất: 450W -\r\nTDP: 70W -\r\nKích thước: 225.65 x 122.02 x 40.5 mm -\r\nHỗ trợ DirectX: 12 -\r\nHỗ trợ OpenGL: 4.6 -\r\nĐộ phân giải tối đa: 7680 x 4320 -\r\nSố màn hình hỗ trợ tối đa: 3 -\r\nTính năng đặc biệt: Hỗ trợ Ray Tracing và DLSS \r\n'),
('VGA08', 'VGA', 'VGA MSI 3060 12G VENTUS 2 FAN', 'NVD', 7920000, 'VGA MSI GeForce RTX 3060 12GB VENTUS 2 FAN là một card đồ họa thuộc dòng NVIDIA GeForce RTX 3060, với 12GB GDDR6 và sử dụng 2 quạt để làm mát hiệu quả. Với RTX 3060, bạn có thể chơi game ở độ phân giải 1440p và một số tựa game 4K với cài đặt trung bình đến cao. RTX 3060 hỗ trợ Ray Tracing và DLSS, giúp cải thiện hiệu suất và chất lượng hình ảnh trong các trò chơi hỗ trợ công nghệ này.', 0, '../uploads/678b16dbf27b7_vga-MSI_3060_12G_VETUS_2_FAN.webp', 2021, '2025-01-18', 101, -6, ' GPU: NVIDIA GeForce RTX 3060 -\r\nNhân CUDA: 3584 -\r\nBộ nhớ: 12GB GDDR6 -\r\nGiao diện bộ nhớ: 192 bit -\r\nXung nhịp GPU: Boost Clock: 1807 MHz -\r\nTốc độ bộ nhớ: 15 Gbps -\r\nCổng kết nối: 1 x HDMI 2.1, 3 x DisplayPort 1.4a -\r\nNguồn đề xuất: 550W -\r\nCổng cấp nguồn: 1 x 8 pin -\r\nKích thước: 235 x 124 x 42 mm -\r\nTDP: 170W -\r\nHỗ trợ DirectX: 12 API -\r\nHỗ trợ OpenGL: 4.6 -\r\nSố màn hình hỗ trợ tối đa: 4 -\r\nTính năng đặc biệt: Hỗ trợ Ray Tracing và DLSS -\r\nHệ thống làm mát: Hai quạt TORX Fan 3.0 -\r\nPhần mềm hỗ trợ: MSI Dragon Center -\r\nTrọng lượng: 675 g -\r\nKích thước đóng gói: 235 x 124 x 42 mm -\r\nTrọng lượng đóng gói: 1030 g -\r\nHỗ trợ HDCP: Có -\r\nHỗ trợ HDMI 2.1: Có -\r\nHỗ trợ 4K: Có -\r\nHỗ trợ 8K: Có -\r\nHỗ trợ VR: Có -\r\nHỗ trợ NVIDIA G SYNC: Có -\r\nHỗ trợ NVIDIA Ansel: Có -\r\nHỗ trợ NVIDIA FreeStyle: Có -\r\nHỗ trợ NVIDIA Highlights: Có -\r\nHỗ trợ NVIDIA ShadowPlay: Có -\r\nHỗ trợ NVIDIA GameStream: Có -\r\nHỗ trợ NVIDIA GeForce Experience: Có -\r\nHỗ trợ NVIDIA Reflex: Có -\r\nHỗ trợ NVIDIA Broadcast: Có -\r\nHỗ trợ NVIDIA DLSS: Có -\r\nHỗ trợ NVIDIA RTX Voice: Có -\r\nHỗ trợ NVIDIA RTX Broadcast Engine: Có -\r\nHỗ trợ NVIDIA Omniverse: Có -\r\nHỗ trợ NVIDIA Studio: Có -\r\nHỗ trợ NVIDIA Reflex Latency Analyzer: Có -\r\nHỗ trợ NVIDIA DLSS Super Resolution: Có -\r\nHỗ trợ NVIDIA DLSS Frame Generation: Có -\r\nHỗ trợ NVIDIA DLSS Video Super Resolution: Có -\r\nHỗ trợ NVIDIA DLSS 3: Có -\r\nHỗ trợ NVIDIA DLSS 2: Có -\r\nHỗ trợ NVIDIA DLSS 1: Có -\r\nHỗ trợ NVIDIA DLSS AI Acceleration: Có -\r\nHỗ trợ NVIDIA DLSS AI Super Resolution: Có -\r\nHỗ trợ NVIDIA DLSS AI Frame Generation: Có -\r\nHỗ trợ NVIDIA DLSS AI Video Super Resolution: Có -\r\nHỗ trợ NVIDIA DLSS AI 3: Có -\r\nHỗ trợ NVIDIA DLSS AI 2: Có -\r\nHỗ trợ NVIDIA DLSS AI 1: Có -\r\nHỗ trợ NVIDIA DLSS AI Acceleration 3: Có -\r\nHỗ trợ NVIDIA DLSS AI Acceleration 2: Có -\r\nHỗ trợ NVIDIA DLSS AI Acceleration 1: Có -\r\nHỗ trợ NVIDIA DLSS AI Super Resolution 3: Có -\r\nHỗ trợ NVIDIA DLSS AI Super Resolution 2: Có -\r\nHỗ trợ NVIDIA DLSS AI Super Resolution 1: Có -\r\nHỗ trợ NVIDIA DLSS AI Frame Generation 3: Có -\r\nHỗ trợ NVIDIA DLSS AI Frame Generation 2: Có -\r\nHỗ trợ NVIDIA DLSS AI Frame Generation 1: Có -\r\nHỗ trợ NVIDIA DLSS AI Video Super Resolution 3: Có \r\n'),
('VGA09', 'VGA', 'VGA ASUS DUAL BLACK/WHITE- RTX4060 8G-DDR6', 'NVD', 8360000, 'VGA ASUS DUAL BLACK/WHITE - RTX 4060 8GB GDDR6 là một card đồ họa thuộc dòng NVIDIA GeForce RTX 4060, với 8GB GDDR6 và thiết kế Dual (2 quạt) giúp làm mát hiệu quả. Card này hỗ trợ Ray Tracing và DLSS 3.0, giúp cải thiện hiệu suất và chất lượng hình ảnh trong các tựa game và ứng dụng đòi hỏi đồ họa cao.', 0, 'uploads/vga-ASUS_DUAL_BLACK-WHITE-_RTX4060_8G-DDR6.jpg', 2023, '2025-01-15', 101, -6, ' GPU: NVIDIA GeForce RTX™ 4060 -\r\nCUDA Cores: 3072 -\r\nBộ nhớ: 8GB GDDR6 -\r\nGiao diện bộ nhớ: 128_bit -\r\nTốc độ bộ nhớ: 17 Gbps -\r\nXung nhịp GPU: -\r\nChế độ OC: 2535 MHz -\r\nChế độ mặc định: 2505 MHz (Boost) -\r\nCổng kết nối: 1 x HDMI 2.1a, 3 x DisplayPort 1.4a -\r\nHỗ trợ HDCP: Phiên bản 2.3 -\r\nHỗ trợ tối đa màn hình: 4 -\r\nKích thước: 202.2 x 120.3 x 40.1 mm -\r\nCông suất đề xuất nguồn: 550W -\r\nCổng cấp nguồn: 1 x 8_pin -\r\nThiết kế khe cắm: 2.5_slot '),
('VGA10', 'VGA', 'VGA GIGABYTE RTX3050 8G', 'NVD', 5775000, 'VGA GIGABYTE RTX 3050 8GB GDDR6 là card đồ họa thuộc dòng NVIDIA GeForce RTX 3050, trang bị 8GB GDDR6 giúp xử lý mượt mà các game và tác vụ đồ họa. Với khả năng hỗ trợ Ray Tracing và DLSS, RTX 3050 mang đến hiệu suất đồ họa mạnh mẽ cho các trò chơi AAA và các ứng dụng sáng tạo.', 0, 'uploads/vga-GIGABYTE_RTX3050_8G.jpg', 2022, '2025-01-15', 101, -6, ' GPU: NVIDIA GeForce RTX™ 3050 -\r\nCUDA Cores: 2560 -\r\nBộ nhớ: 8GB GDDR6 -\r\nGiao diện bộ nhớ: 128_bit -\r\nTốc độ bộ nhớ: 14 Gbps -\r\nXung nhịp GPU: Chế độ OC: 1792 MHz, Chế độ mặc định: 1777 MHz -\r\nCổng kết nối: 2 x DisplayPort 1.4a, 2 x HDMI 2.1 -\r\nHỗ trợ tối đa màn hình: 4 -\r\nKích thước: 213 x 120 x 41 mm -\r\nCông suất đề xuất nguồn: 450W -\r\nCổng cấp nguồn: 1 x 8_pin -\r\nThiết kế khe cắm: 2.5_slot -\r\nCông nghệ làm mát: Tản nhiệt 3 quạt, Đèn LED RGB -\r\nCông nghệ sản xuất: Auto_Extreme Technology -\r\nTấm bảo vệ: Backplate bảo vệ -\r\nPhần mềm hỗ trợ: ASUS GPU Tweak III và GeForce Game Ready Driver & Studio Driver -\r\nHệ điều hành hỗ trợ: Windows 10 64_bit, Windows 11 64_bit');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_details`
--

CREATE TABLE `product_details` (
  `product_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `image_details` text CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product_details`
--

INSERT INTO `product_details` (`product_id`, `image_details`) VALUES
('MNC29', '../upload_details/MAIN-HUANANZHI-X99-TFQ-1.webp'),
('MNC29', '../upload_details/MAIN-HUANANZHI-X99-TFQ-2.webp'),
('MNC30', '../upload_details/MAIN X99-QD4-HUANANZHI-1.webp'),
('MNC30', '../upload_details/MAIN-X99-QD4-HUANANZHI-2.webp'),
('MNC30', '../upload_details/MAIN-X99-QD4-HUANANZHI-3.webp'),
('MNC31', '../upload_details/MAIN-HUANANZHI-X99-F8D-Plus-1.webp'),
('MNC31', '../upload_details/MAIN-HUANANZHI-X99-F8D-Plus-2.webp'),
('MNC31', '../upload_details/MAIN-HUANANZHI-X99-F8D-Plus-3.webp'),
('MNC33', '../upload_details/MAIN-HUANANZHI-X99-T8D-doi-DDR3-1.jpg'),
('MNC33', '../upload_details/MAIN-HUANANZHI-X99-T8D-doi-DDR3-2.jpg'),
('CPU26', '../upload_details/xeon-E5-2680-v4-3-30-GHz-14-nhan-28-luong-box.jpg'),
('CPU27', '../upload_details/xeon-E5-2696-v3-3-6-GHz-22-nhan-44-luong.png'),
('CPU29', '../upload_details/xeon-E5-2686-v4-3-0-GHz-18-nhan-36-luong.jpg'),
('CPU28', '../upload_details/xeon-E5-2696-v4-3-6GHz-22-nhan-44-luong.webp'),
('RAM14', '../upload_details/RAM-ECC-DDR4-32GB2133-1.webp'),
('RAM14', '../upload_details/RAM-ECC-DDR4-32GB2133-2.jpg'),
('RAM15', '../upload_details/RAM-ECC-DDR4-32GB2400-1.png'),
('RAM15', '../upload_details/RAM-ECC-DDR4-32GB2400-2.jpg'),
('RAM16', '../upload_details/RAM-ECC-DDR3-32GB1600-1.jpg'),
('RAM16', '../upload_details/RAM-ECC-DDR3-32GB1600-2.jpg'),
('VGA01', '../upload_details/VGA-WINMAX-GTX-1060-3G-DDR5-1.jpg'),
('VGA01', '../upload_details/VGA-WINMAX-GTX-1060-3G-DDR5-2.webp'),
('VGA02', '../upload_details/VGA-1050TI-4G-1.jpg'),
('VGA02', '../upload_details/VGA-1050TI-4G-2.jpg'),
('VGA03', '../upload_details/VGA-GT730-2GDDR5-1.jpg'),
('VGA03', '../upload_details/VGA-GT730-2GDDR5-2.jpg'),
('VGA04', '../upload_details/VGA-WINMAX-RX580-8G-D5-1.webp'),
('VGA05', '../upload_details/VGA-MSI-Vetus-GTX1650-4G-XS-OC-DDR6-1.webp'),
('VGA05', '../upload_details/VGA-MSI-Ventus-GTX1650-4G-XS-OC-DDR6-3.jpg'),
('VGA06', '../upload_details/VGA-Colorful-Gigabyte-Asus-MSI-GTX-1660S-SUPER-6GB192BitD6-1.jpg'),
('VGA06', '../upload_details/VGA-Colorful-Gigabyte-Asus-MSI-GTX-1660S-SUPER-6GB192BitD6-2.webp'),
('VGA07', '../upload_details/VGA-COLOFUL-MSI-ASUS-RTX-3050-6G-DDR6-1.webp'),
('VGA07', '../upload_details/VGA-COLOFUL-MSI-ASUS-RTX-3050-6G-DDR6-2.jpg'),
('VGA07', '../upload_details/VGA-COLOFUL-MSI-ASUS-RTX-3050-6G-DDR6-3.jpg'),
('VGA08', '../upload_details/VGA-MSI-3060-12G-VETUS-2FAN-1.webp'),
('VGA08', '../upload_details/VGA-MSI-3060-12G-VETUS-2FAN-2.jpg'),
('VGA08', '../upload_details/VGA-MSI-3060-12G-VETUS-2FAN-3.jpg'),
('VGA09', '../upload_details/VGA-ASUS-DUAL-BLACK-WHITE-RTX4060-8G-DDR6-1.webp'),
('VGA09', '../upload_details/VGA-ASUS-DUAL-BLACK-WHITE-RTX4060-8G-DDR6-2.webp'),
('VGA09', '../upload_details/VGA-ASUS-DUAL-BLACK-WHITE-RTX4060-8G-DDR6-3.webp'),
('VGA10', '../upload_details/VGA-GIGABYTER-RTX3050-8G-1.jpg'),
('VGA10', '../upload_details/VGA-GIGABYTER-RTX3050-8G-2.jpg'),
('VGA10', '../upload_details/VGA-GIGABYTER-RTX3050-8G-3.jpg'),
('COL01', '../upload_details/fan-cpu-boc-may-xin-1.jpeg'),
('COL01', '../upload_details/fan-cpu-boc-may-xin-2.jpg'),
('COL02', '../upload_details/fan-box-loi-dong-SK1700-1.webp'),
('COL02', '../upload_details/fan-box-loi-dong-SK1700-2.webp'),
('COL03', '../upload_details/FAN-CPU-HR-1200-1.jpg'),
('COL03', '../upload_details/FAN-CPU-HR-1200-2.jpg'),
('COL04', '../upload_details/FAN-CPU-T400i-1.jpg'),
('COL04', '../upload_details/FAN-CPU-T400i-2.jpg'),
('COL05', '../upload_details/FAN-CPU-V620-PRO-6-ong-dong-1.jpg'),
('COL05', '../upload_details/FAN-CPU-V620-PRO-6-ong-dong-2.jpg'),
('COL06', '../upload_details/tan-nuoc-THERMALRIGHT-AE-V3-240-ARGB-black- white-1.png'),
('COL06', '../upload_details/tan-nuoc-THERMALRIGHT-AE-V3-240-ARGB-black- white-2.webp'),
('COL06', '../upload_details/tan-nuoc-THERMALRIGHT-AE-V3-240-ARGB-black- white-3.webp'),
('COL06', '../upload_details/tan-nuoc-THERMALRIGHT-AE-V3-240-ARGB-black- white-4.jpeg'),
('COL07', '../upload_details/tan-nuoc-THERMALRING-360-ARGB-white- black-1.webp'),
('COL07', '../upload_details/tan-nuoc-THERMALRING-360-ARGB-white- black-2.webp'),
('COL07', '../upload_details/tan-nuoc-THERMALRING-360-ARGB-white- black-3.jpg'),
('COL07', '../upload_details/tan-nuoc-THERMALRING-360-ARGB-white- black-4.webp'),
('COL08', '../upload_details/tan-nuoc-THERMALRIGHT-Frozen-Warframe-240-black-1.webp'),
('COL08', '../upload_details/tan-nuoc-THERMALRIGHT-Frozen-Warframe-240-black-2.webp'),
('COL09', '../upload_details/FAN-REDMOON-F3-black-white-1.png'),
('COL09', '../upload_details/FAN-REDMOON-F3-black-white-2.webp'),
('COL10', '../upload_details/FAN-Led-LC-30-ARGB-Mirro-HaLo-Pro-black-white-1.jpg'),
('COL10', '../upload_details/FAN-Led-LC-30-ARGB-Mirro-HaLo-Pro-black-white-2.jpg'),
('COL11', '../upload_details/fan-led-co-hub-1.png'),
('COL11', '../upload_details/fan-led-co-hub-2.jpg'),
('COL12', '../upload_details/FAN-LED-DM1-co-HUB-ARGB-1.webp'),
('COL12', '../upload_details/FAN-LED-DM1-co-HUB-ARGB-2.jpg'),
('ITT01', '../upload_details/hub-thuong-1.webp'),
('ITT01', '../upload_details/hub-thuong-2.jpg'),
('ITT02', '../upload_details/HUB-ARGB-1.jpg'),
('ITT02', '../upload_details/HUB-ARGB-2.jpg'),
('PSU16', '../upload_details/day-led-nguon-1.webp'),
('PSU16', '../upload_details/day-led-nguon-2.webp'),
('COL13', '../upload_details/fan-F6-1.webp'),
('COL13', '../upload_details/fan-F6-2.png'),
('COL14', '../upload_details/tan-khi-black-THERMALRIGHT-PA-120SE-ARGB-6-ong-2-FAN-1.webp'),
('COL14', '../upload_details/tan-khi-black-THERMALRIGHT-PA-120SE-ARGB-6-ong-2-FAN-2.jpg'),
('COL14', '../upload_details/tan-khi-black-THERMALRIGHT-PA-120SE-ARGB-6-ong-2-FAN-3.webp'),
('ITT03', '../upload_details/WIFI-TP-LINK-Archer-C50-4-rau-2-bang-tan-1.jpg'),
('ITT03', '../upload_details/WIFI-TP-LINK-Archer-C50-4-rau-2-bang-tan-2.PNG'),
('ITT03', '../upload_details/WIFI-TP-LINK-Archer-C50-4-rau-2-bang-tan-3.jpg'),
('ITT04', '../upload_details/WIFI-TP-LINK-WR841N-300MB-2-4GHZ-1.jpg'),
('ITT04', '../upload_details/WIFI-TP-LINK-WR841N-300MB-2-4GHZ-2.jpg'),
('ITT04', '../upload_details/WIFI-TP-LINK-WR841N-300MB-2-4GHZ-3.jpg'),
('ITT04', '../upload_details/WIFI-TP-LINK-WR841N-300MB-2-4GHZ-4.jpg'),
('ITT05', '../upload_details/wifi_tp_link_tl_wr840n_wifi_300mbps_anh-1.jpg'),
('ITT05', '../upload_details/wifi_tp_link_tl_wr840n_wifi_300mbps_anh-2.jpg'),
('ITT05', '../upload_details/wifi_tp_link_tl_wr840n_wifi_300mbps_anh-3.webp'),
('ITT06', '../upload_details/WIFI-TP-LINK-WR820N-2-4HZ-1.webp'),
('ITT06', '../upload_details/WIFI-TP-LINK-WR820N-2-4HZ-2.webp'),
('ITT06', '../upload_details/WIFI-TP-LINK-WR820N-2-4HZ-3.webp'),
('ITT07', '../upload_details/Switch-TP-Link-5Port-LAN-100MB-1.jpg'),
('ITT07', '../upload_details/Switch-TP-Link-5Port-LAN-100MB-2.jpg'),
('ITT07', '../upload_details/Switch-TP-Link-5Port-LAN-100MB-3.jpg'),
('ITT07', '../upload_details/Switch-TP-Link-5Port-LAN-100MB-4.jpg'),
('ITT08', '../upload_details/SWITCH-TP-LINK-5PORT-GIGA-LAN-100-1000MB-1.jpg'),
('ITT08', '../upload_details/SWITCH-TP-LINK-5PORT-GIGA-LAN-100-1000MB-2.jpg'),
('ITT08', '../upload_details/SWITCH-TP-LINK-5PORT-GIGA-LAN-100-1000MB-3.jpg'),
('ITT08', '../upload_details/SWITCH-TP-LINK-5PORT-GIGA-LAN-100-1000MB-4.jpg'),
('ITT09', '../upload_details/SWITCH-TP-LINK-8PORT-LAN-100MB-1.jpg'),
('ITT09', '../upload_details/SWITCH-TP-LINK-8PORT-LAN-100MB-2.jpg'),
('ITT10', '../upload_details/SWITCH-TPLINK-8Port-GIGA-LAN-1001000MB-1.jpg'),
('ITT10', '../upload_details/SWITCH-TPLINK-8Port-GIGA-LAN-1001000MB-2.jpg'),
('ITT10', '../upload_details/SWITCH-TPLINK-8Port-GIGA-LAN-1001000MB-3.jpg'),
('ITT10', '../upload_details/SWITCH-TPLINK-8Port-GIGA-LAN-1001000MB-4.jpg'),
('ITT11', '../upload_details/SWITCH-TP-LINK-16PORT-LAN-100MB-1.jpg'),
('ITT11', '../upload_details/SWITCH-TP-LINK-16PORT-LAN-100MB-2.jpg'),
('ITT11', '../upload_details/SWITCH-TP-LINK-16PORT-LAN-100MB-3.jpg'),
('ITT11', '../upload_details/SWITCH-TP-LINK-16PORT-LAN-100MB-4.jpg'),
('ITT12', '../upload_details/SWITCH-TP-LINK-16PORT-GIGA-LAN-1.jpg'),
('ITT12', '../upload_details/SWITCH-TP-LINK-16PORT-GIGA-LAN-2.jpg'),
('ITT12', '../upload_details/SWITCH-TP-LINK-16PORT-GIGA-LAN-3.jpg'),
('ITT12', '../upload_details/SWITCH-TP-LINK-16PORT-GIGA-LAN-4.jpg'),
('ITT13', '../upload_details/SWITCH-TP-LINK-24PORT-LAN-100MB-1.jpg'),
('ITT13', '../upload_details/SWITCH-TP-LINK-24PORT-LAN-100MB-2.jpg'),
('ITT13', '../upload_details/SWITCH-TP-LINK-24PORT-LAN-100MB-3.jpg'),
('ITT14', '../upload_details/Switch-TPLink-24PORT-GIGA-LAN-1001000Mbs-1.jpg'),
('ITT14', '../upload_details/Switch-TPLink-24PORT-GIGA-LAN-1001000Mbs-2.jpg'),
('ITT14', '../upload_details/Switch-TPLink-24PORT-GIGA-LAN-1001000Mbs-3.jpg'),
('ITT15', '../upload_details/THU-WIFI-TPLINK-WN722N-USB-150Mb-1.jpg'),
('ITT15', '../upload_details/THU-WIFI-TPLINK-WN722N-USB-150Mb-2.jpg'),
('ITT15', '../upload_details/THU-WIFI-TPLINK-WN722N-USB-150Mb-3.jpg'),
('ITT15', '../upload_details/THU-WIFI-TPLINK-WN722N-USB-150Mb-4.jpg'),
('ITT15', '../upload_details/THU-WIFI-TPLINK-WN722N-USB-150Mb-5.jpg'),
('ITT16', '../upload_details/WIFI-TPlink-AC600-USB-400Mb-5GHz-1.jpg'),
('ITT16', '../upload_details/WIFI-TPlink-AC600-USB-400Mb-5GHz-2.jpg'),
('ITT16', '../upload_details/WIFI-TPlink-AC600-USB-400Mb-5GHz-3.jpg'),
('ITT16', '../upload_details/WIFI-TPlink-AC600-USB-400Mb-5GHz-4.jpg'),
('ITT16', '../upload_details/WIFI-TPlink-AC600-USB-400Mb-5GHz-5.jpg'),
('ITT17', '../upload_details/WIFI-TP-LINK-WN725N-USB-150MB-1.jpg'),
('ITT17', '../upload_details/WIFI-TP-LINK-WN725N-USB-150MB-2.jpg'),
('ITT17', '../upload_details/WIFI-TP-LINK-WN725N-USB-150MB-3.jpg'),
('ITT17', '../upload_details/WIFI-TP-LINK-WN725N-USB-150MB-4.jpg'),
('ITT18', '../upload_details/WIFI-TPLINK-WN881ND-PCI-300Mb-2-rau-1.jpg'),
('ITT18', '../upload_details/WIFI-TPLINK-WN881ND-PCI-300Mb-2-rau-2.jpg'),
('ITT18', '../upload_details/WIFI-TPLINK-WN881ND-PCI-300Mb-2-rau-3.jpg'),
('ITT19', '../upload_details/WIFI-TPLink-WN781ND-PCI-150Mp-1-rau-1.jpg'),
('ITT19', '../upload_details/WIFI-TPLink-WN781ND-PCI-150Mp-1-rau-2.jpg'),
('ITT19', '../upload_details/WIFI-TPLink-WN781ND-PCI-150Mp-1-rau-3.jpg'),
('ITT20', '../upload_details/WIFI-TENDA-N301-1.jpg'),
('ITT20', '../upload_details/WIFI-TENDA-N301-2.jpg'),
('ITT21', '../upload_details/USB-Wifi-150MBs-1.jpg'),
('ITT21', '../upload_details/USB-Wifi-150MBs-2.jpg'),
('ITT21', '../upload_details/USB-Wifi-150MBs-3.jpg'),
('ITT21', '../upload_details/USB-Wifi-150MBs-4.jpg'),
('ITT21', '../upload_details/USB-Wifi-150MBs-5.jpg'),
('ITT21', '../upload_details/USB-Wifi-150MBs-6.jpg'),
('ITT21', '../upload_details/USB-Wifi-150MBs-7.jpg'),
('ITT21', '../upload_details/USB-Wifi-150MBs-8.jpg'),
('ITT22', '../upload_details/wifi-homa-neptune-2bangtan-2-4Ghz-5Ghz-1.png'),
('ITT22', '../upload_details/wifi-homa-neptune-2bangtan-2-4Ghz-5Ghz-2.png'),
('ITT23', '../upload_details/CAT-6-IT-LINK-loi-0-5-nhom-ma-dong-1.jpg'),
('ITT24', '../upload_details/CAT-6E-LB-LINK-loi-dong-0-5mm.jpg'),
('ITT25', '../upload_details/hat-mang-loi-dong-1.jpg'),
('ITT25', '../upload_details/hat-mang-loi-dong-2.jpg'),
('ITT26', '../upload_details/BOSI-loai-1-1.jpg'),
('ITT26', '../upload_details/BOSI-loai-1-2.jpg'),
('KEY01', '../upload_details/key-Newmen-M007-1.jpg'),
('KEY01', '../upload_details/key-Newmen-M007-2.jpg'),
('MOU01', '../upload_details/mouse-Newmen-M005-1.jpg'),
('MOU01', '../upload_details/mouse-Newmen-M005-2.png'),
('KEY02', '../upload_details/key-Fuhlen-L411-1.webp'),
('KEY02', '../upload_details/key-Fuhlen-L411-2.webp'),
('MOU02', '../upload_details/mouse-Fulen-L102-1.jpg'),
('MOU02', '../upload_details/mouse-Fulen-L102-2.webp'),
('MOU03', '../upload_details/mouse-wireless-HP-200-1.webp'),
('MOU03', '../upload_details/mouse-wireless-HP-200-2.jpg'),
('MOU04', '../upload_details/mouse-EDRA-EM601-1.jpg'),
('MOU04', '../upload_details/mouse-EDRA-EM601-2.jpg'),
('KEY03', '../upload_details/key-EDRA-EK501-1.jpg'),
('KEY03', '../upload_details/key-EDRA-EK501-2.webp'),
('PHO01', '../upload_details/headphone-7-1-usb-1.jpg'),
('PHO01', '../upload_details/headphone-7-1-usb-2.jpg'),
('PHO02', '../upload_details/headphone-7-1-usb-gaming-1.png'),
('PHO02', '../upload_details/headphone-7-1-usb-gaming-2.webp'),
('SPK01', '../upload_details/loa-go-M1017-1.jpg'),
('SPK01', '../upload_details/loa-go-M1017-2.jpg'),
('SPK02', '../upload_details/LOA-Soundmax-A700-2-1-1.jpg'),
('SPK02', '../upload_details/LOA-Soundmax-A700-2-1-2.jpg'),
('SPK03', '../upload_details/LOA-FENDA-A180-2-1-1.png'),
('SPK03', '../upload_details/LOA-FENDA-A180-2-1-2.jpg'),
('SPK04', '../upload_details/LOA-LAPOP-A55-2-0-1.avif'),
('SPK04', '../upload_details/LOA-LAPOP-A55-2-0-2.avif'),
('SPK05', '../upload_details/LOA-LAPOP-A58-2-0-1.jpg'),
('SPK05', '../upload_details/LOA-LAPOP-A58-2-0-2.jpg'),
('SPK06', '../upload_details/LOA-Microlab-M105-2-1-1.jpg'),
('SPK06', '../upload_details/LOA-Microlab-M105-2-1-2.webp'),
('SPK07', '../upload_details/LOA-Microlab-M900-4-1-1.webp'),
('SPK07', '../upload_details/LOA-Microlab-M900-4-1-2.webp'),
('SPK08', '../upload_details/LOA-MICROLAP-M108-1.jpg'),
('SPK08', '../upload_details/LOA-MICROLAP-M108-2.jpg'),
('SPK09', '../upload_details/LOA-MINI-2-0-E-1053-E-1046-1.jpg'),
('SPK09', '../upload_details/LOA-MINI-2-0-E-1053-E-1046-2.jpg'),
('PHK01', '../upload_details/AMR-F80-1.webp'),
('PHK01', '../upload_details/AMR-F80-2.jpg'),
('PHK01', '../upload_details/AMR-F80-3.jpg'),
('PHK02', '../upload_details/AMR-F160-1.webp'),
('PHK02', '../upload_details/AMR-F160-2.webp'),
('PHK02', '../upload_details/AMR-F160-3.jpg'),
('PHK03', '../upload_details/table-K-Z-1.jpg'),
('PHK03', '../upload_details/table-K-Z-2.png'),
('PHK04', '../upload_details/ban-hoc-sinh-3-cap-1.jpg'),
('PHK04', '../upload_details/ban-hoc-sinh-3-cap-2.webp'),
('PHK05', '../upload_details/ban-hoc-sinh-2-cap-1.jpg'),
('PHK05', '../upload_details/ban-hoc-sinh-2-cap-2.jpg'),
('PHK06', '../upload_details/Akali-black-AK01-chan-banh-xe-1.webp'),
('PHK06', '../upload_details/Akali-black-AK01-chan-banh-xe-2.webp'),
('PHK07', '../upload_details/Champion-red-black-CP01-chan-quy-1.webp'),
('PHK07', '../upload_details/Champion-red-black-CP01-chan-quy-2.jpg'),
('PHK08', '../upload_details/sova-black-white-1.webp'),
('PHK08', '../upload_details/sova-black-white-2.webp'),
('PHK09', '../upload_details/E-DRA-EGC234-red-black-1.jpg'),
('PHK09', '../upload_details/E-DRA-EGC234-red-black-2.jpg'),
('PHK09', '../upload_details/E-DRA-EGC234-red-black-3.jpg'),
('PHK10', '../upload_details/E-DRA-EEC219-1.jpg'),
('PHK10', '../upload_details/E-DRA-EEC219-2.webp'),
('PHK11', '../upload_details/E-DRA-EGC200-black-1.jpg'),
('PHK11', '../upload_details/E-DRA-EGC200-black-2.webp'),
('PHK12', '../upload_details/E-DRA-EEC222-1.jpg'),
('PHK12', '../upload_details/E-DRA-EEC222-2.jpg'),
('PHK12', '../upload_details/E-DRA-EEC222-3.jpg'),
('PHK13', '../upload_details/pin-cmos-1.jpg'),
('PHK13', '../upload_details/pin-cmos-2.webp'),
('PHK14', '../upload_details/tab-20x30-1.jpg'),
('PHK14', '../upload_details/tab-20x30-2.jpg'),
('PHK15', '../upload_details/tab-30x70-30x80cm-1.jpg'),
('PHK15', '../upload_details/tab-30x70-30x80cm-2.jpg'),
('PHK16', '../upload_details/tab-30x35-1.jpg'),
('PHK16', '../upload_details/tab-30x35-2.jpg'),
('PHK17', '../upload_details/tab-30x70-fuhlen-1.jpg'),
('PHK18', '../upload_details/VGA-xanh-1.jpg'),
('PHK18', '../upload_details/VGA-xanh-2.jpg'),
('PHK19', '../upload_details/VGA-xanh-1.jpg'),
('PHK19', '../upload_details/VGA-xanh-2.jpg'),
('PHK20', '../upload_details/day-nguon-copper-1.jpg'),
('PHK20', '../upload_details/day-nguon-copper-2.webp'),
('PHK21', '../upload_details/HDMI-1.jpg'),
('PHK21', '../upload_details/HDMI-2.jpg'),
('PHK22', '../upload_details/HDMI-1.jpg'),
('PHK22', '../upload_details/HDMI-2.jpg'),
('PHK23', '../upload_details/HDMI-1.jpg'),
('PHK23', '../upload_details/HDMI-2.jpg'),
('PHK24', '../upload_details/HDMI-1.jpg'),
('PHK24', '../upload_details/HDMI-2.jpg'),
('PHK25', '../upload_details/HDMI-1.jpg'),
('PHK25', '../upload_details/HDMI-2.jpg'),
('PHK26', '../upload_details/HDMI-1.jpg'),
('PHK26', '../upload_details/HDMI-2.jpg'),
('MOR01', '../upload_details/LG_24MR400_IPS_1.webp'),
('MOR01', '../upload_details/LG_24MR400_IPS_2.webp'),
('MOR01', '../upload_details/LG_24MR400_IPS_3.webp'),
('MOR01', '../upload_details/LG_24MR400_IPS_4.webp'),
('MOR02', '../upload_details/LG_27GQ50F_VA _2.webp'),
('MOR02', '../upload_details/LG_27GQ50F_VA _3.webp'),
('MOR02', '../upload_details/LG_27GQ50F_VA _4.webp'),
('MOR02', '../upload_details/LG_27GQ50F_VA_1.webp'),
('MOR03', '../upload_details/LS24C310EAEXXV1.webp'),
('MOR03', '../upload_details/LS24C310EAEXXV2.png'),
('MOR03', '../upload_details/LS24C310EAEXXV3.webp'),
('MOR04', '../upload_details/DELL_ULTRASHA_U2424H _1.webp'),
('MOR04', '../upload_details/DELL_ULTRASHA_U2424H _2.webp'),
('MOR04', '../upload_details/DELL_ULTRASHA_U2424H _3.webp'),
('MOR06', '../upload_details/DUAN_V2218s _1.webp'),
('MOR06', '../upload_details/DUAN_V2218s _2.webp'),
('MOR06', '../upload_details/DUAN_V2218s _3.webp'),
('MOR06', '../upload_details/DUAN_V2218s_4.webp'),
('MOR09', '../upload_details/DUAN_DA272QP_2K_1.jpg'),
('MOR09', '../upload_details/DUAN_DA272QP_2K_3.jpg'),
('MOR10', '../upload_details/DUAN_IP278S_1.jpg'),
('MOR10', '../upload_details/DUAN_IP278S_2.jpg'),
('MOR10', '../upload_details/DUAN_IP278S_3.jpg'),
('MOR11', '../upload_details/ELSA_27Q7_IPS_1.jpg'),
('MOR11', '../upload_details/ELSA_27Q7_IPS_2.jpg'),
('MOR11', '../upload_details/ELSA_27Q7_IPS_3.jpg'),
('MOR11', '../upload_details/ELSA_27Q7_IPS_4.jpg'),
('MOR12', '../upload_details/DUAN_2409S_100HZ1.jpg'),
('MOR12', '../upload_details/DUAN_2409S_100HZ2.jpg'),
('MOR12', '../upload_details/DUAN_2409S_100HZ3.jpg'),
('MOR13', '../upload_details/IP2709s_DUAN_1.webp'),
('MOR13', '../upload_details/IP2709s_DUAN_2.jpg'),
('MOR13', '../upload_details/IP2709s_DUAN_3.jpg'),
('MOR14', '../upload_details/VSP_V2204H_1.webp'),
('MOR14', '../upload_details/VSP_V2204H_2.jpg'),
('MOR14', '../upload_details/VSP_V2204H_3.jpg'),
('MOR15', '../upload_details/VSP_V2204H_75Hz _1.webp'),
('MOR15', '../upload_details/VSP_V2204H_75Hz _2.jpg'),
('MOR16', '../upload_details/710__VSP_Monitor_IP2407S_1.jpg'),
('MOR16', '../upload_details/710__VSP_Monitor_IP2407S_2.jpg'),
('MOR16', '../upload_details/710__VSP_Monitor_IP2407S_3.jpg'),
('MOR17', '../upload_details/VSP_V2407S_IPS_1.jpg'),
('MOR17', '../upload_details/VSP_V2407S_IPS_2.webp'),
('MOR17', '../upload_details/VSP_V2407S_IPS_3.webp'),
('MOR17', '../upload_details/VSP_V2407S_IPS_4.webp'),
('MOR18', '../upload_details/VSP_27_IP2706SG_1.jpg'),
('MOR18', '../upload_details/VSP_27_IP2706SG_2.jpg'),
('MOR18', '../upload_details/VSP_27_IP2706SG_3.jpg'),
('MOR18', '../upload_details/VSP_27_IP2706SG_4.jpg'),
('MOR18', '../upload_details/VSP_27_IP2706SG_5.jpg'),
('MOR19', '../upload_details/VSP_IP2518S4_1.jpg'),
('MOR19', '../upload_details/VSP_IP2518S4_2.jpg'),
('MOR19', '../upload_details/VSP_IP2518S4_3.jpg'),
('MOR19', '../upload_details/VSP_IP2518S4_4.jpg'),
('MOR19', '../upload_details/VSP_IP2518S4_5.jpg'),
('MOR20', '../upload_details/IPS_75Hz_IP2704S_1.jpg'),
('MOR20', '../upload_details/IPS_75Hz_IP2704S_2.jpg'),
('MOR20', '../upload_details/IPS_75Hz_IP2704S_3.jpg'),
('MOR20', '../upload_details/IPS_75Hz_IP2704S_4.jpg'),
('MOR21', '../upload_details/VSP_24  _IP2407S_1.jpg'),
('MOR21', '../upload_details/VSP_24  _IP2407S_2.jpg'),
('MOR21', '../upload_details/VSP_24  _IP2407S_3.jpg'),
('MOR21', '../upload_details/VSP_24  _IP2407S_4.jpg'),
('MOR22', '../upload_details/VSP_VA2718G _1.jpg'),
('MOR22', '../upload_details/VSP_VA2718G _2.webp'),
('MOR22', '../upload_details/VSP_VA2718G _3.webp'),
('MOR22', '../upload_details/VSP_VA2718G _4.webp'),
('MOR23', '../upload_details/VSP_CM2710H_1.webp'),
('MOR23', '../upload_details/VSP_CM2710H_2.webp'),
('MOR23', '../upload_details/VSP_CM2710H_3.webp'),
('MOR23', '../upload_details/VSP_CM2710H_4.webp'),
('MOR23', '../upload_details/VSP_CM2710H_5.webp'),
('PSU05', '../upload_details/VSP_DELTA_550W1.jpg'),
('PSU05', '../upload_details/VSP_DELTA_550W2.jpg'),
('PSU05', '../upload_details/VSP_DELTA_550W3.jpg'),
('PSU05', '../upload_details/VSP_DELTA_550W4.jpg'),
('PSU06', '../upload_details/VSP_ELITE1.jpg'),
('PSU06', '../upload_details/VSP_ELITE2.jpg'),
('PSU06', '../upload_details/VSP_ELITE3.jpg'),
('PSU07', '../upload_details/COOLERMASTER1.jpg'),
('PSU07', '../upload_details/COOLERMASTER2.jpg'),
('PSU07', '../upload_details/COOLERMASTER3.webp'),
('PSU08', '../upload_details/VSP_Delt_700w1.jpg'),
('PSU08', '../upload_details/VSP_Delt_700w2.jpg'),
('PSU08', '../upload_details/VSP_Delt_700w3.jpg'),
('PSU09', '../upload_details/VSP_ELITE1_CAO1.jpg'),
('PSU09', '../upload_details/VSP_ELITE1_CAO2.jpg'),
('PSU10', '../upload_details/ACER_AC5501.webp'),
('PSU10', '../upload_details/ACER_AC5502.webp'),
('PSU10', '../upload_details/ACER_AC5503.webp'),
('PSU10', '../upload_details/ACER_AC5504.webp'),
('PSU10', '../upload_details/ACER_AC5505.jpg'),
('PSU11', '../upload_details/VXP1000W1.jpg'),
('PSU11', '../upload_details/VXP1000W2.jpg'),
('PSU11', '../upload_details/VXP1000W3.jpg'),
('PSU11', '../upload_details/VXP1000W4.jpg'),
('PSU11', '../upload_details/VXP1000W5.jpg'),
('PSU12', '../upload_details/AC550_80_PLU3.webp'),
('PSU12', '../upload_details/AC550_80_PLUS1.webp'),
('PSU12', '../upload_details/AC550_80_PLUS2.webp'),
('PSU12', '../upload_details/AC550_80_PLUS4.webp'),
('PSU13', '../upload_details/AC650_80_PLUS1.png'),
('PSU13', '../upload_details/AC650_80_PLUS2.png'),
('PSU13', '../upload_details/AC650_80_PLUS3.png'),
('PSU13', '../upload_details/AC650_80_PLUS4.png'),
('PSU14', '../upload_details/AC750_80_PLUS1.jpg'),
('PSU14', '../upload_details/AC750_80_PLUS2.jpg'),
('PSU14', '../upload_details/AC750_80_PLUS3.jpg'),
('PSU14', '../upload_details/AC750_80_PLUS4.jpg'),
('PSU15', '../upload_details/ACER_AC10001.jpg'),
('PSU15', '../upload_details/ACER_AC10002.jpg'),
('PSU15', '../upload_details/ACER_AC10003.jpg'),
('PSU15', '../upload_details/ACER_AC10004.jpg'),
('CAS01', '../upload_details/CaseCentaur1.jpg'),
('CAS01', '../upload_details/CaseCentaur2.jpg'),
('CAS01', '../upload_details/CaseCentaur3.jpg'),
('CAS07', '../upload_details/VSP_ES11.jpg'),
('CAS10', '../upload_details/mekaATX1.jpg'),
('CAS10', '../upload_details/mekaATX2.jpg'),
('CAS11', '../upload_details/VSP_V2_BLACK_1.jpg'),
('CAS11', '../upload_details/VSP_V2_BLACK_2.jpg'),
('CAS12', '../upload_details/x7black1.jpg'),
('CAS12', '../upload_details/x7black2.jpg'),
('CAS12', '../upload_details/x7black3.jpg'),
('CAS13', '../upload_details/vspx7white1.jpg'),
('CAS13', '../upload_details/vspx7white2.webp'),
('CAS13', '../upload_details/vspx7white3.webp'),
('CAS02', '../upload_details/VSP-Aquanaut-AX4 -ATX-white-1.jpg'),
('CAS02', '../upload_details/VSP-Aquanaut-AX4 -ATX-white-2.jpg'),
('CAS02', '../upload_details/VSP-Aquanaut-AX4 -ATX-white-3.jpg'),
('CAS03', '../upload_details/VSP-Aquanaut-AX4 -ATX-black-1.webp'),
('CAS03', '../upload_details/VSP-Aquanaut-AX4 -ATX-black-2.jpg'),
('CAS03', '../upload_details/VSP-Aquanaut-AX4 -ATX-black-3.jpg'),
('CAS03', '../upload_details/VSP-Aquanaut-AX4 -ATX-black-4.jpg'),
('CAS05', '../upload_details/VSP-X2-black-Mini-1.jpg'),
('CAS05', '../upload_details/VSP-X2-black-Mini-2.jpg'),
('CAS05', '../upload_details/VSP-X2-black-Mini-3.jpg'),
('CAS06', '../upload_details/VSP-X2-white-Mini-1.jpg'),
('CAS06', '../upload_details/VSP-X2-white-Mini-2.jpg'),
('CAS06', '../upload_details/VSP-X2-white-Mini-3.jpg'),
('CAS07', '../upload_details/VSP-ES1-1.jpg'),
('CAS07', '../upload_details/VSP-ES1-2.jpg'),
('CAS07', '../upload_details/VSP-ES1-3.jpg'),
('CAS08', '../upload_details/xstar-robot-1.jpg'),
('CAS08', '../upload_details/xstar-robot-2.png'),
('MOR05', '../upload_details/DUAN-IP25F180-IPS2-1.jpg'),
('MOR05', '../upload_details/DUAN-IP25F180-IPS2-2.jpg'),
('MOR05', '../upload_details/DUAN-IP25F180-IPS2-3.webp'),
('MOR07', '../upload_details/DUAN-24-DA-IP248S-IPS-75Hz-1.jpg'),
('MOR07', '../upload_details/DUAN-24-DA-IP248S-IPS-75Hz-2.jpg'),
('MOR07', '../upload_details/DUAN-24-DA-IP248S-IPS-75Hz-3.jpg'),
('MOR08', '../upload_details/DUAN-VG2709H-CONG-100HZ-black-1.webp'),
('MOR08', '../upload_details/DUAN-VG2709H-CONG-100HZ-black-2.webp'),
('MOR08', '../upload_details/DUAN-VG2709H-CONG-100HZ-black-3.jpg'),
('MOR10', '../upload_details/DUAN-IP278S-180Hz-1ms-black-1.webp'),
('MOR10', '../upload_details/DUAN-IP278S-180Hz-1ms-black-2.webp'),
('MOR10', '../upload_details/DUAN-IP278S-180Hz-1ms-black-3.jpg'),
('PSU01', '../upload_details/VSP-ATX650-210W-1.jpg'),
('PSU01', '../upload_details/VSP-ATX650-210W-2.jpg'),
('PSU02', '../upload_details/VSP-350W-DELTA-1.jpg'),
('PSU02', '../upload_details/VSP-350W-DELTA-2.jpg'),
('PSU02', '../upload_details/VSP-350W-DELTA-3.jpg'),
('PSU02', '../upload_details/VSP-350W-DELTA-4.jpg'),
('PSU03', '../upload_details/VSP-450W-DELTA-1.jpg'),
('PSU03', '../upload_details/VSP-450W-DELTA-2.jpg'),
('PSU03', '../upload_details/VSP-450W-DELTA-3.jpg'),
('PSU04', '../upload_details/CENTAUR-450W1.webp'),
('PSU04', '../upload_details/CENTAUR-450W2.webp'),
('MNC01', '../upload_details/Main-H61-samsung-1.webp'),
('MNC01', '../upload_details/Main-H61-samsung-2.webp'),
('MNC01', '../upload_details/Main-H61-samsung-3.webp'),
('MNC02', '../upload_details/Gigabyte-H81M-DS2-1.webp'),
('MNC02', '../upload_details/Gigabyte-H81M-DS2-2.webp'),
('MNC03', '../upload_details/main-asus-b85.jpg'),
('MNC04', '../upload_details/Main-H81-Asus-1.jpg'),
('MNC04', '../upload_details/Main-H81-Asus-2.jpg'),
('MNC04', '../upload_details/Main-H81-Asus-3.jpg'),
('MNC05', '../upload_details/Main-H81-Intel-1.jpg'),
('MNC05', '../upload_details/Main-H81-Intel-2.jpg'),
('MNC05', '../upload_details/Main-H81-Intel-3.jpg'),
('MNC06', '../upload_details/Main-H81-Patrion-1.jpg'),
('MNC06', '../upload_details/Main-H81-Patrion-2.jpg'),
('MNC07', '../upload_details/Main-H110-pegatron-full-cong-1.jpg'),
('MNC07', '../upload_details/Main-H110-pegatron-full-cong-2.jpg'),
('MNC08', '../upload_details/Main-H110-Asus-1.jpg'),
('MNC08', '../upload_details/Main-H110-Asus-2.jpg'),
('MNC08', '../upload_details/Main-H110-Asus-3.jpg'),
('MNC09', '../upload_details/MAIN-MSI-H310-HDMI-1.jpg'),
('MNC09', '../upload_details/MAIN-MSI-H310-HDMI-2.jpg'),
('MNC09', '../upload_details/MAIN-MSI-H310-HDMI-3.jpg'),
('MNC10', '../upload_details/Main-H310-sus-1.jpg'),
('MNC10', '../upload_details/Main-H310-sus-2.jpg'),
('MNC10', '../upload_details/Main-H310-sus-3.jpg'),
('MNC11', '../upload_details/Mian-H310-Giga-1.jpg'),
('MNC11', '../upload_details/Mian-H310-Giga-2.jpg'),
('MNC12', '../upload_details/MAIN-GIGABYTE-B365-M2-1.png'),
('MNC12', '../upload_details/MAIN-GIGABYTE-B365-M2-2.png'),
('MNC12', '../upload_details/MAIN-GIGABYTE-B365-M2-3.png'),
('MNC12', '../upload_details/MAIN-GIGABYTE-B365-M2-4.png'),
('MNC13', '../upload_details/Main-ASUS-B360-B365-1.jpg'),
('MNC13', '../upload_details/Main-ASUS-B360-B365-2.jpg'),
('MNC13', '../upload_details/Main-ASUS-B360-B365-3.jpg'),
('MNC14', '../upload_details/Z370-Gigabyte-1.png'),
('MNC14', '../upload_details/Z370-Gigabyte-2.png'),
('MNC14', '../upload_details/Z370-Gigabyte-3.png'),
('MNC15', '../upload_details/Main-Gigabyte-B760M-Gaming-Plus-1.jpg'),
('MNC15', '../upload_details/Main-Gigabyte-B760M-Gaming-Plus-2.jpg'),
('MNC15', '../upload_details/Main-Gigabyte-B760M-Gaming-Plus-3.jpg'),
('MNC16', '../upload_details/MAIN-ASUS-H510M-K -NVME-VGA-HDM-1.jpg'),
('MNC16', '../upload_details/MAIN-ASUS-H510M-K -NVME-VGA-HDM-2.jpg'),
('MNC16', '../upload_details/MAIN-ASUS-H510M-K -NVME-VGA-HDM-3.jpg'),
('MNC17', '../upload_details/MAIN-HUANANZHI-B760M-D4-B-1.jpg'),
('MNC17', '../upload_details/MAIN-HUANANZHI-B760M-D4-B-2.jpg'),
('MNC18', '../upload_details/MAIN-MSI-H510M-B-Pro-1.jpg'),
('MNC18', '../upload_details/MAIN-MSI-H510M-B-Pro-2.jpg'),
('MNC18', '../upload_details/MAIN-MSI-H510M-B-Pro-3.jpg'),
('MNC19', '../upload_details/main-giga-h510m-h-1.png'),
('MNC19', '../upload_details/main-giga-h510m-h-2.jpg'),
('MNC19', '../upload_details/main-giga-h510m-h-3.jpg'),
('MNC20', '../upload_details/MAIN-SSTC-H510M-HDV-2M2-1.jpg'),
('MNC20', '../upload_details/MAIN-SSTC-H510M-HDV-2M2-2.jpg'),
('MNC20', '../upload_details/MAIN-SSTC-H510M-HDV-2M2-3.jpg'),
('MNC21', '../upload_details/Main-Gigabyte-H610-M-H-1.png'),
('MNC21', '../upload_details/Main-Gigabyte-H610-M-H-2.png'),
('MNC21', '../upload_details/Main-Gigabyte-H610-M-H-3.png'),
('MNC21', '../upload_details/Main-Gigabyte-H610-M-H-4.png'),
('MNC22', '../upload_details/Main-MSI-H610M-E-PRO-1.jpg'),
('MNC22', '../upload_details/Main-MSI-H610M-E-PRO-2.png'),
('MNC22', '../upload_details/Main-MSI-H610M-E-PRO-3.jpg'),
('MNC23', '../upload_details/Main-ASUS-H610-M-K-D4-1.webp'),
('MNC23', '../upload_details/Main-ASUS-H610-M-K-D4-2.webp'),
('MNC23', '../upload_details/Main-ASUS-H610-M-K-D4-3.webp'),
('MNC23', '../upload_details/Main-ASUS-H610-M-K-D4-4.webp'),
('MNC23', '../upload_details/Main-ASUS-H610-M-K-D4-5.webp'),
('MNC23', '../upload_details/Main-ASUS-H610-M-K-D4-6.webp'),
('MNC24', '../upload_details/main-msi-pro-b760m-e-ddr4-1.png'),
('MNC24', '../upload_details/main-msi-pro-b760m-e-ddr4-2.jpg'),
('MNC24', '../upload_details/main-msi-pro-b760m-e-ddr4-3.jpg'),
('MNC25', '../upload_details/MAIN-ASUS-TUF-GAMING-B760M-E-D4-1.png'),
('MNC25', '../upload_details/MAIN-ASUS-TUF-GAMING-B760M-E-D4-2.png'),
('MNC25', '../upload_details/MAIN-ASUS-TUF-GAMING-B760M-E-D4-3.png'),
('MNC26', '../upload_details/MAIN-Z690M-AORUS-ELITE-D4-1.jpg'),
('MNC26', '../upload_details/MAIN-Z690M-AORUS-ELITE-D4-2.jpg'),
('MNC26', '../upload_details/MAIN-Z690M-AORUS-ELITE-D4-3.jpg'),
('MNC27', '../upload_details/MAIN-MOBO-B760M4-PLUS-DDR4-1.jpg'),
('MNC27', '../upload_details/MAIN-MOBO-B760M4-PLUS-DDR4-2.jpg'),
('MNC28', '../upload_details/MAIN-MOBO-H610M-V2-DDR4-1.jpg'),
('MNC28', '../upload_details/MAIN-MOBO-H610M-V2-DDR4-2.jpg'),
('CPU01', '../upload_details/CPU-G-32xx-1.jpg'),
('CPU02', '../upload_details/CPU-I3-4150-1.jpg'),
('CPU03', '../upload_details/CPU-I5-4XXX-1.jpg'),
('CPU04', '../upload_details/cpu-g-4400.jpg'),
('CPU05', '../upload_details/cpu-i3-6100.jpg'),
('CPU06', '../upload_details/cpu-i5-6500.png'),
('CPU07', '../upload_details/CPU-I3-8100-1.jpg'),
('CPU08', '../upload_details/cpu-i3-9100f.png'),
('CPU09', '../upload_details/cpu-i5-9400f.jpg'),
('CPU10', '../upload_details/cpu-i3-8400.jpg'),
('CPU10', '../upload_details/cpu-i3-8500.jpg'),
('CPU11', '../upload_details/CPU-I3-10100-Tray-1.jpg'),
('CPU12', '../upload_details/CPU-I3-10100f-box.png'),
('CPU13', '../upload_details/cpu-i3-10105f-tray.png'),
('CPU14', '../upload_details/Cpu-i3-10105-h510-1.jpg'),
('CPU14', '../upload_details/Cpu-i3-10105-h510-2.jpg'),
('CPU15', '../upload_details/CPU-I3-10105f-BOX.jpg'),
('CPU16', '../upload_details/cpu-i5-10400f.png'),
('CPU17', '../upload_details/cpu-i5-11400f-h510-gg.png'),
('CPU18', '../upload_details/cpu-i5-10400.png'),
('CPU19', '../upload_details/cpu-i5-11400-H510.jpg'),
('CPU20', '../upload_details/CPU-I3-12100-1.jpg'),
('CPU20', '../upload_details/CPU-I3-12100-2.jpg'),
('CPU21', '../upload_details/cpu-i3-12100f.png'),
('CPU22', '../upload_details/CPU-i5-12400-1.jpg'),
('CPU23', '../upload_details/CPU-i5-12400F-1.jpg'),
('CPU24', '../upload_details/CPU-I7-12700KF-1.jpg'),
('CPU25', '../upload_details/CPU-12700K-1.jpg'),
('RAM01', '../upload_details/Ram-DDR3-4G1600-dong-bo-1.jpg'),
('RAM02', '../upload_details/ram-ddr4-4gb-2400.png'),
('RAM03', '../upload_details/RAM-8GB-1600.jpg'),
('RAM04', '../upload_details/RAM-KingSpec-8G-2666-3200.jpg'),
('RAM05', '../upload_details/RAM-KingSpec-8G-2666-3200.jpg'),
('RAM06', '../upload_details/RAM-KingBank-8G-1600-2666-3200.jpg'),
('RAM07', '../upload_details/RAM-KingBank-8G-1600-2666-3200.jpg'),
('RAM08', '../upload_details/ram-adata-led-ddr4-16g-3200.png'),
('RAM09', '../upload_details/RAM-Team-elta-LED-DDR4-8G3200.jpg'),
('RAM10', '../upload_details/RAM-Team-Vulcan-Z-DDR4-16g3200-red.jpg'),
('RAM11', '../upload_details/RAM-Billion-Reservoir-BR-16G3200-DDR4-aluminium.jpg'),
('RAM12', '../upload_details/RAM-Billion-Reservoir-BR-8GB16G3200-DDR4-white.jpg'),
('RAM13', '../upload_details/RAM-SSTC-16G3200-DDR4-1.jpg'),
('RAM13', '../upload_details/RAM-SSTC-16G3200-DDR4-2.jpg'),
('SSD01', '../upload_details/SSD-2-5-SamSung-120G-128G-1.jpg'),
('SSD01', '../upload_details/SSD-2-5-SamSung-120G-128G-2.jpg'),
('SSD01', '../upload_details/SSD-2-5-SamSung-120G-128G-3.jpg'),
('SSD02', '../upload_details/SSD-2-5-SamSung-250G-1.jpg'),
('SSD02', '../upload_details/SSD-2-5-SamSung-250G-2.jpg'),
('SSD03', '../upload_details/SSD-256GB-COLORFUL-1.jpg'),
('SSD03', '../upload_details/SSD-256GB-COLORFUL-2.jpg'),
('SSD04', '../upload_details/SSD-SSTC-128Gb-sata-3-1.jpg'),
('SSD04', '../upload_details/SSD-SSTC-256Gb-sata-3-1.jpg'),
('SSD04', '../upload_details/SSD-SSTC-256Gb-sata-3-2.jpg'),
('SSD04', '../upload_details/SSD-SSTC-512Gb-sata-3-1.jpg'),
('SSD05', '../upload_details/NVME-BR-256GB-1.jpg'),
('SSD05', '../upload_details/NVME-BR-256GB-2.jpg'),
('SSD05', '../upload_details/NVME-BR-256GB-3.jpg'),
('SSD06', '../upload_details/NVME-M2-KINGSTON-1TB-2280-1.jpg'),
('SSD06', '../upload_details/NVME-M2-KINGSTON-1TB-2280-2.jpg'),
('SSD07', '../upload_details/SSD-SKhynix-PC801-NVMe-M-2-2280-Gen4x4.jpg'),
('SSD08', '../upload_details/NVME-SSTC-256Gb-Gen3X4-1.jpg'),
('SSD08', '../upload_details/NVME-SSTC-512Gb-Gen3X4-1.jpg'),
('HDD01', '../upload_details/hdd-500g.png'),
('HDD02', '../upload_details/hdd-1t.png'),
('HDD03', '../upload_details/hdd-2t.png'),
('HDD04', '../upload_details/hdd-3t.png'),
('HDD05', '../upload_details/hdd-6t-wd-purple.png'),
('HDD06', '../upload_details/hdd-8t.png'),
('HDD07', '../upload_details/hdd-10t.png'),
('MNC32', '../upload_details/MAIN-HUANANZHI-X99-F8D-doi-DDR4-1.jpg'),
('MNC32', '../upload_details/MAIN-HUANANZHI-X99-F8D-doi-DDR4-2.jpg'),
('MNC32', '../upload_details/MAIN-HUANANZHI-X99-F8D-doi-DDR4-3.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `transaction`
--

CREATE TABLE `transaction` (
  `transaction_id` int(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `user_id` int(255) NOT NULL DEFAULT 0,
  `user_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_email` varchar(128) NOT NULL,
  `user_phone` varchar(20) NOT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `payment` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `message` varchar(255) NOT NULL,
  `date` datetime NOT NULL DEFAULT '1900-01-01 00:00:00',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `product_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Đang đổ dữ liệu cho bảng `transaction`
--

INSERT INTO `transaction` (`transaction_id`, `status`, `user_id`, `user_name`, `user_email`, `user_phone`, `amount`, `payment`, `message`, `date`, `address`, `product_id`) VALUES
(17, 4, 4, 'SonJS', 'sund8088@gmail.com', '0356188977', '1', '685000', 'dlkrgjlf', '2025-01-22 15:43:21', 'Hai Duong-Hai Duong-Quang Trung-123 Quang Trung', 'MNC03'),
(15, 3, 4, 'SonJS', 'sund8088@gmail.com', '0356188977', '1', '815000', 'dlkrgjlf', '2025-01-20 16:05:55', 'Hai Duong-Hai Duong--123 Quang Trung', 'CAS01'),
(16, 4, 4, 'SonJS', 'sund8088@gmail.com', '0356188977', '1', '3857000', 'No buy', '2025-01-21 12:52:35', 'Hai Duong-Hai Duong-Quang Trung-123 Quang Trung', 'MOR11'),
(14, 4, 4, 'SonJS', 'sund8088@gmail.com', '0356188977', '1', '1635000', 'dlkrgjlf', '2025-01-20 13:22:06', 'Hai Duong-Hai Duong-Quang Trung-123 Quang Trung', 'VGA02'),
(13, 4, 4, 'SonJS', 'sund8088@gmail.com', '0356188977', '1-1', '1165000', 'No buy', '2025-01-20 13:08:16', 'Hai Duong-Hai Duong-Quang Trung-123 Quang Trung', 'CAS01-COL05'),
(18, 0, 4, 'SonJS', 'sund8088@gmail.com', '0356188977', '1', '795000', 'No buy', '2025-01-23 09:14:30', 'Hai Duong-Hai Duong-Quang Trung-123 Quang Trung', 'CAS03'),
(19, 0, 12, 'Sơn Nguyễn', 'nguyenngocson30102003@gmail.com', '0356188976', '1', '1285000', 'dlkrgjlf', '2025-01-23 10:01:42', 'Hai Duong-Hai Duong-Quang Trung-123 Quang Trung', 'MOR06');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(128) NOT NULL,
  `user_email` varchar(128) NOT NULL,
  `user_phone` varchar(20) NOT NULL,
  `user_password` varchar(128) NOT NULL,
  `avatar` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `verification_code` varchar(255) DEFAULT NULL,
  `is_verified` tinyint(1) DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `user_email`, `user_phone`, `user_password`, `avatar`, `verification_code`, `is_verified`) VALUES
(10, 'ReactJS', 'satur7004@gmail.com', '0999888777', '$2y$10$W3RDlDGF4/0ocYHbmohnTu6tPscr/3HvNp9WI2gTMf5rO0A42Z49C', 'avatar/Phoenix.png', 'a3325b7a6f5ffc97bbd606f06675b4c0', 1),
(4, 'SonJS', 'sund8088@gmail.com', '0356188977', '$2y$10$GlUVdKL0CDtQ4yo2ZT4zeez0l7JIVidqHrhYxnxGfgl1CeIxFu3H2', 'avatar/subway.png', '15ff8c5071e8783e536a8b77277a49df', 1),
(12, 'Sơn Nguyễn', 'nguyenngocson30102003@gmail.com', '0356188976', '$2y$10$yBmMgmoYM9iURLDWk7xcJOeOhjcTB3JjuJKEwxultCM6vJky6taGm', 'avatar/Lion.png', 'a3c026e9eaedcc730ccda0b438f921fb', 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Chỉ mục cho bảng `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`brand_id`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`user_id`,`product_id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Chỉ mục cho bảng `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);
ALTER TABLE `product` ADD FULLTEXT KEY `product_name` (`product_name`);

--
-- Chỉ mục cho bảng `product_details`
--
ALTER TABLE `product_details`
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`transaction_id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_phone` (`user_phone`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `order`
--
ALTER TABLE `order`
  MODIFY `order_id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `transaction`
--
ALTER TABLE `transaction`
  MODIFY `transaction_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `product_details`
--
ALTER TABLE `product_details`
  ADD CONSTRAINT `product_details_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
