-- MariaDB dump 10.19  Distrib 10.4.25-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: qltro
-- ------------------------------------------------------
-- Server version	10.4.25-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `dich_vu`
--

DROP TABLE IF EXISTS `dich_vu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dich_vu` (
  `ma_dv` varchar(4) NOT NULL,
  `don_gia_nuoc` int(11) DEFAULT NULL,
  `don_gia_dien` int(11) DEFAULT NULL,
  `don_vi_tinh` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`ma_dv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dich_vu`
--

LOCK TABLES `dich_vu` WRITE;
/*!40000 ALTER TABLE `dich_vu` DISABLE KEYS */;
INSERT INTO `dich_vu` VALUES ('DN',10000,4000,'VND');
/*!40000 ALTER TABLE `dich_vu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hdong_thue`
--

DROP TABLE IF EXISTS `hdong_thue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hdong_thue` (
  `ma_hdong` int(11) NOT NULL,
  `ma_khach` varchar(6) DEFAULT NULL,
  `ma_phong` varchar(10) DEFAULT NULL,
  `ngay_lap` date NOT NULL,
  `ngay_tra_phong` date DEFAULT NULL,
  PRIMARY KEY (`ma_hdong`),
  KEY `ma_khach` (`ma_khach`),
  KEY `ma_phong` (`ma_phong`),
  CONSTRAINT `hdong_thue_ibfk_1` FOREIGN KEY (`ma_khach`) REFERENCES `khach_tro` (`ma_khach`),
  CONSTRAINT `hdong_thue_ibfk_2` FOREIGN KEY (`ma_phong`) REFERENCES `phong` (`ma_phong`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hdong_thue`
--

LOCK TABLES `hdong_thue` WRITE;
/*!40000 ALTER TABLE `hdong_thue` DISABLE KEYS */;
INSERT INTO `hdong_thue` VALUES (1,'A','001','2022-07-22','2025-07-22'),(2,'B','002','2022-07-22','2025-07-22'),(3,'C','002','2022-07-22','2025-07-22'),(4,'D','003','2022-07-25','2025-07-25'),(5,'E','004','2022-09-10','2025-09-10'),(6,'F','004','2022-09-10','2025-09-10'),(7,'G','005','2022-12-22','2025-12-22'),(8,'H','005','2022-12-22','2025-12-22');
/*!40000 ALTER TABLE `hdong_thue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khach_tro`
--

DROP TABLE IF EXISTS `khach_tro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `khach_tro` (
  `ma_khach` varchar(6) NOT NULL,
  `ho_ten` varchar(50) DEFAULT NULL,
  `ngay_sinh` date DEFAULT NULL,
  `cmnd` mediumtext DEFAULT NULL,
  `gioi_tinh` varchar(3) DEFAULT NULL,
  `sdt` mediumtext DEFAULT NULL,
  PRIMARY KEY (`ma_khach`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khach_tro`
--

LOCK TABLES `khach_tro` WRITE;
/*!40000 ALTER TABLE `khach_tro` DISABLE KEYS */;
INSERT INTO `khach_tro` VALUES ('A','TRUONG TRIEU VY','2002-12-02','92202004227','nam','789191224'),('B','TRUONG KHA THI','2002-08-02','92202004227','nam','775630124'),('C','TRAN GIA HUNG','2002-09-02','92202004227','nam','542367891'),('D','NGUYEN VAN A','2001-10-22','92202004227','nam','787234524'),('E','NGUYEN VAN B','2002-12-12','92202004227','nam','789245631'),('F','NGUYEN VAN C','2002-03-07','92202004227','nam','786537894'),('G','NGUYEN VAN D','2002-08-14','92202004227','nam','740563089'),('H','NGUYEN VAN E','2001-12-25','92202004227','nam','789235456');
/*!40000 ALTER TABLE `khach_tro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loai_phong`
--

DROP TABLE IF EXISTS `loai_phong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loai_phong` (
  `ma_loai` varchar(6) NOT NULL,
  `dien_tich` varchar(10) DEFAULT NULL,
  `co_gac` char(1) DEFAULT NULL,
  `suc_chua` int(11) DEFAULT NULL,
  PRIMARY KEY (`ma_loai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loai_phong`
--

LOCK TABLES `loai_phong` WRITE;
/*!40000 ALTER TABLE `loai_phong` DISABLE KEYS */;
INSERT INTO `loai_phong` VALUES ('P1N-0','12m2','N',1),('P1N-G','12m2','Y',1),('P2N-0','15m2','N',2),('P2N-G','15m2','Y',2),('P3N-0','18m2','N',3),('P3N-G','18m2','Y',3);
/*!40000 ALTER TABLE `loai_phong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nha_tro`
--

DROP TABLE IF EXISTS `nha_tro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nha_tro` (
  `ma_tro` varchar(6) NOT NULL,
  `ten_tro` varchar(20) NOT NULL,
  `dia_chi` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ma_tro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nha_tro`
--

LOCK TABLES `nha_tro` WRITE;
/*!40000 ALTER TABLE `nha_tro` DISABLE KEYS */;
INSERT INTO `nha_tro` VALUES ('NT001','Nhà trọ Văn Đời 1','An Khánh, Ninh Kiều, Cần Thơ'),('NT002','Nhà trọ Văn Đời 2','Xuân Khánh, Ninh Kiều, Cần Thơ'),('NT003','Nhà trọ Văn Đời 3','Hưng Lợi, Ninh Kiều, Cần Thơ');
/*!40000 ALTER TABLE `nha_tro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phieu_thu`
--

DROP TABLE IF EXISTS `phieu_thu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phieu_thu` (
  `ma_pthu` int(11) NOT NULL,
  `ma_phong` varchar(6) DEFAULT NULL,
  `ngay_nhap` date DEFAULT NULL,
  `tien_dien` int(11) DEFAULT NULL,
  `tien_nuoc` int(11) DEFAULT NULL,
  `gia_phong` int(11) DEFAULT NULL,
  `da_dong` char(1) DEFAULT NULL,
  `tong` int(11) DEFAULT NULL,
  PRIMARY KEY (`ma_pthu`),
  KEY `ma_phong` (`ma_phong`),
  CONSTRAINT `phieu_thu_ibfk_1` FOREIGN KEY (`ma_phong`) REFERENCES `phong` (`ma_phong`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieu_thu`
--

LOCK TABLES `phieu_thu` WRITE;
/*!40000 ALTER TABLE `phieu_thu` DISABLE KEYS */;
INSERT INTO `phieu_thu` VALUES (1,'001','2023-07-12',100000,100000,1000000,'N',1200000),(2,'002','2023-07-12',100000,100000,1000000,'N',1200000),(3,'003','2023-07-12',100000,100000,1000000,'Y',1200000);
/*!40000 ALTER TABLE `phieu_thu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phong`
--

DROP TABLE IF EXISTS `phong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phong` (
  `ma_phong` varchar(6) NOT NULL,
  `gia_phong` int(11) DEFAULT NULL,
  `duoc_thue` char(1) DEFAULT NULL,
  `ma_loai` varchar(6) DEFAULT NULL,
  `ma_tro` varchar(6) DEFAULT NULL,
  `chi_so_dien_cu` int(11) DEFAULT 0,
  `chi_so_nuoc_cu` int(11) DEFAULT 0,
  `chi_so_nuoc_moi` int(11) DEFAULT 0,
  `chi_so_dien_moi` int(11) DEFAULT 0,
  PRIMARY KEY (`ma_phong`),
  KEY `ma_loai` (`ma_loai`),
  KEY `ma_tro` (`ma_tro`),
  CONSTRAINT `phong_ibfk_1` FOREIGN KEY (`ma_loai`) REFERENCES `loai_phong` (`ma_loai`),
  CONSTRAINT `phong_ibfk_2` FOREIGN KEY (`ma_tro`) REFERENCES `nha_tro` (`ma_tro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phong`
--

LOCK TABLES `phong` WRITE;
/*!40000 ALTER TABLE `phong` DISABLE KEYS */;
INSERT INTO `phong` VALUES ('001',1000000,'N','P1N-G','NT001',0,0,0,0),('002',1000000,'N','P1N-G','NT001',0,0,10,10),('003',1000000,'N','P1N-G','NT001',0,0,10,10),('004',1000000,'N','P1N-G','NT001',0,0,100,120),('005',1000000,'N','P1N-G','NT001',0,0,10,10),('006',1000000,'N','P1N-G','NT001',0,0,0,0),('007',1200000,'N','P2N-0','NT001',0,0,0,0),('008',1200000,'N','P2N-0','NT001',0,0,0,0),('009',1400000,'N','P3N-G','NT001',0,0,0,0),('010',1200000,'N','P2N-G','NT001',0,0,0,0),('011',1400000,'N','P3N-G','NT001',0,0,0,0),('012',1000000,'N','P1N-G','NT001',0,0,0,0),('013',1350000,'N','P3N-0','NT001',0,0,0,0),('014',1200000,'N','P2N-G','NT001',0,0,0,0),('015',1000000,'N','P1N-G','NT001',0,0,0,0),('016',1300000,'N','P2N-G','NT001',0,0,0,0);
/*!40000 ALTER TABLE `phong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tai_khoan`
--

DROP TABLE IF EXISTS `tai_khoan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tai_khoan` (
  `ma_tk` int(11) NOT NULL,
  `ten_dnhap` varchar(20) DEFAULT NULL,
  `mat_khau` varchar(30) DEFAULT NULL,
  `ho_ten` varchar(50) DEFAULT NULL,
  `sdt` int(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ma_tk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tai_khoan`
--

LOCK TABLES `tai_khoan` WRITE;
/*!40000 ALTER TABLE `tai_khoan` DISABLE KEYS */;
INSERT INTO `tai_khoan` VALUES (1,'hungtg_2002','tghung@ctu','Trần Gia Hưng',982930212,'tghung@gmail.com'),(2,'vytt_2002','ttvy@ctu','Trương Triệu Vỹ',352647896,'ttvy@gmail.com'),(3,'thitk_2002','tkt@ctu','Trương Khả Thi',275489076,'tkthi@gmail.com');
/*!40000 ALTER TABLE `tai_khoan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'qltro'
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP FUNCTION IF EXISTS `doanh_thu_thang` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `doanh_thu_thang`(pym varchar(7)) RETURNS int(11)
begin
	return (select sum(tong) from phieu_thu where ngay_nhap like Concat('%',pym,'%') and da_dong='Y') ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP FUNCTION IF EXISTS `tong_doanh_thu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `tong_doanh_thu`() RETURNS int(11)
begin
	return (select sum(tong) from phieu_thu where da_dong = 'Y') ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP FUNCTION IF EXISTS `total_dichvu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `total_dichvu`(pdate date) RETURNS int(11)
begin
	declare temp , temp1 int;
    select tien_dien into temp from phieu_thu where ngay_thu = pdate;
	select tien_nuoc into temp1 from phieu_thu where ngay_thu = pdate;
	return temp + temp1 ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP FUNCTION IF EXISTS `total_dien` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `total_dien`() RETURNS int(11)
BEGIN
	declare temp,total int;
		select don_gia_dien into temp from dich_vu where ma_dv='DN';
		select sum(tien_dien / temp) into total from phieu_thu;
     return total;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP FUNCTION IF EXISTS `total_nuoc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `total_nuoc`() RETURNS int(11)
BEGIN
	declare temp1,total1 int;
        select  don_gia_nuoc into temp1 from dich_vu where ma_dv='DN';
        select  sum(tien_nuoc / temp1) into total1 from phieu_thu;
     return  total1;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_hdong` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_hdong`(ma_khach varchar(6), ma_phong varchar(10) , ngay_lap date , ngay_tra_phong date)
begin
	declare max_id int;
    select max(ma_hdong) into max_id from hdong_thue;
		insert hdong_thue values (max_id + 1,ma_khach,ma_phong,ngay_lap,ngay_tra_phong);
		update phong
		set duoc_thue = 'Y' where ma_phong = ma_phong;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_phieuthu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_phieuthu`(ppid varchar(20),ngay_nhap date)
begin
	declare max_id, dien_cu,nuoc_cu,dien ,nuoc,gia,tong int;
    select max(ma_pthu) into max_id from phieu_thu;
	select don_gia_nuoc from dich_vu where ma_dv ='DN' into dien;
    select don_gia_dien from dich_vu where ma_dv ='DN' into nuoc;
    select (chi_so_dien_moi - chi_so_dien_cu) from phong where ma_phong =ppid into dien_cu;
     select (chi_so_nuoc_moi - chi_so_nuoc_cu)from phong where ma_phong =ppid into nuoc_cu;
     select gia_phong from phong where ma_phong =ppid into gia;
     set tong =dien*dien_cu + nuoc*nuoc_cu + gia;
     insert phieu_thu values(max_id + 1,ppid,ngay_nhap,dien*dien_cu,nuoc*nuoc_cu,gia,'N',tong);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `da_dong` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `da_dong`(pmpt int)
begin
	update phieu_thu
    set da_dong = 'Y' where ma_pthu=pmpt;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_khach` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_khach`(pmakhach varchar(6))
begin
    delete from hdong_thue where ma_khach = pmakhach;
    delete from khach_tro where ma_khach = pmakhach;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `infor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `infor`(hoten varchar(50))
begin
     select * from khach_tro where ho_ten =hoten;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ins_khach` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ins_khach`(pmk varchar(6), photen varchar(50), pngaysinh date , cmnd long , sex varchar(3) , sdt int )
begin
    insert into khach_tro  values (pmk , photen , pngaysinh  , cmnd  , sex  , sdt );
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ins_phong` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ins_phong`(ppid varchar(6), pgiaphong int, ploai varchar(6) ,pmatro varchar(6))
begin
    insert into phong values (ppid, pgiaphong, 'N' , ploai, pmatro ,0,0,0,0);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `khach_no` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `khach_no`()
begin
	select k.ma_khach, k.ho_ten, p.ma_phong from phieu_thu p join hdong_thue h on p.ma_phong = h.ma_phong join khach_tro k on k.ma_khach = h.ma_khach where p.da_dong = false;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `register` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `register`(pten_dnhap varchar(20), pmat_khau varchar(30), pxac_nhan_mk varchar(30), pho_ten varchar(50), psdt int, pemail varchar(50))
begin
	declare max_id int;
    select max(ma_tk) into max_id from tai_khoan;
	insert into tai_khoan values (max_id + 1, pten_dnhap, pmat_khau, pho_ten, psdt, pemail);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_nhatro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_nhatro`(pmt varchar(20))
begin
	declare temp,temp1 int;
    select * from phong where ma_tro = pmt;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `tim_khach` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `tim_khach`(pname varchar(30))
begin 
	select * from khach_tro k where ho_ten like Concat('%',pname,'%');
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `up_dichvu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `up_dichvu`(nuoc int , dien int)
begin
    update dich_vu
    set don_gia_nuoc = nuoc , don_gia_dien = dien where ma_dv ='DN';
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `up_diennuoc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `up_diennuoc`(ppid varchar(8), chisodien int, chisonuoc int)
begin
	declare temp,temp1 int;
    select chi_so_dien_moi from phong where ma_phong =ppid into temp;
    select chi_so_nuoc_moi from phong where ma_phong =ppid into temp1;
    update phong 
    set chi_so_dien_cu = temp,
     chi_so_nuoc_cu = temp1,
     chi_so_dien_moi = chisodien,
     chi_so_nuoc_moi = chisonuoc
    where ma_phong = ppid;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `up_hdong` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `up_hdong`(pmp varchar(6), pdate date)
begin 
	declare temp varchar(11);
	select ma_hdong into temp from hdong_thue where ma_phong = pmp;
    update hdong_thue
    set ngay_tra_phong = pdate where ma_hdong = temp;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `up_khach` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `up_khach`(pmk varchar(6), photen varchar(50), ava_khach blob , pngaysinh date , cmnd long , sex varchar(3) , sdt long   )
begin
    insert khach_tro  values (pmk , photen , ava_khach  , pngaysinh  , cmnd  , sex  , sdt );
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `up_phong` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `up_phong`(ppid varchar(6))
begin
	update phong 
    set duoc_thue = false where ma_phong=ppid;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-27 17:59:32
