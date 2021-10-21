-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 21, 2021 at 06:07 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apotek`
--
CREATE DATABASE IF NOT EXISTS `apotek` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `apotek`;

-- --------------------------------------------------------

--
-- Table structure for table `jual_obat`
--

CREATE TABLE `jual_obat` (
  `id_jual` int(11) NOT NULL,
  `id_obat` varchar(45) DEFAULT NULL,
  `jumlah_jual` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jual_obat`
--

INSERT INTO `jual_obat` (`id_jual`, `id_obat`, `jumlah_jual`) VALUES
(1001, 'E3', 4),
(1002, 'E3', 2),
(1003, 'E1', 5);

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `idobat` varchar(9) NOT NULL,
  `namaobat` varchar(45) DEFAULT NULL,
  `jumlah_obat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`idobat`, `namaobat`, `jumlah_obat`) VALUES
('E1', 'Paramex', 20),
('E2', 'Mixagrip', 10),
('E3', 'Milanta', 16),
('E4', 'Bodrexin', 26);

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `no_peg` int(11) NOT NULL,
  `nama` varchar(45) DEFAULT NULL,
  `alamat` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`no_peg`, `nama`, `alamat`) VALUES
(1, 'Miani', 'Jember'),
(2, 'Romaisha', 'Kediri'),
(3, 'Melinda', 'Jember'),
(4, 'Rizqa', 'Jember'),
(5, 'Maya', 'Jember');

-- --------------------------------------------------------

--
-- Table structure for table `stok_obat`
--

CREATE TABLE `stok_obat` (
  `idstok` int(11) NOT NULL,
  `id_obat` varchar(45) DEFAULT NULL,
  `jumlah_stok` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stok_obat`
--

INSERT INTO `stok_obat` (`idstok`, `id_obat`, `jumlah_stok`) VALUES
(1, 'E3', 12),
(2, 'E1', 10),
(3, 'E4', 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jual_obat`
--
ALTER TABLE `jual_obat`
  ADD PRIMARY KEY (`id_jual`);

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`idobat`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`no_peg`);

--
-- Indexes for table `stok_obat`
--
ALTER TABLE `stok_obat`
  ADD PRIMARY KEY (`idstok`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jual_obat`
--
ALTER TABLE `jual_obat`
  MODIFY `id_jual` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1004;

--
-- AUTO_INCREMENT for table `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `no_peg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `stok_obat`
--
ALTER TABLE `stok_obat`
  MODIFY `idstok` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Database: `ci_shop`
--
CREATE DATABASE IF NOT EXISTS `ci_shop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ci_shop`;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `id_user`, `id_product`, `qty`, `subtotal`) VALUES
(1, 4, 2, 1, 500000);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `slug`, `title`) VALUES
(1, 'android', 'Android Phone'),
(2, 'laptops', 'Laptops'),
(3, 'game-console', 'Game Console'),
(4, 'power-banks', 'Power Banks'),
(5, 'iphone', 'Iphone'),
(6, 'macbooks', 'Macbooks');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `date` date NOT NULL,
  `invoice` varchar(100) NOT NULL,
  `total` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `status` enum('waiting','paid','delivered','cancel') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `id_user`, `date`, `invoice`, `total`, `name`, `address`, `phone`, `status`) VALUES
(1, 5, '2020-03-18', '520200318210456', 36000000, 'Hakim', 'Kampung Malang Kulon 1/38-A', '087855777360', 'paid'),
(2, 5, '2020-03-19', '520200319181238', 500000, 'Jotaro Kujo', 'Western', '218838383', 'delivered'),
(3, 5, '2020-03-24', '520200324223408', 3000000, 'Amir Muhammad Hakim', 'Kampung Malang Kulon 1/38-A', '087855777360', 'waiting');

-- --------------------------------------------------------

--
-- Table structure for table `orders_confirm`
--

CREATE TABLE `orders_confirm` (
  `id` int(11) NOT NULL,
  `id_orders` int(11) NOT NULL,
  `account_name` varchar(255) NOT NULL,
  `account_number` varchar(50) NOT NULL,
  `nominal` int(11) NOT NULL,
  `note` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders_confirm`
--

INSERT INTO `orders_confirm` (`id`, `id_orders`, `account_name`, `account_number`, `nominal`, `note`, `image`) VALUES
(1, 1, 'Amir', '42424123333', 36000000, '-', '520200318210456-20200319173859.jpg'),
(2, 2, 'Dio Brando', '344312321', 500000, 'Mantap kang', '520200319181238-20200319181447.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `id_orders` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `qty` int(4) NOT NULL,
  `subtotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id`, `id_orders`, `id_product`, `qty`, `subtotal`) VALUES
(1, 1, 4, 6, 30000000),
(2, 1, 3, 2, 6000000),
(3, 2, 2, 1, 500000),
(4, 3, 3, 1, 3000000);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT 1,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `id_category`, `slug`, `title`, `description`, `price`, `is_available`, `image`) VALUES
(2, 3, 'ps-3-stick-console', 'PS 3 Stick Console', 'Stick controller for PS 3', 500000, 1, 'console.jpg'),
(3, 3, 'playstation-3', 'Playstation 3', 'PS 3 new edition', 3000000, 1, 'playstation-3-20200314173701.jpg'),
(4, 2, 'amd-ryzen-5', 'AMD Ryzen 5', 'Generasi terbaru prosesor AMD', 5000000, 1, 'amd-ryzen-5-20200314174154.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','member') NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `role`, `is_active`, `image`) VALUES
(4, 'Admin', 'admin@admin.com', '$2y$10$mLyToNOtVeLG.ziTUFPpCOOGD1P8cXZJj6ufU7J74TB63qVs2JjqK', 'admin', 1, 'admin-20200315212825.png'),
(5, 'Member', 'member@member.com', '$2y$10$ghbQkKwENFZnOxWAwtgSaeDV2gcI63ZorQEQkSxqlaUlrFUMNnLpy', 'member', 1, 'member-20200315232137.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders_confirm`
--
ALTER TABLE `orders_confirm`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders_confirm`
--
ALTER TABLE `orders_confirm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Database: `clothstore`
--
CREATE DATABASE IF NOT EXISTS `clothstore` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `clothstore`;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_buktitransfer`
--

CREATE TABLE `tbl_buktitransfer` (
  `id_transfer` int(11) NOT NULL,
  `nama_pengirim` varchar(50) CHARACTER SET latin1 NOT NULL,
  `tgl_transfer` date NOT NULL,
  `jam_transfer` time NOT NULL,
  `bank_transfer` varchar(20) CHARACTER SET latin1 NOT NULL,
  `foto_bukti` varchar(50) CHARACTER SET latin1 NOT NULL,
  `no_penjualan` varchar(16) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_buktitransfer`
--

INSERT INTO `tbl_buktitransfer` (`id_transfer`, `nama_pengirim`, `tgl_transfer`, `jam_transfer`, `bank_transfer`, `foto_bukti`, `no_penjualan`) VALUES
(5, 'Rangga Putra', '2020-06-20', '20:13:07', 'BRI', 'bkt-1592668874.jpg', 'PJL/20200601/001');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_datapenerima`
--

CREATE TABLE `tbl_datapenerima` (
  `id_datapenerima` int(11) NOT NULL,
  `nama_penerima` varchar(60) CHARACTER SET latin1 NOT NULL,
  `nohp_penerima` varchar(15) CHARACTER SET latin1 NOT NULL,
  `alamat_penerima` text CHARACTER SET latin1 NOT NULL,
  `kode_pos` varchar(10) CHARACTER SET latin1 NOT NULL,
  `provinsi_penerima` varchar(50) CHARACTER SET latin1 NOT NULL,
  `kabkota_penerima` varchar(50) CHARACTER SET latin1 NOT NULL,
  `kurir_pengiriman` varchar(8) CHARACTER SET latin1 NOT NULL,
  `paket_pengiriman` varchar(30) CHARACTER SET latin1 NOT NULL,
  `etd_paket` varchar(15) CHARACTER SET latin1 NOT NULL,
  `ongkir_paket` int(11) NOT NULL,
  `berat_kiriman` int(11) NOT NULL,
  `no_penjualan` varchar(16) CHARACTER SET latin1 NOT NULL,
  `kode_plg` varchar(10) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_datapenerima`
--

INSERT INTO `tbl_datapenerima` (`id_datapenerima`, `nama_penerima`, `nohp_penerima`, `alamat_penerima`, `kode_pos`, `provinsi_penerima`, `kabkota_penerima`, `kurir_pengiriman`, `paket_pengiriman`, `etd_paket`, `ongkir_paket`, `berat_kiriman`, `no_penjualan`, `kode_plg`) VALUES
(19, 'Rangga Putra', '085321404002', 'Jl. Paradise, Coldplay, Kota Mataram', '20477', 'Nusa Tenggara Barat (NTB)', 'Mataram', 'tiki', 'ECO', '4', 44000, 250, 'PJL/20200601/001', '2020032901'),
(20, 'Haidar Baihaqi', '085239072433', 'Jl. Jendral Soedirman No 47, Kebun Tunggal, Semarang, Jawa Tengah.', '50227', 'Jawa Tengah', 'Semarang', 'jne', 'REG', '1-2', 15000, 750, 'PJL/20200622/001', '2020051201');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_datapengiriman`
--

CREATE TABLE `tbl_datapengiriman` (
  `id_pengiriman` int(11) NOT NULL,
  `no_resi` varchar(20) CHARACTER SET latin1 NOT NULL,
  `jasa_kirim` varchar(20) CHARACTER SET latin1 NOT NULL,
  `tgl_kirim` date NOT NULL,
  `lama_kirim` varchar(10) CHARACTER SET latin1 NOT NULL,
  `catatan_kirim` text CHARACTER SET latin1 DEFAULT NULL,
  `tgl_record` date NOT NULL,
  `no_penjualan` varchar(16) CHARACTER SET latin1 NOT NULL,
  `id_pgw` varchar(6) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_datapengiriman`
--

INSERT INTO `tbl_datapengiriman` (`id_pengiriman`, `no_resi`, `jasa_kirim`, `tgl_kirim`, `lama_kirim`, `catatan_kirim`, `tgl_record`, `no_penjualan`, `id_pgw`) VALUES
(6, 'MTR200620KB', 'Tiki', '2020-06-21', '3-5', 'Mohon segera konfirmasi kami jika barang telah diterima, Terima kasih telah berbelanja dan kami tunggu orderan selanjutnya.', '2020-06-20', 'PJL/20200601/001', 'PGW001');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_keranjang`
--

CREATE TABLE `tbl_keranjang` (
  `id_keranjang` varchar(6) NOT NULL,
  `tanggal_krj` date NOT NULL,
  `jam_krj` time NOT NULL,
  `kode_plg` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_keranjangdetail`
--

CREATE TABLE `tbl_keranjangdetail` (
  `id_krjdt` int(11) NOT NULL,
  `id_prd` varchar(12) NOT NULL,
  `id_ukuran` int(11) NOT NULL,
  `jml_prd` int(11) NOT NULL,
  `id_keranjang` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pegawai`
--

CREATE TABLE `tbl_pegawai` (
  `id_pgw` varchar(6) NOT NULL,
  `nama_pgw` varchar(50) NOT NULL,
  `gender_pgw` varchar(10) NOT NULL,
  `lahir_pgw` date NOT NULL,
  `posisi_pgw` enum('Manager','Kasir') NOT NULL,
  `alamat_pgw` text NOT NULL,
  `username_pgw` varchar(30) NOT NULL,
  `password_pgw` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_pegawai`
--

INSERT INTO `tbl_pegawai` (`id_pgw`, `nama_pgw`, `gender_pgw`, `lahir_pgw`, `posisi_pgw`, `alamat_pgw`, `username_pgw`, `password_pgw`) VALUES
('PGW001', 'Aslan Kemal', 'Laki-laki', '1996-02-01', 'Manager', 'Kosan Alif, Mlati, Sleman, Yogyakarta', 'aslankemal', 'aslankemal'),
('PGW002', 'Heri Prasetyo', 'Laki-laki', '1994-04-17', 'Manager', 'Jalan Siliwangi, Jl. Ring Road Utara Jl. Jombor Lor, Mlati Krajan, Sendangadi, Kec. Mlati, Kabupaten Sleman.', 'bapakheri', 'bapakheri');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pelanggan`
--

CREATE TABLE `tbl_pelanggan` (
  `kode_plg` varchar(10) NOT NULL,
  `nama_plg` varchar(50) NOT NULL,
  `gender_plg` enum('Laki-laki','Perempuan') NOT NULL,
  `email_plg` varchar(50) NOT NULL,
  `username_plg` varchar(30) NOT NULL,
  `password_plg` varchar(30) NOT NULL,
  `tglregis_plg` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_pelanggan`
--

INSERT INTO `tbl_pelanggan` (`kode_plg`, `nama_plg`, `gender_plg`, `email_plg`, `username_plg`, `password_plg`, `tglregis_plg`) VALUES
('2020032901', 'Rangga Putra Rizdillah', 'Laki-laki', 'ranggaputra@gmail.com', 'rangga', 'rangga', '2020-03-29'),
('2020040401', 'Arif Setyo', 'Laki-laki', 'arifsetyo@gmail.com', 'arif', 'arif', '2020-04-04'),
('2020051201', 'Haidar Baihaqi', 'Laki-laki', 'haidarbaihaqi@gmail.com', 'haidar', 'haidar', '2020-05-12'),
('2021071601', 'Rizqa Alfiani', 'Laki-laki', 'rizqaalfiani7@gmail.com', 'ra', 'ra', '2021-07-16');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_penjualan`
--

CREATE TABLE `tbl_penjualan` (
  `no_penjualan` varchar(16) NOT NULL,
  `tgl_penjualan` date NOT NULL,
  `jam_penjualan` time NOT NULL,
  `total_penjualan` int(11) NOT NULL,
  `diskon_penjualan` int(11) NOT NULL,
  `bayar_penjualan` int(11) NOT NULL,
  `metode_penjualan` enum('Offline','Online') NOT NULL,
  `lunas_penjualan` enum('Lunas','Pending') NOT NULL,
  `status_penjualan` enum('Belum Bayar','Menunggu Verifikasi','Verifikasi','Dikirim','Selesai') NOT NULL,
  `kode_plg` varchar(10) DEFAULT NULL,
  `id_pgw` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_penjualan`
--

INSERT INTO `tbl_penjualan` (`no_penjualan`, `tgl_penjualan`, `jam_penjualan`, `total_penjualan`, `diskon_penjualan`, `bayar_penjualan`, `metode_penjualan`, `lunas_penjualan`, `status_penjualan`, `kode_plg`, `id_pgw`) VALUES
('PJL/20200522/001', '2020-05-22', '12:33:46', 90000, 0, 90000, 'Offline', 'Lunas', 'Selesai', NULL, 'PGW001'),
('PJL/20200527/001', '2020-05-27', '11:59:56', 234000, 10, 250000, 'Offline', 'Lunas', 'Selesai', NULL, 'PGW001'),
('PJL/20200601/001', '2020-06-02', '00:10:35', 90000, 0, 0, 'Online', 'Lunas', 'Dikirim', '2020032901', NULL),
('PJL/20200602/002', '2020-06-02', '20:23:31', 220000, 0, 250000, 'Offline', 'Lunas', 'Selesai', NULL, 'PGW001'),
('PJL/20200622/001', '2020-06-22', '18:58:07', 260000, 0, 0, 'Online', 'Pending', 'Belum Bayar', '2020051201', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_penjualandetail`
--

CREATE TABLE `tbl_penjualandetail` (
  `no_pjl_detail` int(11) NOT NULL,
  `id_prd` varchar(12) NOT NULL,
  `id_ukuran` int(11) NOT NULL,
  `harga_prd` int(11) NOT NULL,
  `diskon_prd` int(11) NOT NULL,
  `jml_prd` int(11) NOT NULL,
  `subtotal_prd` int(11) NOT NULL,
  `no_penjualan` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_penjualandetail`
--

INSERT INTO `tbl_penjualandetail` (`no_pjl_detail`, `id_prd`, `id_ukuran`, `harga_prd`, `diskon_prd`, `jml_prd`, `subtotal_prd`, `no_penjualan`) VALUES
(19, 'PRD003', 87, 90000, 0, 1, 90000, 'PJL/20200522/001'),
(26, 'PRD014', 132, 170000, 0, 1, 170000, 'PJL/20200527/001'),
(27, 'PRD013', 128, 90000, 0, 1, 90000, 'PJL/20200527/001'),
(28, 'PRD003', 87, 90000, 0, 1, 90000, 'PJL/20200601/001'),
(29, 'PRD013', 127, 90000, 0, 1, 90000, 'PJL/20200602/002'),
(30, 'PRD016', 139, 130000, 0, 1, 130000, 'PJL/20200602/002'),
(31, 'PRD012', 124, 170000, 0, 1, 170000, 'PJL/20200622/001'),
(32, 'PRD013', 127, 90000, 0, 1, 90000, 'PJL/20200622/001');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_produk`
--

CREATE TABLE `tbl_produk` (
  `id_prd` varchar(12) NOT NULL,
  `nama_prd` varchar(60) NOT NULL,
  `kategori_prd` varchar(15) NOT NULL,
  `harga_prd` int(11) NOT NULL,
  `diskon_prd` int(11) NOT NULL,
  `stok_prd` int(11) NOT NULL,
  `berat_prd` int(11) NOT NULL,
  `deskripsi_prd` text DEFAULT NULL,
  `gambar_prd` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_produk`
--

INSERT INTO `tbl_produk` (`id_prd`, `nama_prd`, `kategori_prd`, `harga_prd`, `diskon_prd`, `stok_prd`, `berat_prd`, `deskripsi_prd`, `gambar_prd`) VALUES
('PRD001', 'Turbidity Black', 'Kaus', 90000, 0, 55, 250, '', 'prd-1589990222.jpg'),
('PRD002', 'Aester Earthshaker Black', 'Kaus', 90000, 0, 42, 250, '', 'prd-1589990332.jpg'),
('PRD003', 'Noxa Grind Viruses Black', 'Kaus', 90000, 0, 38, 250, '', 'prd-1589990388.jpg'),
('PRD005', 'Death Vertical Black', 'Kaus', 90000, 0, 26, 250, '', 'prd-1589990584.jpg'),
('PRD006', 'Death Vomit Black Orange', 'Kaus', 90000, 0, 28, 250, '', 'prd-1589990639.jpg'),
('PRD007', 'Jihad Black', 'Kaus', 90000, 0, 13, 250, '', 'prd-1589990686.jpg'),
('PRD008', 'Turbidity Knife Black', 'Kaus', 90000, 0, 27, 250, '', 'prd-1589990742.jpg'),
('PRD009', 'Gerogot Skull Black', 'Kaus', 90000, 0, 30, 250, '', 'prd-1589990859.jpg'),
('PRD010', 'Noxa Propaganda', 'Kaus', 90000, 0, 44, 250, '', 'prd-1589990919.jpg'),
('PRD011', 'BLCKSDW Hoodie C1', 'Jaket', 170000, 0, 41, 500, '', 'prd-1589991113.jpg'),
('PRD012', 'Black Shadow UFO Hoodie', 'Jaket', 170000, 0, 15, 500, '', 'prd-1589991249.jpg'),
('PRD013', 'BLCKSDW Tricolor', 'Kaus', 90000, 0, 44, 250, '', 'prd-1589991304.jpg'),
('PRD014', 'Black Shadow est013 Hoodie', 'Jaket', 170000, 0, 30, 500, '', 'prd-1590124908.jpg'),
('PRD015', 'Black Shadow Flannel C1', 'Kemeja', 130000, 0, 17, 250, '', 'prd-1590125004.jpg'),
('PRD016', 'Black Shadow Flannel C2', 'Kemeja', 130000, 0, 16, 250, '', 'prd-1590125068.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ukuranprd`
--

CREATE TABLE `tbl_ukuranprd` (
  `id_ukuran` int(11) NOT NULL,
  `keterangan_ukr` varchar(4) NOT NULL,
  `stok_ukr` int(11) NOT NULL,
  `id_prd` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_ukuranprd`
--

INSERT INTO `tbl_ukuranprd` (`id_ukuran`, `keterangan_ukr`, `stok_ukr`, `id_prd`) VALUES
(78, 'S', 12, 'PRD001'),
(79, 'M', 18, 'PRD001'),
(80, 'L', 17, 'PRD001'),
(81, 'XL', 8, 'PRD001'),
(82, 'S', 8, 'PRD002'),
(83, 'M', 12, 'PRD002'),
(84, 'L', 19, 'PRD002'),
(85, 'XL', 3, 'PRD002'),
(86, 'S', 18, 'PRD003'),
(87, 'M', 6, 'PRD003'),
(88, 'L', 4, 'PRD003'),
(89, 'XL', 10, 'PRD003'),
(94, 'S', 6, 'PRD005'),
(95, 'M', 7, 'PRD005'),
(96, 'L', 3, 'PRD005'),
(97, 'XL', 10, 'PRD005'),
(98, 'S', 3, 'PRD006'),
(99, 'M', 14, 'PRD006'),
(100, 'L', 10, 'PRD006'),
(101, 'XL', 1, 'PRD006'),
(102, 'S', 2, 'PRD007'),
(103, 'M', 3, 'PRD007'),
(104, 'L', 2, 'PRD007'),
(105, 'XL', 6, 'PRD007'),
(106, 'S', 14, 'PRD008'),
(107, 'M', 8, 'PRD008'),
(108, 'L', 4, 'PRD008'),
(109, 'XL', 1, 'PRD008'),
(110, 'S', 4, 'PRD009'),
(111, 'M', 12, 'PRD009'),
(112, 'L', 11, 'PRD009'),
(113, 'XL', 3, 'PRD009'),
(114, 'S', 12, 'PRD010'),
(115, 'M', 23, 'PRD010'),
(116, 'L', 7, 'PRD010'),
(117, 'XL', 2, 'PRD010'),
(118, 'S', 0, 'PRD011'),
(119, 'M', 12, 'PRD011'),
(120, 'L', 18, 'PRD011'),
(121, 'XL', 11, 'PRD011'),
(122, 'S', 3, 'PRD012'),
(123, 'M', 2, 'PRD012'),
(124, 'L', 9, 'PRD012'),
(125, 'XL', 1, 'PRD012'),
(126, 'S', 17, 'PRD013'),
(127, 'M', 10, 'PRD013'),
(128, 'L', 15, 'PRD013'),
(129, 'XL', 2, 'PRD013'),
(130, 'S', 6, 'PRD014'),
(131, 'M', 9, 'PRD014'),
(132, 'L', 11, 'PRD014'),
(133, 'XL', 4, 'PRD014'),
(134, 'S', 3, 'PRD015'),
(135, 'M', 7, 'PRD015'),
(136, 'L', 5, 'PRD015'),
(137, 'XL', 2, 'PRD015'),
(138, 'S', 2, 'PRD016'),
(139, 'M', 7, 'PRD016'),
(140, 'L', 4, 'PRD016'),
(141, 'XL', 3, 'PRD016');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_buktitransfer`
--
ALTER TABLE `tbl_buktitransfer`
  ADD PRIMARY KEY (`id_transfer`),
  ADD KEY `bkt_nopjl` (`no_penjualan`);

--
-- Indexes for table `tbl_datapenerima`
--
ALTER TABLE `tbl_datapenerima`
  ADD PRIMARY KEY (`id_datapenerima`),
  ADD KEY `pnrm_nopjl` (`no_penjualan`);

--
-- Indexes for table `tbl_datapengiriman`
--
ALTER TABLE `tbl_datapengiriman`
  ADD PRIMARY KEY (`id_pengiriman`),
  ADD KEY `pngrmn_nopjl` (`no_penjualan`);

--
-- Indexes for table `tbl_keranjang`
--
ALTER TABLE `tbl_keranjang`
  ADD PRIMARY KEY (`id_keranjang`),
  ADD KEY `krj_kodeplg` (`kode_plg`);

--
-- Indexes for table `tbl_keranjangdetail`
--
ALTER TABLE `tbl_keranjangdetail`
  ADD PRIMARY KEY (`id_krjdt`),
  ADD KEY `krjd_idprd` (`id_prd`),
  ADD KEY `krjd_idkrj` (`id_keranjang`);

--
-- Indexes for table `tbl_pegawai`
--
ALTER TABLE `tbl_pegawai`
  ADD PRIMARY KEY (`id_pgw`);

--
-- Indexes for table `tbl_pelanggan`
--
ALTER TABLE `tbl_pelanggan`
  ADD PRIMARY KEY (`kode_plg`);

--
-- Indexes for table `tbl_penjualan`
--
ALTER TABLE `tbl_penjualan`
  ADD PRIMARY KEY (`no_penjualan`),
  ADD KEY `pjl_idpgw` (`id_pgw`),
  ADD KEY `pjl_kdplg` (`kode_plg`);

--
-- Indexes for table `tbl_penjualandetail`
--
ALTER TABLE `tbl_penjualandetail`
  ADD PRIMARY KEY (`no_pjl_detail`),
  ADD KEY `pjld_idprd` (`id_prd`),
  ADD KEY `pjld_nopjl` (`no_penjualan`);

--
-- Indexes for table `tbl_produk`
--
ALTER TABLE `tbl_produk`
  ADD PRIMARY KEY (`id_prd`);

--
-- Indexes for table `tbl_ukuranprd`
--
ALTER TABLE `tbl_ukuranprd`
  ADD PRIMARY KEY (`id_ukuran`),
  ADD KEY `ukuran_idprd` (`id_prd`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_buktitransfer`
--
ALTER TABLE `tbl_buktitransfer`
  MODIFY `id_transfer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_datapenerima`
--
ALTER TABLE `tbl_datapenerima`
  MODIFY `id_datapenerima` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tbl_datapengiriman`
--
ALTER TABLE `tbl_datapengiriman`
  MODIFY `id_pengiriman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_keranjangdetail`
--
ALTER TABLE `tbl_keranjangdetail`
  MODIFY `id_krjdt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `tbl_penjualandetail`
--
ALTER TABLE `tbl_penjualandetail`
  MODIFY `no_pjl_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `tbl_ukuranprd`
--
ALTER TABLE `tbl_ukuranprd`
  MODIFY `id_ukuran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_buktitransfer`
--
ALTER TABLE `tbl_buktitransfer`
  ADD CONSTRAINT `bkt_nopjl` FOREIGN KEY (`no_penjualan`) REFERENCES `tbl_penjualan` (`no_penjualan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_datapenerima`
--
ALTER TABLE `tbl_datapenerima`
  ADD CONSTRAINT `pnrm_nopjl` FOREIGN KEY (`no_penjualan`) REFERENCES `tbl_penjualan` (`no_penjualan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_datapengiriman`
--
ALTER TABLE `tbl_datapengiriman`
  ADD CONSTRAINT `pngrmn_nopjl` FOREIGN KEY (`no_penjualan`) REFERENCES `tbl_penjualan` (`no_penjualan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_keranjang`
--
ALTER TABLE `tbl_keranjang`
  ADD CONSTRAINT `krj_kodeplg` FOREIGN KEY (`kode_plg`) REFERENCES `tbl_pelanggan` (`kode_plg`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_keranjangdetail`
--
ALTER TABLE `tbl_keranjangdetail`
  ADD CONSTRAINT `krjd_idkrj` FOREIGN KEY (`id_keranjang`) REFERENCES `tbl_keranjang` (`id_keranjang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `krjd_idprd` FOREIGN KEY (`id_prd`) REFERENCES `tbl_produk` (`id_prd`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_penjualan`
--
ALTER TABLE `tbl_penjualan`
  ADD CONSTRAINT `pjl_idpgw` FOREIGN KEY (`id_pgw`) REFERENCES `tbl_pegawai` (`id_pgw`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pjl_kdplg` FOREIGN KEY (`kode_plg`) REFERENCES `tbl_pelanggan` (`kode_plg`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_penjualandetail`
--
ALTER TABLE `tbl_penjualandetail`
  ADD CONSTRAINT `pjld_idprd` FOREIGN KEY (`id_prd`) REFERENCES `tbl_produk` (`id_prd`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pjld_nopjl` FOREIGN KEY (`no_penjualan`) REFERENCES `tbl_penjualan` (`no_penjualan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_ukuranprd`
--
ALTER TABLE `tbl_ukuranprd`
  ADD CONSTRAINT `ukuran_idprd` FOREIGN KEY (`id_prd`) REFERENCES `tbl_produk` (`id_prd`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Database: `data_jember`
--
CREATE DATABASE IF NOT EXISTS `data_jember` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `data_jember`;

-- --------------------------------------------------------

--
-- Table structure for table `desa`
--

CREATE TABLE `desa` (
  `id` int(11) NOT NULL,
  `nama_desa` varchar(30) NOT NULL,
  `layer` varchar(30) NOT NULL,
  `daerah` polygon NOT NULL,
  `feature_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `desa`
--

INSERT INTO `desa` (`id`, `nama_desa`, `layer`, `daerah`, `feature_id`) VALUES
(4, 'kepatihan', 'polygon kepatihan', 0xfeffffff0103000000010000006900000073ad6fb8fa5328418be2541671596141395cc2e56d54284179e7730b735961411026a4aeba542841154e166f74596141e8361638ef54284129ffe2e27559614194e61acc27552841572917e077596141faf283d95d552841040921cd7959614191151a538c55284108e496817b59614116aff17acc5528419e944d7c79596141ae3fb7aa0f5628415286061677596141431bbd63565628412e8f180e7459614102ea005c84562841908565e0715961414ab8eba0cf562841b8f528d16c59614181ae27420d572841121100ef68596141500e8a1d61572841db779b6e63596141ad69e37cb6572841b30227e85d5961413f1a9a77b45728417b56e7c8555961419fbc8397f1572841ccf0deb65259614189a5a4c433582841ab315699505961413f1d27542e5928416a0c419150596141022218fe325a2841fc2cc260505961417a7cbff6c25a2841e81e06b74f596141e7419843115b28416c31cbdc4e596141c1c039835a5b2841a5df37bb4c596141e1998ea4b05b2841a2b2a3284759614176214ec5735b2841d7d0dadb46596141f840e6dc4b5b28419ae6836f44596141f31df7af3a5b2841d464030a4059614124eb3b773d5b2841cf12e52b3c5961411481bc89445b28415be1471d38596141c27751de645b2841a526c87b34596141814695d6925b2841872fda7331596141739935f1cd5b28412db6e72d2f596141a797d123435c2841dd1ac44d2b5961413f289753865c2841d49c3dcf28596141f488ab959f5c284185c65b532759614174b0a33eaf5c2841a0cff807265961414b04f6bfaf5c2841e4ce57d22059614104f32a83985c28417eab766d1d596141e4f78cb2795c2841791a155018596141a797d123435c284171ae3d7e11596141bb672036195c2841693310b10b596141af8bc1c9ef5b28415fff9dc9055961410c8dcce3975b28410a73d0e400596141d428618c455b2841eddfaf67fd586141e386d01feb5a28417fb5f0adf958614150f25a278c5a2841fdb4da34f6586141cc31e4091f5a2841355c69bef3586141e462acfa6d5928412f58e41af05861417502fd54b4582841f89d31a2eb5861414cfc009107582841f3afe04ee7586141ef0379f4385728411419c6eae1586141295526c7c55628411cd563b6de5861414d89ec196b56284117714ddbda586141b4f21e3dfe5528414045de56d558614164039dafaf552841a87dc719d15861416ab0fc9474552841ff6c3697ce586141820e6c281a552841b4742381cb5861410477ece4e75428411e724ea8c95861417e75edb3bc542841f1abe735c758614121cba3024854284125473025be586141babe3af511542841627ef4d9b958614137bbe3dfd85328413b1c5bf2b6586141384554988c5328416119fb5cb3586141ea7a191c5d532841ac71565ab25861417a63521b995228414e682ee9b1586141e4ca2c5a1e5228410e55c88dad586141b842206ff5512841d32fb385ad5861415a0e6605cd51284145eaa76aaf586141c7a08f029b51284126f4e554b3586141868b14fd6751284187d8837ab5586141704186da295128413c80287db6586141ef687e833951284176f1a900c1586141f1d6ad394e51284107b6678cc85861414c07b8da5a5128414ed0ab3ccd586141e470de14715128418de31198d1586141c632604c86512841b7202134d658614177deb417a3512841c2b860a6db586141a5ad51c3b351284125b0d96ae05861418a249371c551284159202ffce358614137adf80fd151284155f16daae8586141deea1d25d951284123edefeaeb586141ff53ebab0c522841dd89c395f1586141edf1cb4f4b522841f3604647f8586141e08bfc2a6e52284167444a1bfc58614199a1d0e38352284170c2d099fe5861411514091697522841c764d2ce0259614146986538a45228411e6848dd0959614113cd7855af5228410bb8a75b0f5961410b63f967b652284166eb0aae185961419a5ef0ebb7522841f43142bb1d596141b075cfbe755228410bbe84e320596141f5186b45785228418647f23222596141bf06eea19b5228416751301d26596141bd0e4e33d3522841ec1d664f2c5961418f66507def5228412ef966c02f596141ecc1a9dc4453284135144ca639596141e2862976b0532841762fbc48455961410b33d7f4af53284165f91ca249596141e63be9ecac532841915ce27b53596141b0296c49d0532841add9cea85759614175f4ff78e25328412ca27f375a596141be4c5b76e153284149d1d2295e596141c093eb36c9532841ea77e4be6759614173ad6fb8fa532841f04f4a127159614173ad6fb8fa5328418be2541671596141, 1),
(3, 'Kaliwates', 'polygon Kaliwates', 0xfeffffff010300000001000000db000000bffd7955743b28416c7b57231b596141e1c4253cbf3b2841c47e0b041c5961415ac1112e183c2841e22da62f1d59614126431e3c943c2841353668611f596141a38fea3e023d284153ea10de21596141dfddc0c8433d2841fdf0789f23596141548acca9873d28418b5262d726596141ae4f6e09ff3d284171bc0d412c596141307c7c71eb3e2841a9296d8b325961418a411ed1623f2841c3dd1508355961411dc53466b23f2841e08cb03336596141749a3593ea3f2841553af1ee3659614160538c3348402841e191be8437596141159e4eafe2402841909318f5375961413665fa952d412841389064143759614100f765716a412841e08cb03336596141c538f13b92412841378b56c33559614139fe97a95a432841ab33892d355961410529a198c4452841e087a2e23459614137c02f17cd4628415330d54c345961419185d17644472841fc312fbd34596141759e67f57747284171df6f78355961415e671d63964728411be6d739375961415d07de84c0472841c5ec3ffb385961414280b3e1c9472841e39bda263a596141d2b3e9650448284170f8b50d3c5961414760f5464848284170fdc35e3d596141bd0c01288c482841fd5491f43d5961411732e265d9482841ab56eb643e596141ac1538d9fe48284170fdc35e3d5961415830d8de054928411df5012d3b596141fc4a78e40c492841553af1ee365961416e07e392114928418d84ee01345961418ddeed461d49284139771e7f30596141a9c557c8e948284171bc0d412c5961412e692cf8ba4828416da3c7ab25596141df33ececac48284153ea10de21596141df33ececac482841c274ef6119596141df33ececac482841a6ac0ea111596141bcacc149b6482841ddecef110c5961412e692cf8ba482841e0ddc51e08596141a12597a6bf48284188d503ed055961411b82c276ee4828415277ce95035961416e07e39211492841c01f01000359614106dbd93876492841f96e0c64015961415db0da65ae4928418ac1cba8005961417e77864cf94928416c12317dff5861418167277f384a2841c20bc9bbfd5861418167277f384a28416ef9eae7f85861414709f227364a2841a539cc58f3586141d1fca6681c4a284132785359ed586141b7d5bba3fb492841a4115cd0e8586141ce0c0636dd492841a4eef998df58614122f26530d6492841db33e95adb5861416000bb76c3492841c175243cd6586141cf6c4514b3492841a1b75f1dd1586141057b9a5aa04928414daa8f9acd58614124b2e4ec81492841c04db4b3cb586141e0630e634049284131e7bc2ac758614116d2a28703492841a485d3f2c358614110922144af48284184cc1c25c05861410da2801170482841f76a33edbc586141f02ab53b3a482841120ba425ba586141762ec949e14728414a5093e7b55861416157be95d547284114f25d90b35861417bdee838cc472841d8932839b1586141788e0828b74728414e28235fab5861413e30d3d0b447284113caed07a958614197c552ba984728414c19f96ba75861410182bd689d472841a00367b7a1586141c82388119b472841109861dd9b586141937572a983472841d92f10e49658614138f0518d604728412c1a7e2f91586141fff15b14344728418109facb8c58614131b0d0490c472841f4ac1ee58a58614186f56f22db462841b953f7de89586141a2dcd9a3a7462841d6f87568885861414b07d9766f4628416646275c86586141d5fa8db755462841643c0bba8358614182756d9b3246284184d76da17f5861414467185545462841bc216bb47c586141f3d1986b614628419f72d0887b586141f3d1986b614628414c6a0e5779586141ba7363145f462841b90d337077586141bbd3a2f2344628412db665da7658614126f04c7f0f4628410f07cbae75586141097981a9d9452841bcfe087d7358614120b0cb3bbb4528412f9d1f45705861413b37f6deb1452841f239dc9c6c586141e65196e4b84528412a7fcb5e68586141adf3608db64528419b13c6846258614174952b36b445284164b082dc5e5861410689e0769a4528419cfa7fef5b5861411e206ae7514528412c4831e359586141f908deeff14428417e46d77259586141845cd20eae4428417e46d77259586141b32aa611474428414601e8b05d5861415db5e4c2e4432841f2167a656358614171fc8d22874328410fdf5a266b58614139fe97a95a43284167e71c586d58614117d7ace4394328417f96b7836e586141ded8b66b0d432841f33eeaed6d586141a6dac0f2e04228417f91a9326d58614111f76a7fbb42284165d8f26469586141b9c12a74ad42284162c9c871655861414705c0c5a84228419f09aae25f5861414705c0c5a842284162a158e95a586141f31f60cbaf422841823cbbd05658614111f76a7fbb4228419bcd011650586141bd110b85c2422841d608d5354958614184b3d52dc0422841b54502c642586141628cea689f4228410e3070113d586141ba216a52834228410d26546f3a58614194aa9e7c4d42284197730563385861417733d3a6174228419c6ef711375861413be5fc1cd64128419c6ef71137586141ff9626939441284128c6c4a737586141ac11067771412841ef76b94339586141da7f9a9b34412841d4d6480b3c58614168236fcb05412841ed8af1873e586141114e6e9ecd402841b93be62340586141a0f142ce9e402841623d4094405861415ff34c55724028419c91594940586141cfbf16d137402841613832433f58614159130bf0f33f2841d4db565c3d58614153d389ac9f3f28410d26546f3a5861412ebcfdb43f3f28417ebf5ce635586141db36dd981c3f28419a5fcd1e33586141104532df093f28414652fd9b2f586141104532df093f28417e97ec5d2b58614183019d8d0e3f28414134a9b527586141db36dd981c3f284144257fc2235861414ef34747213f284108c23b1a20586141c0afb2f5253f2841b4af5d461b586141f6bd073c133f284160a28dc317586141a338e71ff03e28417b42fefb14586141b61f51a1bc3e28410b90afef125861412a3cfb2d973e284140e4c8a412586141ceb6da11743e28415d9363d01358614104256f36373e2841d345b2dc15586141e7ada360013e284160a28dc31758614194288344de3d2841b3aa4ff519586141e06d221dad3d28419705d16b1b58614136b3c1f57b3d284145072bdc1b586141183cf61f463d284145072bdc1b586141b966f5f20d3d28419705d16b1b586141d89d3f85ef3c2841b4af5d461b586141bb2674afb93c28417e5636401a5861417fd89d25783c2841ecf95a5918586141eaf447b2523c2841254966bd165861413a8ac79b363c2841079acb9115586141b2f65139263c28417c470c4d1658614174483cd10e3c2841264e740e1858614172589b9ecf3b28417b6560331e5861411b839a71973b28410acc57bc22586141f50bcf9b613b28410de08f00285861411443192e433b2841ed442d192c586141805fc3ba1d3b28419750a32b2f586141840fe3a9083b2841b6044ca8315861414bb1ad52063b28417fc46a37375861414bb1ad52063b2841427f7b753b5861414bb1ad52063b28415e475c3643586141805fc3ba1d3b2841d5feb893465861414a516e74303b28410c670a8d4b586141c05db9334a3b28412b20c15a4f586141bffd7955743b28412b3e154157586141c79d3a779e3b2841ef0242215e58614116d37a82ac3b2841b8bd525f62586141fb4b50dfb53b284162c9c8716558614138fa6547cd3b2841f12fc0fa695861413c4a4658e23b284162e71c586d586141aa569117fc3b2841ef48069070586141c92d9ccb073c284182aaefc7735861418b7f8663f03b28412cb157897558614138fa6547cd3b2841d7bccd9b7858614116d37a82ac3b28410d1b03f37a5861418e3f05209c3b28412ccfab6f7d586141fcab8fbd8b3b2841f27fa00b7f586141fcab8fbd8b3b284181e6979483586141360ac5148e3b28412e01389a8a586141360ac5148e3b28411075ffa592586141a8c62fc3923b2841bc8583099758614100fc6fcea03b28414aec7a929b586141ac1610d4a73b28419ef94a159f586141fb4b50dfb53b2841bca8e540a0586141395aa525a33b28410fb1a772a2586141fcab8fbd8b3b28418463f67ea45861416b181a5b7b3b2841f415458ba6586141f50bcf9b613b28416ac89397a85861411893f93e583b2841bdd055c9aa58614152f12e965a3b28414a323f01ae58614113e3d94f6d3b2841d8932839b1586141f95bafac763b28412ca1f8bbb458614113e3d94f6d3b284184a4ac9cb558614187ff83dc473b2841bf02e2f3b75861414f018e631b3b2841f560174bba5861416638d8f5fc3a284182bdf231bc5861414311ed30dc3a284131c45af3bd5861412aea016cbb3a2841151fdc69bf5861417ecf6166b43a2841dccfd005c15861410b13f7b7af3a2841d8d9eca7c35861410b13f7b7af3a28416a36c88ec5586141b3ddb6aca13a2841f792a375c7586141b3ddb6aca13a284111474cf2c9586141b3ddb6aca13a284187fea84fcd58614199568c09ab3a284131051111cf586141821f4277c93a28411565a0d8d15861416a88b806123b2841bd7f40ded8586141a1266fa1683b2841fa0af40ee7586141fcab8fbd8b3b284115c9b82dec586141fcab8fbd8b3b2841c0d93c91f0586141ded48409803b2841dca11d52f858614132bae403793b284135afedd4fb586141869f44fe713b28416e1c4d1f02596141869f44fe713b28414f8b06da08596141bffd7955743b2841def1fd620d596141bffd7955743b2841e10536a712596141bffd7955743b284152bd920416596141bffd7955743b28416c7b57231b596141, 2),
(6, 'Sempusari', 'Desa Sempusari (Polygon)', 0xfeffffff0103000000010000008900000037f3cf1328302841f6eda55ff55861413695e78125312841c59c731bfa586141798472c3283228413dfc488ff8586141fc1de06e0d3328414d005378f9586141a02c6336bc332841d5a07d04fb586141751e9efc7635284157bb3eef0059614141e857b3383628414c35d54d055961418a6f191790362841a90a373707596141fa764ade813728414b72207d075961413a78a2a0dd3728412be8acf20a5961419368a6dd0738284173f64f220e596141c0d7c1bb703828415f6e610c125961411c6b5662bf38284104151bf6145961419527e5132e3928413f2139b1175961417c83dbaee2392841a4f81f0f1a5961410369646b713a2841d6c56d261a59614164b0dd00163b2841b9fc29f81a5961413c4c1c6a7d3b2841acfaa4831a5961413c4c1c6a7d3b2841923baf23125961419aa562807a3b28414ab9b97a00596141b9da2fce913b2841a859998ef6586141b9da2fce913b284154cbd0a2ed58614145d2850b793b284118439714e6586141a4e0290cf33a28417bedc4f6d2586141c6dba8c9b83a2841b9407cafce586141828e35f6b23a28410c983d51cb586141bd553f28bd3a28415d73e31fc358614142e4528cd13a28410d63bb7bbf586141f02d9ddff83a2841a88bd41dbd586141020b7cd96e3b2841176d094ab65861412a404927863b28411c30be1ab4586141a4b135c3713b2841357b6101ae586141a4b135c3713b284126fdc0b9a8586141d56c6cb2843b2841815607d0a5586141ce032ad9b13b284129445ab7a15861411a519dacb73b2841ef373cfc9e586141ea9566bda43b2841619d5555935861410528a3a1973b2841070f8d698a586141fca139009c3b2841201de52082586141a7ce5c8b9a3b284151ab62947f586141b371edf4be3b2841b9c9e2ef7a586141291155de043c28416f7c6f1c755861410e7f18fa113c28412d6eccec71586141f9551eeff13b28418188425f6c586141ce032ad9b13b2841faefe02c61586141768dbcfa8b3b284176964f9e58586141d8b887c32e3b2841cb7b433b4758614118636a2d103b2841566307c5415861410edd008c143b284166f3be3434586141b083ba75173b28419b813ca831586141ffed5411463b2841216900322c586141b9da2fce913b2841407758e92358614169bb3748e63b2841a15608a11c586141ea667274233c28415c0995cd16586141291155de043c2841ea2f29fb135861411a519dacb73b28413b0bcfc90b586141f9841238733b28417f213b5305586141fcd02d491d3b2841c57677800158614165855f526c3a284180ecb87df95761411d840790103a28410495ac63f1576141ac988495203a2841a5807ad6ec5761418de920e9043a284101a53e17de576141935263c2d73928416884eeced6576141a024e8747d39284107b7553fcb5761419aea99e42b392841f5363083c55761411ac5c859ea3828416d9605f7c3576141027fa786a13828416d9605f7c3576141b9f7e5224a3828413506030fc657614142587e39043828410c7a0a10c95761419ec391d059372841357a5588d4576141f079477d3237284105ecd714d75761411492ed0221372841b2d161a2dc5761417cf7065c153728419986bebbe257614142b666cb0637284115decad5ea5761411175c63af8362841275ef091f05761415b2b7ce7d036284179ade8d9f657614130531e30953628411e54a2c3f95761413f42caaa633628415d23754ffa576141a16d9573063628413358acacfa5761417f1ba15dc6352841f388d920fa576141097c397480352841b97cbb65f757614140a0b23c6635284114d6017cf45761416d3ec26350352841369f45aaf35761413a6664ac14352841e384cf37f957614149551027e3342841609f9022ff57614161ca2543ad3428411c8924990558614112608ba77e342841bde844850f58614180a87d384a342841c1e07b2b19586141ca5e33e5223428419bd09eff2058614171e8c506fd33284135f1ee4728586141227e2b6bce33284114a4c6ec2d586141dc99fa709b332841e35294a832586141b1c19cb95f3328410398f3a93658614104febb0734332841f5d2b964385861413e6e50e1c3322841f74ed5373d586141ece68e7d6c322841d7c461ad405861415c7b9c1fe2312841d9407d8045586141d02cd18980312841bdb609f648586141ef0a297f1d3128410dc7319a4c5861415136f447c0302841240a0c2750586141da1023bd7e302841c1ae409c52586141b84498483a302841c32a5c6f575861410275e45317302841c0a677425c586141da3f1706003028417a513b15605861415db103a2eb2f2841864bf72f6a586141357c3654d42f28415276e0be73586141e92ec380ce2f284179fa0f647a586141c2f9f532b72f2841917a352080586141424ebb067a2f28418770e751895861419d1044f6492f2841024cd8988c586141669555d5e92e28413c58f6538f5861419de8c2e6502e284113ccfd5492586141099af750ef2d28419b6c28e1935861416d8b7489402d284195e6be3f985861414973ce03522d284125896e409a586141672232b06d2d2841a02714589b586141f053d67da62d284152d052b69e586141f370fd45cf2d28417fdaebfca0586141122061f2ea2d28418e588c44a658614142db97e1fd2d2841750de95dac5861416a10652f152e2841e223a05fb158614133eceb662f2e284126711333b75861418bdcefa3592e284158b8f7a8bb586141977f800d7e2e2841c591637bbe586141516c5bcac92e28412a694ad9c05861417cbe4fe0092f2841b2097565c258614163493ac43f2f2841827bf7f1c45861418e21987b7b2f284104596dadc8586141738f5b97882f2841b6c460dcc9586141b65665c9922f2841109074f7d458614188b855a2a82f2841e97f97cbdc586141d405c975ae2f28410b4112a0e5586141b9738c91bb2f2841c72aa616ec586141fc3a96c3c52f284124000800ee586141ff57bd8bee2f2841d1a8465ef1586141443cee8521302841be205848f558614137f3cf1328302841f6eda55ff5586141, 3),
(5, 'Desa Mangli', 'Desa Mangli', 0xfeffffff010300000001000000f700000043040a5969242841813eb470c2586141c9c4c4f9b224284167e37642c55861412cdd55f9f8242841adaf4721c55861412c7227155e252841d6a9f4abc35861410a5fcf8fbf252841903c43f4c1586141786304b53326284119ffde64bf58614157d9c5099126284198c3eb51bd586141e41067d0de26284153563a9abb5861418c794b122c2728419cb64f14ba586141fbf68f837e272841eb16658eb858614170ebba1ad52728411bda7b28b6586141853ae98b352828417103fbb1b358614112728a52832828416e2df564b158614119f751e0ca282841a55a56e7af586141190533480e292841cb1fdefdad586141b7186ea66c2928410e16a98fab5861417cb29563b92928417aa70185a95861415b2857b8162a2841f636e9fda6586141aefb48628b2a2841c29030d9a35861413f21b774e12a284166bba5b5a1586141d0462587372b2841834b08589f586141849badeeb22b28417a0bb8229c5861410007bfab0d2c2841889d8b419a58614190a313e4672c28410a97bda2985861412840681cc22c284146c41e25975861412a5072aadf2c2841edc4994e975861411782b97a122d2841ae62135898586141818a40ec3a2d28419131d0dc98586141819821547e2d284149f9439997586141f08e7511af2d284182f17fa795586141756bf2817f2e28412ab0391f925861417587b451062f2841573e2b458f586141cf4a9c6d5d2f2841ad67aace8c58614193e4c32aaa2f2841cc146be6845861413d4fd192d12f2841ab5fa5077e58614149b48404de2f2841726c007074586141dfb9defaf82f284104811fca6c586141725a857f073028416efab0c064586141f68345de113028417d4ac32d5f58614119b35f3337302841d766a67959586141e15ebaa47b302841a5eae70754586141c3392f6be53028412f0ca39f4f586141b302717d573128412c95bc794b586141ffd78b4da6312841eabb4f5d48586141c028c2686d322841396ee8c04158614141099125f232284107f2294f3c5861411c6d1fc657332841dbdfb5c5375861415ddd86249a332841259fea6634586141189b144ad6332841fa8c76dd2f5861413c534879f7332841377816ae2a586141e3ab222d27342841be22eb1f2258614118b7d6195d3428413f6375a9185861413c6f0a497e342841124465e2105861415f9e249ea334284136f125fa085861414302b33e09352841298c7288fc5761410e13c1215a35284171d4c003f557614176844d51433528419e62b229f2576141d290260f203528412c77d183ea5761413514e6f200352841e7267e41e357614186bb0b3fd1342841831ccea9e05761413ae6f06e82342841d9454d33de57614174c3afd7393428416474a408dd57614113ad47fecd332841d9454d33de5761411c6d1fc657332841e5af971bdf576141e3739e8d193328415417f65ddf5761414be52abd023328416adeeef0dd576141c0448438f4322841ef0c46c6dc576141a7f1037bdf3228413fcc7a67d95761410cfedc38bc3228413c559441d5576141746f6968a5322841570ff196d057614138edce556b32284126fd7c0dcc576141ec17b4851c3228410755536cc8576141a04299b5cd3128415114880dc5576141b97957a35b31284190760e04c4576141d515c902f630284105de6c46c4576141dfd5a0ca7f30284186196059c6576141b3caecdd49302841f580be9bc6576141e142f8d4f42f284112b20117c6576141200e8489b42f28415114880dc5576141e48be9767a2f284186196059c6576141cdc18293612f2841365a2bb8c9576141d43869b9652f2841626c9f41ce576141772c90fb882f2841927e13cbd2576141a1d29076b22f2841559373fad7576141d4542b89ec2f28414143618ddd576141f195789209302841a54d1125e0576141f68345de11302841b42e4233e5576141725a857f073028418d0a9bf5e85761413d4fd192d12f2841434b6654ec57614102cd3680972f2841a25516ecee576141470fa95a5b2f284163f38ff5ef5761411e69a8df312f284111bd742eef5761416cab1abaf52e2841434b6654ec576141af6473babd2e28411ea33cb3e85761410295b2e0892e28418b93b4cfe4576141d9eeb165602e2841881ccea9e0576141231ff18b2c2e28413bd916a5dc57614117ba3d1a202e2841d0641c25d9576141e9257053ee2d284182216520d5576141c6f655fec82d2841d2e099c1d157614119279524952d2841ef11dd3cd15761416aceba70652d2841a9450c5ed157614135c306842f2d2841eb1e797ad457614105a61fe3012d2841d7ce660dda5761416fa0c5ece62c284137e6b2e2df5761413f83de4bb92c28412396a075e55761411c54c4f6932c2841579b78c1e6576141eebff62f622c28417b360625e7576141c6a20f8f342c284174ccbb3ce65761412126cf72152c28415b8edc83e3576141968528ee062c28414dadab75de57614115c11b01092c2841fdf20d4bd6576141a961c285172c284118ad6aa0d15761413f671c7c322c2841c3ff68b3cc576141e9d129e4592c28416f5267c6c75761411766f7aa8b2c2841f209d875c2576141a2069e2f9a2c28415ffa4f92be57614123cbaa1c982c28415c83696cba5761418dc550267d2c28417da710aab6576141c6a20f8f342c284158ffe608b357614192975ba2fe2b2841d7c3f3f5b0576141e72c4e3ad72b284110bc2f04af576141b2219a4da12b2841c27878ffaa576141fedaf24d692b2841c00192d9a6576141510b3274352b2841dbbbee2ea257614184710ab7e82a28410c3d44179c576141c33c966ba82a284172c3714b975761419b1fafca7a2a2841f0877e3895576141d5fc6d33322a284136544f17955761411a3fe00df62928414928e4e796576141d5e0ab63ab292841ef0b019c9c576141219a046473292841abb616e3a0576141ec8e50773d292841ae2dfd08a5576141b10cb66403292841c00192d9a657614189efcec3d52828417a35c1faa6576141e6fba781b2282841c00192d9a657614147f64d8b97282841162b1163a45761410dfdcc525928284103577c92a2576141bab0cb5c0628284101e0956c9e5761418c1cfe95d42728418d78372a9e576141cd70a324902728415980fb1ba05761410b3c2fd94f272841a7c3b220a4576141402b21f6fe262841bc0e2e17aa5761410da986e3c42628418f803cf1ac57614145fd2b7280262841a154d1c1ae5761410b04ab3942262841d54c0dd0ac57614151461d1406262841413d85eca85761411c3b6927d025284195ef1d50a2576141d0654e5781252841966b9bec9a576141210d74a351252841888a6ade95576141ec01c0b61b2528419cda7c4b9057614196500b4fbc24284179aed046855761415ace703c8224284188fee2b37f5761419634497f352428419c4ef5207a5761416d8e48040c242841fee1be92785761411ccb60e8b423284114a9b72577576141b7a2c55a51232841a04159e37657614177325efc0e232841acaba3cb77576141c9629d22db222841d7bd17557c5761419945b681ad222841fc6541f67f5761416bb1e8ba7b222841bc03bbff80576141e5fe0e8275222841bc03bbff80576141e5fe0e82752228412778b57f845761417b04697890222841e422cbc6885761410d1cf622a32228415501102f8d576141082e29d79a2228412480ba469357614103405c8b9222284126f7a06c975761410fa50ffd9e2228412e6e87929b5761419457e935a522284160ea4504a157614101b742b1962228413fc69ec6a457614189f235c498222841413d85eca85761411393dc48a722284195ea86d9ad5761411393dc48a7222841005f8159b15761417b046978902228412507abfab4576141f7daa81986222841f878b9d4b7576141827b4f9e942228416957fe3cbc57614101b742b196222841d4cbf8bcbf576141b00f1d65c6222841a0d3bcaec15761416d56c464fe222841c57be64fc5576141724491b006232841248696e7c7576141724491b006232841abc189fac9576141fe6d510f112328413ed111decd576141219d6b643623284101e6710dd3576141be19ac8055232841cafad13cd857614178d739a6912328410bd43e59db57614143e84789e2232841fb7690aedd576141e55255f109242841d2db024bdd57614189467c332d24284149ba47b3e1576141ab7596885224284106655dfae55761414a7bf07e6d2428412a0d879be95761415c578a167e2428416ce6f3b7ec576141f35ce40c99242841ddc43820f15761411715183cba242841f60218d9f3576141c4e4d815ee2428413edc84f5f6576141510e9974f82428415d84ae96fa57614156fc65c000252841e63688cf00586141f278a6dc1f252841900d0946035861413e4ec1ac6e252841bf12e191045861410be8e869bb252841a2e19d1605586141ad52f6d1e22528418c1aa58306586141e4e6c39814262841202a2d670a5861410b04ab39422628418a9e27e70d5861419d1b38e454262841cc77940311586141d226ecd08a26284137ec8e831458614100bbb997bc26284160871ce714586141402b21f6fe2628418f8cf43216586141a89cad25e8262841066b399b1a5861419fc0138ed7262841cd72fd8c1c5861410b206d09c9262841f21a272e20586141935b601ccb26284116c350cf235861411785207bd5262841cc031c2e275861410732a0bdc026284121b11d1b2c586141682c46c7a5262841cb879e912e586141d614b91c9326284101f7c0c530586141cbaf05ab862628410d610bae31586141a3921e0a592628412a924e2931586141e9d490e41c262841fd035d033458614105710244b725284186b6363c3a586141f401c0b61b2528414b427d91435861419b3ed89ac42428413cf26a2449586141d51b97037c242841ff06cb534e5861413a2870c158242841e54c6efe5258614110826f462f2428419d0420835a5861417de1c8c1202428412d2144a46158614194ab2fa539242841232ee0e164586141bfda49fa5e24284114decd746a586141f35ce40c99242841698bcf616f586141a6a38b0cd1242841da6914ca735861414a97b24ef4242841380a7a79755861410a430dc038252841bfafb774785861413a60f460662528418cb77b667a586141dbca01c98d2528413cf846c57d586141dd531ba389252841a76c4145815861413e4ec1ac6e2528417474053783586141917e00d33a2528411e4b86ad855861419dc7f174c02428417862d2828b5861415c578a167e24284118dca44e9058614143040a59692428416c89a63b95586141d7a4b0dd772428413ffbb4159858614186fd8a91a7242841e5ded1c99d5861419dc7f174c0242841d8f80945a45861410a274bf0b12428412ca60b32a958614168bc3d888a24284188caf344b25861414f69bdca752428411e51624eba5861413f163d0d61242841abf69f49bd5861413f163d0d6124284145707215c258614143040a5969242841813eb470c2586141, 4),
(2, 'Kebon Agung', 'Desa kebon agung(polygon)', 0xfeffffff010300000001000000c500000093298e4e093f28410fbf758a635b61419d8d46140c3f28410fbf758a635b614135767acd273f2841b9bbf3e65f5b61415ca2a31e303f2841e0924c395b5b614113f88684803f2841fa1e5b77545b6141efd4541aaa3f28411fdd45184f5b614162f51748c03f2841b85c9dfd475b6141336e2d18e73f2841d9011aed415b61418b6bbedb26402841b607cdfe3a5b61414a801be64a402841413cdacf315b61419819f4e3874028418ab8af11275b61419819f4e38740284111bbe07f1c5b61417b51835882402841fc244c57185b614111f039cf3f4028415c502473125b61418107061624402841c1add8f10d5b61413bc9eef6b73f2841c48ae455025b614101390de0ac3f284102d5dd34f65a6141a2e0ba3d9c3f284112fd33adec5a6141dd15db75d63f28418cb41a07e05a6141af8ef045fd3f28414e2439f0d45a6141078c81093d4028419cd2ea94cb5a6141e40d8ec095402841665b772fc15a6141759b009be0402841fdc16063b95a6141a322ebcab9402841dbe08126b35a61417b51835882402841e608d89ea95a61412eb8aa5a45402841d1724376a55a614192c67fbaf73f2841bddcae4da15a6141e91ed25c0840284110bd3c55995a614122afb373134028416fe81471935a614111f039cf3f4028415b5280488f5a6141623748d5dd4028415e2f8cac835a6141a21a9e1579412841e0ffe0b7775a61415115c09cf8412841a26fffa06c5a6141728b66305f422841dea08ace5f5a61410a749ae97a422841bcbfab91595a61414f0d73e7b742284167bc29ee555a6141222bc7d80d432841c90070bb505a61412c8f7f9e104328411daf2160475a6141218688b7de42284184254490435a61414b5f3ddf56422841ec698a5d3e5a6141d6993b90114228411341e3af395a6141f361ac1b174228410e0581622d5a61412df28d3222422841daa67bae235a6141c5dac1eb3d4228413ad253ca1d5a61410010e223784228413daf5f2e125a6141157d91d0ac422841b170cc72105a6141389876854243284169b894e30e5a61417ed68da4ae4328412919cb050e5a614188d737d69f442841626d4acf0c5a61411a0ae9d11945284150f02358095a6141e016f926fd4528411fab8c55005a6141c0a1fcc487462841b5117689f85961410332dedb92462841c2523ab3ef5961417652a109a946284168e1795fde5961414d81399771462841bbc10767d6596141c6577f82294628414f0f83e9cd596141d9bb37482c462841571e6bb0c3596141dd696d508d462841affef8b7bb596141a4d98b398246284181d2cf66b35961415d9b741a16462841fa89b6c0a6596141a43c9acd9345284177282f69995961416cb4056cc9442841fe2a60d78e59614130daa612604428410d8592b286596141842902ce3e442841e98a45c47f596141a502b7f5b6432841b945aec17659614104be172cd942284126806ea466596141c5dac1eb3d422841e3bdb02a5a596141834ae0d432422841077c9bcb54596141279f1909924128413662dce44559614140b9548c36412841051d45e23c59614178a4f78112412841a1b50a79365961416dfe0e2ff23f28411d90e56e35596141c55eae86433f28418f38e40133596141b5a78197b03e2841fec774e32f596141fc48a74a2e3e28416b3e97132c59614158577caae03d28419c47ccc828596141989de07e8d3d28414e8f943927596141cd1454e4973d2841188466e42e5961417171b72d853d284156e464383459614147fb109a1e3d2841f6b88c1c3a596141d4da4d6c083d2841530759d43f596141d3350f4bd93c28417c01a6c246596141434ddb91bd3c284114bd5ff54b59614199a52d34ce3c28414502f7f7545961410cc6f061e43c2841f22169f05c5961413cf219b3ec3c2841aaa593ae67596141d3350f4bd93c28414a7abb926d5961411421b240b53c2841f9b29b3c7659614171d4c5c1963c2841a9eb7be67e596141702f87a0673c284172eccc1b8d59614183933f666a3c28410d8f189d9159614130e922ccba3c2841fb4d54739a59614159ba8a3ef23c2841e6f32198a25961411f2aa927e73c284181d2cf66b3596141b66d9ebfd33c2841d6d5510ab75961417b387e87993c2841300bb010bc5961417b387e87993c2841c17b1f2fbf59614101bdf97ab23c2841c8c66943c1596141f75841b5af3c2841f2c0b631c859614153671615623c28414cf61438cd59614166cbceda643c2841b8a899b5d5596141d9eb91087b3c2841cd3e2eded959614101bdf97ab23c2841b3b21fa0e0596141c27695a6053d284189c2589ce4596141d3d200b7c73d284149556b21e559614151fcbacb0f3e284153874784e6596141e9e4ee842b3e28412a978080ea5961416505b2b2413e284184ccde86ef5961418c31db034a3e2841361e2de2f859614106ad5f10313e2841c4752e4ffb596141479802060d3e2841d6f254c6fe596141479802060d3e2841b2346a25045a6141fba36829ff3d2841faeca1b4055a614113bea3aca33d28410c6ac82b095a614149a04fbb4d3d2841d84725c50b5a614123d8de2f483d28413b96f17c115a614170cc780c563d2841bebb1687125a6141257d1d51773d2841ce1fcf4c155a61411219658b743d284128552d531a5a61411974266a453d284185a3f90a205a6141a5ae241b003d284128918fa0265a61417b387e87993c2841d7c96f4a2f5a6141bdc85f9ea43c2841cfba8783395a614160154c1dc33c28412af0e5893e5a61414db19357c03c28417cdaf97b415a6141f75841b5af3c28419389fc55465a61413cf219b3ec3c284124fa6b74495a61412b33a00e193d2841f6d7c80d4c5a6141d4da4d6c083d2841553f0377525a6141b66d9ebfd33c2841cc2364575c5a6141da90d029aa3c2841ac975519635a6141eaaa0bad4e3c284190f2d829695a61412b96aea22a3c28412dae925c6e5a61419bad7ae90e3c28418d15cdc5745a614190a48302dd3b2841b10f1ab47b5a6141ff161128923b284178bb9aea7c5a614195282a5d7d3b2841ffc751437d5a61413702b41d6e3b28417ded764d7e5a6141965a06c07e3b28418c512f13815a614125433a799a3b284125db0ce3845a614183f64dfa7b3b284172c520d5875a61412bf9bc363c3b2841ef9ffbca865a6141032855c4043b2841e7868d19865a61419a6b4a5cf13a2841ae320e50875a6141d4fb2b73fc3a2841b05502ec925a6141032855c4043b284139ad0359955a6141e804235a2e3b2841a02dac739c5a614179929534793b2841037c782ba25a6141fd71d206633b28410ac7c23fa45a614105cd93e5333b2841e1d6fb3ba85a614105cd93e5333b2841f03ab401ab5a6141e1a9617b5d3b2841f35322b3ab5a6141a163fda6b03b28413b0c5a42ad5a6141c9346519e83b2841c9635bafaf5a6141d3981ddfea3b28414fa2ee6ab15a6141314c3160cc3b2841985a26fab25a614179929534793b2841dbe08126b35a61410f314cab363b2841a07394abb35a6141e65fe438ff3a2841afd74c71b65a6141032855c4043b28417bb5a90ab95a6141a1c60b3bc23a284154de50b8bd5a61411a9d51267a3a284159102d1bbf5a61414476064ef23928416974e5e0c15a6141ab5bf631d539284135206617c35a6141563580f2c5392841fae454ffc45a6141a2291acfd339284144b6fa3fc75a61412053d4e31b3a2841f4eedae9cf5a6141b93b089d373a28414c0bcb3ed45a6141890fdf4b2f3a284116d0b926d65a614174a22f9ffa392841a95997f6d95a61410be62437e7392841b8bd4fbcdc5a6141f8816c71e4392841ae95f943e65a6141b796c97b083a2841f9669f84e85a61416791eb02883a2841abb8eddff15a614155d2715eb43a284102d5dd34f65a614185fe9aafbc3a2841965ebb04fa5a6141436eb998b13a28416a55864ffd5a61419518d632613a284181048929025b6141ac8dd294d6392841b249202c0b5b61418a72eddf4039284171e6b89b165b61412f6c6535cf382841a75d2c01215b614139d01dfbd138284137ce9b1f245b61419028709de2382841494bc296275b6141b99e163149392841a480209d2c5b6141d1554320dc392841c02f2377315b6141c444ff83693a2841973f5c73355b614120f0c54f0a3b2841706803213a5b6141ecb258628f3b2841050b4fa23e5b61413efa66682d3c28415d273ff7425b614160154c1dc33c2841b85c9dfd475b6141e4917a5b9b3d2841d93d7c3a4e5b6141c3b8c533233e284172c7590a525b614169b3e7baa23e2841ccfcb710575b6141d3143144e53e2841a83ecd6f5c5b6141fa405a95ed3e284138af3c8e5f5b614134d13bacf83e2841c6063efb615b614193298e4e093f28410fbf758a635b6141, 5),
(1, 'Desa Jember Kidul', 'Desa jember_kidul(polygon)', 0xfeffffff010300000001000000b4000000f5afcbe8084d284170e8b30483596141040080e3094d28416f720a2483596141ae024fe5384d28416da308f582596141ec168b4d844d2841552bfa7c815961414f6cdd4be34d28413bd03c977f59614178b41b3c744e2841ff36135e7b5961419cc99c4fcf4e2841d1014b5e7859614109cef5a71d4f2841b0c3de0a765961413142c91a674f28419668212574596141e87755f9cb4f284172e509c271596141f14bc076135028415714a3fb6f596141cd7169457b5028413db9e5156e596141ede53cb8c4502841278682ad6c596141e0193f400a512841192221746b596141cb4d41c84f5128410120bcdc6959614137529a209e512841e91d574568596141dcb3bb81bb512841cfc2995f66596141a456f378ec5128419f34791163596141f619363b27522841ba05e0d764596141c50c222d59522841d4eaf3dc66596141bf90d8af9f522841f08a5cd2685961410df5c812ec52284117dd75646b596141a8e93e5b3d5328413beae3e66d596141db0c1928765328414ed89b3f6f5961412dd05beab05328415cb2a659705961412e12b72bd4532841666457f670596141f0d1e540d053284146f5ecd16e596141c6401bb0bb5328410b5cc3986a596141ba4fb914a9532841d11bf2ad665961410e30f3f4ae5328419aaa22f262596141c6401bb0bb53284168c3a9555f5961412971098bc2532841160bcaf25959614147cf163fa1532841ddb64bc955596141e7fd7ac388532841b7dadb1753596141e7fd7ac388532841f1345452455961415edd6ff87e532841e0159e2844596141e2cabde6525328418e5dbec53e596141f43769ff1e532841421b8843395961411d457d0ded522841ee93a6b13359614167514c70ab5228417bff569d2b596141f09decbd6d52284114006793245961412c9c62674e522841dd0441b820596141726e438e76522841c84787301f59614194ff0d1f8b522841a77fc4bd1c596141d23fdf098f5228418286037a1a596141e28f93049052284110f2b3651259614185af59248a522841b05fc9e80b596141b7fec8737b5228414707819004596141ffeda0b86e5228410b6e5757005961413cec16624f522841cd19d92dfc586141d6377204025228415840de09f4586141eb03707cbc512841ef5d3f92ec586141693319acb3512841c36d22a2e95861410e032bd1ac51284194df0154e6586141c4d1f74a965128414e94277ee1586141bc3fe80e72512841dd6cddf6d9586141acadd8d24d5128416b4e37c3d15861416b7ca54c37512841044f47b9ca586141a41bc99629512841a78b5e6bc458614102ab09d11e5128415366797bbe58614188dab20016512841dcbd7c28b65861410a69ae8ffb502841d9ee7af9b5586141990503d8be502841d03cca5cb5586141b0135c919c502841ba7f10d5b358614131a2572082502841a44cad6cb258614131a25720825028417ad2395daf58614138f20b1b835028412806adbba95861412252a32581502841e858d643a5586141b23053af67502841c35f1500a3586141bffc5027225028419bb4a31fa05861418cd9765ae94f28417c318cbc9d58614183050cdda14f28414e861adc9a5861416b2348a67c4f28412896fdeb97586141485022d4444f2841b59fb13590586141935cf136034f28418a253e268d5861416789cb64cb4e284175f2dabd8b5861418ca57dd7864e2841627acc458a58614110517084374e28414c4769dd885861413f1c2951e24d284139e307a48758614194039490484d28411ffef39e85586141c72d9fbce14c2841008f897a8358614159e7ea22704c2841ce3167fd7f586141d400ce93fc4b28419be8f1be7c5861412abca350aa4b284196c097417c5861417dc872b3684b2841940543517c586141915215eaff4a2841cf14166b80586141887eaa6cb84a2841fdbf874b835861416f5a8bf46f4a28410019e099835861410ae841d8454a2841f8abda0c83586141d6820ccae949284194673ff37b586141632eff769a492841603b1b4778586141759baa8f664928414e30125c77586141fb63945ae24828414ceb664c775861413dde53817c48284170e42790795861414f4bff9948482841834889c97a586141ce5544a6e7472841834889c97a58614193a05a9d8a4728417c79879a7a586141e20b7c5f374728417a96d82c7a5861419048399dfc46284175822bee7958614113f42b4aad462841673277f3785861418baebc5b4b46284158e2c2f87758614180bd5ac0384628418d0ee7a47b586141c8ac32052c462841ba575ce37e58614151cd3dd035462841ec2a284182586141efdeaa36524628410c103c4684586141ce214b2385462841344504468758614146170617e64628415fabca168a5861410b5bebae28472841971c9ad28d58614167cd34cb52472841bf5162d2905861413e7ec57b61472841ec9ad71094586141785f4407774728411a5af62f97586141f22f9bd77f4728413edd0d939958614130706cc28347284191789c639f586141556089b286472841f8778c6da65861410621fd729247284102b49329a758614102c2aa13a447284123f2ff7ca9586141ab821ed4af4728416b0cdc81ae58614172e3fa89bd472841a4d6038cb25861411aa46e4ac9472841c61470dfb458614168085fad15482841fd0f96bab8586141009e82967848284145a01ba0bd586141fb63945ae24828418f754c95c2586141f188f87d3a492841d4c0266bc7586141b92b30756b49284104d99dd8ca5861415e8d51d6884928411e345bbecc586141632eff769a4928414cdfcc9ecf586141a45f32fdb04928419d35b05fd5586141a000e09dc2492841f39f405fdb5861410f223014dc4928415fc78ae6e2586141c0e2a3d4e74928419da55f2fe7586141ccd30570fa492841db833478eb586141b924ff150b4a28411eec5fe0ef5861419f2544c11a4a28415840de09f458614138960387254a28417b4d4c8cf658614112a6e696224a2841b0797038fa5861410d0539f6104a2841d6cb89cafc5861414d6201ffdf492841ef439842fe586141e8efb7e2b5492841fd1da35cff586141c51c92107e4928410be4003800596141e1384483394928411434b532015961414be57bdbf94828411c03b76101596141dcc32b65e04828411e5c0fb0015961410972ed13c04828415557358b055961418a00e9a2a54828417e02a76b0859614127d0fac79e482841bce07bb40c596141178046cd9d48284153e435ed16596141083092d29c482841c67885011f59614127d0fac79e4828411576107424596141a9a05198a74828412fbd201b265961416ca2dbeec6482841611a4398295961415e948235e9482841988b12542d5961415086297c0b492841c31933a2305961418d580aa333492841f3a753f033596141a9992039474928410e650d783559614118bb70af604928411cc96eb1365961415fcfac17ac4928412fa379cb375961413e124d04df4928413869d7a6385961413bf555e6134a28414474e09139596141b5c5acb61c4a2841557fe97c3a59614128464f8c244a284180f95c8c3d5961413437b127374a28419d231ca13f596141b3a8b598514a2841d494eb5c4359614108cb4aba7a4a28411711c40348596141ea6c3d069c4a284138d986764a5961413c3080c8d64a28416d7b54034e596141fcd2b7bf074b284185f3627b4f5961416c366377444b2841986b71f35059614112dadf19854b2841b764323753596141e66d79acc84b2841ec0600c456596141980258ea1b4c28412cb4d63b5b596141cb2532b7544c2841581a9d0c5e59614193c869ae854c2841803bb8cd605961412c392974904c284198c77384625961410edb1bc0b14c2841d6a548cd66596141071d7701d54c28411c67cc836b596141ed1dbcace44c284140743a066e596141f90e1e48f74c2841776f60e171596141f5afcbe8084d2841b5d78b497659614133f09cd30c4d2841ddf8a60a79596141f5afcbe8084d284170e8b30483596141, 6);

-- --------------------------------------------------------

--
-- Table structure for table `jalan`
--

CREATE TABLE `jalan` (
  `id` int(11) NOT NULL,
  `nama_jalan` varchar(30) NOT NULL,
  `layer` varchar(30) NOT NULL,
  `line` linestring NOT NULL,
  `feature_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jalan`
--

INSERT INTO `jalan` (`id`, `nama_jalan`, `layer`, `line`, `feature_id`) VALUES
(9, 'Jl.Kaca Piring', 'Desa jember_kidul(line)', 0xfeffffff010200000005000000cb605c99174d284155a1a35d8159614181548d36594d28413ae4e9d57f596141cfb87d99a54d284120ffd5d07d596141385e8492054e2841f5980f007b596141f1b0078f354e2841e4ef02b779596141, 1),
(14, 'Jl.Melati', 'Desa jember_kidul(line)', 0xfeffffff010200000009000000e1605394344e2841e4ef02b7795961418c3ebe720b4e2841011d3fd4725961418e5bb590d64d28416336d62d685961413edacd0fbf4d2841ff67e4f4605961415c38dbc39d4d284187d394e0585961417996e8777c4d284131f35a0053596141d1d574b7704d2841ee62d51a4e59614147730eab434d2841b936b16e4a59614131ae4192e94c28415506c39343596141, 2),
(18, 'Jl.Kenanga', 'Desa jember_kidul(line)', 0xfeffffff010200000009000000d67400d3344e28416392d8be79596141ac81ed88894e2841c66ceb537759614122c8a122fb4e28419f1ad2c1745961412b2f6187764f284179c8b82f72596141096c15c0585028412c24860b6d5961410507d7ac19512841f3595e0169596141460dba5b87512841cf4cf07e66596141484f159daa512841be2d3a5565596141f00f895db65128416c755af25f596141, 3),
(75, 'Jl.Bungur', 'Desa jember_kidul(line)', 0xfeffffff010200000005000000fbcfae6dcf522841ecec58746859614184ae5ef7b55228416a1c02a45f596141686d4861a25228412302269f5a596141826c03b692522841df0fa417565961412ac6b711235228414b5195ee4b596141, 4),
(73, 'Jl. 13', 'Desa jember_kidul(line)', 0xfeffffff010200000011000000e95c17a1b25328415a594e0b7059614112701763d1522841f176af93685961410785a17b0f52284196f8715562596141e9bfd462b55128416fa658c35f5961419e10d70da9502841fd9b5fce57596141b0836edac54f284198f5c71251596141a1d2e62e9a4e28411b391e81485961417ce8b5f2e74d2841cf0a953d43596141c402de0e844d2841a92e258c40596141173afd48eb4c28416a5050433c596141d9926cf96b4c284131862839385961417b091873c74b2841ee93a6b1335961414d1fe736154b2841a68d77eb2e596141291052d70a4a28412e6fd1b72659614155a7081c70492841f090fc6e225961416f3f040ce5482841b2b227261e596141825bb67ea0482841959c15501c596141, 5),
(10, 'Jl. 12', 'Desa jember_kidul(line)', 0xfeffffff010200000004000000ff5f3d58b75128416fa658c35f59614169733415f3512841b50bdae852596141e2d6dfcc2f5228413427d6d949596141a6d869234f522841c11cdde441596141, 6),
(59, 'Jl. 11', 'Desa jember_kidul(line)', 0xfeffffff01020000000d00000026ed6e05ef4a2841ca58e4a04259614165d65a96914b2841ca58e4a042596141dbdab3eedf4b2841e7f84c96445961413b81ff924f4c28410d5f13674759614122c49f7f824c284121391e81485961410a07406cb54c284121391e8148596141f8999453e94c2841d41e427c43596141e2f92b5ee74c28419ff21dd03f596141452a1a39ee4c28416a5050433c5961410c8bf6eefb4c2841145c69243659614141cbc7d9ff4c2841938b12542d5961417f0b99c4034d28414b85e38d28596141466c757a114d28412e5b247926596141, 7),
(65, 'Jl.Sultan Agung', 'Desa jember_kidul(line)', 0xfeffffff01020000000b0000004faafc99845328411cafc761485961410da419eb1653284104ad62ca46596141b88184c9ed522841f5d257b045596141cc9d363ca9522841d41e427c435961418f38012e4d522841bc1cdde44159614165ad22518951284182dc0bfa3d596141b20139a9bb502841524eebab3a5961414fd7368205502841284a217d37596141a350b1fd8f4f2841010cb529355961417c4989a3124f2841e0b99b973259614198653b16ce4e2841c3a389c130596141, 8),
(116, 'Jl.Gajah Mada 3', 'Desa jember_kidul(line)', 0xfeffffff010200000011000000a48d9593ce4e284147465fc930596141c0724f249c4e2841c5e834d1305961412d10e9176f4e2841b79880d62f596141632b56df1a4e2841982916b22d5961411c171a77cf4d2841826c5c2a2c5961417822a42e7e4d28415c90ec7829596141650cde6f134d28413116796926596141d608cac2d44c284115761074245961417a032cbf764c2841ec54f5b221596141ff1bca84f34b2841b21424c81d596141c1743935744b2841744afcbd195961412a4cc164dd4a284136e2d05515596141b1e815ada04a284114a46402135961413aa261132f4a2841e929f1f20f5961418f5d37d0dc492841c2eb849f0d59614149b6a6805d49284193d30d320a5961417d4d5dc5c24828414f6be2c905596141, 9),
(71, 'Jl.HOS Cokroaminoto', 'Desa jember_kidul(line)', 0xfeffffff010200000011000000a7b5ef10cf4e284147465fc930596141e6371c3df64e284165564a542a596141ef00245b084f2841500f3aad285961416a13d66c344f2841aba4a13226596141d9c77aca814f284187abe0ee23596141935c5908d54f28416b6d749b21596141d320e1751f502841536b0f04205961416224f5225e502841389aa83d1e59614159b7490a925028412c19f6711d5961414ceb4b92d7502841141791da1b596141fb8ec83418512841fabbd3f419596141450257fc51512841e243c57c185961411e379e2fa7512841beac00db1559614169aa2cf7e05128419f5143f513596141e95d8ca91e522841890a334e1259614157d0d5c548522841761c7bf5105961419943648d825228415cd56a4e0f596141, 10),
(53, 'Jl.Jayakalwang', 'Desa jember_kidul(line)', 0xfeffffff01020000000a0000008c083b99894c28417a95ce1822596141d198c07e8e4c28415885b6530e596141baf857898c4c2841cd8c050605596141f3977bd37e4c2841556e5fd2fc5861410d9736286f4c2841cfeb5765f3586141b9b6fc47694c284170cf16c9ec586141cf56653d6b4c28414e91aa75ea5861417db8869e884c284136199cfde85861414afc6b36cb4c284136199cfde858614130647046564d28413b2d493ce9586141, 11),
(42, 'Jl. 8', 'Desa jember_kidul(line)', 0xfeffffff010200000002000000baf857898c4c2841d98361b205596141fa1db3a7014e2841d90db8d105596141, 12),
(39, 'Jl.11', 'Desa jember_kidul(line)', 0xfeffffff01020000000200000028d84cbe824c284177981ee7fe58614182fc6231e84d2841745373d7fe586141, 13),
(35, 'Jl. 10', 'Desa jember_kidul(line)', 0xfeffffff010200000008000000b73246c5224c28414fa5b1281f5961417e93227b304c28414e49af970d5961418de3d675314c2841cf475af604596141d2735c5b364c284115addb1bf85861415ff3b9852e4c28419966db6aef58614144b2a3ef1a4c2841f1cdc127e4586141b2919824114c28414ebffe03d95861417d51c7390d4c28412c8192b0d6586141, 14),
(27, 'Jl.Jayanegara', 'Desa jember_kidul(line)', 0xfeffffff0102000000080000009d964832354a28416d4270db0f5961414557bcf2404a2841ae09eea20259614164f724e8424a284187412b3000596141d2d6191d394a284128113d55f95861412575f8bb1b4a284193dc844bef58614142d30570fa492841f0571847e458614158311324d94928412c8192b0d658614121afe6f7b1492841ad233b7ebc586141, 15),
(26, 'Jl. 9', 'Desa jember_kidul(line)', 0xfeffffff0102000000020000005bf724e8424a28418dcb814f0059614194338b70324c2841a0b939a801596141, 16),
(103, 'Jl.Kertajaya', 'Desa jember_kidul(line)', 0xfeffffff010200000005000000a2da24c5944b28419b1b364a0159614174ea07d5914b2841de3b0c60f4586141c3299414864b28413ba3f21ce95861413a0989497c4b2841a246e095de5861413a0989497c4b2841422a9ff9d7586141, 17),
(89, 'Jl.Kertabumi', 'Desa jember_kidul(line)', 0xfeffffff010200000011000000da016af4e14928416bc1639bda58614131665a572e4a284166adb65cda586141caabc945904a28415ab65ab0d95861417991a129f44a2841507a53f4d85861413a0989497c4b2841c487c9f1d758614164f6afdfd64b2841345094dfd6586141807921b70d4c2841b02368b8d6586141c223a860354c28412600e0e4d558614137e6a577604c2841fddec423d35861418c083b99894c2841ecbf0efad1586141cb8a67c5b04c2841ddf9b01ed15861413aacb73bca4c284177e613d6c9586141eef0e17e1c4d2841580100d1c758614181ba07f0c44d28411e37d8c6c3586141155fc93d154e2841fdf86b73c15861413a49fa79c74e2841bf1a972abd586141b2d109555c4f284185dac53fb9586141, 18),
(85, 'Jl.KH Siddiq', 'Desa jember_kidul(line)', 0xfeffffff010200000013000000600cdd81495228415d7fbc422059614173e633b3e1512841a95143f513596141f332d400a451284155400b440e5961417e70d6e9785128410e262f3f095961416edec6ad54512841cb33adb704596141bcdbf7ab25512841667968bdfd586141bef8eec9f050284106e77d40f758614145954312b4502841816476d3ed58614133c1d8946c502841e024b5dee2586141f65ba386105028410d9c7eabd45861410a7855f9cb4f28416151b4cbc85861419a14aa418f4f2841ee46bbd6c0586141b2d109555c4f284180dac53fb9586141fda6e0d52c4f28411d79d993b25861411205ee890b4f2841d1d4a66fad586141a1a142d2ce4e28414b529f02a4586141621f16a6a74e2841d8d1fc2c9c586141d8bcaf997a4e28416f030bf4945861412c9de979804e2841d5a6f86c8a586141, 19),
(80, 'Jl. 3', 'Desa jember_kidul(line)', 0xfeffffff0102000000020000003b2723f17b5228410e262f3f0959614162f2dbbd265228412ac697340b596141, 20),
(100, 'Jl. 7', 'Desa jember_kidul(line)', 0xfeffffff01020000000200000046d6294b6b522841ae09eea202596141abe1b3021a522841c61f007904596141, 21),
(106, 'Jl. 6', 'Desa jember_kidul(line)', 0xfeffffff0102000000020000006b856002b750284101d64d0aee58614109d33cf6a5512841b7ec6fd6e8586141, 22),
(102, 'Jl. 5', 'Desa jember_kidul(line)', 0xfeffffff0102000000020000002d40186cce4f2841e2aedec3c8586141f57a1bf617512841eced6288c0586141, 23),
(107, 'Jl. 4', 'Desa jember_kidul(line)', 0xfeffffff01020000000b000000016df299964f28417ef499c9c1586141f5817cb2d44e2841c1707270c658614192eace72524e2841e47de0f2c8586141fb281607374e2841f1eae57fc9586141c5a6e9da0f4e28417b25989ac158614122f4ced3e14d2841e9ab3481b75861414fa29082c14d28419d07025db2586141ea2f4766974d2841384dbd62ab586141ca4d832f724d2841ec94ddffa5586141e30ae3423f4d28418c02f3829f586141c545162ae54c2841d1f1cac792586141, 24),
(112, 'Jl. 1', 'Desa jember_kidul(line)', 0xfeffffff010200000003000000de0678e02a4f28419d07025db2586141f3fdc52f8e4e2841db6f2dc5b6586141e954ab89ef4d2841193a55cfba586141, 25),
(101, '-', 'Desa jember_kidul(line)', 0xfeffffff010200000002000000e9ec761c084f2841e086570cae586141b6fad8dac84d28412f84e27eb3586141, 26),
(113, '-', 'Desa jember_kidul(line)', 0xfeffffff01020000000e000000a828efaebd4e284125ecd831a1586141ba592b3ab74d28415f2caa1ca5586141b7d574b7704d28416c900b56a658614176cf9108034d2841806a1670a7586141aceafecfae4c284198802846a9586141e447c7d87d4c2841e4245b6aae58614113a58fe14c4c284157a5fd3fb6586141fbc2cbaa274c28417ef716d2b858614141593d447d4b28417d0bc410b9586141ab0b61508e4a28418c5b780bba586141125f32fdb0492841ad0f8e3fbc586141b51739b82f492841b2ad919dbc58614173115609c2482841b74b95fbbc586141a6cd70717f482841c173ef78bd586141, 27),
(108, '-', 'Desa jember_kidul(line)', 0xfeffffff0102000000020000001342d21f4a4e28413fbd3ff8a25861411d8a1915be4d28416882582894586141, 28),
(114, 'Jl.Kyai Mojo', 'Desa jember_kidul(line)', 0xfeffffff01020000000200000064c1a10ec1482841ee320e98c05861415471ed13c0482841b990400bbd586141, 29),
(115, 'Jl.Mangkubumi', 'Desa jember_kidul(line)', 0xfeffffff01020000001200000060994791c0482841b990400bbd5861411cd2c9c9cd48284166f5b13ab7586141feaab4f7dc482841143dd2d7b1586141433b3adde1482841eb9160f7ae586141b11a2f12d8482841b7653c4bab586141c4c9356cc74828416fd5b665a6586141dec8f0c0b74828413695e57aa25861418ae8b6e0b148284114e1cf46a05861418405aefe7c482841e452aff89c586141f4019a513e482841b27fe39a99586141dfcedc74084828417dc968cf9558614135cc0d73d947284136af8cca90586141a269a766ac472841ebd95bd58b5861412ea7a94f81472841c756447289586141e7926de735472841ad85ddab875861417d7f762afa46284197c82324865861416ced66eed5462841922a20c6855861414f289ad57b4628419eabd29186586141, 30),
(2, 'Jl.Arowana', 'Desa kebon agung(line)', 0xfeffffff0102000000110000009b40b33b45462841f6fda782ad596141a6856dde0045284115d09ef8bd596141232c710aff43284167f61438cd596141b59ae5c102432841aab8d2b1d9596141eb3b0b758042284157d844aae1596141f3fa8419544228412de87da6e55961411f38f206cf41284154fb3846ed596141567e56db7b41284170aa3b20f259614179bbc3c8f64028419cbdf6bff95961411674b5c2584028414cf6d669025a614138b122b0d33f2841b68fed350a5a6141063b7c1c6d3f2841a94e290c135a6141f8a68197b03e28416d1d9ede1f5a614183fbbacb0f3e284127885aeb295a6141fa2cc295983d284186ef9454305a614101a2bef70d3d2841b20250f4375a614167144c1dc33c2841c47f766b3b5a6141, 31),
(46, 'Jl. 2', 'Desa kebon agung(line)', 0xfeffffff010200000005000000dd1a73aef141284169731c48eb5961412327ae6a5c422841da25a1c5f3596141134ef942e4422841b1538be8fd596141b7b286a15f432841c0d5f4d4065a614164a4b141ad432841c0f3a5fb0c5a6141, 32),
(8, '-', 'Desa kebon agung(line)', 0xfeffffff0102000000150000008c2d972e113e2841de01ffbe295a614109f3987d563e2841e024f35a355a614172afa3e5693e2841b94d9a083a5a6141ff8ee0b7533e2841bbf2d829695a6141539db517063e284182a8df4a755a61413c4a41ee753d28418e3912978e5a6141e6b068f0383d2841de461a259d5a614114385320123d2841a2158ff7a95a6141f6caa373dd3c2841dd8c025db45a6141e2c1ac8cab3c28411e365225c05a61413775c00d8d3c284104aa43e7c65a6141478ffb90313c2841445393afd25a6141aea6c7d7153c2841a3bacd18d95a61416c16e6c00a3c2841ad3292b3f15a6141ad0189b6e63b284193a68375f85a61417c302144af3b2841555c8a96045b6141ed06672f673b28414f6610810f5b6141c5f47861033b284154a272ce1b5b6141a5e28a939f3a28419a7d9ef9285b61415849b295623a2841c377ebe72f5b6141dc28ef674c3a2841d70d8010345b6141, 33),
(77, '-', 'Desa kebon agung(line)', 0xfeffffff0102000000170000001c777d51873a28413eb72c0ef05a61415fac9d89c13a284108d45431ee5a61416b28f72e213b28415deb0111ed5a6141aa44a9b55a3b2841d7ac6e55eb5a6141065ba82a9b3b28419bc99678e95a61419e43dce3b63b2841552acd9ae85a6141e7916acdf13b2841ba7356dde85a614188ac7ae90e3c2841d7ac6e55eb5a614194b571d0403c2841e610271bee5a6141308537d85b3c2841fd176330ef5a6141ef9994e27f3c28410d063194ef5a6141fbe31125de3c284117380df7f05a6141daf0217ac13d28411a517ba8f15a614169a779d0db3d28412ccea11ff55a6141e5c73cfef13d284111604408025b61411f581e15fd3d2841f5bac718085b614132eeb23d013e2841eab022c7175b6141a4dc9908163e2841bee2e2421c5b6141e66c7b1f213e284118fbfc3e265b61413393f15e303e284137c36dca2b5b6141353830805f3e2841f4469888365b6141f2e8d4c4803e284163128bb73f5b6141067f69ed843e28411a0b33bb415b6141, 34),
(15, '-', 'Desa kebon agung(line)', 0xfeffffff0102000000120000000166fb3b843e28418c291cb0415b614146f7a924333e2841cf573ea1455b614117cb80d32a3e2841ee01fe05455b6141cad6e6f61c3e2841535fb284405b6141ae0e766b173e2841c507b1173e5b6141b528b1eebb3d284168b9e45f385b6141c373fb02be3d28413fbf9771315b614117cb80d32a3e284101393c45315b61410467c80d283e2841e489396b2c5b6141ff4d5a5c273e28414e8fb4ae2b5b6141cad6e6f61c3e28419fea6f8d2b5b6141bdb54e308e3d2841616414612b5b614192a29390863d284185ac14a0235b61415386e1094d3d284128060fad215b61415db8bd6c4e3d2841bc538a2f195b61415db8bd6c4e3d284176b4c051185b6141bc42ec71603d284176b4c051185b61413b208fa0023e2841e8d2a946185b6141, 35),
(4, 'Jl.Udang Windu', 'Desa mangli (Line)', 0xfeffffff010200000003000000e2d82c65b42e284174104f999058614107837f2c922e28413a1daa0187586141cbd641e28d2d2841d1ca5c174c586141, 36),
(6, '-', 'Desa mangli (Line)', 0xfeffffff01020000000800000086be723f942e2841e4f32a7889586141301b9f3f782e2841535b89ba895861411e3f05a8672e2841d989e08f88586141f978f010032e2841832337cb7b586141ada3d540b42d28417d28ce41705861417f0f087a822d28415392d75464586141517b3ab3502d284130662b50595861413828baf53b2d28416adae4fa4f586141, 37),
(11, '-', 'Desa mangli (Line)', 0xfeffffff0102000000160000002cf917c97f25284112405bec8258614194788560ac252841f1cc56bf7f586141b7a79fb5d1252841c285bdc17a58614121e8aac6072728417484c76e7a586141735e4ff4242828412a83d11b7a5861419d04506f4e2828411be461bf78586141b4ceb652672828412b41106a765861410096f0ba72282841c8f49e20705861415539c4ba8e282841438486996d586141ad65b194a62828411be9f8356d586141efa497d4352a2841aab6bf676d586141bc3ebf91822a2841a017500b6c5861419e193458ec2a284165a82dd769586141498441c0132b2841ca701cbd68586141c8cd153b592b28417b6f266a685861411f08e47cb42b28412d6e30176858614114b11173eb2b28414c6a4e1e67586141891e4c56202c2841d702f0db66586141a77b5b2fc42c28413ccbdec16558614115809054382d2841bb8febae6358614156f0f7b27a2d2841f7bc4c3162586141f9f1ff5ce12d2841b91805895f586141, 38),
(19, '-', 'Desa mangli (Line)', 0xfeffffff01020000000300000036e02bc8102c2841d4cdca676658614114b11173eb2b2841b25f5db1575861416ba57aadf52a284168a028105b586141, 39),
(88, '-', 'Desa mangli (Line)', 0xfeffffff01020000000600000068b3367bc7262841717b7d7d2b58614169f2bd9b2f2a284127f972173e5861416bebdfb4462c2841792af7674a586141c4020e40322e28417086f094545861414796990e7d2f284151d92f7d5c586141d252026312302841d64948045f586141, 40),
(55, '-', 'Desa mangli (Line)', 0xfeffffff01020000000e000000f9cac325da262841ee86e29221586141b2ff37711a27284104909cd72358614145bca0c5af2728412838c67827586141736c305c682828416d4658092b58614119f751e0ca282841834f124e2d586141dd9e5a055b292841a5c2167b30586141cd679c17cd292841a1cfb2b83358614147d184ae4d2a2841ffd9625036586141df7bba4eeb2a284176b8a7b83a586141ec85496a7a2b2841c4fb5ebd3e586141dc4e8b7cec2b2841743c2a1c4258614156b873136d2c284101e267174558614163320b6e172f28410554b7c65458614171585c592d3028418e0691ff5a586141, 41),
(50, '-', 'Desa mangli (Line)', 0xfeffffff010200000009000000743145bc972d284172c543f63d5861416f5f3a40162e28415bfe4a633f586141e2357ae10b2e2841531883de455861410cf83c2cbc2e2841268a91b848586141175df09dc82e2841cb7245e34258614130cc322b642f2841d6cff38d40586141c6d18c217f2f2841f9fb9f924b5861411e281d3361302841529c05424d586141cf0911c18c302841201bb05953586141, 42),
(61, '-', 'Desa mangli (Line)', 0xfeffffff01020000000900000072f43562952d2841240ef8d64b586141ed415c298f2d28412440affa31586141e6ca75038b2d284187425acb25586141a17a22c1832d2841eb7ec1860e586141775b12fa7b2d2841edcdd61fef5761410485d258862d28413b806f83e8576141e3ecb245a02d2841965a911ddf57614187e0d987c32d2841ae9d074dd657614192458df9cf2d28411b8e7f69d2576141, 43),
(68, '-', 'Desa mangli (Line)', 0xfeffffff01020000001a00000022afd4af772c28411fc10b6445586141164a213e6b2c28419848ee1534586141bf1d3464532c2841d1f1cc342b586141f291ed0e4a2c2841eee04efe265861415a037a3e332c28416f21d9871d5861414e9ec6cc262c2841c608975f175861418d7733e9292c28410363188f075861414e9ec6cc262c2841b79bde26fc5761418889669d212c2841c6ebf093f6576141e30c2681022c2841f4372108f05761416d9feb9dcd2b2841d7c41cdbec576141e7ec1165c72b2841c6aec658e7576141ce9991a7b22b2841fd996629e2576141776da4cd9a2b28410eb55322dc576141309437b1972b284194a1e945d7576141b7cf2ac4992b284175aa62b5cc57614160a33dea812b2841799dc677c9576141d059696f3c2b2841795b05c6c5576141d4395553012b284184b8b370c357614152de4d24c42a2841aa1e1c60c3576141349d001ba72a28412c184ec1c15761415535202e8d2a2841e109bc30be576141c31d93837a2a2841d4352760bc5761413a4ba52e392a2841d4352760bc5761419169b1a00d2a2841d86a4cd4bc5761419169b1a00d2a28410006da37bd576141, 44),
(72, '-', 'Desa mangli (Line)', 0xfeffffff01020000000d000000abaa9f8a032c2841c09e0421f05761414960c7ba8a2b28418259dc9feb57614109450940372b284144b594f7e8576141e025f9782f2b2841ad70e79fe4576141519785a8182b284185027ae9d5576141bdf6de230a2b28413213b74acd576141b2912bb2fd2a2841cfc64501c7576141a62c7840f12a2841305a0f73c5576141a30c6424b62a2841795b05c6c557614112b5ae412d2a284154f59cd6c557614100d914aa1c2a2841b6886648c4576141f4736138102a28413840d7f7be5761418969b1a00d2a28418d1fb433bd576141, 45),
(48, '-', 'Desa mangli (Line)', 0xfeffffff0102000000020000000f36c3541a2a28414c2c7b1ded57614109450940372b284107c281f5e8576141, 46),
(44, '-', 'Desa mangli (Line)', 0xfeffffff01020000000a000000936766121b2728413321bcdd2358614170462d2539272841a12e926f1a5861412616eefe6c2728410f9b87280f5861412616eefe6c2728412e48484007586141025ebacf4b2728418c578f4efe576141bb766c4b05272841284ddfb6fb57614160ea421d3c262841720c1458f85761413ebb28c8162628418269c202f6576141e4f740acbf2528414c69812de95761418b3d81199f222841c98e8e1199576141, 47),
(43, '-', 'Desa mangli (Line)', 0xfeffffff010200000015000000ec03bc361a2b28411742b20c3c586141a537eb571a2b28419606bff939586141ea004ee6ff2a28413898349931586141d824b44eef2a28418e20d3492d5861419ca2193cb52a28413cef4ef920586141df5b723c7d2a28417f4439b21c58614189fd3d92322a2841b0c58e9a16586141bc6316d5e5292841a6d7c14e0e5861411870ef92c229284164fe54320b58614101dd469d372928418622fc6f075861413d1fb977fb282841667ad2ce035861412b431fe0ea2828416a6d369100586141dc24136e16292841a258d661fb5761410ecb13e93f292841229960ebf157614113b9e03448292841ef0f063ce9576141b2be3a2b632928414ba86624dc5761414a4daefb79292841287cba1fd1576141db643ba68c29284107c7f440ca576141069455fbb1292841e21ecb9fc6576141ce3fb06cf6292841bbffbad8be576141429de0c10d2a2841a07739d2bc576141, 48),
(30, 'Jl.Raden Wijaya', 'Desa mangli (Line)', 0xfeffffff0102000000020000000ea8b3e4022c28411df87f12f0576141e9c2703c7c2d28415c353562ef576141, 49),
(31, '-', 'Desa mangli (Line)', 0xfeffffff01020000000400000059f01294872d284170e466f6e75761412706b8edcc2d284152a6873de55761417c54e209fa2d28415364c68be157614183d9a997412e2841d5bc1714de576141, 50),
(25, 'Jl.Mataram', 'Desa mangli (Line)', 0xfeffffff010200000019000000a138610f802d28415a28bd4fff576141b26b6e91322f2841eb37b39df9576141327e841eea2f284180c3b81df65761412239e5c81830284137c2c2caf5576141c52c0c0b3c302841e8028e29f95761414a112d1475302841436937ee055861419bc633c8883028410fb3bc910b58614191f87a98bb302841b11257e209586141e1eda984453128415972f13208586141a15465a0b83128410407b1f706586141d65f198dee312841ea0a93f0075861415724267aec3128410fb3bc910b5861416389d9ebf83128414d57043a0e5861414068a0fe1632284189c6266e105861413d11cef44d32284120c9121411586141937de306dc322841d2c71cc1105861412b0c57d7f2322841d3855b0f0d586141ff0e84520033284128afda980a586141e00d5f81593328418e77c97e095861417613b97774332841814f40480c5861410ea22c488b332841859101fa0f586141a8b9b9f29d332841339da7e412586141bf8320d6b633284118e34a8f1758614117b00db0ce332841d1583b621b5861416d0e425a193428419f19a72b25586141, 51),
(97, '-', 'Desa mangli (Line)', 0xfeffffff010200000002000000baa9bb8e692c2841ac1f3b7633586141a5aab0be8f2d2841e0c001c433586141, 52),
(3, 'Jl.Bandeng', 'Desa Sempusari (Line)', 0xfeffffff01020000000a000000e8e2d40fb4312841b138fa40f9586141c9ad07c29c312841c03fa61cf5586141abc51757743128416c11e79fed5861419516b4aa5831284128c473cce7586141b142ab5429312841dc373055df586141030db225e4302841886c1c3ad4586141c016d5e323302841aafe581ec7586141033575a7732f2841b8cb5bbdbb5861413fb65d06352f284182a32b9eb5586141437912d7322f2841e53b4258b5586141, 53),
(16, 'Jl.Lumba-lumba', 'Desa Sempusari (Line)', 0xfeffffff01020000000d0000000df90c83812e28417e5c92a0bc5861410845075b602f2841bcb2eb4bb358614174163ff30c3028417d258b56b0586141d881315197302841b6b58d3eae586141925abbe900312841b376bd9aab58614129c12c0551312841de043b0ea9586141d2ad07c29c31284150a4fda3a45861418becd69428322841743b61ef92586141d2dcdad1523228418d8604d68c5861417bc9b58e9e322841a492d71884586141c6e2b3d6e832284108f66bfd7758614170896dc0eb3228413608ce9d7058614100245467f732284164577b6d6b586141, 54),
(12, 'Jl.Udang Windu', 'Desa Sempusari (Line)', 0xfeffffff0102000000070000009d0fa41c322f28414b559b4cb55861419099cc2e232f28413d56b8caaf5861417aea6882072f2841dea4319fa7586141a33f5a37f82e2841650bb3eea1586141d5a01e2fe02e2841a11f9a039b58614114c597f7c52e2841b6e9faaf945861419373cfc2b32e28412289bd4590586141, 55),
(33, '-', 'Desa Sempusari (Line)', 0xfeffffff01020000000a000000a4ac5b81c02e2841813de6639358614102e897c4842f2841ee79fd9792586141d0ec1807bf2f284161161e3b935861417026d1a6f92f2841cbb0b969935861413338e7fd6f302841761a282494586141a74091c0883028413eedd09d92586141dd91c30484302841304ef78a8e586141fcc690529b302841937d2618715861413f140426a130284154b61ce66658614167cf3a15b4302841d55c8b575e586141, 56),
(82, 'Jl.Nener', 'Desa Sempusari (Line)', 0xfeffffff010200000006000000ca29b8b441322841f75deb338f586141056d72d9f0322841e8b9eab98f58614110296b9a48332841aac9de629058614187c54a9c2935284149ade37b955861415310edb1ac3528417c7a319395586141aacc7b631b362841897cb60796586141, 57),
(23, '-', 'Desa Sempusari (Line)', 0xfeffffff0102000000110000001312c958353128410ac18661e15861411b2b31b0683128415b76ccfdde586141fa1b61cec03128410d456b8edc58614183ecd69428322841230c2a48db5861419a84ec7db1322841fe031676d95861413777a03f93332841c3f7f7bad65861413960527c00342841e1fd8618d8586141c15d81be7d3428410e08205fda586141d9f596a7063528414ed7f2eada5861411cec73e9c63528416bdd8148dc58614124b8fe5d0b3628410d456b8edc5861414133ed7e6b362841cd759802dc5861411b6168ccc5362841e379a2ebdc586141cdd3ac2a0d37284157559332e0586141b66a6a513a372841f9b4b31eea586141f0317483443728410b35d9daef586141c6bc5e677a37284105a162fa07596141, 58),
(54, 'Jl.Kakap', 'Desa Sempusari (Line)', 0xfeffffff01020000000a0000000e099bb1ef352841a3aacf5fdc5861419da38158fb3528419a34f871cd5861419da38158fb3528412d1e4170c8586141d9246ab7bc352841e64ce96fc758614184518d42bb35284167f357e1be58614169bf505ec83528410d658ff5b558614151560e85f535284112b7933fa05861413a67620a27362841aca8a597915861413e905c154736284125104465865861412b8489d24f3628415422a6057f586141, 59),
(57, '-', 'Desa Sempusari (Line)', 0xfeffffff010200000003000000c618ebf245382841fab74df70f596141f009b101b5382841f6360bbd0f59614175a2d192a03a2841077d873c0e596141, 60),
(66, '-', 'Desa Sempusari (Line)', 0xfeffffff01020000000c0000000c378f3b14302841f20211465e586141e48a07f5dd30284180634eb062586141dc2bd248e232284164d111cc6f58614172b0a1b5eb34284180cfd7cf7a586141d50a1f557936284146fac05e84586141aa0afe1bae3728414ab5acd58b586141770f7f5ee83728417dbf451c8e586141f86ff63bd738284161f0bd089958614191bf19949439284157e66f3aa2586141974b5c3a263a28417e6a9fdfa8586141140943aef03a2841d3f867cbb15861419380084f723b28412a0b15e4b5586141, 61),
(69, '-', 'Desa Sempusari (Line)', 0xfeffffff010200000010000000934b0c4124302841d73ef47e5a586141660ba339a631284195675899635861414222d0c36d3228416f1a303e6958614127bf66ef30332841e9f520856c586141a47c4d63fb332841163d05fb70586141b5fd1489f13428415b8a78ce76586141cd952a727a352841400005447a586141c99b037710362841c2dd7aff7d586141fb0b7717d536284121f2ac8c8258614144e52c916c372841166c43eb8658614158dab110d13728417b432a49895861411b9fea8458382841ed1c961b8c58614157f80f628a392841aa062a9292586141f04733ba473a284151ecb31f98586141e10dc4f02a3b2841239d06509d5861419b4c93c3b63b2841d04545aea0586141, 62),
(51, '-', 'Desa Sempusari (Line)', 0xfeffffff010200000017000000059ad7d6853028411cf7db0d5358614187eb9f0b98302841e645a05a56586141d39e5819c03028415c6303385758614131abc14cce3028414b80321a555861412362a3dad43028412b3bd3185158614175c1c2f56731284151069cbb505861415ef23ae272312841a497069a5458614198b944147d312841cf9c78795b58614185f392a4ce312841f0234a115d586141e072d6263b322841517aee345f5861417d56db3f40322841514045f8575861410df1c1e64b3228415382b78e55586141a3370f9bc2322841ec685e9a55586141a3370f9bc2322841b50f63fc635861417e85ae4ff6322841677b562b655861419c9a573634332841c0cf75da66586141fdfc73f0773328418805cab56158614138bcde07cc342841af4cae2b665861414614ac22a235284171f9f6726a5861413dbd15915c362841913e56746e5861419533836f82362841de0fae746f586141b8914ac8b9362841c5c40a8e75586141de0c39e919372841ff93dd1976586141, 63),
(17, '-', 'Desa Sempusari (Line)', 0xfeffffff01020000000200000035003ac5f43628414e9c3c64835861412e83a6c73f3728418cc0b52c69586141, 64),
(36, 'Jl.Mataram', 'Desa Sempusari (Line)', 0xfeffffff01020000000b000000cad931b122352841f64fe60e78586141a1641c95583528413969f48a6c5861416bc60c6e6e35284177bcab43685861418ebe8e8c833528418805cab5615861412c3c4e6b663528419b8db8cb5d5861410d07811d4f352841890d930f58586141eed1b3cf37352841ea298ef652586141d57fbfb9f73428415b8fa74f475861418166c171ad342841802369a83a5861412124c91e43342841ca419e8b2a586141a06cbbaf0e3428415529621525586141, 65),
(37, 'Jl.Majapahit', 'Desa Sempusari (Line)', 0xfeffffff01020000000200000019ea0152273a2841f274d63097586141f094109d363a2841ed165a506b586141, 66),
(24, '-', 'Desa Sempusari (Line)', 0xfeffffff01020000000d000000ddc6bf12d23b2841cc8f88b869586141a7f9dcdb313b28414e30b3446b58614111b38f27bb3a2841ca4d16226c58614167a69003963a28419c010b456c5861412513fc5c473a2841f1979c8a6b5861412b43b2770d3a28412b0766a76a58614194428696df392841f3d90e2169586141e1a06e28e2382841e159e9646358614166cc39f1843828411569a91261586141a99343238f382841a01966524f586141dfb7bceb74382841d3b7757939586141ae761c5b6638284110d425e8285861413e1103027238284137eccb6d17586141, 67),
(99, '-', 'Desa Sempusari (Line)', 0xfeffffff0102000000020000001d60d93f363a28419ea3864a6b586141f5a4a250233a2841f67439f721586141, 68),
(91, '-', 'Desa Sempusari (Line)', 0xfeffffff0102000000020000001529884e95392841c62b756067586141a5104cd88f392841b3b2ff0c48586141, 69),
(92, '-', 'Desa Sempusari (Line)', 0xfeffffff0102000000020000000f6498b02b3a2841d746c1653b586141fd2f445e3b392841d746c1653b586141, 70),
(86, '--', 'Desa Sempusari (Line)', 0xfeffffff0102000000020000005b82173bb03a28419eaef523475861416f79afea2d38284180e5b1f547586141, 71),
(79, '-', 'Desa Sempusari (Line)', 0xfeffffff010200000006000000af2072daa53a28416b617a366c586141658eea7da73a28413f5ada013058614193b9d67f15392841148f115f30586141c157e6a6ff38284161231e302f586141fee4a148b8382841078d8cea2f586141a3355fd567372841d4bf3ed32f586141, 72),
(104, '-', 'Desa Sempusari (Line)', 0xfeffffff0102000000020000001dadb622253a284198370545285861419e43b6bbe8372841ca04535c28586141, 73),
(109, '-', 'Desa Sempusari (Line)', 0xfeffffff01020000000300000055b5811e09392841b99876aa2f586141c157e6a6ff3828417c5f9f7317586141047dd86a0c3828411fc788b917586141, 74),
(5, '-', 'jalan Kaliwates', 0xfeffffff01020000001900000060eea2bd81432841ebc3fb7434596141d06007d37a432841414b561432596141d06007d37a4328414f3db20d2f5961417f09da928f43284139e8b7752c596141a72411689d43284171216a0029596141a72411689d432841aa5a1c8b25596141a72411689d432841ffe1762a2359614141af6872c34328411cc62e1d1d596141c51e89a7db4328413eaae60f17596141b0000ef2ec4328417edc461712596141b0000ef2ec432841e155fdaf0c596141b0000ef2ec43284126885db70759614169ca9f47d1432841182c119c03596141c63f483dab43284109d0c480ff586141942755487e432841f37acae8fc5861410ebb78f346432841bbd7273cf95861416b3021e920432841a5822da4f65861416b3021e920432841ac7bdb20f55861416b3021e920432841010336c0f25861419e4814de4d432841ce5f9313ef586141740c1e7370432841e44a9d89ea5861417f09da928f432841f83cf982e7586141920696b2ae432841a34baec1e2586141ee5a7f12b94328413f680707e1586141d93c045dca43284170a80b15df586141, 75),
(7, '-', 'jalan Kaliwates', 0xfeffffff01020000001a000000cde9dd19783b284149ec643bb6586141333b8399a13b28418888b564b8586141795032aeed3b2841bb2b5811bc5861418e4aaaed2b3c2841415da7e0be586141fd9b4f6d553c28413564f963c0586141ca3e9a6ca83c28412e6b4be7c15861411930460b443d2841caf1944ec7586141cf9356bfd83d28413c318824cd586141e24b50d3773e28419222d3e5d15861414416b51b823f2841f868183fd9586141b4435725fb3f28419be80f23dd586141d9f80c59b94028415cb6af1be2586141917ddca21d412841ff35a7ffe5586141d7928bb76941284139d2f728e85861411d843756054228416b7cec58ed586141d2c68874ca422841010336c0f258614124fab23e05432841fa098843f45861416b3021e920432841ac7bdb20f5586141892a99285f4328413aa6d86cf65861419be2923cfe4328416550cd9cfb586141b77689daec4428411f25bf18025961416cb9daf8b14528416f160ada06596141f9e0f44169462841592b00640b5961415dcc182043472841e9b89b4e12596141b7ba80defd472841853fe5b517596141590016dda34828411cc62e1d1d596141, 76),
(76, 'jl imam bonjol', 'jalan Kaliwates', 0xfeffffff010200000010000000e65b4a1a28402841de790026bd58614189e6a1244e402841f3640a9cb85861417fc5e28e7e4028411649c28eb2586141182f7b03d5402841a39fde96a5586141bbb9d20dfb4028419c3c40f89f586141edd1c502284128415ad3600e91586141c495cf974a412841ed297d16845861419a59d92c6d412841e55cee5577586141863b5e777e412841eaf2fd3370586141ae56954c8c412841b94809046b586141b853516cab412841cd3a65fd67586141a435d6b6bc412841e8bb7e515c5861411fa5f6ebd44128411992923d5358614146c02dc1e241284190fda4cf4a58614132a2b20bf4412841d0c514b53e5861418ef69b6bfe412841d05b249337586141, 77),
(56, '-', 'jalan Kaliwates', 0xfeffffff010200000011000000d7928bb769412841c3f8e6d1c858614101ab7eac96412841118793f4c7586141b853516cab412841a7a3ec39c6586141b853516cab41284126729d6ac358614114a83accb54128411816514fbf586141ff89bf16c741284110b3b2b0b9586141a2141721ed41284149ec643bb6586141f44741eb27422841881ec542b1586141f2268255584228415c74d012ac586141a1cf54156d422841b9f4d82ea8586141a1cf54156d422841cde63428a55861416fb761204042284163038e6da3586141ad11d3400c422841f8263936a3586141cb500d8cca412841f8263936a35861415202acec81412841b1913a90a2586141340834ad43412841b98ae80ca15861414a476ef80141284155a741529f586141, 78),
(58, 'jl nusantara', 'jalan Kaliwates', 0xfeffffff0102000000120000005612a6333243284168456d76d958614142f42a7e434328410462c6bbd7586141892a99285f432841379b7846d458614119b834136643284121467eaed1586141a845d0fd6c43284168718c32cb5861412cb5f03285432841ad39fc17bf5861410279fac7a74328415cdec034b358614141af6872c3432841a39fde96a5586141a72411689d43284163038e6da3586141049ab95d7743284129673d44a1586141610f625351432841f1c39a979d586141e69f411e394328418de0f3dc9b586141e69f411e39432841a1d24fd69858614123d9f3a835432841fd5258f294586141610f625351432841e004b0dd93586141a845d0fd6c432841e7fd5d5a92586141bb428c1d8c432841caafb545915861410d76b6e7c6432841caafb54591586141, 79),
(62, '-', 'jalan Kaliwates', 0xfeffffff01020000000700000041af6872c343284138c3895fa5586141cf1b45c7fa4328418d4ae4fea25861413e6dea4624442841e2d13e9ea058614100137926584428413859993d9e5861411f2eb0fb65442841b7274a6e9b586141ecf4fd7069442841f659aa7596586141afbb4be66c442841996fb13793586141, 80),
(70, '-', 'jalan Kaliwates', 0xfeffffff01020000000700000038d36be8734328411fe3df0fcc5861419d0352d2cd43284113ea3193cd586141cefa85312b44284177cdd84dcf586141997c119bae4428418c22d3e5d15861411dc82e5a16452841af707bfad258614126a42be465452841ccbe230fd45861414d7aa0adf34528417737c96fd6586141, 81),
(49, 'jl panglima polim', 'jalan Kaliwates', 0xfeffffff010200000014000000b41008399d4528417e3077ecd4586141449ea323a4452841b6692977d1586141b41008399d452841eea2db01ce586141c92e83ee8b452841048ee577c958614182f814447045284143c0457fc4586141971690f95e452841ad39fc17bf5861413bc2a699544528416d9dabeebc5861413bc2a69954452841f3640a9cb8586141971690f95e4528411d42700bb15861414ebf62b973452841cde63428a5586141e849bac39945284144e8569895586141a0f28c83ae45284111dbc3c98a586141d42b3f0eab45284183b0c67d895861416dda998e814528413d1bc8d78858614145e3652f244528416e5bcce5865861415025e45ac34428419f9bd0f384586141496aa666434428413bb82939835861413591edbcd4432841ad8d2ced81586141610f6253514328411f632fa18058614106003bffc642284150a333af7e586141, 82),
(40, '-', 'jalan Kaliwates', 0xfeffffff0102000000070000000279fac7a7432841b9c8b972b6586141b121cd87bc432841b9c8b972b65861410c55f751f74328418f8163e1b6586141ed15bd06394428418f8163e1b6586141997c119bae442841d6166287b75861418d3a936f0f452841accf0bf6b75861413bc2a699544528415e415fd3b8586141, 83),
(34, '-', 'jalan Kaliwates', 0xfeffffff0102000000030000002f80286eb5452841ef8c1bb5895861417595d782014628413d1bc8d788586141e5c2798c7a4628414914765487586141, 84),
(28, '-', 'jalan Kaliwates', 0xfeffffff01020000001b000000a0f28c83ae45284124e7edb2ec586141a0f28c83ae452841e44a9d89ea586141a0f28c83ae452841f83cf982e7586141579b5f43c3452841720baab3e4586141aaef48a3cd452841b13d0abbdf586141dd073c98fa452841ee0ccc23d5586141bccb452d1d46284192b8e2c3ca586141c7c8014d3c46284150b9f3fbc258614156569d3743462841111da3d2c05861417e71d40c514628413afa0842b9586141373b6662354628412b9ebc26b5586141809293a220462841d6ac7165b05861410523736d084628415c74d012ac5861410523736d0846284186513682a4586141dd073c98fa4528413defa81b97586141dd073c98fa452841afc4abcf95586141e728fb2dca452841279aae8394586141a1134c197e452841279aae839458614198374f8f2e45284175285ba69358614114ec31d0c644284153dab291925861411531f4db46442841054c066f935861410d76b6e7c6432841996fb13793586141d93c045dca432841b55abbad8e5861419d0352d2cd43284135221a5b8a586141f8573b32d84328410a78252b8558614188e5d61cdf43284149aa85328058614120737207e6432841f94e4a4f74586141, 85),
(22, '-', 'jalan Kaliwates', 0xfeffffff01020000000d00000002782fc03847284174422996f8586141349022b565472841419f86e9f45861410b542c4a88472841c766e596f0586141aede8354ae4728410799459eeb58614199c0089fbf472841e9e0ac67e358614165875614c347284194ef61a6de58614165875614c3472841afda6b1cda58614170841234e24728410462c6bbd7586141a29c05290f4828415ae9205bd5586141a29c05290f482841af707bfad25861415b66977ef347284127dc8d8cca58614170841234e247284143c0457fc4586141143029d4d747284183f2a586bf586141, 86),
(98, '-', 'jalan Kaliwates', 0xfeffffff0102000000130000006cfdd1fcc2482841a0560ee80459614110a9e89cb8482841261e6d95005961416cfdd1fcc24828418a97232efb5861418b1809d2d0482841bbd7273cf9586141be30fcc6fd482841e41e7ecdf8586141d12db8e61c4928410966d45ef858614160bb53d1234928413aa6d86cf65861411985e52608492841578a905ff0586141fb8a6de7c9482841e2e7feeae4586141fdab2c7d99482841ffcbb6ddde586141de90f5a78b482841300cbbebdc58614112caa7328848284168456d76d958614112caa73288482841beccc715d7586141c9727af29c482841c5c57592d55861418b1809d2d04828413d9b7846d4586141bf51bb5ccd482841b6692977d15861412fc41f72c64828418abf3447cc5861412fc41f72c6482841ee38ebdfc65861412fc41f72c6482841c28ef6afc1586141, 87),
(96, '-', 'jalan Kaliwates', 0xfeffffff010200000007000000395c25f80446284168db7c54d2586141e6e338224a462841d3b7d18bd25861415e11db2bc34628411a4dd031d358614185e74ff5504728415ae9205bd5586141b8db3f74cd47284194857184d7586141b599c1482e4828410462c6bbd7586141aa57431d8f4828410462c6bbd7586141, 88),
(87, 'jl sentot prawirodirjo', 'jalan Kaliwates', 0xfeffffff010200000006000000231debac46462841c28ef6afc1586141936b4c4c8f462841c28ef6afc158614135d5e4c0e5462841ecd54c41c1586141c41dbe9f6c4728417cf9f709c1586141b8db3f74cd4728415fab4ff5bf586141975a87fd6f482841b432aa94bd586141, 89),
(83, 'jl gajah mada b', 'jalan Kaliwates', 0xfeffffff010200000004000000761ee730c64828414b063cfb05596141a906a6656b472841c6a0dae9fa586141ee75db66734428414adeae29e4586141811dc550c2432841636958c8de586141, 90),
(78, 'jl gajah mada C', 'jalan Kaliwates', 0xfeffffff01020000000700000018bf4714c94328412ec65f03df5861412247a09f63432841572cb921db586141d190dd1b6f412841d676512fc9586141f4dbcd25683f284168eb21a9b75861419f752545b73d28412bbb835cad58614153415426153c284154824eada3586141c75901b0b73b284183e2045fa1586141, 91),
(93, 'jl.22', 'jalan Kaliwates', 0xfeffffff0102000000050000004305d384ff3d284149ab4f12af586141586ea680133e284120784149ab5861411de7f4b3383e28419de4b95a9e586141a4038507803e2841ca6121378c586141fe57b8538c3e28415c2c9bfe7f586141, 92),
(94, '-', 'jalan Kaliwates', 0xfeffffff010200000007000000e32dcc14693c284186873699a558614180ad7835893c284197b267c99e586141a6e633cca93c28414046a8ca98586141638f9a64c23c2841bf7fd5869358614190d29febcf3c28413c088b2f8d586141990477adde3c284107158c89865861419e9d620ee63c28412f32002882586141, 93),
(1, 'JL Sultan Agung', 'jalan kepatihan', 0xfeffffff01020000000500000017125b7928572841905f870867596141cc1bdef60156284111f399bd5c596141427d63bef75428411bdf922c53596141c3bbf958dc532841ed74effd485961411eedb560ae532841e509441e49596141, 94),
(74, 'JL Samanhudi', 'jalan kepatihan', 0xfeffffff010200000002000000b5504e79dc532841a32beafb485961413bebe3f05e5328416426aea93c596141, 95),
(13, 'JL Diponegoro', 'jalan kepatihan', 0xfeffffff0102000000060000004e53ba7df754284120f18a2953596141173f2830ec542841d6a15f4f3d596141029122cdde542841198b8ac93859614169779e4bad5428412f6a5afc25596141b8891bef8954284178b2a16b165961415aa451d780542841173da2280f596141, 96),
(45, 'JL Sulawesi', 'jalan kepatihan', 0xfeffffff01020000000300000079b9ccdcb3542841d87aeb7e285961415bfbb98cd15328415c82df4c2c5961413e3da73cef5228416d0e22752f596141, 97),
(32, 'Jl. 20', 'jalan kepatihan', 0xfeffffff0102000000060000000a82c746cf532841e8f0f9562c596141f7ca297706542841ed8839c9315961416b15114d2754284198fd97d633596141dc82e74f59542841c7cadc9d365961415ea01b9aa6542841f5f4109b385961411cd2246cde542841ac6450b338596141, 98),
(63, 'Jl.19', 'jalan kepatihan', 0xfeffffff010200000008000000d9ccaa6a0356284111f399bd5c59614165a2a876205628418687d86459596141d014e1a833562841d02948f954596141c0aa61bb3a562841bc787b8553596141a0feb33c3b5628416decada04e596141082b0e152c5628414d3fd42f48596141fbe6879f1756284111672c7041596141c98a7cd9fc55284103858f163b596141, 99),
(52, 'JL Gatot Subroto', 'jalan kepatihan', 0xfeffffff01020000000c0000003a802acfeb542841e41e032c3d596141eff969df53552841eded7b963c596141242b1afea85528413ce209093c596141ba1fd1f9fc5528418ff3a9203b5961417b07c634385628414e2b844e3a5961412eead2cbd356284193011d7a37596141fb365f506857284114396ceb345961414556df95465828417aa9ba9831596141bf9b643c86582841cd6cc17530596141852ecf1a3d5928418ca49ba32f59614100ba321b9f59284166f8ed24305961418a6937afd7592841d8b2e20932596141, 100),
(60, 'Jl. 21', 'jalan kepatihan', 0xfeffffff0102000000070000004a3a816d355628418e6291533a596141dcea3768335628418b92ecf633596141140165d42b562841d8b2e209325961414c409503dc552841550fbcc62d596141765b249fb5552841420cd1742859614108342cf6a555284145e61a3723596141cf4550e69f552841fc0a882517596141, 101),
(64, 'JL Kartini', 'jalan kepatihan', 0xfeffffff010200000006000000b2d697d8b457284155d8d1345d5961417d9d7b3fab572841a367662a56596141d31978d080572841787e108b42596141f6ca877e615728413cfea66b305961418b584f4c4e572841658f6f042659614137e266511f572841459a1c1b10596141, 102),
(67, 'JL Dr Wahidin', 'jalan kepatihan', 0xfeffffff010200000005000000286010f541532841df1909462e5961412e3bc9e322532841c93ba83f27596141cb117956055328413c6894b8205961418894d647e75228417c55fb851b596141ef7a52c6b5522841974b744b13596141, 103),
(47, 'JL Trunojoyo Gg Remaja', 'jalan kepatihan', 0xfeffffff010200000004000000e25c81d73b59284196c88b9d2f5961414b60d8ec7459284107ea141e255961415ca2067e7b59284172f9eef11e596141aed2101f88592841f441c11d11596141, 104),
(41, 'JL A Yani', 'jalan kepatihan', 0xfeffffff01020000000b00000097be47801a5928413e38887b50596141d5cf12bd31592841e26599024a596141f12fce4b685928417db156804159614170283510d85928418d8dcd013259614110cc1d61405a2841d902a90328596141fced5a278c5a2841175b72601e5961412906e077925a2841804f674e0e596141202e31d4845a2841ddff928c0a596141202e31d4845a28417139a15d06596141be93a7457f5a2841c290d068fe586141fc15ac837e5a284172b2e4a5f5586141, 105),
(38, 'Jl. 15', 'jalan kepatihan', 0xfeffffff01020000000300000027a01c3c325a28414ba3335b505961415e706b4e085a28419f319c5e42596141c2100973b4592841d3f92f903a596141, 106),
(29, 'JL Trunojoyo', 'jalan kepatihan', 0xfeffffff01020000000b000000a721cbd6af52284192abbc320f596141a9bfec5bd75328416fc7a9c90e5961415a846cf542542841773255a90e5961416bb5102b1b552841c565265b0f596141fcee798e8a5528410d9219b80f596141ff23ce8c7e5628417306ed0810596141521bfd756a572841e7e56b3910596141e2744bbb1758284156c5ea691059614170a8a088e0582841b6d5f02f11596141921ac1e8f959284147f671ff10596141725e3b75915a2841d316f3ce10596141, 107),
(21, 'JL Dr Sutomo', 'jalan kepatihan', 0xfeffffff01020000000500000050dd2c8fa1532841e611d4d90e596141e1de37a949532841241c04fc045961417c26211d14532841d37c5b78fd5861410f6e0a91de522841be5fb732f5586141d0ad93737152284171483a93e4586141, 108),
(20, 'JL Dr Sutomo Gg IV', 'jalan kepatihan', 0xfeffffff0102000000030000003d66aaffa6522841897e28a009596141a45b8104855328413a956b85055961413cf64b7473542841160ac3ae00596141, 109),
(95, 'Jl. 18', 'jalan kepatihan', 0xfeffffff010200000003000000eb35a05e9a522841caf0aaf002596141053ff33780532841165bb59afd586141be44effb2c542841d4dca35ff9586141, 110),
(90, 'Jl. 17', 'jalan kepatihan', 0xfeffffff0102000000030000002e935d8b7a522841a6048e40fb586141d72eda612e532841280478c7f758614131b8d994055428413fec7d33f3586141, 111),
(84, 'Jl. 16', 'jalan kepatihan', 0xfeffffff010200000003000000c1da46ff4452284142c7f3e7f45861410c91f9bdef5228419a771f26f158614148b429cce9532841bb926b87eb586141, 112),
(81, 'JL KH Wahid Hasyim', 'jalan kepatihan', 0xfeffffff0102000000030000008ecf8f58d45128415c766877e85861417f44ae1a44532841d49ecf4cde586141db53566bb95428411c7878d9d3586141, 113),
(105, 'JL KH A Dahlan', 'jalan kepatihan', 0xfeffffff010200000010000000cc8875714154284141764436d758614160779e4bad5428416545e1e1e75861416384a1edae5528414d03b350e1586141974edc69de55284112de9d48e1586141fc06f3f513562841d0a6d993e5586141b0a883626e562841952986ebf058614125cb19dc9c56284184322a84f6586141fe644ab7bf5628414e533610f8586141cffdc82b1d572841c50d2bf5f9586141185624291c5728417d81efb0fd5861411fe8f472075728417e37db1901596141fd0de2016f572841e8d4bd5903596141d6a712dd915728418103fbd203596141fef4eb2b8c582841de0545ef03596141f0003d67c859284155ad5e3503596141b2dee7ce825a28410516c0f802596141, 114),
(110, 'Jl. 14', 'jalan kepatihan', 0xfeffffff010200000003000000d22ab1af5c582841e6a58ea8105961417968d6c464582841d78fc8b70859614169fe56d76b5828415dbb1adf03596141, 115),
(111, 'JL Raden Patah', 'jalan kepatihan', 0xfeffffff01020000000700000003d92ffc1f532841a88e5443df58614190257b9fcb522841769f4c41d25861419e491c33a25228410b3d289dcd58614118772872585228411b7e989bc458614137742a1002522841c04a3549bb586141e52ba7076c512841af622fddbf586141485d630f3e512841b40540a7c0586141, 116);

-- --------------------------------------------------------

--
-- Table structure for table `tempat`
--

CREATE TABLE `tempat` (
  `id` int(11) NOT NULL,
  `lokasi` varchar(30) NOT NULL,
  `point` point NOT NULL,
  `feature_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tempat`
--

INSERT INTO `tempat` (`id`, `lokasi`, `point`, `feature_id`) VALUES
(23, 'Indomaret 6', 0xfeffffff01010000007baf3bd1f3512841880d370558596141, 1),
(22, 'Alfamart 2', 0xfeffffff01010000004afbf62d5f4e28415dc7119531596141, 2),
(30, 'Indomaret 9', 0xfeffffff0101000000ddc41c9f074f28411b208145b2586141, 3),
(51, 'Indomaret 6', 0xfeffffff01010000003a0afe51e8492841525d0262d9586141, 4),
(48, 'Jember Kidul', 0xfeffffff010100000069a14bd7b14d28416157aedcb6586141, 5),
(44, 'Perumahan PTPN XII', 0xfeffffff010100000022ba4957e74928418fced11ddd586141, 6),
(34, 'Pasar Gebang', 0xfeffffff0101000000d4f69dd5104e2841980143e37b596141, 7),
(37, 'Pemandian Kebon Agung', 0xfeffffff0101000000637afff33944284100cf1275cd596141, 8),
(10, 'Perumahan Kebon Agung Indah', 0xfeffffff0101000000002e2e4ef9412841c1ca01cef0596141, 9),
(7, 'Kebon Agung', 0xfeffffff0101000000f31ab127823e28413fef59064e5a6141, 10),
(28, 'Bumi Mangli Permai', 0xfeffffff01010000003c8052b1842e2841b972d58f8f586141, 11),
(31, 'Perumahan Pesona Surya Milenia', 0xfeffffff0101000000799ec1607e3128417d34255533586141, 12),
(6, 'Griya Mangli Indah', 0xfeffffff0101000000e44e8bb321272841b69b42c226586141, 13),
(56, 'Perumahan Kodam V Brawijaya', 0xfeffffff01010000003f8196ef1f2b28410a532a46ee576141, 14),
(45, 'Indomaret 1', 0xfeffffff01010000005d931aa3652e28419e2933f184586141, 15),
(24, 'Indomaret 2', 0xfeffffff01010000008e2023e04f272841f59c75f127586141, 16),
(32, 'Indomaret 3', 0xfeffffff01010000001ead7941962d28414a6d346627586141, 17),
(27, 'Kerupuk', 0xfeffffff0101000000b0ae30cf1e2e284172b3ed4a76586141, 18),
(9, 'Kedelai Idamami PT.Mitra Tani', 0xfeffffff01010000008bf1b065042a28412287ac0438586141, 19),
(11, 'Stasiun', 0xfeffffff0101000000edb024e6082a28411f58e10b40586141, 20),
(15, 'Mangli', 0xfeffffff01010000009b032fa1532d284132ec6ddcf5576141, 21),
(53, 'Perumahan Dharma Alam', 0xfeffffff01010000007420b6ee29372841aaacb6c9f0586141, 22),
(38, 'Perumahan Palm Asri', 0xfeffffff0101000000c4172d65dc352841813eb04fad586141, 23),
(25, 'Mandiri Regency', 0xfeffffff0101000000a37776bfaf3728415b17ecb397586141, 24),
(54, 'Perumahan Sempusari', 0xfeffffff010100000095c9fc812b3a28411489765a6f586141, 25),
(46, 'Alfamart', 0xfeffffff0101000000312ee075be3028415967be1b62586141, 26),
(41, 'Kaliwates', 0xfeffffff01010000002b96a9536a312841f60bf39064586141, 27),
(33, 'Roxy', 0xfeffffff0101000000287342976e362841c2edb9208a586141, 28),
(26, 'Carefour', 0xfeffffff0101000000cf39915bbb39284138b153e794586141, 29),
(17, 'Sempusari', 0xfeffffff01010000008bce34ee4739284151f954db93586141, 30),
(50, 'Indomaret 4', 0xfeffffff010100000065a1afb52b3d284131ac4a09ac586141, 31),
(36, 'Indomaret 7', 0xfeffffff0101000000a08b6541734328415571ff21da586141, 32),
(55, 'Indomaret 5', 0xfeffffff0101000000bacc671c13482841304838b104596141, 33),
(1, 'Kaliwates', 0xfeffffff01010000009c88e611d73c284102ece74ba1586141, 34),
(16, 'Kenari Cluster', 0xfeffffff0101000000bb9062fa2a3c2841b44d799475586141, 35),
(3, 'The Argopuro', 0xfeffffff010100000037f6032d024028412177cdb5c1586141, 36),
(52, 'Teratai Garden', 0xfeffffff0101000000ccf8d3799f422841ed0cd774f5586141, 37),
(39, 'Bumi Kaliwates', 0xfeffffff01010000005ad91d2c494628412d37be92c4586141, 38),
(2, 'Rumah Sakit Desa Kaliwates', 0xfeffffff0101000000937ad5220d41284122f4dba9bd586141, 39),
(4, 'Rumah Sakit', 0xfeffffff010100000067a61e2b34412841bbfc7a3196586141, 40),
(40, 'Suwar Suwir', 0xfeffffff0101000000418f0cd1b64328416f0a2ea402596141, 41),
(47, 'Suwar Suwir', 0xfeffffff010100000046b025b791452841af52ecf9f2586141, 42),
(5, 'Indomaret 8', 0xfeffffff0101000000bf14322586542841218fc54e56596141, 43),
(13, 'Indomaret 13', 0xfeffffff0101000000f35518409f572841fd4eefa15d596141, 44),
(8, 'Indomaret 12', 0xfeffffff0101000000e096bd79cf592841491758ae3d596141, 45),
(49, 'Indomaret 11', 0xfeffffff0101000000b32e617878582841f2fd5ee90d596141, 46),
(43, 'Indomaret 10', 0xfeffffff0101000000c03ba80bc4522841d0f7cb7fe2586141, 47),
(42, 'Pasar Tanjung', 0xfeffffff0101000000978ffa8cc452284164a4090327596141, 48),
(29, 'Makanan Khas Jember', 0xfeffffff0101000000f129841bca522841a85bef5412596141, 49),
(12, 'Kepatihan', 0xfeffffff0101000000b86b9adad6532841383701f7d5586141, 50),
(14, 'Syafia', 0xfeffffff01010000006f8aea7bc15628411259b84863596141, 51),
(21, 'Matahari', 0xfeffffff0101000000cebf2d3dc054284114efbecf28596141, 52),
(18, 'Togamas', 0xfeffffff010100000020ef1877ce592841ee8a8ac938596141, 53),
(19, 'Gramedia', 0xfeffffff0101000000cb115dd21e56284189f436780d596141, 54),
(20, 'Golden Market', 0xfeffffff0101000000ad0b724b6758284119a6196512596141, 55),
(12, 'D&S', 0xfeffffff0101000000ea5e9428745a28411e4bc54d00596141, 56);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `desa`
--
ALTER TABLE `desa`
  ADD PRIMARY KEY (`feature_id`);

--
-- Indexes for table `jalan`
--
ALTER TABLE `jalan`
  ADD PRIMARY KEY (`feature_id`);

--
-- Indexes for table `tempat`
--
ALTER TABLE `tempat`
  ADD PRIMARY KEY (`feature_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `desa`
--
ALTER TABLE `desa`
  MODIFY `feature_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `jalan`
--
ALTER TABLE `jalan`
  MODIFY `feature_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `tempat`
--
ALTER TABLE `tempat`
  MODIFY `feature_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
--
-- Database: `db_ci`
--
CREATE DATABASE IF NOT EXISTS `db_ci` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_ci`;

-- --------------------------------------------------------

--
-- Table structure for table `tm_grup`
--

CREATE TABLE `tm_grup` (
  `id_grup` int(11) NOT NULL,
  `grup` varchar(20) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tm_grup`
--

INSERT INTO `tm_grup` (`id_grup`, `grup`) VALUES
(1, 'admin'),
(2, 'user');

-- --------------------------------------------------------

--
-- Table structure for table `tm_user`
--

CREATE TABLE `tm_user` (
  `id` int(11) NOT NULL,
  `username` varchar(10) CHARACTER SET latin1 NOT NULL,
  `nama` varchar(50) NOT NULL,
  `password` varchar(6) CHARACTER SET latin1 NOT NULL,
  `grup` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tm_user`
--

INSERT INTO `tm_user` (`id`, `username`, `nama`, `password`, `grup`) VALUES
(11, 'sdf', 'Emilia', '', 0),
(13, 'dsf', 'Emilia', '', 0),
(14, 'Rizqa alfi', 'Rizqa Alfiani', 'Rizqa ', 1),
(15, 'Indah123', 'Indah Pramesta', '', 0),
(16, 'Maria', 'Mariani Andari', '1234', 1),
(17, 'Rismaya', 'Riska Kumala', '', 0),
(18, 'cotel', 'comme123', '', 0),
(19, 'intan', 'isdn', 'nsdf', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tm_grup`
--
ALTER TABLE `tm_grup`
  ADD PRIMARY KEY (`id_grup`);

--
-- Indexes for table `tm_user`
--
ALTER TABLE `tm_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tm_grup`
--
ALTER TABLE `tm_grup`
  MODIFY `id_grup` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tm_user`
--
ALTER TABLE `tm_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- Database: `db_devita`
--
CREATE DATABASE IF NOT EXISTS `db_devita` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_devita`;

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `gambar`
--

CREATE TABLE `gambar` (
  `id_gambar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `grup`
--

CREATE TABLE `grup` (
  `id_grup` int(1) NOT NULL,
  `nama_grup` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `rekening`
--

CREATE TABLE `rekening` (
  `id_rekening` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `rinci_transaksi`
--

CREATE TABLE `rinci_transaksi` (
  `id_rinci` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id_setting` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(30) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `level` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama_user`, `username`, `password`, `level`) VALUES
(1, 'Maya Maulida', 'maya12', 'maya12', 1),
(2, 'Intan Permata', 'intan13', 'intan13', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Database: `devcol`
--
CREATE DATABASE IF NOT EXISTS `devcol` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `devcol`;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_buktitransfer`
--

CREATE TABLE `tbl_buktitransfer` (
  `id_transfer` int(11) NOT NULL,
  `nama_pengirim` varchar(50) NOT NULL,
  `tgl_transfer` date NOT NULL,
  `jam_trasfer` time NOT NULL,
  `bank_transfer` varchar(20) NOT NULL,
  `foto_bukti` varchar(100) NOT NULL,
  `no_penjualan` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_grup`
--

CREATE TABLE `tbl_grup` (
  `id_grup` int(2) NOT NULL,
  `nama_grup` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_grup`
--

INSERT INTO `tbl_grup` (`id_grup`, `nama_grup`) VALUES
(1, 'admin'),
(2, 'user');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id_user` int(10) NOT NULL,
  `username` varchar(10) NOT NULL,
  `nama_user` varchar(20) NOT NULL,
  `password` varchar(10) NOT NULL,
  `level` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_buktitransfer`
--
ALTER TABLE `tbl_buktitransfer`
  ADD PRIMARY KEY (`id_transfer`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_buktitransfer`
--
ALTER TABLE `tbl_buktitransfer`
  MODIFY `id_transfer` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id_user` int(10) NOT NULL AUTO_INCREMENT;
--
-- Database: `devita_shop`
--
CREATE DATABASE IF NOT EXISTS `devita_shop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `devita_shop`;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_buktitransfer`
--

CREATE TABLE `tbl_buktitransfer` (
  `id_transfer` int(11) NOT NULL,
  `nama_pengirim` varchar(50) CHARACTER SET latin1 NOT NULL,
  `tgl_transfer` date NOT NULL,
  `jam_transfer` time NOT NULL,
  `bank_transfer` varchar(20) CHARACTER SET latin1 NOT NULL,
  `foto_bukti` varchar(50) CHARACTER SET latin1 NOT NULL,
  `no_penjualan` varchar(16) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_buktitransfer`
--

INSERT INTO `tbl_buktitransfer` (`id_transfer`, `nama_pengirim`, `tgl_transfer`, `jam_transfer`, `bank_transfer`, `foto_bukti`, `no_penjualan`) VALUES
(5, 'Rangga Putra', '2020-06-20', '20:13:07', 'BRI', 'bkt-1592668874.jpg', 'PJL/20200601/001');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_datapenerima`
--

CREATE TABLE `tbl_datapenerima` (
  `id_datapenerima` int(11) NOT NULL,
  `nama_penerima` varchar(60) CHARACTER SET latin1 NOT NULL,
  `nohp_penerima` varchar(15) CHARACTER SET latin1 NOT NULL,
  `alamat_penerima` text CHARACTER SET latin1 NOT NULL,
  `kode_pos` varchar(10) CHARACTER SET latin1 NOT NULL,
  `provinsi_penerima` varchar(50) CHARACTER SET latin1 NOT NULL,
  `kabkota_penerima` varchar(50) CHARACTER SET latin1 NOT NULL,
  `kurir_pengiriman` varchar(8) CHARACTER SET latin1 NOT NULL,
  `paket_pengiriman` varchar(30) CHARACTER SET latin1 NOT NULL,
  `etd_paket` varchar(15) CHARACTER SET latin1 NOT NULL,
  `ongkir_paket` int(11) NOT NULL,
  `berat_kiriman` int(11) NOT NULL,
  `no_penjualan` varchar(16) CHARACTER SET latin1 NOT NULL,
  `kode_plg` varchar(10) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_datapenerima`
--

INSERT INTO `tbl_datapenerima` (`id_datapenerima`, `nama_penerima`, `nohp_penerima`, `alamat_penerima`, `kode_pos`, `provinsi_penerima`, `kabkota_penerima`, `kurir_pengiriman`, `paket_pengiriman`, `etd_paket`, `ongkir_paket`, `berat_kiriman`, `no_penjualan`, `kode_plg`) VALUES
(19, 'Rangga Putra', '085321404002', 'Jl. Paradise, Coldplay, Kota Mataram', '20477', 'Nusa Tenggara Barat (NTB)', 'Mataram', 'tiki', 'ECO', '4', 44000, 250, 'PJL/20200601/001', '2020032901'),
(20, 'Haidar Baihaqi', '085239072433', 'Jl. Jendral Soedirman No 47, Kebun Tunggal, Semarang, Jawa Tengah.', '50227', 'Jawa Tengah', 'Semarang', 'jne', 'REG', '1-2', 15000, 750, 'PJL/20200622/001', '2020051201');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_datapengiriman`
--

CREATE TABLE `tbl_datapengiriman` (
  `id_pengiriman` int(11) NOT NULL,
  `no_resi` varchar(20) CHARACTER SET latin1 NOT NULL,
  `jasa_kirim` varchar(20) CHARACTER SET latin1 NOT NULL,
  `tgl_kirim` date NOT NULL,
  `lama_kirim` varchar(10) CHARACTER SET latin1 NOT NULL,
  `catatan_kirim` text CHARACTER SET latin1 DEFAULT NULL,
  `tgl_record` date NOT NULL,
  `no_penjualan` varchar(16) CHARACTER SET latin1 NOT NULL,
  `id_pgw` varchar(6) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_datapengiriman`
--

INSERT INTO `tbl_datapengiriman` (`id_pengiriman`, `no_resi`, `jasa_kirim`, `tgl_kirim`, `lama_kirim`, `catatan_kirim`, `tgl_record`, `no_penjualan`, `id_pgw`) VALUES
(6, 'MTR200620KB', 'Tiki', '2020-06-21', '3-5', 'Mohon segera konfirmasi kami jika barang telah diterima, Terima kasih telah berbelanja dan kami tunggu orderan selanjutnya.', '2020-06-20', 'PJL/20200601/001', 'PGW001');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_grup`
--

CREATE TABLE `tbl_grup` (
  `id_grup` int(11) NOT NULL,
  `nama_grup` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_grup`
--

INSERT INTO `tbl_grup` (`id_grup`, `nama_grup`) VALUES
(1, 'admin'),
(2, 'user');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kategori`
--

CREATE TABLE `tbl_kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_kategori`
--

INSERT INTO `tbl_kategori` (`id_kategori`, `nama_kategori`) VALUES
(1, 'Blouse'),
(2, 'Kemeja'),
(3, 'Jaket'),
(4, 'Dress');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_keranjang`
--

CREATE TABLE `tbl_keranjang` (
  `qty` int(11) NOT NULL,
  `id_prd` varchar(20) NOT NULL,
  `harga_prd` int(11) NOT NULL,
  `nama_prd` varchar(20) NOT NULL,
  `username` varchar(15) NOT NULL,
  `id_keranjang` varchar(15) NOT NULL,
  `ukuran_prd` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_keranjang`
--

INSERT INTO `tbl_keranjang` (`qty`, `id_prd`, `harga_prd`, `nama_prd`, `username`, `id_keranjang`, `ukuran_prd`) VALUES
(1, 'PRD007', 110000, 'Jihad Blue', '0', '', '0'),
(3, 'PRD001', 125000, 'Bellanova Green', '', 'PRD001', 'XL'),
(1, 'PRD005', 75000, 'Zebra Noxa Blue', 'lois', 'PRD005lois', 'L'),
(1, 'PRD005', 75000, 'Zebra Noxa Blue', '', 'PRD005', 'L'),
(1, 'PRD009', 375000, 'Dress Morilla White', '', 'PRD009', 'S'),
(1, 'PRD005', 75000, 'Zebra Noxa Blue', 'rizqa', 'PRD005rizqa', 'S');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pelanggan`
--

CREATE TABLE `tbl_pelanggan` (
  `kode_plg` varchar(10) NOT NULL,
  `nama_plg` varchar(50) NOT NULL,
  `gender_plg` enum('Laki-laki','Perempuan') NOT NULL,
  `email_plg` varchar(50) NOT NULL,
  `alamat_plg` text NOT NULL,
  `pembayaran_plg` varchar(30) NOT NULL,
  `jasa_kirim` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_pelanggan`
--

INSERT INTO `tbl_pelanggan` (`kode_plg`, `nama_plg`, `gender_plg`, `email_plg`, `alamat_plg`, `pembayaran_plg`, `jasa_kirim`) VALUES
('2020032901', 'Rangga Putra Rizdillah', 'Laki-laki', 'ranggaputra@gmail.com', '', '', ''),
('2020040401', 'Arif Setyo', 'Laki-laki', 'arifsetyo@gmail.com', '', '', ''),
('2020051201', 'Haidar Baihaqi', 'Laki-laki', 'haidarbaihaqi@gmail.com', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_penjualan`
--

CREATE TABLE `tbl_penjualan` (
  `no_penjualan` varchar(16) NOT NULL,
  `tgl_penjualan` date NOT NULL,
  `jam_penjualan` time NOT NULL,
  `total_penjualan` int(11) NOT NULL,
  `diskon_penjualan` int(11) NOT NULL,
  `bayar_penjualan` int(11) NOT NULL,
  `metode_penjualan` enum('Offline','Online') NOT NULL,
  `lunas_penjualan` enum('Lunas','Pending') NOT NULL,
  `status_penjualan` enum('Belum Bayar','Menunggu Verifikasi','Verifikasi','Dikirim','Selesai') NOT NULL,
  `kode_plg` varchar(10) DEFAULT NULL,
  `id_pgw` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_penjualan`
--

INSERT INTO `tbl_penjualan` (`no_penjualan`, `tgl_penjualan`, `jam_penjualan`, `total_penjualan`, `diskon_penjualan`, `bayar_penjualan`, `metode_penjualan`, `lunas_penjualan`, `status_penjualan`, `kode_plg`, `id_pgw`) VALUES
('PJL/20200522/001', '2020-05-22', '12:33:46', 90000, 0, 90000, 'Offline', 'Lunas', 'Selesai', NULL, 'PGW001'),
('PJL/20200527/001', '2020-05-27', '11:59:56', 234000, 10, 250000, 'Offline', 'Lunas', 'Selesai', NULL, 'PGW001'),
('PJL/20200601/001', '2020-06-02', '00:10:35', 90000, 0, 0, 'Online', 'Lunas', 'Dikirim', '2020032901', NULL),
('PJL/20200602/002', '2020-06-02', '20:23:31', 220000, 0, 250000, 'Offline', 'Lunas', 'Selesai', NULL, 'PGW001'),
('PJL/20200622/001', '2020-06-22', '18:58:07', 260000, 0, 0, 'Online', 'Pending', 'Belum Bayar', '2020051201', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_penjualandetail`
--

CREATE TABLE `tbl_penjualandetail` (
  `no_pjl_detail` int(11) NOT NULL,
  `id_prd` varchar(12) NOT NULL,
  `id_ukuran` int(11) NOT NULL,
  `harga_prd` int(11) NOT NULL,
  `diskon_prd` int(11) NOT NULL,
  `jml_prd` int(11) NOT NULL,
  `subtotal_prd` int(11) NOT NULL,
  `no_penjualan` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_penjualandetail`
--

INSERT INTO `tbl_penjualandetail` (`no_pjl_detail`, `id_prd`, `id_ukuran`, `harga_prd`, `diskon_prd`, `jml_prd`, `subtotal_prd`, `no_penjualan`) VALUES
(19, 'PRD003', 87, 90000, 0, 1, 90000, 'PJL/20200522/001'),
(26, 'PRD014', 132, 170000, 0, 1, 170000, 'PJL/20200527/001'),
(27, 'PRD013', 128, 90000, 0, 1, 90000, 'PJL/20200527/001'),
(28, 'PRD003', 87, 90000, 0, 1, 90000, 'PJL/20200601/001'),
(29, 'PRD013', 127, 90000, 0, 1, 90000, 'PJL/20200602/002'),
(31, 'PRD012', 124, 170000, 0, 1, 170000, 'PJL/20200622/001'),
(32, 'PRD013', 127, 90000, 0, 1, 90000, 'PJL/20200622/001');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_produk`
--

CREATE TABLE `tbl_produk` (
  `id_prd` varchar(12) NOT NULL,
  `nama_prd` varchar(60) NOT NULL,
  `kategori_prd` varchar(15) NOT NULL,
  `harga_prd` int(11) NOT NULL,
  `diskon_prd` int(11) NOT NULL,
  `stok_prd` int(11) NOT NULL,
  `berat_prd` int(11) NOT NULL,
  `deskripsi_prd` text DEFAULT NULL,
  `gambar_prd` varchar(70) NOT NULL,
  `S` int(11) NOT NULL,
  `M` int(11) NOT NULL,
  `L` int(11) NOT NULL,
  `XL` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_produk`
--

INSERT INTO `tbl_produk` (`id_prd`, `nama_prd`, `kategori_prd`, `harga_prd`, `diskon_prd`, `stok_prd`, `berat_prd`, `deskripsi_prd`, `gambar_prd`, `S`, `M`, `L`, `XL`) VALUES
('PRD001', 'Bellanova Green', '1', 125000, 0, 20, 200, 'Deskripsi Product : \r\n - Blouse Casual Lengan Panjang\r\n - Dengan Detail Kupnat Dibagian Depan\r\n - Bentuk Lengan Baloon dengan Mnaset dua Kancing \r\n- Bukaan Dengan Kancing Dibagian Belakang \r\n- SIluet A-line yang Nyaman dan Leluasa untuk untuk Dikenakan\r\n - Material Premium Tidak Stretch dan Tidak Transparent \r\n SKU : A3100265149  \r\n\r\nUkuran Product : \r\nLebar Bahu X Lingkar Dada X Panjang Baju X Panjang lengan\r\n - S (35 CM X 94 CM X 65 CM X 55 CM)\r\n - M (37 CM X 98 CM X 66 CM X 56 CM) \r\n- L (39 CM X 102 CM X 67 CM X 57 CM)\r\n - XL (41 CM X 104 CM X 68 CM X 58 CM) \r\n\r\n Perawatan : Cuci terpisah Gunakan detergen yang lembut Jangan diputar dalam mesin cuci saat pengeringan Jangan gunakan pemutih Setrika suhu rendah', 'download.jpg', 4, 5, 12, 22),
('PRD002', 'Dellish vertical Bata', '2', 97000, 0, 42, 250, 'Warna : Lilac, Black, Light Gray, Sage Green\r\nMaterial : Chiffon\r\nSKU :  B1100266001\r\nB1100222002, B1100203003\r\n\r\nUkuran yang Dikenakan Model\r\nSize: M\r\nTinggi Model: 176 cm\r\nLingkar dada x Pinggang x Pinggul : 82cm x 60cm x 88cm\r\n\r\nLingkar Dada    :\r\nS 102 , M 106 , L 110 , XL 114 cm\r\nLebar Bahu  :\r\nS 12 , M 14, L 16 , XL 18 cm\r\nPanjang Tangan :\r\nS 42 , M 44 , L 46 , XL 48 cm\r\nPanjang Baju  :\r\nS 68 , M 70 , L 72, XL 74 cm\r\n\r\nCUCI DENGAN TANGAN\r\nJANGAN GUNAKAN PEMUTIH \r\nHINDARI DRY CLEAN \r\nSETRIKA DENGAN SUHU RENDAH\r\n', '0d93321efd98f6c37ca58e28a40be4f2.jpg', 12, 22, 2, 8),
('PRD003', 'Dress Anora', '4', 375000, 0, 38, 450, NULL, '6ea7fcad24b08988d24bd5fd5016085f.jpg', 8, 8, 9, 1),
('PRD005', 'Zebra Noxa Blue', '2', 75000, 0, 26, 250, 'Warna : Lilac, Black, Light Gray, Sage Green\r\nMaterial : Chiffon\r\nSKU :  B1100266001\r\nB1100222002, B1100203003\r\n\r\nUkuran yang Dikenakan Model\r\nSize: M\r\nTinggi Model: 176 cm\r\nLingkar dada x Pinggang x Pinggul : 82cm x 60cm x 88cm\r\n\r\nLingkar Dada    :\r\nS 102 , M 106 , L 110 , XL 114 cm\r\nLebar Bahu  :\r\nS 12 , M 14, L 16 , XL 18 cm\r\nPanjang Tangan :\r\nS 42 , M 44 , L 46 , XL 48 cm\r\nPanjang Baju  :\r\nS 68 , M 70 , L 72, XL 74 cm\r\n\r\nCUCI DENGAN TANGAN\r\nJANGAN GUNAKAN PEMUTIH \r\nHINDARI DRY CLEAN \r\nSETRIKA DENGAN SUHU RENDAH\r\n', '9c5214900391b95deae0d95f646523ae.jpg', 0, 0, 0, 0),
('PRD006', 'Xuana Alexandra', '1', 82000, 0, 28, 250, 'Deskripsi Product : \r\n - Blouse Casual Lengan Panjang\r\n - Dengan Detail Kupnat Dibagian Depan\r\n - Bentuk Lengan Baloon dengan Mnaset dua Kancing \r\n- Bukaan Dengan Kancing Dibagian Belakang \r\n- SIluet A-line yang Nyaman dan Leluasa untuk untuk Dikenakan\r\n - Material Premium Tidak Stretch dan Tidak Transparent \r\n SKU : A3100265149  \r\n\r\nUkuran Product : \r\nLebar Bahu X Lingkar Dada X Panjang Baju X Panjang lengan\r\n - S (35 CM X 94 CM X 65 CM X 55 CM)\r\n - M (37 CM X 98 CM X 66 CM X 56 CM) \r\n- L (39 CM X 102 CM X 67 CM X 57 CM)\r\n - XL (41 CM X 104 CM X 68 CM X 58 CM) \r\n\r\n Perawatan : Cuci terpisah Gunakan detergen yang lembut Jangan diputar dalam mesin cuci saat pengeringan Jangan gunakan pemutih Setrika suhu rendah', '30e9351c0d6551d1da6bc3318cf18965.jpg', 0, 0, 0, 0),
('PRD007', 'Jihad Blue', '1', 110000, 0, 13, 250, 'Deskripsi Product : \r\n - Blouse Casual Lengan Panjang\r\n - Dengan Detail Kupnat Dibagian Depan\r\n - Bentuk Lengan Baloon dengan Mnaset dua Kancing \r\n- Bukaan Dengan Kancing Dibagian Belakang \r\n- SIluet A-line yang Nyaman dan Leluasa untuk untuk Dikenakan\r\n - Material Premium Tidak Stretch dan Tidak Transparent \r\n SKU : A3100265149  \r\n\r\nUkuran Product : \r\nLebar Bahu X Lingkar Dada X Panjang Baju X Panjang lengan\r\n - S (35 CM X 94 CM X 65 CM X 55 CM)\r\n - M (37 CM X 98 CM X 66 CM X 56 CM) \r\n- L (39 CM X 102 CM X 67 CM X 57 CM)\r\n - XL (41 CM X 104 CM X 68 CM X 58 CM) \r\n\r\n Perawatan : Cuci terpisah Gunakan detergen yang lembut Jangan diputar dalam mesin cuci saat pengeringan Jangan gunakan pemutih Setrika suhu rendah', '054afe9bed77cd12aaf097dcf7decaeb.jpg', 0, 0, 0, 0),
('PRD008', 'Turbidity Jordan', '1', 140000, 0, 27, 250, 'Deskripsi Product : \r\n - Blouse Casual Lengan Panjang\r\n - Dengan Detail Kupnat Dibagian Depan\r\n - Bentuk Lengan Baloon dengan Mnaset dua Kancing \r\n- Bukaan Dengan Kancing Dibagian Belakang \r\n- SIluet A-line yang Nyaman dan Leluasa untuk untuk Dikenakan\r\n - Material Premium Tidak Stretch dan Tidak Transparent \r\n SKU : A3100265149  \r\n\r\nUkuran Product : \r\nLebar Bahu X Lingkar Dada X Panjang Baju X Panjang lengan\r\n - S (35 CM X 94 CM X 65 CM X 55 CM)\r\n - M (37 CM X 98 CM X 66 CM X 56 CM) \r\n- L (39 CM X 102 CM X 67 CM X 57 CM)\r\n - XL (41 CM X 104 CM X 68 CM X 58 CM) \r\n\r\n Perawatan : Cuci terpisah Gunakan detergen yang lembut Jangan diputar dalam mesin cuci saat pengeringan Jangan gunakan pemutih Setrika suhu rendah', '74f997399d1f8b982bb5466851605aae.jpg', 0, 0, 0, 0),
('PRD009', 'Dress Morilla White', '4', 375000, 0, 30, 450, '', '76e44b4a0d261504338e7af41467ed06.jpg', 0, 0, 0, 0),
('PRD010', 'Noxa Korean Set', '4', 500000, 0, 44, 250, '', 'd6d48b5b1d6a55e65fde809538650c77.jpg', 0, 0, 0, 0),
('PRD011', 'Blouse Atia', '1', 100000, 0, 30, 200, 'Deskripsi Product : \r\n - Blouse Casual Lengan Panjang\r\n - Dengan Detail Kupnat Dibagian Depan\r\n - Bentuk Lengan Baloon dengan Mnaset dua Kancing \r\n- Bukaan Dengan Kancing Dibagian Belakang \r\n- SIluet A-line yang Nyaman dan Leluasa untuk untuk Dikenakan\r\n - Material Premium Tidak Stretch dan Tidak Transparent \r\n SKU : A3100265149  \r\n\r\nUkuran Product : \r\nLebar Bahu X Lingkar Dada X Panjang Baju X Panjang lengan\r\n - S (35 CM X 94 CM X 65 CM X 55 CM)\r\n - M (37 CM X 98 CM X 66 CM X 56 CM) \r\n- L (39 CM X 102 CM X 67 CM X 57 CM)\r\n - XL (41 CM X 104 CM X 68 CM X 58 CM) \r\n\r\n Perawatan : Cuci terpisah Gunakan detergen yang lembut Jangan diputar dalam mesin cuci saat pengeringan Jangan gunakan pemutih Setrika suhu rendah', 'ef86fdf9bca08bf57c355f556332feae.jpg', 0, 0, 0, 0),
('PRD012', 'Loli Rafeila', '1', 125000, 0, 15, 500, 'Deskripsi Product : \r\n - Blouse Casual Lengan Panjang\r\n - Dengan Detail Kupnat Dibagian Depan\r\n - Bentuk Lengan Baloon dengan Mnaset dua Kancing \r\n- Bukaan Dengan Kancing Dibagian Belakang \r\n- SIluet A-line yang Nyaman dan Leluasa untuk untuk Dikenakan\r\n - Material Premium Tidak Stretch dan Tidak Transparent \r\n SKU : A3100265149  \r\n\r\nUkuran Product : \r\nLebar Bahu X Lingkar Dada X Panjang Baju X Panjang lengan\r\n - S (35 CM X 94 CM X 65 CM X 55 CM)\r\n - M (37 CM X 98 CM X 66 CM X 56 CM) \r\n- L (39 CM X 102 CM X 67 CM X 57 CM)\r\n - XL (41 CM X 104 CM X 68 CM X 58 CM) \r\n\r\n Perawatan : Cuci terpisah Gunakan detergen yang lembut Jangan diputar dalam mesin cuci saat pengeringan Jangan gunakan pemutih Setrika suhu rendah', 'f39b6e09bdde780684d3cd0b0c3e8fac.jpg', 0, 0, 0, 0),
('PRD013', 'Inara Dress', '4', 90000, 0, 44, 250, '', 'ff1f7d384c83f810602b2ba866fe4ac3.jpg', 0, 0, 0, 0),
('PRD014', 'Vinnera', '1', 170000, 0, 30, 500, 'Deskripsi Product : \r\n - Blouse Casual Lengan Panjang\r\n - Dengan Detail Kupnat Dibagian Depan\r\n - Bentuk Lengan Baloon dengan Mnaset dua Kancing \r\n- Bukaan Dengan Kancing Dibagian Belakang \r\n- SIluet A-line yang Nyaman dan Leluasa untuk untuk Dikenakan\r\n - Material Premium Tidak Stretch dan Tidak Transparent \r\n SKU : A3100265149  \r\n\r\nUkuran Product : \r\nLebar Bahu X Lingkar Dada X Panjang Baju X Panjang lengan\r\n - S (35 CM X 94 CM X 65 CM X 55 CM)\r\n - M (37 CM X 98 CM X 66 CM X 56 CM) \r\n- L (39 CM X 102 CM X 67 CM X 57 CM)\r\n - XL (41 CM X 104 CM X 68 CM X 58 CM) \r\n\r\n Perawatan : Cuci terpisah Gunakan detergen yang lembut Jangan diputar dalam mesin cuci saat pengeringan Jangan gunakan pemutih Setrika suhu rendah', 'LINNET Pattern _ No_122 Standing Collar Blouse _ Etsy.jpg', 0, 0, 0, 0),
('PRD015', 'Jenny Dress', '2', 130000, 0, 17, 250, 'Warna : Lilac, Black, Light Gray, Sage Green\r\nMaterial : Chiffon\r\nSKU :  B1100266001\r\nB1100222002, B1100203003\r\n\r\nUkuran yang Dikenakan Model\r\nSize: M\r\nTinggi Model: 176 cm\r\nLingkar dada x Pinggang x Pinggul : 82cm x 60cm x 88cm\r\n\r\nLingkar Dada    :\r\nS 102 , M 106 , L 110 , XL 114 cm\r\nLebar Bahu  :\r\nS 12 , M 14, L 16 , XL 18 cm\r\nPanjang Tangan :\r\nS 42 , M 44 , L 46 , XL 48 cm\r\nPanjang Baju  :\r\nS 68 , M 70 , L 72, XL 74 cm\r\n\r\nCUCI DENGAN TANGAN\r\nJANGAN GUNAKAN PEMUTIH \r\nHINDARI DRY CLEAN \r\nSETRIKA DENGAN SUHU RENDAH\r\n', 'Purple - Plaid - Point Collar - Unlined - Dresses.jpg', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_stock`
--

CREATE TABLE `tbl_stock` (
  `stock_id` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `type` enum('in','out') NOT NULL,
  `detail` varchar(200) NOT NULL,
  `id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `date` date NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_supplier`
--

CREATE TABLE `tbl_supplier` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_supplier`
--

INSERT INTO `tbl_supplier` (`id`, `nama`, `no_telp`, `alamat`, `deskripsi`, `created`, `updated`) VALUES
(1, 'fashion.id', '081223564889', 'Surabaya', NULL, '2021-07-07 08:05:39', NULL),
(2, 'shoes.id', '089223678991', ' lumajang kota', ' toko berbagai macam jenis sepatu', '2021-07-07 08:05:39', '2021-07-12 03:15:05'),
(7, 'toko baju', '0883467331', ' BWI', ' semua baju', '2021-07-11 14:57:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_unit`
--

CREATE TABLE `tbl_unit` (
  `id` int(11) NOT NULL,
  `unit` varchar(100) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_unit`
--

INSERT INTO `tbl_unit` (`id`, `unit`, `created`, `updated`) VALUES
(1, 'PCS', '2021-07-13 05:39:14', NULL),
(2, 'Buah', '2021-07-13 05:39:25', NULL),
(3, 'Kilogram', '2021-07-13 05:39:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(10) NOT NULL,
  `grup` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id_user`, `username`, `email`, `password`, `grup`) VALUES
(1, 'rizqa', 'rizqa@gmail.com', '1234', 2),
(2, 'lois', 'lois@gmail.com', '1234', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_buktitransfer`
--
ALTER TABLE `tbl_buktitransfer`
  ADD PRIMARY KEY (`id_transfer`),
  ADD KEY `bkt_nopjl` (`no_penjualan`);

--
-- Indexes for table `tbl_datapenerima`
--
ALTER TABLE `tbl_datapenerima`
  ADD PRIMARY KEY (`id_datapenerima`),
  ADD KEY `pnrm_nopjl` (`no_penjualan`);

--
-- Indexes for table `tbl_datapengiriman`
--
ALTER TABLE `tbl_datapengiriman`
  ADD PRIMARY KEY (`id_pengiriman`),
  ADD KEY `pngrmn_nopjl` (`no_penjualan`);

--
-- Indexes for table `tbl_pelanggan`
--
ALTER TABLE `tbl_pelanggan`
  ADD PRIMARY KEY (`kode_plg`);

--
-- Indexes for table `tbl_penjualan`
--
ALTER TABLE `tbl_penjualan`
  ADD PRIMARY KEY (`no_penjualan`),
  ADD KEY `pjl_idpgw` (`id_pgw`),
  ADD KEY `pjl_kdplg` (`kode_plg`);

--
-- Indexes for table `tbl_penjualandetail`
--
ALTER TABLE `tbl_penjualandetail`
  ADD PRIMARY KEY (`no_pjl_detail`),
  ADD KEY `pjld_idprd` (`id_prd`),
  ADD KEY `pjld_nopjl` (`no_penjualan`);

--
-- Indexes for table `tbl_produk`
--
ALTER TABLE `tbl_produk`
  ADD PRIMARY KEY (`id_prd`);

--
-- Indexes for table `tbl_stock`
--
ALTER TABLE `tbl_stock`
  ADD PRIMARY KEY (`stock_id`),
  ADD KEY `id` (`id`),
  ADD KEY `tbl_stock_ibfk_1` (`id_item`);

--
-- Indexes for table `tbl_supplier`
--
ALTER TABLE `tbl_supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_unit`
--
ALTER TABLE `tbl_unit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_buktitransfer`
--
ALTER TABLE `tbl_buktitransfer`
  MODIFY `id_transfer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_datapenerima`
--
ALTER TABLE `tbl_datapenerima`
  MODIFY `id_datapenerima` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tbl_datapengiriman`
--
ALTER TABLE `tbl_datapengiriman`
  MODIFY `id_pengiriman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_penjualandetail`
--
ALTER TABLE `tbl_penjualandetail`
  MODIFY `no_pjl_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `tbl_supplier`
--
ALTER TABLE `tbl_supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_unit`
--
ALTER TABLE `tbl_unit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_buktitransfer`
--
ALTER TABLE `tbl_buktitransfer`
  ADD CONSTRAINT `bkt_nopjl` FOREIGN KEY (`no_penjualan`) REFERENCES `tbl_penjualan` (`no_penjualan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_datapenerima`
--
ALTER TABLE `tbl_datapenerima`
  ADD CONSTRAINT `pnrm_nopjl` FOREIGN KEY (`no_penjualan`) REFERENCES `tbl_penjualan` (`no_penjualan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_datapengiriman`
--
ALTER TABLE `tbl_datapengiriman`
  ADD CONSTRAINT `pngrmn_nopjl` FOREIGN KEY (`no_penjualan`) REFERENCES `tbl_penjualan` (`no_penjualan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_penjualan`
--
ALTER TABLE `tbl_penjualan`
  ADD CONSTRAINT `pjl_kdplg` FOREIGN KEY (`kode_plg`) REFERENCES `tbl_pelanggan` (`kode_plg`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_penjualandetail`
--
ALTER TABLE `tbl_penjualandetail`
  ADD CONSTRAINT `pjld_idprd` FOREIGN KEY (`id_prd`) REFERENCES `tbl_produk` (`id_prd`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pjld_nopjl` FOREIGN KEY (`no_penjualan`) REFERENCES `tbl_penjualan` (`no_penjualan`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Database: `dev_shop`
--
CREATE DATABASE IF NOT EXISTS `dev_shop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `dev_shop`;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_buktitransfer`
--

CREATE TABLE `tbl_buktitransfer` (
  `id_transfer` int(11) NOT NULL,
  `nama_pengirim` varchar(50) CHARACTER SET latin1 NOT NULL,
  `tgl_transfer` date NOT NULL,
  `jam_transfer` time NOT NULL,
  `bank_transfer` varchar(20) CHARACTER SET latin1 NOT NULL,
  `foto_bukti` varchar(50) CHARACTER SET latin1 NOT NULL,
  `no_penjualan` varchar(16) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_buktitransfer`
--

INSERT INTO `tbl_buktitransfer` (`id_transfer`, `nama_pengirim`, `tgl_transfer`, `jam_transfer`, `bank_transfer`, `foto_bukti`, `no_penjualan`) VALUES
(5, 'Rangga Putra', '2020-06-20', '20:13:07', 'BRI', 'bkt-1592668874.jpg', 'PJL/20200601/001');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_datapenerima`
--

CREATE TABLE `tbl_datapenerima` (
  `id_datapenerima` int(11) NOT NULL,
  `nama_penerima` varchar(60) CHARACTER SET latin1 NOT NULL,
  `nohp_penerima` varchar(15) CHARACTER SET latin1 NOT NULL,
  `alamat_penerima` text CHARACTER SET latin1 NOT NULL,
  `kode_pos` varchar(10) CHARACTER SET latin1 NOT NULL,
  `provinsi_penerima` varchar(50) CHARACTER SET latin1 NOT NULL,
  `kabkota_penerima` varchar(50) CHARACTER SET latin1 NOT NULL,
  `kurir_pengiriman` varchar(8) CHARACTER SET latin1 NOT NULL,
  `paket_pengiriman` varchar(30) CHARACTER SET latin1 NOT NULL,
  `etd_paket` varchar(15) CHARACTER SET latin1 NOT NULL,
  `ongkir_paket` int(11) NOT NULL,
  `berat_kiriman` int(11) NOT NULL,
  `no_penjualan` varchar(16) CHARACTER SET latin1 NOT NULL,
  `kode_plg` varchar(10) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_datapenerima`
--

INSERT INTO `tbl_datapenerima` (`id_datapenerima`, `nama_penerima`, `nohp_penerima`, `alamat_penerima`, `kode_pos`, `provinsi_penerima`, `kabkota_penerima`, `kurir_pengiriman`, `paket_pengiriman`, `etd_paket`, `ongkir_paket`, `berat_kiriman`, `no_penjualan`, `kode_plg`) VALUES
(19, 'Rangga Putra', '085321404002', 'Jl. Paradise, Coldplay, Kota Mataram', '20477', 'Nusa Tenggara Barat (NTB)', 'Mataram', 'tiki', 'ECO', '4', 44000, 250, 'PJL/20200601/001', '2020032901'),
(20, 'Haidar Baihaqi', '085239072433', 'Jl. Jendral Soedirman No 47, Kebun Tunggal, Semarang, Jawa Tengah.', '50227', 'Jawa Tengah', 'Semarang', 'jne', 'REG', '1-2', 15000, 750, 'PJL/20200622/001', '2020051201');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_datapengiriman`
--

CREATE TABLE `tbl_datapengiriman` (
  `id_pengiriman` int(11) NOT NULL,
  `no_resi` varchar(20) CHARACTER SET latin1 NOT NULL,
  `jasa_kirim` varchar(20) CHARACTER SET latin1 NOT NULL,
  `tgl_kirim` date NOT NULL,
  `lama_kirim` varchar(10) CHARACTER SET latin1 NOT NULL,
  `catatan_kirim` text CHARACTER SET latin1 DEFAULT NULL,
  `tgl_record` date NOT NULL,
  `no_penjualan` varchar(16) CHARACTER SET latin1 NOT NULL,
  `id_pgw` varchar(6) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_datapengiriman`
--

INSERT INTO `tbl_datapengiriman` (`id_pengiriman`, `no_resi`, `jasa_kirim`, `tgl_kirim`, `lama_kirim`, `catatan_kirim`, `tgl_record`, `no_penjualan`, `id_pgw`) VALUES
(6, 'MTR200620KB', 'Tiki', '2020-06-21', '3-5', 'Mohon segera konfirmasi kami jika barang telah diterima, Terima kasih telah berbelanja dan kami tunggu orderan selanjutnya.', '2020-06-20', 'PJL/20200601/001', 'PGW001');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_grup`
--

CREATE TABLE `tbl_grup` (
  `id_grup` int(11) NOT NULL,
  `nama_grup` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_grup`
--

INSERT INTO `tbl_grup` (`id_grup`, `nama_grup`) VALUES
(1, 'admin'),
(2, 'user');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kategori`
--

CREATE TABLE `tbl_kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_kategori`
--

INSERT INTO `tbl_kategori` (`id_kategori`, `nama_kategori`) VALUES
(1, 'Blouse'),
(2, 'Kemeja'),
(3, 'Jaket'),
(4, 'Dress');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_keranjang`
--

CREATE TABLE `tbl_keranjang` (
  `qty` int(11) NOT NULL,
  `id_prd` varchar(20) NOT NULL,
  `harga_prd` int(11) NOT NULL,
  `nama_prd` varchar(20) NOT NULL,
  `username` varchar(15) NOT NULL,
  `id_keranjang` varchar(15) NOT NULL,
  `ukuran_prd` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_keranjang`
--

INSERT INTO `tbl_keranjang` (`qty`, `id_prd`, `harga_prd`, `nama_prd`, `username`, `id_keranjang`, `ukuran_prd`) VALUES
(1, 'PRD007', 110000, 'Jihad Blue', '0', '', '0'),
(3, 'PRD001', 125000, 'Bellanova Green', '', 'PRD001', 'XL'),
(3, 'PRD001', 125000, 'Bellanova Green', 'rizqa', 'PRD001rizqa', 'L'),
(1, 'PRD009', 375000, 'Dress Morilla White', 'lois', 'PRD009lois', 'S');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pelanggan`
--

CREATE TABLE `tbl_pelanggan` (
  `kode_plg` varchar(10) NOT NULL,
  `nama_plg` varchar(50) NOT NULL,
  `gender_plg` enum('Laki-laki','Perempuan') NOT NULL,
  `email_plg` varchar(50) NOT NULL,
  `username_plg` varchar(30) NOT NULL,
  `password_plg` varchar(30) NOT NULL,
  `tglregis_plg` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_pelanggan`
--

INSERT INTO `tbl_pelanggan` (`kode_plg`, `nama_plg`, `gender_plg`, `email_plg`, `username_plg`, `password_plg`, `tglregis_plg`) VALUES
('2020032901', 'Rangga Putra Rizdillah', 'Laki-laki', 'ranggaputra@gmail.com', 'rangga', 'rangga', '2020-03-29'),
('2020040401', 'Arif Setyo', 'Laki-laki', 'arifsetyo@gmail.com', 'arif', 'arif', '2020-04-04'),
('2020051201', 'Haidar Baihaqi', 'Laki-laki', 'haidarbaihaqi@gmail.com', 'haidar', 'haidar', '2020-05-12');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_penjualan`
--

CREATE TABLE `tbl_penjualan` (
  `no_penjualan` varchar(16) NOT NULL,
  `tgl_penjualan` date NOT NULL,
  `jam_penjualan` time NOT NULL,
  `total_penjualan` int(11) NOT NULL,
  `diskon_penjualan` int(11) NOT NULL,
  `bayar_penjualan` int(11) NOT NULL,
  `metode_penjualan` enum('Offline','Online') NOT NULL,
  `lunas_penjualan` enum('Lunas','Pending') NOT NULL,
  `status_penjualan` enum('Belum Bayar','Menunggu Verifikasi','Verifikasi','Dikirim','Selesai') NOT NULL,
  `kode_plg` varchar(10) DEFAULT NULL,
  `id_pgw` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_penjualan`
--

INSERT INTO `tbl_penjualan` (`no_penjualan`, `tgl_penjualan`, `jam_penjualan`, `total_penjualan`, `diskon_penjualan`, `bayar_penjualan`, `metode_penjualan`, `lunas_penjualan`, `status_penjualan`, `kode_plg`, `id_pgw`) VALUES
('PJL/20200522/001', '2020-05-22', '12:33:46', 90000, 0, 90000, 'Offline', 'Lunas', 'Selesai', NULL, 'PGW001'),
('PJL/20200527/001', '2020-05-27', '11:59:56', 234000, 10, 250000, 'Offline', 'Lunas', 'Selesai', NULL, 'PGW001'),
('PJL/20200601/001', '2020-06-02', '00:10:35', 90000, 0, 0, 'Online', 'Lunas', 'Dikirim', '2020032901', NULL),
('PJL/20200602/002', '2020-06-02', '20:23:31', 220000, 0, 250000, 'Offline', 'Lunas', 'Selesai', NULL, 'PGW001'),
('PJL/20200622/001', '2020-06-22', '18:58:07', 260000, 0, 0, 'Online', 'Pending', 'Belum Bayar', '2020051201', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_penjualandetail`
--

CREATE TABLE `tbl_penjualandetail` (
  `no_pjl_detail` int(11) NOT NULL,
  `id_prd` varchar(12) NOT NULL,
  `id_ukuran` int(11) NOT NULL,
  `harga_prd` int(11) NOT NULL,
  `diskon_prd` int(11) NOT NULL,
  `jml_prd` int(11) NOT NULL,
  `subtotal_prd` int(11) NOT NULL,
  `no_penjualan` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_penjualandetail`
--

INSERT INTO `tbl_penjualandetail` (`no_pjl_detail`, `id_prd`, `id_ukuran`, `harga_prd`, `diskon_prd`, `jml_prd`, `subtotal_prd`, `no_penjualan`) VALUES
(19, 'PRD003', 87, 90000, 0, 1, 90000, 'PJL/20200522/001'),
(26, 'PRD014', 132, 170000, 0, 1, 170000, 'PJL/20200527/001'),
(27, 'PRD013', 128, 90000, 0, 1, 90000, 'PJL/20200527/001'),
(28, 'PRD003', 87, 90000, 0, 1, 90000, 'PJL/20200601/001'),
(29, 'PRD013', 127, 90000, 0, 1, 90000, 'PJL/20200602/002'),
(31, 'PRD012', 124, 170000, 0, 1, 170000, 'PJL/20200622/001'),
(32, 'PRD013', 127, 90000, 0, 1, 90000, 'PJL/20200622/001');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_produk`
--

CREATE TABLE `tbl_produk` (
  `id_prd` varchar(12) NOT NULL,
  `nama_prd` varchar(60) NOT NULL,
  `kategori_prd` varchar(15) NOT NULL,
  `harga_prd` int(11) NOT NULL,
  `stok_prd` int(11) NOT NULL,
  `berat_prd` int(11) NOT NULL,
  `deskripsi_prd` text DEFAULT NULL,
  `gambar_prd` varchar(70) NOT NULL,
  `S` int(11) NOT NULL,
  `M` int(11) NOT NULL,
  `L` int(11) NOT NULL,
  `XL` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_produk`
--

INSERT INTO `tbl_produk` (`id_prd`, `nama_prd`, `kategori_prd`, `harga_prd`, `stok_prd`, `berat_prd`, `deskripsi_prd`, `gambar_prd`, `S`, `M`, `L`, `XL`) VALUES
('PRD001', 'Bellanova Green', '1', 125000, 20, 200, 'Deskripsi Product : \r\n - Blouse Casual Lengan Panjang\r\n - Dengan Detail Kupnat Dibagian Depan\r\n - Bentuk Lengan Baloon dengan Mnaset dua Kancing \r\n- Bukaan Dengan Kancing Dibagian Belakang \r\n- SIluet A-line yang Nyaman dan Leluasa untuk untuk Dikenakan\r\n - Material Premium Tidak Stretch dan Tidak Transparent \r\n SKU : A3100265149  \r\n\r\nUkuran Product : \r\nLebar Bahu X Lingkar Dada X Panjang Baju X Panjang lengan\r\n - S (35 CM X 94 CM X 65 CM X 55 CM)\r\n - M (37 CM X 98 CM X 66 CM X 56 CM) \r\n- L (39 CM X 102 CM X 67 CM X 57 CM)\r\n - XL (41 CM X 104 CM X 68 CM X 58 CM) \r\n\r\n Perawatan : Cuci terpisah Gunakan detergen yang lembut Jangan diputar dalam mesin cuci saat pengeringan Jangan gunakan pemutih Setrika suhu rendah', 'download.jpg', 4, 5, 12, 22),
('PRD002', 'Dellish vertical Bata', '2', 97000, 42, 250, 'Warna : Lilac, Black, Light Gray, Sage Green\r\nMaterial : Chiffon\r\nSKU :  B1100266001\r\nB1100222002, B1100203003\r\n\r\nUkuran yang Dikenakan Model\r\nSize: M\r\nTinggi Model: 176 cm\r\nLingkar dada x Pinggang x Pinggul : 82cm x 60cm x 88cm\r\n\r\nLingkar Dada    :\r\nS 102 , M 106 , L 110 , XL 114 cm\r\nLebar Bahu  :\r\nS 12 , M 14, L 16 , XL 18 cm\r\nPanjang Tangan :\r\nS 42 , M 44 , L 46 , XL 48 cm\r\nPanjang Baju  :\r\nS 68 , M 70 , L 72, XL 74 cm\r\n\r\nCUCI DENGAN TANGAN\r\nJANGAN GUNAKAN PEMUTIH \r\nHINDARI DRY CLEAN \r\nSETRIKA DENGAN SUHU RENDAH\r\n', '0d93321efd98f6c37ca58e28a40be4f2.jpg', 12, 22, 2, 8),
('PRD003', 'Dress Anora', '4', 375000, 38, 450, NULL, '6ea7fcad24b08988d24bd5fd5016085f.jpg', 8, 8, 9, 1),
('PRD005', 'Zebra Noxa Blue', '2', 75000, 26, 250, 'Warna : Lilac, Black, Light Gray, Sage Green\r\nMaterial : Chiffon\r\nSKU :  B1100266001\r\nB1100222002, B1100203003\r\n\r\nUkuran yang Dikenakan Model\r\nSize: M\r\nTinggi Model: 176 cm\r\nLingkar dada x Pinggang x Pinggul : 82cm x 60cm x 88cm\r\n\r\nLingkar Dada    :\r\nS 102 , M 106 , L 110 , XL 114 cm\r\nLebar Bahu  :\r\nS 12 , M 14, L 16 , XL 18 cm\r\nPanjang Tangan :\r\nS 42 , M 44 , L 46 , XL 48 cm\r\nPanjang Baju  :\r\nS 68 , M 70 , L 72, XL 74 cm\r\n\r\nCUCI DENGAN TANGAN\r\nJANGAN GUNAKAN PEMUTIH \r\nHINDARI DRY CLEAN \r\nSETRIKA DENGAN SUHU RENDAH\r\n', '9c5214900391b95deae0d95f646523ae.jpg', 0, 0, 0, 0),
('PRD006', 'Xuana Alexandra', '1', 82000, 28, 250, 'Deskripsi Product : \r\n - Blouse Casual Lengan Panjang\r\n - Dengan Detail Kupnat Dibagian Depan\r\n - Bentuk Lengan Baloon dengan Mnaset dua Kancing \r\n- Bukaan Dengan Kancing Dibagian Belakang \r\n- SIluet A-line yang Nyaman dan Leluasa untuk untuk Dikenakan\r\n - Material Premium Tidak Stretch dan Tidak Transparent \r\n SKU : A3100265149  \r\n\r\nUkuran Product : \r\nLebar Bahu X Lingkar Dada X Panjang Baju X Panjang lengan\r\n - S (35 CM X 94 CM X 65 CM X 55 CM)\r\n - M (37 CM X 98 CM X 66 CM X 56 CM) \r\n- L (39 CM X 102 CM X 67 CM X 57 CM)\r\n - XL (41 CM X 104 CM X 68 CM X 58 CM) \r\n\r\n Perawatan : Cuci terpisah Gunakan detergen yang lembut Jangan diputar dalam mesin cuci saat pengeringan Jangan gunakan pemutih Setrika suhu rendah', '30e9351c0d6551d1da6bc3318cf18965.jpg', 0, 0, 0, 0),
('PRD007', 'Jihad Blue', '1', 110000, 13, 250, 'Deskripsi Product : \r\n - Blouse Casual Lengan Panjang\r\n - Dengan Detail Kupnat Dibagian Depan\r\n - Bentuk Lengan Baloon dengan Mnaset dua Kancing \r\n- Bukaan Dengan Kancing Dibagian Belakang \r\n- SIluet A-line yang Nyaman dan Leluasa untuk untuk Dikenakan\r\n - Material Premium Tidak Stretch dan Tidak Transparent \r\n SKU : A3100265149  \r\n\r\nUkuran Product : \r\nLebar Bahu X Lingkar Dada X Panjang Baju X Panjang lengan\r\n - S (35 CM X 94 CM X 65 CM X 55 CM)\r\n - M (37 CM X 98 CM X 66 CM X 56 CM) \r\n- L (39 CM X 102 CM X 67 CM X 57 CM)\r\n - XL (41 CM X 104 CM X 68 CM X 58 CM) \r\n\r\n Perawatan : Cuci terpisah Gunakan detergen yang lembut Jangan diputar dalam mesin cuci saat pengeringan Jangan gunakan pemutih Setrika suhu rendah', '054afe9bed77cd12aaf097dcf7decaeb.jpg', 0, 0, 0, 0),
('PRD008', 'Turbidity Jordan', '1', 140000, 27, 250, 'Deskripsi Product : \r\n - Blouse Casual Lengan Panjang\r\n - Dengan Detail Kupnat Dibagian Depan\r\n - Bentuk Lengan Baloon dengan Mnaset dua Kancing \r\n- Bukaan Dengan Kancing Dibagian Belakang \r\n- SIluet A-line yang Nyaman dan Leluasa untuk untuk Dikenakan\r\n - Material Premium Tidak Stretch dan Tidak Transparent \r\n SKU : A3100265149  \r\n\r\nUkuran Product : \r\nLebar Bahu X Lingkar Dada X Panjang Baju X Panjang lengan\r\n - S (35 CM X 94 CM X 65 CM X 55 CM)\r\n - M (37 CM X 98 CM X 66 CM X 56 CM) \r\n- L (39 CM X 102 CM X 67 CM X 57 CM)\r\n - XL (41 CM X 104 CM X 68 CM X 58 CM) \r\n\r\n Perawatan : Cuci terpisah Gunakan detergen yang lembut Jangan diputar dalam mesin cuci saat pengeringan Jangan gunakan pemutih Setrika suhu rendah', '74f997399d1f8b982bb5466851605aae.jpg', 0, 0, 0, 0),
('PRD009', 'Dress Morilla White', '4', 375000, 30, 450, '', '76e44b4a0d261504338e7af41467ed06.jpg', 0, 0, 0, 0),
('PRD010', 'Noxa Korean Set', '4', 500000, 44, 250, '', 'd6d48b5b1d6a55e65fde809538650c77.jpg', 0, 0, 0, 0),
('PRD011', 'Blouse Atia', '1', 100000, 30, 200, 'Deskripsi Product : \r\n - Blouse Casual Lengan Panjang\r\n - Dengan Detail Kupnat Dibagian Depan\r\n - Bentuk Lengan Baloon dengan Mnaset dua Kancing \r\n- Bukaan Dengan Kancing Dibagian Belakang \r\n- SIluet A-line yang Nyaman dan Leluasa untuk untuk Dikenakan\r\n - Material Premium Tidak Stretch dan Tidak Transparent \r\n SKU : A3100265149  \r\n\r\nUkuran Product : \r\nLebar Bahu X Lingkar Dada X Panjang Baju X Panjang lengan\r\n - S (35 CM X 94 CM X 65 CM X 55 CM)\r\n - M (37 CM X 98 CM X 66 CM X 56 CM) \r\n- L (39 CM X 102 CM X 67 CM X 57 CM)\r\n - XL (41 CM X 104 CM X 68 CM X 58 CM) \r\n\r\n Perawatan : Cuci terpisah Gunakan detergen yang lembut Jangan diputar dalam mesin cuci saat pengeringan Jangan gunakan pemutih Setrika suhu rendah', 'ef86fdf9bca08bf57c355f556332feae.jpg', 0, 0, 0, 0),
('PRD012', 'Loli Rafeila', '1', 125000, 15, 500, 'Deskripsi Product : \r\n - Blouse Casual Lengan Panjang\r\n - Dengan Detail Kupnat Dibagian Depan\r\n - Bentuk Lengan Baloon dengan Mnaset dua Kancing \r\n- Bukaan Dengan Kancing Dibagian Belakang \r\n- SIluet A-line yang Nyaman dan Leluasa untuk untuk Dikenakan\r\n - Material Premium Tidak Stretch dan Tidak Transparent \r\n SKU : A3100265149  \r\n\r\nUkuran Product : \r\nLebar Bahu X Lingkar Dada X Panjang Baju X Panjang lengan\r\n - S (35 CM X 94 CM X 65 CM X 55 CM)\r\n - M (37 CM X 98 CM X 66 CM X 56 CM) \r\n- L (39 CM X 102 CM X 67 CM X 57 CM)\r\n - XL (41 CM X 104 CM X 68 CM X 58 CM) \r\n\r\n Perawatan : Cuci terpisah Gunakan detergen yang lembut Jangan diputar dalam mesin cuci saat pengeringan Jangan gunakan pemutih Setrika suhu rendah', 'f39b6e09bdde780684d3cd0b0c3e8fac.jpg', 0, 0, 0, 0),
('PRD013', 'Inara Dress', '4', 90000, 44, 250, '', 'ff1f7d384c83f810602b2ba866fe4ac3.jpg', 0, 0, 0, 0),
('PRD014', 'Vinnera', '1', 170000, 30, 500, 'Deskripsi Product : \r\n - Blouse Casual Lengan Panjang\r\n - Dengan Detail Kupnat Dibagian Depan\r\n - Bentuk Lengan Baloon dengan Mnaset dua Kancing \r\n- Bukaan Dengan Kancing Dibagian Belakang \r\n- SIluet A-line yang Nyaman dan Leluasa untuk untuk Dikenakan\r\n - Material Premium Tidak Stretch dan Tidak Transparent \r\n SKU : A3100265149  \r\n\r\nUkuran Product : \r\nLebar Bahu X Lingkar Dada X Panjang Baju X Panjang lengan\r\n - S (35 CM X 94 CM X 65 CM X 55 CM)\r\n - M (37 CM X 98 CM X 66 CM X 56 CM) \r\n- L (39 CM X 102 CM X 67 CM X 57 CM)\r\n - XL (41 CM X 104 CM X 68 CM X 58 CM) \r\n\r\n Perawatan : Cuci terpisah Gunakan detergen yang lembut Jangan diputar dalam mesin cuci saat pengeringan Jangan gunakan pemutih Setrika suhu rendah', 'LINNET Pattern _ No_122 Standing Collar Blouse _ Etsy.jpg', 0, 0, 0, 0),
('PRD015', 'Jenny Dress', '2', 130000, 17, 250, 'Warna : Lilac, Black, Light Gray, Sage Green\r\nMaterial : Chiffon\r\nSKU :  B1100266001\r\nB1100222002, B1100203003\r\n\r\nUkuran yang Dikenakan Model\r\nSize: M\r\nTinggi Model: 176 cm\r\nLingkar dada x Pinggang x Pinggul : 82cm x 60cm x 88cm\r\n\r\nLingkar Dada    :\r\nS 102 , M 106 , L 110 , XL 114 cm\r\nLebar Bahu  :\r\nS 12 , M 14, L 16 , XL 18 cm\r\nPanjang Tangan :\r\nS 42 , M 44 , L 46 , XL 48 cm\r\nPanjang Baju  :\r\nS 68 , M 70 , L 72, XL 74 cm\r\n\r\nCUCI DENGAN TANGAN\r\nJANGAN GUNAKAN PEMUTIH \r\nHINDARI DRY CLEAN \r\nSETRIKA DENGAN SUHU RENDAH\r\n', 'Purple - Plaid - Point Collar - Unlined - Dresses.jpg', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(10) NOT NULL,
  `grup` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id_user`, `username`, `email`, `password`, `grup`) VALUES
(1, 'rizqa', 'rizqa@gmail.com', '1234', 2),
(2, 'lois', 'lois@gmail.com', '1234', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_buktitransfer`
--
ALTER TABLE `tbl_buktitransfer`
  ADD PRIMARY KEY (`id_transfer`),
  ADD KEY `bkt_nopjl` (`no_penjualan`);

--
-- Indexes for table `tbl_datapenerima`
--
ALTER TABLE `tbl_datapenerima`
  ADD PRIMARY KEY (`id_datapenerima`),
  ADD KEY `pnrm_nopjl` (`no_penjualan`);

--
-- Indexes for table `tbl_datapengiriman`
--
ALTER TABLE `tbl_datapengiriman`
  ADD PRIMARY KEY (`id_pengiriman`),
  ADD KEY `pngrmn_nopjl` (`no_penjualan`);

--
-- Indexes for table `tbl_pelanggan`
--
ALTER TABLE `tbl_pelanggan`
  ADD PRIMARY KEY (`kode_plg`);

--
-- Indexes for table `tbl_penjualan`
--
ALTER TABLE `tbl_penjualan`
  ADD PRIMARY KEY (`no_penjualan`),
  ADD KEY `pjl_idpgw` (`id_pgw`),
  ADD KEY `pjl_kdplg` (`kode_plg`);

--
-- Indexes for table `tbl_penjualandetail`
--
ALTER TABLE `tbl_penjualandetail`
  ADD PRIMARY KEY (`no_pjl_detail`),
  ADD KEY `pjld_idprd` (`id_prd`),
  ADD KEY `pjld_nopjl` (`no_penjualan`);

--
-- Indexes for table `tbl_produk`
--
ALTER TABLE `tbl_produk`
  ADD PRIMARY KEY (`id_prd`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_buktitransfer`
--
ALTER TABLE `tbl_buktitransfer`
  MODIFY `id_transfer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_datapenerima`
--
ALTER TABLE `tbl_datapenerima`
  MODIFY `id_datapenerima` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tbl_datapengiriman`
--
ALTER TABLE `tbl_datapengiriman`
  MODIFY `id_pengiriman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_penjualandetail`
--
ALTER TABLE `tbl_penjualandetail`
  MODIFY `no_pjl_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_buktitransfer`
--
ALTER TABLE `tbl_buktitransfer`
  ADD CONSTRAINT `bkt_nopjl` FOREIGN KEY (`no_penjualan`) REFERENCES `tbl_penjualan` (`no_penjualan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_datapenerima`
--
ALTER TABLE `tbl_datapenerima`
  ADD CONSTRAINT `pnrm_nopjl` FOREIGN KEY (`no_penjualan`) REFERENCES `tbl_penjualan` (`no_penjualan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_datapengiriman`
--
ALTER TABLE `tbl_datapengiriman`
  ADD CONSTRAINT `pngrmn_nopjl` FOREIGN KEY (`no_penjualan`) REFERENCES `tbl_penjualan` (`no_penjualan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_penjualan`
--
ALTER TABLE `tbl_penjualan`
  ADD CONSTRAINT `pjl_kdplg` FOREIGN KEY (`kode_plg`) REFERENCES `tbl_pelanggan` (`kode_plg`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_penjualandetail`
--
ALTER TABLE `tbl_penjualandetail`
  ADD CONSTRAINT `pjld_idprd` FOREIGN KEY (`id_prd`) REFERENCES `tbl_produk` (`id_prd`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pjld_nopjl` FOREIGN KEY (`no_penjualan`) REFERENCES `tbl_penjualan` (`no_penjualan`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Database: `jember`
--
CREATE DATABASE IF NOT EXISTS `jember` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `jember`;

-- --------------------------------------------------------

--
-- Table structure for table `desa`
--

CREATE TABLE `desa` (
  `id` int(10) NOT NULL,
  `nama_desa` varchar(25) NOT NULL,
  `layer` varchar(25) NOT NULL,
  `daerah` polygon NOT NULL,
  `feature_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `desa`
--

INSERT INTO `desa` (`id`, `nama_desa`, `layer`, `daerah`, `feature_id`) VALUES
(4, 'kepatihan', 'polygon kepatihan', 0x, 1),
(3, 'Kaliwates', 'polygon Kaliwates', 0x, 2),
(6, 'Sempusari', 'Desa Sempusari (Polygon)', 0x, 3),
(5, 'Desa Mangli', 'Desa Mangli', 0x, 4),
(2, 'Kebon Agung', 'Desa kebon agung(polygon)', 0x, 5),
(1, 'Desa Jember Kidul', 'Desa jember_kidul(polygon', 0x, 6),
(4, 'kepatihan', 'polygon kepatihan', 0xfeffffff0103000000010000006900000073ad6fb8fa5328418be2541671596141395cc2e56d54284179e7730b735961411026a4aeba542841154e166f74596141e8361638ef54284129ffe2e27559614194e61acc27552841572917e077596141faf283d95d552841040921cd7959614191151a538c55284108e496817b59614116aff17acc5528419e944d7c79596141ae3fb7aa0f5628415286061677596141431bbd63565628412e8f180e7459614102ea005c84562841908565e0715961414ab8eba0cf562841b8f528d16c59614181ae27420d572841121100ef68596141500e8a1d61572841db779b6e63596141ad69e37cb6572841b30227e85d5961413f1a9a77b45728417b56e7c8555961419fbc8397f1572841ccf0deb65259614189a5a4c433582841ab315699505961413f1d27542e5928416a0c419150596141022218fe325a2841fc2cc260505961417a7cbff6c25a2841e81e06b74f596141e7419843115b28416c31cbdc4e596141c1c039835a5b2841a5df37bb4c596141e1998ea4b05b2841a2b2a3284759614176214ec5735b2841d7d0dadb46596141f840e6dc4b5b28419ae6836f44596141f31df7af3a5b2841d464030a4059614124eb3b773d5b2841cf12e52b3c5961411481bc89445b28415be1471d38596141c27751de645b2841a526c87b34596141814695d6925b2841872fda7331596141739935f1cd5b28412db6e72d2f596141a797d123435c2841dd1ac44d2b5961413f289753865c2841d49c3dcf28596141f488ab959f5c284185c65b532759614174b0a33eaf5c2841a0cff807265961414b04f6bfaf5c2841e4ce57d22059614104f32a83985c28417eab766d1d596141e4f78cb2795c2841791a155018596141a797d123435c284171ae3d7e11596141bb672036195c2841693310b10b596141af8bc1c9ef5b28415fff9dc9055961410c8dcce3975b28410a73d0e400596141d428618c455b2841eddfaf67fd586141e386d01feb5a28417fb5f0adf958614150f25a278c5a2841fdb4da34f6586141cc31e4091f5a2841355c69bef3586141e462acfa6d5928412f58e41af05861417502fd54b4582841f89d31a2eb5861414cfc009107582841f3afe04ee7586141ef0379f4385728411419c6eae1586141295526c7c55628411cd563b6de5861414d89ec196b56284117714ddbda586141b4f21e3dfe5528414045de56d558614164039dafaf552841a87dc719d15861416ab0fc9474552841ff6c3697ce586141820e6c281a552841b4742381cb5861410477ece4e75428411e724ea8c95861417e75edb3bc542841f1abe735c758614121cba3024854284125473025be586141babe3af511542841627ef4d9b958614137bbe3dfd85328413b1c5bf2b6586141384554988c5328416119fb5cb3586141ea7a191c5d532841ac71565ab25861417a63521b995228414e682ee9b1586141e4ca2c5a1e5228410e55c88dad586141b842206ff5512841d32fb385ad5861415a0e6605cd51284145eaa76aaf586141c7a08f029b51284126f4e554b3586141868b14fd6751284187d8837ab5586141704186da295128413c80287db6586141ef687e833951284176f1a900c1586141f1d6ad394e51284107b6678cc85861414c07b8da5a5128414ed0ab3ccd586141e470de14715128418de31198d1586141c632604c86512841b7202134d658614177deb417a3512841c2b860a6db586141a5ad51c3b351284125b0d96ae05861418a249371c551284159202ffce358614137adf80fd151284155f16daae8586141deea1d25d951284123edefeaeb586141ff53ebab0c522841dd89c395f1586141edf1cb4f4b522841f3604647f8586141e08bfc2a6e52284167444a1bfc58614199a1d0e38352284170c2d099fe5861411514091697522841c764d2ce0259614146986538a45228411e6848dd0959614113cd7855af5228410bb8a75b0f5961410b63f967b652284166eb0aae185961419a5ef0ebb7522841f43142bb1d596141b075cfbe755228410bbe84e320596141f5186b45785228418647f23222596141bf06eea19b5228416751301d26596141bd0e4e33d3522841ec1d664f2c5961418f66507def5228412ef966c02f596141ecc1a9dc4453284135144ca639596141e2862976b0532841762fbc48455961410b33d7f4af53284165f91ca249596141e63be9ecac532841915ce27b53596141b0296c49d0532841add9cea85759614175f4ff78e25328412ca27f375a596141be4c5b76e153284149d1d2295e596141c093eb36c9532841ea77e4be6759614173ad6fb8fa532841f04f4a127159614173ad6fb8fa5328418be2541671596141, 7),
(3, 'Kaliwates', 'polygon Kaliwates', 0xfeffffff010300000001000000db000000bffd7955743b28416c7b57231b596141e1c4253cbf3b2841c47e0b041c5961415ac1112e183c2841e22da62f1d59614126431e3c943c2841353668611f596141a38fea3e023d284153ea10de21596141dfddc0c8433d2841fdf0789f23596141548acca9873d28418b5262d726596141ae4f6e09ff3d284171bc0d412c596141307c7c71eb3e2841a9296d8b325961418a411ed1623f2841c3dd1508355961411dc53466b23f2841e08cb03336596141749a3593ea3f2841553af1ee3659614160538c3348402841e191be8437596141159e4eafe2402841909318f5375961413665fa952d412841389064143759614100f765716a412841e08cb03336596141c538f13b92412841378b56c33559614139fe97a95a432841ab33892d355961410529a198c4452841e087a2e23459614137c02f17cd4628415330d54c345961419185d17644472841fc312fbd34596141759e67f57747284171df6f78355961415e671d63964728411be6d739375961415d07de84c0472841c5ec3ffb385961414280b3e1c9472841e39bda263a596141d2b3e9650448284170f8b50d3c5961414760f5464848284170fdc35e3d596141bd0c01288c482841fd5491f43d5961411732e265d9482841ab56eb643e596141ac1538d9fe48284170fdc35e3d5961415830d8de054928411df5012d3b596141fc4a78e40c492841553af1ee365961416e07e392114928418d84ee01345961418ddeed461d49284139771e7f30596141a9c557c8e948284171bc0d412c5961412e692cf8ba4828416da3c7ab25596141df33ececac48284153ea10de21596141df33ececac482841c274ef6119596141df33ececac482841a6ac0ea111596141bcacc149b6482841ddecef110c5961412e692cf8ba482841e0ddc51e08596141a12597a6bf48284188d503ed055961411b82c276ee4828415277ce95035961416e07e39211492841c01f01000359614106dbd93876492841f96e0c64015961415db0da65ae4928418ac1cba8005961417e77864cf94928416c12317dff5861418167277f384a2841c20bc9bbfd5861418167277f384a28416ef9eae7f85861414709f227364a2841a539cc58f3586141d1fca6681c4a284132785359ed586141b7d5bba3fb492841a4115cd0e8586141ce0c0636dd492841a4eef998df58614122f26530d6492841db33e95adb5861416000bb76c3492841c175243cd6586141cf6c4514b3492841a1b75f1dd1586141057b9a5aa04928414daa8f9acd58614124b2e4ec81492841c04db4b3cb586141e0630e634049284131e7bc2ac758614116d2a28703492841a485d3f2c358614110922144af48284184cc1c25c05861410da2801170482841f76a33edbc586141f02ab53b3a482841120ba425ba586141762ec949e14728414a5093e7b55861416157be95d547284114f25d90b35861417bdee838cc472841d8932839b1586141788e0828b74728414e28235fab5861413e30d3d0b447284113caed07a958614197c552ba984728414c19f96ba75861410182bd689d472841a00367b7a1586141c82388119b472841109861dd9b586141937572a983472841d92f10e49658614138f0518d604728412c1a7e2f91586141fff15b14344728418109facb8c58614131b0d0490c472841f4ac1ee58a58614186f56f22db462841b953f7de89586141a2dcd9a3a7462841d6f87568885861414b07d9766f4628416646275c86586141d5fa8db755462841643c0bba8358614182756d9b3246284184d76da17f5861414467185545462841bc216bb47c586141f3d1986b614628419f72d0887b586141f3d1986b614628414c6a0e5779586141ba7363145f462841b90d337077586141bbd3a2f2344628412db665da7658614126f04c7f0f4628410f07cbae75586141097981a9d9452841bcfe087d7358614120b0cb3bbb4528412f9d1f45705861413b37f6deb1452841f239dc9c6c586141e65196e4b84528412a7fcb5e68586141adf3608db64528419b13c6846258614174952b36b445284164b082dc5e5861410689e0769a4528419cfa7fef5b5861411e206ae7514528412c4831e359586141f908deeff14428417e46d77259586141845cd20eae4428417e46d77259586141b32aa611474428414601e8b05d5861415db5e4c2e4432841f2167a656358614171fc8d22874328410fdf5a266b58614139fe97a95a43284167e71c586d58614117d7ace4394328417f96b7836e586141ded8b66b0d432841f33eeaed6d586141a6dac0f2e04228417f91a9326d58614111f76a7fbb42284165d8f26469586141b9c12a74ad42284162c9c871655861414705c0c5a84228419f09aae25f5861414705c0c5a842284162a158e95a586141f31f60cbaf422841823cbbd05658614111f76a7fbb4228419bcd011650586141bd110b85c2422841d608d5354958614184b3d52dc0422841b54502c642586141628cea689f4228410e3070113d586141ba216a52834228410d26546f3a58614194aa9e7c4d42284197730563385861417733d3a6174228419c6ef711375861413be5fc1cd64128419c6ef71137586141ff9626939441284128c6c4a737586141ac11067771412841ef76b94339586141da7f9a9b34412841d4d6480b3c58614168236fcb05412841ed8af1873e586141114e6e9ecd402841b93be62340586141a0f142ce9e402841623d4094405861415ff34c55724028419c91594940586141cfbf16d137402841613832433f58614159130bf0f33f2841d4db565c3d58614153d389ac9f3f28410d26546f3a5861412ebcfdb43f3f28417ebf5ce635586141db36dd981c3f28419a5fcd1e33586141104532df093f28414652fd9b2f586141104532df093f28417e97ec5d2b58614183019d8d0e3f28414134a9b527586141db36dd981c3f284144257fc2235861414ef34747213f284108c23b1a20586141c0afb2f5253f2841b4af5d461b586141f6bd073c133f284160a28dc317586141a338e71ff03e28417b42fefb14586141b61f51a1bc3e28410b90afef125861412a3cfb2d973e284140e4c8a412586141ceb6da11743e28415d9363d01358614104256f36373e2841d345b2dc15586141e7ada360013e284160a28dc31758614194288344de3d2841b3aa4ff519586141e06d221dad3d28419705d16b1b58614136b3c1f57b3d284145072bdc1b586141183cf61f463d284145072bdc1b586141b966f5f20d3d28419705d16b1b586141d89d3f85ef3c2841b4af5d461b586141bb2674afb93c28417e5636401a5861417fd89d25783c2841ecf95a5918586141eaf447b2523c2841254966bd165861413a8ac79b363c2841079acb9115586141b2f65139263c28417c470c4d1658614174483cd10e3c2841264e740e1858614172589b9ecf3b28417b6560331e5861411b839a71973b28410acc57bc22586141f50bcf9b613b28410de08f00285861411443192e433b2841ed442d192c586141805fc3ba1d3b28419750a32b2f586141840fe3a9083b2841b6044ca8315861414bb1ad52063b28417fc46a37375861414bb1ad52063b2841427f7b753b5861414bb1ad52063b28415e475c3643586141805fc3ba1d3b2841d5feb893465861414a516e74303b28410c670a8d4b586141c05db9334a3b28412b20c15a4f586141bffd7955743b28412b3e154157586141c79d3a779e3b2841ef0242215e58614116d37a82ac3b2841b8bd525f62586141fb4b50dfb53b284162c9c8716558614138fa6547cd3b2841f12fc0fa695861413c4a4658e23b284162e71c586d586141aa569117fc3b2841ef48069070586141c92d9ccb073c284182aaefc7735861418b7f8663f03b28412cb157897558614138fa6547cd3b2841d7bccd9b7858614116d37a82ac3b28410d1b03f37a5861418e3f05209c3b28412ccfab6f7d586141fcab8fbd8b3b2841f27fa00b7f586141fcab8fbd8b3b284181e6979483586141360ac5148e3b28412e01389a8a586141360ac5148e3b28411075ffa592586141a8c62fc3923b2841bc8583099758614100fc6fcea03b28414aec7a929b586141ac1610d4a73b28419ef94a159f586141fb4b50dfb53b2841bca8e540a0586141395aa525a33b28410fb1a772a2586141fcab8fbd8b3b28418463f67ea45861416b181a5b7b3b2841f415458ba6586141f50bcf9b613b28416ac89397a85861411893f93e583b2841bdd055c9aa58614152f12e965a3b28414a323f01ae58614113e3d94f6d3b2841d8932839b1586141f95bafac763b28412ca1f8bbb458614113e3d94f6d3b284184a4ac9cb558614187ff83dc473b2841bf02e2f3b75861414f018e631b3b2841f560174bba5861416638d8f5fc3a284182bdf231bc5861414311ed30dc3a284131c45af3bd5861412aea016cbb3a2841151fdc69bf5861417ecf6166b43a2841dccfd005c15861410b13f7b7af3a2841d8d9eca7c35861410b13f7b7af3a28416a36c88ec5586141b3ddb6aca13a2841f792a375c7586141b3ddb6aca13a284111474cf2c9586141b3ddb6aca13a284187fea84fcd58614199568c09ab3a284131051111cf586141821f4277c93a28411565a0d8d15861416a88b806123b2841bd7f40ded8586141a1266fa1683b2841fa0af40ee7586141fcab8fbd8b3b284115c9b82dec586141fcab8fbd8b3b2841c0d93c91f0586141ded48409803b2841dca11d52f858614132bae403793b284135afedd4fb586141869f44fe713b28416e1c4d1f02596141869f44fe713b28414f8b06da08596141bffd7955743b2841def1fd620d596141bffd7955743b2841e10536a712596141bffd7955743b284152bd920416596141bffd7955743b28416c7b57231b596141, 8),
(6, 'Sempusari', 'Desa Sempusari (Polygon)', 0xfeffffff0103000000010000008900000037f3cf1328302841f6eda55ff55861413695e78125312841c59c731bfa586141798472c3283228413dfc488ff8586141fc1de06e0d3328414d005378f9586141a02c6336bc332841d5a07d04fb586141751e9efc7635284157bb3eef0059614141e857b3383628414c35d54d055961418a6f191790362841a90a373707596141fa764ade813728414b72207d075961413a78a2a0dd3728412be8acf20a5961419368a6dd0738284173f64f220e596141c0d7c1bb703828415f6e610c125961411c6b5662bf38284104151bf6145961419527e5132e3928413f2139b1175961417c83dbaee2392841a4f81f0f1a5961410369646b713a2841d6c56d261a59614164b0dd00163b2841b9fc29f81a5961413c4c1c6a7d3b2841acfaa4831a5961413c4c1c6a7d3b2841923baf23125961419aa562807a3b28414ab9b97a00596141b9da2fce913b2841a859998ef6586141b9da2fce913b284154cbd0a2ed58614145d2850b793b284118439714e6586141a4e0290cf33a28417bedc4f6d2586141c6dba8c9b83a2841b9407cafce586141828e35f6b23a28410c983d51cb586141bd553f28bd3a28415d73e31fc358614142e4528cd13a28410d63bb7bbf586141f02d9ddff83a2841a88bd41dbd586141020b7cd96e3b2841176d094ab65861412a404927863b28411c30be1ab4586141a4b135c3713b2841357b6101ae586141a4b135c3713b284126fdc0b9a8586141d56c6cb2843b2841815607d0a5586141ce032ad9b13b284129445ab7a15861411a519dacb73b2841ef373cfc9e586141ea9566bda43b2841619d5555935861410528a3a1973b2841070f8d698a586141fca139009c3b2841201de52082586141a7ce5c8b9a3b284151ab62947f586141b371edf4be3b2841b9c9e2ef7a586141291155de043c28416f7c6f1c755861410e7f18fa113c28412d6eccec71586141f9551eeff13b28418188425f6c586141ce032ad9b13b2841faefe02c61586141768dbcfa8b3b284176964f9e58586141d8b887c32e3b2841cb7b433b4758614118636a2d103b2841566307c5415861410edd008c143b284166f3be3434586141b083ba75173b28419b813ca831586141ffed5411463b2841216900322c586141b9da2fce913b2841407758e92358614169bb3748e63b2841a15608a11c586141ea667274233c28415c0995cd16586141291155de043c2841ea2f29fb135861411a519dacb73b28413b0bcfc90b586141f9841238733b28417f213b5305586141fcd02d491d3b2841c57677800158614165855f526c3a284180ecb87df95761411d840790103a28410495ac63f1576141ac988495203a2841a5807ad6ec5761418de920e9043a284101a53e17de576141935263c2d73928416884eeced6576141a024e8747d39284107b7553fcb5761419aea99e42b392841f5363083c55761411ac5c859ea3828416d9605f7c3576141027fa786a13828416d9605f7c3576141b9f7e5224a3828413506030fc657614142587e39043828410c7a0a10c95761419ec391d059372841357a5588d4576141f079477d3237284105ecd714d75761411492ed0221372841b2d161a2dc5761417cf7065c153728419986bebbe257614142b666cb0637284115decad5ea5761411175c63af8362841275ef091f05761415b2b7ce7d036284179ade8d9f657614130531e30953628411e54a2c3f95761413f42caaa633628415d23754ffa576141a16d9573063628413358acacfa5761417f1ba15dc6352841f388d920fa576141097c397480352841b97cbb65f757614140a0b23c6635284114d6017cf45761416d3ec26350352841369f45aaf35761413a6664ac14352841e384cf37f957614149551027e3342841609f9022ff57614161ca2543ad3428411c8924990558614112608ba77e342841bde844850f58614180a87d384a342841c1e07b2b19586141ca5e33e5223428419bd09eff2058614171e8c506fd33284135f1ee4728586141227e2b6bce33284114a4c6ec2d586141dc99fa709b332841e35294a832586141b1c19cb95f3328410398f3a93658614104febb0734332841f5d2b964385861413e6e50e1c3322841f74ed5373d586141ece68e7d6c322841d7c461ad405861415c7b9c1fe2312841d9407d8045586141d02cd18980312841bdb609f648586141ef0a297f1d3128410dc7319a4c5861415136f447c0302841240a0c2750586141da1023bd7e302841c1ae409c52586141b84498483a302841c32a5c6f575861410275e45317302841c0a677425c586141da3f1706003028417a513b15605861415db103a2eb2f2841864bf72f6a586141357c3654d42f28415276e0be73586141e92ec380ce2f284179fa0f647a586141c2f9f532b72f2841917a352080586141424ebb067a2f28418770e751895861419d1044f6492f2841024cd8988c586141669555d5e92e28413c58f6538f5861419de8c2e6502e284113ccfd5492586141099af750ef2d28419b6c28e1935861416d8b7489402d284195e6be3f985861414973ce03522d284125896e409a586141672232b06d2d2841a02714589b586141f053d67da62d284152d052b69e586141f370fd45cf2d28417fdaebfca0586141122061f2ea2d28418e588c44a658614142db97e1fd2d2841750de95dac5861416a10652f152e2841e223a05fb158614133eceb662f2e284126711333b75861418bdcefa3592e284158b8f7a8bb586141977f800d7e2e2841c591637bbe586141516c5bcac92e28412a694ad9c05861417cbe4fe0092f2841b2097565c258614163493ac43f2f2841827bf7f1c45861418e21987b7b2f284104596dadc8586141738f5b97882f2841b6c460dcc9586141b65665c9922f2841109074f7d458614188b855a2a82f2841e97f97cbdc586141d405c975ae2f28410b4112a0e5586141b9738c91bb2f2841c72aa616ec586141fc3a96c3c52f284124000800ee586141ff57bd8bee2f2841d1a8465ef1586141443cee8521302841be205848f558614137f3cf1328302841f6eda55ff5586141, 9),
(5, 'Desa Mangli', 'Desa Mangli', 0xfeffffff010300000001000000f700000043040a5969242841813eb470c2586141c9c4c4f9b224284167e37642c55861412cdd55f9f8242841adaf4721c55861412c7227155e252841d6a9f4abc35861410a5fcf8fbf252841903c43f4c1586141786304b53326284119ffde64bf58614157d9c5099126284198c3eb51bd586141e41067d0de26284153563a9abb5861418c794b122c2728419cb64f14ba586141fbf68f837e272841eb16658eb858614170ebba1ad52728411bda7b28b6586141853ae98b352828417103fbb1b358614112728a52832828416e2df564b158614119f751e0ca282841a55a56e7af586141190533480e292841cb1fdefdad586141b7186ea66c2928410e16a98fab5861417cb29563b92928417aa70185a95861415b2857b8162a2841f636e9fda6586141aefb48628b2a2841c29030d9a35861413f21b774e12a284166bba5b5a1586141d0462587372b2841834b08589f586141849badeeb22b28417a0bb8229c5861410007bfab0d2c2841889d8b419a58614190a313e4672c28410a97bda2985861412840681cc22c284146c41e25975861412a5072aadf2c2841edc4994e975861411782b97a122d2841ae62135898586141818a40ec3a2d28419131d0dc98586141819821547e2d284149f9439997586141f08e7511af2d284182f17fa795586141756bf2817f2e28412ab0391f925861417587b451062f2841573e2b458f586141cf4a9c6d5d2f2841ad67aace8c58614193e4c32aaa2f2841cc146be6845861413d4fd192d12f2841ab5fa5077e58614149b48404de2f2841726c007074586141dfb9defaf82f284104811fca6c586141725a857f073028416efab0c064586141f68345de113028417d4ac32d5f58614119b35f3337302841d766a67959586141e15ebaa47b302841a5eae70754586141c3392f6be53028412f0ca39f4f586141b302717d573128412c95bc794b586141ffd78b4da6312841eabb4f5d48586141c028c2686d322841396ee8c04158614141099125f232284107f2294f3c5861411c6d1fc657332841dbdfb5c5375861415ddd86249a332841259fea6634586141189b144ad6332841fa8c76dd2f5861413c534879f7332841377816ae2a586141e3ab222d27342841be22eb1f2258614118b7d6195d3428413f6375a9185861413c6f0a497e342841124465e2105861415f9e249ea334284136f125fa085861414302b33e09352841298c7288fc5761410e13c1215a35284171d4c003f557614176844d51433528419e62b229f2576141d290260f203528412c77d183ea5761413514e6f200352841e7267e41e357614186bb0b3fd1342841831ccea9e05761413ae6f06e82342841d9454d33de57614174c3afd7393428416474a408dd57614113ad47fecd332841d9454d33de5761411c6d1fc657332841e5af971bdf576141e3739e8d193328415417f65ddf5761414be52abd023328416adeeef0dd576141c0448438f4322841ef0c46c6dc576141a7f1037bdf3228413fcc7a67d95761410cfedc38bc3228413c559441d5576141746f6968a5322841570ff196d057614138edce556b32284126fd7c0dcc576141ec17b4851c3228410755536cc8576141a04299b5cd3128415114880dc5576141b97957a35b31284190760e04c4576141d515c902f630284105de6c46c4576141dfd5a0ca7f30284186196059c6576141b3caecdd49302841f580be9bc6576141e142f8d4f42f284112b20117c6576141200e8489b42f28415114880dc5576141e48be9767a2f284186196059c6576141cdc18293612f2841365a2bb8c9576141d43869b9652f2841626c9f41ce576141772c90fb882f2841927e13cbd2576141a1d29076b22f2841559373fad7576141d4542b89ec2f28414143618ddd576141f195789209302841a54d1125e0576141f68345de11302841b42e4233e5576141725a857f073028418d0a9bf5e85761413d4fd192d12f2841434b6654ec57614102cd3680972f2841a25516ecee576141470fa95a5b2f284163f38ff5ef5761411e69a8df312f284111bd742eef5761416cab1abaf52e2841434b6654ec576141af6473babd2e28411ea33cb3e85761410295b2e0892e28418b93b4cfe4576141d9eeb165602e2841881ccea9e0576141231ff18b2c2e28413bd916a5dc57614117ba3d1a202e2841d0641c25d9576141e9257053ee2d284182216520d5576141c6f655fec82d2841d2e099c1d157614119279524952d2841ef11dd3cd15761416aceba70652d2841a9450c5ed157614135c306842f2d2841eb1e797ad457614105a61fe3012d2841d7ce660dda5761416fa0c5ece62c284137e6b2e2df5761413f83de4bb92c28412396a075e55761411c54c4f6932c2841579b78c1e6576141eebff62f622c28417b360625e7576141c6a20f8f342c284174ccbb3ce65761412126cf72152c28415b8edc83e3576141968528ee062c28414dadab75de57614115c11b01092c2841fdf20d4bd6576141a961c285172c284118ad6aa0d15761413f671c7c322c2841c3ff68b3cc576141e9d129e4592c28416f5267c6c75761411766f7aa8b2c2841f209d875c2576141a2069e2f9a2c28415ffa4f92be57614123cbaa1c982c28415c83696cba5761418dc550267d2c28417da710aab6576141c6a20f8f342c284158ffe608b357614192975ba2fe2b2841d7c3f3f5b0576141e72c4e3ad72b284110bc2f04af576141b2219a4da12b2841c27878ffaa576141fedaf24d692b2841c00192d9a6576141510b3274352b2841dbbbee2ea257614184710ab7e82a28410c3d44179c576141c33c966ba82a284172c3714b975761419b1fafca7a2a2841f0877e3895576141d5fc6d33322a284136544f17955761411a3fe00df62928414928e4e796576141d5e0ab63ab292841ef0b019c9c576141219a046473292841abb616e3a0576141ec8e50773d292841ae2dfd08a5576141b10cb66403292841c00192d9a657614189efcec3d52828417a35c1faa6576141e6fba781b2282841c00192d9a657614147f64d8b97282841162b1163a45761410dfdcc525928284103577c92a2576141bab0cb5c0628284101e0956c9e5761418c1cfe95d42728418d78372a9e576141cd70a324902728415980fb1ba05761410b3c2fd94f272841a7c3b220a4576141402b21f6fe262841bc0e2e17aa5761410da986e3c42628418f803cf1ac57614145fd2b7280262841a154d1c1ae5761410b04ab3942262841d54c0dd0ac57614151461d1406262841413d85eca85761411c3b6927d025284195ef1d50a2576141d0654e5781252841966b9bec9a576141210d74a351252841888a6ade95576141ec01c0b61b2528419cda7c4b9057614196500b4fbc24284179aed046855761415ace703c8224284188fee2b37f5761419634497f352428419c4ef5207a5761416d8e48040c242841fee1be92785761411ccb60e8b423284114a9b72577576141b7a2c55a51232841a04159e37657614177325efc0e232841acaba3cb77576141c9629d22db222841d7bd17557c5761419945b681ad222841fc6541f67f5761416bb1e8ba7b222841bc03bbff80576141e5fe0e8275222841bc03bbff80576141e5fe0e82752228412778b57f845761417b04697890222841e422cbc6885761410d1cf622a32228415501102f8d576141082e29d79a2228412480ba469357614103405c8b9222284126f7a06c975761410fa50ffd9e2228412e6e87929b5761419457e935a522284160ea4504a157614101b742b1962228413fc69ec6a457614189f235c498222841413d85eca85761411393dc48a722284195ea86d9ad5761411393dc48a7222841005f8159b15761417b046978902228412507abfab4576141f7daa81986222841f878b9d4b7576141827b4f9e942228416957fe3cbc57614101b742b196222841d4cbf8bcbf576141b00f1d65c6222841a0d3bcaec15761416d56c464fe222841c57be64fc5576141724491b006232841248696e7c7576141724491b006232841abc189fac9576141fe6d510f112328413ed111decd576141219d6b643623284101e6710dd3576141be19ac8055232841cafad13cd857614178d739a6912328410bd43e59db57614143e84789e2232841fb7690aedd576141e55255f109242841d2db024bdd57614189467c332d24284149ba47b3e1576141ab7596885224284106655dfae55761414a7bf07e6d2428412a0d879be95761415c578a167e2428416ce6f3b7ec576141f35ce40c99242841ddc43820f15761411715183cba242841f60218d9f3576141c4e4d815ee2428413edc84f5f6576141510e9974f82428415d84ae96fa57614156fc65c000252841e63688cf00586141f278a6dc1f252841900d0946035861413e4ec1ac6e252841bf12e191045861410be8e869bb252841a2e19d1605586141ad52f6d1e22528418c1aa58306586141e4e6c39814262841202a2d670a5861410b04ab39422628418a9e27e70d5861419d1b38e454262841cc77940311586141d226ecd08a26284137ec8e831458614100bbb997bc26284160871ce714586141402b21f6fe2628418f8cf43216586141a89cad25e8262841066b399b1a5861419fc0138ed7262841cd72fd8c1c5861410b206d09c9262841f21a272e20586141935b601ccb26284116c350cf235861411785207bd5262841cc031c2e275861410732a0bdc026284121b11d1b2c586141682c46c7a5262841cb879e912e586141d614b91c9326284101f7c0c530586141cbaf05ab862628410d610bae31586141a3921e0a592628412a924e2931586141e9d490e41c262841fd035d033458614105710244b725284186b6363c3a586141f401c0b61b2528414b427d91435861419b3ed89ac42428413cf26a2449586141d51b97037c242841ff06cb534e5861413a2870c158242841e54c6efe5258614110826f462f2428419d0420835a5861417de1c8c1202428412d2144a46158614194ab2fa539242841232ee0e164586141bfda49fa5e24284114decd746a586141f35ce40c99242841698bcf616f586141a6a38b0cd1242841da6914ca735861414a97b24ef4242841380a7a79755861410a430dc038252841bfafb774785861413a60f460662528418cb77b667a586141dbca01c98d2528413cf846c57d586141dd531ba389252841a76c4145815861413e4ec1ac6e2528417474053783586141917e00d33a2528411e4b86ad855861419dc7f174c02428417862d2828b5861415c578a167e24284118dca44e9058614143040a59692428416c89a63b95586141d7a4b0dd772428413ffbb4159858614186fd8a91a7242841e5ded1c99d5861419dc7f174c0242841d8f80945a45861410a274bf0b12428412ca60b32a958614168bc3d888a24284188caf344b25861414f69bdca752428411e51624eba5861413f163d0d61242841abf69f49bd5861413f163d0d6124284145707215c258614143040a5969242841813eb470c2586141, 10),
(2, 'Kebon Agung', 'Desa kebon agung(polygon)', 0xfeffffff010300000001000000c500000093298e4e093f28410fbf758a635b61419d8d46140c3f28410fbf758a635b614135767acd273f2841b9bbf3e65f5b61415ca2a31e303f2841e0924c395b5b614113f88684803f2841fa1e5b77545b6141efd4541aaa3f28411fdd45184f5b614162f51748c03f2841b85c9dfd475b6141336e2d18e73f2841d9011aed415b61418b6bbedb26402841b607cdfe3a5b61414a801be64a402841413cdacf315b61419819f4e3874028418ab8af11275b61419819f4e38740284111bbe07f1c5b61417b51835882402841fc244c57185b614111f039cf3f4028415c502473125b61418107061624402841c1add8f10d5b61413bc9eef6b73f2841c48ae455025b614101390de0ac3f284102d5dd34f65a6141a2e0ba3d9c3f284112fd33adec5a6141dd15db75d63f28418cb41a07e05a6141af8ef045fd3f28414e2439f0d45a6141078c81093d4028419cd2ea94cb5a6141e40d8ec095402841665b772fc15a6141759b009be0402841fdc16063b95a6141a322ebcab9402841dbe08126b35a61417b51835882402841e608d89ea95a61412eb8aa5a45402841d1724376a55a614192c67fbaf73f2841bddcae4da15a6141e91ed25c0840284110bd3c55995a614122afb373134028416fe81471935a614111f039cf3f4028415b5280488f5a6141623748d5dd4028415e2f8cac835a6141a21a9e1579412841e0ffe0b7775a61415115c09cf8412841a26fffa06c5a6141728b66305f422841dea08ace5f5a61410a749ae97a422841bcbfab91595a61414f0d73e7b742284167bc29ee555a6141222bc7d80d432841c90070bb505a61412c8f7f9e104328411daf2160475a6141218688b7de42284184254490435a61414b5f3ddf56422841ec698a5d3e5a6141d6993b90114228411341e3af395a6141f361ac1b174228410e0581622d5a61412df28d3222422841daa67bae235a6141c5dac1eb3d4228413ad253ca1d5a61410010e223784228413daf5f2e125a6141157d91d0ac422841b170cc72105a6141389876854243284169b894e30e5a61417ed68da4ae4328412919cb050e5a614188d737d69f442841626d4acf0c5a61411a0ae9d11945284150f02358095a6141e016f926fd4528411fab8c55005a6141c0a1fcc487462841b5117689f85961410332dedb92462841c2523ab3ef5961417652a109a946284168e1795fde5961414d81399771462841bbc10767d6596141c6577f82294628414f0f83e9cd596141d9bb37482c462841571e6bb0c3596141dd696d508d462841affef8b7bb596141a4d98b398246284181d2cf66b35961415d9b741a16462841fa89b6c0a6596141a43c9acd9345284177282f69995961416cb4056cc9442841fe2a60d78e59614130daa612604428410d8592b286596141842902ce3e442841e98a45c47f596141a502b7f5b6432841b945aec17659614104be172cd942284126806ea466596141c5dac1eb3d422841e3bdb02a5a596141834ae0d432422841077c9bcb54596141279f1909924128413662dce44559614140b9548c36412841051d45e23c59614178a4f78112412841a1b50a79365961416dfe0e2ff23f28411d90e56e35596141c55eae86433f28418f38e40133596141b5a78197b03e2841fec774e32f596141fc48a74a2e3e28416b3e97132c59614158577caae03d28419c47ccc828596141989de07e8d3d28414e8f943927596141cd1454e4973d2841188466e42e5961417171b72d853d284156e464383459614147fb109a1e3d2841f6b88c1c3a596141d4da4d6c083d2841530759d43f596141d3350f4bd93c28417c01a6c246596141434ddb91bd3c284114bd5ff54b59614199a52d34ce3c28414502f7f7545961410cc6f061e43c2841f22169f05c5961413cf219b3ec3c2841aaa593ae67596141d3350f4bd93c28414a7abb926d5961411421b240b53c2841f9b29b3c7659614171d4c5c1963c2841a9eb7be67e596141702f87a0673c284172eccc1b8d59614183933f666a3c28410d8f189d9159614130e922ccba3c2841fb4d54739a59614159ba8a3ef23c2841e6f32198a25961411f2aa927e73c284181d2cf66b3596141b66d9ebfd33c2841d6d5510ab75961417b387e87993c2841300bb010bc5961417b387e87993c2841c17b1f2fbf59614101bdf97ab23c2841c8c66943c1596141f75841b5af3c2841f2c0b631c859614153671615623c28414cf61438cd59614166cbceda643c2841b8a899b5d5596141d9eb91087b3c2841cd3e2eded959614101bdf97ab23c2841b3b21fa0e0596141c27695a6053d284189c2589ce4596141d3d200b7c73d284149556b21e559614151fcbacb0f3e284153874784e6596141e9e4ee842b3e28412a978080ea5961416505b2b2413e284184ccde86ef5961418c31db034a3e2841361e2de2f859614106ad5f10313e2841c4752e4ffb596141479802060d3e2841d6f254c6fe596141479802060d3e2841b2346a25045a6141fba36829ff3d2841faeca1b4055a614113bea3aca33d28410c6ac82b095a614149a04fbb4d3d2841d84725c50b5a614123d8de2f483d28413b96f17c115a614170cc780c563d2841bebb1687125a6141257d1d51773d2841ce1fcf4c155a61411219658b743d284128552d531a5a61411974266a453d284185a3f90a205a6141a5ae241b003d284128918fa0265a61417b387e87993c2841d7c96f4a2f5a6141bdc85f9ea43c2841cfba8783395a614160154c1dc33c28412af0e5893e5a61414db19357c03c28417cdaf97b415a6141f75841b5af3c28419389fc55465a61413cf219b3ec3c284124fa6b74495a61412b33a00e193d2841f6d7c80d4c5a6141d4da4d6c083d2841553f0377525a6141b66d9ebfd33c2841cc2364575c5a6141da90d029aa3c2841ac975519635a6141eaaa0bad4e3c284190f2d829695a61412b96aea22a3c28412dae925c6e5a61419bad7ae90e3c28418d15cdc5745a614190a48302dd3b2841b10f1ab47b5a6141ff161128923b284178bb9aea7c5a614195282a5d7d3b2841ffc751437d5a61413702b41d6e3b28417ded764d7e5a6141965a06c07e3b28418c512f13815a614125433a799a3b284125db0ce3845a614183f64dfa7b3b284172c520d5875a61412bf9bc363c3b2841ef9ffbca865a6141032855c4043b2841e7868d19865a61419a6b4a5cf13a2841ae320e50875a6141d4fb2b73fc3a2841b05502ec925a6141032855c4043b284139ad0359955a6141e804235a2e3b2841a02dac739c5a614179929534793b2841037c782ba25a6141fd71d206633b28410ac7c23fa45a614105cd93e5333b2841e1d6fb3ba85a614105cd93e5333b2841f03ab401ab5a6141e1a9617b5d3b2841f35322b3ab5a6141a163fda6b03b28413b0c5a42ad5a6141c9346519e83b2841c9635bafaf5a6141d3981ddfea3b28414fa2ee6ab15a6141314c3160cc3b2841985a26fab25a614179929534793b2841dbe08126b35a61410f314cab363b2841a07394abb35a6141e65fe438ff3a2841afd74c71b65a6141032855c4043b28417bb5a90ab95a6141a1c60b3bc23a284154de50b8bd5a61411a9d51267a3a284159102d1bbf5a61414476064ef23928416974e5e0c15a6141ab5bf631d539284135206617c35a6141563580f2c5392841fae454ffc45a6141a2291acfd339284144b6fa3fc75a61412053d4e31b3a2841f4eedae9cf5a6141b93b089d373a28414c0bcb3ed45a6141890fdf4b2f3a284116d0b926d65a614174a22f9ffa392841a95997f6d95a61410be62437e7392841b8bd4fbcdc5a6141f8816c71e4392841ae95f943e65a6141b796c97b083a2841f9669f84e85a61416791eb02883a2841abb8eddff15a614155d2715eb43a284102d5dd34f65a614185fe9aafbc3a2841965ebb04fa5a6141436eb998b13a28416a55864ffd5a61419518d632613a284181048929025b6141ac8dd294d6392841b249202c0b5b61418a72eddf4039284171e6b89b165b61412f6c6535cf382841a75d2c01215b614139d01dfbd138284137ce9b1f245b61419028709de2382841494bc296275b6141b99e163149392841a480209d2c5b6141d1554320dc392841c02f2377315b6141c444ff83693a2841973f5c73355b614120f0c54f0a3b2841706803213a5b6141ecb258628f3b2841050b4fa23e5b61413efa66682d3c28415d273ff7425b614160154c1dc33c2841b85c9dfd475b6141e4917a5b9b3d2841d93d7c3a4e5b6141c3b8c533233e284172c7590a525b614169b3e7baa23e2841ccfcb710575b6141d3143144e53e2841a83ecd6f5c5b6141fa405a95ed3e284138af3c8e5f5b614134d13bacf83e2841c6063efb615b614193298e4e093f28410fbf758a635b6141, 11),
(1, 'Desa Jember Kidul', 'Desa jember_kidul(polygon', 0xfeffffff010300000001000000b4000000f5afcbe8084d284170e8b30483596141040080e3094d28416f720a2483596141ae024fe5384d28416da308f582596141ec168b4d844d2841552bfa7c815961414f6cdd4be34d28413bd03c977f59614178b41b3c744e2841ff36135e7b5961419cc99c4fcf4e2841d1014b5e7859614109cef5a71d4f2841b0c3de0a765961413142c91a674f28419668212574596141e87755f9cb4f284172e509c271596141f14bc076135028415714a3fb6f596141cd7169457b5028413db9e5156e596141ede53cb8c4502841278682ad6c596141e0193f400a512841192221746b596141cb4d41c84f5128410120bcdc6959614137529a209e512841e91d574568596141dcb3bb81bb512841cfc2995f66596141a456f378ec5128419f34791163596141f619363b27522841ba05e0d764596141c50c222d59522841d4eaf3dc66596141bf90d8af9f522841f08a5cd2685961410df5c812ec52284117dd75646b596141a8e93e5b3d5328413beae3e66d596141db0c1928765328414ed89b3f6f5961412dd05beab05328415cb2a659705961412e12b72bd4532841666457f670596141f0d1e540d053284146f5ecd16e596141c6401bb0bb5328410b5cc3986a596141ba4fb914a9532841d11bf2ad665961410e30f3f4ae5328419aaa22f262596141c6401bb0bb53284168c3a9555f5961412971098bc2532841160bcaf25959614147cf163fa1532841ddb64bc955596141e7fd7ac388532841b7dadb1753596141e7fd7ac388532841f1345452455961415edd6ff87e532841e0159e2844596141e2cabde6525328418e5dbec53e596141f43769ff1e532841421b8843395961411d457d0ded522841ee93a6b13359614167514c70ab5228417bff569d2b596141f09decbd6d52284114006793245961412c9c62674e522841dd0441b820596141726e438e76522841c84787301f59614194ff0d1f8b522841a77fc4bd1c596141d23fdf098f5228418286037a1a596141e28f93049052284110f2b3651259614185af59248a522841b05fc9e80b596141b7fec8737b5228414707819004596141ffeda0b86e5228410b6e5757005961413cec16624f522841cd19d92dfc586141d6377204025228415840de09f4586141eb03707cbc512841ef5d3f92ec586141693319acb3512841c36d22a2e95861410e032bd1ac51284194df0154e6586141c4d1f74a965128414e94277ee1586141bc3fe80e72512841dd6cddf6d9586141acadd8d24d5128416b4e37c3d15861416b7ca54c37512841044f47b9ca586141a41bc99629512841a78b5e6bc458614102ab09d11e5128415366797bbe58614188dab20016512841dcbd7c28b65861410a69ae8ffb502841d9ee7af9b5586141990503d8be502841d03cca5cb5586141b0135c919c502841ba7f10d5b358614131a2572082502841a44cad6cb258614131a25720825028417ad2395daf58614138f20b1b835028412806adbba95861412252a32581502841e858d643a5586141b23053af67502841c35f1500a3586141bffc5027225028419bb4a31fa05861418cd9765ae94f28417c318cbc9d58614183050cdda14f28414e861adc9a5861416b2348a67c4f28412896fdeb97586141485022d4444f2841b59fb13590586141935cf136034f28418a253e268d5861416789cb64cb4e284175f2dabd8b5861418ca57dd7864e2841627acc458a58614110517084374e28414c4769dd885861413f1c2951e24d284139e307a48758614194039490484d28411ffef39e85586141c72d9fbce14c2841008f897a8358614159e7ea22704c2841ce3167fd7f586141d400ce93fc4b28419be8f1be7c5861412abca350aa4b284196c097417c5861417dc872b3684b2841940543517c586141915215eaff4a2841cf14166b80586141887eaa6cb84a2841fdbf874b835861416f5a8bf46f4a28410019e099835861410ae841d8454a2841f8abda0c83586141d6820ccae949284194673ff37b586141632eff769a492841603b1b4778586141759baa8f664928414e30125c77586141fb63945ae24828414ceb664c775861413dde53817c48284170e42790795861414f4bff9948482841834889c97a586141ce5544a6e7472841834889c97a58614193a05a9d8a4728417c79879a7a586141e20b7c5f374728417a96d82c7a5861419048399dfc46284175822bee7958614113f42b4aad462841673277f3785861418baebc5b4b46284158e2c2f87758614180bd5ac0384628418d0ee7a47b586141c8ac32052c462841ba575ce37e58614151cd3dd035462841ec2a284182586141efdeaa36524628410c103c4684586141ce214b2385462841344504468758614146170617e64628415fabca168a5861410b5bebae28472841971c9ad28d58614167cd34cb52472841bf5162d2905861413e7ec57b61472841ec9ad71094586141785f4407774728411a5af62f97586141f22f9bd77f4728413edd0d939958614130706cc28347284191789c639f586141556089b286472841f8778c6da65861410621fd729247284102b49329a758614102c2aa13a447284123f2ff7ca9586141ab821ed4af4728416b0cdc81ae58614172e3fa89bd472841a4d6038cb25861411aa46e4ac9472841c61470dfb458614168085fad15482841fd0f96bab8586141009e82967848284145a01ba0bd586141fb63945ae24828418f754c95c2586141f188f87d3a492841d4c0266bc7586141b92b30756b49284104d99dd8ca5861415e8d51d6884928411e345bbecc586141632eff769a4928414cdfcc9ecf586141a45f32fdb04928419d35b05fd5586141a000e09dc2492841f39f405fdb5861410f223014dc4928415fc78ae6e2586141c0e2a3d4e74928419da55f2fe7586141ccd30570fa492841db833478eb586141b924ff150b4a28411eec5fe0ef5861419f2544c11a4a28415840de09f458614138960387254a28417b4d4c8cf658614112a6e696224a2841b0797038fa5861410d0539f6104a2841d6cb89cafc5861414d6201ffdf492841ef439842fe586141e8efb7e2b5492841fd1da35cff586141c51c92107e4928410be4003800596141e1384483394928411434b532015961414be57bdbf94828411c03b76101596141dcc32b65e04828411e5c0fb0015961410972ed13c04828415557358b055961418a00e9a2a54828417e02a76b0859614127d0fac79e482841bce07bb40c596141178046cd9d48284153e435ed16596141083092d29c482841c67885011f59614127d0fac79e4828411576107424596141a9a05198a74828412fbd201b265961416ca2dbeec6482841611a4398295961415e948235e9482841988b12542d5961415086297c0b492841c31933a2305961418d580aa333492841f3a753f033596141a9992039474928410e650d783559614118bb70af604928411cc96eb1365961415fcfac17ac4928412fa379cb375961413e124d04df4928413869d7a6385961413bf555e6134a28414474e09139596141b5c5acb61c4a2841557fe97c3a59614128464f8c244a284180f95c8c3d5961413437b127374a28419d231ca13f596141b3a8b598514a2841d494eb5c4359614108cb4aba7a4a28411711c40348596141ea6c3d069c4a284138d986764a5961413c3080c8d64a28416d7b54034e596141fcd2b7bf074b284185f3627b4f5961416c366377444b2841986b71f35059614112dadf19854b2841b764323753596141e66d79acc84b2841ec0600c456596141980258ea1b4c28412cb4d63b5b596141cb2532b7544c2841581a9d0c5e59614193c869ae854c2841803bb8cd605961412c392974904c284198c77384625961410edb1bc0b14c2841d6a548cd66596141071d7701d54c28411c67cc836b596141ed1dbcace44c284140743a066e596141f90e1e48f74c2841776f60e171596141f5afcbe8084d2841b5d78b497659614133f09cd30c4d2841ddf8a60a79596141f5afcbe8084d284170e8b30483596141, 12);

-- --------------------------------------------------------

--
-- Table structure for table `jalan`
--

CREATE TABLE `jalan` (
  `id` int(10) NOT NULL,
  `nama_jalan` varchar(25) NOT NULL,
  `layer` varchar(25) NOT NULL,
  `line` linestring NOT NULL,
  `feature_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jalan`
--

INSERT INTO `jalan` (`id`, `nama_jalan`, `layer`, `line`, `feature_id`) VALUES
(4, '', 'polygon kepatihan', 0x, 1),
(3, '', 'polygon Kaliwates', 0x, 2),
(6, '', 'Desa Sempusari (Polygon)', 0x, 3),
(5, '', 'Desa Mangli', 0x, 4),
(2, '', 'Desa kebon agung(polygon)', 0x, 5),
(1, '', 'Desa jember_kidul(polygon', 0x, 6),
(4, '', 'polygon kepatihan', 0x, 7),
(3, '', 'polygon Kaliwates', 0x, 8),
(6, '', 'Desa Sempusari (Polygon)', 0x, 9),
(5, '', 'Desa Mangli', 0x, 10),
(2, '', 'Desa kebon agung(polygon)', 0x, 11),
(1, '', 'Desa jember_kidul(polygon', 0x, 12),
(9, 'Jl.Kaca Piring', 'Desa jember_kidul(line)', 0xfeffffff010200000005000000cb605c99174d284155a1a35d8159614181548d36594d28413ae4e9d57f596141cfb87d99a54d284120ffd5d07d596141385e8492054e2841f5980f007b596141f1b0078f354e2841e4ef02b779596141, 13),
(14, 'Jl.Melati', 'Desa jember_kidul(line)', 0xfeffffff010200000009000000e1605394344e2841e4ef02b7795961418c3ebe720b4e2841011d3fd4725961418e5bb590d64d28416336d62d685961413edacd0fbf4d2841ff67e4f4605961415c38dbc39d4d284187d394e0585961417996e8777c4d284131f35a0053596141d1d574b7704d2841ee62d51a4e59614147730eab434d2841b936b16e4a59614131ae4192e94c28415506c39343596141, 14),
(18, 'Jl.Kenanga', 'Desa jember_kidul(line)', 0xfeffffff010200000009000000d67400d3344e28416392d8be79596141ac81ed88894e2841c66ceb537759614122c8a122fb4e28419f1ad2c1745961412b2f6187764f284179c8b82f72596141096c15c0585028412c24860b6d5961410507d7ac19512841f3595e0169596141460dba5b87512841cf4cf07e66596141484f159daa512841be2d3a5565596141f00f895db65128416c755af25f596141, 15),
(75, 'Jl.Bungur', 'Desa jember_kidul(line)', 0xfeffffff010200000005000000fbcfae6dcf522841ecec58746859614184ae5ef7b55228416a1c02a45f596141686d4861a25228412302269f5a596141826c03b692522841df0fa417565961412ac6b711235228414b5195ee4b596141, 16),
(73, 'Jl. 13', 'Desa jember_kidul(line)', 0xfeffffff010200000011000000e95c17a1b25328415a594e0b7059614112701763d1522841f176af93685961410785a17b0f52284196f8715562596141e9bfd462b55128416fa658c35f5961419e10d70da9502841fd9b5fce57596141b0836edac54f284198f5c71251596141a1d2e62e9a4e28411b391e81485961417ce8b5f2e74d2841cf0a953d43596141c402de0e844d2841a92e258c40596141173afd48eb4c28416a5050433c596141d9926cf96b4c284131862839385961417b091873c74b2841ee93a6b1335961414d1fe736154b2841a68d77eb2e596141291052d70a4a28412e6fd1b72659614155a7081c70492841f090fc6e225961416f3f040ce5482841b2b227261e596141825bb67ea0482841959c15501c596141, 17),
(10, 'Jl. 12', 'Desa jember_kidul(line)', 0xfeffffff010200000004000000ff5f3d58b75128416fa658c35f59614169733415f3512841b50bdae852596141e2d6dfcc2f5228413427d6d949596141a6d869234f522841c11cdde441596141, 18),
(59, 'Jl. 11', 'Desa jember_kidul(line)', 0xfeffffff01020000000d00000026ed6e05ef4a2841ca58e4a04259614165d65a96914b2841ca58e4a042596141dbdab3eedf4b2841e7f84c96445961413b81ff924f4c28410d5f13674759614122c49f7f824c284121391e81485961410a07406cb54c284121391e8148596141f8999453e94c2841d41e427c43596141e2f92b5ee74c28419ff21dd03f596141452a1a39ee4c28416a5050433c5961410c8bf6eefb4c2841145c69243659614141cbc7d9ff4c2841938b12542d5961417f0b99c4034d28414b85e38d28596141466c757a114d28412e5b247926596141, 19),
(65, 'Jl.Sultan Agung', 'Desa jember_kidul(line)', 0xfeffffff01020000000b0000004faafc99845328411cafc761485961410da419eb1653284104ad62ca46596141b88184c9ed522841f5d257b045596141cc9d363ca9522841d41e427c435961418f38012e4d522841bc1cdde44159614165ad22518951284182dc0bfa3d596141b20139a9bb502841524eebab3a5961414fd7368205502841284a217d37596141a350b1fd8f4f2841010cb529355961417c4989a3124f2841e0b99b973259614198653b16ce4e2841c3a389c130596141, 20),
(116, 'Jl.Gajah Mada 3', 'Desa jember_kidul(line)', 0xfeffffff010200000011000000a48d9593ce4e284147465fc930596141c0724f249c4e2841c5e834d1305961412d10e9176f4e2841b79880d62f596141632b56df1a4e2841982916b22d5961411c171a77cf4d2841826c5c2a2c5961417822a42e7e4d28415c90ec7829596141650cde6f134d28413116796926596141d608cac2d44c284115761074245961417a032cbf764c2841ec54f5b221596141ff1bca84f34b2841b21424c81d596141c1743935744b2841744afcbd195961412a4cc164dd4a284136e2d05515596141b1e815ada04a284114a46402135961413aa261132f4a2841e929f1f20f5961418f5d37d0dc492841c2eb849f0d59614149b6a6805d49284193d30d320a5961417d4d5dc5c24828414f6be2c905596141, 21),
(71, 'Jl.HOS Cokroaminoto', 'Desa jember_kidul(line)', 0xfeffffff010200000011000000a7b5ef10cf4e284147465fc930596141e6371c3df64e284165564a542a596141ef00245b084f2841500f3aad285961416a13d66c344f2841aba4a13226596141d9c77aca814f284187abe0ee23596141935c5908d54f28416b6d749b21596141d320e1751f502841536b0f04205961416224f5225e502841389aa83d1e59614159b7490a925028412c19f6711d5961414ceb4b92d7502841141791da1b596141fb8ec83418512841fabbd3f419596141450257fc51512841e243c57c185961411e379e2fa7512841beac00db1559614169aa2cf7e05128419f5143f513596141e95d8ca91e522841890a334e1259614157d0d5c548522841761c7bf5105961419943648d825228415cd56a4e0f596141, 22),
(53, 'Jl.Jayakalwang', 'Desa jember_kidul(line)', 0xfeffffff01020000000a0000008c083b99894c28417a95ce1822596141d198c07e8e4c28415885b6530e596141baf857898c4c2841cd8c050605596141f3977bd37e4c2841556e5fd2fc5861410d9736286f4c2841cfeb5765f3586141b9b6fc47694c284170cf16c9ec586141cf56653d6b4c28414e91aa75ea5861417db8869e884c284136199cfde85861414afc6b36cb4c284136199cfde858614130647046564d28413b2d493ce9586141, 23),
(42, 'Jl. 8', 'Desa jember_kidul(line)', 0xfeffffff010200000002000000baf857898c4c2841d98361b205596141fa1db3a7014e2841d90db8d105596141, 24),
(39, 'Jl.11', 'Desa jember_kidul(line)', 0xfeffffff01020000000200000028d84cbe824c284177981ee7fe58614182fc6231e84d2841745373d7fe586141, 25),
(35, 'Jl. 10', 'Desa jember_kidul(line)', 0xfeffffff010200000008000000b73246c5224c28414fa5b1281f5961417e93227b304c28414e49af970d5961418de3d675314c2841cf475af604596141d2735c5b364c284115addb1bf85861415ff3b9852e4c28419966db6aef58614144b2a3ef1a4c2841f1cdc127e4586141b2919824114c28414ebffe03d95861417d51c7390d4c28412c8192b0d6586141, 26),
(27, 'Jl.Jayanegara', 'Desa jember_kidul(line)', 0xfeffffff0102000000080000009d964832354a28416d4270db0f5961414557bcf2404a2841ae09eea20259614164f724e8424a284187412b3000596141d2d6191d394a284128113d55f95861412575f8bb1b4a284193dc844bef58614142d30570fa492841f0571847e458614158311324d94928412c8192b0d658614121afe6f7b1492841ad233b7ebc586141, 27),
(26, 'Jl. 9', 'Desa jember_kidul(line)', 0xfeffffff0102000000020000005bf724e8424a28418dcb814f0059614194338b70324c2841a0b939a801596141, 28),
(103, 'Jl.Kertajaya', 'Desa jember_kidul(line)', 0xfeffffff010200000005000000a2da24c5944b28419b1b364a0159614174ea07d5914b2841de3b0c60f4586141c3299414864b28413ba3f21ce95861413a0989497c4b2841a246e095de5861413a0989497c4b2841422a9ff9d7586141, 29),
(89, 'Jl.Kertabumi', 'Desa jember_kidul(line)', 0xfeffffff010200000011000000da016af4e14928416bc1639bda58614131665a572e4a284166adb65cda586141caabc945904a28415ab65ab0d95861417991a129f44a2841507a53f4d85861413a0989497c4b2841c487c9f1d758614164f6afdfd64b2841345094dfd6586141807921b70d4c2841b02368b8d6586141c223a860354c28412600e0e4d558614137e6a577604c2841fddec423d35861418c083b99894c2841ecbf0efad1586141cb8a67c5b04c2841ddf9b01ed15861413aacb73bca4c284177e613d6c9586141eef0e17e1c4d2841580100d1c758614181ba07f0c44d28411e37d8c6c3586141155fc93d154e2841fdf86b73c15861413a49fa79c74e2841bf1a972abd586141b2d109555c4f284185dac53fb9586141, 30),
(85, 'Jl.KH Siddiq', 'Desa jember_kidul(line)', 0xfeffffff010200000013000000600cdd81495228415d7fbc422059614173e633b3e1512841a95143f513596141f332d400a451284155400b440e5961417e70d6e9785128410e262f3f095961416edec6ad54512841cb33adb704596141bcdbf7ab25512841667968bdfd586141bef8eec9f050284106e77d40f758614145954312b4502841816476d3ed58614133c1d8946c502841e024b5dee2586141f65ba386105028410d9c7eabd45861410a7855f9cb4f28416151b4cbc85861419a14aa418f4f2841ee46bbd6c0586141b2d109555c4f284180dac53fb9586141fda6e0d52c4f28411d79d993b25861411205ee890b4f2841d1d4a66fad586141a1a142d2ce4e28414b529f02a4586141621f16a6a74e2841d8d1fc2c9c586141d8bcaf997a4e28416f030bf4945861412c9de979804e2841d5a6f86c8a586141, 31),
(80, 'Jl. 3', 'Desa jember_kidul(line)', 0xfeffffff0102000000020000003b2723f17b5228410e262f3f0959614162f2dbbd265228412ac697340b596141, 32),
(100, 'Jl. 7', 'Desa jember_kidul(line)', 0xfeffffff01020000000200000046d6294b6b522841ae09eea202596141abe1b3021a522841c61f007904596141, 33),
(106, 'Jl. 6', 'Desa jember_kidul(line)', 0xfeffffff0102000000020000006b856002b750284101d64d0aee58614109d33cf6a5512841b7ec6fd6e8586141, 34),
(102, 'Jl. 5', 'Desa jember_kidul(line)', 0xfeffffff0102000000020000002d40186cce4f2841e2aedec3c8586141f57a1bf617512841eced6288c0586141, 35),
(107, 'Jl. 4', 'Desa jember_kidul(line)', 0xfeffffff01020000000b000000016df299964f28417ef499c9c1586141f5817cb2d44e2841c1707270c658614192eace72524e2841e47de0f2c8586141fb281607374e2841f1eae57fc9586141c5a6e9da0f4e28417b25989ac158614122f4ced3e14d2841e9ab3481b75861414fa29082c14d28419d07025db2586141ea2f4766974d2841384dbd62ab586141ca4d832f724d2841ec94ddffa5586141e30ae3423f4d28418c02f3829f586141c545162ae54c2841d1f1cac792586141, 36),
(112, 'Jl. 1', 'Desa jember_kidul(line)', 0xfeffffff010200000003000000de0678e02a4f28419d07025db2586141f3fdc52f8e4e2841db6f2dc5b6586141e954ab89ef4d2841193a55cfba586141, 37),
(101, '-', 'Desa jember_kidul(line)', 0xfeffffff010200000002000000e9ec761c084f2841e086570cae586141b6fad8dac84d28412f84e27eb3586141, 38),
(113, '-', 'Desa jember_kidul(line)', 0xfeffffff01020000000e000000a828efaebd4e284125ecd831a1586141ba592b3ab74d28415f2caa1ca5586141b7d574b7704d28416c900b56a658614176cf9108034d2841806a1670a7586141aceafecfae4c284198802846a9586141e447c7d87d4c2841e4245b6aae58614113a58fe14c4c284157a5fd3fb6586141fbc2cbaa274c28417ef716d2b858614141593d447d4b28417d0bc410b9586141ab0b61508e4a28418c5b780bba586141125f32fdb0492841ad0f8e3fbc586141b51739b82f492841b2ad919dbc58614173115609c2482841b74b95fbbc586141a6cd70717f482841c173ef78bd586141, 39),
(108, '-', 'Desa jember_kidul(line)', 0xfeffffff0102000000020000001342d21f4a4e28413fbd3ff8a25861411d8a1915be4d28416882582894586141, 40),
(114, 'Jl.Kyai Mojo', 'Desa jember_kidul(line)', 0xfeffffff01020000000200000064c1a10ec1482841ee320e98c05861415471ed13c0482841b990400bbd586141, 41),
(115, 'Jl.Mangkubumi', 'Desa jember_kidul(line)', 0xfeffffff01020000001200000060994791c0482841b990400bbd5861411cd2c9c9cd48284166f5b13ab7586141feaab4f7dc482841143dd2d7b1586141433b3adde1482841eb9160f7ae586141b11a2f12d8482841b7653c4bab586141c4c9356cc74828416fd5b665a6586141dec8f0c0b74828413695e57aa25861418ae8b6e0b148284114e1cf46a05861418405aefe7c482841e452aff89c586141f4019a513e482841b27fe39a99586141dfcedc74084828417dc968cf9558614135cc0d73d947284136af8cca90586141a269a766ac472841ebd95bd58b5861412ea7a94f81472841c756447289586141e7926de735472841ad85ddab875861417d7f762afa46284197c82324865861416ced66eed5462841922a20c6855861414f289ad57b4628419eabd29186586141, 42),
(2, 'Jl.Arowana', 'Desa kebon agung(line)', 0xfeffffff0102000000110000009b40b33b45462841f6fda782ad596141a6856dde0045284115d09ef8bd596141232c710aff43284167f61438cd596141b59ae5c102432841aab8d2b1d9596141eb3b0b758042284157d844aae1596141f3fa8419544228412de87da6e55961411f38f206cf41284154fb3846ed596141567e56db7b41284170aa3b20f259614179bbc3c8f64028419cbdf6bff95961411674b5c2584028414cf6d669025a614138b122b0d33f2841b68fed350a5a6141063b7c1c6d3f2841a94e290c135a6141f8a68197b03e28416d1d9ede1f5a614183fbbacb0f3e284127885aeb295a6141fa2cc295983d284186ef9454305a614101a2bef70d3d2841b20250f4375a614167144c1dc33c2841c47f766b3b5a6141, 43),
(46, 'Jl. 2', 'Desa kebon agung(line)', 0xfeffffff010200000005000000dd1a73aef141284169731c48eb5961412327ae6a5c422841da25a1c5f3596141134ef942e4422841b1538be8fd596141b7b286a15f432841c0d5f4d4065a614164a4b141ad432841c0f3a5fb0c5a6141, 44),
(8, '-', 'Desa kebon agung(line)', 0xfeffffff0102000000150000008c2d972e113e2841de01ffbe295a614109f3987d563e2841e024f35a355a614172afa3e5693e2841b94d9a083a5a6141ff8ee0b7533e2841bbf2d829695a6141539db517063e284182a8df4a755a61413c4a41ee753d28418e3912978e5a6141e6b068f0383d2841de461a259d5a614114385320123d2841a2158ff7a95a6141f6caa373dd3c2841dd8c025db45a6141e2c1ac8cab3c28411e365225c05a61413775c00d8d3c284104aa43e7c65a6141478ffb90313c2841445393afd25a6141aea6c7d7153c2841a3bacd18d95a61416c16e6c00a3c2841ad3292b3f15a6141ad0189b6e63b284193a68375f85a61417c302144af3b2841555c8a96045b6141ed06672f673b28414f6610810f5b6141c5f47861033b284154a272ce1b5b6141a5e28a939f3a28419a7d9ef9285b61415849b295623a2841c377ebe72f5b6141dc28ef674c3a2841d70d8010345b6141, 45),
(77, '-', 'Desa kebon agung(line)', 0xfeffffff0102000000170000001c777d51873a28413eb72c0ef05a61415fac9d89c13a284108d45431ee5a61416b28f72e213b28415deb0111ed5a6141aa44a9b55a3b2841d7ac6e55eb5a6141065ba82a9b3b28419bc99678e95a61419e43dce3b63b2841552acd9ae85a6141e7916acdf13b2841ba7356dde85a614188ac7ae90e3c2841d7ac6e55eb5a614194b571d0403c2841e610271bee5a6141308537d85b3c2841fd176330ef5a6141ef9994e27f3c28410d063194ef5a6141fbe31125de3c284117380df7f05a6141daf0217ac13d28411a517ba8f15a614169a779d0db3d28412ccea11ff55a6141e5c73cfef13d284111604408025b61411f581e15fd3d2841f5bac718085b614132eeb23d013e2841eab022c7175b6141a4dc9908163e2841bee2e2421c5b6141e66c7b1f213e284118fbfc3e265b61413393f15e303e284137c36dca2b5b6141353830805f3e2841f4469888365b6141f2e8d4c4803e284163128bb73f5b6141067f69ed843e28411a0b33bb415b6141, 46),
(15, '-', 'Desa kebon agung(line)', 0xfeffffff0102000000120000000166fb3b843e28418c291cb0415b614146f7a924333e2841cf573ea1455b614117cb80d32a3e2841ee01fe05455b6141cad6e6f61c3e2841535fb284405b6141ae0e766b173e2841c507b1173e5b6141b528b1eebb3d284168b9e45f385b6141c373fb02be3d28413fbf9771315b614117cb80d32a3e284101393c45315b61410467c80d283e2841e489396b2c5b6141ff4d5a5c273e28414e8fb4ae2b5b6141cad6e6f61c3e28419fea6f8d2b5b6141bdb54e308e3d2841616414612b5b614192a29390863d284185ac14a0235b61415386e1094d3d284128060fad215b61415db8bd6c4e3d2841bc538a2f195b61415db8bd6c4e3d284176b4c051185b6141bc42ec71603d284176b4c051185b61413b208fa0023e2841e8d2a946185b6141, 47),
(4, 'Jl.Udang Windu', 'Desa mangli (Line)', 0xfeffffff010200000003000000e2d82c65b42e284174104f999058614107837f2c922e28413a1daa0187586141cbd641e28d2d2841d1ca5c174c586141, 48),
(6, '-', 'Desa mangli (Line)', 0xfeffffff01020000000800000086be723f942e2841e4f32a7889586141301b9f3f782e2841535b89ba895861411e3f05a8672e2841d989e08f88586141f978f010032e2841832337cb7b586141ada3d540b42d28417d28ce41705861417f0f087a822d28415392d75464586141517b3ab3502d284130662b50595861413828baf53b2d28416adae4fa4f586141, 49),
(11, '-', 'Desa mangli (Line)', 0xfeffffff0102000000160000002cf917c97f25284112405bec8258614194788560ac252841f1cc56bf7f586141b7a79fb5d1252841c285bdc17a58614121e8aac6072728417484c76e7a586141735e4ff4242828412a83d11b7a5861419d04506f4e2828411be461bf78586141b4ceb652672828412b41106a765861410096f0ba72282841c8f49e20705861415539c4ba8e282841438486996d586141ad65b194a62828411be9f8356d586141efa497d4352a2841aab6bf676d586141bc3ebf91822a2841a017500b6c5861419e193458ec2a284165a82dd769586141498441c0132b2841ca701cbd68586141c8cd153b592b28417b6f266a685861411f08e47cb42b28412d6e30176858614114b11173eb2b28414c6a4e1e67586141891e4c56202c2841d702f0db66586141a77b5b2fc42c28413ccbdec16558614115809054382d2841bb8febae6358614156f0f7b27a2d2841f7bc4c3162586141f9f1ff5ce12d2841b91805895f586141, 50),
(19, '-', 'Desa mangli (Line)', 0xfeffffff01020000000300000036e02bc8102c2841d4cdca676658614114b11173eb2b2841b25f5db1575861416ba57aadf52a284168a028105b586141, 51),
(88, '-', 'Desa mangli (Line)', 0xfeffffff01020000000600000068b3367bc7262841717b7d7d2b58614169f2bd9b2f2a284127f972173e5861416bebdfb4462c2841792af7674a586141c4020e40322e28417086f094545861414796990e7d2f284151d92f7d5c586141d252026312302841d64948045f586141, 52),
(55, '-', 'Desa mangli (Line)', 0xfeffffff01020000000e000000f9cac325da262841ee86e29221586141b2ff37711a27284104909cd72358614145bca0c5af2728412838c67827586141736c305c682828416d4658092b58614119f751e0ca282841834f124e2d586141dd9e5a055b292841a5c2167b30586141cd679c17cd292841a1cfb2b83358614147d184ae4d2a2841ffd9625036586141df7bba4eeb2a284176b8a7b83a586141ec85496a7a2b2841c4fb5ebd3e586141dc4e8b7cec2b2841743c2a1c4258614156b873136d2c284101e267174558614163320b6e172f28410554b7c65458614171585c592d3028418e0691ff5a586141, 53),
(50, '-', 'Desa mangli (Line)', 0xfeffffff010200000009000000743145bc972d284172c543f63d5861416f5f3a40162e28415bfe4a633f586141e2357ae10b2e2841531883de455861410cf83c2cbc2e2841268a91b848586141175df09dc82e2841cb7245e34258614130cc322b642f2841d6cff38d40586141c6d18c217f2f2841f9fb9f924b5861411e281d3361302841529c05424d586141cf0911c18c302841201bb05953586141, 54),
(61, '-', 'Desa mangli (Line)', 0xfeffffff01020000000900000072f43562952d2841240ef8d64b586141ed415c298f2d28412440affa31586141e6ca75038b2d284187425acb25586141a17a22c1832d2841eb7ec1860e586141775b12fa7b2d2841edcdd61fef5761410485d258862d28413b806f83e8576141e3ecb245a02d2841965a911ddf57614187e0d987c32d2841ae9d074dd657614192458df9cf2d28411b8e7f69d2576141, 55),
(68, '-', 'Desa mangli (Line)', 0xfeffffff01020000001a00000022afd4af772c28411fc10b6445586141164a213e6b2c28419848ee1534586141bf1d3464532c2841d1f1cc342b586141f291ed0e4a2c2841eee04efe265861415a037a3e332c28416f21d9871d5861414e9ec6cc262c2841c608975f175861418d7733e9292c28410363188f075861414e9ec6cc262c2841b79bde26fc5761418889669d212c2841c6ebf093f6576141e30c2681022c2841f4372108f05761416d9feb9dcd2b2841d7c41cdbec576141e7ec1165c72b2841c6aec658e7576141ce9991a7b22b2841fd996629e2576141776da4cd9a2b28410eb55322dc576141309437b1972b284194a1e945d7576141b7cf2ac4992b284175aa62b5cc57614160a33dea812b2841799dc677c9576141d059696f3c2b2841795b05c6c5576141d4395553012b284184b8b370c357614152de4d24c42a2841aa1e1c60c3576141349d001ba72a28412c184ec1c15761415535202e8d2a2841e109bc30be576141c31d93837a2a2841d4352760bc5761413a4ba52e392a2841d4352760bc5761419169b1a00d2a2841d86a4cd4bc5761419169b1a00d2a28410006da37bd576141, 56),
(72, '-', 'Desa mangli (Line)', 0xfeffffff01020000000d000000abaa9f8a032c2841c09e0421f05761414960c7ba8a2b28418259dc9feb57614109450940372b284144b594f7e8576141e025f9782f2b2841ad70e79fe4576141519785a8182b284185027ae9d5576141bdf6de230a2b28413213b74acd576141b2912bb2fd2a2841cfc64501c7576141a62c7840f12a2841305a0f73c5576141a30c6424b62a2841795b05c6c557614112b5ae412d2a284154f59cd6c557614100d914aa1c2a2841b6886648c4576141f4736138102a28413840d7f7be5761418969b1a00d2a28418d1fb433bd576141, 57),
(48, '-', 'Desa mangli (Line)', 0xfeffffff0102000000020000000f36c3541a2a28414c2c7b1ded57614109450940372b284107c281f5e8576141, 58),
(44, '-', 'Desa mangli (Line)', 0xfeffffff01020000000a000000936766121b2728413321bcdd2358614170462d2539272841a12e926f1a5861412616eefe6c2728410f9b87280f5861412616eefe6c2728412e48484007586141025ebacf4b2728418c578f4efe576141bb766c4b05272841284ddfb6fb57614160ea421d3c262841720c1458f85761413ebb28c8162628418269c202f6576141e4f740acbf2528414c69812de95761418b3d81199f222841c98e8e1199576141, 59),
(43, '-', 'Desa mangli (Line)', 0xfeffffff010200000015000000ec03bc361a2b28411742b20c3c586141a537eb571a2b28419606bff939586141ea004ee6ff2a28413898349931586141d824b44eef2a28418e20d3492d5861419ca2193cb52a28413cef4ef920586141df5b723c7d2a28417f4439b21c58614189fd3d92322a2841b0c58e9a16586141bc6316d5e5292841a6d7c14e0e5861411870ef92c229284164fe54320b58614101dd469d372928418622fc6f075861413d1fb977fb282841667ad2ce035861412b431fe0ea2828416a6d369100586141dc24136e16292841a258d661fb5761410ecb13e93f292841229960ebf157614113b9e03448292841ef0f063ce9576141b2be3a2b632928414ba86624dc5761414a4daefb79292841287cba1fd1576141db643ba68c29284107c7f440ca576141069455fbb1292841e21ecb9fc6576141ce3fb06cf6292841bbffbad8be576141429de0c10d2a2841a07739d2bc576141, 60),
(30, 'Jl.Raden Wijaya', 'Desa mangli (Line)', 0xfeffffff0102000000020000000ea8b3e4022c28411df87f12f0576141e9c2703c7c2d28415c353562ef576141, 61),
(31, '-', 'Desa mangli (Line)', 0xfeffffff01020000000400000059f01294872d284170e466f6e75761412706b8edcc2d284152a6873de55761417c54e209fa2d28415364c68be157614183d9a997412e2841d5bc1714de576141, 62),
(25, 'Jl.Mataram', 'Desa mangli (Line)', 0xfeffffff010200000019000000a138610f802d28415a28bd4fff576141b26b6e91322f2841eb37b39df9576141327e841eea2f284180c3b81df65761412239e5c81830284137c2c2caf5576141c52c0c0b3c302841e8028e29f95761414a112d1475302841436937ee055861419bc633c8883028410fb3bc910b58614191f87a98bb302841b11257e209586141e1eda984453128415972f13208586141a15465a0b83128410407b1f706586141d65f198dee312841ea0a93f0075861415724267aec3128410fb3bc910b5861416389d9ebf83128414d57043a0e5861414068a0fe1632284189c6266e105861413d11cef44d32284120c9121411586141937de306dc322841d2c71cc1105861412b0c57d7f2322841d3855b0f0d586141ff0e84520033284128afda980a586141e00d5f81593328418e77c97e095861417613b97774332841814f40480c5861410ea22c488b332841859101fa0f586141a8b9b9f29d332841339da7e412586141bf8320d6b633284118e34a8f1758614117b00db0ce332841d1583b621b5861416d0e425a193428419f19a72b25586141, 63),
(97, '-', 'Desa mangli (Line)', 0xfeffffff010200000002000000baa9bb8e692c2841ac1f3b7633586141a5aab0be8f2d2841e0c001c433586141, 64),
(3, 'Jl.Bandeng', 'Desa Sempusari (Line)', 0xfeffffff01020000000a000000e8e2d40fb4312841b138fa40f9586141c9ad07c29c312841c03fa61cf5586141abc51757743128416c11e79fed5861419516b4aa5831284128c473cce7586141b142ab5429312841dc373055df586141030db225e4302841886c1c3ad4586141c016d5e323302841aafe581ec7586141033575a7732f2841b8cb5bbdbb5861413fb65d06352f284182a32b9eb5586141437912d7322f2841e53b4258b5586141, 65),
(16, 'Jl.Lumba-lumba', 'Desa Sempusari (Line)', 0xfeffffff01020000000d0000000df90c83812e28417e5c92a0bc5861410845075b602f2841bcb2eb4bb358614174163ff30c3028417d258b56b0586141d881315197302841b6b58d3eae586141925abbe900312841b376bd9aab58614129c12c0551312841de043b0ea9586141d2ad07c29c31284150a4fda3a45861418becd69428322841743b61ef92586141d2dcdad1523228418d8604d68c5861417bc9b58e9e322841a492d71884586141c6e2b3d6e832284108f66bfd7758614170896dc0eb3228413608ce9d7058614100245467f732284164577b6d6b586141, 66),
(12, 'Jl.Udang Windu', 'Desa Sempusari (Line)', 0xfeffffff0102000000070000009d0fa41c322f28414b559b4cb55861419099cc2e232f28413d56b8caaf5861417aea6882072f2841dea4319fa7586141a33f5a37f82e2841650bb3eea1586141d5a01e2fe02e2841a11f9a039b58614114c597f7c52e2841b6e9faaf945861419373cfc2b32e28412289bd4590586141, 67),
(33, '-', 'Desa Sempusari (Line)', 0xfeffffff01020000000a000000a4ac5b81c02e2841813de6639358614102e897c4842f2841ee79fd9792586141d0ec1807bf2f284161161e3b935861417026d1a6f92f2841cbb0b969935861413338e7fd6f302841761a282494586141a74091c0883028413eedd09d92586141dd91c30484302841304ef78a8e586141fcc690529b302841937d2618715861413f140426a130284154b61ce66658614167cf3a15b4302841d55c8b575e586141, 68),
(82, 'Jl.Nener', 'Desa Sempusari (Line)', 0xfeffffff010200000006000000ca29b8b441322841f75deb338f586141056d72d9f0322841e8b9eab98f58614110296b9a48332841aac9de629058614187c54a9c2935284149ade37b955861415310edb1ac3528417c7a319395586141aacc7b631b362841897cb60796586141, 69),
(23, '-', 'Desa Sempusari (Line)', 0xfeffffff0102000000110000001312c958353128410ac18661e15861411b2b31b0683128415b76ccfdde586141fa1b61cec03128410d456b8edc58614183ecd69428322841230c2a48db5861419a84ec7db1322841fe031676d95861413777a03f93332841c3f7f7bad65861413960527c00342841e1fd8618d8586141c15d81be7d3428410e08205fda586141d9f596a7063528414ed7f2eada5861411cec73e9c63528416bdd8148dc58614124b8fe5d0b3628410d456b8edc5861414133ed7e6b362841cd759802dc5861411b6168ccc5362841e379a2ebdc586141cdd3ac2a0d37284157559332e0586141b66a6a513a372841f9b4b31eea586141f0317483443728410b35d9daef586141c6bc5e677a37284105a162fa07596141, 70),
(54, 'Jl.Kakap', 'Desa Sempusari (Line)', 0xfeffffff01020000000a0000000e099bb1ef352841a3aacf5fdc5861419da38158fb3528419a34f871cd5861419da38158fb3528412d1e4170c8586141d9246ab7bc352841e64ce96fc758614184518d42bb35284167f357e1be58614169bf505ec83528410d658ff5b558614151560e85f535284112b7933fa05861413a67620a27362841aca8a597915861413e905c154736284125104465865861412b8489d24f3628415422a6057f586141, 71),
(57, '-', 'Desa Sempusari (Line)', 0xfeffffff010200000003000000c618ebf245382841fab74df70f596141f009b101b5382841f6360bbd0f59614175a2d192a03a2841077d873c0e596141, 72),
(66, '-', 'Desa Sempusari (Line)', 0xfeffffff01020000000c0000000c378f3b14302841f20211465e586141e48a07f5dd30284180634eb062586141dc2bd248e232284164d111cc6f58614172b0a1b5eb34284180cfd7cf7a586141d50a1f557936284146fac05e84586141aa0afe1bae3728414ab5acd58b586141770f7f5ee83728417dbf451c8e586141f86ff63bd738284161f0bd089958614191bf19949439284157e66f3aa2586141974b5c3a263a28417e6a9fdfa8586141140943aef03a2841d3f867cbb15861419380084f723b28412a0b15e4b5586141, 73),
(69, '-', 'Desa Sempusari (Line)', 0xfeffffff010200000010000000934b0c4124302841d73ef47e5a586141660ba339a631284195675899635861414222d0c36d3228416f1a303e6958614127bf66ef30332841e9f520856c586141a47c4d63fb332841163d05fb70586141b5fd1489f13428415b8a78ce76586141cd952a727a352841400005447a586141c99b037710362841c2dd7aff7d586141fb0b7717d536284121f2ac8c8258614144e52c916c372841166c43eb8658614158dab110d13728417b432a49895861411b9fea8458382841ed1c961b8c58614157f80f628a392841aa062a9292586141f04733ba473a284151ecb31f98586141e10dc4f02a3b2841239d06509d5861419b4c93c3b63b2841d04545aea0586141, 74),
(51, '-', 'Desa Sempusari (Line)', 0xfeffffff010200000017000000059ad7d6853028411cf7db0d5358614187eb9f0b98302841e645a05a56586141d39e5819c03028415c6303385758614131abc14cce3028414b80321a555861412362a3dad43028412b3bd3185158614175c1c2f56731284151069cbb505861415ef23ae272312841a497069a5458614198b944147d312841cf9c78795b58614185f392a4ce312841f0234a115d586141e072d6263b322841517aee345f5861417d56db3f40322841514045f8575861410df1c1e64b3228415382b78e55586141a3370f9bc2322841ec685e9a55586141a3370f9bc2322841b50f63fc635861417e85ae4ff6322841677b562b655861419c9a573634332841c0cf75da66586141fdfc73f0773328418805cab56158614138bcde07cc342841af4cae2b665861414614ac22a235284171f9f6726a5861413dbd15915c362841913e56746e5861419533836f82362841de0fae746f586141b8914ac8b9362841c5c40a8e75586141de0c39e919372841ff93dd1976586141, 75),
(17, '-', 'Desa Sempusari (Line)', 0xfeffffff01020000000200000035003ac5f43628414e9c3c64835861412e83a6c73f3728418cc0b52c69586141, 76),
(36, 'Jl.Mataram', 'Desa Sempusari (Line)', 0xfeffffff01020000000b000000cad931b122352841f64fe60e78586141a1641c95583528413969f48a6c5861416bc60c6e6e35284177bcab43685861418ebe8e8c833528418805cab5615861412c3c4e6b663528419b8db8cb5d5861410d07811d4f352841890d930f58586141eed1b3cf37352841ea298ef652586141d57fbfb9f73428415b8fa74f475861418166c171ad342841802369a83a5861412124c91e43342841ca419e8b2a586141a06cbbaf0e3428415529621525586141, 77),
(37, 'Jl.Majapahit', 'Desa Sempusari (Line)', 0xfeffffff01020000000200000019ea0152273a2841f274d63097586141f094109d363a2841ed165a506b586141, 78),
(24, '-', 'Desa Sempusari (Line)', 0xfeffffff01020000000d000000ddc6bf12d23b2841cc8f88b869586141a7f9dcdb313b28414e30b3446b58614111b38f27bb3a2841ca4d16226c58614167a69003963a28419c010b456c5861412513fc5c473a2841f1979c8a6b5861412b43b2770d3a28412b0766a76a58614194428696df392841f3d90e2169586141e1a06e28e2382841e159e9646358614166cc39f1843828411569a91261586141a99343238f382841a01966524f586141dfb7bceb74382841d3b7757939586141ae761c5b6638284110d425e8285861413e1103027238284137eccb6d17586141, 79),
(99, '-', 'Desa Sempusari (Line)', 0xfeffffff0102000000020000001d60d93f363a28419ea3864a6b586141f5a4a250233a2841f67439f721586141, 80),
(91, '-', 'Desa Sempusari (Line)', 0xfeffffff0102000000020000001529884e95392841c62b756067586141a5104cd88f392841b3b2ff0c48586141, 81),
(92, '-', 'Desa Sempusari (Line)', 0xfeffffff0102000000020000000f6498b02b3a2841d746c1653b586141fd2f445e3b392841d746c1653b586141, 82),
(86, '--', 'Desa Sempusari (Line)', 0xfeffffff0102000000020000005b82173bb03a28419eaef523475861416f79afea2d38284180e5b1f547586141, 83),
(79, '-', 'Desa Sempusari (Line)', 0xfeffffff010200000006000000af2072daa53a28416b617a366c586141658eea7da73a28413f5ada013058614193b9d67f15392841148f115f30586141c157e6a6ff38284161231e302f586141fee4a148b8382841078d8cea2f586141a3355fd567372841d4bf3ed32f586141, 84),
(104, '-', 'Desa Sempusari (Line)', 0xfeffffff0102000000020000001dadb622253a284198370545285861419e43b6bbe8372841ca04535c28586141, 85),
(109, '-', 'Desa Sempusari (Line)', 0xfeffffff01020000000300000055b5811e09392841b99876aa2f586141c157e6a6ff3828417c5f9f7317586141047dd86a0c3828411fc788b917586141, 86),
(5, '-', 'jalan Kaliwates', 0xfeffffff01020000001900000060eea2bd81432841ebc3fb7434596141d06007d37a432841414b561432596141d06007d37a4328414f3db20d2f5961417f09da928f43284139e8b7752c596141a72411689d43284171216a0029596141a72411689d432841aa5a1c8b25596141a72411689d432841ffe1762a2359614141af6872c34328411cc62e1d1d596141c51e89a7db4328413eaae60f17596141b0000ef2ec4328417edc461712596141b0000ef2ec432841e155fdaf0c596141b0000ef2ec43284126885db70759614169ca9f47d1432841182c119c03596141c63f483dab43284109d0c480ff586141942755487e432841f37acae8fc5861410ebb78f346432841bbd7273cf95861416b3021e920432841a5822da4f65861416b3021e920432841ac7bdb20f55861416b3021e920432841010336c0f25861419e4814de4d432841ce5f9313ef586141740c1e7370432841e44a9d89ea5861417f09da928f432841f83cf982e7586141920696b2ae432841a34baec1e2586141ee5a7f12b94328413f680707e1586141d93c045dca43284170a80b15df586141, 87),
(7, '-', 'jalan Kaliwates', 0xfeffffff01020000001a000000cde9dd19783b284149ec643bb6586141333b8399a13b28418888b564b8586141795032aeed3b2841bb2b5811bc5861418e4aaaed2b3c2841415da7e0be586141fd9b4f6d553c28413564f963c0586141ca3e9a6ca83c28412e6b4be7c15861411930460b443d2841caf1944ec7586141cf9356bfd83d28413c318824cd586141e24b50d3773e28419222d3e5d15861414416b51b823f2841f868183fd9586141b4435725fb3f28419be80f23dd586141d9f80c59b94028415cb6af1be2586141917ddca21d412841ff35a7ffe5586141d7928bb76941284139d2f728e85861411d843756054228416b7cec58ed586141d2c68874ca422841010336c0f258614124fab23e05432841fa098843f45861416b3021e920432841ac7bdb20f5586141892a99285f4328413aa6d86cf65861419be2923cfe4328416550cd9cfb586141b77689daec4428411f25bf18025961416cb9daf8b14528416f160ada06596141f9e0f44169462841592b00640b5961415dcc182043472841e9b89b4e12596141b7ba80defd472841853fe5b517596141590016dda34828411cc62e1d1d596141, 88),
(76, 'jl imam bonjol', 'jalan Kaliwates', 0xfeffffff010200000010000000e65b4a1a28402841de790026bd58614189e6a1244e402841f3640a9cb85861417fc5e28e7e4028411649c28eb2586141182f7b03d5402841a39fde96a5586141bbb9d20dfb4028419c3c40f89f586141edd1c502284128415ad3600e91586141c495cf974a412841ed297d16845861419a59d92c6d412841e55cee5577586141863b5e777e412841eaf2fd3370586141ae56954c8c412841b94809046b586141b853516cab412841cd3a65fd67586141a435d6b6bc412841e8bb7e515c5861411fa5f6ebd44128411992923d5358614146c02dc1e241284190fda4cf4a58614132a2b20bf4412841d0c514b53e5861418ef69b6bfe412841d05b249337586141, 89),
(56, '-', 'jalan Kaliwates', 0xfeffffff010200000011000000d7928bb769412841c3f8e6d1c858614101ab7eac96412841118793f4c7586141b853516cab412841a7a3ec39c6586141b853516cab41284126729d6ac358614114a83accb54128411816514fbf586141ff89bf16c741284110b3b2b0b9586141a2141721ed41284149ec643bb6586141f44741eb27422841881ec542b1586141f2268255584228415c74d012ac586141a1cf54156d422841b9f4d82ea8586141a1cf54156d422841cde63428a55861416fb761204042284163038e6da3586141ad11d3400c422841f8263936a3586141cb500d8cca412841f8263936a35861415202acec81412841b1913a90a2586141340834ad43412841b98ae80ca15861414a476ef80141284155a741529f586141, 90),
(58, 'jl nusantara', 'jalan Kaliwates', 0xfeffffff0102000000120000005612a6333243284168456d76d958614142f42a7e434328410462c6bbd7586141892a99285f432841379b7846d458614119b834136643284121467eaed1586141a845d0fd6c43284168718c32cb5861412cb5f03285432841ad39fc17bf5861410279fac7a74328415cdec034b358614141af6872c3432841a39fde96a5586141a72411689d43284163038e6da3586141049ab95d7743284129673d44a1586141610f625351432841f1c39a979d586141e69f411e394328418de0f3dc9b586141e69f411e39432841a1d24fd69858614123d9f3a835432841fd5258f294586141610f625351432841e004b0dd93586141a845d0fd6c432841e7fd5d5a92586141bb428c1d8c432841caafb545915861410d76b6e7c6432841caafb54591586141, 91),
(62, '-', 'jalan Kaliwates', 0xfeffffff01020000000700000041af6872c343284138c3895fa5586141cf1b45c7fa4328418d4ae4fea25861413e6dea4624442841e2d13e9ea058614100137926584428413859993d9e5861411f2eb0fb65442841b7274a6e9b586141ecf4fd7069442841f659aa7596586141afbb4be66c442841996fb13793586141, 92),
(70, '-', 'jalan Kaliwates', 0xfeffffff01020000000700000038d36be8734328411fe3df0fcc5861419d0352d2cd43284113ea3193cd586141cefa85312b44284177cdd84dcf586141997c119bae4428418c22d3e5d15861411dc82e5a16452841af707bfad258614126a42be465452841ccbe230fd45861414d7aa0adf34528417737c96fd6586141, 93),
(49, 'jl panglima polim', 'jalan Kaliwates', 0xfeffffff010200000014000000b41008399d4528417e3077ecd4586141449ea323a4452841b6692977d1586141b41008399d452841eea2db01ce586141c92e83ee8b452841048ee577c958614182f814447045284143c0457fc4586141971690f95e452841ad39fc17bf5861413bc2a699544528416d9dabeebc5861413bc2a69954452841f3640a9cb8586141971690f95e4528411d42700bb15861414ebf62b973452841cde63428a5586141e849bac39945284144e8569895586141a0f28c83ae45284111dbc3c98a586141d42b3f0eab45284183b0c67d895861416dda998e814528413d1bc8d78858614145e3652f244528416e5bcce5865861415025e45ac34428419f9bd0f384586141496aa666434428413bb82939835861413591edbcd4432841ad8d2ced81586141610f6253514328411f632fa18058614106003bffc642284150a333af7e586141, 94),
(40, '-', 'jalan Kaliwates', 0xfeffffff0102000000070000000279fac7a7432841b9c8b972b6586141b121cd87bc432841b9c8b972b65861410c55f751f74328418f8163e1b6586141ed15bd06394428418f8163e1b6586141997c119bae442841d6166287b75861418d3a936f0f452841accf0bf6b75861413bc2a699544528415e415fd3b8586141, 95),
(34, '-', 'jalan Kaliwates', 0xfeffffff0102000000030000002f80286eb5452841ef8c1bb5895861417595d782014628413d1bc8d788586141e5c2798c7a4628414914765487586141, 96),
(28, '-', 'jalan Kaliwates', 0xfeffffff01020000001b000000a0f28c83ae45284124e7edb2ec586141a0f28c83ae452841e44a9d89ea586141a0f28c83ae452841f83cf982e7586141579b5f43c3452841720baab3e4586141aaef48a3cd452841b13d0abbdf586141dd073c98fa452841ee0ccc23d5586141bccb452d1d46284192b8e2c3ca586141c7c8014d3c46284150b9f3fbc258614156569d3743462841111da3d2c05861417e71d40c514628413afa0842b9586141373b6662354628412b9ebc26b5586141809293a220462841d6ac7165b05861410523736d084628415c74d012ac5861410523736d0846284186513682a4586141dd073c98fa4528413defa81b97586141dd073c98fa452841afc4abcf95586141e728fb2dca452841279aae8394586141a1134c197e452841279aae839458614198374f8f2e45284175285ba69358614114ec31d0c644284153dab291925861411531f4db46442841054c066f935861410d76b6e7c6432841996fb13793586141d93c045dca432841b55abbad8e5861419d0352d2cd43284135221a5b8a586141f8573b32d84328410a78252b8558614188e5d61cdf43284149aa85328058614120737207e6432841f94e4a4f74586141, 97),
(22, '-', 'jalan Kaliwates', 0xfeffffff01020000000d00000002782fc03847284174422996f8586141349022b565472841419f86e9f45861410b542c4a88472841c766e596f0586141aede8354ae4728410799459eeb58614199c0089fbf472841e9e0ac67e358614165875614c347284194ef61a6de58614165875614c3472841afda6b1cda58614170841234e24728410462c6bbd7586141a29c05290f4828415ae9205bd5586141a29c05290f482841af707bfad25861415b66977ef347284127dc8d8cca58614170841234e247284143c0457fc4586141143029d4d747284183f2a586bf586141, 98),
(98, '-', 'jalan Kaliwates', 0xfeffffff0102000000130000006cfdd1fcc2482841a0560ee80459614110a9e89cb8482841261e6d95005961416cfdd1fcc24828418a97232efb5861418b1809d2d0482841bbd7273cf9586141be30fcc6fd482841e41e7ecdf8586141d12db8e61c4928410966d45ef858614160bb53d1234928413aa6d86cf65861411985e52608492841578a905ff0586141fb8a6de7c9482841e2e7feeae4586141fdab2c7d99482841ffcbb6ddde586141de90f5a78b482841300cbbebdc58614112caa7328848284168456d76d958614112caa73288482841beccc715d7586141c9727af29c482841c5c57592d55861418b1809d2d04828413d9b7846d4586141bf51bb5ccd482841b6692977d15861412fc41f72c64828418abf3447cc5861412fc41f72c6482841ee38ebdfc65861412fc41f72c6482841c28ef6afc1586141, 99),
(96, '-', 'jalan Kaliwates', 0xfeffffff010200000007000000395c25f80446284168db7c54d2586141e6e338224a462841d3b7d18bd25861415e11db2bc34628411a4dd031d358614185e74ff5504728415ae9205bd5586141b8db3f74cd47284194857184d7586141b599c1482e4828410462c6bbd7586141aa57431d8f4828410462c6bbd7586141, 100),
(87, 'jl sentot prawirodirjo', 'jalan Kaliwates', 0xfeffffff010200000006000000231debac46462841c28ef6afc1586141936b4c4c8f462841c28ef6afc158614135d5e4c0e5462841ecd54c41c1586141c41dbe9f6c4728417cf9f709c1586141b8db3f74cd4728415fab4ff5bf586141975a87fd6f482841b432aa94bd586141, 101),
(83, 'jl gajah mada b', 'jalan Kaliwates', 0xfeffffff010200000004000000761ee730c64828414b063cfb05596141a906a6656b472841c6a0dae9fa586141ee75db66734428414adeae29e4586141811dc550c2432841636958c8de586141, 102),
(78, 'jl gajah mada C', 'jalan Kaliwates', 0xfeffffff01020000000700000018bf4714c94328412ec65f03df5861412247a09f63432841572cb921db586141d190dd1b6f412841d676512fc9586141f4dbcd25683f284168eb21a9b75861419f752545b73d28412bbb835cad58614153415426153c284154824eada3586141c75901b0b73b284183e2045fa1586141, 103),
(93, 'jl.22', 'jalan Kaliwates', 0xfeffffff0102000000050000004305d384ff3d284149ab4f12af586141586ea680133e284120784149ab5861411de7f4b3383e28419de4b95a9e586141a4038507803e2841ca6121378c586141fe57b8538c3e28415c2c9bfe7f586141, 104),
(94, '-', 'jalan Kaliwates', 0xfeffffff010200000007000000e32dcc14693c284186873699a558614180ad7835893c284197b267c99e586141a6e633cca93c28414046a8ca98586141638f9a64c23c2841bf7fd5869358614190d29febcf3c28413c088b2f8d586141990477adde3c284107158c89865861419e9d620ee63c28412f32002882586141, 105),
(1, 'JL Sultan Agung', 'jalan kepatihan', 0xfeffffff01020000000500000017125b7928572841905f870867596141cc1bdef60156284111f399bd5c596141427d63bef75428411bdf922c53596141c3bbf958dc532841ed74effd485961411eedb560ae532841e509441e49596141, 106),
(74, 'JL Samanhudi', 'jalan kepatihan', 0xfeffffff010200000002000000b5504e79dc532841a32beafb485961413bebe3f05e5328416426aea93c596141, 107),
(13, 'JL Diponegoro', 'jalan kepatihan', 0xfeffffff0102000000060000004e53ba7df754284120f18a2953596141173f2830ec542841d6a15f4f3d596141029122cdde542841198b8ac93859614169779e4bad5428412f6a5afc25596141b8891bef8954284178b2a16b165961415aa451d780542841173da2280f596141, 108),
(45, 'JL Sulawesi', 'jalan kepatihan', 0xfeffffff01020000000300000079b9ccdcb3542841d87aeb7e285961415bfbb98cd15328415c82df4c2c5961413e3da73cef5228416d0e22752f596141, 109),
(32, 'Jl. 20', 'jalan kepatihan', 0xfeffffff0102000000060000000a82c746cf532841e8f0f9562c596141f7ca297706542841ed8839c9315961416b15114d2754284198fd97d633596141dc82e74f59542841c7cadc9d365961415ea01b9aa6542841f5f4109b385961411cd2246cde542841ac6450b338596141, 110),
(63, 'Jl.19', 'jalan kepatihan', 0xfeffffff010200000008000000d9ccaa6a0356284111f399bd5c59614165a2a876205628418687d86459596141d014e1a833562841d02948f954596141c0aa61bb3a562841bc787b8553596141a0feb33c3b5628416decada04e596141082b0e152c5628414d3fd42f48596141fbe6879f1756284111672c7041596141c98a7cd9fc55284103858f163b596141, 111),
(52, 'JL Gatot Subroto', 'jalan kepatihan', 0xfeffffff01020000000c0000003a802acfeb542841e41e032c3d596141eff969df53552841eded7b963c596141242b1afea85528413ce209093c596141ba1fd1f9fc5528418ff3a9203b5961417b07c634385628414e2b844e3a5961412eead2cbd356284193011d7a37596141fb365f506857284114396ceb345961414556df95465828417aa9ba9831596141bf9b643c86582841cd6cc17530596141852ecf1a3d5928418ca49ba32f59614100ba321b9f59284166f8ed24305961418a6937afd7592841d8b2e20932596141, 112),
(60, 'Jl. 21', 'jalan kepatihan', 0xfeffffff0102000000070000004a3a816d355628418e6291533a596141dcea3768335628418b92ecf633596141140165d42b562841d8b2e209325961414c409503dc552841550fbcc62d596141765b249fb5552841420cd1742859614108342cf6a555284145e61a3723596141cf4550e69f552841fc0a882517596141, 113),
(64, 'JL Kartini', 'jalan kepatihan', 0xfeffffff010200000006000000b2d697d8b457284155d8d1345d5961417d9d7b3fab572841a367662a56596141d31978d080572841787e108b42596141f6ca877e615728413cfea66b305961418b584f4c4e572841658f6f042659614137e266511f572841459a1c1b10596141, 114),
(67, 'JL Dr Wahidin', 'jalan kepatihan', 0xfeffffff010200000005000000286010f541532841df1909462e5961412e3bc9e322532841c93ba83f27596141cb117956055328413c6894b8205961418894d647e75228417c55fb851b596141ef7a52c6b5522841974b744b13596141, 115),
(47, 'JL Trunojoyo Gg Remaja', 'jalan kepatihan', 0xfeffffff010200000004000000e25c81d73b59284196c88b9d2f5961414b60d8ec7459284107ea141e255961415ca2067e7b59284172f9eef11e596141aed2101f88592841f441c11d11596141, 116),
(41, 'JL A Yani', 'jalan kepatihan', 0xfeffffff01020000000b00000097be47801a5928413e38887b50596141d5cf12bd31592841e26599024a596141f12fce4b685928417db156804159614170283510d85928418d8dcd013259614110cc1d61405a2841d902a90328596141fced5a278c5a2841175b72601e5961412906e077925a2841804f674e0e596141202e31d4845a2841ddff928c0a596141202e31d4845a28417139a15d06596141be93a7457f5a2841c290d068fe586141fc15ac837e5a284172b2e4a5f5586141, 117),
(38, 'Jl. 15', 'jalan kepatihan', 0xfeffffff01020000000300000027a01c3c325a28414ba3335b505961415e706b4e085a28419f319c5e42596141c2100973b4592841d3f92f903a596141, 118),
(29, 'JL Trunojoyo', 'jalan kepatihan', 0xfeffffff01020000000b000000a721cbd6af52284192abbc320f596141a9bfec5bd75328416fc7a9c90e5961415a846cf542542841773255a90e5961416bb5102b1b552841c565265b0f596141fcee798e8a5528410d9219b80f596141ff23ce8c7e5628417306ed0810596141521bfd756a572841e7e56b3910596141e2744bbb1758284156c5ea691059614170a8a088e0582841b6d5f02f11596141921ac1e8f959284147f671ff10596141725e3b75915a2841d316f3ce10596141, 119),
(21, 'JL Dr Sutomo', 'jalan kepatihan', 0xfeffffff01020000000500000050dd2c8fa1532841e611d4d90e596141e1de37a949532841241c04fc045961417c26211d14532841d37c5b78fd5861410f6e0a91de522841be5fb732f5586141d0ad93737152284171483a93e4586141, 120),
(20, 'JL Dr Sutomo Gg IV', 'jalan kepatihan', 0xfeffffff0102000000030000003d66aaffa6522841897e28a009596141a45b8104855328413a956b85055961413cf64b7473542841160ac3ae00596141, 121),
(95, 'Jl. 18', 'jalan kepatihan', 0xfeffffff010200000003000000eb35a05e9a522841caf0aaf002596141053ff33780532841165bb59afd586141be44effb2c542841d4dca35ff9586141, 122),
(90, 'Jl. 17', 'jalan kepatihan', 0xfeffffff0102000000030000002e935d8b7a522841a6048e40fb586141d72eda612e532841280478c7f758614131b8d994055428413fec7d33f3586141, 123),
(84, 'Jl. 16', 'jalan kepatihan', 0xfeffffff010200000003000000c1da46ff4452284142c7f3e7f45861410c91f9bdef5228419a771f26f158614148b429cce9532841bb926b87eb586141, 124),
(81, 'JL KH Wahid Hasyim', 'jalan kepatihan', 0xfeffffff0102000000030000008ecf8f58d45128415c766877e85861417f44ae1a44532841d49ecf4cde586141db53566bb95428411c7878d9d3586141, 125),
(105, 'JL KH A Dahlan', 'jalan kepatihan', 0xfeffffff010200000010000000cc8875714154284141764436d758614160779e4bad5428416545e1e1e75861416384a1edae5528414d03b350e1586141974edc69de55284112de9d48e1586141fc06f3f513562841d0a6d993e5586141b0a883626e562841952986ebf058614125cb19dc9c56284184322a84f6586141fe644ab7bf5628414e533610f8586141cffdc82b1d572841c50d2bf5f9586141185624291c5728417d81efb0fd5861411fe8f472075728417e37db1901596141fd0de2016f572841e8d4bd5903596141d6a712dd915728418103fbd203596141fef4eb2b8c582841de0545ef03596141f0003d67c859284155ad5e3503596141b2dee7ce825a28410516c0f802596141, 126),
(110, 'Jl. 14', 'jalan kepatihan', 0xfeffffff010200000003000000d22ab1af5c582841e6a58ea8105961417968d6c464582841d78fc8b70859614169fe56d76b5828415dbb1adf03596141, 127),
(111, 'JL Raden Patah', 'jalan kepatihan', 0xfeffffff01020000000700000003d92ffc1f532841a88e5443df58614190257b9fcb522841769f4c41d25861419e491c33a25228410b3d289dcd58614118772872585228411b7e989bc458614137742a1002522841c04a3549bb586141e52ba7076c512841af622fddbf586141485d630f3e512841b40540a7c0586141, 128);

-- --------------------------------------------------------

--
-- Table structure for table `tempat`
--

CREATE TABLE `tempat` (
  `id` int(10) NOT NULL,
  `lokasi` varchar(25) NOT NULL,
  `point` point NOT NULL,
  `feature_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tempat`
--

INSERT INTO `tempat` (`id`, `lokasi`, `point`, `feature_id`) VALUES
(1, '-2147483647', 0x, 1),
(-2147483647, '-2147483647', 0x, 2),
(-2147483647, '-2147483647', 0x, 3),
(23, '0', 0xfeffffff01010000007baf3bd1f3512841880d370558596141, 4),
(22, '0', 0xfeffffff01010000004afbf62d5f4e28415dc7119531596141, 5),
(30, '0', 0xfeffffff0101000000ddc41c9f074f28411b208145b2586141, 6),
(51, '0', 0xfeffffff01010000003a0afe51e8492841525d0262d9586141, 7),
(48, '0', 0xfeffffff010100000069a14bd7b14d28416157aedcb6586141, 8),
(44, '0', 0xfeffffff010100000022ba4957e74928418fced11ddd586141, 9),
(34, '0', 0xfeffffff0101000000d4f69dd5104e2841980143e37b596141, 10),
(37, '0', 0xfeffffff0101000000637afff33944284100cf1275cd596141, 11),
(10, '0', 0xfeffffff0101000000002e2e4ef9412841c1ca01cef0596141, 12),
(7, '0', 0xfeffffff0101000000f31ab127823e28413fef59064e5a6141, 13),
(28, '0', 0xfeffffff01010000003c8052b1842e2841b972d58f8f586141, 14),
(31, '0', 0xfeffffff0101000000799ec1607e3128417d34255533586141, 15),
(6, '0', 0xfeffffff0101000000e44e8bb321272841b69b42c226586141, 16),
(56, '0', 0xfeffffff01010000003f8196ef1f2b28410a532a46ee576141, 17),
(45, '0', 0xfeffffff01010000005d931aa3652e28419e2933f184586141, 18),
(24, '0', 0xfeffffff01010000008e2023e04f272841f59c75f127586141, 19),
(32, '0', 0xfeffffff01010000001ead7941962d28414a6d346627586141, 20),
(27, '0', 0xfeffffff0101000000b0ae30cf1e2e284172b3ed4a76586141, 21),
(9, '0', 0xfeffffff01010000008bf1b065042a28412287ac0438586141, 22),
(11, '0', 0xfeffffff0101000000edb024e6082a28411f58e10b40586141, 23),
(15, '0', 0xfeffffff01010000009b032fa1532d284132ec6ddcf5576141, 24),
(53, '0', 0xfeffffff01010000007420b6ee29372841aaacb6c9f0586141, 25),
(38, '0', 0xfeffffff0101000000c4172d65dc352841813eb04fad586141, 26),
(25, '0', 0xfeffffff0101000000a37776bfaf3728415b17ecb397586141, 27),
(54, '0', 0xfeffffff010100000095c9fc812b3a28411489765a6f586141, 28),
(46, '0', 0xfeffffff0101000000312ee075be3028415967be1b62586141, 29),
(41, '0', 0xfeffffff01010000002b96a9536a312841f60bf39064586141, 30),
(33, '0', 0xfeffffff0101000000287342976e362841c2edb9208a586141, 31),
(26, '0', 0xfeffffff0101000000cf39915bbb39284138b153e794586141, 32),
(17, '0', 0xfeffffff01010000008bce34ee4739284151f954db93586141, 33),
(50, '0', 0xfeffffff010100000065a1afb52b3d284131ac4a09ac586141, 34),
(36, '0', 0xfeffffff0101000000a08b6541734328415571ff21da586141, 35),
(55, '0', 0xfeffffff0101000000bacc671c13482841304838b104596141, 36),
(1, '0', 0xfeffffff01010000009c88e611d73c284102ece74ba1586141, 37),
(16, '0', 0xfeffffff0101000000bb9062fa2a3c2841b44d799475586141, 38),
(3, '0', 0xfeffffff010100000037f6032d024028412177cdb5c1586141, 39),
(52, '0', 0xfeffffff0101000000ccf8d3799f422841ed0cd774f5586141, 40),
(39, '0', 0xfeffffff01010000005ad91d2c494628412d37be92c4586141, 41),
(2, '0', 0xfeffffff0101000000937ad5220d41284122f4dba9bd586141, 42),
(4, '0', 0xfeffffff010100000067a61e2b34412841bbfc7a3196586141, 43),
(40, '0', 0xfeffffff0101000000418f0cd1b64328416f0a2ea402596141, 44),
(47, '0', 0xfeffffff010100000046b025b791452841af52ecf9f2586141, 45),
(5, '0', 0xfeffffff0101000000bf14322586542841218fc54e56596141, 46),
(13, '0', 0xfeffffff0101000000f35518409f572841fd4eefa15d596141, 47),
(8, '0', 0xfeffffff0101000000e096bd79cf592841491758ae3d596141, 48),
(49, '0', 0xfeffffff0101000000b32e617878582841f2fd5ee90d596141, 49),
(43, '0', 0xfeffffff0101000000c03ba80bc4522841d0f7cb7fe2586141, 50),
(42, '0', 0xfeffffff0101000000978ffa8cc452284164a4090327596141, 51),
(29, '0', 0xfeffffff0101000000f129841bca522841a85bef5412596141, 52),
(12, '0', 0xfeffffff0101000000b86b9adad6532841383701f7d5586141, 53),
(14, '0', 0xfeffffff01010000006f8aea7bc15628411259b84863596141, 54),
(21, '0', 0xfeffffff0101000000cebf2d3dc054284114efbecf28596141, 55),
(18, '0', 0xfeffffff010100000020ef1877ce592841ee8a8ac938596141, 56),
(19, '0', 0xfeffffff0101000000cb115dd21e56284189f436780d596141, 57),
(20, '0', 0xfeffffff0101000000ad0b724b6758284119a6196512596141, 58),
(12, '0', 0xfeffffff0101000000ea5e9428745a28411e4bc54d00596141, 59);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `desa`
--
ALTER TABLE `desa`
  ADD PRIMARY KEY (`feature_id`);

--
-- Indexes for table `jalan`
--
ALTER TABLE `jalan`
  ADD PRIMARY KEY (`feature_id`);

--
-- Indexes for table `tempat`
--
ALTER TABLE `tempat`
  ADD PRIMARY KEY (`feature_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `desa`
--
ALTER TABLE `desa`
  MODIFY `feature_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `jalan`
--
ALTER TABLE `jalan`
  MODIFY `feature_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `tempat`
--
ALTER TABLE `tempat`
  MODIFY `feature_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;
--
-- Database: `latihan`
--
CREATE DATABASE IF NOT EXISTS `latihan` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `latihan`;

-- --------------------------------------------------------

--
-- Table structure for table `data_mhs`
--

CREATE TABLE `data_mhs` (
  `npm` char(9) NOT NULL,
  `nama_leng` varchar(20) DEFAULT NULL,
  `alamat` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_mhs`
--
ALTER TABLE `data_mhs`
  ADD PRIMARY KEY (`npm`);
--
-- Database: `manajemendata`
--
CREATE DATABASE IF NOT EXISTS `manajemendata` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `manajemendata`;

-- --------------------------------------------------------

--
-- Stand-in structure for view `alamat_mahasiswa`
-- (See below for the actual view)
--
CREATE TABLE `alamat_mahasiswa` (
`namadepan` varchar(45)
,`alamat` varchar(45)
);

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `iddosen` int(11) NOT NULL,
  `nama` varchar(45) DEFAULT NULL,
  `nip` varchar(9) DEFAULT NULL,
  `alamat` varchar(45) DEFAULT NULL,
  `tanggal_lahir` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`iddosen`, `nama`, `nip`, `alamat`, `tanggal_lahir`) VALUES
(1, 'Indah Kusuma', '93849434', 'jember', '12-08-1995'),
(2, 'Maya Maulida', '23849327', 'banyuwangi', '11-01-1980'),
(3, 'Inggrit Agustine P', '28388357', 'jember', '01-06-1984');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id` int(11) NOT NULL,
  `namadepan` varchar(45) DEFAULT NULL,
  `namabelakang` varchar(45) DEFAULT NULL,
  `nim` varchar(45) DEFAULT NULL,
  `alamat` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`id`, `namadepan`, `namabelakang`, `nim`, `alamat`) VALUES
(1, 'Rizqa', 'Alfiani', 'E31191919', 'Jember'),
(2, 'Lois', 'Yemima', 'E31191447', 'Banyuwangi'),
(3, 'Vita', 'Ayu', 'E31191821', 'Jember'),
(4, 'Intan', 'Permata', 'E31197348', 'Gersik');

-- --------------------------------------------------------

--
-- Table structure for table `matakuliah`
--

CREATE TABLE `matakuliah` (
  `id` int(11) NOT NULL,
  `nama` varchar(45) DEFAULT NULL,
  `sks` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `matakuliah`
--

INSERT INTO `matakuliah` (`id`, `nama`, `sks`) VALUES
(1, 'Pemrograman Web', '4'),
(2, 'Basis Data Relasional', '3'),
(3, 'data Warehouse', '2'),
(4, 'Teknik Penulisan Ilmiah', '2');

-- --------------------------------------------------------

--
-- Structure for view `alamat_mahasiswa`
--
DROP TABLE IF EXISTS `alamat_mahasiswa`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `alamat_mahasiswa`  AS SELECT `mahasiswa`.`namadepan` AS `namadepan`, `mahasiswa`.`alamat` AS `alamat` FROM `mahasiswa` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`iddosen`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matakuliah`
--
ALTER TABLE `matakuliah`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dosen`
--
ALTER TABLE `dosen`
  MODIFY `iddosen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `matakuliah`
--
ALTER TABLE `matakuliah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Database: `mydb`
--
CREATE DATABASE IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `mydb`;

-- --------------------------------------------------------

--
-- Table structure for table `keys`
--

CREATE TABLE `keys` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT 0,
  `is_private_key` tinyint(1) NOT NULL DEFAULT 0,
  `ip_addresses` text DEFAULT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `keys`
--

INSERT INTO `keys` (`id`, `user_id`, `key`, `level`, `ignore_limits`, `is_private_key`, `ip_addresses`, `date_created`) VALUES
(1, 0, 'rest-coba', 1, 0, 0, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `komen`
--

CREATE TABLE `komen` (
  `id_komen` int(11) NOT NULL,
  `nama` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `konten` varchar(300) NOT NULL,
  `id_resep` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `komen`
--

INSERT INTO `komen` (`id_komen`, `nama`, `email`, `tanggal`, `konten`, `id_resep`) VALUES
(1, NULL, NULL, NULL, 'jb', NULL),
(2, 'Rizqa Alfiani', 'rizqaalfiani7@gmail.com', '2021-01-27', 'jbd', 30),
(3, 'intan', 'intan@gmail.com', '2021-01-27', 'jbcub', 30),
(4, 'Naiya', 'msdn', '2021-01-27', 'msn d', 30),
(5, 'Naiya', 'jd', '2021-01-27', 'jsdj', 30),
(6, 'jd', 'ksnd', '2021-01-27', 'ks', 28),
(7, 'Naiya', 'ksd', '2021-01-27', 'ms', 28),
(8, 'Naiya', 'knv', '2021-01-27', 'mjdfn', 28),
(9, 'Rizqa Alfiani', 'mxc', '2021-01-27', 'jsd', 28),
(10, 'jds', 'jnds', '2021-01-27', 'snd', 28),
(11, 'lili', 'rizqaalfiani7@gmail.com', '2021-01-27', 'kjds', 28),
(12, 'jds', 'nsd', '2021-01-27', 'nsd', 28),
(13, 'jds', 'nsd', '2021-01-27', 'nsd', 28),
(14, 'jds', 'nsd', '2021-01-27', 'nsd', 28),
(15, 'jds', 'nsd', '2021-01-27', 'nsd', 28),
(16, 'jbsd', 'jnds', '2021-01-27', 'jnds', 28),
(17, 'jn', 'kd', '2021-01-27', 'jd', 28),
(18, 'jn', 'kd', '2021-01-27', 'jd', 28),
(19, 'Rizqa Alfiani', 'mxc', '2021-01-27', 'jd', 28),
(20, 'Rizqa Alfiani', 'rizqaalfiani7@gmail.com', '2021-01-27', 'Ulala.. enak banget nih bunn', 30),
(21, 'Naiya', 'ndf', '2021-01-27', 'mmmmmm\r\nkomksdnfn', 30),
(22, 'Rizqa Alfiani', 'rizqaalfiani7@gmail.com', '2021-01-30', 'alalalla', 27);

-- --------------------------------------------------------

--
-- Table structure for table `limits`
--

CREATE TABLE `limits` (
  `id` int(11) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `count` int(10) NOT NULL,
  `hour_started` int(11) NOT NULL,
  `api_key` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `limits`
--

INSERT INTO `limits` (`id`, `uri`, `count`, `hour_started`, `api_key`) VALUES
(1, 'uri:Home/index:get', 1, 1627490149, 'rest-coba');

-- --------------------------------------------------------

--
-- Table structure for table `pin`
--

CREATE TABLE `pin` (
  `id_pin` int(11) NOT NULL,
  `id_resep` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pin`
--

INSERT INTO `pin` (`id_pin`, `id_resep`, `id_user`, `date`) VALUES
(65, 28, 1, '2021-02-03');

-- --------------------------------------------------------

--
-- Table structure for table `resep`
--

CREATE TABLE `resep` (
  `id_resep` int(11) NOT NULL,
  `foto` varchar(150) NOT NULL,
  `tipe_foto` varchar(20) NOT NULL,
  `ukuran_foto` int(15) NOT NULL,
  `judul` varchar(30) NOT NULL,
  `waktu` varchar(15) NOT NULL,
  `bahan` varchar(500) NOT NULL,
  `cara` varchar(1000) NOT NULL,
  `orang` varchar(10) NOT NULL,
  `kategori` varchar(20) NOT NULL,
  `anggaran` varchar(20) NOT NULL,
  `tanggal` date NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `resep`
--

INSERT INTO `resep` (`id_resep`, `foto`, `tipe_foto`, `ukuran_foto`, `judul`, `waktu`, `bahan`, `cara`, `orang`, `kategori`, `anggaran`, `tanggal`, `id_user`, `status`) VALUES
(15, 'cakwe.jpg', 'image/jpeg', 78186, 'Cakwe Goreng renyah', '5-10', '* 250 gram tepung terigu protein sedang\r\n* 185 ml air\r\n* 1/2 sendok teh garam\r\n* 1/2 sendok teh amoniak bubuk\r\n* 1 3/4 sendok teh baking powder\r\n* minyak untuk menggoreng\r\n', '1. larutkan garam dan amoniak bubuk dalam 85 ml air. Sisihkan. \r\n2. Larutkan baking powder dalam sisa air. Sisihkan.\r\n 3. Ayak tepung terigu. Tambahkan larutan amoniak dan baking powder sedikit – sedikit sambil diuleni sampai kalis. Diamkan 20 menit. \r\n4. Uleni adonan sampai elastis. Tutup plastik, diamkan selama 6 jam. \r\n 5. Giling adonan setebal 1/2 cm di atas meja yang ditabur sedikit tepung\r\n 6. Potong panjang 10 cm lebar 2 cm. Tumpuk. Rekatkan dengan air. Tekan tengahnya dengan sumpit.\r\n 7. Menjelang digoreng, tarik sedikit adonan agar memanjang. \r\n8. Goreng dengan minyak yang sudah dipanaskan.\r\n\r\n', '4-7', 'Camilan', '10-15', '2020-12-28', 3, 0),
(26, 'ayam crispi pedas.jpg', 'image/jpeg', 122304, 'Ayam Krispi Pedas', '40-60', 'Bahan:\r\n\r\n1 kg ayam\r\nBahan Bumbu halus:\r\n\r\n8 siung bawang putih\r\n4 siung bawang merah\r\n6 buah cabai merah besar\r\n15 buah cabai rawit\r\nBumbu lain:\r\n\r\n1 sdt gula merah sisir\r\n1 sdt ketumbar bubuk\r\n1,5 sdt merica bubuk\r\n1 sdt kecap manis\r\n3 cm jahe, geprek\r\n5 cm lengkuas, geprek\r\n4 lembar daun jeruk\r\n2 lembar daun salam\r\ngaram secukupnya\r\nkaldu bubuk secukupnya', 'Cara memasak:\r\n\r\n* Kukus bahan bumbu halus, kemudian haluskan dengan ulekan atau blender\r\n* Potong ayam lalu cuci.\r\n* Kemudian beri perasan air jeruk nipis, garam, dan merica.\r\n* Diamkan 15 menit lalu goreng sebentar.\r\n* Tumis bumbu halus bersama jahe, lengkuas, daun jeruk, dan daun salam.\r\n* Beri air secukupnya, beri ketumbar bubuk, merica, gula merah, kecap manis, garam, dan kaldu bubuk.\r\n* Masukkan potongan ayam\r\n* kecilkan api masak hingga kuah menyusut.\r\n* Koreksi rasa\r\nSiap disajikan', '4-7', 'Makanan', '30-40', '2021-01-03', 3, 0),
(27, '727020846_6dd416d3-3c38-4bb2-8eac-a86f0ee372a5_471_471.jpg', 'image/jpeg', 55468, 'Boba', '20-30', 'Bahan kering\r\n250 gr tapioka\r\n20 gr cacao powder (bisa diganti nutrijel)\r\n\r\nBahan basah\r\n140 ml air\r\n10 gr tapioka\r\n60 gr palm sugar\r\n\r\nBahan pengental\r\n100 ml air\r\n70 gr palm sugar', 'Langkah\r\n1. Siapkan bahan. Campur bahan kering. Di wadah terpisah (panci) campur bahan basah, didihkan. Campurkan bahan kering dan basah\r\n\r\n2. Uleni hingga kalis. Bagi menjadi beberapa bagian. Bentuk panjang, lalu potong-potong atau langsung dibentuk bulat kecil\r\n\r\n3. Didihkan air dipanci untuk merebus. Setelah semua adonan selasai dibentuk. Masukan ke air mendidih\r\n\r\n4. Rebus di air mendidih hingga terapung. Lalu matikan api dan tutup panci. Diamkan selama 30 menit\r\n\r\n5. Setelah 30 menit, buka tutup panci, lalu tiriskan\r\n\r\n6. Siapkan bahan pengental di panci lain. Panaskan lalu aduk hingga larut. Masukan boba yang sudah ditiriskan. Aduk selama 5 menit hingga mengental. Lalu matikan api\r\n\r\nBoba siap disajikan. Bisa untuk pelengkap minuman lainnya\r\n', '>10', 'Minuman', '15-20', '2021-01-03', 1, 0),
(28, '18509512_707a2349-7d8b-498c-beb5-9d3675771249_1181_1365.png', 'image/png', 644230, 'Brownies Ekonomis ', '30-40', '70 gram tepung mocaf\r\n1/4 sdt baking powder\r\n10 gram coklat bubuk\r\n20 gram susu bubuk coklat\r\n40 gram dark cooking coklat lelehkan\r\n75 gram margarin lelehkan\r\n2 butir telur ukuran kecil\r\n100 gram gula pasir\r\n\r\nKeju cheddar diparut kasar', '1. Siapkan bahan : Tim dark cooking coklat dan margarine (double boiler). Campur semua bahan kering (tepung mocaf, susu bubuk coklat, coklat bubuk, baking powder, aduk rata). Kocok telur dan gula hingga larut dengan whisk. masukkan lelehan dark cooking coklat dan margarine. Aduk rata terus.\r\n\r\n2. Tambahkan campuran tepung mocaf tadi sedikit demi sedikit sambil diaduk rata. Adonan memang agak lengket dan kental. aduk hingga rata saja, jangan overmix\r\n\r\n3. Masukkan adonan ke dalam loyang brownies yang sudah diberi alas kertas roti dan dioleh margarine. Taburi toppingnya, panggang hingga matang selama kurang lebih 45 menit (sesuaikan oven masing²). Setelah dingin. Baru dikeluarkan dan dipotong-potong sesuai selera\r\n', '>10', 'Kue', '30-40', '2021-01-09', 1, 0),
(30, 'Resep-Nasi-bakar-ikan-tongkol.jpg', 'image/jpeg', 293138, 'Nasi Bakar Tuna', '40-60', 'seprempat nasi uduk\r\n800 g ikan tuna\r\n8 cabe rawit\r\n10 cabe kriting\r\n4 bawang putih\r\n4 bawang merah\r\nsere\r\ndaun salam, daun jeruk\r\nsecukupnya gula garam', '1. Kukus ikan tuna 10mnit kemudin suir\"\r\n2. Haluskan bumbu\". kemudian tumis. masukan ikan dan kemangi tumis sebentr\r\n3. Susun di atas daun pisang, nasi, tuna, nasi lagi. gulung. bakar secukupnya di teflon\r\n', '4-7', 'Makanan', '60-80', '2021-01-03', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `username` varchar(20) NOT NULL,
  `NamaLengkap` varchar(50) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(10) NOT NULL,
  `id_user` int(11) NOT NULL,
  `foto_user` varchar(100) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `level` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `NamaLengkap`, `email`, `password`, `id_user`, `foto_user`, `keterangan`, `level`) VALUES
('Rizqazain', 'Rizqa Alfiani sahaja', 'rizqaalfi@gmail.com', '123', 1, '7e377cdb8d7349174a4a316ba2e1a866.jpg', 'Resep yang saya tulis, sebgain besar merupakan resep turun temurun. jika ada ingin bertanya silahkan', 'user'),
('admin', '', 'llois@gmail.com', 'qwert', 2, '', '', 'admin'),
('lois', '', 'lois@gmail.com', 'qwerty', 3, '', '', 'user'),
('', 'Rizqa Alfiani Zain', 'rizqa123@gmail.com', 'abaca', 10, '', 'Rizqa rajin belajar dan membaca', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `keys`
--
ALTER TABLE `keys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `komen`
--
ALTER TABLE `komen`
  ADD PRIMARY KEY (`id_komen`),
  ADD KEY `id_resep` (`id_resep`);

--
-- Indexes for table `limits`
--
ALTER TABLE `limits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pin`
--
ALTER TABLE `pin`
  ADD PRIMARY KEY (`id_pin`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_resep` (`id_resep`);

--
-- Indexes for table `resep`
--
ALTER TABLE `resep`
  ADD PRIMARY KEY (`id_resep`),
  ADD KEY `resep_ibfk_1` (`id_user`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `keys`
--
ALTER TABLE `keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `komen`
--
ALTER TABLE `komen`
  MODIFY `id_komen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `limits`
--
ALTER TABLE `limits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pin`
--
ALTER TABLE `pin`
  MODIFY `id_pin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `resep`
--
ALTER TABLE `resep`
  MODIFY `id_resep` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `komen`
--
ALTER TABLE `komen`
  ADD CONSTRAINT `komen_ibfk_1` FOREIGN KEY (`id_resep`) REFERENCES `resep` (`id_resep`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pin`
--
ALTER TABLE `pin`
  ADD CONSTRAINT `pin_ibfk_1` FOREIGN KEY (`id_resep`) REFERENCES `resep` (`id_resep`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pin_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `resep`
--
ALTER TABLE `resep`
  ADD CONSTRAINT `resep_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Dumping data for table `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"relation_lines\":\"true\",\"angular_direct\":\"direct\",\"snap_to_grid\":\"off\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Dumping data for table `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'database', 'devita_shop', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"structure_or_data_forced\":\"0\",\"table_select[]\":[\"tbl_buktitransfer\",\"tbl_datapenerima\",\"tbl_datapengiriman\",\"tbl_grup\",\"tbl_keranjang\",\"tbl_keranjangdetail\",\"tbl_pelanggan\",\"tbl_penjualan\",\"tbl_penjualandetail\",\"tbl_produk\",\"tbl_ukuranprd\",\"tbl_user\"],\"table_structure[]\":[\"tbl_buktitransfer\",\"tbl_datapenerima\",\"tbl_datapengiriman\",\"tbl_grup\",\"tbl_keranjang\",\"tbl_keranjangdetail\",\"tbl_pelanggan\",\"tbl_penjualan\",\"tbl_penjualandetail\",\"tbl_produk\",\"tbl_ukuranprd\",\"tbl_user\"],\"table_data[]\":[\"tbl_buktitransfer\",\"tbl_datapenerima\",\"tbl_datapengiriman\",\"tbl_grup\",\"tbl_keranjang\",\"tbl_keranjangdetail\",\"tbl_pelanggan\",\"tbl_penjualan\",\"tbl_penjualandetail\",\"tbl_produk\",\"tbl_ukuranprd\",\"tbl_user\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"structure_and_data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}'),
(2, 'root', 'database', 'db_ci', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"structure_or_data_forced\":\"0\",\"table_select[]\":[\"tm_grup\",\"tm_user\"],\"table_structure[]\":[\"tm_grup\",\"tm_user\"],\"table_data[]\":[\"tm_grup\",\"tm_user\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"structure_and_data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"rsch\",\"table\":\"admins\"},{\"db\":\"db_devita\",\"table\":\"user\"},{\"db\":\"dev_shop\",\"table\":\"tbl_user\"},{\"db\":\"devita_shop\",\"table\":\"tbl_user\"},{\"db\":\"devita_shop\",\"table\":\"tbl_pelanggan\"},{\"db\":\"mydb\",\"table\":\"keys\"},{\"db\":\"devita_shop\",\"table\":\"tbl_penjualan\"},{\"db\":\"devita_shop\",\"table\":\"tbl_keranjang\"},{\"db\":\"devita_shop\",\"table\":\"tbl_produk\"},{\"db\":\"mydb\",\"table\":\"limits\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'jember', 'jalan', '[]', '2021-07-12 17:06:35');

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2021-10-21 03:37:20', '{\"Console\\/Mode\":\"collapse\",\"ThemeDefault\":\"pmahomme\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `project`
--
CREATE DATABASE IF NOT EXISTS `project` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `project`;

-- --------------------------------------------------------

--
-- Table structure for table `grup`
--

CREATE TABLE `grup` (
  `id` enum('1','2') NOT NULL,
  `grup` enum('admin','user') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `grup`
--

INSERT INTO `grup` (`id`, `grup`) VALUES
('1', 'admin'),
('2', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` int(11) NOT NULL,
  `kategori` varchar(100) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `kategori`, `created`, `updated`) VALUES
(1, 'Busana', '2021-07-13 05:32:15', NULL),
(2, 'Tas', '2021-07-13 05:32:15', NULL),
(3, 'Sendal/Sepatu', '2021-07-13 05:32:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id`, `nama`, `no_telp`, `alamat`, `deskripsi`, `created`, `updated`) VALUES
(1, 'fashion.id', '081223564889', 'Surabaya', NULL, '2021-07-07 08:05:39', NULL),
(2, 'shoes.id', '089223678991', ' lumajang kota', ' toko berbagai macam jenis sepatu', '2021-07-07 08:05:39', '2021-07-12 03:15:05'),
(7, 'toko baju', '0883467331', ' BWI', ' semua baju', '2021-07-11 14:57:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `id` int(11) NOT NULL,
  `unit` varchar(100) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`id`, `unit`, `created`, `updated`) VALUES
(1, 'PCS', '2021-07-13 05:39:14', NULL),
(2, 'Buah', '2021-07-13 05:39:25', NULL),
(3, 'Kilogram', '2021-07-13 05:39:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `grup` enum('1','2') NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `nama`, `grup`, `password`) VALUES
(1, 'yemima87', 'lois yemima sari', '1', 'lois12'),
(2, 'abigail77', 'Abigail Ruth', '2', 'abigail'),
(5, 'Tuti', 'Tuti Hartuti', '2', 'tuti1234'),
(8, 'abigail', 'yemima', '2', 'abigail12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `grup`
--
ALTER TABLE `grup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `unit`
--
ALTER TABLE `unit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Database: `rsch`
--
CREATE DATABASE IF NOT EXISTS `rsch` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `rsch`;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(225) NOT NULL,
  `slug_admin` varchar(225) NOT NULL,
  `password` varchar(225) NOT NULL,
  `email` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `username`, `slug_admin`, `password`, `email`) VALUES
(1, 'itrsch', '', '85c90ed3bcdb8534c5bbda75b3708f26ddde4740', 'itrsch@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `artikels`
--

CREATE TABLE `artikels` (
  `artikel_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(225) NOT NULL,
  `slug_artikel` varchar(225) NOT NULL,
  `content` text NOT NULL,
  `image` varchar(225) NOT NULL,
  `date_post` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(100) NOT NULL,
  `keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `artikels`
--

INSERT INTO `artikels` (`artikel_id`, `user_id`, `category_id`, `title`, `slug_artikel`, `content`, `image`, `date_post`, `status`, `keywords`) VALUES
(5, 1, 5, 'Bahaya Virus Corona', 'Bahaya-VirusCorona', 'Jumlah kasus positif virus corona baru COVID-19 di Indonesia semakin meningkat dari hari ke hari. Pemerintah pun mengimbau seluruh masyarakat agar sebisa mungkin bekerja, belajar, dan beribadah dari rumah guna mencegah penularan virus corona.\r\n\r\nIdealnya, Anda memang tidak boleh bepergian ke luar rumah, kecuali untuk urusan tertentu yang bersifat mendesak.\r\n\r\nTapi, jika memang harus ke luar rumah, sebaiknya lakukan beberapa hal berikut ketika sampai di rumah setelah bepergian, terutama di tengah wabah virus corona.', 'corona.JPG', '2020-03-30 08:10:30', 'publish', 'viruscorona');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_name` varchar(225) NOT NULL,
  `slug_category` varchar(225) NOT NULL,
  `order_category` int(11) NOT NULL,
  `category_description` text NOT NULL,
  `date_category` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `user_id`, `category_name`, `slug_category`, `order_category`, `category_description`, `date_category`) VALUES
(4, 1, 'Medis', '5-medis', 1, '', '2019-09-10 04:35:28'),
(5, 1, 'Penunjang Medis', 'penunjang-medis', 2, '', '2019-09-10 04:35:19');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `client_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_name` varchar(225) NOT NULL,
  `slug_client` varchar(225) NOT NULL,
  `image` varchar(225) NOT NULL,
  `website` varchar(225) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL,
  `karir_id` int(11) NOT NULL,
  `name` varchar(225) NOT NULL,
  `email` varchar(225) NOT NULL,
  `website` varchar(225) NOT NULL,
  `message` text NOT NULL,
  `date_comment` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `karir_id`, `name`, `email`, `website`, `message`, `date_comment`) VALUES
(1, 0, 'Indra', 'indrkmna@gmail.com', 'http://indrarukmana.com', 'testing', '2017-02-20 03:54:40'),
(2, 0, 'awda', 'wdqdq@gmail.com', 'http://indrarukmana.com', 'qwdq', '2017-02-20 03:55:42'),
(3, 2, 'rats', 'rats123@gmail.com', 'http://indrarukmana.com', 'rats', '2017-02-20 03:56:37'),
(4, 2, 'xaxsa', 'scascasc@gmail.com', 'http://indrarukmana.com', 'ascasc', '2017-02-20 04:07:27'),
(5, 2, 'adwd', 'awda@gmail.com', 'http://indrarukmana.com', 'dawd', '2017-02-20 04:20:42'),
(6, 3, 'awd', 'apoyaja@gmail.com', 'http://indrarukmana.com', 'qwdqwd', '2017-02-24 07:22:53');

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE `config` (
  `config_id` int(11) NOT NULL,
  `nameweb` varchar(225) NOT NULL,
  `email` varchar(225) NOT NULL,
  `keywords` text NOT NULL,
  `google_maps` text NOT NULL,
  `logo` varchar(225) NOT NULL,
  `icon` varchar(225) NOT NULL,
  `about` text NOT NULL,
  `address` text NOT NULL,
  `city` varchar(100) NOT NULL,
  `zip_code` varchar(100) NOT NULL,
  `phone_number` varchar(225) NOT NULL,
  `metatext` text NOT NULL,
  `fax` text NOT NULL,
  `facebook` varchar(225) NOT NULL,
  `instagram` varchar(225) NOT NULL,
  `youtube` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `config`
--

INSERT INTO `config` (`config_id`, `nameweb`, `email`, `keywords`, `google_maps`, `logo`, `icon`, `about`, `address`, `city`, `zip_code`, `phone_number`, `metatext`, `fax`, `facebook`, `instagram`, `youtube`) VALUES
(1, 'Rumah Sakit Citra Husada Jember', 'rs_citrahusada@yahoo.co.id', 'Pickup your items', 'https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d15797.424135247013!2d113.6806659!3d-8.166839!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x42956e9612f6b07a!2sRumah+Sakit+Citra+Husada!5e0!3m2!1sid!2sid!4v1556759906047!5m2!1sid!2sid\"', 'LOGO_RSCH.png', 'logo_asli.png', '<p style=\"text-align: justify;\"><strong>SAMBUTAN DIREKTUR</strong></p>\r\n<p style=\"text-align: justify;\"><strong><em>Assalamu&rsquo;alaikum Wr. Wb.</em></strong></p>\r\n<p style=\"text-align: justify;\">Selamat datang di situs web resmi Rumah Sakit Citra Husada. Puji syukur kami panjatkan ke hadirat Tuhan Yang Maha Esa sehingga situs web ini bisa kami persembahkan kepada masyarakat luas untuk menjadi akses informasi tentang segenap layanan kami.</p>\r\n<p style=\"text-align: justify;\">Ucapan terima kasih senantiasa kami haturkan setinggi-tingginya kepada masyarakat yang memberikan kepercayaan kepada kami sehingga Rumah Sakit Citra Husada terus tumbuh dan berkembang menjadi rumah sakit yang memberikan pelayanan terbaik dan menjangkau seluruh lapisan masyarakat melalui layanan yang cepat, tepat, mudah, serta senantiasa menjadikan pelayanan yang berkualitas dan terjangkau sebagai visi utama layanan kami. Seiring dengan perkembangan industri kesehatan dan untuk memenuhi kebutuhan pelayanan kesehatan yang optimal bagi masyarakat, Rumah Sakit Citra Husada yang bergerak di bidang industri jasa layanan kesehatan akan terus mengembangkan usaha di seluruh aspek industi layanan kesehatan.</p>\r\n<p style=\"text-align: justify;\">Rumah Sakit Citra Husada dilengkapi layanan gawat darurat, layanan operasi, layanan dokter umum, layanan dokter spesialis, serta beragam layanan lain yang kami dasarkan kepada kebutuhan masyarakat akan pelayanan kesehatan yang berkualitas. Didukung dengan Sumber Daya Manusia yang berkomitmen untuk memberikan pelayanan terbaik di semua lini berupa tenaga medis, perawatan, penunjang medis dan non medis yang berpengalaman, handal dan terpercaya.</p>\r\n<p style=\"text-align: justify;\">Besar harapan kami agar situs web ini dapat memberikan manfaat kepada masyarakat luas utamanya yang membutuhkan akses informasi tentang layanan kami. Kepada mereka semua, kami persembahkan situs web ini. Kami mengucapkan terima kasih kepada seluruh</p>\r\n<p style=\"text-align: justify;\">pemangku kepentingan, mitra, pelanggan, masyarakat, dan semua pihak yang menggunakan fasilitas situs web ini.</p>\r\n<p style=\"text-align: justify;\"><strong><em>Wassalamu&rsquo;alaikum Wr. Wb.</em></strong></p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\"><strong>SEJARAH</strong></p>\r\n<p style=\"text-align: justify;\">Rumah Sakit Citra Husada Jember diresmikan pada tanggal 16 April 2009 di bawah naungan Yayasan Citra Husada Jember, kemudian dengan berbagai upaya, pada tanggal 15 November 2011 izin operasional tetap diperoleh dari Bupati Jember dengan SK Bupati Jember Nomor 188.45/253/012/2011 Tentang Izin Operasional Tetap Rumah Sakit Citra Husada Jember dan penetapan kelas diperoleh berdasarkan SK Menteri Kesehatan&nbsp; Nomor HK.03.05/I/2375/11 Tentang Penetapan Kelas RS Citra Husada Jember sebagai RS kelas D. Kemudian pada tahun 2016 Rumah Sakit Citra Husada Kembali mendapatkan perpanjangan izin operasional berdasarkan Keputusan Bupati Jember Nomor 188.45/420/1.12/2016 dengan status klasifikasi rumah sakit kelas C dan berlaku sejak 23 Desember 2016. Keputusan tersebut merupakan hal yang mendasar sejalan dengan pembenahan organisasi, pemenuhan SDM, sarana dan prasarana fisik, peralatan medik dan penunjang medik. Rumah Sakit juga telah terakreditasi dengan status tingkat paripurna sejak tanggal 19 Oktober 2017.</p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\"><strong>IDENTITAS</strong></p>\r\n<table border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td width=\"187\">\r\n<p>Nama Rumah Sakit</p>\r\n</td>\r\n<td width=\"432\">\r\n<p>Rumah Sakit Citra Husada</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td width=\"187\">\r\n<p>Alamat Rumah Sakit</p>\r\n</td>\r\n<td width=\"432\">\r\n<p>Jl. Teratai No. 22 Jember</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td width=\"187\">\r\n<p>Kelas Rumah Sakit</p>\r\n</td>\r\n<td width=\"432\">\r\n<p>C</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td width=\"187\">\r\n<p>Status Kepemilikan</p>\r\n</td>\r\n<td width=\"432\">\r\n<p>Yayasan Citra Husada</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td width=\"187\">\r\n<p>Surat Ijin RS</p>\r\n</td>\r\n<td width=\"432\">\r\n<p>188.45/420/1.12/2016</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td width=\"187\">\r\n<p>Tanggal</p>\r\n</td>\r\n<td width=\"432\">\r\n<p>23 Desember 2016</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td width=\"187\">\r\n<p>Oleh</p>\r\n</td>\r\n<td width=\"432\">\r\n<p>Bupati Jember</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td width=\"187\">\r\n<p>Sifat</p>\r\n</td>\r\n<td width=\"432\">\r\n<p>Tetap</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td width=\"187\">\r\n<p>Akreditasi</p>\r\n</td>\r\n<td width=\"432\">\r\n<p>Paripurna</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\"><strong>VISI</strong></p>\r\n<p style=\"text-align: justify;\">Rumah Sakit Swasta Pilihan Dengan Pelayanan Yang Berkualitas Dan Terjangkau</p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\"><strong>MISI</strong></p>\r\n<ol style=\"text-align: justify;\">\r\n<li>Menyelenggarakan pelayanan kesehatan yang bermutu &amp; profesional</li>\r\n<li>Mewujudkan kepuasan pelanggan melalui optimalisasi kinerja</li>\r\n</ol>\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\"><strong>MOTTO</strong></p>\r\n<p style=\"text-align: justify;\">Kesehatan Anda Adalah Harapan Kami</p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\"><strong>NILAI</strong></p>\r\n<ol style=\"text-align: justify;\">\r\n<li>Professional</li>\r\n<li>Bekerja sesuai dengan kompetensinya</li>\r\n<li>Bekerja dengan efektif dan efesien</li>\r\n<li>Cakap dan menguasai pekerjaannya</li>\r\n<li>Mengutamakan pasien dan melayani keluarga pasien dengan baik</li>\r\n<li>Respect</li>\r\n<li>Menghormati setiap individu</li>\r\n<li>Mau mendengarkan dan menghargai pendapat orang lain</li>\r\n<li>Menyampaikan penghargaan atau pujian secara memadai</li>\r\n<li>Kedisiplinan</li>\r\n<li>Bekerja dan bertindak sesuai tugas dan aturan</li>\r\n<li>Memulai dan mengakhiri pekerjaan tepat waktu</li>\r\n<li>Tepat janji</li>\r\n<li>Tegas dalam memutuskan suatu masalah tanpa mengurangi keramahan dan kesopanan</li>\r\n<li>Kerjasama</li>\r\n<li>Bekerja secara sinergis baik dalam satu unit maupun dengan unit lain dalam mencapai visi</li>\r\n<li>Saling pengertian dan toleransi diantara sesama anggota Tim</li>\r\n<li>Tidak melakukan hal-hal yang mengakibatkan timbulnya konflik</li>\r\n<li>Tidak egois dan lebih mementingkan keharmonisan Tim</li>\r\n</ol>\r\n<p style=\"text-align: justify;\">&nbsp;</p>', 'Jl. Teratai 22, Patrang', 'Jember', '68117', '(0331) 486200', '', '(0331) 427088', 'https://www.facebook.com/rscitrahusadajember/', 'https://www.instagram.com/rscitrahusadajember/', 'https://www.youtube.com/channel/UCWrutgBiaPK0vCk_pYxwGhw');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `message_id` int(11) NOT NULL,
  `name` varchar(225) NOT NULL,
  `email` varchar(100) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `messages` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `downloads`
--

CREATE TABLE `downloads` (
  `download_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `file_name` varchar(225) NOT NULL,
  `slug_download` varchar(225) NOT NULL,
  `file` varchar(225) NOT NULL,
  `date_upload` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `file_description` text NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

CREATE TABLE `galleries` (
  `gallery_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `gallery_name` varchar(225) NOT NULL,
  `slug_gallery` varchar(225) NOT NULL,
  `image` varchar(225) NOT NULL,
  `gallery_description` text NOT NULL,
  `position` varchar(100) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `galleries`
--

INSERT INTO `galleries` (`gallery_id`, `user_id`, `gallery_name`, `slug_gallery`, `image`, `gallery_description`, `position`, `date`, `status`) VALUES
(11, 1, '1', '12-1', 'Website_11.jpg', 'Tata Cara Pendaftaran', 'slider', '2020-05-11 06:01:19', 'publish'),
(12, 1, '2', '12-2', 'Website_21.jpg', '', 'slider', '2020-04-27 06:16:36', 'publish'),
(15, 1, 'dr. Gofur', '15-dr-gofur', 'Gofur.jpg', '', 'dokter', '2020-05-18 01:38:28', 'publish'),
(16, 1, 'dr. Bagas', 'dr-bagas', 'Bagas.jpg', '', 'dokter', '2020-05-18 01:53:17', 'publish'),
(17, 1, 'dr. Budi', 'dr-budi', 'Budi.jpg', '', 'dokter', '2020-05-18 01:55:15', 'publish'),
(18, 1, 'dr. Arif', 'dr-arif', 'Arif.jpg', '', 'dokter', '2020-05-18 01:55:39', 'publish'),
(19, 1, 'dr. Handi', 'dr-handi', 'Handi.jpg', '', 'dokter', '2020-05-18 01:56:37', 'publish'),
(20, 1, 'dr. Ludfi', 'dr-ludfi', 'Ludfi.jpg', '', 'dokter', '2020-05-18 02:00:37', 'publish'),
(21, 1, 'dr. Yuli', 'dr-yuli', 'Yuli.jpg', '', 'dokter', '2020-05-18 02:00:50', 'publish'),
(22, 1, 'dr. Lukman', 'dr-lukman', 'Lukman.jpg', '', 'dokter', '2020-05-18 02:01:03', 'publish'),
(23, 1, 'dr. Leni', 'dr-leni', 'Leni.jpg', '', 'dokter', '2020-05-18 02:04:43', 'publish'),
(24, 1, 'dr. Lely', 'dr-lely', 'Lely.jpg', '', 'dokter', '2020-05-18 02:05:29', 'publish'),
(25, 1, 'dr. Kadek', 'dr-kadek', 'kadek.jpg', '', 'dokter', '2020-05-18 02:06:20', 'publish'),
(26, 1, 'dr. Zaki', 'dr-zaki', 'Zaki.jpg', '', 'dokter', '2020-05-18 02:06:35', 'publish'),
(27, 1, 'dr. Natalia', 'dr-natalia', 'Natalia.jpg', '', 'dokter', '2020-05-18 02:06:46', 'publish');

-- --------------------------------------------------------

--
-- Table structure for table `karirs`
--

CREATE TABLE `karirs` (
  `karir_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(225) NOT NULL,
  `slug_karir` varchar(225) NOT NULL,
  `content` text NOT NULL,
  `image` varchar(225) NOT NULL,
  `date_post` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(100) NOT NULL,
  `keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `karirs`
--

INSERT INTO `karirs` (`karir_id`, `user_id`, `category_id`, `title`, `slug_karir`, `content`, `image`, `date_post`, `status`, `keywords`) VALUES
(5, 1, 5, 'Lowongan Programmer', 'lowongan-programmer', '<p><strong>Kualifikasi :</strong></p>\r\n<ul>\r\n<li>Pendidikann D3/S1 Sistem Informasi / Teknik Informatika</li>\r\n<li>Diutamakan Laki - laki</li>\r\n<li>Diutamakan Memilik Pengalaman Kerja Minimal 2 Tahun sebagai Web Programmer di Rumah Sakit</li>\r\n<li>Menguasai PHP, MySQL, PostgreSQL, Jquery, HTML, CSS, CI,Javascript, Android, dan REST API</li>\r\n<li>Diutamakan Pernah Membuat Aplikasi Berbasis Android dan Website yang Berbasis Rumah Sakit</li>\r\n<li>Mampu Bekerja Mandiri maupun dalam Tim</li>\r\n<li>Memiliki Komitmen dan Integritas yang tingi Komunikatif dan Kreatif</li>\r\n</ul>', 'IT1.JPG', '2019-09-20 08:26:52', 'publish', 'lowonganprogrammer');

-- --------------------------------------------------------

--
-- Table structure for table `kegiatans`
--

CREATE TABLE `kegiatans` (
  `kegiatan_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(225) NOT NULL,
  `slug_kegiatan` varchar(225) NOT NULL,
  `content` text NOT NULL,
  `image` varchar(225) NOT NULL,
  `date_post` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(100) NOT NULL,
  `keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kegiatans`
--

INSERT INTO `kegiatans` (`kegiatan_id`, `user_id`, `category_id`, `title`, `slug_kegiatan`, `content`, `image`, `date_post`, `status`, `keywords`) VALUES
(1, 1, 5, 'Bimbingan SNARS edisi 1.1 ', 'bimbingan', 'Srrangkaian kegiatan rumah sakit demi meningkatkan kualitas sumber daya baik manusia maka diperlukannya bimbingan ..... bla bla bala', 'bimb1.JPG', '2020-07-01 06:18:36', 'publish', 'bimbingan');

-- --------------------------------------------------------

--
-- Table structure for table `keluhans`
--

CREATE TABLE `keluhans` (
  `message_id` int(11) NOT NULL,
  `name` varchar(225) NOT NULL,
  `email` varchar(100) NOT NULL,
  `messages` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `price`
--

CREATE TABLE `price` (
  `price_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `price_name` varchar(225) NOT NULL,
  `price` varchar(225) NOT NULL,
  `headline` text NOT NULL,
  `description` text NOT NULL,
  `with_service` varchar(100) NOT NULL,
  `no_with_service` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `price`
--

INSERT INTO `price` (`price_id`, `user_id`, `price_name`, `price`, `headline`, `description`, `with_service`, `no_with_service`, `status`, `date`) VALUES
(4, 1, 'Industri Setup Awal', '90.000/3 Bulan/ Unit', '', '', 'Free', '90.000/3 Bulan/ Unit', 'publish', '2017-03-07 00:50:38'),
(5, 1, 'Industri Kecil', '500.000/ Unit', '', '', 'Free', '270.000/3 Bulan/ Unit', 'publish', '2017-03-07 00:33:55'),
(6, 1, 'Industri Menengah', '750.000/ Unit', '', '', '270.000/3 Bulan/ Unit', 'Call', 'publish', '2017-03-07 00:34:29'),
(7, 1, 'Industri Besar', 'Call', '', '', 'Call', 'Call', 'publish', '2017-03-07 00:34:49'),
(8, 1, 'Pemerintah', 'Call', '', '', 'Call', 'Call', 'publish', '2017-03-07 00:35:01'),
(9, 0, '', '', 'awdawd', '', '', '', '', '2017-03-07 08:41:35'),
(10, 0, '', '', 'iokoko', '', '', '', '', '2019-05-02 03:03:49');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_name` varchar(225) NOT NULL,
  `slug_product` varchar(225) NOT NULL,
  `image` varchar(225) NOT NULL,
  `product_description` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

CREATE TABLE `types` (
  `type_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type_name` varchar(225) NOT NULL,
  `slug_type` varchar(225) NOT NULL,
  `order_type` int(11) NOT NULL,
  `type_description` text NOT NULL,
  `date_type` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `types`
--

INSERT INTO `types` (`type_id`, `user_id`, `type_name`, `slug_type`, `order_type`, `type_description`, `date_type`) VALUES
(4, 1, 'testing', '', 1, 'testing type', '2017-02-16 13:56:38'),
(5, 1, 'Odol', 'odol', 2, 'odol', '2017-02-16 13:57:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `artikels`
--
ALTER TABLE `artikels`
  ADD PRIMARY KEY (`artikel_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`config_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `downloads`
--
ALTER TABLE `downloads`
  ADD PRIMARY KEY (`download_id`);

--
-- Indexes for table `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`gallery_id`);

--
-- Indexes for table `karirs`
--
ALTER TABLE `karirs`
  ADD PRIMARY KEY (`karir_id`);

--
-- Indexes for table `kegiatans`
--
ALTER TABLE `kegiatans`
  ADD PRIMARY KEY (`kegiatan_id`);

--
-- Indexes for table `price`
--
ALTER TABLE `price`
  ADD PRIMARY KEY (`price_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `artikels`
--
ALTER TABLE `artikels`
  MODIFY `artikel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `config`
--
ALTER TABLE `config`
  MODIFY `config_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `downloads`
--
ALTER TABLE `downloads`
  MODIFY `download_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `galleries`
--
ALTER TABLE `galleries`
  MODIFY `gallery_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `karirs`
--
ALTER TABLE `karirs`
  MODIFY `karir_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `kegiatans`
--
ALTER TABLE `kegiatans`
  MODIFY `kegiatan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `price`
--
ALTER TABLE `price`
  MODIFY `price_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
