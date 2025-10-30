-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 27 Okt 2025 pada 15.09
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbphp`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbphp`
--

CREATE TABLE `tbphp` (
  `id` int(11) NOT NULL,
  `nama` varchar(225) NOT NULL,
  `pesan` text NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbphp`
--

INSERT INTO `tbphp` (`id`, `nama`, `pesan`, `create_at`) VALUES
(1, 'RAFI AHMAD ZANJABILA', 'NYUWUN SEWU', '2025-10-27 13:48:49'),
(2, 'PROF FADIL', 'MAN JADDA WAJADDA', '2025-10-27 13:49:23'),
(3, 'IR SARIF ', 'P INFO LAWAN KERAS', '2025-10-27 13:49:44'),
(4, 'DR TEGAR ', 'DI SEHAT SEHAT SEDOYO', '2025-10-27 13:50:08'),
(5, 'UST REZA AHI', 'INFO NGAJI BOLOO', '2025-10-27 13:50:39'),
(6, 'NOPAL', 'terimakasih', '2025-10-27 13:50:53'),
(7, 'SAYA SENDIRI', 'SUKRON ', '2025-10-27 13:51:09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_detailpenjualan`
--

CREATE TABLE `tb_detailpenjualan` (
  `id_detail` int(11) NOT NULL,
  `id_penjualan` int(11) DEFAULT NULL,
  `id_produk` int(11) DEFAULT NULL,
  `jumlah_produk` int(11) DEFAULT NULL,
  `sub_total` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_detailpenjualan`
--

INSERT INTO `tb_detailpenjualan` (`id_detail`, `id_penjualan`, `id_produk`, `jumlah_produk`, `sub_total`) VALUES
(1, 7, 1, 1, 2500000),
(2, 7, 5, 1, 980000),
(3, 7, 6, 2, 152000),
(4, 8, 2, 1, 2500000),
(5, 8, 4, 1, 2550000),
(6, 8, 7, 1, 125000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pelanggan`
--

CREATE TABLE `tb_pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `nama_pelanggan` varchar(255) DEFAULT NULL,
  `alamat_pelanggan` text DEFAULT NULL,
  `no_telp_pelanggan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_pelanggan`
--

INSERT INTO `tb_pelanggan` (`id_pelanggan`, `nama_pelanggan`, `alamat_pelanggan`, `no_telp_pelanggan`) VALUES
(1, 'RAFI', 'PEMALANG', '085879006902'),
(2, 'PROF FADIL', 'PEKALONGAN', '089765432123'),
(3, 'FEBRI', 'JOGJA', '085879006902'),
(4, 'PUSPA', 'MAGELANG', '085674532129'),
(5, 'TEGAR', 'JAKSEL', '089338822662'),
(6, 'SARIFFF', 'JAKBAR', '098765432123'),
(7, 'REZA ABI', 'JAWAKARTA', '087988765342');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_penjualan`
--

CREATE TABLE `tb_penjualan` (
  `id_penjualan` int(11) NOT NULL,
  `tanggal_penjualan` date DEFAULT NULL,
  `total_harga` int(11) DEFAULT NULL,
  `id_pelanggan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_penjualan`
--

INSERT INTO `tb_penjualan` (`id_penjualan`, `tanggal_penjualan`, `total_harga`, `id_pelanggan`) VALUES
(1, '2025-10-23', 345000, 2),
(2, '2025-10-24', 3825000, 6),
(3, '2025-10-24', 563000, 5),
(4, '2025-10-25', 12500000, 7),
(5, '2025-10-26', 1980000, 3),
(7, '2025-10-27', 3632000, 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_produk`
--

CREATE TABLE `tb_produk` (
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(255) DEFAULT NULL,
  `harga_produk` int(11) DEFAULT NULL,
  `stok_produk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_produk`
--

INSERT INTO `tb_produk` (`id_produk`, `nama_produk`, `harga_produk`, `stok_produk`) VALUES
(1, 'STICK PS', 100000, 100),
(2, 'SANDAL SEPASANG', 250000, 2000),
(3, 'KITAB BIDAYTUL HIDAYAH', 10000, 190),
(4, 'KITAB ILAL', 10000, 500),
(5, 'KAOS DISTRO', 120000, 800),
(6, 'GANTUNGAN KUNCI', 76000, 178),
(7, 'BAKSO BERANAK', 125000, 109),
(8, 'JUAL YANG PERLU DIJUAL', 75900, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `level` enum('admin','petugas') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `nama`, `username`, `password`, `level`) VALUES
(1, 'admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin'),
(2, 'petugas', 'petugas', '21232f297a57a5a743894a0e4a801fc3', 'petugas'),
(3, 'RAFI AHMAD ZANJABILA', 'RAFI AHMAD ZANJABILA', '464dc9ecd2432510c1d26e570c702e4c', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbphp`
--
ALTER TABLE `tbphp`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_detailpenjualan`
--
ALTER TABLE `tb_detailpenjualan`
  ADD PRIMARY KEY (`id_detail`);

--
-- Indeks untuk tabel `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `tb_penjualan`
--
ALTER TABLE `tb_penjualan`
  ADD PRIMARY KEY (`id_penjualan`);

--
-- Indeks untuk tabel `tb_produk`
--
ALTER TABLE `tb_produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbphp`
--
ALTER TABLE `tbphp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `tb_detailpenjualan`
--
ALTER TABLE `tb_detailpenjualan`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `tb_penjualan`
--
ALTER TABLE `tb_penjualan`
  MODIFY `id_penjualan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `tb_produk`
--
ALTER TABLE `tb_produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
