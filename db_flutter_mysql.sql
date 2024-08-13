-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 13 Agu 2024 pada 04.00
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_edwinfarid_ukk_rpl_2024`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim` int(15) NOT NULL,
  `nama_mahasiswa` varchar(30) NOT NULL,
  `program_studi` varchar(30) NOT NULL,
  `tahun_masuk` int(10) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `nama_mahasiswa`, `program_studi`, `tahun_masuk`, `username`, `password`) VALUES
(123, 'edwin', 'infomatika', 2020, 'edwin', 'edwin'),
(1234, 'alik', 'informatika', 2020, '123', '123');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengajuan_topik`
--

CREATE TABLE `pengajuan_topik` (
  `id_topik` int(11) NOT NULL,
  `nim` int(15) NOT NULL,
  `dosen_pembimbing_utama` varchar(35) NOT NULL,
  `topik_1` text NOT NULL,
  `topik_2` text NOT NULL,
  `topik_3` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pengajuan_topik`
--

INSERT INTO `pengajuan_topik` (`id_topik`, `nim`, `dosen_pembimbing_utama`, `topik_1`, `topik_2`, `topik_3`) VALUES
(28, 123, 'Julkipli', 'WEb', 'Desktop', 'Mobile');

-- --------------------------------------------------------

--
-- Struktur dari tabel `program_studi`
--

CREATE TABLE `program_studi` (
  `kode_prodi` int(15) NOT NULL,
  `nama_prodi` varchar(30) NOT NULL,
  `nama_koordinator_prodi` varchar(35) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `program_studi`
--

INSERT INTO `program_studi` (`kode_prodi`, `nama_prodi`, `nama_koordinator_prodi`, `username`, `password`) VALUES
(1, 'Informatika', 'Gunawan', 'gun', 'gun123');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim`);

--
-- Indeks untuk tabel `pengajuan_topik`
--
ALTER TABLE `pengajuan_topik`
  ADD PRIMARY KEY (`id_topik`),
  ADD UNIQUE KEY `nim` (`nim`);

--
-- Indeks untuk tabel `program_studi`
--
ALTER TABLE `program_studi`
  ADD PRIMARY KEY (`kode_prodi`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `pengajuan_topik`
--
ALTER TABLE `pengajuan_topik`
  MODIFY `id_topik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pengajuan_topik`
--
ALTER TABLE `pengajuan_topik`
  ADD CONSTRAINT `pengajuan_topik_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
