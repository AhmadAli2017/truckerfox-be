-- phpMyAdmin SQL Dump
-- version 4.9.11
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 09, 2023 at 12:51 PM
-- Server version: 5.7.43-cll-lve
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ea5e1z5mh17s_trucker_fox`
--

-- --------------------------------------------------------

--
-- Table structure for table `bols`
--

CREATE TABLE `bols` (
  `id` char(36) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `name` varchar(255) NOT NULL,
  `userId` char(36) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `courierHandlerId` char(36) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `bol_single` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bols`
--

INSERT INTO `bols` (`id`, `name`, `userId`, `courierHandlerId`, `createdAt`, `updatedAt`, `bol_single`) VALUES
('36bacc65-232b-448b-bfb5-27cba8e8ea0e', '1685625426406-Edge0593905.pdf', '2758ac56-f4ae-43b4-a5a3-ff7d219eec23', 'cc8600e7-49b9-42f7-b2ca-80f8245b5c9e', '2023-06-01 13:17:06', '2023-06-01 13:17:06', ''),
('472a5a31-dd6b-46fe-963e-b613f354e155', '1695222122843-ElonMusk.pdf', 'dda6f9f5-befb-4398-97f0-728ead20a440', '89e40754-c1bc-41bf-b77d-25d89916c55f', '2023-09-20 15:02:02', '2023-09-20 15:02:02', ''),
('b82defa0-cf6c-4c8a-bdbf-d3a6562eecf3', '1696368132573-Clever1234.pdf', 'dda6f9f5-befb-4398-97f0-728ead20a440', '5c8faef0-69a1-40b3-ab56-2567c8c6e0e8', '2023-10-03 21:22:12', '2023-10-03 21:22:12', ''),
('ca628bad-77f9-440e-9df7-c97cd78c09da', '1687270691384-Ryan3605441.pdf', 'e4354f09-2e5e-4942-8a4d-da5599594718', '11da7b8b-19c7-4d30-9c9f-fc005650bff2', '2023-06-20 14:18:11', '2023-06-20 14:18:11', ''),
('e16d9029-3cc0-4de6-8f40-6647c5afeb8d', '1686579740381-DIF104693.pdf', 'e4354f09-2e5e-4942-8a4d-da5599594718', '9d2ed9a4-9f9b-4aab-b9be-d82639fbb2bc', '2023-06-12 14:22:20', '2023-06-12 14:22:20', ''),
('ee9000ba-18bd-46d9-9e71-ddbaf2f51afc', '1686660421560-SpotS1739993.pdf', '2758ac56-f4ae-43b4-a5a3-ff7d219eec23', '0408e32d-a139-4805-8cb4-8906332d1dbd', '2023-06-13 12:47:01', '2023-06-13 12:47:01', '');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` char(36) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `mcNumber` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `carrierName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `isAdmin` tinyint(1) NOT NULL DEFAULT '0',
  `limit` int(11) DEFAULT '20',
  `plan` varchar(256) NOT NULL DEFAULT 'Free Plan',
  `assigned_count` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `mcNumber`, `password`, `createdAt`, `updatedAt`, `carrierName`, `email`, `phone`, `isAdmin`, `limit`, `plan`, `assigned_count`) VALUES
('017248c9-981e-4e9f-9261-a19a8215eb36', '1001', '$2b$12$e07y4PCCmTUjzLGpIJb4CeIgSHfonxh4E0jNL0OjecyEtUud2yVTq', '2023-10-26 01:01:09', '2023-10-26 01:01:09', 'Mu Express Inc', 'Accounting@Muexpressinc.Com', '	(708) 286-5677', 0, 20, 'Free Plan', 0),
('027f9548-75b9-46a4-bef9-1144409ce5da', '1274233', '$2b$12$lLKRxO3zHQkMF5hU2c8nJeTcvo8K8DbNO8trbZq33Z3EkIeMMnwyS', '2023-10-26 00:04:22', '2023-10-26 00:04:22', 'Us Freight Connection Llc', 'Bobbym_Bv@Yahoo.Com', '(847) 598-8288', 0, 20, 'Free Plan', 0),
('09fa4e2a-91ca-4107-ba45-ae079317c080', '069513', '$2b$12$YTxwFLExDmE/kzi0DXE9GeS.W6uC3d.wDwgmA3cOi6JjSYF9zOS82', '2023-06-14 16:10:27', '2023-06-14 16:10:27', 'DI Kestro LLC', 'ada.obiri@dikestrollc.com', '6822700449', 0, 20, 'Free Plan', 0),
('0f295ccd-e049-4f04-b6f6-53d53482fb21', '975701', '$2b$12$DoY5ZcVkl7K6ekX65/Kt6OrEc8NV90UqaEPTlJErzmZfEWqv4p8ou', '2023-10-26 00:43:29', '2023-10-26 00:43:29', 'Richardson & Sons Hauling Llc', 'Sgtjeffrichardson@Hotmail.Com', '(715) 285-5262', 0, 20, 'Free Plan', 0),
('12748b68-4d61-4165-9967-47277ba511bb', '682980', '$2b$12$qtk7AOtZqWT0lAiVbJ06D.XFZToekUI0pRhfs.jicDXbNjX8VEN9S', '2023-10-26 00:40:09', '2023-10-26 00:40:09', 'C M Transport Llc', 'Cm.Transport@Hotmail.Com', '(620) 290-8741', 0, 20, 'Free Plan', 0),
('1810ef45-5e2d-482c-8e6f-23825bdb3380', '1408888', '$2b$12$R0615dmpWcK0vBYbsIQ9GOo6ubYYikWx8xxKiFIUS3MZa2KSVNiNO', '2023-10-26 00:11:28', '2023-10-26 00:11:28', 'Boss Trucking Llc', 'Gaganbhangu204@Gmail.Com', '(909) 641-5944', 0, 20, 'Free Plan', 0),
('1af0bb09-e8ee-4262-bf3d-cac4b5166e64', '094827', '$2b$12$vvLe6Ozd4sFvE7918c7xAur8xbClyX/IMk4V0Ud39AwaAxCg0Alsy', '2023-10-10 17:51:29', '2023-10-10 18:00:30', 'NPK Freight LLC', 'pnguyen@npkfreightllc.com', '972-998-4743', 0, 20, 'Free Plan', 1),
('1c633579-a33a-42d0-8c6c-8fd86927386b', '6292', '$2b$12$0qu8qykqrV/vx9AQcpb2O.XF3xGvcfXbHSg6JFs6rThyHCRQrCkZe', '2023-10-26 00:33:15', '2023-10-26 00:33:15', 'V & S Trucking Inc', 'Vstrucking12@Gmail.Com', '(806) 346-2123', 0, 20, 'Free Plan', 0),
('1c9a08e5-5afe-4299-a37f-a5ac65e964b1', '1205647', '$2b$12$EYWtNM0dp9kzp8llC8apyO/LWpg2TmnHT72EMnuq8DNqoPpkRk386', '2023-10-25 23:55:59', '2023-10-25 23:55:59', 'Mean Transportation Llc', 'Admin@Meantransportation.Com', '(539) 900-5169', 0, 20, 'Free Plan', 0),
('1f553702-7c16-490b-9491-a415e366ef1d', '968513', '$2b$12$LJCBNSGHyHAbUyeiipet9Obi6J1LAJiMzeRGB.kqKVQGtEM4W0yZ2', '2023-10-26 01:09:38', '2023-10-26 01:09:38', 'Kolesnikov Trucking Inc', 'Kolesnikov.Trucking@Yahoo.Com', '(916) 882-3917', 0, 20, 'Free Plan', 0),
('1fbdb90f-633e-444f-a64b-e6ceaf83c22f', '910680', '$2b$12$tW5j5EVzeELSM2/rR0DYXO.Djz4MDopiXFAI.KrqEZORz9tUiwAiK', '2023-10-04 19:51:10', '2023-10-04 19:51:10', 'Midland Transport LLC', 'abdul.mtllc@gmail.com', '9524465484', 0, 20, 'Free Plan', 0),
('209dc026-448f-4040-b904-36c8b4e588fe', '447731', '$2b$12$sdEM.TzDfJtx6Zpuwjg.U.k1gfO/4n50gwh..N1aL/8PTvoahDgmm', '2023-10-26 01:08:05', '2023-10-26 01:08:05', 'Grana Enterprises Inc', 'Annamarie@Jpstransports.Com', '(480) 226-9354', 0, 20, 'Free Plan', 0),
('20eabba4-c83d-4ace-a9e1-e8c5208b8dee', '1411271', '$2b$12$pTrqw4XYEJnMPUgvvd3hf.Ka37d4Lym2NYUxEPkSKeteYZaeGzo0q', '2023-10-25 23:57:03', '2023-10-25 23:57:03', 'O & E Transportation Llc', 'Oandetransportation@Gmail.Com', '(806) 683-0582', 0, 20, 'Free Plan', 0),
('21e0eeab-c559-4af0-a74e-0f1238ae4316', '908380', '$2b$12$vN9JGyUo86zBIVZw0E7WcOEOgOBZchNxjomHkJJjVa4urEhbDCmJS', '2023-10-26 01:10:00', '2023-10-26 01:10:00', 'Expressway Logistics Llc', 'Expressway12@Yahoo.Com', '(614) 439-5214', 0, 20, 'Free Plan', 0),
('2270b71f-23ca-40af-9cb5-a874326ae927', '736412', '$2b$12$O5c8xDJ4SEN6m9ugKnGZw.9DR560xNnpJGLtzceg4ayaQXZCdVSCC', '2023-10-26 00:03:15', '2023-10-26 00:03:15', 'Tower Bridge Logistics Llc', 'Towerbridgelogistics@Gmail.Com', '(916) 753-0222', 0, 20, 'Free Plan', 0),
('24159765-ce1b-433e-93dc-c9bb0f94f258', '787352', '$2b$12$fhESJB6J0FINAkN52o0tp.9hdIvRqtwj9EOvl5SSGd9I8e2e.RABa', '2023-10-26 00:30:29', '2023-10-26 00:30:29', 'Iwt Transport Inc', 'Dobrien@Iwt-Inc.Com', '	(201) 644-0485', 0, 20, 'Free Plan', 0),
('2c89e25a-cfc5-4eb6-8ee7-b55982c8ab3f', '00110011', '$2b$12$pYTEXg1WYf30WT0IWVi9eOIGXNn3rM8zr65VcQUbYwIgMIuJqenHi', '2023-06-02 18:04:36', '2023-06-02 18:04:36', 'TCS', 'tcs@gmail.com', '03457897567', 0, 20, 'Free Plan', 0),
('2f327f3a-1e9f-4f43-ad16-9c8394007772', '343629', '$2b$12$S/DfbE3dG6zL.3WuX/qsB.MUeIm0PW0SFF31Gx6QuVcBKXhOFvVUS', '2023-10-26 00:35:00', '2023-10-26 00:35:00', 'R M T Transport Inc', 'Kevinmccannrmt@Gmail.Com', '(219) 285-2307', 0, 20, 'Free Plan', 0),
('31a74ad2-8fe7-4942-8640-bb8496408bc9', '928009', '$2b$12$DIDstsy8r0Lv3zwDwljyIutp5ctnLrIr6lvTGNUt5cw6bFq7DHDge', '2023-10-26 00:41:19', '2023-10-26 00:41:19', 'Gable Trucking Llc', 'Rrgable@Sbcglobal.Net', '	(620) 562-0246', 0, 20, 'Free Plan', 0),
('3311c269-8d6c-45b5-8891-6b8620ae7bf6', '564577', '$2b$12$FRowUlssozZ/5R1Tr56Teu1EpOQIbvb8zjbPKpHRaL00053JO6gHS', '2023-10-26 00:44:49', '2023-10-26 00:44:49', 'Seattle Trans Llc', 'Stlgill47@Gmail.Com', '(425) 387-4513', 0, 20, 'Free Plan', 0),
('3568a1a1-f69d-445c-8a72-844d64a1749b', '230852', '$2b$12$U6M0JxfM550mt7aE2X2zdezWPMP6g6JJOYcN5QrrTPwFA4Ne.szwi', '2023-10-26 00:13:59', '2023-10-26 00:13:59', 'Haigler Trucking Company', 'Haigler1980@Gmail.Com', '(352) 598-9743', 0, 20, 'Free Plan', 0),
('3704462d-6ceb-47ea-b40e-22928b105838', '1401645', '$2b$12$Gh8G2SvDougJHbFOTYJCKOAvkCiMkmhCQZGgg86mpcMhQYpdS4BHi', '2023-10-26 00:15:58', '2023-10-26 00:15:58', 'R&M Logistics Transportation Llc', 'Fcoramirezdo@Gmail.Com', '(786) 956-0437', 0, 20, 'Free Plan', 0),
('38148d63-873a-45d0-b890-e13205b42a54', '1215879', '$2b$12$220bUK8rK3wVYb0DQJRB4eRafIJzM5GgrKdGRcabizCVokF637L0a', '2023-10-26 00:21:37', '2023-10-26 00:21:37', 'Uts Freight Inc', 'Utsfreightinc@Gmail.Com', '(916) 513-9960 ', 0, 20, 'Free Plan', 0),
('3d45e8a9-c4f5-493a-b20d-80971b8428f6', '456331', '$2b$12$H.1oTH.lPkPMi8CYhoR0JeelCtAIyW4lnoBL05eHYstwjWgk63kb2', '2023-10-25 23:59:01', '2023-10-25 23:59:01', 'R K Trucking Inc', 'Rktruckinginc@Hotmail.Com', '(815) 654-2380', 0, 20, 'Free Plan', 0),
('3fe53d27-1c7c-49ed-82d3-fecb1a42838e', '1231534', '$2b$12$kPTGGfpvQupg72TkL5vdGeEckNFqpP0XAc0m2oirT2zJ3LB4TcVsG', '2023-10-26 00:30:52', '2023-10-26 00:30:52', 'Tri-State Trucking Llc', 'Caseylschaaf@Gmail.Com', '	(402) 340-2973', 0, 20, 'Free Plan', 0),
('41b9f813-b036-4bd7-a8f3-53d6786e0ab7', '769046', '$2b$12$LtAO1nuNveWxgR92hCm/mOmOd8TERd38dAoq0oAa.VutMFh5mMkO2', '2023-10-26 00:12:25', '2023-10-26 00:12:25', 'Cj Trans Inc', 'Dispatch@Cjtransinc.Com', '(239) 800-2811', 0, 20, 'Free Plan', 0),
('474574e0-e13e-4f22-b3ef-56835a5e3422', '23959', '$2b$12$wgkj.mkQiuKLT/jpMrr7w.I8A9Jw06wGJn0b1VFrg7sODwhL6tD3y', '2023-10-26 00:25:14', '2023-10-26 00:25:14', 'Zii Rojas Transport Llc', 'Ziirojastransport@Gmail.Com', '(956) 774-1013', 0, 20, 'Free Plan', 0),
('4b56442f-7c39-48b2-96a2-86f6c514564e', '880400', '$2b$12$TiKm2wUZF7omNtkQVRnqhufocKxzZi1qYJjebn9YHXCtJefSA7bmu', '2023-10-25 23:57:31', '2023-10-25 23:57:31', 'Oida Logistics Llc', 'Oidalog@Gmail.Com', '(248) 914-1442', 0, 20, 'Free Plan', 0),
('4d83ea92-2e93-4492-9f1f-6b4fb33a089a', '707140', '$2b$12$VPwwU22EpDCAxGjsCLZJqOQXK7FpvIDX.6iw1lfd3SFBSbVpo2wCu', '2023-10-25 23:56:27', '2023-10-25 23:56:27', 'Nawal Express Llc', 'Nawalexpress@Gmail.Com', '(614) 254-2371 ', 0, 20, 'Free Plan', 0),
('4f00eeba-47c2-4a1b-933e-e0df0b07e136', '488574', '$2b$12$8XKPgRrhSZ4ScQTP.ac5tuduX/n030.5TVd6yYqE8SBlLQPGRdRiC', '2023-10-26 00:04:00', '2023-10-26 00:04:00', 'Ull Trucking Llc', 'Loadull@Yahoo.Com', '(253) 414-3371', 0, 20, 'Free Plan', 0),
('57394064-132b-4f7b-9502-ae312df30a14', '799493', '$2b$12$eVnluW4nUK30tqMBs8a81uCFxdQg5ZDbJGSI6Ww7qWUGJ8BBMCiY.', '2023-10-26 00:50:11', '2023-10-26 00:50:11', 'Vlk Transport Llc', 'Records@Vlktransport.Com', '	(425) 949-4884', 0, 20, 'Free Plan', 0),
('5c15e007-b5db-41b8-9ec5-f2a87543023e', '1159420', '$2b$12$Qj.3rvfB599dOmmVorV5VOWHrpd07zOP.wQWm6vPWnSkokECnStk6', '2023-10-25 23:49:07', '2023-10-25 23:49:07', 'LOADCENTRIC INC ', 'Loadcentric@Gmail.Com', '(346) 291-5064', 0, 20, 'Free Plan', 0),
('5d89441a-e021-4b0d-be3f-48bafa66750e', '785959', '$2b$12$Snt.QIlYR2VuQR81fabEx.AGlGIa5C6d3Jz9X2LO31s8BtmyIRncS', '2023-10-26 00:10:42', '2023-10-26 00:10:42', 'All Freight System Llc', 'Allfreightsystemllc@Gmail.Com', '(206) 423-6236', 0, 20, 'Free Plan', 0),
('633a09af-c446-46ea-a0ab-bfda694b393b', '733790', '$2b$12$o/5.7i2ZQv/3vECIBuz/f.J2G3uO2L.T81wUjeO7Zyv70rzSJA0Rq', '2023-10-26 00:35:21', '2023-10-26 00:35:21', 'Pa Logistics Inc', 'Pav@Palogistics.Net', '	(520) 377-2744', 0, 20, 'Free Plan', 0),
('64d7fb89-2ccf-4af6-ab23-7a1bd5e6eabf', '1264171', '$2b$12$oGtUNiaD1GZlOhgN2BTiQOxwbcTOJu5oF8aeJt3Zj9PP6KDtKX/iq', '2023-10-26 00:34:28', '2023-10-26 00:34:28', 'M&R Trans Inc', 'Raitrans47@Gmail.Com', '(559) 232-5878', 0, 20, 'Free Plan', 0),
('66ab90d6-f0a0-47a8-a275-449e771b53a6', '834747', '$2b$12$f5J4uoeU/uvplDgGJakv3ed9LZFPSz4r98wpMp8JSyYbE9Ig9SUD2', '2023-10-26 00:29:32', '2023-10-26 00:29:32', 'Rome Express Logistics', 'Romeexpresslogistics@Gmail.Com', '(602) 481-3324', 0, 20, 'Free Plan', 0),
('68a521ca-8472-435d-bb48-b175ab9ce245', NULL, '$2b$12$0RMyva0J.gcVSkaEMB.ql.Nvuz4h6h3q468OD9clOOMZBYcS0SPDq', '2023-05-24 18:11:43', '2023-05-24 18:11:43', NULL, 'admin@truckerfox.com', NULL, 1, 20, 'Free Plan', 0),
('6ed84e53-1b06-49ae-a125-6a3769839379', '1012063', '$2b$12$efayK0ltRtLZqSB3nQE4M.WMJOEOLDafXJyF8b7vjZ9R7ebvLaWQ6', '2023-08-19 17:31:23', '2023-11-04 22:19:46', 'EO Express LLC', 'eo_express@yahoo.com', '(806) 239-3124  ', 0, 20, 'Free Plan', 20),
('70eea397-527c-46ef-b09b-ff68f5b6975a', '270975', '$2b$12$tOamqkbypEZDr9Dxv66N2uipMUArCcqXfEHrH9XZ7xXBA5HLMQ/T6', '2023-10-26 00:25:07', '2023-10-26 00:25:07', 'Whip-Co Trucking Llc', 'Whipco.Trucking@Yahoo.Com', '(308) 882-3911', 0, 20, 'Free Plan', 0),
('758b0fe6-b7e1-4b66-a2d3-89c240052353', '502546', '$2b$12$.YxftQmyywkoExd4.xPTEO4lkNBMSv7T2En5CUH3cHVOMP1LUUTAq', '2023-10-26 00:42:37', '2023-10-26 00:42:37', 'March Trucking Llc', 'Amarch692@Gmail.Com', '(620) 820-1661', 0, 20, 'Free Plan', 0),
('7a4cffd5-c18a-4887-9040-f9e3733b6c58', '948438', '$2b$12$.RMliWJ/YvkXVU08V0YACu5YFW6E84ksDEIdkcEYIsa2vtlcdycDi', '2023-10-26 00:29:56', '2023-10-26 00:29:56', 'Express Way Llc', 'Contact@Expresswayaz.Com', '(623) 850-4288', 0, 20, 'Free Plan', 0),
('7d4e59e9-b6b8-4cfd-b2a4-e5af8eaba2e0', '1153183', '$2b$12$4gwFhdXDXcC6TKbI6GlNXOB3RMh.xrlwu6U77sHS6fLwqCxkHnHXW', '2023-10-25 23:59:33', '2023-10-25 23:59:33', 'Romano Trucking Texas Llc', 'Romanotrucking01@Gmail.Com', '(682) 552-3313', 0, 20, 'Free Plan', 0),
('80245935-b171-4c9b-a3cc-2accc84fdfcb', '788425', '$2b$12$t5iOWCErjrdyj4nnm6Jhwu6hUaIaIgzlB9LSvryulibje42MxzrDC', '2023-10-07 14:39:24', '2023-10-07 14:50:06', 'SUPERTRANSPORT', 'marc@mysupertransport.com', '8166561279', 0, 20, 'Free Plan', 2),
('83875104-39e0-49c5-a610-b2f5c4561d28', '530639', '$2b$12$5E4kgjPHwDXyxPqSGM.0..IcpX79oi4EYRPV86nyxvGLor3mPbj36', '2023-10-26 00:43:51', '2023-10-26 00:43:51', 'Rolort Transportation Inc', 'Rolorttrans@Gmail.Com', '	(863) 307-0232', 0, 20, 'Free Plan', 0),
('83ea0f6b-f554-44b2-be99-d83c5f0fc530', '1118084', '$2b$12$CcN386upJKOnfwtlp3kQkOrigHBWj4WqGJ40Z8Hsg.JezvGibH5X.', '2023-10-26 00:14:21', '2023-10-26 00:14:21', 'Masih Transportation Inc', 'Dispatch@Masihtransport.Com', '(864) 906-7133', 0, 20, 'Free Plan', 0),
('86124071-d499-4e7d-9c8b-74aef5add5df', '900754', '$2b$12$0GBltcAJ4WrgYCG1MOj5eOlFdnEOJh2syoYxSiF716wKc3l06zpmq', '2023-10-26 01:08:56', '2023-10-26 01:08:56', 'Crazy Horse Transport Llc', 'Chtvegas@Gmail.Com', '(702) 840-1099', 0, 20, 'Free Plan', 0),
('889ce1f8-7a2b-4530-ac72-60bc48b5d4c5', '669054', '$2b$12$mJWMTrIJeMeFlQyoyLiJROyf7pcTFjzUzFAjUljobgPF/22rcpV6u', '2023-10-26 00:59:15', '2023-10-26 00:59:15', 'Ruma Transport Llc', 'Helruma@Yahoo.Com', '(636) 938-4544', 0, 20, 'Free Plan', 0),
('9164317f-7ea7-4b70-b613-e815e2eab379', '364025', '$2b$12$F4C1J2MgcT7hdwSttJZTYebHEhkAI/wE5ezR5Gp5PxWHLk15ty5qC', '2023-10-26 00:25:16', '2023-10-26 00:25:16', 'F T L Global Carriers Llc', 'Robert@Ftlglobal.Com', '(765) 552-1914', 0, 20, 'Free Plan', 0),
('91f362eb-65d7-4dd1-997c-59f8400c614f', '814410', '$2b$12$ulyQF6rnYWqp7TBs.bwWDuzS87FldpbTiCXg56mE.ia00YC6kX3Je', '2023-10-26 01:00:03', '2023-10-26 01:00:03', 'Saran Transport Llc', 'Sarantrucking@Gmail.Com', '(732) 763-7906', 0, 20, 'Free Plan', 0),
('94eb029e-f0a9-4756-a21c-6bf3a11a370f', '1034254', '$2b$12$r3dksbEa9sXpwe3QagDJg.n/5DRcH1e8HHw87XyJ4zP1Ww.zLNvhW', '2023-10-26 00:11:06', '2023-10-26 00:11:06', 'Baani Logistics Llc', 'Dispatch@Baanilogistics.Com', '(469) 799-7929', 0, 20, 'Free Plan', 0),
('96f4269b-e2a0-4c50-a828-a15a546d375c', '688023', '$2b$12$46oN6XnmonVWZuXTp4fHKe7BbmT7citYuVyM4m81HUiybj5B26FCO', '2023-10-26 00:31:17', '2023-10-26 00:31:17', 'United Hot Shot Llc', 'Larry@Unitedhotshot.Com', '(225) 421-1266', 0, 20, 'Free Plan', 0),
('99e05691-f806-4951-8cd6-d7ac2cccb046', '834170', '$2b$12$eIoOAaY0i.ZRoio7xc2zFOJxt2igvYeSPUsWlGAU/wohj7sjvp8z.', '2023-10-26 00:20:13', '2023-10-26 00:20:13', 'Smg Trucking Llc', 'Smgtruck@Gmail.Com', '(214) 235-0454', 0, 20, 'Free Plan', 0),
('9be67753-9309-4125-b6fc-1be874d978a2', '313234', '$2b$12$ihmsN.QQZxDCn9OXuYpvdOHVYftWO6SCI5Cv8mOvRzxtnTxEMDE8e', '2023-10-26 01:09:15', '2023-10-26 01:09:15', 'Normbelle Transport Limited', 'Normbelle1@Aol.Com', '(301) 808-8038', 0, 20, 'Free Plan', 0),
('9e80a611-36df-482a-97b4-8e3365870e6f', '1166651', '$2b$12$5CV1HzMA1NlM3.OOHxbs4Oy/19JN7ujVXMrledSg8pNSvmK8SzFBm', '2023-10-26 00:12:52', '2023-10-26 00:12:52', 'Crossland Logistics Group Inc', 'Accounting@Crosslandlogs.Com', '(917) 373-8651', 0, 20, 'Free Plan', 0),
('9f134561-4130-4eec-be47-8ca225b86cef', '884782', '$2b$12$MC72XsjKsSIW42cg0JcuBuRPqD/GblvkllhJY1yxmwGbQ4rIsig32', '2023-10-26 00:00:42', '2023-10-26 00:00:42', 'Rr Transportation Inc', 'Rogovetsl@Gmail.Com', '(847) 867-9930', 0, 20, 'Free Plan', 0),
('a47d24ec-914e-47fd-b769-33cf154f9703', '528326', '$2b$12$M7ytV.OtKMpjfYs27lF5duTRGOA4cItNiBnMORR2jqWxpLNSH3T5u', '2023-10-26 01:01:53', '2023-10-26 01:01:53', 'S & R Trans Llc', 'Lejladuric.Dt@Gmail.Com', '(616) 260-4559', 0, 20, 'Free Plan', 0),
('a8ac5660-e9a8-417b-b5f1-989bbb91987d', '1190840', '$2b$12$sQaDwk7KH/6cGW65OPO1V.HNdrmlwsU.anjMyBvkmlqXUBr72CJHm', '2023-10-26 00:25:10', '2023-10-26 00:25:10', 'Yenom Regional Transportation Llc', 'Yenomregional@Gmail.Com', '(602) 488-8219', 0, 20, 'Free Plan', 0),
('a98f0d4e-64d8-4ed1-9db9-1d7516460037', '946151', '$2b$12$AAnmVAAt6y72KymwpPi3cecUh2BNrAp2y.zNUuuK2myLoL2wMkyZu', '2023-10-26 00:02:00', '2023-10-26 00:02:00', 'Sali Transport Llc', 'Salitransport35@Gmail.Com', '(512) 704-3457', 0, 20, 'Free Plan', 0),
('a9ad6839-7ceb-403f-a906-8d71b7c83cbb', '515012', '$2b$12$OkCLJmo8sguGuItViKPWJuDRImjaKkvbbwSWLLf3qUIvPCBx2UObG', '2023-10-26 01:12:08', '2023-10-26 01:12:08', 'Shawnee Trucking Co Inc', 'Rsamaroo@Shawneetrucking.Com', '(717) 684-6100', 0, 20, 'Free Plan', 0),
('aba47bcb-27c5-4548-9e81-ae2362b5c02b', '1165960', '$2b$12$3SBDvCKcZ3lMnayomEbXWuSLj8hKOSYMRdVA1B5GoLU7z4X6oOyv2', '2023-10-26 00:21:05', '2023-10-26 00:21:05', 'Tmt Logistics Llp', 'Operations.Tmtlogistics@Gmail.Com', '(470) 652-8277', 0, 20, 'Free Plan', 0),
('ae86cc0e-4fb5-48cc-b3a5-9d4c19a8d749', '444039', '$2b$12$7kfUYCNFJCEWr/Rah76OB.znBJl9bYd81In7KXdGmZhFqZWDTp2J2', '2023-10-26 00:13:23', '2023-10-26 00:13:23', 'Dick Miller Llc', 'Dickmiller2011@Yahoo.Com', '(563) 594-7973', 0, 20, 'Free Plan', 0),
('b0a5ca80-01e1-4c68-aed1-6b1f940930cf', '959549', '$2b$12$wdifeUDls9yjPDdhP5lnNOs.1vTn.T0.H3gJou8ut5kBnMlT40qc6', '2023-10-26 00:15:13', '2023-10-26 00:15:13', 'Ontime Trucking Llc', 'Ontimetruckingllc1@Gmail.Com', '(701) 388-3354', 0, 20, 'Free Plan', 0),
('b10fdd4b-7624-414c-bb0c-6063b82c13af', '2013829', '$2b$12$EAXIwXFwG0Ns8YdZry0Px.E6lX7/C4u/91Gg1CXKQhoejdSvJsV42', '2023-10-26 00:33:47', '2023-10-26 00:33:47', 'Kansota Transport Inc', 'Shayson@Kansota.Com', '(620) 792-9100', 0, 20, 'Free Plan', 0),
('b18badc2-5c1f-4ada-a416-885e75844d24', '541114', '$2b$12$0QZWaoEGnbELeehtbiGkMOsEOWgMHt0hLkyrHZ7AlwToYX0gEvt/a', '2023-10-26 00:32:28', '2023-10-26 00:32:28', 'K & G Trucking', 'Kevin@2Mtractor.Com', '(620) 272-7905', 0, 20, 'Free Plan', 0),
('b430a0fb-b054-4ca4-8890-2a96f9088df7', '771820', '$2b$12$Ujplad07SWnExGGuztkAwO7RYijHh6Z2zQodAu6ErgqkEGew0f.nW', '2023-10-26 01:18:36', '2023-10-26 01:18:36', 'Leahy Transportation Llc', 'Mike@Leahytrans.Com', '(903) 650-8555', 0, 20, 'Free Plan', 0),
('b4431a6d-7fb2-4070-b864-2728f45fb960', '794068', '$2b$12$T.k4foYvo2kxL5YHmzwHa.634LCLfwDKts/bVs4C/ic6dphBrw6US', '2023-10-26 00:04:45', '2023-10-26 00:04:45', 'Vm2 Trucking Llc', 'Vm2Truckingllc@Hotmail.Com', '(815) 498-3345', 0, 20, 'Free Plan', 0),
('bc962d86-0961-4012-ba68-5d7a544e630e', '884551', '$2b$12$6NAM2HYMR6ZE.XNEnlYIYOQYD3LNW8QXoxrj/KrTcYNsDRCqR.EGW', '2023-10-26 01:10:50', '2023-10-26 01:10:50', 'Jr Transportation Inc', 'Safety@Jrtransinc.Com', '(509) 388-2510', 0, 20, 'Free Plan', 0),
('be724424-12e7-4048-acd8-df9f405b61cd', '275023', '$2b$12$XfLoMl3RKbgkxw23G6Qzdetzh5iAxdPqsdiPhJZ0hGxxwWDPhA/fa', '2023-10-26 00:09:38', '2023-10-26 00:09:38', 'A & B Trucking Co', 'Btopor@Anbtrucking.Com', '(708) 670-4288', 0, 20, 'Free Plan', 0),
('bfe0f9f7-f7c8-4179-a194-b6080a4a1801', '1016879', '$2b$12$PR.CPza/7Y6QMzStyFY.rOjnH/3gflnumYhBGiZLqLA42oGjw/z6e', '2023-10-26 00:10:02', '2023-10-26 00:10:02', 'Ah Transportation', 'Ah.Transportationcorp@Gmail.Com', '(414) 322-0619', 0, 20, 'Free Plan', 0),
('c25283b8-cb7d-46f1-a0c5-db4c27abef8c', '818027', '$2b$12$ucHxz8fRDnXitGZIwKowYe8TsdTRq2RorHMA9/VIBm3TdE2kJGfPq', '2023-10-26 00:39:47', '2023-10-26 00:39:47', 'W T Express Inc', 'Whitetigerexpress@Gmail.Com', '(706) 940-0432', 0, 20, 'Free Plan', 0),
('c2982463-1157-49d3-bd85-ce2290ce1be7', '11223344', '$2b$12$ydAScIEXaKlYW8nz.VRy8OgJjg.mbPRrbNsIVRiVpAyGGeP0fDQnm', '2023-05-26 13:46:26', '2023-10-11 12:07:16', 'sarmad', 'sarmadsami.ss@gmail.com', '00923338170605', 0, 100, 'Bronze Plan', 0),
('c408d371-4865-49e0-a3d9-a1091d443dab', '814167', '$2b$12$dkABGVJ5NqdOdS/LOS8yaucX1d2sRlQHSnELWpTh4JEy3.mE/MKIK', '2023-10-26 00:20:43', '2023-10-26 00:20:43', 'Tate Transport Llc', 'Tatetransportoffice@Gmail.Com', '(682) 717-7747', 0, 20, 'Free Plan', 0),
('c862de02-8863-41f8-9e11-2c6f26a8b03e', '812625', '$2b$12$jX/azGLis6qjLr4kV23Jpe5oDHuhXC/vOsRxDBYaqm7qUUjmnI6Fq', '2023-10-26 00:55:18', '2023-10-26 00:55:18', 'Four Winds Trucking Llc', 'Fourwindstruckingllc@Gmail.Com', '	(701) 751-1237', 0, 20, 'Free Plan', 0),
('ca578e57-bc34-422c-8f9c-f80c03296104', '804165', '$2b$12$ppX3Ea1PBCKJuCsyBz/B9edjcaW5H/ULfXC56MLwVW3xzNNemq6tK', '2023-10-26 00:54:03', '2023-10-26 00:54:03', 'Wim Transportation Llc', 'Wimtransllc@Gmail.Com', '(708) 906-9952', 0, 20, 'Free Plan', 0),
('d0bf2045-f547-446a-9965-80651fe5c795', '890641', '$2b$12$r6SzseaBYNM04zTAOWTkGOJb10GREEcXrv45z4aGYhaf7E1Gbwzbu', '2023-10-26 01:08:10', '2023-10-26 01:08:10', 'Unity Transport Service Llc', 'Javaris@Unitytransportservice.Com', '(904) 472-8756', 0, 20, 'Free Plan', 0),
('d1856897-ff4d-46e1-83f9-105aeae1c83a', '182838', '$2b$12$oFaH8M3.u6i/UIgDAjhqzOqIuguCm0ZxRQFRkYMXGJYRtKRGxC8uK', '2023-10-26 00:52:57', '2023-10-26 00:52:57', 'Sewaro Trucking Llc', 'Sewarotrucking@Gmail.Com', '(701) 709-0871', 0, 20, 'Free Plan', 0),
('d38f52c6-b88e-4d16-a3f9-ad91c675328f', '904253', '$2b$12$W9/rWWAODCoHrAiPSk0/B..gMGN6aeDLNIVACgl0jfVHgJoxJqXeu', '2023-10-26 00:54:58', '2023-10-26 00:54:58', 'Zebra Trucking Llc', 'Alexneg@Hotmail.Com', '(214) 727-2938', 0, 20, 'Free Plan', 0),
('d3d49eeb-2d46-48f0-b5bb-b8a0b79867b7', '871621', '$2b$12$PiT6AA4FDUDRH0PSQ3/CL.VWbmoCEpmN..hONwltVP0.q1cAF1T4y', '2023-10-26 01:01:31', '2023-10-26 01:01:31', 'Silver City Express Llc', 'Silvercityexpress@Outlook.Com', '	(314) 677-8861', 0, 20, 'Free Plan', 0),
('d54a47af-3f0f-4ea8-b86f-290e9dbf4340', '859530', '$2b$12$jv8OvMTVFm96ounA4tIw1eaKBVu..7OdCE7Raodb8hRf9xgWpOB1C', '2023-10-26 01:08:35', '2023-10-26 01:08:35', 'Nfl Logistics Llc', 'Nfllogistics2009@Gmail.Com', '(214) 662-2886', 0, 20, 'Free Plan', 0),
('d54a7f45-ef0f-4f50-b85b-0a75c97422c9', '891814', '$2b$12$e1X2FVOzYzPjrH5GnVRZr.Itx4UmAa7HAr19FzMvbkTxotfWzJlqi', '2023-10-26 00:52:08', '2023-10-26 00:52:08', 'Sarens Usa Inc', 'Lonnie.Bailey@Sarens.Com', '(832) 536-3669', 0, 20, 'Free Plan', 0),
('d55779c5-72ad-4960-8809-ce5605dc54c3', '793657', '$2b$12$mxUR6k7t0dmza70I2vHyfOWdreJ1dMkbsooCr7R3gz9PxmFq11zSa', '2023-10-26 01:10:21', '2023-10-26 01:10:21', 'Marlizdia Transport Inc', 'Marlizdiatransportinc@Gmail.Com', '(773) 299-0287', 0, 20, 'Free Plan', 0),
('d78775f1-64ca-46b3-ae38-f4d4661a25c8', '1012931', '$2b$12$NCbrWqhx8tod8shwkXwCC.IEe6mdUemSl7Kld/7u7vryZhohVOhP.', '2023-10-26 00:59:43', '2023-10-26 00:59:43', 'Ybm Trucking Llc', 'Ybmtruckingllc@Gmail.Com', '(717) 379-4985', 0, 20, 'Free Plan', 0),
('d7d047f6-abf1-465a-a91d-56cc73a7b372', '61279', '$2b$12$ULXpofi05HztRbzFSBPoRuWfXzRuBXuRLHyVuWgiGzyMV/xvBVnGW', '2023-10-26 01:00:27', '2023-10-26 01:00:27', 'Et Logistics&Transportation Llc', 'Dispatch@Etlogistics.Co', '(319) 800-6870', 0, 20, 'Free Plan', 0),
('e3c9281e-112f-47ce-a249-79afba7a2190', '675525', '$2b$12$z228dkRFferSPD1ITdTAxuNTRefWuHDJi1lZ8M8rObV1OB8fB8RBS', '2023-10-26 00:35:57', '2023-10-26 00:35:57', 'R O C Express Inc', 'Rocexpress@Yahoo.Com', '(810) 772-6991', 0, 20, 'Free Plan', 0),
('e8ec5477-6722-426d-8ccb-181f2665b146', '901883', '$2b$12$S2Y5V8SYre5g7kQVaOhkPewzhJj4dFQuHXa4eLH4NFmif5upYbX3m', '2023-10-26 00:42:17', '2023-10-26 00:42:17', 'Langham Trucking Llc', 'Michaelflora@Elangham.Com', '	(317) 954-8831', 0, 20, 'Free Plan', 0),
('e8f6d806-74b2-4673-9999-1af4a58bf529', '985944', '$2b$12$Cie.CCVIYfyVZddcRBn/ku5ZXU7susOMrOg4U.ENCq/gRVuTBH12W', '2023-10-26 00:14:41', '2023-10-26 00:14:41', 'Moriah Carriers Llc', 'Moriahcarriers@Gmail.Com', '(956) 994-9517', 0, 20, 'Free Plan', 0),
('ed1adff5-93d0-4c1d-85ef-91bae52022b3', '1058172', '$2b$12$e2fVZ/MqH5DxqH2M.GuZDO7sJwIb/GDXbkPNO4QPFSYZ2/8WgU2yC', '2023-10-26 00:41:00', '2023-10-26 00:41:00', 'Anderes Trucking Llc', 'Skanderes44@Gmail.Com', '(785) 819-3046', 0, 20, 'Free Plan', 0),
('ef1e7ce3-57a5-40ab-9ef1-5fbddca0d7be', '7445', '$2b$12$u5FMyAk9wBNtageAUgcLkOUAy61NVHyNV0McPJPOss/yq0OHhiTfi', '2023-10-26 01:02:21', '2023-10-26 01:02:21', 'Yunik Freight Inc', 'Yunikfreight@Gmail.Com', '(224) 400-6284', 0, 20, 'Free Plan', 0),
('f16bc8f8-e389-4fe7-83de-5f82899f5b39', '781588', '$2b$12$psXF6a//FTeC54FM.4/3GOTQN..j.j8ARXWRiIiPIM5qDYz4/0doG', '2023-10-26 01:11:27', '2023-10-26 01:11:27', 'Heartland Transport Ltd', 'Parm@Heartlandtransport.Ca', '(604) 888-3364', 0, 20, 'Free Plan', 0),
('f21bf8c6-d107-485b-b2af-b9a2427f101d', '1153971', '$2b$12$cDOizDD3sJ7v1jxQA5vASuBQDVwDHLZUHp0Gfklwku/CvKrO7CdGy', '2023-10-26 00:51:01', '2023-10-26 00:51:01', 'Fortune Trans Llc', 'Fortunetrans0123@Gmail.Com', '(206) 849-0818', 0, 20, 'Free Plan', 0),
('f295d298-b914-4150-a6b5-e4388da1d5d7', '1813587', '$2b$12$VuLRxb3cPwCk5BpILJvMYO7mIh6.nB3HWmrux6GsdclBuwRyZLGiK', '2023-10-26 00:43:03', '2023-10-26 00:43:03', 'Odje Trucking Llc', 'Odjetruck@Gmail.Com', '	(405) 474-8165', 0, 20, 'Free Plan', 0),
('f2b3d350-c57b-49bd-a7c3-ef344413d699', '1048176', '$2b$12$bGLv7huvsfyBcpEfOoEGQ.pjwWKKPmArlpcUyMRnOv01QpAeaHhUG', '2023-10-26 00:51:38', '2023-10-26 00:51:38', 'Trination Transport Inc', 'Loads@Trinationtransport.Ca', '(902) 536-3776', 0, 20, 'Free Plan', 0),
('f39390d5-7e37-4ffb-8d63-485d6d620f71', '128442', '$2b$12$mvwI/NeRaD05iKnsa.QX5udYTU0XcDoWsBPN5jlu0P915BjqKiJYa', '2023-10-26 00:02:28', '2023-10-26 00:02:28', 'Stellar Freight Inc', 'Stellarfreightinc@Gmail.Com', '(773) 310-2127', 0, 20, 'Free Plan', 0),
('f594cb39-7052-484a-8dda-bfa9283a0d86', '776234', '$2b$12$IUMMnI3s0hoKOCrK6E6Sh.jxCMxpRQBa4vN8nkl/L36cBy5tpz1aq', '2023-10-26 00:39:27', '2023-10-26 00:39:27', 'Mehring Transport Llc', 'Jaredmehring@Yahoo.Com', '(414) 418-9491', 0, 20, 'Free Plan', 0),
('f7a8ffa9-4a95-4acc-8fd1-f43d87cadcf5', '716402', '$2b$12$OX8Xty61OGZULAE5j7n47.p1r1mx/ePyVjl1sFz8w3H.PbilUjmQ6', '2023-10-26 00:52:31', '2023-10-26 00:52:31', 'Certain Trucking Ltd', 'Nikki@Certaintrucking.Com', '(905) 693-1528', 0, 20, 'Free Plan', 0),
('fbb8fbe1-af8b-4356-86d0-71afb4eafaf9', '1229224', '$2b$12$J8CdI.KNjj11Z6aGXt335ub.oOkVgHivV5KfkD0t8M1m3sfBhTNMO', '2023-10-25 23:57:55', '2023-10-25 23:57:55', 'Optimist Trucking Llc', 'Dispatch@Optimisttrucking.Com', '(469) 434-9004', 0, 20, 'Free Plan', 0),
('fc25a185-793e-41fc-8899-47e3959d649a', '1005569', '$2b$12$nCq2.75YuPTZeV8RWrzCP.dZZvvgtR.CU1VBmrF468FdTOQgldYXO', '2023-10-26 00:50:39', '2023-10-26 00:50:39', 'Flex Transport Llc', 'Flextransport2@Gmail.Com', '(612) 275-4853', 0, 20, 'Free Plan', 0),
('fd702692-73c1-4ec8-9f4a-10f4ca147045', '1100270', '$2b$12$8fLbLqHqMWXvBj8GlRw4A.tFLW7tMWAHkh2BpQ8I3lrtWFwRytnKO', '2023-10-26 00:05:08', '2023-10-26 00:05:08', 'Warrior Trucking Llc', 'Warriortruckingdelphi@Gmail.Com', '(260) 499-0248', 0, 20, 'Free Plan', 0),
('fe2861c8-d7b1-4dcf-aaed-733c1271bff1', '894422', '$2b$12$KL89tKMCjkkup4QBuKEdV.EcJYAeDhTHXWR7IRGKxacFORotlEmli', '2023-10-26 01:03:27', '2023-10-26 01:03:27', 'Moorhead Truckin Llc', 'Moorheadtruckin@Yahoo.Com', '	(501) 523-5070', 0, 20, 'Free Plan', 0),
('ffb75f29-f88d-4b6d-90ac-d62458dc8848', '786786', '$2b$12$XROaSVcWzGGEnsgzEBeH/.xoSs2kfN/dpFnreQeUm/R8VIXW8g1V6', '2023-10-04 10:55:21', '2023-10-04 10:55:21', 'Sarmad', 'sarmad.samiullah@appcrates.com', '03338170605', 0, 20, 'Free Plan', 0);

-- --------------------------------------------------------

--
-- Table structure for table `couriers`
--

CREATE TABLE `couriers` (
  `id` char(36) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `status` int(11) NOT NULL,
  `courierHandlerId` char(36) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `isCompleted` tinyint(1) NOT NULL DEFAULT '0',
  `statusUpdatedAt` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `couriers`
--

INSERT INTO `couriers` (`id`, `status`, `courierHandlerId`, `isCompleted`, `statusUpdatedAt`, `createdAt`, `updatedAt`) VALUES
('00d89df3-56b5-484c-a7ec-3567a3079a14', 3, '185c422e-a4ce-445c-9b8c-00aa5b229af1', 0, NULL, '2023-06-15 21:02:45', '2023-06-15 21:02:45'),
('01be2df0-a911-4a90-9b7c-2aa6119c1d46', 10, '17a07a82-e78d-4ef4-b993-c9fa349ead5a', 0, NULL, '2023-06-15 11:53:20', '2023-06-15 11:53:20'),
('02319ab2-3c81-44e3-86cf-1ce92acd90f1', 11, 'f01c58ec-781f-40de-bd1b-eecbb777f804', 0, NULL, '2023-09-04 09:42:41', '2023-09-04 09:42:41'),
('025e2637-8fc9-4e93-854f-0c65633e6bb4', 11, '5c8faef0-69a1-40b3-ab56-2567c8c6e0e8', 0, NULL, '2023-10-02 06:01:02', '2023-10-02 06:01:02'),
('0369e1c9-80f4-467f-93ed-b3f3cee788d2', 7, '0408e32d-a139-4805-8cb4-8906332d1dbd', 1, '2023-06-13 12:46:21', '2023-06-12 15:39:52', '2023-06-13 12:46:21'),
('038b2d2b-222f-4adc-af78-ac46d80e9e30', 7, '286b4de1-5c50-414f-a64b-9262ded782cd', 1, '2023-06-13 18:50:30', '2023-06-12 15:03:12', '2023-06-13 18:50:30'),
('04392a78-afa3-4f3a-bb80-8e9a32bb6ad9', 10, 'c6f384a3-3f73-425a-bef3-a3156f252438', 1, '2023-06-02 13:04:35', '2023-06-01 12:41:44', '2023-06-02 13:04:35'),
('04c90e63-a46d-4444-85d2-0014ca60e50d', 6, 'dc242008-4b90-4ace-9943-6514a755427f', 0, NULL, '2023-10-07 14:47:53', '2023-10-07 14:47:53'),
('0512afd7-2799-44fd-909b-65a5ae3f70d4', 2, '7f3d1751-71e1-4aaa-8bb5-487ab093b75b', 0, NULL, '2023-10-01 05:34:52', '2023-10-01 05:34:52'),
('066ffdcc-6d73-42de-860c-a8185271da8e', 6, '21a21f32-26f5-4985-8742-8f6f71950639', 0, NULL, '2023-09-30 19:12:03', '2023-09-30 19:12:03'),
('076c8b4d-3ad0-44c6-9fed-09c782c42af8', 4, '16679b4a-d98d-4bc6-8d30-e994ea4c26e4', 0, NULL, '2023-10-29 05:25:20', '2023-10-29 05:25:20'),
('07b6eb5f-70e9-463b-bb73-4d5ef36c04e7', 10, '864d6599-5e96-4a36-8e47-21c43b8f3366', 0, NULL, '2023-09-04 09:42:14', '2023-09-04 09:42:14'),
('083d5738-5bf8-4b21-8a17-5fd8fd106ed1', 4, '17a07a82-e78d-4ef4-b993-c9fa349ead5a', 0, NULL, '2023-06-15 11:53:20', '2023-06-15 11:53:20'),
('086b54da-c599-454f-9987-95358c4ef1a9', 13, '21a21f32-26f5-4985-8742-8f6f71950639', 0, NULL, '2023-09-30 19:12:03', '2023-09-30 19:12:03'),
('0995b11b-4225-42c0-96f7-c41fd27aeb1f', 12, '286b4de1-5c50-414f-a64b-9262ded782cd', 1, '2023-06-15 12:15:09', '2023-06-12 15:03:12', '2023-06-15 12:15:09'),
('09af4822-f655-4ca7-89c6-6c1f673ee3f7', 9, '7d763280-4954-4c88-9148-f4444a9bd516', 0, NULL, '2023-10-10 18:00:29', '2023-10-10 18:00:29'),
('0a2959d9-9ebd-4447-990c-892b7a479ec9', 8, '67ddc55d-ce12-44b7-ac0a-04d5267f8ce5', 1, '2023-06-15 21:21:40', '2023-06-14 20:20:33', '2023-06-15 21:21:40'),
('0a7abe4d-2f88-40ea-9abc-b00c1b8b283c', 10, '197e84e2-65a3-442d-9d55-fa369dab1b0d', 0, NULL, '2023-09-04 09:52:01', '2023-09-04 09:52:01'),
('0b402a5f-bbcb-40cc-afb7-d4fd30fd909e', 6, 'f2646515-f3e3-4d6b-9945-34fad472057d', 0, NULL, '2023-10-07 14:50:06', '2023-10-07 14:50:06'),
('0c5250f0-7b99-4289-9a16-44fc88ca1235', 6, '041213e7-3310-4133-8671-66aefc8e8fdb', 0, NULL, '2023-08-31 18:56:17', '2023-08-31 18:56:17'),
('0d9526dd-773b-4285-b608-d8480c6d8307', 8, '380cfc93-a7b9-44c2-8257-035a89eab1be', 0, NULL, '2023-08-31 18:51:17', '2023-08-31 18:51:17'),
('0de0f6cb-3728-42be-b07e-6ef74de47399', 11, '5ae6ec90-851e-4896-9ea6-3587cb38bf53', 0, NULL, '2023-06-15 23:38:10', '2023-06-15 23:38:10'),
('0e5b7774-f7fd-49cd-a967-3a4c1b851c1e', 13, '7d763280-4954-4c88-9148-f4444a9bd516', 0, NULL, '2023-10-10 18:00:29', '2023-10-10 18:00:29'),
('0e6cc447-85f2-4f6b-bd5d-a5dd1e774e6d', 5, '286b4de1-5c50-414f-a64b-9262ded782cd', 1, '2023-06-13 18:50:30', '2023-06-12 15:03:12', '2023-06-13 18:50:30'),
('0e721b34-f11f-4455-91a8-955f75afc4f1', 1, 'cc8600e7-49b9-42f7-b2ca-80f8245b5c9e', 1, '2023-05-31 13:02:58', '2023-05-31 13:02:58', '2023-05-31 13:02:58'),
('0ea45465-f60d-46b9-af29-6df95607e8c5', 6, '7d763280-4954-4c88-9148-f4444a9bd516', 0, NULL, '2023-10-10 18:00:29', '2023-10-10 18:00:29'),
('1028638e-952a-4a07-ae8a-aa49d79a2b6c', 8, '504799fa-b789-4d71-a8dc-08c68276701d', 0, NULL, '2023-08-31 18:39:08', '2023-08-31 18:39:08'),
('10b8433a-d9ed-496e-b741-3f4121c1e972', 13, '041213e7-3310-4133-8671-66aefc8e8fdb', 0, NULL, '2023-08-31 18:56:17', '2023-08-31 18:56:17'),
('11208432-8333-453f-aec9-f19a69917e86', 12, '0ea71326-7b16-4cbd-b4a6-8580304da7ab', 0, NULL, '2023-06-14 21:52:35', '2023-06-14 21:52:35'),
('1163ccfc-e265-49c2-bf8b-1153dc078c07', 7, '17a07a82-e78d-4ef4-b993-c9fa349ead5a', 0, NULL, '2023-06-15 11:53:20', '2023-06-15 11:53:20'),
('14171c71-0865-443f-ab83-e6cebe47a36b', 12, 'cc8600e7-49b9-42f7-b2ca-80f8245b5c9e', 1, '2023-06-01 19:25:10', '2023-05-31 13:02:58', '2023-06-01 19:25:10'),
('14df5870-328f-4af8-9f55-9dab60db6aa3', 3, '62da7c40-54c1-4d8b-8f35-48bb3a7ca16c', 0, NULL, '2023-08-31 18:26:58', '2023-08-31 18:26:58'),
('1509935e-44bc-49eb-9579-c7bdd833947f', 12, '62da7c40-54c1-4d8b-8f35-48bb3a7ca16c', 0, NULL, '2023-08-31 18:26:58', '2023-08-31 18:26:58'),
('15a8e246-0aba-40ef-998b-ecbf1ff207bd', 4, '504799fa-b789-4d71-a8dc-08c68276701d', 0, NULL, '2023-08-31 18:39:08', '2023-08-31 18:39:08'),
('15d0e964-0a29-4737-b20c-c92c233e994c', 12, 'f2646515-f3e3-4d6b-9945-34fad472057d', 0, NULL, '2023-10-07 14:50:06', '2023-10-07 14:50:06'),
('15e9239d-7f40-4966-bda3-4341e5eab44d', 3, 'f01c58ec-781f-40de-bd1b-eecbb777f804', 0, NULL, '2023-09-04 09:42:41', '2023-09-04 09:42:41'),
('15ed95ad-0c5e-46ea-9079-30544218f44b', 11, '67ddc55d-ce12-44b7-ac0a-04d5267f8ce5', 0, NULL, '2023-06-14 20:20:33', '2023-06-14 20:20:33'),
('16d2d7db-32a4-430b-80d8-d675d368f595', 3, '0ea71326-7b16-4cbd-b4a6-8580304da7ab', 0, NULL, '2023-06-14 21:52:35', '2023-06-14 21:52:35'),
('17b07feb-0100-42f8-b6c0-84f6bf834f3b', 9, 'c6f384a3-3f73-425a-bef3-a3156f252438', 1, '2023-06-02 13:04:29', '2023-06-01 12:41:44', '2023-06-02 13:04:29'),
('1a92049f-ae70-499a-ac1b-65c23a7e488d', 6, '89e40754-c1bc-41bf-b77d-25d89916c55f', 0, NULL, '2023-09-04 11:04:34', '2023-09-04 11:04:34'),
('1abc2ee4-c7ee-4568-9349-4d03eab6516c', 13, '852e3b0f-a028-4fc3-99f6-6c3341337b44', 0, NULL, '2023-06-09 10:37:20', '2023-06-09 10:37:20'),
('1b906089-e75b-405d-9008-03b7b681faea', 2, '17a07a82-e78d-4ef4-b993-c9fa349ead5a', 0, NULL, '2023-06-15 11:53:20', '2023-06-15 11:53:20'),
('1c860257-903f-44a2-b951-020da88d0999', 6, '504799fa-b789-4d71-a8dc-08c68276701d', 0, NULL, '2023-08-31 18:39:08', '2023-08-31 18:39:08'),
('1cb5122b-ae4b-4bb3-9896-09732957f5ed', 5, '7e1fb17e-e48e-4298-be91-abf5a69e39d1', 0, NULL, '2023-08-31 18:44:24', '2023-08-31 18:44:24'),
('1d7e944c-8eea-4614-9f1a-dc492f04606f', 1, '67ddc55d-ce12-44b7-ac0a-04d5267f8ce5', 1, '2023-06-14 20:20:33', '2023-06-14 20:20:33', '2023-06-14 20:20:33'),
('1d95c377-6264-4219-8609-fd8119fa6398', 5, '17a07a82-e78d-4ef4-b993-c9fa349ead5a', 0, NULL, '2023-06-15 11:53:20', '2023-06-15 11:53:20'),
('1ea4163b-7d65-44e6-abfc-1e52f1fbc7f8', 12, 'c6f384a3-3f73-425a-bef3-a3156f252438', 1, '2023-06-02 13:04:47', '2023-06-01 12:41:44', '2023-06-02 13:04:48'),
('1fa946fe-b0a2-4742-8e78-2959fd07a04b', 10, '11da7b8b-19c7-4d30-9c9f-fc005650bff2', 1, '2023-06-20 13:48:14', '2023-06-15 12:45:56', '2023-06-20 13:48:14'),
('1fb44694-7ea0-4d8c-bc3d-a6b3caa1e0bc', 3, '23bf157b-09ef-4c3c-bbfe-b45b7154cc51', 1, '2023-06-02 19:25:51', '2023-06-02 14:17:42', '2023-06-02 19:25:51'),
('202c3e1e-3a76-437c-bfcc-a0070abcdb39', 9, '852e3b0f-a028-4fc3-99f6-6c3341337b44', 0, NULL, '2023-06-09 10:37:20', '2023-06-09 10:37:20'),
('20caa387-88bf-4625-93e7-256c7b53667a', 12, '5ae6ec90-851e-4896-9ea6-3587cb38bf53', 0, NULL, '2023-06-15 23:38:10', '2023-06-15 23:38:10'),
('211d0d06-e843-40ef-8fd9-06c65aa6f416', 11, '380cfc93-a7b9-44c2-8257-035a89eab1be', 0, NULL, '2023-08-31 18:51:17', '2023-08-31 18:51:17'),
('21ba5e2e-1afd-41fc-ba1a-42ac1b12635b', 13, '35fcb1a9-89d7-455a-b80e-83d601e6218e', 0, NULL, '2023-06-15 23:30:10', '2023-06-15 23:30:10'),
('21cac01f-86c4-460d-98f6-475c730824d7', 11, '0ea71326-7b16-4cbd-b4a6-8580304da7ab', 0, NULL, '2023-06-14 21:52:35', '2023-06-14 21:52:35'),
('2258cee4-b134-4ed0-a321-8cedf53dfba9', 3, '2df9d10d-e450-4a5b-8a11-ddc8c6b87dcb', 0, NULL, '2023-06-03 19:34:06', '2023-06-03 19:34:06'),
('22e4374d-8902-47aa-91c5-c44e90e252ee', 13, '504799fa-b789-4d71-a8dc-08c68276701d', 0, NULL, '2023-08-31 18:39:08', '2023-08-31 18:39:08'),
('235b2666-bb0d-42d0-aff7-f4f0f4302cde', 12, '0408e32d-a139-4805-8cb4-8906332d1dbd', 1, '2023-06-13 12:46:24', '2023-06-12 15:39:52', '2023-06-13 12:46:24'),
('23d95d72-1195-4fcc-aa88-7209d4b5ce6d', 1, '35fcb1a9-89d7-455a-b80e-83d601e6218e', 1, '2023-06-15 23:30:10', '2023-06-15 23:30:10', '2023-06-15 23:30:10'),
('23db52e2-06a2-4110-9638-15dd7c49a1e1', 4, 'f01c58ec-781f-40de-bd1b-eecbb777f804', 0, NULL, '2023-09-04 09:42:41', '2023-09-04 09:42:41'),
('2408ea7f-3b2a-4ef5-ab7a-5ffa774f2495', 10, '62da7c40-54c1-4d8b-8f35-48bb3a7ca16c', 0, NULL, '2023-08-31 18:26:58', '2023-08-31 18:26:58'),
('255f4bf4-19a2-44c2-91ae-4cd882828cf8', 5, 'f01c58ec-781f-40de-bd1b-eecbb777f804', 0, NULL, '2023-09-04 09:42:41', '2023-09-04 09:42:41'),
('2583cc90-abfe-4d80-94eb-f8c0150e27f3', 5, '197e84e2-65a3-442d-9d55-fa369dab1b0d', 0, NULL, '2023-09-04 09:52:01', '2023-09-04 09:52:01'),
('26012875-d5fc-4da8-96d7-eb5b43cff99f', 4, 'cc8600e7-49b9-42f7-b2ca-80f8245b5c9e', 1, '2023-05-31 15:50:48', '2023-05-31 13:02:58', '2023-05-31 15:50:48'),
('271272fc-58d2-4a44-8a70-fb1d07af2878', 4, '8647e82e-0fc7-49fc-8305-e0cffd67ef86', 0, '2023-09-19 11:30:40', '2023-09-19 11:30:36', '2023-09-19 11:31:20'),
('2753b3d0-b1ce-46e5-84dc-c1b0dafb9468', 9, '35fcb1a9-89d7-455a-b80e-83d601e6218e', 0, NULL, '2023-06-15 23:30:10', '2023-06-15 23:30:10'),
('27b3f1ba-e647-444f-b659-d554bc23594d', 7, '89e40754-c1bc-41bf-b77d-25d89916c55f', 0, NULL, '2023-09-04 11:04:34', '2023-09-04 11:04:34'),
('27cbddd4-8a19-4f1e-98c5-5fe2815fc5ce', 10, '7e1fb17e-e48e-4298-be91-abf5a69e39d1', 0, NULL, '2023-08-31 18:44:24', '2023-08-31 18:44:24'),
('291ef5b8-6393-4585-bc5c-5848a9ddd84c', 9, '23bf157b-09ef-4c3c-bbfe-b45b7154cc51', 0, NULL, '2023-06-02 14:17:42', '2023-06-02 14:17:42'),
('296b9999-6b96-421b-9a7f-4d4fbfe69fda', 2, '23bf157b-09ef-4c3c-bbfe-b45b7154cc51', 1, '2023-06-02 19:25:51', '2023-06-02 14:17:42', '2023-06-02 19:25:51'),
('298dcfa2-ae1d-414f-8de2-b8f1ef41fade', 13, '0408e32d-a139-4805-8cb4-8906332d1dbd', 1, '2023-06-13 12:46:24', '2023-06-12 15:39:52', '2023-06-13 12:46:24'),
('29c2bdce-c26d-4a66-a4ee-6bdb126226e9', 12, 'f01c58ec-781f-40de-bd1b-eecbb777f804', 0, NULL, '2023-09-04 09:42:41', '2023-09-04 09:42:41'),
('29d0054c-ff34-47e9-81f2-d8774368b30a', 5, 'f2646515-f3e3-4d6b-9945-34fad472057d', 0, NULL, '2023-10-07 14:50:06', '2023-10-07 14:50:06'),
('29ec42a2-ec80-4a58-aca6-2a20c24200ad', 13, '89e40754-c1bc-41bf-b77d-25d89916c55f', 0, NULL, '2023-09-04 11:04:34', '2023-09-04 11:04:34'),
('2a033eb0-8c8c-4ed0-9625-1c116d3a6119', 8, '0408e32d-a139-4805-8cb4-8906332d1dbd', 1, '2023-06-13 12:46:24', '2023-06-12 15:39:52', '2023-06-13 12:46:24'),
('2a43300d-7476-4abd-aa52-085ef438ccaf', 7, '62da7c40-54c1-4d8b-8f35-48bb3a7ca16c', 0, NULL, '2023-08-31 18:26:58', '2023-08-31 18:26:58'),
('2adaa049-d20b-40b3-8d42-1267bfdbbc6e', 1, 'f2646515-f3e3-4d6b-9945-34fad472057d', 1, '2023-10-07 14:50:06', '2023-10-07 14:50:06', '2023-10-07 14:50:06'),
('2aece3b4-1dfc-48d7-9788-cd44680613d2', 12, '3f421e57-d054-490f-8043-f11f09478ae8', 0, NULL, '2023-08-31 18:30:27', '2023-08-31 18:30:27'),
('2b137eda-e360-4d30-ad55-f4302937ded3', 4, 'dc242008-4b90-4ace-9943-6514a755427f', 0, NULL, '2023-10-07 14:47:53', '2023-10-07 14:47:53'),
('2c3db161-f3c7-44ce-a7ea-b8a6d347f824', 9, 'f2646515-f3e3-4d6b-9945-34fad472057d', 0, NULL, '2023-10-07 14:50:06', '2023-10-07 14:50:06'),
('2ca3d16d-4828-4d96-8731-7203b903cee7', 13, '3f421e57-d054-490f-8043-f11f09478ae8', 0, NULL, '2023-08-31 18:30:27', '2023-08-31 18:30:27'),
('2d0273d7-b624-4264-8cc8-243e799a42a1', 11, '286b4de1-5c50-414f-a64b-9262ded782cd', 1, '2023-06-15 12:15:09', '2023-06-12 15:03:12', '2023-06-15 12:15:09'),
('2e03d68e-ead7-49a8-b532-99b3ad534b1b', 10, '0408e32d-a139-4805-8cb4-8906332d1dbd', 1, '2023-06-13 12:46:24', '2023-06-12 15:39:52', '2023-06-13 12:46:24'),
('302d2a6e-e5ca-4770-933e-89111ee5b72e', 8, '16679b4a-d98d-4bc6-8d30-e994ea4c26e4', 0, NULL, '2023-10-29 05:25:20', '2023-10-29 05:25:20'),
('30d3ef2d-9274-4ce1-ad51-a37fe5e174a6', 8, '3f421e57-d054-490f-8043-f11f09478ae8', 0, NULL, '2023-08-31 18:30:27', '2023-08-31 18:30:27'),
('3100e3d4-e5f1-4fdc-b41b-c3ad2d6861d1', 3, '0408e32d-a139-4805-8cb4-8906332d1dbd', 1, '2023-06-12 19:04:48', '2023-06-12 15:39:52', '2023-06-12 19:04:48'),
('31e812d0-deca-4f7a-8d39-b1d75e73d3b6', 7, '9d2ed9a4-9f9b-4aab-b9be-d82639fbb2bc', 1, '2023-06-09 18:17:39', '2023-06-09 14:50:29', '2023-06-09 18:17:39'),
('31f4cad4-9e7b-4fe4-984a-d0b93c0a105b', 8, 'f2646515-f3e3-4d6b-9945-34fad472057d', 0, NULL, '2023-10-07 14:50:06', '2023-10-07 14:50:06'),
('3294efb5-8e40-4fe6-a881-79847f0c84ec', 1, 'b8d4fc7b-10cc-434f-b2ef-970fca4cd5a4', 1, '2023-06-14 20:09:49', '2023-06-14 20:09:49', '2023-06-14 20:09:49'),
('332c7842-6934-40f8-bbb0-a28985b3c93b', 10, '185c422e-a4ce-445c-9b8c-00aa5b229af1', 0, NULL, '2023-06-15 21:02:45', '2023-06-15 21:02:45'),
('33d0de53-0a82-4020-80d1-b80ea58e9a45', 5, '35fcb1a9-89d7-455a-b80e-83d601e6218e', 0, NULL, '2023-06-15 23:30:10', '2023-06-15 23:30:10'),
('33f2aa2d-8170-4612-87b7-fe11b9a13cf5', 9, '7f3d1751-71e1-4aaa-8bb5-487ab093b75b', 0, NULL, '2023-10-01 05:34:52', '2023-10-01 05:34:52'),
('346a2aa5-86ff-4cb7-b031-e278a2bbf7b2', 11, '185c422e-a4ce-445c-9b8c-00aa5b229af1', 0, NULL, '2023-06-15 21:02:45', '2023-06-15 21:02:45'),
('34a7eae2-966a-43df-a4ab-716ca0b7a3d1', 11, '17a07a82-e78d-4ef4-b993-c9fa349ead5a', 0, NULL, '2023-06-15 11:53:20', '2023-06-15 11:53:20'),
('35ae761f-c2c4-4ab8-a716-84a9150fe0fd', 13, 'cc8600e7-49b9-42f7-b2ca-80f8245b5c9e', 1, '2023-06-01 19:25:10', '2023-05-31 13:02:58', '2023-06-01 19:25:10'),
('3683f347-d9b5-4a71-9917-9c94b68a7902', 8, 'b8d4fc7b-10cc-434f-b2ef-970fca4cd5a4', 0, NULL, '2023-06-14 20:09:49', '2023-06-14 20:09:49'),
('36cd2d00-a65f-4a4d-905d-eab5f183be3b', 1, '2538bf3d-56e1-4664-9c46-b8553e92d5b1', 1, '2023-08-31 18:47:57', '2023-08-31 18:47:57', '2023-08-31 18:47:57'),
('36ed3d97-5aec-4707-a118-092da85e2bd0', 1, '17a07a82-e78d-4ef4-b993-c9fa349ead5a', 1, '2023-06-15 11:53:20', '2023-06-15 11:53:20', '2023-06-15 11:53:20'),
('374fcb46-ca55-40c9-b19f-9befeb3123f9', 4, '7f3d1751-71e1-4aaa-8bb5-487ab093b75b', 0, NULL, '2023-10-01 05:34:52', '2023-10-01 05:34:52'),
('37f1efc0-523a-40b3-8662-531467cb022d', 10, 'b8d4fc7b-10cc-434f-b2ef-970fca4cd5a4', 0, NULL, '2023-06-14 20:09:49', '2023-06-14 20:09:49'),
('38a61629-e3f7-4114-9988-728896d77757', 8, '286b4de1-5c50-414f-a64b-9262ded782cd', 1, '2023-06-13 18:50:30', '2023-06-12 15:03:12', '2023-06-13 18:50:30'),
('39266c1c-8cbd-4f1c-bf31-d3aba2e86922', 10, '5ae6ec90-851e-4896-9ea6-3587cb38bf53', 0, NULL, '2023-06-15 23:38:10', '2023-06-15 23:38:10'),
('39f23a2a-c2e8-4750-834c-660a65f9d52d', 9, '504799fa-b789-4d71-a8dc-08c68276701d', 0, NULL, '2023-08-31 18:39:08', '2023-08-31 18:39:08'),
('3ab00c88-c434-4024-a414-f5ba51f56aba', 8, 'c6f384a3-3f73-425a-bef3-a3156f252438', 1, '2023-06-01 19:25:49', '2023-06-01 12:41:44', '2023-06-01 19:25:49'),
('3b07fea3-d054-44ba-9f7e-a1d75057c23a', 7, '041213e7-3310-4133-8671-66aefc8e8fdb', 0, NULL, '2023-08-31 18:56:17', '2023-08-31 18:56:17'),
('3b1d4852-48e1-4e92-8516-7893711c9970', 1, '16679b4a-d98d-4bc6-8d30-e994ea4c26e4', 1, '2023-10-29 05:25:20', '2023-10-29 05:25:20', '2023-10-29 05:25:20'),
('3b25f3f4-894b-49bd-9640-8abfdb9f8a50', 4, '35fcb1a9-89d7-455a-b80e-83d601e6218e', 0, NULL, '2023-06-15 23:30:10', '2023-06-15 23:30:10'),
('3b602e2d-e168-403d-9085-bd5239287a6a', 13, 'f2646515-f3e3-4d6b-9945-34fad472057d', 0, NULL, '2023-10-07 14:50:06', '2023-10-07 14:50:06'),
('3b6cc2ce-da5b-4dfa-ab8d-edfa912d3c2f', 6, '67ddc55d-ce12-44b7-ac0a-04d5267f8ce5', 1, '2023-06-15 21:21:28', '2023-06-14 20:20:33', '2023-06-15 21:21:28'),
('3bfc5ef5-c0a0-4992-9b88-e7c96fc6422e', 11, '62da7c40-54c1-4d8b-8f35-48bb3a7ca16c', 0, NULL, '2023-08-31 18:26:58', '2023-08-31 18:26:58'),
('3c276123-607f-4a55-a941-d3ed1e7a8213', 8, '9d2ed9a4-9f9b-4aab-b9be-d82639fbb2bc', 1, '2023-06-11 18:25:33', '2023-06-09 14:50:29', '2023-06-11 18:25:33'),
('3d18764d-9e39-4d82-a153-0581df23b013', 12, '17a07a82-e78d-4ef4-b993-c9fa349ead5a', 0, NULL, '2023-06-15 11:53:20', '2023-06-15 11:53:20'),
('3d770cb1-97be-459f-beb4-aec59354c6e7', 3, '380cfc93-a7b9-44c2-8257-035a89eab1be', 0, NULL, '2023-08-31 18:51:17', '2023-08-31 18:51:17'),
('3e2e1108-8159-41f7-8cb7-e9957b266023', 5, '89e40754-c1bc-41bf-b77d-25d89916c55f', 0, NULL, '2023-09-04 11:04:34', '2023-09-04 11:04:34'),
('3f3e4ee6-abb5-4d75-a35d-82bad111245a', 2, '89ac443e-7fee-4b1f-9133-1e3788372e28', 1, '2023-07-07 16:44:49', '2023-06-03 19:25:16', '2023-07-07 16:44:49'),
('3ff14b9a-bdfc-4c94-9b6d-902977f33116', 7, '7f3d1751-71e1-4aaa-8bb5-487ab093b75b', 0, NULL, '2023-10-01 05:34:52', '2023-10-01 05:34:52'),
('40395e24-4dee-452c-8ff5-85e0493c28f3', 5, '2538bf3d-56e1-4664-9c46-b8553e92d5b1', 0, NULL, '2023-08-31 18:47:57', '2023-08-31 18:47:57'),
('41205483-ef0a-4539-a1ca-a799a76b683c', 7, '8647e82e-0fc7-49fc-8305-e0cffd67ef86', 0, '2023-09-19 11:30:40', '2023-09-19 11:30:36', '2023-09-19 11:31:20'),
('414f3a44-0b4c-4234-8e24-895db4f365a7', 5, '0408e32d-a139-4805-8cb4-8906332d1dbd', 1, '2023-06-12 19:38:57', '2023-06-12 15:39:52', '2023-06-12 19:38:57'),
('4228d415-d5e2-4b0d-a6e2-a43a0d6f2342', 1, '8647e82e-0fc7-49fc-8305-e0cffd67ef86', 1, '2023-09-19 11:30:36', '2023-09-19 11:30:36', '2023-09-19 11:30:36'),
('422fc958-b887-449c-96cb-acff17e90428', 5, '3f421e57-d054-490f-8043-f11f09478ae8', 0, NULL, '2023-08-31 18:30:27', '2023-08-31 18:30:27'),
('4284c0d5-d78d-4914-8906-516e4082a50a', 12, '9d2ed9a4-9f9b-4aab-b9be-d82639fbb2bc', 1, '2023-06-12 14:21:45', '2023-06-09 14:50:29', '2023-06-12 14:21:45'),
('434bf41c-6286-4601-a58b-def5d9df9d33', 2, 'f01c58ec-781f-40de-bd1b-eecbb777f804', 0, NULL, '2023-09-04 09:42:41', '2023-09-04 09:42:41'),
('438da446-a751-432a-b510-d005ee6a29c7', 4, '380cfc93-a7b9-44c2-8257-035a89eab1be', 0, NULL, '2023-08-31 18:51:17', '2023-08-31 18:51:17'),
('440f98fd-1fd5-4be1-8617-51b8478bbaad', 5, '89ac443e-7fee-4b1f-9133-1e3788372e28', 0, NULL, '2023-06-03 19:25:16', '2023-06-03 19:25:16'),
('449d0cbe-1c3a-415b-b1d0-eb7236aa51f3', 6, '2538bf3d-56e1-4664-9c46-b8553e92d5b1', 0, NULL, '2023-08-31 18:47:57', '2023-08-31 18:47:57'),
('44c6578d-b9d3-4a1f-8c48-82d63bfa4a2e', 11, '4c7561d3-a8f6-4f75-a791-e7ba3c62f736', 0, NULL, '2023-06-03 19:26:06', '2023-06-03 19:26:06'),
('464370ee-2d07-4cda-a524-1f74420e009f', 5, '5c8faef0-69a1-40b3-ab56-2567c8c6e0e8', 0, NULL, '2023-10-02 06:01:02', '2023-10-02 06:01:02'),
('465003e6-745b-44fe-9cb8-f550ad32edbd', 3, 'c6f384a3-3f73-425a-bef3-a3156f252438', 1, '2023-06-01 16:17:10', '2023-06-01 12:41:44', '2023-06-01 16:17:10'),
('473cb0d3-a230-45dc-8740-cb31a9a5199a', 8, '041213e7-3310-4133-8671-66aefc8e8fdb', 0, NULL, '2023-08-31 18:56:17', '2023-08-31 18:56:17'),
('47512ad8-1e62-42d3-a9c9-a499ce34c036', 13, '67ddc55d-ce12-44b7-ac0a-04d5267f8ce5', 0, NULL, '2023-06-14 20:20:33', '2023-06-14 20:20:33'),
('4841d3df-7553-41b2-bd32-0865a50dce5b', 5, '62da7c40-54c1-4d8b-8f35-48bb3a7ca16c', 0, NULL, '2023-08-31 18:26:58', '2023-08-31 18:26:58'),
('4866b40c-9461-4663-9e6d-2c2dba8d9570', 1, 'c6f384a3-3f73-425a-bef3-a3156f252438', 1, '2023-06-01 12:41:44', '2023-06-01 12:41:44', '2023-06-01 12:41:44'),
('48bbfccd-df83-4083-a532-78c7f9814698', 13, '2df9d10d-e450-4a5b-8a11-ddc8c6b87dcb', 0, NULL, '2023-06-03 19:34:06', '2023-06-03 19:34:06'),
('48c6078b-c61a-4e23-99a1-2c9b762ae6fa', 13, '9d2ed9a4-9f9b-4aab-b9be-d82639fbb2bc', 1, '2023-06-12 14:21:45', '2023-06-09 14:50:29', '2023-06-12 14:21:45'),
('4910e332-af33-486a-8d94-40b3af3d25bd', 11, 'f2646515-f3e3-4d6b-9945-34fad472057d', 0, NULL, '2023-10-07 14:50:06', '2023-10-07 14:50:06'),
('49bb058d-f61b-4c29-ad46-6bd6a32bad5e', 9, '5ae6ec90-851e-4896-9ea6-3587cb38bf53', 0, NULL, '2023-06-15 23:38:10', '2023-06-15 23:38:10'),
('4af2921f-5925-423f-91be-80547e9d8ded', 5, '864d6599-5e96-4a36-8e47-21c43b8f3366', 0, NULL, '2023-09-04 09:42:14', '2023-09-04 09:42:14'),
('4cbb9c0d-0862-43a1-9353-6c90713f3fb1', 11, '11da7b8b-19c7-4d30-9c9f-fc005650bff2', 1, '2023-06-20 13:48:14', '2023-06-15 12:45:56', '2023-06-20 13:48:14'),
('4ce17401-a227-44b2-a827-c0a3772324fe', 12, '380cfc93-a7b9-44c2-8257-035a89eab1be', 0, NULL, '2023-08-31 18:51:17', '2023-08-31 18:51:17'),
('4cfd6d28-031a-4cf7-b001-6f15050f82cb', 10, 'cc8600e7-49b9-42f7-b2ca-80f8245b5c9e', 1, '2023-06-01 08:33:51', '2023-05-31 13:02:58', '2023-06-01 08:33:51'),
('4d55a59a-db44-465c-ac14-ada9f88ff6cc', 12, 'dc242008-4b90-4ace-9943-6514a755427f', 0, NULL, '2023-10-07 14:47:53', '2023-10-07 14:47:53'),
('4db29ba1-a0f2-4d05-8cee-c6178840dacf', 11, '504799fa-b789-4d71-a8dc-08c68276701d', 0, NULL, '2023-08-31 18:39:08', '2023-08-31 18:39:08'),
('4f8f22a7-fda6-416f-9db3-58c6acc01bb9', 5, '041213e7-3310-4133-8671-66aefc8e8fdb', 0, NULL, '2023-08-31 18:56:17', '2023-08-31 18:56:17'),
('51950ff9-c122-4fb9-b057-4ae67b3dd02c', 10, '7d763280-4954-4c88-9148-f4444a9bd516', 0, NULL, '2023-10-10 18:00:29', '2023-10-10 18:00:29'),
('521916cf-ad1b-4c2c-a2f2-87d6501de649', 2, '197e84e2-65a3-442d-9d55-fa369dab1b0d', 0, NULL, '2023-09-04 09:52:01', '2023-09-04 09:52:01'),
('52323d06-6633-492b-93ac-c2390d0243ea', 10, '3f421e57-d054-490f-8043-f11f09478ae8', 0, NULL, '2023-08-31 18:30:27', '2023-08-31 18:30:27'),
('5284a751-f15b-4515-a5f7-bf03e49ccb95', 7, '11da7b8b-19c7-4d30-9c9f-fc005650bff2', 1, '2023-06-15 17:47:46', '2023-06-15 12:45:56', '2023-06-15 17:47:46'),
('5285e8f4-b3bf-4b8a-b485-8215e7968c3e', 7, '89ac443e-7fee-4b1f-9133-1e3788372e28', 0, NULL, '2023-06-03 19:25:16', '2023-06-03 19:25:16'),
('52c88dcf-8ea2-4367-89cb-63f4376e087d', 12, '185c422e-a4ce-445c-9b8c-00aa5b229af1', 0, NULL, '2023-06-15 21:02:45', '2023-06-15 21:02:45'),
('53a78398-dc18-4591-9011-68ab3d243b38', 1, '0408e32d-a139-4805-8cb4-8906332d1dbd', 1, '2023-06-12 15:41:26', '2023-06-12 15:39:52', '2023-06-12 15:41:26'),
('53b83dc9-cb0f-40d8-9381-683d031c299d', 4, '5c8faef0-69a1-40b3-ab56-2567c8c6e0e8', 0, NULL, '2023-10-02 06:01:02', '2023-10-02 06:01:02'),
('543bf82e-7e47-4391-a2e2-6b51b38a7200', 10, 'f2646515-f3e3-4d6b-9945-34fad472057d', 0, NULL, '2023-10-07 14:50:06', '2023-10-07 14:50:06'),
('547b0145-f59c-416f-b08b-1e8d7c39c0e9', 3, '8647e82e-0fc7-49fc-8305-e0cffd67ef86', 0, '2023-09-19 11:30:40', '2023-09-19 11:30:36', '2023-09-19 11:31:20'),
('55e5a57b-134a-46d6-ae7c-7c3d97a60d34', 12, '35fcb1a9-89d7-455a-b80e-83d601e6218e', 0, NULL, '2023-06-15 23:30:10', '2023-06-15 23:30:10'),
('55e92540-6575-4825-a1ca-d4a4822482e6', 2, '9d2ed9a4-9f9b-4aab-b9be-d82639fbb2bc', 1, '2023-06-09 17:53:11', '2023-06-09 14:50:29', '2023-06-09 17:53:11'),
('56928792-e0d0-4437-b6b3-bc45ff10d50e', 8, '7d763280-4954-4c88-9148-f4444a9bd516', 0, NULL, '2023-10-10 18:00:29', '2023-10-10 18:00:29'),
('56b4a945-36b8-4795-b719-e59c96a96f6c', 2, '5ae6ec90-851e-4896-9ea6-3587cb38bf53', 0, NULL, '2023-06-15 23:38:10', '2023-06-15 23:38:10'),
('57aa5180-1f22-4da2-b994-750f535d8393', 8, '21a21f32-26f5-4985-8742-8f6f71950639', 0, NULL, '2023-09-30 19:12:03', '2023-09-30 19:12:03'),
('592db96b-7904-4bcd-abd7-66fb904dc100', 7, '2538bf3d-56e1-4664-9c46-b8553e92d5b1', 0, NULL, '2023-08-31 18:47:57', '2023-08-31 18:47:57'),
('595fb644-da54-4e31-a97e-02adfcc6571e', 1, '89e40754-c1bc-41bf-b77d-25d89916c55f', 1, '2023-09-04 11:04:34', '2023-09-04 11:04:34', '2023-09-04 11:04:34'),
('59fc962c-6343-4407-b75b-41b2083e6302', 8, '2538bf3d-56e1-4664-9c46-b8553e92d5b1', 0, NULL, '2023-08-31 18:47:57', '2023-08-31 18:47:57'),
('5a798c4d-f50e-4eb4-929e-6ae8a4572a19', 2, '16679b4a-d98d-4bc6-8d30-e994ea4c26e4', 1, '2023-10-29 05:25:21', '2023-10-29 05:25:20', '2023-10-29 05:25:21'),
('5a8e47c8-5506-442b-a353-146bf73c1c17', 6, '4c7561d3-a8f6-4f75-a791-e7ba3c62f736', 0, NULL, '2023-06-03 19:26:06', '2023-06-03 19:26:06'),
('5b364eaf-c4b9-4344-864f-3adac01a7350', 10, '23bf157b-09ef-4c3c-bbfe-b45b7154cc51', 0, NULL, '2023-06-02 14:17:42', '2023-06-02 14:17:42'),
('5b8dd623-3535-421a-afde-90d1b0fec52e', 4, '4c7561d3-a8f6-4f75-a791-e7ba3c62f736', 0, NULL, '2023-06-03 19:26:06', '2023-06-03 19:26:06'),
('5b9944a4-02e2-411e-9aaf-efc060d1cdc7', 8, 'f01c58ec-781f-40de-bd1b-eecbb777f804', 0, NULL, '2023-09-04 09:42:41', '2023-09-04 09:42:41'),
('5c571923-17a8-4611-81ee-0f02c7de1e8b', 5, '21a21f32-26f5-4985-8742-8f6f71950639', 0, NULL, '2023-09-30 19:12:03', '2023-09-30 19:12:03'),
('5c6f20c0-0ac3-4d50-b816-d8e9497247c5', 4, '7d763280-4954-4c88-9148-f4444a9bd516', 0, NULL, '2023-10-10 18:00:29', '2023-10-10 18:00:29'),
('5ca4569f-45f3-4f23-ae2c-5652b4134b22', 6, '185c422e-a4ce-445c-9b8c-00aa5b229af1', 0, NULL, '2023-06-15 21:02:45', '2023-06-15 21:02:45'),
('5cc71cbd-530e-40e7-9e22-8c027962cc8d', 7, '2df9d10d-e450-4a5b-8a11-ddc8c6b87dcb', 0, NULL, '2023-06-03 19:34:06', '2023-06-03 19:34:06'),
('5cdf21a3-6d71-468e-b08d-a359d80ac80c', 7, 'c6f384a3-3f73-425a-bef3-a3156f252438', 1, '2023-06-01 19:25:36', '2023-06-01 12:41:44', '2023-06-01 19:25:36'),
('5d0b4558-aa3b-402f-a256-b11c4dc050db', 8, '8647e82e-0fc7-49fc-8305-e0cffd67ef86', 0, '2023-09-19 11:30:40', '2023-09-19 11:30:36', '2023-09-19 11:31:20'),
('5d5251d2-5ce3-45fb-b881-27bd0fe81c1a', 9, '0ea71326-7b16-4cbd-b4a6-8580304da7ab', 0, NULL, '2023-06-14 21:52:35', '2023-06-14 21:52:35'),
('5d7cda9f-dbbf-4017-8a43-533adea24962', 6, '864d6599-5e96-4a36-8e47-21c43b8f3366', 0, NULL, '2023-09-04 09:42:14', '2023-09-04 09:42:14'),
('5db2029a-e97c-4692-8832-4972788b7c4d', 11, '7e1fb17e-e48e-4298-be91-abf5a69e39d1', 0, NULL, '2023-08-31 18:44:24', '2023-08-31 18:44:24'),
('5de397ab-9854-41da-8f2c-ec5421f5519d', 6, 'c6f384a3-3f73-425a-bef3-a3156f252438', 1, '2023-06-01 19:25:32', '2023-06-01 12:41:44', '2023-06-01 19:25:32'),
('5ee85f60-3442-48c6-a6d6-a7795acad7e0', 9, '67ddc55d-ce12-44b7-ac0a-04d5267f8ce5', 0, NULL, '2023-06-14 20:20:33', '2023-06-14 20:20:33'),
('5ef5bedf-7ff9-4ac1-8857-fc4063ebad9f', 13, '5ae6ec90-851e-4896-9ea6-3587cb38bf53', 0, NULL, '2023-06-15 23:38:10', '2023-06-15 23:38:10'),
('5f16a09c-5b7c-4f3c-a476-09a4fa641321', 12, '7e1fb17e-e48e-4298-be91-abf5a69e39d1', 0, NULL, '2023-08-31 18:44:24', '2023-08-31 18:44:24'),
('5ff0685d-9685-40ed-a151-0f4f40d3f69d', 3, '5ae6ec90-851e-4896-9ea6-3587cb38bf53', 0, NULL, '2023-06-15 23:38:10', '2023-06-15 23:38:10'),
('60588d01-7a81-4cca-b119-7293cc0741d7', 11, 'c6f384a3-3f73-425a-bef3-a3156f252438', 1, '2023-06-02 13:04:41', '2023-06-01 12:41:44', '2023-06-02 13:04:41'),
('61c7f6a7-7d44-4243-b904-179bbbf05367', 5, '16679b4a-d98d-4bc6-8d30-e994ea4c26e4', 0, NULL, '2023-10-29 05:25:20', '2023-10-29 05:25:20'),
('63f96ed3-fa11-40cb-a514-3369139df516', 1, '864d6599-5e96-4a36-8e47-21c43b8f3366', 1, '2023-09-04 09:42:14', '2023-09-04 09:42:14', '2023-09-04 09:42:14'),
('64c18ada-99ad-4f6a-9277-4060e8101671', 3, '197e84e2-65a3-442d-9d55-fa369dab1b0d', 0, NULL, '2023-09-04 09:52:01', '2023-09-04 09:52:01'),
('6542ad8b-ca44-452c-9d48-b7d4e5609119', 3, 'dc242008-4b90-4ace-9943-6514a755427f', 0, NULL, '2023-10-07 14:47:53', '2023-10-07 14:47:53'),
('6747df61-6845-47fc-b1cb-04924a1bccbe', 1, '21a21f32-26f5-4985-8742-8f6f71950639', 1, '2023-09-30 19:12:03', '2023-09-30 19:12:03', '2023-09-30 19:12:03'),
('67757714-6568-4e51-99c0-2a1213c87581', 6, '11da7b8b-19c7-4d30-9c9f-fc005650bff2', 1, '2023-06-15 17:47:46', '2023-06-15 12:45:56', '2023-06-15 17:47:46'),
('677cbba0-006c-44b8-85d8-884eb8cb5281', 3, '21a21f32-26f5-4985-8742-8f6f71950639', 0, NULL, '2023-09-30 19:12:03', '2023-09-30 19:12:03'),
('67d80a01-b231-43d0-8957-2ed8f06296cf', 3, '5c8faef0-69a1-40b3-ab56-2567c8c6e0e8', 0, NULL, '2023-10-02 06:01:02', '2023-10-02 06:01:02'),
('67eea212-6642-4558-90b7-74e007bd5a37', 11, '2df9d10d-e450-4a5b-8a11-ddc8c6b87dcb', 0, NULL, '2023-06-03 19:34:06', '2023-06-03 19:34:06'),
('684fa7b9-aca8-49bb-8d9a-1e6e4125e94a', 12, '852e3b0f-a028-4fc3-99f6-6c3341337b44', 0, NULL, '2023-06-09 10:37:20', '2023-06-09 10:37:20'),
('685b23f8-6322-47a5-a910-817c1e61d7e0', 6, 'b8d4fc7b-10cc-434f-b2ef-970fca4cd5a4', 0, NULL, '2023-06-14 20:09:49', '2023-06-14 20:09:49'),
('68b8800a-912d-40d4-806a-fcf9696e9807', 1, '23bf157b-09ef-4c3c-bbfe-b45b7154cc51', 1, '2023-06-02 14:17:42', '2023-06-02 14:17:42', '2023-06-02 14:17:42'),
('68c4175a-2da5-43e2-9d06-b6a2ebba8263', 10, '16679b4a-d98d-4bc6-8d30-e994ea4c26e4', 0, NULL, '2023-10-29 05:25:20', '2023-10-29 05:25:20'),
('692acf0a-7b21-4039-af5d-bb310f06aebf', 6, '197e84e2-65a3-442d-9d55-fa369dab1b0d', 0, NULL, '2023-09-04 09:52:01', '2023-09-04 09:52:01'),
('6938509b-5e6e-43ab-8a5c-d0968e32aa47', 11, '0408e32d-a139-4805-8cb4-8906332d1dbd', 1, '2023-06-13 12:46:24', '2023-06-12 15:39:52', '2023-06-13 12:46:24'),
('6977f2f1-2591-4148-b5d1-bf3939da10cf', 13, '286b4de1-5c50-414f-a64b-9262ded782cd', 1, '2023-06-15 12:15:09', '2023-06-12 15:03:12', '2023-06-15 12:15:09'),
('69c8cdc7-c97b-4cce-99bc-34b149ae7f43', 13, '0ea71326-7b16-4cbd-b4a6-8580304da7ab', 0, NULL, '2023-06-14 21:52:35', '2023-06-14 21:52:35'),
('6a2f4010-c8f8-44d7-9865-b20ad3f79887', 5, '185c422e-a4ce-445c-9b8c-00aa5b229af1', 0, NULL, '2023-06-15 21:02:45', '2023-06-15 21:02:45'),
('6b233a57-94f5-40ee-bd26-75003889b4e8', 5, '380cfc93-a7b9-44c2-8257-035a89eab1be', 0, NULL, '2023-08-31 18:51:17', '2023-08-31 18:51:17'),
('6bb64468-a438-4434-bdc1-3177bcc5b0df', 11, '7f3d1751-71e1-4aaa-8bb5-487ab093b75b', 0, NULL, '2023-10-01 05:34:52', '2023-10-01 05:34:52'),
('6bd41519-e9b8-4106-b075-f863875b2d7b', 13, '5c8faef0-69a1-40b3-ab56-2567c8c6e0e8', 0, NULL, '2023-10-02 06:01:02', '2023-10-02 06:01:02'),
('6c4dc720-17b4-4d15-b73d-47479c258092', 6, '16679b4a-d98d-4bc6-8d30-e994ea4c26e4', 0, NULL, '2023-10-29 05:25:20', '2023-10-29 05:25:20'),
('6caae763-d23c-4062-9413-cfb4d01ea3e6', 12, '23bf157b-09ef-4c3c-bbfe-b45b7154cc51', 0, NULL, '2023-06-02 14:17:42', '2023-06-02 14:17:42'),
('6cf0446e-7aba-45a6-b93b-e96ec79e15f4', 13, '864d6599-5e96-4a36-8e47-21c43b8f3366', 0, NULL, '2023-09-04 09:42:14', '2023-09-04 09:42:14'),
('6e0ea8a2-1715-4e15-8fd2-fe2aeb3f3e94', 4, '11da7b8b-19c7-4d30-9c9f-fc005650bff2', 1, '2023-06-15 16:11:36', '2023-06-15 12:45:56', '2023-06-15 16:11:36'),
('6e950217-751f-4978-8343-3ddec155d4e4', 9, '2df9d10d-e450-4a5b-8a11-ddc8c6b87dcb', 0, NULL, '2023-06-03 19:34:06', '2023-06-03 19:34:06'),
('6f16d49a-1d8c-4d6f-9858-8eded272e08d', 1, '286b4de1-5c50-414f-a64b-9262ded782cd', 1, '2023-06-12 15:03:12', '2023-06-12 15:03:12', '2023-06-12 15:03:12'),
('6f7efce4-5759-4937-af7b-d2afbf601b07', 2, '504799fa-b789-4d71-a8dc-08c68276701d', 0, NULL, '2023-08-31 18:39:08', '2023-08-31 18:39:08'),
('6f817d6b-8ba9-4c93-a32a-c86289283cee', 9, '380cfc93-a7b9-44c2-8257-035a89eab1be', 0, NULL, '2023-08-31 18:51:17', '2023-08-31 18:51:17'),
('6fb3b003-461d-44fc-ab14-f47e1c4fd4af', 12, '16679b4a-d98d-4bc6-8d30-e994ea4c26e4', 0, NULL, '2023-10-29 05:25:20', '2023-10-29 05:25:20'),
('70e08b94-4a2a-43ce-80e6-d6ac4f768b87', 5, 'c6f384a3-3f73-425a-bef3-a3156f252438', 1, '2023-06-01 19:25:21', '2023-06-01 12:41:44', '2023-06-01 19:25:21'),
('70ea7bea-2831-458b-9de6-b2f07110f1f6', 3, '2538bf3d-56e1-4664-9c46-b8553e92d5b1', 0, NULL, '2023-08-31 18:47:57', '2023-08-31 18:47:57'),
('70fe6317-6baa-4f9d-b8ff-712ecfa1a1ba', 13, '8647e82e-0fc7-49fc-8305-e0cffd67ef86', 0, '2023-09-19 11:30:40', '2023-09-19 11:30:36', '2023-09-19 11:31:20'),
('712b2255-f27a-4b63-9a38-fda8007ae577', 7, 'dc242008-4b90-4ace-9943-6514a755427f', 0, NULL, '2023-10-07 14:47:53', '2023-10-07 14:47:53'),
('7158048e-1cdc-46f3-9f1d-b015e7ddb550', 2, '7e1fb17e-e48e-4298-be91-abf5a69e39d1', 0, NULL, '2023-08-31 18:44:24', '2023-08-31 18:44:24'),
('73b4eda4-e4b2-4a5c-a2b1-5d15a187b05f', 9, '11da7b8b-19c7-4d30-9c9f-fc005650bff2', 1, '2023-06-20 13:48:14', '2023-06-15 12:45:56', '2023-06-20 13:48:14'),
('73daf4c6-4c9d-4926-aa1f-cea22cbf5442', 7, '7d763280-4954-4c88-9148-f4444a9bd516', 0, NULL, '2023-10-10 18:00:29', '2023-10-10 18:00:29'),
('740f6347-c829-4230-933e-812324b81a15', 6, '0408e32d-a139-4805-8cb4-8906332d1dbd', 1, '2023-06-12 19:38:57', '2023-06-12 15:39:52', '2023-06-12 19:38:57'),
('74feda7c-4ec7-4c97-9971-f4ab0585d289', 11, '2538bf3d-56e1-4664-9c46-b8553e92d5b1', 0, NULL, '2023-08-31 18:47:57', '2023-08-31 18:47:57'),
('75623880-cd29-434e-affd-5637dfeaa6fe', 8, '0ea71326-7b16-4cbd-b4a6-8580304da7ab', 0, NULL, '2023-06-14 21:52:35', '2023-06-14 21:52:35'),
('756bbac5-0b22-458c-b3f4-9a31662c45ab', 4, '041213e7-3310-4133-8671-66aefc8e8fdb', 0, NULL, '2023-08-31 18:56:17', '2023-08-31 18:56:17'),
('75cd5ef6-4176-4d36-885b-363be0a5c352', 2, '852e3b0f-a028-4fc3-99f6-6c3341337b44', 0, NULL, '2023-06-09 10:37:20', '2023-06-09 10:37:20'),
('766126cb-6fb9-43af-b2ea-95661a00d5cb', 7, '16679b4a-d98d-4bc6-8d30-e994ea4c26e4', 0, NULL, '2023-10-29 05:25:20', '2023-10-29 05:25:20'),
('771b7fb7-f6bc-4a7a-9fb5-034b6e0a0302', 6, '23bf157b-09ef-4c3c-bbfe-b45b7154cc51', 1, '2023-06-02 19:25:51', '2023-06-02 14:17:42', '2023-06-02 19:25:51'),
('786d6be7-3008-4583-b2c0-150a7fe875ca', 5, 'dc242008-4b90-4ace-9943-6514a755427f', 0, NULL, '2023-10-07 14:47:53', '2023-10-07 14:47:53'),
('78d1115e-aca7-4afb-a2f0-750aa94bc561', 11, '7d763280-4954-4c88-9148-f4444a9bd516', 0, NULL, '2023-10-10 18:00:29', '2023-10-10 18:00:29'),
('7901f9e5-f7af-4395-85ea-c915b1a61344', 2, '8647e82e-0fc7-49fc-8305-e0cffd67ef86', 0, '2023-09-19 11:30:45', '2023-09-19 11:30:36', '2023-09-19 11:31:20'),
('793a76c2-d3a5-48bf-8b08-083d891ed320', 11, 'cc8600e7-49b9-42f7-b2ca-80f8245b5c9e', 1, '2023-06-01 19:25:02', '2023-05-31 13:02:58', '2023-06-01 19:25:02'),
('793f98b0-c082-4c3c-bacb-d67cb24388ff', 2, '0ea71326-7b16-4cbd-b4a6-8580304da7ab', 0, NULL, '2023-06-14 21:52:35', '2023-06-14 21:52:35'),
('7aa68cf3-367f-4d92-9b6e-72e87c1d662d', 9, '864d6599-5e96-4a36-8e47-21c43b8f3366', 0, NULL, '2023-09-04 09:42:14', '2023-09-04 09:42:14'),
('7b2a1b51-af7c-4b50-8331-b1151b21c4f5', 4, '7e1fb17e-e48e-4298-be91-abf5a69e39d1', 0, NULL, '2023-08-31 18:44:24', '2023-08-31 18:44:24'),
('7bc851ee-5b23-49f0-9170-36a98bea0b7f', 10, '67ddc55d-ce12-44b7-ac0a-04d5267f8ce5', 0, NULL, '2023-06-14 20:20:33', '2023-06-14 20:20:33'),
('7be3e2bb-e2a2-4d06-8081-294838d6679e', 12, 'b8d4fc7b-10cc-434f-b2ef-970fca4cd5a4', 0, NULL, '2023-06-14 20:09:49', '2023-06-14 20:09:49'),
('7cdf52ac-023e-4172-8f2a-90a7cce7c7f9', 5, '11da7b8b-19c7-4d30-9c9f-fc005650bff2', 1, '2023-06-15 17:47:46', '2023-06-15 12:45:56', '2023-06-15 17:47:46'),
('7cf6bf67-28a5-493e-996b-d1c8acbab133', 11, '23bf157b-09ef-4c3c-bbfe-b45b7154cc51', 0, NULL, '2023-06-02 14:17:42', '2023-06-02 14:17:42'),
('7e750c3b-b5df-4267-b7e3-68883b166e4b', 7, '23bf157b-09ef-4c3c-bbfe-b45b7154cc51', 1, '2023-06-02 19:25:51', '2023-06-02 14:17:42', '2023-06-02 19:25:51'),
('7ec56ff0-a5fc-4e5c-9954-c0d4b622ad9d', 3, '89e40754-c1bc-41bf-b77d-25d89916c55f', 0, NULL, '2023-09-04 11:04:34', '2023-09-04 11:04:34'),
('7f7a5552-0bbc-4b9b-b342-c218edd78ad0', 10, '89ac443e-7fee-4b1f-9133-1e3788372e28', 0, NULL, '2023-06-03 19:25:16', '2023-06-03 19:25:16'),
('7f86b062-3a6d-4d9f-a7a1-f4d15aec141b', 9, '0408e32d-a139-4805-8cb4-8906332d1dbd', 1, '2023-06-13 12:46:24', '2023-06-12 15:39:52', '2023-06-13 12:46:24'),
('811b4277-978e-4f16-a0a9-8b9016bf82ae', 8, '5ae6ec90-851e-4896-9ea6-3587cb38bf53', 0, NULL, '2023-06-15 23:38:10', '2023-06-15 23:38:10'),
('82ef41de-f05c-4e3b-b887-3688f81581c0', 2, 'c6f384a3-3f73-425a-bef3-a3156f252438', 1, '2023-06-01 16:17:08', '2023-06-01 12:41:44', '2023-06-01 16:17:08'),
('8355c4bc-04c8-400a-b890-9d243ac931b4', 11, '852e3b0f-a028-4fc3-99f6-6c3341337b44', 0, NULL, '2023-06-09 10:37:20', '2023-06-09 10:37:20'),
('84251af7-31a2-491a-b74f-db1897dd49fe', 8, 'dc242008-4b90-4ace-9943-6514a755427f', 0, NULL, '2023-10-07 14:47:53', '2023-10-07 14:47:53'),
('8500d322-8502-4c31-9cfa-43212b881561', 4, '5ae6ec90-851e-4896-9ea6-3587cb38bf53', 0, NULL, '2023-06-15 23:38:10', '2023-06-15 23:38:10'),
('850aa3c1-059a-4516-9d05-3bd083174b3a', 4, '2df9d10d-e450-4a5b-8a11-ddc8c6b87dcb', 0, NULL, '2023-06-03 19:34:06', '2023-06-03 19:34:06'),
('857abfba-91a0-4f47-97da-2ea24df9cfe0', 4, '0ea71326-7b16-4cbd-b4a6-8580304da7ab', 0, NULL, '2023-06-14 21:52:35', '2023-06-14 21:52:35'),
('86083c58-0c41-4550-a53f-ac628e965865', 1, 'dc242008-4b90-4ace-9943-6514a755427f', 1, '2023-10-07 14:47:53', '2023-10-07 14:47:53', '2023-10-07 14:47:53'),
('86a3d4fe-8fb8-4c2a-8687-16eacc4d4f9c', 12, '89ac443e-7fee-4b1f-9133-1e3788372e28', 0, NULL, '2023-06-03 19:25:16', '2023-06-03 19:25:16'),
('87145e79-fdd0-4adb-82af-7e1ae37fffa7', 2, '11da7b8b-19c7-4d30-9c9f-fc005650bff2', 1, '2023-06-15 16:11:36', '2023-06-15 12:45:56', '2023-06-15 16:11:36'),
('8808c78a-d3f7-4306-b02a-5b7d325a4f8c', 9, '2538bf3d-56e1-4664-9c46-b8553e92d5b1', 0, NULL, '2023-08-31 18:47:57', '2023-08-31 18:47:57'),
('88444d6d-4097-47fd-8ec0-7e451cd15b2f', 9, '041213e7-3310-4133-8671-66aefc8e8fdb', 0, NULL, '2023-08-31 18:56:17', '2023-08-31 18:56:17'),
('88ac0d36-4722-4e87-8827-cfba27436cda', 3, '7e1fb17e-e48e-4298-be91-abf5a69e39d1', 0, NULL, '2023-08-31 18:44:24', '2023-08-31 18:44:24'),
('8a008f25-0041-48f8-83e4-c31184e52927', 4, '21a21f32-26f5-4985-8742-8f6f71950639', 0, NULL, '2023-09-30 19:12:03', '2023-09-30 19:12:03'),
('8a8ce314-9107-4b7d-842d-1071b7711bbe', 13, '62da7c40-54c1-4d8b-8f35-48bb3a7ca16c', 0, NULL, '2023-08-31 18:26:58', '2023-08-31 18:26:58'),
('8abcbee1-e57f-4f58-9ce4-e10e1c7d9337', 3, '16679b4a-d98d-4bc6-8d30-e994ea4c26e4', 1, '2023-10-29 05:25:21', '2023-10-29 05:25:20', '2023-10-29 05:25:21'),
('8c74abed-4277-483c-b73d-deea9292388e', 2, '0408e32d-a139-4805-8cb4-8906332d1dbd', 1, '2023-06-12 17:21:05', '2023-06-12 15:39:52', '2023-06-12 17:21:05'),
('8ca1bad0-b5cd-46d5-8034-944c4d4fdfd8', 9, '62da7c40-54c1-4d8b-8f35-48bb3a7ca16c', 0, NULL, '2023-08-31 18:26:58', '2023-08-31 18:26:58'),
('8f1c1f60-b133-458c-9f3c-9e4dd42ba569', 1, '9d2ed9a4-9f9b-4aab-b9be-d82639fbb2bc', 1, '2023-06-09 14:50:29', '2023-06-09 14:50:29', '2023-06-09 14:50:29'),
('8f44d73d-5336-49d8-8270-efce659207b8', 5, '67ddc55d-ce12-44b7-ac0a-04d5267f8ce5', 1, '2023-06-15 21:21:26', '2023-06-14 20:20:33', '2023-06-15 21:21:26'),
('8f8b8108-b24a-4358-b33e-c89d0b98de38', 4, '0408e32d-a139-4805-8cb4-8906332d1dbd', 1, '2023-06-12 19:38:51', '2023-06-12 15:39:52', '2023-06-12 19:38:51'),
('8fae816d-06e3-439d-8373-50999dfc49e0', 12, '041213e7-3310-4133-8671-66aefc8e8fdb', 0, NULL, '2023-08-31 18:56:17', '2023-08-31 18:56:17'),
('9078dd4a-7926-4be5-98cd-a1d3d8b3120e', 1, '7f3d1751-71e1-4aaa-8bb5-487ab093b75b', 1, '2023-10-01 05:34:52', '2023-10-01 05:34:52', '2023-10-01 05:34:52'),
('90c46da9-a70d-4f89-ad50-1ac9071a2a04', 6, '380cfc93-a7b9-44c2-8257-035a89eab1be', 0, NULL, '2023-08-31 18:51:17', '2023-08-31 18:51:17'),
('90d9ca5d-fcdd-4fa0-99ed-c3dd183d638d', 6, '0ea71326-7b16-4cbd-b4a6-8580304da7ab', 0, NULL, '2023-06-14 21:52:35', '2023-06-14 21:52:35'),
('912af151-d4a1-440f-9c29-07f268cbadbd', 7, '864d6599-5e96-4a36-8e47-21c43b8f3366', 0, NULL, '2023-09-04 09:42:14', '2023-09-04 09:42:14'),
('9166e644-c277-477c-8182-c3a9ae3456ef', 8, '62da7c40-54c1-4d8b-8f35-48bb3a7ca16c', 0, NULL, '2023-08-31 18:26:58', '2023-08-31 18:26:58'),
('916e41bd-67e8-4f24-9aeb-e7f09f6c48fd', 6, '5ae6ec90-851e-4896-9ea6-3587cb38bf53', 0, NULL, '2023-06-15 23:38:10', '2023-06-15 23:38:10'),
('91980098-9cc6-4956-b17d-bf8d162f7568', 6, '5c8faef0-69a1-40b3-ab56-2567c8c6e0e8', 0, NULL, '2023-10-02 06:01:02', '2023-10-02 06:01:02'),
('92299454-36ec-49ae-b519-551e80abd308', 4, '3f421e57-d054-490f-8043-f11f09478ae8', 0, NULL, '2023-08-31 18:30:27', '2023-08-31 18:30:27'),
('9304ad17-1170-4084-a205-0928854c1ba5', 9, '4c7561d3-a8f6-4f75-a791-e7ba3c62f736', 0, NULL, '2023-06-03 19:26:06', '2023-06-03 19:26:06'),
('9332b5b4-34de-4c21-b598-3d31d138de6b', 4, '23bf157b-09ef-4c3c-bbfe-b45b7154cc51', 1, '2023-06-02 19:25:51', '2023-06-02 14:17:42', '2023-06-02 19:25:51'),
('9376cfa1-e666-4614-a6f6-aea69ecdaf6a', 9, '16679b4a-d98d-4bc6-8d30-e994ea4c26e4', 0, NULL, '2023-10-29 05:25:20', '2023-10-29 05:25:20'),
('938bd1fe-c662-4e67-99b3-e49e7f45ba8a', 1, '504799fa-b789-4d71-a8dc-08c68276701d', 1, '2023-08-31 18:39:08', '2023-08-31 18:39:08', '2023-08-31 18:39:08'),
('93d4db5f-9dc1-44f7-b7cd-cd6eb712a4b4', 4, '62da7c40-54c1-4d8b-8f35-48bb3a7ca16c', 0, NULL, '2023-08-31 18:26:58', '2023-08-31 18:26:58'),
('942e79fb-c644-47b5-9a28-6f03ae5267a9', 4, '9d2ed9a4-9f9b-4aab-b9be-d82639fbb2bc', 1, '2023-06-09 17:53:11', '2023-06-09 14:50:29', '2023-06-09 17:53:11'),
('954f40c9-846c-4a1f-85e8-3b944fe78a33', 8, '2df9d10d-e450-4a5b-8a11-ddc8c6b87dcb', 0, NULL, '2023-06-03 19:34:06', '2023-06-03 19:34:06'),
('96770c6d-b8ef-405b-9a43-c1df4e92105b', 12, '2df9d10d-e450-4a5b-8a11-ddc8c6b87dcb', 0, NULL, '2023-06-03 19:34:06', '2023-06-03 19:34:06'),
('968395a9-92d2-481e-8575-093f1dad95e4', 12, '4c7561d3-a8f6-4f75-a791-e7ba3c62f736', 0, NULL, '2023-06-03 19:26:06', '2023-06-03 19:26:06'),
('968628e1-1bf9-4167-93c5-ae6ea9be73d0', 10, '35fcb1a9-89d7-455a-b80e-83d601e6218e', 0, NULL, '2023-06-15 23:30:10', '2023-06-15 23:30:10'),
('96a48155-8d18-484d-b6cc-d56770a5c5ab', 12, '11da7b8b-19c7-4d30-9c9f-fc005650bff2', 1, '2023-06-20 13:48:14', '2023-06-15 12:45:56', '2023-06-20 13:48:14'),
('973e88e2-df75-40db-a06d-df0c3f57f717', 2, 'b8d4fc7b-10cc-434f-b2ef-970fca4cd5a4', 1, '2023-06-15 23:33:01', '2023-06-14 20:09:49', '2023-06-15 23:33:01'),
('99044008-0c8d-4adf-bc32-9d271ba994db', 13, 'f01c58ec-781f-40de-bd1b-eecbb777f804', 0, NULL, '2023-09-04 09:42:41', '2023-09-04 09:42:41'),
('998cbd37-92b0-42f8-9c6f-15d68dd8998b', 2, '67ddc55d-ce12-44b7-ac0a-04d5267f8ce5', 1, '2023-06-15 17:36:56', '2023-06-14 20:20:33', '2023-06-15 17:36:56'),
('99d782fc-0a37-4dc9-aa3d-00ac64ef10b6', 7, '35fcb1a9-89d7-455a-b80e-83d601e6218e', 0, NULL, '2023-06-15 23:30:10', '2023-06-15 23:30:10'),
('9b04bef1-6626-46f9-b865-b63593c146f8', 2, '4c7561d3-a8f6-4f75-a791-e7ba3c62f736', 1, '2023-06-03 19:28:48', '2023-06-03 19:26:06', '2023-06-03 19:28:48'),
('9b8842f4-8661-41ab-999d-bbb2f8d1dcb7', 3, '17a07a82-e78d-4ef4-b993-c9fa349ead5a', 0, NULL, '2023-06-15 11:53:20', '2023-06-15 11:53:20'),
('9d079fe4-d04e-4cc5-9021-89b9f1940168', 1, '5ae6ec90-851e-4896-9ea6-3587cb38bf53', 1, '2023-06-15 23:38:10', '2023-06-15 23:38:10', '2023-06-15 23:38:10'),
('9d52e918-3f9f-4729-828f-07ffad451502', 4, '89ac443e-7fee-4b1f-9133-1e3788372e28', 0, NULL, '2023-06-03 19:25:16', '2023-06-03 19:25:16'),
('9dcd32b8-04cc-4ddd-86bd-cffa63c88035', 7, '5c8faef0-69a1-40b3-ab56-2567c8c6e0e8', 0, NULL, '2023-10-02 06:01:02', '2023-10-02 06:01:02'),
('9f7c68ba-837c-4dd7-b900-169c770e2c91', 2, '2538bf3d-56e1-4664-9c46-b8553e92d5b1', 0, NULL, '2023-08-31 18:47:57', '2023-08-31 18:47:57'),
('9f8de7bb-5641-404b-b2f2-c5e8c4b1f941', 6, '2df9d10d-e450-4a5b-8a11-ddc8c6b87dcb', 0, NULL, '2023-06-03 19:34:06', '2023-06-03 19:34:06'),
('9f913e10-d3e2-4303-814e-a3e65c1064d6', 12, '864d6599-5e96-4a36-8e47-21c43b8f3366', 0, NULL, '2023-09-04 09:42:14', '2023-09-04 09:42:14'),
('9ffbd727-b9d6-4553-8ee3-59b5e6057e03', 2, '3f421e57-d054-490f-8043-f11f09478ae8', 0, NULL, '2023-08-31 18:30:27', '2023-08-31 18:30:27'),
('a0063597-db77-4330-97cf-87bf8609af1a', 6, '8647e82e-0fc7-49fc-8305-e0cffd67ef86', 0, '2023-09-19 11:30:40', '2023-09-19 11:30:36', '2023-09-19 11:31:20'),
('a04186f0-8442-4d89-a436-2d938375364f', 12, '2538bf3d-56e1-4664-9c46-b8553e92d5b1', 0, NULL, '2023-08-31 18:47:57', '2023-08-31 18:47:57'),
('a04ca1d8-ad7f-4976-912b-5dde00ee2281', 11, 'dc242008-4b90-4ace-9943-6514a755427f', 0, NULL, '2023-10-07 14:47:53', '2023-10-07 14:47:53'),
('a080a150-149f-42fc-9bca-d1931998bd0b', 9, 'f01c58ec-781f-40de-bd1b-eecbb777f804', 0, NULL, '2023-09-04 09:42:41', '2023-09-04 09:42:41'),
('a172c9ac-f59f-45ab-ad31-17377039d32e', 6, '35fcb1a9-89d7-455a-b80e-83d601e6218e', 0, NULL, '2023-06-15 23:30:10', '2023-06-15 23:30:10'),
('a1d17362-bca6-4fb7-95fc-225d0d6065b2', 9, '17a07a82-e78d-4ef4-b993-c9fa349ead5a', 0, NULL, '2023-06-15 11:53:20', '2023-06-15 11:53:20'),
('a2012b2a-f73c-45e6-a9c2-d22b526ccd20', 11, 'b8d4fc7b-10cc-434f-b2ef-970fca4cd5a4', 0, NULL, '2023-06-14 20:09:49', '2023-06-14 20:09:49'),
('a32d1355-d78a-4c52-97dd-4203a9995aae', 10, '0ea71326-7b16-4cbd-b4a6-8580304da7ab', 0, NULL, '2023-06-14 21:52:35', '2023-06-14 21:52:35'),
('a368b859-9823-4864-98f5-cc88d512749e', 10, '8647e82e-0fc7-49fc-8305-e0cffd67ef86', 0, '2023-09-19 11:30:40', '2023-09-19 11:30:36', '2023-09-19 11:31:20'),
('a38a3e58-223f-4cd7-87e6-cce9a7cd0744', 5, '852e3b0f-a028-4fc3-99f6-6c3341337b44', 0, NULL, '2023-06-09 10:37:20', '2023-06-09 10:37:20'),
('a3d7a29c-0042-4dd2-abe0-4a4d77ebb0a3', 3, '4c7561d3-a8f6-4f75-a791-e7ba3c62f736', 0, NULL, '2023-06-03 19:26:06', '2023-06-03 19:26:06'),
('a4b05c4d-2ee0-48e5-af55-bf50dfa7488e', 6, '9d2ed9a4-9f9b-4aab-b9be-d82639fbb2bc', 1, '2023-06-09 17:53:11', '2023-06-09 14:50:29', '2023-06-09 17:53:11'),
('a4dbbe67-49fb-46c3-a282-4ec7ad2c6f72', 10, '2538bf3d-56e1-4664-9c46-b8553e92d5b1', 0, NULL, '2023-08-31 18:47:57', '2023-08-31 18:47:57'),
('a6188c04-0a54-45db-8e8d-3758e2cfd092', 9, '7e1fb17e-e48e-4298-be91-abf5a69e39d1', 0, NULL, '2023-08-31 18:44:24', '2023-08-31 18:44:24'),
('a7fea3bf-25d1-41d2-a713-984a1c804d00', 9, '286b4de1-5c50-414f-a64b-9262ded782cd', 1, '2023-06-15 10:43:48', '2023-06-12 15:03:12', '2023-06-15 10:43:48'),
('a8f78370-7413-4b7c-8109-af09cf3f74dd', 7, '380cfc93-a7b9-44c2-8257-035a89eab1be', 0, NULL, '2023-08-31 18:51:17', '2023-08-31 18:51:17'),
('a90e822f-0e9d-4798-aa63-d270a5839660', 4, '67ddc55d-ce12-44b7-ac0a-04d5267f8ce5', 1, '2023-06-15 21:21:20', '2023-06-14 20:20:33', '2023-06-15 21:21:20'),
('a95a1c93-5c57-4a70-92c2-68187e6d24ee', 11, '864d6599-5e96-4a36-8e47-21c43b8f3366', 0, NULL, '2023-09-04 09:42:14', '2023-09-04 09:42:14'),
('a9943983-cb16-430c-b78e-82edd6292390', 1, '0ea71326-7b16-4cbd-b4a6-8580304da7ab', 1, '2023-06-14 21:52:35', '2023-06-14 21:52:35', '2023-06-14 21:52:35'),
('a9a97741-90e3-459c-9344-7731833d9f7b', 8, '7f3d1751-71e1-4aaa-8bb5-487ab093b75b', 0, NULL, '2023-10-01 05:34:52', '2023-10-01 05:34:52'),
('aa5c65df-c549-48ca-b050-9488beb45362', 4, '2538bf3d-56e1-4664-9c46-b8553e92d5b1', 0, NULL, '2023-08-31 18:47:57', '2023-08-31 18:47:57'),
('aaf4af16-9e88-4695-b366-0aeedf119a0c', 1, '7e1fb17e-e48e-4298-be91-abf5a69e39d1', 1, '2023-08-31 18:44:24', '2023-08-31 18:44:24', '2023-08-31 18:44:24'),
('ac4e1c2c-9539-4183-9534-f06ea92b4322', 10, '5c8faef0-69a1-40b3-ab56-2567c8c6e0e8', 0, NULL, '2023-10-02 06:01:02', '2023-10-02 06:01:02'),
('ac5223b7-c2f4-4327-a8c3-8c305e074f24', 9, '185c422e-a4ce-445c-9b8c-00aa5b229af1', 0, NULL, '2023-06-15 21:02:45', '2023-06-15 21:02:45'),
('ac772e3c-a911-4923-b483-c6966dcce788', 6, '286b4de1-5c50-414f-a64b-9262ded782cd', 1, '2023-06-13 18:50:30', '2023-06-12 15:03:12', '2023-06-13 18:50:30'),
('ad26b5ca-064d-4c37-a1ce-48e7571ab1a5', 11, '89e40754-c1bc-41bf-b77d-25d89916c55f', 0, NULL, '2023-09-04 11:04:34', '2023-09-04 11:04:34'),
('ae603dfe-2109-4be3-9561-5116360991b1', 7, '852e3b0f-a028-4fc3-99f6-6c3341337b44', 0, NULL, '2023-06-09 10:37:20', '2023-06-09 10:37:20'),
('ae8f64a8-3f31-4d36-b648-c0fac794a117', 13, '185c422e-a4ce-445c-9b8c-00aa5b229af1', 0, NULL, '2023-06-15 21:02:45', '2023-06-15 21:02:45'),
('af6eb6b5-13e8-4f0d-b096-6b653b8cb77f', 3, '9d2ed9a4-9f9b-4aab-b9be-d82639fbb2bc', 1, '2023-06-09 17:53:11', '2023-06-09 14:50:29', '2023-06-09 17:53:11'),
('af8f34c1-8edc-4821-8257-da81d4618968', 2, '5c8faef0-69a1-40b3-ab56-2567c8c6e0e8', 0, NULL, '2023-10-02 06:01:02', '2023-10-02 06:01:02'),
('afc5fa32-306f-4931-b05c-263ea46eb045', 13, '17a07a82-e78d-4ef4-b993-c9fa349ead5a', 0, NULL, '2023-06-15 11:53:20', '2023-06-15 11:53:20'),
('b020cb17-8249-463d-bdba-8948b8780c63', 13, '11da7b8b-19c7-4d30-9c9f-fc005650bff2', 1, '2023-06-20 14:17:45', '2023-06-15 12:45:56', '2023-06-20 14:17:45'),
('b05c59a7-f9f9-4353-8088-8db274e16475', 13, '4c7561d3-a8f6-4f75-a791-e7ba3c62f736', 0, NULL, '2023-06-03 19:26:06', '2023-06-03 19:26:06'),
('b0e981f0-6902-4df5-a5c5-b5e99ed61a69', 1, '3f421e57-d054-490f-8043-f11f09478ae8', 1, '2023-08-31 18:30:27', '2023-08-31 18:30:27', '2023-08-31 18:30:27'),
('b21764ba-f154-4ce5-a4f6-99c33856789f', 5, '7f3d1751-71e1-4aaa-8bb5-487ab093b75b', 0, NULL, '2023-10-01 05:34:52', '2023-10-01 05:34:52'),
('b2b9bcb0-3d4f-48ba-a3d0-c87b16df148b', 10, 'dc242008-4b90-4ace-9943-6514a755427f', 0, NULL, '2023-10-07 14:47:53', '2023-10-07 14:47:53'),
('b3071cbd-65b4-47ad-8fe9-e064dd40f7a9', 13, 'c6f384a3-3f73-425a-bef3-a3156f252438', 1, '2023-06-02 13:04:47', '2023-06-01 12:41:44', '2023-06-02 13:04:48'),
('b34d13bb-ee07-4ae9-9033-6ad9b6502876', 7, '185c422e-a4ce-445c-9b8c-00aa5b229af1', 0, NULL, '2023-06-15 21:02:45', '2023-06-15 21:02:45'),
('b353c928-8451-4395-a80b-a7ab697ecbf7', 6, '852e3b0f-a028-4fc3-99f6-6c3341337b44', 0, NULL, '2023-06-09 10:37:20', '2023-06-09 10:37:20'),
('b41e6b75-79c5-4977-bf19-ccdf4d3a61b0', 12, '197e84e2-65a3-442d-9d55-fa369dab1b0d', 0, NULL, '2023-09-04 09:52:01', '2023-09-04 09:52:01'),
('b4f99c28-8338-44ea-850f-9ff07b43d233', 2, '864d6599-5e96-4a36-8e47-21c43b8f3366', 0, NULL, '2023-09-04 09:42:14', '2023-09-04 09:42:14'),
('b551200d-d5a4-421f-8f0a-016ed62c2dd4', 6, 'f01c58ec-781f-40de-bd1b-eecbb777f804', 0, NULL, '2023-09-04 09:42:41', '2023-09-04 09:42:41'),
('b57488d8-d090-4845-bf70-a4ebc5c6bdb8', 2, '35fcb1a9-89d7-455a-b80e-83d601e6218e', 0, NULL, '2023-06-15 23:30:10', '2023-06-15 23:30:10'),
('b5a25648-d919-4abd-90ad-c2a4d1f3ac3d', 1, '4c7561d3-a8f6-4f75-a791-e7ba3c62f736', 1, '2023-06-03 19:26:06', '2023-06-03 19:26:06', '2023-06-03 19:26:06'),
('b7abf104-8667-4e7f-8529-6bd2f8ad782c', 4, '864d6599-5e96-4a36-8e47-21c43b8f3366', 0, NULL, '2023-09-04 09:42:14', '2023-09-04 09:42:14'),
('b92aeb31-728c-41ee-b632-574f468ca736', 2, '7d763280-4954-4c88-9148-f4444a9bd516', 0, NULL, '2023-10-10 18:00:29', '2023-10-10 18:00:29'),
('b9a53bcc-101e-4bcb-a880-8cba235fecb6', 3, '864d6599-5e96-4a36-8e47-21c43b8f3366', 0, NULL, '2023-09-04 09:42:14', '2023-09-04 09:42:14'),
('ba70c42d-0c07-4660-a78e-1d8df7f6e808', 10, '286b4de1-5c50-414f-a64b-9262ded782cd', 1, '2023-06-15 12:15:09', '2023-06-12 15:03:12', '2023-06-15 12:15:09'),
('bb2034bc-d041-4777-9565-6d507848c2d6', 8, '89e40754-c1bc-41bf-b77d-25d89916c55f', 0, NULL, '2023-09-04 11:04:34', '2023-09-04 11:04:34'),
('bb543739-8d93-4343-bd9b-8bb1fd08e3cc', 9, '89ac443e-7fee-4b1f-9133-1e3788372e28', 0, NULL, '2023-06-03 19:25:16', '2023-06-03 19:25:16'),
('bb9058d5-cc01-484c-8e28-b569e4d8290f', 7, '5ae6ec90-851e-4896-9ea6-3587cb38bf53', 0, NULL, '2023-06-15 23:38:10', '2023-06-15 23:38:10'),
('bc6d617d-89aa-4829-8c7e-a84a1acd1e55', 10, '89e40754-c1bc-41bf-b77d-25d89916c55f', 0, NULL, '2023-09-04 11:04:34', '2023-09-04 11:04:34'),
('bd0b24a7-946d-4c6f-b168-19781c4de26e', 10, '2df9d10d-e450-4a5b-8a11-ddc8c6b87dcb', 0, NULL, '2023-06-03 19:34:06', '2023-06-03 19:34:06');
INSERT INTO `couriers` (`id`, `status`, `courierHandlerId`, `isCompleted`, `statusUpdatedAt`, `createdAt`, `updatedAt`) VALUES
('bd5508cb-7665-43ff-a789-c81e5fc70e99', 11, '9d2ed9a4-9f9b-4aab-b9be-d82639fbb2bc', 1, '2023-06-12 14:21:45', '2023-06-09 14:50:29', '2023-06-12 14:21:45'),
('bd9f62ab-3511-49a1-9611-f5059dc36c30', 4, '286b4de1-5c50-414f-a64b-9262ded782cd', 1, '2023-06-12 16:21:16', '2023-06-12 15:03:12', '2023-06-12 16:21:16'),
('bdadb7a6-90dc-4a64-9974-f0a519fd0cb4', 11, '197e84e2-65a3-442d-9d55-fa369dab1b0d', 0, NULL, '2023-09-04 09:52:01', '2023-09-04 09:52:01'),
('bdc1bb94-6f40-4708-bf3f-8b712a0eaf85', 11, '21a21f32-26f5-4985-8742-8f6f71950639', 0, NULL, '2023-09-30 19:12:03', '2023-09-30 19:12:03'),
('be3c2f07-19d3-40d4-af3d-ba7636914049', 8, '185c422e-a4ce-445c-9b8c-00aa5b229af1', 0, NULL, '2023-06-15 21:02:45', '2023-06-15 21:02:45'),
('bf295e7c-4078-4eb0-ac13-e8ff925bb099', 1, '852e3b0f-a028-4fc3-99f6-6c3341337b44', 1, '2023-06-09 10:37:20', '2023-06-09 10:37:20', '2023-06-09 10:37:20'),
('c03675ba-68ef-43cc-8dc8-7f44df440217', 12, '8647e82e-0fc7-49fc-8305-e0cffd67ef86', 0, '2023-09-19 11:30:40', '2023-09-19 11:30:36', '2023-09-19 11:31:20'),
('c041045e-e0cf-4ef6-b60a-cde6670318e5', 11, '041213e7-3310-4133-8671-66aefc8e8fdb', 0, NULL, '2023-08-31 18:56:17', '2023-08-31 18:56:17'),
('c0f847a2-817c-4c63-8866-99865cf47867', 13, '23bf157b-09ef-4c3c-bbfe-b45b7154cc51', 0, NULL, '2023-06-02 14:17:42', '2023-06-02 14:17:42'),
('c149816a-9c0c-4a0a-8be0-49078e622522', 6, '89ac443e-7fee-4b1f-9133-1e3788372e28', 0, NULL, '2023-06-03 19:25:16', '2023-06-03 19:25:16'),
('c14a826c-bdca-4fcc-9f6b-22e3c82285bf', 12, '89e40754-c1bc-41bf-b77d-25d89916c55f', 0, NULL, '2023-09-04 11:04:34', '2023-09-04 11:04:34'),
('c2563342-5b36-4f7f-8d2e-0f56e846ebe0', 11, '89ac443e-7fee-4b1f-9133-1e3788372e28', 0, NULL, '2023-06-03 19:25:16', '2023-06-03 19:25:16'),
('c274b4c2-39ab-40a2-a98b-bd83dbac6d0f', 2, 'cc8600e7-49b9-42f7-b2ca-80f8245b5c9e', 1, '2023-05-31 15:50:37', '2023-05-31 13:02:58', '2023-05-31 15:50:37'),
('c297120f-a4a7-4c0d-b010-2263145097a4', 6, 'cc8600e7-49b9-42f7-b2ca-80f8245b5c9e', 1, '2023-05-31 15:50:56', '2023-05-31 13:02:58', '2023-05-31 15:50:56'),
('c299e6a2-e1f7-4c75-942a-44e84fc42d81', 13, '89ac443e-7fee-4b1f-9133-1e3788372e28', 0, NULL, '2023-06-03 19:25:16', '2023-06-03 19:25:16'),
('c3024c0a-4b04-4967-9b73-e41a0984d2a7', 1, '89ac443e-7fee-4b1f-9133-1e3788372e28', 1, '2023-06-03 19:25:16', '2023-06-03 19:25:16', '2023-06-03 19:25:16'),
('c38fa450-c3fa-427a-add4-b9f5aa2336fc', 3, '7f3d1751-71e1-4aaa-8bb5-487ab093b75b', 0, NULL, '2023-10-01 05:34:52', '2023-10-01 05:34:52'),
('c39804ad-2504-4bbc-93e6-6ae3c961dde3', 12, '67ddc55d-ce12-44b7-ac0a-04d5267f8ce5', 0, NULL, '2023-06-14 20:20:33', '2023-06-14 20:20:33'),
('c3b764f0-fcfc-456c-87e4-68fca4654d82', 8, '23bf157b-09ef-4c3c-bbfe-b45b7154cc51', 1, '2023-06-02 19:25:51', '2023-06-02 14:17:42', '2023-06-02 19:25:51'),
('c3bb8e45-839d-4950-82af-8fabe3751843', 12, '21a21f32-26f5-4985-8742-8f6f71950639', 0, NULL, '2023-09-30 19:12:03', '2023-09-30 19:12:03'),
('c467a619-cbdd-4d26-9e39-cbfc1ce9cd0c', 5, '8647e82e-0fc7-49fc-8305-e0cffd67ef86', 0, '2023-09-19 11:30:40', '2023-09-19 11:30:36', '2023-09-19 11:31:20'),
('c4921a4a-60b9-4915-9d93-eb5ef44d555a', 7, 'f2646515-f3e3-4d6b-9945-34fad472057d', 0, NULL, '2023-10-07 14:50:06', '2023-10-07 14:50:06'),
('c59622d1-bb9a-4e48-919a-36732e68ab8b', 5, '23bf157b-09ef-4c3c-bbfe-b45b7154cc51', 1, '2023-06-02 19:25:51', '2023-06-02 14:17:42', '2023-06-02 19:25:51'),
('c59eccd4-580e-47d0-bb66-a536d1991000', 8, '11da7b8b-19c7-4d30-9c9f-fc005650bff2', 1, '2023-06-15 17:49:33', '2023-06-15 12:45:56', '2023-06-15 17:49:33'),
('c64d406c-24a0-478a-a82c-c6d66d1ad403', 1, 'f01c58ec-781f-40de-bd1b-eecbb777f804', 1, '2023-09-04 09:42:41', '2023-09-04 09:42:41', '2023-09-04 09:42:41'),
('c6e77d00-0c44-4f6e-bd98-7dc0fb528036', 7, '4c7561d3-a8f6-4f75-a791-e7ba3c62f736', 0, NULL, '2023-06-03 19:26:06', '2023-06-03 19:26:06'),
('c829d6c0-9d71-41d2-816d-e4141988b62b', 4, 'f2646515-f3e3-4d6b-9945-34fad472057d', 0, NULL, '2023-10-07 14:50:06', '2023-10-07 14:50:06'),
('c83eb448-0e48-4b3d-86c5-6bb48245094d', 2, '380cfc93-a7b9-44c2-8257-035a89eab1be', 0, NULL, '2023-08-31 18:51:17', '2023-08-31 18:51:17'),
('c889f123-bf5c-4b94-9f35-4bb9fe1bffd6', 7, '21a21f32-26f5-4985-8742-8f6f71950639', 0, NULL, '2023-09-30 19:12:03', '2023-09-30 19:12:03'),
('c9c6d4a8-4b75-4040-8d46-ac6ea7d90ec5', 5, '0ea71326-7b16-4cbd-b4a6-8580304da7ab', 0, NULL, '2023-06-14 21:52:35', '2023-06-14 21:52:35'),
('c9ca5110-13af-45bc-8ac1-faaa999aefe6', 8, '864d6599-5e96-4a36-8e47-21c43b8f3366', 0, NULL, '2023-09-04 09:42:14', '2023-09-04 09:42:14'),
('c9f51fa3-a2bc-4c38-b3ad-c46ca97ecdad', 2, '286b4de1-5c50-414f-a64b-9262ded782cd', 1, '2023-06-12 16:21:14', '2023-06-12 15:03:12', '2023-06-12 16:21:14'),
('caf6a23b-e5d3-488c-82e8-638eb66916ad', 10, '504799fa-b789-4d71-a8dc-08c68276701d', 0, NULL, '2023-08-31 18:39:08', '2023-08-31 18:39:08'),
('cd0cfe76-a2a5-4d70-a4be-1986575e1b55', 8, 'cc8600e7-49b9-42f7-b2ca-80f8245b5c9e', 1, '2023-06-01 08:33:44', '2023-05-31 13:02:58', '2023-06-01 08:33:44'),
('cd6c7d85-96b7-4408-9e2d-f79995acfdb1', 4, 'c6f384a3-3f73-425a-bef3-a3156f252438', 1, '2023-06-01 16:17:13', '2023-06-01 12:41:44', '2023-06-01 16:17:13'),
('cd948e31-8c24-4c9f-a940-32bc3f70da48', 6, '7f3d1751-71e1-4aaa-8bb5-487ab093b75b', 0, NULL, '2023-10-01 05:34:52', '2023-10-01 05:34:52'),
('cdc39266-eb65-4c67-a6ff-f87f15ca1c11', 2, '62da7c40-54c1-4d8b-8f35-48bb3a7ca16c', 0, NULL, '2023-08-31 18:26:58', '2023-08-31 18:26:58'),
('cddfe55c-fd75-42a8-8ef8-e36b3368f3b4', 7, '67ddc55d-ce12-44b7-ac0a-04d5267f8ce5', 1, '2023-06-15 21:21:32', '2023-06-14 20:20:33', '2023-06-15 21:21:32'),
('ce091384-c88f-4190-a5a6-1fe769c4ccf0', 3, 'b8d4fc7b-10cc-434f-b2ef-970fca4cd5a4', 0, NULL, '2023-06-14 20:09:49', '2023-06-14 20:09:49'),
('ce18a241-b402-4b97-be99-7e9ae2eb5224', 13, '7f3d1751-71e1-4aaa-8bb5-487ab093b75b', 0, NULL, '2023-10-01 05:34:52', '2023-10-01 05:34:52'),
('ceb5f690-0a4f-4666-a964-b724461c104f', 3, '7d763280-4954-4c88-9148-f4444a9bd516', 0, NULL, '2023-10-10 18:00:29', '2023-10-10 18:00:29'),
('ceceaa93-717f-4a73-83e4-f6c2a23e9b93', 7, '7e1fb17e-e48e-4298-be91-abf5a69e39d1', 0, NULL, '2023-08-31 18:44:24', '2023-08-31 18:44:24'),
('d2ca6ac7-f4ee-4a14-8df3-794b26ecabde', 7, 'cc8600e7-49b9-42f7-b2ca-80f8245b5c9e', 1, '2023-06-01 08:33:39', '2023-05-31 13:02:58', '2023-06-01 08:33:40'),
('d43419e3-01af-46ad-85c3-fc5e4d215e7f', 3, '3f421e57-d054-490f-8043-f11f09478ae8', 0, NULL, '2023-08-31 18:30:27', '2023-08-31 18:30:27'),
('d4ba1429-b03f-4973-8832-cdfa3807d19e', 9, '9d2ed9a4-9f9b-4aab-b9be-d82639fbb2bc', 1, '2023-06-12 14:21:45', '2023-06-09 14:50:29', '2023-06-12 14:21:45'),
('d4cd0383-0e75-463e-9d78-5c6a04a11571', 8, '5c8faef0-69a1-40b3-ab56-2567c8c6e0e8', 0, NULL, '2023-10-02 06:01:02', '2023-10-02 06:01:02'),
('d53bb5b7-9342-40b1-a15e-1c099ab13590', 8, '89ac443e-7fee-4b1f-9133-1e3788372e28', 0, NULL, '2023-06-03 19:25:16', '2023-06-03 19:25:16'),
('d5e3853a-37af-4555-9b9c-4e3f43f6df34', 11, '3f421e57-d054-490f-8043-f11f09478ae8', 0, NULL, '2023-08-31 18:30:27', '2023-08-31 18:30:27'),
('d63dcccd-a016-4d9e-9259-ff16259df6bb', 2, 'f2646515-f3e3-4d6b-9945-34fad472057d', 1, '2023-10-07 15:00:12', '2023-10-07 14:50:06', '2023-10-07 15:00:12'),
('d7b3bdfe-2fbc-45c0-b627-91244c01cd95', 10, '380cfc93-a7b9-44c2-8257-035a89eab1be', 0, NULL, '2023-08-31 18:51:17', '2023-08-31 18:51:17'),
('d7d3727f-8235-4de4-ac9b-b3cd6d0855f2', 6, '17a07a82-e78d-4ef4-b993-c9fa349ead5a', 0, NULL, '2023-06-15 11:53:20', '2023-06-15 11:53:20'),
('d810c437-27c6-40dd-b570-c14b349309b5', 5, '504799fa-b789-4d71-a8dc-08c68276701d', 0, NULL, '2023-08-31 18:39:08', '2023-08-31 18:39:08'),
('d85f8399-f569-4639-bac2-1932cc53da9a', 8, '197e84e2-65a3-442d-9d55-fa369dab1b0d', 0, NULL, '2023-09-04 09:52:01', '2023-09-04 09:52:01'),
('d867886a-635c-4cd1-91e4-5b4f05f84b08', 11, '16679b4a-d98d-4bc6-8d30-e994ea4c26e4', 0, NULL, '2023-10-29 05:25:20', '2023-10-29 05:25:20'),
('d89c494a-c5e0-47a7-b05d-e63ce10d9fc4', 1, '7d763280-4954-4c88-9148-f4444a9bd516', 1, '2023-10-10 18:00:29', '2023-10-10 18:00:29', '2023-10-10 18:00:29'),
('d9027663-d3e9-4e79-adee-5d0a2ba8e351', 7, '197e84e2-65a3-442d-9d55-fa369dab1b0d', 0, NULL, '2023-09-04 09:52:01', '2023-09-04 09:52:01'),
('d92e5e8a-341e-4c26-8a43-c85a74ca3b2e', 5, '4c7561d3-a8f6-4f75-a791-e7ba3c62f736', 0, NULL, '2023-06-03 19:26:06', '2023-06-03 19:26:06'),
('d9a4ecd4-4d95-4419-af8e-330c9554726d', 7, '0ea71326-7b16-4cbd-b4a6-8580304da7ab', 0, NULL, '2023-06-14 21:52:35', '2023-06-14 21:52:35'),
('da804459-7fcb-4ea1-8794-432125b86254', 4, '852e3b0f-a028-4fc3-99f6-6c3341337b44', 0, NULL, '2023-06-09 10:37:20', '2023-06-09 10:37:20'),
('dac3aff6-df65-43bb-9b08-2705ae3d4b76', 12, '504799fa-b789-4d71-a8dc-08c68276701d', 0, NULL, '2023-08-31 18:39:08', '2023-08-31 18:39:08'),
('db40dd0c-d51b-4004-bb70-d14f01a6dff0', 3, '504799fa-b789-4d71-a8dc-08c68276701d', 0, NULL, '2023-08-31 18:39:08', '2023-08-31 18:39:08'),
('db8dac22-3f07-4cf0-8102-bfff8842aa2d', 1, '5c8faef0-69a1-40b3-ab56-2567c8c6e0e8', 1, '2023-10-02 06:01:02', '2023-10-02 06:01:02', '2023-10-02 06:01:02'),
('dbdb0216-e49b-4ac8-8491-223ee158a912', 7, 'b8d4fc7b-10cc-434f-b2ef-970fca4cd5a4', 0, NULL, '2023-06-14 20:09:49', '2023-06-14 20:09:49'),
('dbf503ed-6f7c-4d03-bd29-d27ff043b1cf', 1, '041213e7-3310-4133-8671-66aefc8e8fdb', 1, '2023-08-31 18:56:17', '2023-08-31 18:56:17', '2023-08-31 18:56:17'),
('dc08d528-75b1-44a1-937f-7c4a58b690c1', 3, 'f2646515-f3e3-4d6b-9945-34fad472057d', 0, NULL, '2023-10-07 14:50:06', '2023-10-07 14:50:06'),
('dc27af4c-e4e3-4f8c-bd23-04bbf45e2e4f', 1, '380cfc93-a7b9-44c2-8257-035a89eab1be', 1, '2023-08-31 18:51:17', '2023-08-31 18:51:17', '2023-08-31 18:51:17'),
('dccd4556-034c-4ec8-a634-ea688162945b', 2, 'dc242008-4b90-4ace-9943-6514a755427f', 0, NULL, '2023-10-07 14:47:53', '2023-10-07 14:47:53'),
('dd12899a-6fee-4a24-9a08-3164e4359a57', 7, '3f421e57-d054-490f-8043-f11f09478ae8', 0, NULL, '2023-08-31 18:30:27', '2023-08-31 18:30:27'),
('dd176b68-b1ec-44c6-93c6-df44561e1034', 1, '2df9d10d-e450-4a5b-8a11-ddc8c6b87dcb', 1, '2023-06-03 19:34:06', '2023-06-03 19:34:06', '2023-06-03 19:34:06'),
('ddb6226d-88cc-48e0-b585-65cfac874d2e', 5, '9d2ed9a4-9f9b-4aab-b9be-d82639fbb2bc', 1, '2023-06-09 17:53:11', '2023-06-09 14:50:29', '2023-06-09 17:53:11'),
('dde13d76-656c-46d6-b464-5fa3979818d6', 4, '89e40754-c1bc-41bf-b77d-25d89916c55f', 0, NULL, '2023-09-04 11:04:34', '2023-09-04 11:04:34'),
('ddfb7cb7-afa9-48f1-9665-9029008a3a10', 12, '7d763280-4954-4c88-9148-f4444a9bd516', 0, NULL, '2023-10-10 18:00:29', '2023-10-10 18:00:29'),
('e01ffbfc-0624-439f-9b54-d54bb03a5dc9', 5, 'cc8600e7-49b9-42f7-b2ca-80f8245b5c9e', 1, '2023-05-31 15:50:51', '2023-05-31 13:02:58', '2023-05-31 15:50:51'),
('e10c9d24-d80a-482d-a758-a2712a5d3673', 9, '89e40754-c1bc-41bf-b77d-25d89916c55f', 0, NULL, '2023-09-04 11:04:34', '2023-09-04 11:04:34'),
('e13f9773-7c81-4b35-8248-989b6a58c347', 1, '185c422e-a4ce-445c-9b8c-00aa5b229af1', 1, '2023-06-15 21:02:45', '2023-06-15 21:02:45', '2023-06-15 21:02:45'),
('e1e9933e-f26e-4a3d-8dfa-285c890ce0f3', 8, '4c7561d3-a8f6-4f75-a791-e7ba3c62f736', 0, NULL, '2023-06-03 19:26:06', '2023-06-03 19:26:06'),
('e21ab468-f29a-4a30-885f-9993751337e4', 5, '5ae6ec90-851e-4896-9ea6-3587cb38bf53', 0, NULL, '2023-06-15 23:38:10', '2023-06-15 23:38:10'),
('e227379b-652b-4427-ba12-41bb8debf8f5', 3, 'cc8600e7-49b9-42f7-b2ca-80f8245b5c9e', 1, '2023-05-31 15:50:39', '2023-05-31 13:02:58', '2023-05-31 15:50:39'),
('e3127f7d-20ba-406e-ba17-98da27f1b026', 2, '89e40754-c1bc-41bf-b77d-25d89916c55f', 1, '2023-09-04 12:19:40', '2023-09-04 11:04:34', '2023-09-04 12:19:40'),
('e472dd81-233f-487e-9bbb-866e26b19eaf', 1, '62da7c40-54c1-4d8b-8f35-48bb3a7ca16c', 1, '2023-08-31 18:26:58', '2023-08-31 18:26:58', '2023-08-31 18:26:58'),
('e528f5e2-1744-411a-89e2-21e53639e7db', 3, '286b4de1-5c50-414f-a64b-9262ded782cd', 1, '2023-06-12 16:21:14', '2023-06-12 15:03:12', '2023-06-12 16:21:14'),
('e5e1257f-5ebb-4005-839e-89041c6e296b', 9, '21a21f32-26f5-4985-8742-8f6f71950639', 0, NULL, '2023-09-30 19:12:03', '2023-09-30 19:12:03'),
('e5fc6c45-7560-4a22-bfac-d9fa7c74222e', 6, '3f421e57-d054-490f-8043-f11f09478ae8', 0, NULL, '2023-08-31 18:30:27', '2023-08-31 18:30:27'),
('e69e27e1-bf90-45ed-aa59-bf5c84cf6105', 9, 'cc8600e7-49b9-42f7-b2ca-80f8245b5c9e', 1, '2023-06-01 08:33:48', '2023-05-31 13:02:58', '2023-06-01 08:33:48'),
('e749e7e8-2737-4c2f-8f17-21c1da699af1', 9, '8647e82e-0fc7-49fc-8305-e0cffd67ef86', 0, '2023-09-19 11:30:40', '2023-09-19 11:30:36', '2023-09-19 11:31:20'),
('e7c85267-e7c8-4d46-8e81-a33cf741a76c', 10, 'f01c58ec-781f-40de-bd1b-eecbb777f804', 0, NULL, '2023-09-04 09:42:41', '2023-09-04 09:42:41'),
('e7e75ffe-bb38-4d59-a91c-522f41364a24', 10, '4c7561d3-a8f6-4f75-a791-e7ba3c62f736', 0, NULL, '2023-06-03 19:26:06', '2023-06-03 19:26:06'),
('e868e3ea-f07d-4256-b69d-0c68ec5e2e8e', 10, '041213e7-3310-4133-8671-66aefc8e8fdb', 0, NULL, '2023-08-31 18:56:17', '2023-08-31 18:56:17'),
('e8f95bcd-c70e-496b-a5fc-eab996c65523', 4, '185c422e-a4ce-445c-9b8c-00aa5b229af1', 0, NULL, '2023-06-15 21:02:45', '2023-06-15 21:02:45'),
('e9f12776-4336-4b9c-a1bc-f6a899214b58', 10, '9d2ed9a4-9f9b-4aab-b9be-d82639fbb2bc', 1, '2023-06-12 14:21:45', '2023-06-09 14:50:29', '2023-06-12 14:21:45'),
('ea00634b-0c24-468d-8253-5a514d30928b', 3, '041213e7-3310-4133-8671-66aefc8e8fdb', 0, NULL, '2023-08-31 18:56:17', '2023-08-31 18:56:17'),
('ea2eca53-18a6-442b-bdab-0b6b16be5ca7', 12, '7f3d1751-71e1-4aaa-8bb5-487ab093b75b', 0, NULL, '2023-10-01 05:34:52', '2023-10-01 05:34:52'),
('ea339733-7d4d-46f1-8d8b-2dd930753ed4', 3, '11da7b8b-19c7-4d30-9c9f-fc005650bff2', 1, '2023-06-15 16:11:36', '2023-06-15 12:45:56', '2023-06-15 16:11:36'),
('eaa09e41-e1bd-4c41-b590-b3043272592a', 6, '62da7c40-54c1-4d8b-8f35-48bb3a7ca16c', 0, NULL, '2023-08-31 18:26:58', '2023-08-31 18:26:58'),
('eaf7c980-b8c0-4949-b563-c65e2c8cb577', 11, '8647e82e-0fc7-49fc-8305-e0cffd67ef86', 0, '2023-09-19 11:30:40', '2023-09-19 11:30:36', '2023-09-19 11:31:20'),
('eb523f6d-d2f0-4888-80e3-1417d8b45a03', 13, 'dc242008-4b90-4ace-9943-6514a755427f', 0, NULL, '2023-10-07 14:47:53', '2023-10-07 14:47:53'),
('eb79d73b-ca50-49eb-92df-7f436a52f380', 13, '380cfc93-a7b9-44c2-8257-035a89eab1be', 0, NULL, '2023-08-31 18:51:17', '2023-08-31 18:51:17'),
('eca5037f-338a-4bb8-a446-5148592a1cfd', 4, 'b8d4fc7b-10cc-434f-b2ef-970fca4cd5a4', 0, NULL, '2023-06-14 20:09:49', '2023-06-14 20:09:49'),
('ecbb9975-7517-4a69-bd6a-a18d4d78e826', 3, '35fcb1a9-89d7-455a-b80e-83d601e6218e', 0, NULL, '2023-06-15 23:30:10', '2023-06-15 23:30:10'),
('ed229ae5-3fad-4a6c-b4f3-87e3dbab2b71', 2, '185c422e-a4ce-445c-9b8c-00aa5b229af1', 0, NULL, '2023-06-15 21:02:45', '2023-06-15 21:02:45'),
('eeb4503c-9fa6-44a6-91b8-e3d0de0fac34', 7, 'f01c58ec-781f-40de-bd1b-eecbb777f804', 0, NULL, '2023-09-04 09:42:41', '2023-09-04 09:42:41'),
('eeb900e3-2333-458a-ac8d-41fe6fcb4794', 4, '197e84e2-65a3-442d-9d55-fa369dab1b0d', 0, NULL, '2023-09-04 09:52:01', '2023-09-04 09:52:01'),
('efbcc890-a8bd-452e-acea-b1f823cff512', 13, '7e1fb17e-e48e-4298-be91-abf5a69e39d1', 0, NULL, '2023-08-31 18:44:24', '2023-08-31 18:44:24'),
('efc08cac-3362-4005-8439-166a756346e2', 3, '852e3b0f-a028-4fc3-99f6-6c3341337b44', 0, NULL, '2023-06-09 10:37:20', '2023-06-09 10:37:20'),
('f0544e0a-c432-4a65-9779-cf86460e34bc', 13, 'b8d4fc7b-10cc-434f-b2ef-970fca4cd5a4', 0, NULL, '2023-06-14 20:09:49', '2023-06-14 20:09:49'),
('f09beb4b-a844-42df-b7db-8d0b88a769b2', 12, '5c8faef0-69a1-40b3-ab56-2567c8c6e0e8', 0, NULL, '2023-10-02 06:01:02', '2023-10-02 06:01:02'),
('f0ad0c35-4cc2-4c93-9000-1196b1b35585', 1, '197e84e2-65a3-442d-9d55-fa369dab1b0d', 1, '2023-09-04 09:52:01', '2023-09-04 09:52:01', '2023-09-04 09:52:01'),
('f0ba4bed-460f-466b-8d03-af5260992517', 8, '35fcb1a9-89d7-455a-b80e-83d601e6218e', 0, NULL, '2023-06-15 23:30:10', '2023-06-15 23:30:10'),
('f185a880-6310-4832-86e1-c70753477973', 2, '21a21f32-26f5-4985-8742-8f6f71950639', 1, '2023-09-30 19:12:23', '2023-09-30 19:12:03', '2023-09-30 19:12:23'),
('f1b253ad-63cc-499c-81fc-3906b5c017b6', 10, '7f3d1751-71e1-4aaa-8bb5-487ab093b75b', 0, NULL, '2023-10-01 05:34:52', '2023-10-01 05:34:52'),
('f1ef564c-5e73-40a2-a19e-e2d0d4020cdf', 6, '7e1fb17e-e48e-4298-be91-abf5a69e39d1', 0, NULL, '2023-08-31 18:44:24', '2023-08-31 18:44:24'),
('f2082b26-978f-4833-8d27-f1daa42a8668', 5, '7d763280-4954-4c88-9148-f4444a9bd516', 0, NULL, '2023-10-10 18:00:29', '2023-10-10 18:00:29'),
('f2bded16-a124-41bd-9bf0-aa88d2322ef3', 13, '197e84e2-65a3-442d-9d55-fa369dab1b0d', 0, NULL, '2023-09-04 09:52:01', '2023-09-04 09:52:01'),
('f340c802-ae11-4707-91b2-88b3f38ff388', 9, '3f421e57-d054-490f-8043-f11f09478ae8', 0, NULL, '2023-08-31 18:30:27', '2023-08-31 18:30:27'),
('f39c9b57-8163-4da2-9a51-75558bf88129', 7, '504799fa-b789-4d71-a8dc-08c68276701d', 0, NULL, '2023-08-31 18:39:08', '2023-08-31 18:39:08'),
('f3cf0aaa-e515-46c6-a965-394c33452b57', 9, '5c8faef0-69a1-40b3-ab56-2567c8c6e0e8', 0, NULL, '2023-10-02 06:01:02', '2023-10-02 06:01:02'),
('f3e23325-432f-494a-b34a-303d9d46734a', 5, '2df9d10d-e450-4a5b-8a11-ddc8c6b87dcb', 0, NULL, '2023-06-03 19:34:06', '2023-06-03 19:34:06'),
('f40251e3-c633-4794-96d0-791a9981e0fc', 8, '852e3b0f-a028-4fc3-99f6-6c3341337b44', 0, NULL, '2023-06-09 10:37:20', '2023-06-09 10:37:20'),
('f4f125de-697c-49cf-8b2c-e66390fa8b66', 9, 'dc242008-4b90-4ace-9943-6514a755427f', 0, NULL, '2023-10-07 14:47:53', '2023-10-07 14:47:53'),
('f50467c4-6728-4d84-b104-a8d7e1bf68ad', 3, '89ac443e-7fee-4b1f-9133-1e3788372e28', 0, NULL, '2023-06-03 19:25:16', '2023-06-03 19:25:16'),
('f5c6ee7e-89f7-41e6-b266-6f5a4d28302d', 5, 'b8d4fc7b-10cc-434f-b2ef-970fca4cd5a4', 0, NULL, '2023-06-14 20:09:49', '2023-06-14 20:09:49'),
('f5e950a2-a631-4f70-8301-a7b465323ccd', 13, '16679b4a-d98d-4bc6-8d30-e994ea4c26e4', 0, NULL, '2023-10-29 05:25:20', '2023-10-29 05:25:20'),
('f6ce7f70-7a61-4fe0-b6aa-d5d2db5475da', 3, '67ddc55d-ce12-44b7-ac0a-04d5267f8ce5', 1, '2023-06-15 19:10:12', '2023-06-14 20:20:33', '2023-06-15 19:10:12'),
('f6de0100-fdd9-4464-863a-2bf24dc7f7ec', 10, '21a21f32-26f5-4985-8742-8f6f71950639', 0, NULL, '2023-09-30 19:12:03', '2023-09-30 19:12:03'),
('f6e91065-c741-4aa4-a55f-340d829d10bd', 9, '197e84e2-65a3-442d-9d55-fa369dab1b0d', 0, NULL, '2023-09-04 09:52:01', '2023-09-04 09:52:01'),
('f6ec2af2-a004-4e0b-b018-5c9180d3596c', 1, '11da7b8b-19c7-4d30-9c9f-fc005650bff2', 1, '2023-06-15 12:45:56', '2023-06-15 12:45:56', '2023-06-15 12:45:56'),
('f70e5bc1-8c4e-44c1-9006-fe14b1dd9cc4', 9, 'b8d4fc7b-10cc-434f-b2ef-970fca4cd5a4', 0, NULL, '2023-06-14 20:09:49', '2023-06-14 20:09:49'),
('f88b369d-edcc-4622-963e-b43ff5583a6c', 11, '35fcb1a9-89d7-455a-b80e-83d601e6218e', 0, NULL, '2023-06-15 23:30:10', '2023-06-15 23:30:10'),
('f942132f-a009-4259-950e-fa35c727e9c4', 8, '7e1fb17e-e48e-4298-be91-abf5a69e39d1', 0, NULL, '2023-08-31 18:44:24', '2023-08-31 18:44:24'),
('fb9a4938-e35d-4aac-8f8a-08b9d80c568f', 2, '2df9d10d-e450-4a5b-8a11-ddc8c6b87dcb', 0, NULL, '2023-06-03 19:34:06', '2023-06-03 19:34:06'),
('fc9edb89-5c70-417f-9ead-6ddeb2a6ee1a', 13, '2538bf3d-56e1-4664-9c46-b8553e92d5b1', 0, NULL, '2023-08-31 18:47:57', '2023-08-31 18:47:57'),
('fdeee7aa-306b-47f5-8cbb-ff9b5b9c04be', 2, '041213e7-3310-4133-8671-66aefc8e8fdb', 0, NULL, '2023-08-31 18:56:17', '2023-08-31 18:56:17'),
('fe5136f1-e4ca-4f1b-878f-b06293f8c3b1', 10, '852e3b0f-a028-4fc3-99f6-6c3341337b44', 0, NULL, '2023-06-09 10:37:20', '2023-06-09 10:37:20'),
('fe987d44-d5d4-4502-9f0e-20e353bb94d5', 8, '17a07a82-e78d-4ef4-b993-c9fa349ead5a', 0, NULL, '2023-06-15 11:53:20', '2023-06-15 11:53:20');

-- --------------------------------------------------------

--
-- Table structure for table `courier_handlers`
--

CREATE TABLE `courier_handlers` (
  `id` char(36) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `userId` char(36) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `name` varchar(255) NOT NULL,
  `loadNumber` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courier_handlers`
--

INSERT INTO `courier_handlers` (`id`, `userId`, `name`, `loadNumber`, `createdAt`, `updatedAt`) VALUES
('0408e32d-a139-4805-8cb4-8906332d1dbd', '2758ac56-f4ae-43b4-a5a3-ff7d219eec23', 'Spot', 'S1739993', '2023-06-12 15:39:52', '2023-06-12 15:39:52'),
('041213e7-3310-4133-8671-66aefc8e8fdb', '3d1de6cf-82fd-4200-a559-72e10f33d428', 'Muhammad USama', '444', '2023-08-31 18:56:17', '2023-08-31 18:56:17'),
('0ea71326-7b16-4cbd-b4a6-8580304da7ab', '44375a7e-a11b-4150-b70b-cdd0844e75f3', 'Tall Grass Freight ', '309630', '2023-06-14 21:52:35', '2023-06-14 21:52:35'),
('11da7b8b-19c7-4d30-9c9f-fc005650bff2', 'e4354f09-2e5e-4942-8a4d-da5599594718', 'Ryan', '3605441', '2023-06-15 12:45:56', '2023-06-15 12:45:56'),
('16679b4a-d98d-4bc6-8d30-e994ea4c26e4', '66435935-1a2a-4a51-830d-fbcda0bda39a', 'vv', 'vvv', '2023-10-29 05:25:20', '2023-10-29 05:25:20'),
('17a07a82-e78d-4ef4-b993-c9fa349ead5a', '732158ad-524d-4c41-8cce-9d42c9890604', 'Tallgrass', '309630', '2023-06-15 11:53:20', '2023-06-15 11:53:20'),
('185c422e-a4ce-445c-9b8c-00aa5b229af1', '2758ac56-f4ae-43b4-a5a3-ff7d219eec23', 'Central Creek', '159515', '2023-06-15 21:02:45', '2023-06-15 21:02:45'),
('197e84e2-65a3-442d-9d55-fa369dab1b0d', '3d1de6cf-82fd-4200-a559-72e10f33d428', 'Muhammad Usama', '887', '2023-09-04 09:52:01', '2023-09-04 09:52:01'),
('21a21f32-26f5-4985-8742-8f6f71950639', '53ba4cb0-d97d-4edb-88e5-b7693448140b', 'jhbbkbk', '58756876', '2023-09-30 19:12:03', '2023-09-30 19:12:03'),
('23bf157b-09ef-4c3c-bbfe-b45b7154cc51', '2758ac56-f4ae-43b4-a5a3-ff7d219eec23', 'PFL', 'LD43661', '2023-06-02 14:17:42', '2023-06-02 14:17:42'),
('2538bf3d-56e1-4664-9c46-b8553e92d5b1', '3d1de6cf-82fd-4200-a559-72e10f33d428', 'Muhammad SUama', '666', '2023-08-31 18:47:57', '2023-08-31 18:47:57'),
('286b4de1-5c50-414f-a64b-9262ded782cd', 'e4354f09-2e5e-4942-8a4d-da5599594718', 'BFS LOGISTICS', '1135404', '2023-06-12 15:03:12', '2023-06-12 15:03:12'),
('2df9d10d-e450-4a5b-8a11-ddc8c6b87dcb', 'b502a7ef-fe11-46e3-86d3-3cbc9c7ec015', 'it master', '0020', '2023-06-03 19:34:06', '2023-06-03 19:34:06'),
('35fcb1a9-89d7-455a-b80e-83d601e6218e', '32120af5-4a53-4fa7-9889-df84d032c57c', 'Tall Grass Freight ', '309902', '2023-06-15 23:30:10', '2023-06-15 23:30:10'),
('380cfc93-a7b9-44c2-8257-035a89eab1be', '3d1de6cf-82fd-4200-a559-72e10f33d428', 'Muhammad SUama', '555', '2023-08-31 18:51:17', '2023-08-31 18:51:17'),
('3f421e57-d054-490f-8043-f11f09478ae8', '3d1de6cf-82fd-4200-a559-72e10f33d428', 'Muhammad Usama', '9900', '2023-08-31 18:30:27', '2023-08-31 18:30:27'),
('4c7561d3-a8f6-4f75-a791-e7ba3c62f736', 'b502a7ef-fe11-46e3-86d3-3cbc9c7ec015', 'Test driver', '0040', '2023-06-03 19:26:06', '2023-06-03 19:26:06'),
('504799fa-b789-4d71-a8dc-08c68276701d', '3d1de6cf-82fd-4200-a559-72e10f33d428', 'It master', '696', '2023-08-31 18:39:08', '2023-08-31 18:39:08'),
('5ae6ec90-851e-4896-9ea6-3587cb38bf53', 'a28520fb-d82b-4369-b962-fa6329ffca7b', 'BCB', '0358545', '2023-06-15 23:38:10', '2023-06-15 23:38:10'),
('5c8faef0-69a1-40b3-ab56-2567c8c6e0e8', 'dda6f9f5-befb-4398-97f0-728ead20a440', 'Clever', '1234', '2023-10-02 06:01:02', '2023-10-02 06:01:02'),
('62da7c40-54c1-4d8b-8f35-48bb3a7ca16c', '3d1de6cf-82fd-4200-a559-72e10f33d428', 'Muhammad Usama', '8899', '2023-08-31 18:26:58', '2023-08-31 18:26:58'),
('67ddc55d-ce12-44b7-ac0a-04d5267f8ce5', 'a28520fb-d82b-4369-b962-fa6329ffca7b', 'Fitzmark', '60105267836', '2023-06-14 20:20:33', '2023-06-14 20:20:33'),
('7d763280-4954-4c88-9148-f4444a9bd516', 'ec70c5fb-6539-4d26-bdf0-42f4bbc42649', 'CHR', '1251', '2023-10-10 18:00:29', '2023-10-10 18:00:29'),
('7e1fb17e-e48e-4298-be91-abf5a69e39d1', '3d1de6cf-82fd-4200-a559-72e10f33d428', 'muhammad usama', '778', '2023-08-31 18:44:24', '2023-08-31 18:44:24'),
('7f3d1751-71e1-4aaa-8bb5-487ab093b75b', 'cdf7ae37-ec07-4751-a47b-2f7b1a2c4f66', 'ATS', '4321', '2023-10-01 05:34:52', '2023-10-01 05:34:52'),
('852e3b0f-a028-4fc3-99f6-6c3341337b44', 'b502a7ef-fe11-46e3-86d3-3cbc9c7ec015', 'Usama', '10', '2023-06-09 10:37:20', '2023-06-09 10:37:20'),
('8647e82e-0fc7-49fc-8305-e0cffd67ef86', 'f052be27-58d6-4157-9f01-6d765d42b835', 'dbdb', 'bddb', '2023-09-19 11:30:36', '2023-09-19 11:30:36'),
('864d6599-5e96-4a36-8e47-21c43b8f3366', '3d1de6cf-82fd-4200-a559-72e10f33d428', 'Muhammad Usama', '889', '2023-09-04 09:42:14', '2023-09-04 09:42:14'),
('89ac443e-7fee-4b1f-9133-1e3788372e28', 'b502a7ef-fe11-46e3-86d3-3cbc9c7ec015', 'Test driver', '0030', '2023-06-03 19:25:16', '2023-06-03 19:25:16'),
('89e40754-c1bc-41bf-b77d-25d89916c55f', 'dda6f9f5-befb-4398-97f0-728ead20a440', 'Elon', 'Musk', '2023-09-04 11:04:34', '2023-09-04 11:04:34'),
('9d2ed9a4-9f9b-4aab-b9be-d82639fbb2bc', 'e4354f09-2e5e-4942-8a4d-da5599594718', 'DIF', '104693', '2023-06-09 14:50:29', '2023-06-09 14:50:29'),
('b8d4fc7b-10cc-434f-b2ef-970fca4cd5a4', '32120af5-4a53-4fa7-9889-df84d032c57c', 'Priority1', '60105267836', '2023-06-14 20:09:49', '2023-06-14 20:09:49'),
('c6f384a3-3f73-425a-bef3-a3156f252438', '2758ac56-f4ae-43b4-a5a3-ff7d219eec23', 'LOGISTICS ELEMENTS INC', '101128705', '2023-06-01 12:41:44', '2023-06-01 12:41:44'),
('cc8600e7-49b9-42f7-b2ca-80f8245b5c9e', '2758ac56-f4ae-43b4-a5a3-ff7d219eec23', 'Edge', '0593905', '2023-05-31 13:02:58', '2023-05-31 13:02:58'),
('dc242008-4b90-4ace-9943-6514a755427f', '282818fb-30b5-426e-9613-a4e9c29c12c7', 'NorAg', '200123', '2023-10-07 14:47:53', '2023-10-07 14:47:53'),
('f01c58ec-781f-40de-bd1b-eecbb777f804', '3d1de6cf-82fd-4200-a559-72e10f33d428', 'Muhammad Usama', '888', '2023-09-04 09:42:41', '2023-09-04 09:42:41'),
('f2646515-f3e3-4d6b-9945-34fad472057d', '282818fb-30b5-426e-9613-a4e9c29c12c7', 'Southland', '2001212', '2023-10-07 14:50:06', '2023-10-07 14:50:06');

-- --------------------------------------------------------

--
-- Table structure for table `rate_cons`
--

CREATE TABLE `rate_cons` (
  `id` char(36) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `courierHandlerId` char(36) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `userId` char(36) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `document` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `companyId` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `brokerEmail` varchar(255) DEFAULT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `email2` varchar(256) DEFAULT NULL,
  `email3` varchar(256) DEFAULT NULL,
  `email4` varchar(256) DEFAULT NULL,
  `email5` varchar(256) DEFAULT NULL,
  `send_files_to_email` tinyint(1) NOT NULL DEFAULT '1',
  `notes` longtext,
  `merge_rate_and_bol` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rate_cons`
--

INSERT INTO `rate_cons` (`id`, `courierHandlerId`, `userId`, `document`, `createdAt`, `updatedAt`, `companyId`, `brokerEmail`, `hidden`, `email2`, `email3`, `email4`, `email5`, `send_files_to_email`, `notes`, `merge_rate_and_bol`) VALUES
('1afd4e9b-8960-4e63-ba53-b49edd7d6d51', '380cfc93-a7b9-44c2-8257-035a89eab1be', '3d1de6cf-82fd-4200-a559-72e10f33d428', 'ratecon_1693507875144-Muhammad Usama-July-23.pdf', '2023-08-31 18:51:17', '2023-08-31 18:51:17', '2c89e25a-cfc5-4eb6-8ee7-b55982c8ab3f', 'mgujjargamingm@gmail.com', 0, '', '', '', '', 1, NULL, 1),
('1ddfa036-831d-4d23-8cce-7967b22cf16f', '7d763280-4954-4c88-9148-f4444a9bd516', 'ec70c5fb-6539-4d26-bdf0-42f4bbc42649', 'ratecon_1696960827737-TRIP 4536 1251963856 DHL FREIGHT.pdf', '2023-10-10 18:00:29', '2023-10-10 18:00:29', '1af0bb09-e8ee-4262-bf3d-cac4b5166e64', 'pnguyen@npkfreightllc.com', 0, '', '', '', '', 1, '', 1),
('2251df6d-8bbf-4d94-b624-94c72c094c8d', 'f2646515-f3e3-4d6b-9945-34fad472057d', '282818fb-30b5-426e-9613-a4e9c29c12c7', 'ratecon_1696690201262-confirmation.263255.pdf', '2023-10-07 14:50:06', '2023-10-07 14:50:06', '80245935-b171-4c9b-a3cc-2accc84fdfcb', 'marcsmueller@gmail.com', 0, '', '', '', '', 1, 'Load 200212', 1),
('4c26b40b-9e6e-4829-908f-a2afffa982e2', 'dc242008-4b90-4ace-9943-6514a755427f', '282818fb-30b5-426e-9613-a4e9c29c12c7', 'ratecon_1696690039436-confirmation.263255.pdf', '2023-10-07 14:47:53', '2023-10-07 14:48:47', '80245935-b171-4c9b-a3cc-2accc84fdfcb', 'marcsmueller@gmail.com', 1, '', '', '', '', 1, '', 1),
('57b68197-cfdb-4ae7-8d71-485628a968bd', '89e40754-c1bc-41bf-b77d-25d89916c55f', 'dda6f9f5-befb-4398-97f0-728ead20a440', 'ratecon_1693825472953-ratecon_1693145564901-dummy.pdf', '2023-09-04 11:04:34', '2023-09-04 11:04:34', '6ed84e53-1b06-49ae-a125-6a3769839379', '', 0, '', '', '', '', 1, 'This is a test', 1),
('5b7c370c-ec0d-4a91-9468-4ad17167cc12', '852e3b0f-a028-4fc3-99f6-6c3341337b44', 'b502a7ef-fe11-46e3-86d3-3cbc9c7ec015', '1686307039692-converted (13).pdf', '2023-06-09 10:37:20', '2023-06-09 10:37:20', '2c89e25a-cfc5-4eb6-8ee7-b55982c8ab3f', 'shopultimate4@gmail.com', 0, '', '', '', '', 1, NULL, 1),
('5cef2a4b-e204-44c3-a96b-7a526c435128', '5c8faef0-69a1-40b3-ab56-2567c8c6e0e8', 'dda6f9f5-befb-4398-97f0-728ead20a440', 'ratecon_1696226426442-NTG RATE CONFIRMATION  1234.pdf', '2023-10-02 06:01:02', '2023-10-02 06:01:02', '6ed84e53-1b06-49ae-a125-6a3769839379', '', 0, '', '', '', '', 1, '', 1),
('6e000a7d-0544-43ce-9dc0-639ca5c231d6', '21a21f32-26f5-4985-8742-8f6f71950639', '53ba4cb0-d97d-4edb-88e5-b7693448140b', 'ratecon_1696101103314-rate.pdf', '2023-09-30 19:12:03', '2023-09-30 19:12:03', 'c2982463-1157-49d3-bd85-ce2290ce1be7', 'sarmadsami.ss@gmail.com', 0, '', '', '', '', 1, 'jkbkjbkjb\nhhbhjbh\nhbkjbkj', 1),
('8b7e9ccc-c973-4f9e-812d-1d55628142af', '2538bf3d-56e1-4664-9c46-b8553e92d5b1', '3d1de6cf-82fd-4200-a559-72e10f33d428', 'ratecon_1693507675661-FSD-HA (2).pdf', '2023-08-31 18:47:57', '2023-08-31 18:47:57', '2c89e25a-cfc5-4eb6-8ee7-b55982c8ab3f', 'mgujjargamingm@gmail.com', 0, '', '', '', '', 1, NULL, 1),
('98d063f5-6e28-4288-ad5e-9bde04c6e344', '89ac443e-7fee-4b1f-9133-1e3788372e28', 'b502a7ef-fe11-46e3-86d3-3cbc9c7ec015', '1685820311721-SamplePDF.pdf', '2023-06-03 19:25:16', '2023-06-09 11:15:01', '2c89e25a-cfc5-4eb6-8ee7-b55982c8ab3f', 'musamam234@gmail.com', 1, '', '', '', '', 1, NULL, 1),
('9c1e895f-061f-4594-b4ac-f2849557525e', '62da7c40-54c1-4d8b-8f35-48bb3a7ca16c', '3d1de6cf-82fd-4200-a559-72e10f33d428', 'ratecon_1693506417162-Muhammad Usama-July-23.pdf', '2023-08-31 18:26:58', '2023-08-31 18:26:58', '2c89e25a-cfc5-4eb6-8ee7-b55982c8ab3f', 'mgujjargamingm@gmail.com', 0, '', '', '', '', 1, NULL, 1),
('b7be7ae0-ba29-4406-aa32-50347bf2e135', '7e1fb17e-e48e-4298-be91-abf5a69e39d1', '3d1de6cf-82fd-4200-a559-72e10f33d428', 'ratecon_1693507461438-Muhammad Usama-July-23.pdf', '2023-08-31 18:44:24', '2023-08-31 18:44:24', '2c89e25a-cfc5-4eb6-8ee7-b55982c8ab3f', 'mgujjargamingm@gmail.com', 0, '', '', '', '', 1, NULL, 1),
('ba532d6a-f89c-4825-8f46-930c388e4b26', '7f3d1751-71e1-4aaa-8bb5-487ab093b75b', 'cdf7ae37-ec07-4751-a47b-2f7b1a2c4f66', 'ratecon_1696138490675-NTG RATE CONFIRMATION # 1234.pdf', '2023-10-01 05:34:52', '2023-10-01 05:34:52', '6ed84e53-1b06-49ae-a125-6a3769839379', '', 0, '', '', '', '', 1, '', 1),
('bbd64f96-d00f-4ec1-9c2f-0d518178bd04', '4c7561d3-a8f6-4f75-a791-e7ba3c62f736', 'b502a7ef-fe11-46e3-86d3-3cbc9c7ec015', '1685820311721-SamplePDF.pdf', '2023-06-03 19:26:06', '2023-06-09 11:28:32', '2c89e25a-cfc5-4eb6-8ee7-b55982c8ab3f', 'musamam234@gmail.com', 1, '', '', '', '', 1, NULL, 1),
('beef5cf7-004c-4a8f-8028-abea63f37168', '0ea71326-7b16-4cbd-b4a6-8580304da7ab', '44375a7e-a11b-4150-b70b-cdd0844e75f3', '1686779553678-309630 Rate Confirmation.pdf', '2023-06-14 21:52:35', '2023-06-15 07:34:00', '09fa4e2a-91ca-4107-ba45-ae079317c080', 'jimmyo@tallgrassfreight.com', 0, '', '', '', '', 1, NULL, 1),
('c2f8821a-fb89-4091-8288-1afe37007dc0', '504799fa-b789-4d71-a8dc-08c68276701d', '3d1de6cf-82fd-4200-a559-72e10f33d428', 'ratecon_1693507147007-FSD-HA (2).pdf', '2023-08-31 18:39:08', '2023-08-31 18:39:08', '2c89e25a-cfc5-4eb6-8ee7-b55982c8ab3f', 'mgujjargamingm@gmail.com', 0, '', '', '', '', 1, NULL, 1),
('c403a97c-fc46-4cdd-a588-e2062da75559', '041213e7-3310-4133-8671-66aefc8e8fdb', '3d1de6cf-82fd-4200-a559-72e10f33d428', 'ratecon_1693508176448-Muhammad Usama-July-23.pdf', '2023-08-31 18:56:17', '2023-08-31 18:56:17', '2c89e25a-cfc5-4eb6-8ee7-b55982c8ab3f', 'mgujjargamingm@gmail.com', 0, '', '', '', '', 1, NULL, 1),
('cd35d5b2-a392-4c15-8fc2-2805423595cc', '2df9d10d-e450-4a5b-8a11-ddc8c6b87dcb', 'b502a7ef-fe11-46e3-86d3-3cbc9c7ec015', '1685820842207-FileName.pdf', '2023-06-03 19:34:06', '2023-06-03 19:34:06', '2c89e25a-cfc5-4eb6-8ee7-b55982c8ab3f', 'itmasterusama@gmail.com', 0, '', '', '', '', 1, NULL, 1),
('d313611f-63f4-45ba-bbc5-3864e220ca60', 'b8d4fc7b-10cc-434f-b2ef-970fca4cd5a4', '32120af5-4a53-4fa7-9889-df84d032c57c', '1686773355823-Carrier_Rate_Confirmation_60105267836.pdf', '2023-06-14 20:09:49', '2023-06-15 11:34:52', '09fa4e2a-91ca-4107-ba45-ae079317c080', 'tdfreightsolutions@priority1inc.net', 1, '', '', '', '', 1, NULL, 1),
('faf3713f-0d0e-4e1c-bbb3-c3f18e0b2c2e', '3f421e57-d054-490f-8043-f11f09478ae8', '3d1de6cf-82fd-4200-a559-72e10f33d428', 'ratecon_1693506626465-FSD-HA (2).pdf', '2023-08-31 18:30:27', '2023-08-31 18:30:27', '2c89e25a-cfc5-4eb6-8ee7-b55982c8ab3f', 'musamam234@gmail.com', 0, '', '', '', '', 1, NULL, 1),
('fec54633-1773-4b5a-8c4d-08bb4cf32839', '197e84e2-65a3-442d-9d55-fa369dab1b0d', '3d1de6cf-82fd-4200-a559-72e10f33d428', 'ratecon_1693820531460-FSD-HA (2).pdf', '2023-09-04 09:52:01', '2023-09-04 09:52:01', '2c89e25a-cfc5-4eb6-8ee7-b55982c8ab3f', 'mgujjargamingm@gmail.com', 0, '', '', '', '', 1, 'These are the notes', 1),
('fff0ed57-341e-43d6-b8b9-307d030bb957', '67ddc55d-ce12-44b7-ac0a-04d5267f8ce5', 'a28520fb-d82b-4369-b962-fa6329ffca7b', '1686774023175-1286960_Load_Confirmation_1435.pdf', '2023-06-14 20:20:33', '2023-06-14 20:20:33', '09fa4e2a-91ca-4107-ba45-ae079317c080', 'chrismiller@fitzmark.com', 0, '', '', '', '', 1, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` char(36) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `isAdmin` tinyint(1) NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `mcNumber` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `fcm` longtext,
  `timezone` varchar(255) DEFAULT NULL,
  `l_name` varchar(255) DEFAULT NULL,
  `otp` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `isAdmin`, `createdAt`, `updatedAt`, `mcNumber`, `phone`, `fcm`, `timezone`, `l_name`, `otp`) VALUES
('1eecbd42-60a7-4638-9ed6-18052e7c728d', 'Reginald', 'Reggie_eoexpress@yahoo.com', '$2b$12$Aa/X/gctJKnj0nyqsWsvWeOwPWhfjT9UW/fx2RsYbYVqyOVae.ynu', 0, '2023-06-05 02:36:10', '2023-06-05 02:36:10', '1012063', '469-594-1821', 'dk0PY5qEgEedkaxxnPlJhQ:APA91bGbgjo0cpvkjNJdL9jEKFDeNwuk6f2JIqYAr1DXVn_Qy1mYG9tCXbIdi11NB_h6SWvtnN4CZY16ZfL3HJdOd5rfMK254AV83pTTQh2qxbqItVXniTf-oksgtv9iEc3JDw5Cg_mp', 'America/Chicago', 'Clark', NULL),
('2758ac56-f4ae-43b4-a5a3-ff7d219eec23', 'Michael', 'Michaeltroyrivers@gmail.com', '$2b$12$afnKAAiL2Xte2KXJ1sah5u0TS5n65wPj.nbZVrenDAqzsSC7.3ATq', 0, '2023-05-16 13:36:52', '2023-05-16 13:36:52', '1012063', '2147262507', 'erD1IABmTUXuhGUrgQwP_L:APA91bHdy3OcYQRUE9X7U3-nXIxv-H4I27NrHyHj-SDUkBzE7dOzYyA5McC9RkZaanBoQsuEP8KK0V4Z3vQ-vdi3mtfffK0gauQIcO512N5DrHIF9HdTugUgPLnzHrDvoic1byTngaiO', 'America/Chicago', 'Rivers', NULL),
('282818fb-30b5-426e-9613-a4e9c29c12c7', 'Marc', 'marc@mysupertransport.com', '$2b$12$VWQ4JrRNfgeHt7V7Vn0mFO7geOzLrx3iBBPjXplDvf9CXBKLC56Ra', 0, '2023-10-07 14:44:53', '2023-10-07 14:59:06', '788425', '8166561279', 'fISq-sirTk61K89NWeDpIs:APA91bEHlV0wnq5mJfvuBEXA17RzdPYpyExO_CDkJOUoJ2sBpBeEMQCjUKCl8k6qBrzvl8MU0oSBeqLF58UqsqJXU_gqxUpBNmaKUc1ejPd72GN9-4mIZHrmAf_Uyb4cbDJOJFFHO73u', 'America/Chicago', 'Mueller', NULL),
('28d0b9a6-6c87-4997-a735-11b15fd6baea', 'Emmanuel', 'Emma_702@yahoo.com', '$2b$12$7lHl1QWlhhP1Yuk/XKhygOnvaXhromNrOTxF/DbbErKEG1yLFN4FO', 0, '2023-06-05 02:39:37', '2023-06-05 02:39:37', '1012063', '+1 (806) 239-3124', 'dk0PY5qEgEedkaxxnPlJhQ:APA91bGbgjo0cpvkjNJdL9jEKFDeNwuk6f2JIqYAr1DXVn_Qy1mYG9tCXbIdi11NB_h6SWvtnN4CZY16ZfL3HJdOd5rfMK254AV83pTTQh2qxbqItVXniTf-oksgtv9iEc3JDw5Cg_mp', 'America/Chicago', 'Onyenwere', NULL),
('32120af5-4a53-4fa7-9889-df84d032c57c', 'Jesse ', 'Moralesjessem7@gmail.com', '$2b$12$ILWbU83IaqJILSOPPr2vYOilwaZx/A9auVV1NlYEJs6jQprFZHV2y', 0, '2023-06-14 19:55:44', '2023-06-15 23:32:04', '069513', '+19452178541', 'cIAbHwPmS2aqWyhokZJcWI:APA91bHtx1pnqkXeIOMsGppwqoY2xZXvXjmvwRMrzp3fJTYwE0daFcLQQ15gvfs4wAaR37JYaqLtxkW8YqpD9GkeyrWZUTpzlgiogqLXmOZC9sUkbROQ8fAKhRN3_SHFuTQhsWfNFV13', 'Europe/London', 'Morales', NULL),
('326bd736-6951-456a-895d-898f99744f10', 'Lee', 'Leejonesedward@gmail.com', '$2b$12$8P1adruThN50uPFdjs2STOmE2JT6uCdyUiJuxIaTMZo1GmGjZpmza', 0, '2023-06-05 02:37:18', '2023-06-05 02:37:18', '1012063', '(469) 968-1106', 'dk0PY5qEgEedkaxxnPlJhQ:APA91bGbgjo0cpvkjNJdL9jEKFDeNwuk6f2JIqYAr1DXVn_Qy1mYG9tCXbIdi11NB_h6SWvtnN4CZY16ZfL3HJdOd5rfMK254AV83pTTQh2qxbqItVXniTf-oksgtv9iEc3JDw5Cg_mp', 'America/Chicago', 'Jones', NULL),
('3d1de6cf-82fd-4200-a559-72e10f33d428', 'It', 'musamam786@gmail.com', '$2b$12$xiZUEPWDUpKGZ4dAaePcWOpWkqEwB1hNV3x7KaRBRGYOKm.nFE2pO', 0, '2023-08-31 18:24:16', '2023-09-01 07:38:10', '00110011', '11111111', 'dLuXYKzAT7u4DOSs0TYl0g:APA91bG9OTDt5mMTelQzwt8E-MvOew7VpBlYIcdxItcJnWqO16JDqhFcozjUI3Mwp6GsVY_PD4ASrGqNKXBj9gqOjelTNj0zmxW7weGZp65BWb2UaIPjFEZdAUXPH5ysMDvt_geLNHRq', 'Asia/Karachi', 'Master', NULL),
('3eb447c6-b60d-4d94-ad52-7b289f27b863', 'It', 'itmasterusama@gmail.com', '$2b$12$2Ctl5mH8XD/i9mCOjUy8FOSVkAMqwqH7wXCQe0bjc/BvaXV7hc1vC', 0, '2023-08-31 18:21:30', '2023-08-31 18:21:30', '11111111', '11111111', 'abc', 'Asia/Karachi', 'Master', NULL),
('44375a7e-a11b-4150-b70b-cdd0844e75f3', 'Corey', 'Coreywilliamtruck75@gmail.com', '$2b$12$ILcwCZRl2DmonHKay5G4xOmgaS9w5T6QV4iu7leNiioFgaojlGM0y', 0, '2023-06-14 21:33:53', '2023-06-14 21:33:53', '069513', '+18173900179', 'cIAbHwPmS2aqWyhokZJcWI:APA91bHtx1pnqkXeIOMsGppwqoY2xZXvXjmvwRMrzp3fJTYwE0daFcLQQ15gvfs4wAaR37JYaqLtxkW8YqpD9GkeyrWZUTpzlgiogqLXmOZC9sUkbROQ8fAKhRN3_SHFuTQhsWfNFV13', 'Europe/London', 'Williams ', NULL),
('48851ca9-be72-44a3-8ec4-2390f9533d24', 'Leonard', 'Leonardldaniels@gmail.com', '$2b$12$p5ytQuuFNWaKmUfKSZYvu.mJfuRtN961mdJxWbAPwEh4YzMFlcMSW', 0, '2023-06-05 02:40:47', '2023-06-05 02:40:47', '1012063', '(817) 513-3987', 'dk0PY5qEgEedkaxxnPlJhQ:APA91bGbgjo0cpvkjNJdL9jEKFDeNwuk6f2JIqYAr1DXVn_Qy1mYG9tCXbIdi11NB_h6SWvtnN4CZY16ZfL3HJdOd5rfMK254AV83pTTQh2qxbqItVXniTf-oksgtv9iEc3JDw5Cg_mp', 'America/Chicago', 'Daniels', NULL),
('53ba4cb0-d97d-4edb-88e5-b7693448140b', 's', 's@s.com', '$2b$12$rbS2wq6sxXf7GDvX7erQxu7/iah1g.MS0JlBSLBEU2SJlORi2fTS2', 0, '2023-08-31 07:08:32', '2023-09-30 19:07:30', '11223344', '456546456435', 'd3g6ISenQ0mwYSkZThDqcY:APA91bFKfLMRyqjMp3uHRTm99BJJ5ySn5Vj7qcZIA8FYEgZ8gQor3Gn6tcdogIvHIFtVbFX0w5y-0EoFqTXFy4AMbNMQbXdUgMwLQt9Aq0Sb830fVxWLXHFnvzDnV0UKj7UQXUPAVcKw', 'Asia/Karachi', 's', NULL),
('657cc6a8-ae55-4a48-b47a-05c62d7c8487', 'Muhammad', 'musamam234@gmail.com', '$2b$12$CcZ7wi8kQAxs6KEC4a9xSOOOgZxFHp3PsCO5z9fa0i1khhvydWmIa', 0, '2023-08-31 16:06:56', '2023-09-01 07:37:53', '11111111', '11111111', 'dLuXYKzAT7u4DOSs0TYl0g:APA91bG9OTDt5mMTelQzwt8E-MvOew7VpBlYIcdxItcJnWqO16JDqhFcozjUI3Mwp6GsVY_PD4ASrGqNKXBj9gqOjelTNj0zmxW7weGZp65BWb2UaIPjFEZdAUXPH5ysMDvt_geLNHRq', 'Asia/Karachi', 'Usama', NULL),
('66435935-1a2a-4a51-830d-fbcda0bda39a', 'bbb', 'bbv@gmail.com', '$2b$12$2KPZE8YwyfnmA9QrcKzE9.jIWOgckPPV03ZQCsnze73HKHVgYAUPy', 0, '2023-10-29 05:25:09', '2023-10-29 05:25:09', '', '776666666', 'fonhyxYiakzAm9luXuV-vi:APA91bHg1xMXdptAysIVuNhhu2VEEYvHd-aNRbU88E3iIlhtC72tEShhI5JEFa2F2DJwFUa8On3ANa07YT_NyVmrr6JKtAUaTkPW6v4ptqapboONVxTyt2IvW9HY6Ve7kSmyxS4LH3ig', 'Asia/Karachi', '   ', NULL),
('69ecafc3-c1c2-4c5d-b98f-60f3f1e3afc1', 'Ada', 'Ada.obiri@dikestrollc.com', '$2b$12$a7oPzCIdl4xtApPXnSsE4.FnW7oauQHH0PvYjpwILy0IhJWdyIjyW', 0, '2023-06-14 16:09:06', '2023-06-14 16:09:06', '069513', '6825031444', 'cIAbHwPmS2aqWyhokZJcWI:APA91bHtx1pnqkXeIOMsGppwqoY2xZXvXjmvwRMrzp3fJTYwE0daFcLQQ15gvfs4wAaR37JYaqLtxkW8YqpD9GkeyrWZUTpzlgiogqLXmOZC9sUkbROQ8fAKhRN3_SHFuTQhsWfNFV13', 'Europe/London', 'Obiri', NULL),
('6a4f7d2a-68c1-451c-bafd-7873a84bba1a', 'Olu', 'Otoye@noabros.com', '$2b$12$hMN6ocv.q7uEA1G2.tOjKeyejHYkrAGNgbqXCYAuL3jOAnWBsdl5S', 0, '2023-09-13 15:11:06', '2023-09-13 15:11:06', '1012063', '6822528880', 'abc', 'America/Chicago', 'Test', NULL),
('732158ad-524d-4c41-8cce-9d42c9890604', 'Corey ', 'Coreywilliamstruck75@gmail.com', '$2b$12$PS0aSmdxmFUChIrzg4TjdOzuUJvi8WBzX6BhQQwQSG6LbN3yQJwT6', 0, '2023-06-15 11:48:23', '2023-06-15 11:48:23', '069513', '18173900179', 'cIAbHwPmS2aqWyhokZJcWI:APA91bHtx1pnqkXeIOMsGppwqoY2xZXvXjmvwRMrzp3fJTYwE0daFcLQQ15gvfs4wAaR37JYaqLtxkW8YqpD9GkeyrWZUTpzlgiogqLXmOZC9sUkbROQ8fAKhRN3_SHFuTQhsWfNFV13', 'Europe/London', 'Williams', NULL),
('92188d62-fb18-4de5-8686-a81d0fe27a88', 'Michael', 'Rucker6773@gmail.com', '$2b$12$9NAUmzYONfIiH0impAPN8.uk9fWq9MtiK3elk6dGL5f0041HCiTB2', 0, '2023-06-05 02:34:00', '2023-08-19 17:28:40', '1012063', '+1 (972) 639-1227', 'c1BmkkgYd0B-uv6FKXlseR:APA91bFfza2MewDWC6UNUl1BeV4DsSQAgDW15f6u6EqDo2XYmEHFQLuWNgMzRS8GzCVUblds_UERIcdSYgjmOM42dTDUWxGROQ-rLZkDvFBxBzXYMoRXKANq_Hn_juWntfWt02Qz4ujw', 'America/Chicago', 'Rucker', NULL),
('975e1fa4-b576-4717-a37d-50c3f7b24ade', 'Daniel', 'dannyirene6769@gmail.com', '$2b$12$K1TBQudqHGz1s0srVqcnfOfWoOz.fIuG3B/tI4WsMprAx6OAuf5M.', 0, '2023-05-18 19:15:22', '2023-05-18 19:15:22', '1012063', '+12546337338', 'fHUFKNlENEE-hVMtj9yKmD:APA91bGGNs8-9wCLxUUVp10zPuL26mAE5ygnxtHoMvoPl_pu72CPAlLimM60Zt5x6Sjkko5jX707zrBMwBfzgm0EQUrd85lNiipZDIBGOqjSp3ElQDtAsB92TsIJWD8YSjL9NLGQlKh-', 'America/Chicago', 'Moreno', NULL),
('a28520fb-d82b-4369-b962-fa6329ffca7b', 'Christopher ', 'Scaggs459@gmail.com', '$2b$12$lyPLaZ2An8JAQs7ce5GD5ux/76X3cCmxDIY5J5CVUvQJiUykl8ceG', 0, '2023-06-14 19:57:35', '2023-06-15 23:39:06', '069513', '+12147790775', 'cIAbHwPmS2aqWyhokZJcWI:APA91bHtx1pnqkXeIOMsGppwqoY2xZXvXjmvwRMrzp3fJTYwE0daFcLQQ15gvfs4wAaR37JYaqLtxkW8YqpD9GkeyrWZUTpzlgiogqLXmOZC9sUkbROQ8fAKhRN3_SHFuTQhsWfNFV13', 'Europe/London', 'Scaggs', NULL),
('b502a7ef-fe11-46e3-86d3-3cbc9c7ec015', 'edited', 'mgujjargamingm@gmail.com', '$2b$12$xwGnWZVUZnWHKqUfZ8It3.Gf3J2NhCNz4FlTfQ0t6MaxZE9IGcBoa', 0, '2023-06-02 18:07:48', '2023-08-25 14:36:23', '1122334', '12345567', 'abc', 'Asia/Karachi', 'edited last name', 683787),
('c469ff1a-2d21-40cf-9cc6-b1f501279d54', 'Terry', 'Chefterry.newsome@yahoo.com', '$2b$12$M0M9FX4VY.Uu/k34mS4mv.sWrdYn8i5mAotaVW118dAhp33BOkRsC', 0, '2023-06-05 02:42:32', '2023-06-05 02:42:32', '1012063', '469-968-3604', 'dk0PY5qEgEedkaxxnPlJhQ:APA91bGbgjo0cpvkjNJdL9jEKFDeNwuk6f2JIqYAr1DXVn_Qy1mYG9tCXbIdi11NB_h6SWvtnN4CZY16ZfL3HJdOd5rfMK254AV83pTTQh2qxbqItVXniTf-oksgtv9iEc3JDw5Cg_mp', 'America/Chicago', 'Newsome', NULL),
('cdf7ae37-ec07-4751-a47b-2f7b1a2c4f66', 'Olu', 'olu@noabros.com', '$2b$12$TNAd.iabgNND.tcF6OIG/eKxtyZwAmLEnvX9YBlV.fRo2aGwUSxnO', 0, '2023-05-02 13:07:44', '2023-10-01 05:25:27', '1012063', '8178056725', 'd0kX8vjATCyuK4quau5wva:APA91bHxGFG7TZGuyLm1LRBsED03itlhfKMb9vcal3QOt6f9Ec4oHUQ3yEMQxaHDMlTstZGRbhiHekNBnZE7IVrzMad6P0Jfse4ATQbVk9u8_vyCCVuDUj39uBtG69di29inQbidq6SB', 'America/Chicago', 'Toye', NULL),
('d276464f-61db-4fce-ae14-8549efe486aa', 'james', 'jsung@gmail.com', '$2b$12$75pZuAksrfSyMeKnjoFqquhjMvgPiesxSiym4hY01eVt2EAjHQRX.', 0, '2023-08-31 00:41:51', '2023-08-31 00:42:29', '1122', '6822528889', 'c1BmkkgYd0B-uv6FKXlseR:APA91bFfza2MewDWC6UNUl1BeV4DsSQAgDW15f6u6EqDo2XYmEHFQLuWNgMzRS8GzCVUblds_UERIcdSYgjmOM42dTDUWxGROQ-rLZkDvFBxBzXYMoRXKANq_Hn_juWntfWt02Qz4ujw', 'America/Chicago', 'song', NULL),
('dc4b5622-769a-48f3-897a-51d13c1708c6', 'Gujjar', 'usama.mern@gmail.com', '$2b$12$ASKRNBu/2.SzGEU1O5JPyeCnBntMT4MQoOfB9sDRBoOsn17sBtr4e', 0, '2023-08-31 18:11:15', '2023-08-31 18:11:15', '11111111', '11111111', 'abc', 'Asia/Karachi', 'Gaming', NULL),
('dda6f9f5-befb-4398-97f0-728ead20a440', 'Olu', 'olu@gmail.com', '$2b$12$qKxDcImLG2YSszgQU6n6Wu6c1Fk8t5L//DU45oK2VXSsrL9TzNqy6', 0, '2023-08-13 02:09:44', '2023-10-02 16:33:29', '1012063', '6822528880', 'd3H0fI1XdUnUswaqFKkiuu:APA91bGgf8d0utviW8ZgRbR_zaYIskPOOLoH2p1LevV_6c5rruIPoA6RgR6ECKmpJuiZ3VAS8sMki3vLcGXHDXD3yXsUM6GOw_ikItoD5moUC5QprWQkWBjZ5EVz7_B85zsxAZX6Sfs9', 'America/Chicago', 'T', NULL),
('e4354f09-2e5e-4942-8a4d-da5599594718', 'Clifford', 'Cliffhop75@gmail.com', '$2b$12$xRClMC9BTq/dYctYpac6K.aegiW09s8WO1cN4dMPuMnepWyWioNuy', 0, '2023-06-05 02:38:34', '2023-09-15 03:41:21', '1012063', '+1 (972) 730-5934', 'coBtaUUSRjCjcbOQIQQ_NV:APA91bFda35CUGsvqOcKERiglNgaagptR8nemnSgmxmtLiYpyoRhfXQ30EVdFWcFQW4CGiV723_NZ11cxRNaNEStF_hLuN7e1vKdVWKZznNeZzcnKWmLAUp2SMWqzW1l_up7D-7hvjqF', 'America/Chicago', 'Hopkins', 883819),
('ec70c5fb-6539-4d26-bdf0-42f4bbc42649', 'Phong', 'pnguyen@npkfreightllc.com', '$2b$12$Grp6HXsWYIZXDPSHyd/fM.0lIdvWwkSkqSsPvlXlciaJi9to87ga.', 0, '2023-10-10 17:53:12', '2023-10-10 17:59:31', '094827', '9729984743', 'dnaH4OcQReuY_wkvhK6nZh:APA91bEKDcUMZebTJdu5uv3O8KjDCF-Kl-dBGG2l4xkceNQJF3YLNqvkw6_Yc2hinXfBoF1c6MZH83eh2GLjVbeW-JmKxkrf8-66O910rfyIiG47BRNEUmdkKwOp_Qr5XH71-d2qfUsC', 'America/Chicago', 'Nguyen', NULL),
('f052be27-58d6-4157-9f01-6d765d42b835', 'shdh', 'aa@gmail.com', '$2b$12$BLBv8aQg.x76N2DRBYUxAevy3sfyILeBVKdoPcoRju2AsqkkPobfK', 0, '2023-09-19 11:30:22', '2023-09-19 11:30:22', '11223344', '484848585', 'fx5u13uMT0uwsRddYGoPPp:APA91bHdLzWCbTkdLhH5xLMh5NnOgoJJOvLbUIcBzUyUvSSt7XkAzqfacxKn955KkmkHW-9P_GHccZoEbmdp3tELnlgXKOvq-g-okaZ0fIpmUWo6hjfitOvIvoAw0oYWpEfbChAGVE2n', 'Asia/Karachi', 'dbdb', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bols`
--
ALTER TABLE `bols`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `courierHandlerId` (`courierHandlerId`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `mcNumber` (`mcNumber`),
  ADD UNIQUE KEY `mcNumber_2` (`mcNumber`),
  ADD UNIQUE KEY `mcNumber_3` (`mcNumber`),
  ADD UNIQUE KEY `mcNumber_4` (`mcNumber`);

--
-- Indexes for table `couriers`
--
ALTER TABLE `couriers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `courierHandlerId` (`courierHandlerId`);

--
-- Indexes for table `courier_handlers`
--
ALTER TABLE `courier_handlers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `rate_cons`
--
ALTER TABLE `rate_cons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `courierHandlerId` (`courierHandlerId`),
  ADD KEY `userId` (`userId`),
  ADD KEY `companyId` (`companyId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `email_2` (`email`),
  ADD UNIQUE KEY `email_3` (`email`),
  ADD UNIQUE KEY `email_4` (`email`),
  ADD UNIQUE KEY `email_5` (`email`),
  ADD UNIQUE KEY `email_6` (`email`),
  ADD UNIQUE KEY `email_7` (`email`),
  ADD UNIQUE KEY `email_8` (`email`),
  ADD UNIQUE KEY `email_9` (`email`),
  ADD UNIQUE KEY `email_10` (`email`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bols`
--
ALTER TABLE `bols`
  ADD CONSTRAINT `bols_ibfk_17` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `bols_ibfk_18` FOREIGN KEY (`courierHandlerId`) REFERENCES `courier_handlers` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `couriers`
--
ALTER TABLE `couriers`
  ADD CONSTRAINT `couriers_ibfk_1` FOREIGN KEY (`courierHandlerId`) REFERENCES `courier_handlers` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `courier_handlers`
--
ALTER TABLE `courier_handlers`
  ADD CONSTRAINT `courier_handlers_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `rate_cons`
--
ALTER TABLE `rate_cons`
  ADD CONSTRAINT `rate_cons_ibfk_11` FOREIGN KEY (`courierHandlerId`) REFERENCES `courier_handlers` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `rate_cons_ibfk_12` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `rate_cons_ibfk_13` FOREIGN KEY (`companyId`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
