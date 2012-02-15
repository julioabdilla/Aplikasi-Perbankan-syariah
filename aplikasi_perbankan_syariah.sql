-- phpMyAdmin SQL Dump
-- version 3.4.5deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 15, 2012 at 10:34 AM
-- Server version: 5.1.58
-- PHP Version: 5.3.6-13ubuntu3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `aplikasi_perbankan_syariah`
--

-- --------------------------------------------------------

--
-- Table structure for table `alamat`
--

CREATE TABLE IF NOT EXISTS `alamat` (
  `ID_Alamat` int(11) NOT NULL AUTO_INCREMENT,
  `Alamat` text NOT NULL,
  `RT` varchar(5) DEFAULT NULL,
  `RW` varchar(5) DEFAULT NULL,
  `Kelurahan` text,
  `Kecamatan` text,
  `Kota` text,
  `Kode_Pos` varchar(10) DEFAULT NULL,
  `Status_Rumah` int(11) DEFAULT NULL,
  `No_Telp` varchar(13) DEFAULT NULL,
  `Fax` varchar(15) DEFAULT NULL,
  `No_Hp` varchar(13) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_Alamat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hubungan_darurat`
--

CREATE TABLE IF NOT EXISTS `hubungan_darurat` (
  `ID_Hubungan_Darurat` int(11) NOT NULL AUTO_INCREMENT,
  `Nama` varchar(255) NOT NULL,
  `Hubungan` varchar(255) NOT NULL,
  `Alamat` int(11) NOT NULL,
  PRIMARY KEY (`ID_Hubungan_Darurat`),
  KEY `Alamat` (`Alamat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `informasi_penarikkan`
--

CREATE TABLE IF NOT EXISTS `informasi_penarikkan` (
  `ID_Transaksi` int(11) NOT NULL,
  `Jumlah_Penarikkan` double NOT NULL,
  KEY `ID_Transaksi` (`ID_Transaksi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `informasi_tabungan`
--

CREATE TABLE IF NOT EXISTS `informasi_tabungan` (
  `ID_Transaksi` int(11) NOT NULL,
  `Jumlah_Tabungan` double NOT NULL,
  KEY `ID_Transaksi` (`ID_Transaksi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jenis_tabungan`
--

CREATE TABLE IF NOT EXISTS `jenis_tabungan` (
  `ID_Jenis_Tabungan` int(11) NOT NULL AUTO_INCREMENT,
  `Jenis_Tabungan` varchar(255) NOT NULL,
  `Setoran_Awal_Minimum` double NOT NULL,
  `Saldo_Minimum` double NOT NULL,
  PRIMARY KEY (`ID_Jenis_Tabungan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `kartu_identitas`
--

CREATE TABLE IF NOT EXISTS `kartu_identitas` (
  `Nomor_Kartu_identitas` varchar(255) NOT NULL,
  `Tipe_Kartu_Identitas` int(11) NOT NULL,
  `Alamat` int(11) NOT NULL,
  `Masa_Berlaku_Kartu_Identitas` date NOT NULL,
  PRIMARY KEY (`Nomor_Kartu_identitas`),
  KEY `Tipe_Kartu_Identitas` (`Tipe_Kartu_Identitas`),
  KEY `Alamat` (`Alamat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kewarganegaraan`
--

CREATE TABLE IF NOT EXISTS `kewarganegaraan` (
  `ID_Kewarganegaraan` int(11) NOT NULL AUTO_INCREMENT,
  `Kewarganegaraan` varchar(3) NOT NULL,
  PRIMARY KEY (`ID_Kewarganegaraan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `nasabah`
--

CREATE TABLE IF NOT EXISTS `nasabah` (
  `ID_Nasabah` int(11) NOT NULL AUTO_INCREMENT,
  `Nama_Lengkap` varchar(255) DEFAULT NULL,
  `Nomor_Kartu_Identitas` varchar(255) DEFAULT NULL,
  `Alamat` int(11) DEFAULT NULL,
  `Agama` varchar(255) DEFAULT NULL,
  `Kewarganegaraan` int(11) DEFAULT NULL,
  `Nama_Ibu_Kandung` varchar(255) DEFAULT NULL,
  `Hubungan_Darurat` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Nasabah`),
  KEY `ID_Card` (`Nomor_Kartu_Identitas`),
  KEY `Alamat` (`Alamat`),
  KEY `Agama` (`Agama`,`Nama_Ibu_Kandung`),
  KEY `Kewarganegaraan` (`Kewarganegaraan`),
  KEY `Agama_2` (`Agama`),
  KEY `Agama_3` (`Agama`),
  KEY `Hubungan_Darurat` (`Hubungan_Darurat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rekening`
--

CREATE TABLE IF NOT EXISTS `rekening` (
  `No_Rekening` varchar(10) NOT NULL,
  `ID_Nasabah` int(11) NOT NULL,
  `Jenis_Tabungan` int(11) NOT NULL,
  `Saldo` double NOT NULL,
  `Status_Rekening` varchar(11) NOT NULL,
  `Tanggal_Buka` date NOT NULL,
  `Tanggal_Tutup` date DEFAULT NULL,
  PRIMARY KEY (`No_Rekening`),
  KEY `ID_Nasabah` (`ID_Nasabah`),
  KEY `Tipe_Rekening` (`Jenis_Tabungan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tipe_kartu_identitas`
--

CREATE TABLE IF NOT EXISTS `tipe_kartu_identitas` (
  `ID_Tipe_Kartu_Identitas` int(11) NOT NULL AUTO_INCREMENT,
  `Kartu_Identitas` varchar(10) NOT NULL,
  PRIMARY KEY (`ID_Tipe_Kartu_Identitas`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tipe_transaksi`
--

CREATE TABLE IF NOT EXISTS `tipe_transaksi` (
  `ID_Tipe_Transaksi` int(11) NOT NULL AUTO_INCREMENT,
  `Nama_Transaksi` varchar(255) NOT NULL,
  PRIMARY KEY (`ID_Tipe_Transaksi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE IF NOT EXISTS `transaksi` (
  `ID_Transaksi` int(11) NOT NULL AUTO_INCREMENT,
  `Rekening_Transaksi` varchar(10) NOT NULL,
  `Tipe_Transaksi` int(11) NOT NULL,
  `Tanggal_Transaksi` date NOT NULL,
  PRIMARY KEY (`ID_Transaksi`),
  KEY `Tipe_Transaksi` (`Tipe_Transaksi`),
  KEY `Rekening_Transaksi` (`Rekening_Transaksi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `transfer`
--

CREATE TABLE IF NOT EXISTS `transfer` (
  `ID_Transaksi` int(11) NOT NULL,
  `Rekening_Tujuan` varchar(10) NOT NULL,
  `Jumlah_Dana_Transfer` double NOT NULL,
  KEY `ID_Transaksi` (`ID_Transaksi`,`Rekening_Tujuan`),
  KEY `Rekening_Tujuan` (`Rekening_Tujuan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hubungan_darurat`
--
ALTER TABLE `hubungan_darurat`
  ADD CONSTRAINT `hubungan_darurat_ibfk_1` FOREIGN KEY (`Alamat`) REFERENCES `alamat` (`ID_Alamat`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `informasi_penarikkan`
--
ALTER TABLE `informasi_penarikkan`
  ADD CONSTRAINT `informasi_penarikkan_ibfk_1` FOREIGN KEY (`ID_Transaksi`) REFERENCES `transaksi` (`ID_Transaksi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `informasi_tabungan`
--
ALTER TABLE `informasi_tabungan`
  ADD CONSTRAINT `informasi_tabungan_ibfk_1` FOREIGN KEY (`ID_Transaksi`) REFERENCES `transaksi` (`ID_Transaksi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kartu_identitas`
--
ALTER TABLE `kartu_identitas`
  ADD CONSTRAINT `kartu_identitas_ibfk_1` FOREIGN KEY (`Tipe_Kartu_Identitas`) REFERENCES `tipe_kartu_identitas` (`ID_Tipe_Kartu_Identitas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kartu_identitas_ibfk_2` FOREIGN KEY (`Alamat`) REFERENCES `alamat` (`ID_Alamat`);

--
-- Constraints for table `nasabah`
--
ALTER TABLE `nasabah`
  ADD CONSTRAINT `nasabah_ibfk_4` FOREIGN KEY (`Kewarganegaraan`) REFERENCES `kewarganegaraan` (`ID_Kewarganegaraan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nasabah_ibfk_2` FOREIGN KEY (`Alamat`) REFERENCES `alamat` (`ID_Alamat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nasabah_ibfk_5` FOREIGN KEY (`Nomor_Kartu_Identitas`) REFERENCES `kartu_identitas` (`Nomor_Kartu_identitas`),
  ADD CONSTRAINT `nasabah_ibfk_6` FOREIGN KEY (`Hubungan_Darurat`) REFERENCES `hubungan_darurat` (`ID_Hubungan_Darurat`);

--
-- Constraints for table `rekening`
--
ALTER TABLE `rekening`
  ADD CONSTRAINT `rekening_ibfk_1` FOREIGN KEY (`ID_Nasabah`) REFERENCES `nasabah` (`ID_Nasabah`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rekening_ibfk_2` FOREIGN KEY (`Jenis_Tabungan`) REFERENCES `jenis_tabungan` (`ID_Jenis_Tabungan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`Tipe_Transaksi`) REFERENCES `tipe_transaksi` (`ID_Tipe_Transaksi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transfer`
--
ALTER TABLE `transfer`
  ADD CONSTRAINT `transfer_ibfk_1` FOREIGN KEY (`ID_Transaksi`) REFERENCES `transaksi` (`ID_Transaksi`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transfer_ibfk_3` FOREIGN KEY (`Rekening_Tujuan`) REFERENCES `rekening` (`No_Rekening`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
