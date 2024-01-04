/*
 Navicat Premium Data Transfer

 Source Server         : Windows
 Source Server Type    : MySQL
 Source Server Version : 80034 (8.0.34)
 Source Host           : localhost:3306
 Source Schema         : 001.bet4wins_db

 Target Server Type    : MySQL
 Target Server Version : 80034 (8.0.34)
 File Encoding         : 65001

 Date: 03/12/2023 22:41:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_banks
-- ----------------------------
DROP TABLE IF EXISTS `tbl_banks`;
CREATE TABLE `tbl_banks`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `country` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'en',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 81 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_banks
-- ----------------------------
INSERT INTO `tbl_banks` VALUES (1, 'en', 'Bank of America');
INSERT INTO `tbl_banks` VALUES (2, 'ko', '국민은행');
INSERT INTO `tbl_banks` VALUES (3, 'ko', '농협');
INSERT INTO `tbl_banks` VALUES (4, 'ko', '우리은행');
INSERT INTO `tbl_banks` VALUES (5, 'ko', '우체국');
INSERT INTO `tbl_banks` VALUES (6, 'ko', '하나(외환)은행');
INSERT INTO `tbl_banks` VALUES (7, 'ko', '기업은행');
INSERT INTO `tbl_banks` VALUES (8, 'ko', '신한은행');
INSERT INTO `tbl_banks` VALUES (9, 'ko', '시티은행');
INSERT INTO `tbl_banks` VALUES (10, 'ko', 'SC은행(제일)');
INSERT INTO `tbl_banks` VALUES (11, 'ko', '경남은행');
INSERT INTO `tbl_banks` VALUES (12, 'ko', '광주은행');
INSERT INTO `tbl_banks` VALUES (13, 'ko', '부산은행');
INSERT INTO `tbl_banks` VALUES (14, 'ko', '새마을금고');
INSERT INTO `tbl_banks` VALUES (15, 'ko', '수협');
INSERT INTO `tbl_banks` VALUES (16, 'ko', '신협');
INSERT INTO `tbl_banks` VALUES (17, 'ko', '대구은행');
INSERT INTO `tbl_banks` VALUES (18, 'ko', '전북은행');
INSERT INTO `tbl_banks` VALUES (19, 'ko', '제주은행');
INSERT INTO `tbl_banks` VALUES (20, 'ko', '조흥은행');
INSERT INTO `tbl_banks` VALUES (21, 'ko', '산업은행');
INSERT INTO `tbl_banks` VALUES (22, 'ko', '한국은행');
INSERT INTO `tbl_banks` VALUES (23, 'ko', '산림조합');
INSERT INTO `tbl_banks` VALUES (24, 'ko', '케이뱅크');
INSERT INTO `tbl_banks` VALUES (25, 'ko', '카카오뱅크');
INSERT INTO `tbl_banks` VALUES (26, 'ko', 'Other');
INSERT INTO `tbl_banks` VALUES (27, 'mn', 'Khan bank');
INSERT INTO `tbl_banks` VALUES (28, 'mn', 'Golomt bank');
INSERT INTO `tbl_banks` VALUES (29, 'mn', 'Trade and Development bank');
INSERT INTO `tbl_banks` VALUES (30, 'mn', 'State bank');
INSERT INTO `tbl_banks` VALUES (31, 'mn', 'Xac bank');
INSERT INTO `tbl_banks` VALUES (32, 'mn', 'Бусад');
INSERT INTO `tbl_banks` VALUES (57, 'mn', 'Хаан Банк');
INSERT INTO `tbl_banks` VALUES (58, 'mn', 'Голомт төв банк');
INSERT INTO `tbl_banks` VALUES (59, 'mn', 'Хас Банк');
INSERT INTO `tbl_banks` VALUES (60, 'mn', 'Төрийн банк');
INSERT INTO `tbl_banks` VALUES (61, 'mn', 'Чингис Хаан Банк');
INSERT INTO `tbl_banks` VALUES (62, 'mn', 'Капитрон Банк');
INSERT INTO `tbl_banks` VALUES (63, 'mn', 'Үндэсний хөрөнгө оруулалтын банк');
INSERT INTO `tbl_banks` VALUES (64, 'mn', 'Ариг төв банк');
INSERT INTO `tbl_banks` VALUES (65, 'mn', 'Богд Банк');
INSERT INTO `tbl_banks` VALUES (66, 'mn', 'Тээвэр хөгжлийн банк');
INSERT INTO `tbl_banks` VALUES (67, 'mn', 'Хөгжлийн банк');
INSERT INTO `tbl_banks` VALUES (68, 'mn', 'Төрийн сан');
INSERT INTO `tbl_banks` VALUES (69, 'mn', 'Капитал банк БЭХА');
INSERT INTO `tbl_banks` VALUES (70, 'mn', 'Хадгаламж ХХК дахь Банкны ЭХА');
INSERT INTO `tbl_banks` VALUES (71, 'mn', 'Хадгаламж ЭХА');
INSERT INTO `tbl_banks` VALUES (72, 'mn', 'Монголын үнэт цаасны клирингийн тєв');
INSERT INTO `tbl_banks` VALUES (73, 'mn', 'ҮЦ төвлөрсөн хадгаламжийн төв');
INSERT INTO `tbl_banks` VALUES (74, 'mn', 'Мобифинанс ББСБ');
INSERT INTO `tbl_banks` VALUES (75, 'mn', 'Ард кредит ББСБ');
INSERT INTO `tbl_banks` VALUES (76, 'mn', 'Хай пэй');
INSERT INTO `tbl_banks` VALUES (77, 'mn', 'M Банк');
INSERT INTO `tbl_banks` VALUES (78, 'mn', 'Капитал  банк');
INSERT INTO `tbl_banks` VALUES (79, 'mn', 'Төв Монголбанк');
INSERT INTO `tbl_banks` VALUES (80, 'mn', 'Дансны нэгдсэн сан');

SET FOREIGN_KEY_CHECKS = 1;
