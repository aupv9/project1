/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : localhost:3306
 Source Schema         : shop

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 15/12/2018 23:14:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bill
-- ----------------------------
DROP TABLE IF EXISTS `bill`;
CREATE TABLE `bill`  (
  `bill_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL,
  `total` double NULL DEFAULT NULL,
  `payment` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `address` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `date` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`bill_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bill
-- ----------------------------
INSERT INTO `bill` VALUES (1544870078124, 1544870056570, 350, 'Live', '484 Lê V&#259;n Vi&#7879;t ', '2018-12-15 17:34:38');
INSERT INTO `bill` VALUES (1544872736416, 1544872590049, 100, 'Bank transfer', '1 Võ V&#259;n Ngân ', '2018-12-15 18:18:56');

-- ----------------------------
-- Table structure for bill_detail
-- ----------------------------
DROP TABLE IF EXISTS `bill_detail`;
CREATE TABLE `bill_detail`  (
  `bill_detail_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bill_id` bigint(20) NULL DEFAULT NULL,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `price` double NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`bill_detail_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of bill_detail
-- ----------------------------
INSERT INTO `bill_detail` VALUES (11, 1544872736416, 1, 100, 1);
INSERT INTO `bill_detail` VALUES (10, 1544870078124, 10, 150, 2);
INSERT INTO `bill_detail` VALUES (9, 1544870078124, 2, 50, 1);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `category_id` bigint(11) NOT NULL,
  `category_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'Phone');
INSERT INTO `category` VALUES (2, 'Computer');
INSERT INTO `category` VALUES (3, '\r\nClothes');
INSERT INTO `category` VALUES (4, 'Foods');
INSERT INTO `category` VALUES (5, '\r\nGeneral');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `product_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) NULL DEFAULT NULL,
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `product_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `product_price` double NULL DEFAULT NULL,
  `product_description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  PRIMARY KEY (`product_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, 1, 'iphone6', 'images/k1.jpg', 100, NULL);
INSERT INTO `product` VALUES (2, 1, 'SamSung J5', 'images/m1.jpg', 50, NULL);
INSERT INTO `product` VALUES (3, 1, 'SamSung Galaxy', 'images/m2.jpg', 80, NULL);
INSERT INTO `product` VALUES (4, 1, 'Iphone 8', 'images/m3.jpg', 78, NULL);
INSERT INTO `product` VALUES (10, 2, 'Loa', 'images/m4.jpg', 150, NULL);
INSERT INTO `product` VALUES (11, 2, NULL, 'images/mk4.jpg', 180, NULL);
INSERT INTO `product` VALUES (12, 2, NULL, 'images/mk4.jpg', 160, NULL);
INSERT INTO `product` VALUES (13, 2, NULL, 'images/m6.jpg', 134, NULL);
INSERT INTO `product` VALUES (14, 1, NULL, 'images/m6.jpg', 80, NULL);
INSERT INTO `product` VALUES (15, 1, NULL, 'images/m3.jpg', 90, NULL);
INSERT INTO `product` VALUES (16, 1, NULL, 'images/m2.jpg', 70, NULL);
INSERT INTO `product` VALUES (17, 3, NULL, 'images/f1.png', 28, NULL);
INSERT INTO `product` VALUES (18, 3, NULL, NULL, NULL, NULL);
INSERT INTO `product` VALUES (20, 3, NULL, 'images/f2.png', 23, NULL);
INSERT INTO `product` VALUES (21, 3, NULL, 'images/f4.png', 34, NULL);
INSERT INTO `product` VALUES (22, 3, NULL, 'images/f5.png', 45, NULL);
INSERT INTO `product` VALUES (27, 5, NULL, 'images/s1.png', 23, NULL);
INSERT INTO `product` VALUES (28, 5, NULL, 'images/s2.png', 21, NULL);
INSERT INTO `product` VALUES (29, 5, NULL, 'images/s3.png', 34, NULL);
INSERT INTO `product` VALUES (30, 5, NULL, 'images/s4.png', 23, NULL);
INSERT INTO `product` VALUES (31, 4, NULL, 'images/g1.png', 23, NULL);
INSERT INTO `product` VALUES (32, 4, NULL, 'images/g2.png', 25, NULL);
INSERT INTO `product` VALUES (33, 4, NULL, 'images/g3.png', 26, NULL);
INSERT INTO `product` VALUES (34, 4, NULL, 'images/g4.png', 26, NULL);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `user_id` bigint(20) NOT NULL,
  `user_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `user_pass` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `user_role` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1544870717631, 'aupv91@gmail.com', '12345', b'0');
INSERT INTO `users` VALUES (1544870056570, 'aupv96@gmail.com', '12345', b'0');
INSERT INTO `users` VALUES (1544872590049, 'aupv6@gmail.com', '123456', b'0');

SET FOREIGN_KEY_CHECKS = 1;
