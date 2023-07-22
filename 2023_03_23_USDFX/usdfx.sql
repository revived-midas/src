/*
 Navicat Premium Data Transfer

 Source Server         : NewUSDFX
 Source Server Type    : MySQL
 Source Server Version : 100424 (10.4.24-MariaDB)
 Source Host           : 10.10.17.12:3306
 Source Schema         : usdfx

 Target Server Type    : MySQL
 Target Server Version : 100424 (10.4.24-MariaDB)
 File Encoding         : 65001

 Date: 02/05/2023 06:59:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admins
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `admin_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `first_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `role` int NULL DEFAULT NULL,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES (1, NULL, 'root', 'Veronica', 'Andrino', 'usdfx.management@gmail.com', '$2a$08$b8MJOxdWL2ZvO/Xz0tBvouYpF5YXBfUWkChuFtTapEi6WpWK6QSt2', 1, 1, NULL, NULL, NULL, '2023-04-24 13:51:17', '2023-04-24 13:51:17');

-- ----------------------------
-- Table structure for affiliatelevels
-- ----------------------------
DROP TABLE IF EXISTS `affiliatelevels`;
CREATE TABLE `affiliatelevels`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `level` int NULL DEFAULT NULL,
  `percent` float NULL DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2023-04-25 08:43:12',
  `updatedAt` datetime NOT NULL DEFAULT '2023-04-25 08:43:12',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of affiliatelevels
-- ----------------------------
INSERT INTO `affiliatelevels` VALUES (1, 0, 10, '2023-04-25 08:43:12', '2023-04-25 08:43:12');
INSERT INTO `affiliatelevels` VALUES (2, 1, 3, '2023-04-25 08:43:12', '2023-04-25 08:43:12');
INSERT INTO `affiliatelevels` VALUES (3, 2, 2, '2023-04-25 08:43:12', '2023-04-25 08:43:12');
INSERT INTO `affiliatelevels` VALUES (4, 3, 1.25, '2023-04-25 08:43:12', '2023-04-25 08:43:12');
INSERT INTO `affiliatelevels` VALUES (5, 4, 0.75, '2023-04-25 08:43:12', '2023-04-25 08:43:12');
INSERT INTO `affiliatelevels` VALUES (6, 5, 0.3, '2023-04-25 08:43:12', '2023-04-25 08:43:12');
INSERT INTO `affiliatelevels` VALUES (7, 6, 0.2, '2023-04-25 08:43:12', '2023-04-25 08:43:12');
INSERT INTO `affiliatelevels` VALUES (8, 7, 0.15, '2023-04-25 08:43:12', '2023-04-25 08:43:12');
INSERT INTO `affiliatelevels` VALUES (9, 8, 0.13, '2023-04-25 08:43:12', '2023-04-25 08:43:12');
INSERT INTO `affiliatelevels` VALUES (10, 9, 0.12, '2023-04-25 08:43:12', '2023-04-25 08:43:12');
INSERT INTO `affiliatelevels` VALUES (11, 10, 0.1, '2023-04-25 08:43:12', '2023-04-25 08:43:12');

-- ----------------------------
-- Table structure for affiliates
-- ----------------------------
DROP TABLE IF EXISTS `affiliates`;
CREATE TABLE `affiliates`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `level` int NULL DEFAULT NULL,
  `percent` int NULL DEFAULT NULL,
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `investment` float NULL DEFAULT NULL,
  `earning` float NULL DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2023-04-24 18:31:37',
  `updatedAt` datetime NOT NULL DEFAULT '2023-04-24 18:31:37',
  `sponsor_id` int NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sponsor_id`(`sponsor_id` ASC) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `affiliates_ibfk_1` FOREIGN KEY (`sponsor_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `affiliates_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of affiliates
-- ----------------------------
INSERT INTO `affiliates` VALUES (1, 0, 10, 'USD', 1000, 100, '2023-04-24 18:08:21', '2023-04-24 18:08:21', NULL, NULL);
INSERT INTO `affiliates` VALUES (2, 1, 3, 'USD', 200, 6, '2023-04-24 18:08:21', '2023-04-24 18:08:21', NULL, NULL);
INSERT INTO `affiliates` VALUES (3, 0, 10, 'USD', 190, 19, '2023-04-24 18:08:21', '2023-04-24 18:08:21', NULL, NULL);
INSERT INTO `affiliates` VALUES (4, 2, 2, 'USD', 3000, 60, '2023-04-24 18:08:21', '2023-04-24 18:08:21', NULL, NULL);
INSERT INTO `affiliates` VALUES (5, 0, 10, 'USD', 10, 1, '2023-04-24 18:31:37', '2023-04-24 18:31:37', NULL, NULL);
INSERT INTO `affiliates` VALUES (6, 1, 3, 'USD', 10, 0.3, '2023-04-24 18:31:37', '2023-04-24 18:31:37', NULL, NULL);
INSERT INTO `affiliates` VALUES (7, 2, 2, 'USD', 10, 0.2, '2023-04-24 18:31:37', '2023-04-24 18:31:37', NULL, NULL);
INSERT INTO `affiliates` VALUES (8, 0, 10, 'USD', 100, 10, '2023-04-24 18:31:37', '2023-04-24 18:31:37', NULL, NULL);
INSERT INTO `affiliates` VALUES (9, 1, 3, 'USD', 100, 3, '2023-04-24 18:31:37', '2023-04-24 18:31:37', NULL, NULL);
INSERT INTO `affiliates` VALUES (10, 2, 2, 'USD', 100, 2, '2023-04-24 18:31:37', '2023-04-24 18:31:37', NULL, NULL);
INSERT INTO `affiliates` VALUES (11, 0, 10, 'USD', 20, 2, '2023-04-24 18:31:37', '2023-04-24 18:31:37', NULL, NULL);
INSERT INTO `affiliates` VALUES (12, 1, 3, 'USD', 20, 0.6, '2023-04-24 18:31:37', '2023-04-24 18:31:37', NULL, NULL);
INSERT INTO `affiliates` VALUES (13, 2, 2, 'USD', 20, 0.4, '2023-04-24 18:31:37', '2023-04-24 18:31:37', NULL, NULL);
INSERT INTO `affiliates` VALUES (14, 0, 10, 'USD', 20, 2, '2023-04-24 18:31:37', '2023-04-24 18:31:37', NULL, NULL);
INSERT INTO `affiliates` VALUES (15, 1, 3, 'USD', 20, 0.6, '2023-04-24 18:31:37', '2023-04-24 18:31:37', NULL, NULL);
INSERT INTO `affiliates` VALUES (16, 2, 2, 'USD', 20, 0.4, '2023-04-24 18:31:37', '2023-04-24 18:31:37', NULL, NULL);
INSERT INTO `affiliates` VALUES (17, 0, 10, 'USD', 500, 50, '2023-04-24 18:31:37', '2023-04-24 18:31:37', NULL, NULL);
INSERT INTO `affiliates` VALUES (18, 1, 3, 'USD', 500, 15, '2023-04-24 18:31:37', '2023-04-24 18:31:37', NULL, NULL);
INSERT INTO `affiliates` VALUES (19, 2, 2, 'USD', 500, 10, '2023-04-24 18:31:37', '2023-04-24 18:31:37', NULL, NULL);
INSERT INTO `affiliates` VALUES (20, 0, 10, 'USD', 500, 50, '2023-04-24 18:31:37', '2023-04-24 18:31:37', NULL, NULL);
INSERT INTO `affiliates` VALUES (21, 1, 3, 'USD', 500, 15, '2023-04-24 18:31:37', '2023-04-24 18:31:37', NULL, NULL);
INSERT INTO `affiliates` VALUES (22, 2, 2, 'USD', 500, 10, '2023-04-24 18:31:37', '2023-04-24 18:31:37', NULL, NULL);
INSERT INTO `affiliates` VALUES (23, 0, 10, 'USD', 100, 10, '2023-04-24 18:31:37', '2023-04-24 18:31:37', NULL, NULL);
INSERT INTO `affiliates` VALUES (24, 1, 3, 'USD', 100, 3, '2023-04-24 18:31:37', '2023-04-24 18:31:37', NULL, NULL);
INSERT INTO `affiliates` VALUES (25, 2, 2, 'USD', 100, 2, '2023-04-24 18:31:37', '2023-04-24 18:31:37', NULL, NULL);
INSERT INTO `affiliates` VALUES (26, 0, 10, 'USD', 12, 1.2, '2023-04-24 18:31:37', '2023-04-24 18:31:37', NULL, NULL);
INSERT INTO `affiliates` VALUES (27, 1, 3, 'USD', 12, 0.36, '2023-04-24 18:31:37', '2023-04-24 18:31:37', NULL, NULL);
INSERT INTO `affiliates` VALUES (28, 2, 2, 'USD', 12, 0.24, '2023-04-24 18:31:37', '2023-04-24 18:31:37', NULL, NULL);
INSERT INTO `affiliates` VALUES (29, 0, 10, 'USD', 12, 1.2, '2023-04-24 18:31:37', '2023-04-24 18:31:37', NULL, NULL);
INSERT INTO `affiliates` VALUES (30, 1, 3, 'USD', 12, 0.36, '2023-04-24 18:31:37', '2023-04-24 18:31:37', NULL, NULL);
INSERT INTO `affiliates` VALUES (31, 2, 2, 'USD', 12, 0.24, '2023-04-24 18:31:37', '2023-04-24 18:31:37', NULL, NULL);
INSERT INTO `affiliates` VALUES (32, 0, 10, 'USD', 12, 1.2, '2023-04-24 18:31:37', '2023-04-24 18:31:37', NULL, NULL);
INSERT INTO `affiliates` VALUES (33, 1, 3, 'USD', 12, 0.36, '2023-04-24 18:31:37', '2023-04-24 18:31:37', NULL, NULL);
INSERT INTO `affiliates` VALUES (34, 2, 2, 'USD', 12, 0.24, '2023-04-24 18:31:37', '2023-04-24 18:31:37', NULL, NULL);
INSERT INTO `affiliates` VALUES (35, 0, 10, 'USD', 300, 30, '2023-04-24 18:31:37', '2023-04-24 18:31:37', NULL, NULL);
INSERT INTO `affiliates` VALUES (36, 1, 3, 'USD', 300, 9, '2023-04-24 18:31:37', '2023-04-24 18:31:37', NULL, NULL);
INSERT INTO `affiliates` VALUES (37, 2, 2, 'USD', 300, 6, '2023-04-24 18:31:37', '2023-04-24 18:31:37', NULL, NULL);

-- ----------------------------
-- Table structure for bankinfos
-- ----------------------------
DROP TABLE IF EXISTS `bankinfos`;
CREATE TABLE `bankinfos`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `account_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `account_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `iban_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bank_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bank_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `swift_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2023-04-20 08:44:18',
  `updatedAt` datetime NOT NULL DEFAULT '2023-04-20 08:44:18',
  `user_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `bankinfos_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bankinfos
-- ----------------------------
INSERT INTO `bankinfos` VALUES (1, 'Bryan Smith', '234235', '4242424242424242', 'Sun Shine', 'Anywhere', '345', '2023-04-20 07:03:11', '2023-04-20 08:47:56', 35);

-- ----------------------------
-- Table structure for coins
-- ----------------------------
DROP TABLE IF EXISTS `coins`;
CREATE TABLE `coins`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `symbol` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `decimal` int NULL DEFAULT NULL,
  `image_url` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `createdAt` datetime NOT NULL DEFAULT '2023-04-12 15:34:11',
  `updatedAt` datetime NOT NULL DEFAULT '2023-04-12 15:34:11',
  `network_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `network_id`(`network_id` ASC) USING BTREE,
  CONSTRAINT `coins_ibfk_1` FOREIGN KEY (`network_id`) REFERENCES `networks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of coins
-- ----------------------------
INSERT INTO `coins` VALUES (1, '0x55d398326f99059fF775485246999027B3197955', 'Binance-Peg BSC-USD (BSC-USD)', 'USDT', 18, '/assets/coins/usdt.png', '2023-04-12 15:34:11', '2023-04-12 15:34:11', 1);
INSERT INTO `coins` VALUES (3, '0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c', 'USDFX', 'USDFX', 18, '/assets/coins/usdfx.png', '2023-04-12 15:34:11', '2023-04-12 15:34:11', 1);

-- ----------------------------
-- Table structure for investments
-- ----------------------------
DROP TABLE IF EXISTS `investments`;
CREATE TABLE `investments`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `capital` float NULL DEFAULT NULL,
  `earning` float NULL DEFAULT NULL,
  `period` int NULL DEFAULT NULL,
  `invest_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `end_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT 1,
  `withdraw_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2023-04-25 22:33:23',
  `updatedAt` datetime NOT NULL DEFAULT '2023-04-25 22:33:23',
  `user_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `investments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of investments
-- ----------------------------
INSERT INTO `investments` VALUES (1, 'Premium', 'USD', 10, 2, 365, '2022-04-24', '2024-04-23', 1, NULL, '2023-04-25 22:49:33', '2023-04-25 22:49:33', 35);
INSERT INTO `investments` VALUES (2, 'Premium', 'USD', 1000, 200, 365, '2023-01-26', '2024-04-25', 1, NULL, '2023-04-26 06:43:24', '2023-04-26 06:43:24', 35);
INSERT INTO `investments` VALUES (3, 'Premium', 'USD', 10000, 2000, 365, '2023-04-26', '2024-04-25', 1, NULL, '2023-04-26 06:43:24', '2023-04-26 06:43:24', 35);
INSERT INTO `investments` VALUES (4, 'Premium', 'USD', 500, 100, 365, '2023-04-26', '2024-04-25', 1, NULL, '2023-04-26 06:52:04', '2023-04-26 06:52:04', 35);
INSERT INTO `investments` VALUES (5, 'Premium', 'USD', 500, 100, 365, '2023-04-26', '2024-04-25', 1, NULL, '2023-04-26 07:04:39', '2023-04-26 07:04:39', 35);
INSERT INTO `investments` VALUES (6, 'Gold', 'USD', 100, 15, 270, '2023-04-26', '2024-01-21', 1, NULL, '2023-04-26 07:04:39', '2023-04-26 07:04:39', 35);
INSERT INTO `investments` VALUES (7, 'Starter', 'USD', 10, 0.5, 90, '2023-04-26', '2023-07-25', 1, NULL, '2023-04-26 07:15:27', '2023-04-26 07:15:27', 35);
INSERT INTO `investments` VALUES (8, 'Starter', 'USD', 100, 5, 90, '2023-04-26', '2023-07-25', 1, NULL, '2023-04-26 07:15:27', '2023-04-26 07:15:27', 35);
INSERT INTO `investments` VALUES (9, 'Silver', 'USD', 123, 12.3, 180, '2023-04-26', '2023-10-23', 1, NULL, '2023-04-26 07:15:27', '2023-04-26 07:15:27', 35);
INSERT INTO `investments` VALUES (10, 'Gold', 'USD', 123, 18.45, 270, '2023-04-26', '2024-01-21', 1, NULL, '2023-04-26 07:15:27', '2023-04-26 07:15:27', 36);
INSERT INTO `investments` VALUES (11, 'Premium', 'USD', 123, 24.6, 365, '2023-04-26', '2024-04-25', 1, NULL, '2023-04-26 07:15:27', '2023-04-26 07:15:27', 36);
INSERT INTO `investments` VALUES (12, 'Starter', 'USD', 123, 6.15, 90, '2023-04-26', '2023-07-25', 1, NULL, '2023-04-26 07:15:27', '2023-04-26 07:15:27', 35);
INSERT INTO `investments` VALUES (13, 'Silver', 'USD', 123, 12.3, 180, '2023-04-26', '2023-10-23', 1, NULL, '2023-04-26 07:15:27', '2023-04-26 07:15:27', 35);
INSERT INTO `investments` VALUES (14, 'Gold', 'USD', 123, 18.45, 270, '2023-04-26', '2024-01-21', 1, NULL, '2023-04-26 07:15:27', '2023-04-26 07:15:27', 35);
INSERT INTO `investments` VALUES (15, 'Premium', 'USD', 123, 24.6, 365, '2023-04-26', '2024-04-25', 1, NULL, '2023-04-26 07:15:27', '2023-04-26 07:15:27', 36);
INSERT INTO `investments` VALUES (16, 'Silver', 'USD', 123, 12.3, 180, '2023-04-26', '2023-10-23', 1, NULL, '2023-04-26 07:15:27', '2023-04-26 07:15:27', 36);
INSERT INTO `investments` VALUES (17, 'Starter', 'USD', 1111, 55.55, 90, '2023-04-26', '2023-07-25', 1, NULL, '2023-04-26 07:15:27', '2023-04-26 07:15:27', 36);
INSERT INTO `investments` VALUES (18, 'Gold', 'USD', 12, 1.8, 270, '2023-04-26', '2024-01-21', 1, NULL, '2023-04-26 07:37:19', '2023-04-26 07:37:19', 35);
INSERT INTO `investments` VALUES (19, 'Starter', 'USD', 12, 0.6, 90, '2023-04-26', '2023-07-25', 1, NULL, '2023-04-26 07:37:19', '2023-04-26 07:37:19', 35);
INSERT INTO `investments` VALUES (20, 'Gold', 'USD', 12, 1.8, 270, '2023-04-26', '2024-01-21', 1, NULL, '2023-04-26 07:37:19', '2023-04-26 07:37:19', 35);
INSERT INTO `investments` VALUES (21, 'Gold', 'USD', 300, 45, 270, '2023-04-26', '2024-01-21', 1, NULL, '2023-04-26 12:40:05', '2023-04-28 07:35:42', 35);

-- ----------------------------
-- Table structure for networks
-- ----------------------------
DROP TABLE IF EXISTS `networks`;
CREATE TABLE `networks`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `explorer` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `is_testnet` tinyint(1) NULL DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2023-04-12 15:34:11',
  `updatedAt` datetime NOT NULL DEFAULT '2023-04-12 15:34:11',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of networks
-- ----------------------------
INSERT INTO `networks` VALUES (1, '', 'BNB Smart Chain Mainnet', 'https://bscrpc.com', 'https://bscscan.com/', 0, '2023-04-12 15:34:11', '2023-04-12 15:34:11');

-- ----------------------------
-- Table structure for packages
-- ----------------------------
DROP TABLE IF EXISTS `packages`;
CREATE TABLE `packages`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `currency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `period` int NULL DEFAULT NULL,
  `percent` float NULL DEFAULT NULL,
  `withdrawal_fee` float NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2023-04-25 17:25:46',
  `updatedAt` datetime NOT NULL DEFAULT '2023-04-25 17:25:46',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of packages
-- ----------------------------
INSERT INTO `packages` VALUES (1, 'Starter', 'USD', 90, 5, 0.02, 1, '2023-04-25 17:25:46', '2023-04-25 17:25:46');
INSERT INTO `packages` VALUES (2, 'Silver', 'USD', 180, 10, 0.02, 1, '2023-04-25 17:25:46', '2023-04-25 17:25:46');
INSERT INTO `packages` VALUES (3, 'Gold', 'USD', 270, 15, 0.02, 1, '2023-04-25 17:25:46', '2023-04-25 17:25:46');
INSERT INTO `packages` VALUES (4, 'Premium', 'USD', 365, 20, 0.02, 1, '2023-04-25 17:25:46', '2023-04-25 17:25:46');

-- ----------------------------
-- Table structure for paymentoptions
-- ----------------------------
DROP TABLE IF EXISTS `paymentoptions`;
CREATE TABLE `paymentoptions`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `logo_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `active_status` tinyint(1) NULL DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2023-04-17 21:00:02',
  `updatedAt` datetime NOT NULL DEFAULT '2023-04-17 21:00:02',
  `type` enum('Wallet','Bank') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of paymentoptions
-- ----------------------------
INSERT INTO `paymentoptions` VALUES (1, NULL, '/assets/paymentoptions/metamask.png', 'Metamask', 1, '2023-04-17 21:00:02', '2023-04-17 21:00:02', 'Wallet');
INSERT INTO `paymentoptions` VALUES (2, '', '\\public\\uploads\\paymentoptions\\1682693827471.png', 'Walletconnect', 1, '2023-04-24 15:18:08', '2023-04-28 14:56:47', 'Wallet');
INSERT INTO `paymentoptions` VALUES (3, '', '\\public\\uploads\\paymentoptions\\1682693876497.png', 'Trust wallet', 1, '2023-04-28 14:56:47', '2023-04-28 14:56:47', 'Wallet');
INSERT INTO `paymentoptions` VALUES (4, '', '\\public\\uploads\\paymentoptions\\1682693891131.png', 'Tron link', 1, '2023-04-28 14:56:47', '2023-04-28 14:56:47', 'Wallet');
INSERT INTO `paymentoptions` VALUES (5, '', '\\public\\uploads\\paymentoptions\\1682693903239.png', 'Near wallet', 1, '2023-04-28 14:56:47', '2023-04-28 14:56:47', 'Wallet');
INSERT INTO `paymentoptions` VALUES (6, '', '\\public\\uploads\\paymentoptions\\1682693917504.png', 'Senders wallet', 1, '2023-04-28 14:56:47', '2023-04-28 14:56:47', 'Wallet');
INSERT INTO `paymentoptions` VALUES (7, '', '\\public\\uploads\\paymentoptions\\1682714426601.png', 'Credit Card', 1, '2023-04-28 19:27:25', '2023-04-28 19:27:25', 'Bank');

-- ----------------------------
-- Table structure for sequelizemeta
-- ----------------------------
DROP TABLE IF EXISTS `sequelizemeta`;
CREATE TABLE `sequelizemeta`  (
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`name`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sequelizemeta
-- ----------------------------
INSERT INTO `sequelizemeta` VALUES ('20210915095343-create-user.js');
INSERT INTO `sequelizemeta` VALUES ('20211014113830-create_token_table.js');
INSERT INTO `sequelizemeta` VALUES ('20230411102325-create-wallet.js');
INSERT INTO `sequelizemeta` VALUES ('20230411102908-create-network.js');
INSERT INTO `sequelizemeta` VALUES ('20230411135050-create-token-asset.js');
INSERT INTO `sequelizemeta` VALUES ('20230417055935-update-user-table.js');
INSERT INTO `sequelizemeta` VALUES ('20230417062827-add-username-to-user-table.js');
INSERT INTO `sequelizemeta` VALUES ('20230419134037-add-kyc-to-users-table.js');
INSERT INTO `sequelizemeta` VALUES ('20230419161024-add-referral_code-and-invite-userid-to-users-table.js');
INSERT INTO `sequelizemeta` VALUES ('20230419192200-add-balance-into-user.js');
INSERT INTO `sequelizemeta` VALUES ('20230424170012-add-level-path-to-user-table.js');
INSERT INTO `sequelizemeta` VALUES ('20230424172416-modify-column-null-property-of-users-table.js');
INSERT INTO `sequelizemeta` VALUES ('20230425082445-add-level-and-affiliate_rewards-to-user-table.js');
INSERT INTO `sequelizemeta` VALUES ('20230425191525-add-ticketId-and-change-status-of-ticket-table.js');
INSERT INTO `sequelizemeta` VALUES ('20230425211143-add-depth-and-remove-level-from-user-table.js');
INSERT INTO `sequelizemeta` VALUES ('20230426205037-add-verification-code-to-user-table.js');
INSERT INTO `sequelizemeta` VALUES ('20230427103805-add-balance-fields-to-user-table.js');
INSERT INTO `sequelizemeta` VALUES ('20230428072709-change-status-column-property.js');
INSERT INTO `sequelizemeta` VALUES ('20230428084719-set-balance-default-value.js');
INSERT INTO `sequelizemeta` VALUES ('20230428190018-add-option-type-to-paymentoption-table.js');
INSERT INTO `sequelizemeta` VALUES ('20230428190902-add-option-type-to-paymentoption-table.js');
INSERT INTO `sequelizemeta` VALUES ('20230502113304-add-fee-setting-to-setting-table.js');

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `two_factor` tinyint(1) NOT NULL DEFAULT 0,
  `createdAt` datetime NOT NULL DEFAULT '2023-04-27 05:53:47',
  `updatedAt` datetime NOT NULL DEFAULT '2023-04-27 05:53:47',
  `gateway_fee` float NOT NULL DEFAULT 0,
  `blockchain_fee` float NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of settings
-- ----------------------------
INSERT INTO `settings` VALUES (1, 0, '2023-04-27 05:53:47', '2023-04-27 05:53:47', 3, 0.005);

-- ----------------------------
-- Table structure for tickets
-- ----------------------------
DROP TABLE IF EXISTS `tickets`;
CREATE TABLE `tickets`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `status` tinyint NOT NULL DEFAULT 1,
  `createdAt` datetime NOT NULL DEFAULT '2023-04-19 06:56:20',
  `updatedAt` datetime NOT NULL DEFAULT '2023-04-19 06:56:20',
  `user_id` int NULL DEFAULT NULL,
  `ticketId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tickets
-- ----------------------------
INSERT INTO `tickets` VALUES (2, 'This is a test', 'fddkdkeidkadsfkj;sdfkjs;fjs', 1, '2023-04-18 17:59:57', '2023-04-18 17:59:57', 35, '112414142141');
INSERT INTO `tickets` VALUES (6, 'Create new', 'sdgasdg', 1, '2023-04-19 07:17:33', '2023-04-19 07:17:33', 35, '21611241241');
INSERT INTO `tickets` VALUES (7, 'Create Ticket', 'working properly!', 1, '2023-04-19 07:27:29', '2023-04-19 07:27:29', 35, '21611241243');
INSERT INTO `tickets` VALUES (8, 'Render data test', 'asdg', 1, '2023-04-19 07:27:29', '2023-04-19 07:27:29', 35, '2161124123465');
INSERT INTO `tickets` VALUES (11, 'Test3', 'test32', 1, '2023-04-19 08:50:04', '2023-04-19 08:50:04', 35, '21611241243');
INSERT INTO `tickets` VALUES (13, 'ETGest', 'Etstse', 1, '2023-04-19 08:50:04', '2023-04-19 08:50:04', 36, '21611241274');
INSERT INTO `tickets` VALUES (14, 'Hello', 'This is a new test', 1, '2023-04-25 19:28:04', '2023-04-25 19:28:04', 36, '1682450944372');
INSERT INTO `tickets` VALUES (15, 'Hello, there!', 'New test', 1, '2023-04-25 19:29:47', '2023-04-25 19:29:47', 37, '21682451002632');
INSERT INTO `tickets` VALUES (16, 'Test', 'This is a test\nEnter\nAhhhh..', 0, '2023-04-28 08:48:31', '2023-04-28 08:48:31', 37, '371682691876580');

-- ----------------------------
-- Table structure for tokens
-- ----------------------------
DROP TABLE IF EXISTS `tokens`;
CREATE TABLE `tokens`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_uuid` char(36) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `expires` datetime NULL DEFAULT NULL,
  `blacklisted` tinyint(1) NULL DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3123 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tokens
-- ----------------------------
INSERT INTO `tokens` VALUES (2915, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWQzZWMyZS01N2NkLTQyOGQtYjU2Yi02MWExNjFiOTAzOTgiLCJpYXQiOjE2ODI4MTQyMDIsImV4cCI6MTcwODczNDIwMiwidHlwZSI6ImFjY2VzcyJ9.vvWIGnIPMLJTmDbGG1nqhe75hyV0wgbPxwC9HY-sKss', 'ded3ec2e-57cd-428d-b56b-61a161b90398', 'access', '2024-02-24 00:23:22', 0, '2023-04-30 00:23:22', '2023-04-30 00:23:22');
INSERT INTO `tokens` VALUES (2916, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWQzZWMyZS01N2NkLTQyOGQtYjU2Yi02MWExNjFiOTAzOTgiLCJpYXQiOjE2ODI4MTQyMDIsImV4cCI6MTY4NTQwNjIwMiwidHlwZSI6InJlZnJlc2gifQ.cEVzhhIAFY_t_LJP3HpBbjH1nWTI_IlEmu4gz9qqmv0', 'ded3ec2e-57cd-428d-b56b-61a161b90398', 'refresh', '2023-05-30 00:23:22', 0, '2023-04-30 00:23:22', '2023-04-30 00:23:22');
INSERT INTO `tokens` VALUES (2965, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWQzZWMyZS01N2NkLTQyOGQtYjU2Yi02MWExNjFiOTAzOTgiLCJpYXQiOjE2ODI4MTQzODgsImV4cCI6MTcwODczNDM4OCwidHlwZSI6ImFjY2VzcyJ9.8s5Ovl4H50luN70AlaRD03C6K9xdKpdUvpUoKjcb3Rk', 'ded3ec2e-57cd-428d-b56b-61a161b90398', 'access', '2024-02-24 00:26:28', 0, '2023-04-30 00:26:28', '2023-04-30 00:26:28');
INSERT INTO `tokens` VALUES (2966, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWQzZWMyZS01N2NkLTQyOGQtYjU2Yi02MWExNjFiOTAzOTgiLCJpYXQiOjE2ODI4MTQzODgsImV4cCI6MTY4NTQwNjM4OCwidHlwZSI6InJlZnJlc2gifQ.f32CUtMU2dZduZFAybBZp-ipwMiUWpksej48X1-IdGs', 'ded3ec2e-57cd-428d-b56b-61a161b90398', 'refresh', '2023-05-30 00:26:28', 0, '2023-04-30 00:26:28', '2023-04-30 00:26:28');
INSERT INTO `tokens` VALUES (3079, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWQzZWMyZS01N2NkLTQyOGQtYjU2Yi02MWExNjFiOTAzOTgiLCJpYXQiOjE2ODI4MjI4MjksImV4cCI6MTcwODc0MjgyOSwidHlwZSI6ImFjY2VzcyJ9.nDAL0mrqWNZp4HxTBt2ZmX5mimeTqWEuS85NUynx8yo', 'ded3ec2e-57cd-428d-b56b-61a161b90398', 'access', '2024-02-24 02:47:09', 0, '2023-04-30 02:47:09', '2023-04-30 02:47:09');
INSERT INTO `tokens` VALUES (3080, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWQzZWMyZS01N2NkLTQyOGQtYjU2Yi02MWExNjFiOTAzOTgiLCJpYXQiOjE2ODI4MjI4MjksImV4cCI6MTY4NTQxNDgyOSwidHlwZSI6InJlZnJlc2gifQ.sDokH0vsDAA8pOG6UyHZdLEa3ONEKRZzhV4TUTb4yWM', 'ded3ec2e-57cd-428d-b56b-61a161b90398', 'refresh', '2023-05-30 02:47:09', 0, '2023-04-30 02:47:09', '2023-04-30 02:47:09');
INSERT INTO `tokens` VALUES (3119, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWQzZWMyZS01N2NkLTQyOGQtYjU2Yi02MWExNjFiOTAzOTgiLCJpYXQiOjE2ODMwMjU5NDgsImV4cCI6MTcwODk0NTk0OCwidHlwZSI6ImFjY2VzcyJ9.Os3_Bb-fmXFTOp_iZgT48QoOsYYxjC3xJr5yqEzAA-U', 'ded3ec2e-57cd-428d-b56b-61a161b90398', 'access', '2024-02-26 11:12:28', 0, '2023-05-02 11:12:28', '2023-05-02 11:12:28');
INSERT INTO `tokens` VALUES (3120, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWQzZWMyZS01N2NkLTQyOGQtYjU2Yi02MWExNjFiOTAzOTgiLCJpYXQiOjE2ODMwMjU5NDgsImV4cCI6MTY4NTYxNzk0OCwidHlwZSI6InJlZnJlc2gifQ.8wNWxSlc2VTiYA2uagHe_tO0sSuD__31S6eAnGl7JwU', 'ded3ec2e-57cd-428d-b56b-61a161b90398', 'refresh', '2023-06-01 11:12:28', 0, '2023-05-02 11:12:28', '2023-05-02 11:12:28');
INSERT INTO `tokens` VALUES (3121, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI5Y2VmODY2Yy05ZTE0LTQ0NTktYTNmYi00NmIzYTJjNjJjNDciLCJpYXQiOjE2ODMwMjg2MTYsImV4cCI6MTY4MzQ2MDYxNiwidHlwZSI6ImFjY2VzcyJ9.eAluIWFaMPfQshIrYIWVlHOcuaEWo99qGIe-VHJTvsc', '9cef866c-9e14-4459-a3fb-46b3a2c62c47', 'access', '2023-05-07 11:56:56', 0, '2023-05-02 11:56:56', '2023-05-02 11:56:56');
INSERT INTO `tokens` VALUES (3122, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI5Y2VmODY2Yy05ZTE0LTQ0NTktYTNmYi00NmIzYTJjNjJjNDciLCJpYXQiOjE2ODMwMjg2MTYsImV4cCI6MTY4NTYyMDYxNiwidHlwZSI6InJlZnJlc2gifQ.3t0SsyvLxGM5FTuhIxF2amb5uQysxf4xHGzLh986tUk', '9cef866c-9e14-4459-a3fb-46b3a2c62c47', 'refresh', '2023-06-01 11:56:56', 0, '2023-05-02 11:56:56', '2023-05-02 11:56:56');

-- ----------------------------
-- Table structure for transactions
-- ----------------------------
DROP TABLE IF EXISTS `transactions`;
CREATE TABLE `transactions`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `from` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `to` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tx_hash` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `amount` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `confirmations` int NULL DEFAULT NULL,
  `type` enum('EXCHANGE','DEPOSIT') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `method` enum('WALLET','CREDIT_CARD') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` enum('PENDING','COMPLETED','CANCELLED','FAILED') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'PENDING',
  `createdAt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '2023-04-20 10:34:43',
  `updatedAt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '2023-04-20 10:34:43',
  `asset_id` int NOT NULL,
  `creator_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `tx_hash`(`tx_hash` ASC) USING BTREE,
  INDEX `asset_id`(`asset_id` ASC) USING BTREE,
  INDEX `creator_id`(`creator_id` ASC) USING BTREE,
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`asset_id`) REFERENCES `coins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of transactions
-- ----------------------------
INSERT INTO `transactions` VALUES (56, '0x943b1f2e1a1ce254c611f69dd20b47c960ce1a2a', '0x74abb027fb96a01afd226bdb9b133756640566a9', '0x9a9e1a2d993732463c8210e98a2c74fbe300bf858c1bbe7e79f84819f7d161b0', '0.001', 1, 'DEPOSIT', 'WALLET', 'PENDING', '2023-04-28 12:35:23', '2023-04-28 12:35:23', 1, 35);
INSERT INTO `transactions` VALUES (57, '0x943b1f2e1a1ce254c611f69dd20b47c960ce1a2a', '0x74abb027fb96a01afd226bdb9b133756640566a9', '0x7ecd3c1637b5de1d84b6fceefc200e9a0866d1e887818fa3dd24c786df313bfb', '0.0001', -1, 'DEPOSIT', 'WALLET', 'COMPLETED', '2023-04-28 12:48:51', '2023-04-28 12:48:51', 1, 35);
INSERT INTO `transactions` VALUES (58, '0x943b1f2e1a1ce254c611f69dd20b47c960ce1a2a', '0x74abb027fb96a01afd226bdb9b133756640566a9', '0x534a1e97199db14539763ed2cf9f5596aca9d0ba13f8e3a0e8281ff3aefded6f', '0.0001', 4, 'DEPOSIT', 'WALLET', 'PENDING', '2023-04-30 12:43:03', '2023-04-30 12:43:03', 1, 35);
INSERT INTO `transactions` VALUES (59, '0x943b1f2e1a1ce254c611f69dd20b47c960ce1a2a', '0x74abb027fb96a01afd226bdb9b133756640566a9', '0x626b86b1b80dad55f5c0509d4f922bb6d105ad2b9557a28b61ad22fcd5a5f700', '0.00001', 0, 'DEPOSIT', 'WALLET', 'PENDING', '2023-04-30 12:53:02', '2023-04-30 12:53:02', 1, 35);
INSERT INTO `transactions` VALUES (60, '0x943b1f2e1a1ce254c611f69dd20b47c960ce1a2a', '0x74abb027fb96a01afd226bdb9b133756640566a9', '0x1445ad6fb3c539d11cf51dd6c2d05749021074a786d09a42ea46f2f6e374d0cf', '0.001', 1, 'DEPOSIT', 'WALLET', 'PENDING', '2023-04-30 12:57:38', '2023-04-30 12:57:38', 1, 35);
INSERT INTO `transactions` VALUES (61, '0x943b1f2e1a1ce254c611f69dd20b47c960ce1a2a', '0x74abb027fb96a01afd226bdb9b133756640566a9', '0x07f7203316da1ab2ccf8eb5d36eb30112f7d0737a595841418a9668eace235de', '0.0001', 6, 'DEPOSIT', 'WALLET', 'PENDING', '2023-04-30 01:00:00', '2023-04-30 01:00:00', 1, 35);
INSERT INTO `transactions` VALUES (62, '0x943b1f2e1a1ce254c611f69dd20b47c960ce1a2a', '0x74abb027fb96a01afd226bdb9b133756640566a9', '0x101ad4cf4a0971126686e1685b35ffa873eb69e6e5a657f0dc0acb6651b5400c', '0.0001', 6, 'DEPOSIT', 'WALLET', 'PENDING', '2023-05-02 06:48:22', '2023-05-02 06:48:22', 1, 35);
INSERT INTO `transactions` VALUES (63, '0x943b1f2e1a1ce254c611f69dd20b47c960ce1a2a', '0x74abb027fb96a01afd226bdb9b133756640566a9', '0xe19ff3323eeb41a8b7c2dcd58fcbcffab83c804cf98255f28873ab747605ffc8', '0.0001', 2, 'DEPOSIT', 'WALLET', 'PENDING', '2023-05-02 06:54:24', '2023-05-02 06:54:24', 1, 35);
INSERT INTO `transactions` VALUES (64, '0x943b1f2e1a1ce254c611f69dd20b47c960ce1a2a', '0x74abb027fb96a01afd226bdb9b133756640566a9', '0x9868902f015cfa534e07949330853c043453cf5d0d98890f951a16328ab86e92', '0.0001', 5, 'DEPOSIT', 'WALLET', 'PENDING', '2023-05-02 06:56:43', '2023-05-02 06:56:43', 1, 35);
INSERT INTO `transactions` VALUES (65, '0x943b1f2e1a1ce254c611f69dd20b47c960ce1a2a', '0x74abb027fb96a01afd226bdb9b133756640566a9', '0xfe42f6e8b9ca240a049ae92f9aec7027f9d71c90b79100f662fa08dfef9dff67', '0.0001', 0, 'DEPOSIT', 'WALLET', 'PENDING', '2023-05-02 06:58:29', '2023-05-02 06:58:29', 1, 35);
INSERT INTO `transactions` VALUES (66, '0x943b1f2e1a1ce254c611f69dd20b47c960ce1a2a', '0x74abb027fb96a01afd226bdb9b133756640566a9', '0xd93017f6781e88cff6c4ba678e02f1092a05da9c82d8e587c58623e1fba786bb', '0.00001', 2, 'DEPOSIT', 'WALLET', 'PENDING', '2023-05-02 07:03:22', '2023-05-02 07:03:22', 1, 35);
INSERT INTO `transactions` VALUES (67, '0x943b1f2e1a1ce254c611f69dd20b47c960ce1a2a', '0x74abb027fb96a01afd226bdb9b133756640566a9', '0x26e7bef1b3085c941dfebd33c933c9c3f61209a45fbf7c7f4b8cd0dbc9bb7c8d', '0.0001', 3, 'DEPOSIT', 'WALLET', 'PENDING', '2023-05-02 07:05:49', '2023-05-02 07:05:49', 1, 35);
INSERT INTO `transactions` VALUES (68, '0x943b1f2e1a1ce254c611f69dd20b47c960ce1a2a', '0x74abb027fb96a01afd226bdb9b133756640566a9', '0x44db96a1e6ae906697aaf60c79aa22a916991e714eea1c557403c0fada96fd61', '0.00001', 1, 'DEPOSIT', 'WALLET', 'PENDING', '2023-05-02 07:05:49', '2023-05-02 07:05:49', 1, 35);
INSERT INTO `transactions` VALUES (69, '0x943b1f2e1a1ce254c611f69dd20b47c960ce1a2a', '0x74abb027fb96a01afd226bdb9b133756640566a9', '0xfb0dc7eba3730186d0d78f9a86b72ae739a789c158e2d6594fa242bf86d11946', '0.0001', 1, 'DEPOSIT', 'WALLET', 'PENDING', '2023-05-02 07:05:49', '2023-05-02 07:05:49', 1, 35);
INSERT INTO `transactions` VALUES (70, '0x943b1f2e1a1ce254c611f69dd20b47c960ce1a2a', '0x74abb027fb96a01afd226bdb9b133756640566a9', '0xce74fc7e020fd33013cc0eb1b6a24868d38923add3dc6b73d711f1cd85c7f013', '0.00001', 2, 'DEPOSIT', 'WALLET', 'PENDING', '2023-05-02 07:37:06', '2023-05-02 07:37:06', 1, 35);
INSERT INTO `transactions` VALUES (71, '0x943b1f2e1a1ce254c611f69dd20b47c960ce1a2a', '0x74abb027fb96a01afd226bdb9b133756640566a9', '0x934efff17274b2ee3a184a731dcb8453fbfaf802ddaa434cf2649278b27fb766', '0.0001', 2, 'DEPOSIT', 'WALLET', 'PENDING', '2023-05-02 08:55:28', '2023-05-02 08:55:28', 1, 35);
INSERT INTO `transactions` VALUES (72, '0x943b1f2e1a1ce254c611f69dd20b47c960ce1a2a', '0x74abb027fb96a01afd226bdb9b133756640566a9', '0x2dd02044228da11aa2f56197e475a55970a6a66fdb3c7550e64f2dbb55ac54e6', '0.0001', 1, 'DEPOSIT', 'WALLET', 'PENDING', '2023-05-02 09:17:37', '2023-05-02 09:17:37', 1, 35);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `first_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `email_verified` int NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `country` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `kyc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `referral_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `invite_user_id` int NULL DEFAULT NULL,
  `balance` float NOT NULL DEFAULT 0,
  `level_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '#',
  `affiliate_rewards` float NOT NULL DEFAULT 0,
  `depth` int NOT NULL DEFAULT 1,
  `verification_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bep20` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `trc20` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `erc20` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `near` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (35, 'ded3ec2e-57cd-428d-b56b-61a161b90398', 'John', 'Doe', 'test@test.com', '$2a$08$wZtULUMNK5UfUszvRa77hebHEobXU/i6gm1aZObRBUXFZ.vj0LyOq', 1, 0, NULL, NULL, '2023-04-27 12:41:46', '2023-04-27 14:55:09', NULL, NULL, NULL, 'user1682599306987', NULL, '1sxxgcklgz46mej', NULL, 0.0001, '#', 0, 1, NULL, '0.0001', '0', '0', '0');
INSERT INTO `users` VALUES (36, '6c3b9d82-8518-465b-aa27-c601b9d1d311', 'Bryan', 'Smith', 'multikitty422@gmail.com', '$2a$08$GUoPFHmTD63RH9i7HBV9UefeETDQAd64Mh1prktFEhGHZ1h9itoFy', 1, 0, NULL, NULL, '2023-04-27 13:52:01', '2023-04-27 13:52:01', NULL, NULL, NULL, 'user1682603521969', NULL, '12ocbfp8lgz6oype', NULL, 0, '#', 0, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (37, '9cef866c-9e14-4459-a3fb-46b3a2c62c47', 'David', 'Klein', 'dev.senior.it@gmail.com', '$2a$08$D43sEtwFCG8S2lVa3tX4G.77W7Bh7eQXYfkNOcmk33OQJMtt9tZaa', 1, 0, 'asdfas', '23423423', '2023-04-28 08:58:07', '2023-04-28 14:26:37', 'US', 'TX', '\\public\\uploads\\avatars\\avatar-1682691997817.jpg', 'user1682672287423', NULL, '12ocbejwlh0bmugw', NULL, 0, '#', 0, 1, NULL, '0', '0', '0', '0');

-- ----------------------------
-- Table structure for wallets
-- ----------------------------
DROP TABLE IF EXISTS `wallets`;
CREATE TABLE `wallets`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `private_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT '2023-04-12 15:34:11',
  `updatedAt` datetime NOT NULL DEFAULT '2023-04-12 15:34:11',
  `owner_id` int NOT NULL,
  `network_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `owner_id`(`owner_id` ASC) USING BTREE,
  INDEX `network_id`(`network_id` ASC) USING BTREE,
  CONSTRAINT `wallets_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `wallets_ibfk_2` FOREIGN KEY (`network_id`) REFERENCES `networks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 84 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wallets
-- ----------------------------
INSERT INTO `wallets` VALUES (81, '0x74abb027fb96a01afd226bdb9b133756640566a9', NULL, '2023-04-27 12:39:44', '2023-04-27 12:39:44', 35, 1);
INSERT INTO `wallets` VALUES (82, '0xae843b2693e4F5bd81D2d470f0dF569403020275', '0x9af28dd351ee9449fcf6a791250a03d879577e9afee81dfab9204f0e02996e51', '2023-04-27 13:04:34', '2023-04-27 13:04:34', 36, 1);
INSERT INTO `wallets` VALUES (83, '0x5575682fc27ce214b58e83e675db287e38b2e57d', NULL, '2023-04-28 08:48:31', '2023-04-28 08:48:31', 37, 1);

SET FOREIGN_KEY_CHECKS = 1;
