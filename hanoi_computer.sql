/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 10.1.38-MariaDB : Database - hanoi_computer
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`hanoi_computer` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `hanoi_computer`;

/*Table structure for table `ct_nhom_sp` */

DROP TABLE IF EXISTS `ct_nhom_sp`;

CREATE TABLE `ct_nhom_sp` (
  `manhom` int(10) NOT NULL,
  `ma_nhom_con` int(10) NOT NULL AUTO_INCREMENT,
  `ten_nhom_con` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ma_nhom_con`),
  KEY `manhom` (`manhom`),
  CONSTRAINT `ct_nhom_sp_ibfk_1` FOREIGN KEY (`manhom`) REFERENCES `tbnhomsp` (`manhom`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `ct_nhom_sp` */

insert  into `ct_nhom_sp`(`manhom`,`ma_nhom_con`,`ten_nhom_con`) values 
(1,1,'Laptop Acer'),
(1,2,'Laptop Asus'),
(1,3,'Laptop Apple'),
(1,4,'Laptop Dell'),
(1,5,'Laptop HP'),
(1,6,'Laptop Lenovo'),
(1,7,'Laptop LG'),
(1,8,'Laptop MSI'),
(2,10,'Máy tính đồng bộ Dell'),
(2,11,'Máy tính đồng bộ HP'),
(2,12,'Máy tính đồng bộ Lenovo'),
(2,13,'Máy tính đồng bộ Lenovo'),
(2,14,'Máy tính đồng bộ Acer'),
(2,15,'Máy tính đồng bộ Asus'),
(5,16,'Máy tính chơi game phổ thông'),
(5,17,'Máy tính chơi game trung cấp'),
(5,18,'Máy tính chơi game cao cấp'),
(5,19,'Máy tính chơi game siêu cao cấp'),
(6,20,'Máy trạm nhỏ gọn'),
(6,21,'Máy trạm tiêu chuẩn'),
(6,22,'Máy trạm chuyên nghiệp'),
(6,23,'Máy trạm siêu cao cấp'),
(6,24,'Máy trạm tuỳ biến'),
(6,25,'Máy trạm TMNT'),
(6,26,'Máy trạm 20 - 22 triệu'),
(6,27,'Máy trạm 30 - 40 triệu'),
(7,28,'Intel Pentium'),
(7,29,'Intel Core i3'),
(7,30,'Intel Core i7'),
(7,31,'Intel Core i9'),
(7,32,'Intel Xeon'),
(7,33,'AMD Ryzen 3'),
(7,34,'AMD Ryzen 5'),
(7,35,'AMD Ryzen 6'),
(7,36,'AMD Ryzen 7'),
(7,37,'AMD Ryzen 9'),
(8,38,'Màn hình ACER'),
(8,39,'Màn hình ASUS'),
(8,40,'Màn hình AoC'),
(8,41,'Màn hình Benq'),
(8,42,'Màn hình Dell'),
(8,43,'Màn hình HP'),
(8,44,'Màn hình HKG'),
(8,45,'Màn hình LG'),
(8,46,'Màn hình Samsung'),
(8,47,'Màn hình viewsonic'),
(8,48,'Màn hình Kinglight'),
(9,49,'Bàn phím Consair'),
(9,50,'Bàn phím SteelSeries'),
(9,51,'Bàn phím Razer'),
(9,52,'Bàn phím Varmilo'),
(9,53,'Bàn phím Fico'),
(9,54,'Bàn phím Leopold'),
(9,55,'Bàn phím Ducky'),
(9,56,'Bàn phím iKBC'),
(10,57,'Tản nhiệt nước Consair'),
(10,58,'Tản nhiệt nước NZXT'),
(10,59,'Tản nhiệt nước DeepCool'),
(10,60,'Tản nhiệt nước IDCooling'),
(10,61,'Tản nhiệt nước Thermaltake'),
(11,62,'Cấu hình Intel'),
(11,63,'Cấu hình AMD');

/*Table structure for table `tbchitiethoadon` */

DROP TABLE IF EXISTS `tbchitiethoadon`;

CREATE TABLE `tbchitiethoadon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mahd` int(11) NOT NULL,
  `idsp` int(11) NOT NULL,
  `soluong` int(11) NOT NULL,
  `giamua` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_hd_sp` (`mahd`,`idsp`),
  KEY `idsp` (`idsp`),
  CONSTRAINT `tbchitiethoadon_ibfk_1` FOREIGN KEY (`mahd`) REFERENCES `tbhoadon` (`mahd`),
  CONSTRAINT `tbchitiethoadon_ibfk_2` FOREIGN KEY (`idsp`) REFERENCES `tbsanpham` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;

/*Data for the table `tbchitiethoadon` */

insert  into `tbchitiethoadon`(`id`,`mahd`,`idsp`,`soluong`,`giamua`) values 
(40,31,16,1,12000000),
(41,32,16,1,12000000),
(42,33,4,1,12000000),
(44,35,3,4,21199000),
(45,35,26,4,9222000),
(51,40,4,4,32900000),
(52,41,4,1,32900000),
(53,42,3,1,21199000),
(54,42,4,1,32900000),
(55,43,16,1,20999000),
(56,43,2,1,14999000),
(57,43,3,1,21199000),
(58,44,3,3,21199000),
(59,44,4,1,32900000),
(60,44,27,1,1245000);

/*Table structure for table `tbhoadon` */

DROP TABLE IF EXISTS `tbhoadon`;

CREATE TABLE `tbhoadon` (
  `mahd` int(11) NOT NULL AUTO_INCREMENT,
  `id_customer` int(10) NOT NULL,
  `tennguoimua` varchar(30) CHARACTER SET utf8 NOT NULL,
  `dienthoai` varchar(15) NOT NULL,
  `ngaydat` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ngaynhan` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `trangthai` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mahd`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

/*Data for the table `tbhoadon` */

insert  into `tbhoadon`(`mahd`,`id_customer`,`tennguoimua`,`dienthoai`,`ngaydat`,`ngaynhan`,`trangthai`) values 
(31,10,'Vũ Bằng','385776023','2019-09-20 00:02:43','2019-09-20 00:02:43',2),
(32,10,'Vũ Bằng','385776023','2019-09-20 00:08:41','2019-09-20 00:08:41',2),
(33,10,'Vũ Bằng','385776023','2019-09-20 00:14:26','2019-09-20 00:14:26',2),
(35,10,'Vũ Bằng','385776023','2019-09-21 10:02:02','2019-09-21 10:02:02',1),
(40,1,'Kiều Tuấn','332298289','2019-09-25 21:19:11','2019-09-25 21:19:11',0),
(41,10,'Vũ Bằng','385776023','2019-09-25 22:14:02','2019-09-25 22:14:02',0),
(42,10,'Vũ Bằng','385776023','2019-09-25 22:23:59','2019-09-25 22:23:59',0),
(43,10,'Vũ Bằng','385776023','2019-09-25 22:39:50','2019-09-25 22:39:50',0),
(44,14,'FENG FENG FENG','985226321','2019-09-26 21:18:47','2019-09-26 21:18:47',0);

/*Table structure for table `tbloaitin` */

DROP TABLE IF EXISTS `tbloaitin`;

CREATE TABLE `tbloaitin` (
  `LoaiTin` int(11) NOT NULL AUTO_INCREMENT,
  `TenLoaiTin` varchar(2000) CHARACTER SET utf8 NOT NULL,
  `Sothutu` int(11) DEFAULT NULL,
  `TrangThai` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`LoaiTin`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `tbloaitin` */

insert  into `tbloaitin`(`LoaiTin`,`TenLoaiTin`,`Sothutu`,`TrangThai`) values 
(1,'Thể Thao',NULL,NULL),
(2,'Kinh tế',NULL,NULL);

/*Table structure for table `tbnhomsp` */

DROP TABLE IF EXISTS `tbnhomsp`;

CREATE TABLE `tbnhomsp` (
  `manhom` int(11) NOT NULL AUTO_INCREMENT,
  `tennhom` varchar(200) CHARACTER SET utf8 NOT NULL,
  `sothutu` int(11) DEFAULT NULL,
  `trangthai` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`manhom`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `tbnhomsp` */

insert  into `tbnhomsp`(`manhom`,`tennhom`,`sothutu`,`trangthai`) values 
(1,'Laptop & Phụ kiện',3,0),
(2,'Máy tính văn phòng',2,1),
(5,'Máy tính chơi game',1,1),
(6,'Máy chủ, Máy trạm',4,1),
(7,'Linh kiện máy tính',5,1),
(8,'Monitor - Màn hình',6,1),
(9,'Gaming Gear - Console',7,1),
(10,'Tản nhiệt - Cooling',8,1),
(11,'GameNet - Phòng Net',9,0);

/*Table structure for table `tbquantri` */

DROP TABLE IF EXISTS `tbquantri`;

CREATE TABLE `tbquantri` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taikhoan` varchar(50) NOT NULL,
  `matkhau` varchar(32) NOT NULL,
  `loai` tinyint(4) DEFAULT NULL,
  `trangthai` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taikhoan` (`taikhoan`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `tbquantri` */

insert  into `tbquantri`(`id`,`taikhoan`,`matkhau`,`loai`,`trangthai`) values 
(1,'admin','123456',1,1),
(2,'nhanvien','123456',2,1);

/*Table structure for table `tbsanpham` */

DROP TABLE IF EXISTS `tbsanpham`;

CREATE TABLE `tbsanpham` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `masp` varchar(30) NOT NULL,
  `tensp` varchar(100) CHARACTER SET utf8 NOT NULL,
  `giasp` int(11) NOT NULL,
  `manhom` int(11) DEFAULT NULL,
  `hinhanh` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `tomtat` text CHARACTER SET utf8,
  `noidung` text CHARACTER SET utf8,
  `trangthai` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `masp_unique` (`masp`),
  KEY `manhom` (`manhom`),
  CONSTRAINT `tbsanpham_ibfk_1` FOREIGN KEY (`manhom`) REFERENCES `tbnhomsp` (`manhom`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;

/*Data for the table `tbsanpham` */

insert  into `tbsanpham`(`id`,`masp`,`tensp`,`giasp`,`manhom`,`hinhanh`,`tomtat`,`noidung`,`trangthai`) values 
(2,'SP001','Laptop Dell Inspiron 3580 P75F106N80I i5 8265U / 4GB DDR4 / 1TB HDD',14999000,8,'40767_xg32vq__1_.jpg','Ringle bell\r\nRingle bell','<p>- Giao h&agrave;ng nhanh trong 2h</p>\r\n\r\n<p>- Miễn ph&iacute; giao h&agrave;ng (Trong b&aacute;n k&iacute;nh 20 km) cho đơn h&agrave;ng từ 500.000 đ trở l&ecirc;n</p>\r\n\r\n<p>- Miễn ph&iacute; giao h&agrave;ng 300 km đối với kh&aacute;ch h&agrave;ng Games Net, Doanh Nghiệp, Dự &Aacute;n</p>\r\n',1),
(3,'SP042','Laptop Dell Latitude 5490, Intel Core i5-8350U(1.70 GHz,6 MB), 8GB RAM, 256GB SSD, 14',21199000,1,'47763_case_asus_tuf_gaming_gt501vc___tempered_glass_mid_tower__.png','Ringle bel\r\nHello con co','<p>Tặng phần mềm diệt virus Eset Nod 32 Antivirus (6 Th&aacute;ng) (SOES003)&nbsp;<br />\r\n+ Tặng mouse Pad Game BATTLEGROUNDS 400x900 mm (PADM606)&nbsp;<br />\r\n+ Tặng chuột Logitech G102 Gaming USB (MELO099) hoặc giảm gi&aacute; 300.000 VNĐ&nbsp;<br />\r\n+ Giảm 200.000 VNĐ khi mua k&egrave;m b&agrave;n ph&iacute;m bất kỳ</p>\r\n',1),
(4,'SP05','Laptop Asus Gaming FX705GE-EW165T i7 8750H/8GB/1Tb+SSD256G',32900000,1,'45008_asus_tuf_gaming_fx505__gun_metal_1.jpg','','<ul>\r\n	<li>Chuột chơi game d&agrave;nh cho game thủ chuy&ecirc;n nghiệp đến từ Steelseries</li>\r\n	<li>Thương hiệu: Đan Mạch</li>\r\n	<li>Mắt cảm biến: Pixart TrueMove3 độc quyền d&agrave;nh cho Steelseries</li>\r\n	<li>Độ ph&acirc;n giải tối đa: 12000DPI</li>\r\n	<li>Tốc độ kiểm so&aacute;t tối đa: 350IPS</li>\r\n	<li>Đ&egrave;n LED: RGB 16,8 triệu m&agrave;u hỗ trợ c&ocirc;ng nghệ Prism Sync mới nhất</li>\r\n	<li>Thiết kế: Đối xứng</li>\r\n	<li>Ph&ugrave; hợp game thủ: FPS</li>\r\n</ul>\r\n',1),
(16,'SP06','Laptop Asus Gaming FX505DT-AL003T Ryzen7 3750H/8Gb',20999000,1,'46647_1__small_.jpg','','<ul>\r\n	<li>Hợp t&aacute;c sản xuất c&ugrave;ng thương hiệu Ducky quen thuộc</li>\r\n	<li>Chất lượng ho&agrave;n thiện s&aacute;nh ngang với Leopold v&agrave; Filco</li>\r\n	<li>Thiết kế 60%, đem tới v&oacute;c d&aacute;ng gọn g&agrave;ng v&agrave; tinh tế</li>\r\n	<li>Thương hiệu Varmilo nổi tiếng trong cộng đồng B&agrave;n Ph&iacute;m Cơ</li>\r\n	<li>Phi&ecirc;n bản mới nhất mang t&ecirc;n Panda với phong c&aacute;ch gấu tr&uacute;c độc đ&aacute;o</li>\r\n	<li>Phần qu&agrave; đi k&egrave;m l&agrave; B&agrave;n Di si&ecirc;u lớn v&agrave; ch&uacute; Gấu Tr&uacute;c bằng b&ocirc;ng</li>\r\n	<li>Switch Cherry MX Made in Germany</li>\r\n	<li>Keycap PBT Dye-Sub d&agrave;y dặn, cho cảm gi&aacute;c g&otilde; tuyệt vời v&agrave; font chữ bền bỉ</li>\r\n	<li>Được trang bị hệ thống Led m&agrave;u trắng t&ocirc; điểm cho bộ keycap họa tiết c&acirc;y tr&uacute;c</li>\r\n</ul>\r\n',1),
(18,'SP07','PC Asus Rog Huracan G21CX-VN001T i7-9700K / 16GB / 1TB / 512GB SSD / RTX 2070 / Win10',54990000,2,'47985_asus_rog_huracan_g21_001.jpg','','<ul>\r\n	<li>Phi&ecirc;n bản cao cấp nhất của d&ograve;ng ph&iacute;m Razer Blackwidow</li>\r\n	<li>Tất cả c&aacute;c loại switch đều được tối ưu cho game thủ</li>\r\n	<li>3 loại switch Yellow, Orange, Green cho đặc t&iacute;nh kh&aacute;c nhau</li>\r\n	<li>Tuổi thọ l&ecirc;n tới 80 triệu lượt nhấn</li>\r\n	<li>Trang bị th&ecirc;m cụm ph&iacute;m Media ri&ecirc;ng biệt</li>\r\n	<li>Hệ thống Led RGB Chroma 16,8 triệu m&agrave;u đẳng cấp</li>\r\n</ul>\r\n',1),
(19,'SP08','PC Asus ROG Strix GL10CS-VN005T i5-9400 / 8GB DDR4 / 1TB / RTX 2060 / Win 10\r\n',23893000,2,'48162_asus_rog_strix_gl10cs_001.jpg','','',1),
(20,'SP09','PC Dell Inspiron 3670 MTI31410',8590000,2,'42679_dell_inspiron_3670_000001.jpg','','',1),
(21,'SP10','PC Dell Vostro 3470 HXKWJ1\r\n',7490000,2,'42968_dell_vostro_3470_001.jpg','','',1),
(22,'SP11','PC Acer Aspire XC-885 DT,BAQSV,001 i3 8100',9849000,2,'43391_aspire_xc_885_001.png','','',1),
(23,'SP12','PC Lenovo V530S-07ICB i3 8100 3.6Ghz/4GB',9249000,2,'44477_lenovo_desktop_v530s_tower_feature_01.jpg','','',1),
(25,'SP13','PC HNC Enthusiast Watercooling- Gaming Limited E1 i7 8700 / 16GB RAM / 512GB SSD / RTX2070 / FSP Hyd',54920000,5,'46917_46916__mg_4255.png','','',1),
(26,'SP14','PC HNC Advanced Gaming P1 i3 8100 / 8GB RAM / 240GB SSD / GTX1660\r\n',9222000,5,'46223_pcgm128__custom_.jpg','','',1),
(27,'SP15','PC HNC Advanced Gaming P3 i5 9400F / 8GB RAM / 500GB SSD / RTX2060\r\n',1245000,5,'46225_pcgm130.png','','',1),
(28,'SP16','PC HNC Advanced Gaming Limited RGB P9 i5 9400F / 16G / 500G / RTX2060S\r\n',58699990,5,'46910_46910_untitled_1.png',NULL,NULL,1),
(29,'SP17','PC HNC Advanced Gaming RGB P1 i5 9400F / 16G / 100G / RTX2060S\r\n',32100000,5,'47831_pcgm150__custom_.png',NULL,NULL,1),
(30,'SP18','Server Dell PowerEdge T30 Xeon E3-1225v5 3.3Ghz/8GB 2133Mhz ECC/1TB/DVD-RW/Dos\r\n',17390000,6,'43577_dell_poweredge_t30_00001.jpg',NULL,NULL,1),
(36,'SP19','Workstation Dell T3630 E2146G/16Gb (2*8Gb)/2TB/VGA P2000 5Gb/DVDRW/Key/Mouse/42PT3630D04\r\n',1893000,6,'45356_dell_precision_3630_tower_001.jpg',NULL,NULL,1),
(37,'SP20','Workstation HP Z2 Tower G4 Xeon E-2124G/8G/1TB/DVDWR/K+M/Dos (4FU52AV)\r\n',1920000,6,'46961_hp_z2_tower_g4__001.png',NULL,NULL,1),
(38,'SP21','Mainboard Asus ROG STRIX Z390-E GAMING\r\n',5420000,7,'48061_mainboard_asus_rog_strix_z390_e_gaming_1.png',NULL,NULL,1),
(39,'SP22','Mousepad Custom Dota2 Morphling 800x300mm',149000,7,'46027_hnc_mousepad_dota_morfling.jpg',NULL,'<p>hello</p>\r\n',1),
(40,'SP23','Vga Card Gigabyte RX580 GAMING-8GD\r\n',3230000,7,'47242_card_gigabyte_rx580_gaming_8gd_1.png',NULL,NULL,1),
(41,'SP24','Case Asus TUF Gaming GT501VC - Tempered Glass Mid-Tower\r\n',2990000,7,'47763_case_asus_tuf_gaming_gt501vc___tempered_glass_mid_tower__.png',NULL,NULL,1),
(42,'SP25','Màn Hình Asus 23.8\"VZ249HE LED IPS',3222000,8,'45901_vz249he__1_.jpg',NULL,NULL,1),
(43,'SP26','Màn Hình Game Cong ASUS ROG Strix XG32VQ 2K 144Hz Aura Sync FreeSync',1000000,8,'40767_xg32vq__1_.jpg',NULL,NULL,1),
(44,'SP27','Màn Hình Game ASUS ROG Swift PG279Q IPS 2K 165hz G-SYNC\r\n',2890000,8,'30395_pg279q___1_.png',NULL,NULL,1),
(45,'SP28','Màn Hình Game Cong ASUS ROG Strix XG27VQ 144Hz 1ms MPRT Full HD Aura RGB FreeSync',19000000,8,'hinh-anh-dep-21_044128777.jpg',NULL,'<p>null</p>\r\n',1);

/*Table structure for table `tbtintuc` */

DROP TABLE IF EXISTS `tbtintuc`;

CREATE TABLE `tbtintuc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Tieude` varchar(200) CHARACTER SET utf8 NOT NULL,
  `TomTat` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `Noidung` text CHARACTER SET utf8,
  `Hinhanh` varchar(100) CHARACTER SET utf16 DEFAULT NULL,
  `TinNoiBat` tinyint(1) DEFAULT NULL,
  `LoaiTin` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `LoaiTin` (`LoaiTin`),
  CONSTRAINT `tbtintuc_ibfk_1` FOREIGN KEY (`LoaiTin`) REFERENCES `tbloaitin` (`LoaiTin`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `tbtintuc` */

insert  into `tbtintuc`(`id`,`Tieude`,`TomTat`,`Noidung`,`Hinhanh`,`TinNoiBat`,`LoaiTin`) values 
(2,'tiêu đề tin 1','Tóm tắt tin 1','Nội dung tin 1','ha_giang.PNG',1,1),
(3,'tiêu đề tin 2','Tóm tắt tin 2','Nội dung tin 2','moc_chau.PNG',1,2);

/*Table structure for table `tbuser` */

DROP TABLE IF EXISTS `tbuser`;

CREATE TABLE `tbuser` (
  `user_id` int(3) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` int(12) NOT NULL,
  `sex` int(1) NOT NULL DEFAULT '1',
  `birthday` date NOT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `province` int(2) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tbuser` */

insert  into `tbuser`(`user_id`,`username`,`password`,`name`,`phone_number`,`sex`,`birthday`,`address`,`province`) values 
(1,'vubang152','1111111','Kiều Tuấn',332298289,1,'2000-01-09','128 Hồ Tùng Mậu - Hà Nội\r\n',1),
(2,'vubang153','1111111','Lê Trọng',984321123,1,'2019-02-02','125 Quán Sứ - HBT - Hà Nội',1),
(10,'vubang151','1111111','Vũ Bằng',385776023,1,'2017-01-01','Đại Đồng - Thạch Thất - Hà Nội\r\n',1),
(14,'assmin1','123456789','FENG FENG FENG',985226321,1,'1999-01-01','Hà Nội',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
