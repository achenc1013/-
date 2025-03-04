/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80040 (8.0.40)
 Source Host           : localhost:3306
 Source Schema         : microshop

 Target Server Type    : MySQL
 Target Server Version : 80040 (8.0.40)
 File Encoding         : 65001

 Date: 26/02/2025 20:25:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for alembic_version
-- ----------------------------
DROP TABLE IF EXISTS `alembic_version`;
CREATE TABLE `alembic_version`  (
  `version_num` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`version_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of alembic_version
-- ----------------------------
INSERT INTO `alembic_version` VALUES ('543e1103ac3c');

-- ----------------------------
-- Table structure for order_items
-- ----------------------------
DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NULL DEFAULT NULL,
  `product_id` int NULL DEFAULT NULL,
  `quantity` int NULL DEFAULT NULL,
  `points_per_item` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_id`(`order_id` ASC) USING BTREE,
  INDEX `product_id`(`product_id` ASC) USING BTREE,
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_items
-- ----------------------------
INSERT INTO `order_items` VALUES (1, 1, 1, 1, 10);
INSERT INTO `order_items` VALUES (2, 2, 1, 2, 10);
INSERT INTO `order_items` VALUES (3, 3, 1, 1, 10);
INSERT INTO `order_items` VALUES (4, 4, 1, 30, 10);
INSERT INTO `order_items` VALUES (5, 5, 1, 16, 10);
INSERT INTO `order_items` VALUES (6, 6, 1, 1, 10);
INSERT INTO `order_items` VALUES (7, 7, 1, 1, 10);
INSERT INTO `order_items` VALUES (8, 8, 1, 1, 10);
INSERT INTO `order_items` VALUES (9, 9, 1, 1, 10);
INSERT INTO `order_items` VALUES (10, 10, 1, 1, 10);
INSERT INTO `order_items` VALUES (11, 11, 1, 5, 10);
INSERT INTO `order_items` VALUES (12, 12, 1, 1, 10);
INSERT INTO `order_items` VALUES (13, 13, 1, 1, 10);
INSERT INTO `order_items` VALUES (14, 14, 1, 1, 10);
INSERT INTO `order_items` VALUES (15, 15, 1, 1, 10);
INSERT INTO `order_items` VALUES (17, 17, 1, 36, 10);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `order_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `secret_key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `total_points` int NULL DEFAULT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ix_orders_secret_key`(`secret_key` ASC) USING BTREE,
  UNIQUE INDEX `ix_orders_order_number`(`order_number` ASC) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 2, '2025022522223866', '44cc664d-d314-49cc-b141-c5221cde342e', 10, 'cancelled', '2025-02-25 10:29:48', '2025-02-25 10:56:10');
INSERT INTO `orders` VALUES (2, 2, '2025022530429894', '94f8f948-1127-4116-a5ba-3d4d531cbb07', 20, 'completed', '2025-02-25 11:53:31', '2025-02-25 11:54:28');
INSERT INTO `orders` VALUES (3, 2, '2025022525981056', '35a27ea2-1d77-4343-9020-159f7fea8a6c', 10, 'completed', '2025-02-25 12:00:23', '2025-02-26 20:08:23');
INSERT INTO `orders` VALUES (4, 2, '2025022519473399', '026517f6-50e8-4232-b5e3-b967b3611763', 300, 'cancelled', '2025-02-25 12:07:13', '2025-02-25 12:08:02');
INSERT INTO `orders` VALUES (5, 2, '2025022519814097', '27415b0c-02c5-46b6-a8d4-1eac5632160e', 160, 'completed', '2025-02-25 12:09:36', '2025-02-26 20:08:46');
INSERT INTO `orders` VALUES (6, 2, '2025022618118952', '49dc241e-e4ad-464f-8e96-05459ac12182', 10, 'completed', '2025-02-26 05:28:47', '2025-02-26 20:08:42');
INSERT INTO `orders` VALUES (7, 2, '2025022616425925', '9dbc780c-8d1b-42f6-896b-ff46db4d9938', 10, 'completed', '2025-02-26 07:21:07', '2025-02-26 20:08:39');
INSERT INTO `orders` VALUES (8, 2, '2025022623399158', 'b58b8cdb-a420-41d1-9ecd-503b53a0eed3', 10, 'completed', '2025-02-26 07:41:33', '2025-02-26 20:08:35');
INSERT INTO `orders` VALUES (9, 2, '2025022610810765', '9a2edf37-6e60-4c68-81f2-fddbbf82da8f', 10, 'completed', '2025-02-26 08:10:50', '2025-02-26 20:08:31');
INSERT INTO `orders` VALUES (10, 2, '2025022620747209', '6907aa6e-a071-4143-bb23-890f30aa9534', 10, 'completed', '2025-02-26 08:13:50', '2025-02-26 20:08:27');
INSERT INTO `orders` VALUES (11, 2, '2025022632966151', 'bda40ae9-53dd-4780-bc06-d9961a361cd9', 50, 'cancelled', '2025-02-26 08:15:29', '2025-02-26 08:15:49');
INSERT INTO `orders` VALUES (12, 2, '2025022624779102', '07350e7f-a301-472f-a49a-e2a173eaef62', 10, 'cancelled', '2025-02-26 16:19:19', '2025-02-26 16:19:51');
INSERT INTO `orders` VALUES (13, 2, '2025022617063456', 'ad5e50d7-c247-4354-8977-960156218eef', 10, 'completed', '2025-02-26 17:25:16', '2025-02-26 20:08:19');
INSERT INTO `orders` VALUES (14, 2, '2025022626865785', 'f357bd2d-d83a-47c8-bc8d-4ca1456da82a', 10, 'completed', '2025-02-26 17:27:36', '2025-02-26 20:08:15');
INSERT INTO `orders` VALUES (15, 2, '2025022631005279', 'b8e66525-f8db-4740-ae12-8439b4b24327', 10, 'completed', '2025-02-26 17:44:12', '2025-02-26 20:08:12');
INSERT INTO `orders` VALUES (17, 2, '2025022612107035', '128c8129-e6aa-41d9-9505-0cd0651449f2', 360, 'completed', '2025-02-26 17:54:24', '2025-02-26 17:54:37');

-- ----------------------------
-- Table structure for points_records
-- ----------------------------
DROP TABLE IF EXISTS `points_records`;
CREATE TABLE `points_records`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `points` int NOT NULL,
  `action` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `points_records_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of points_records
-- ----------------------------
INSERT INTO `points_records` VALUES (1, 2, 3, '其他', '其他获得3积分', '2025-02-26 06:04:47');
INSERT INTO `points_records` VALUES (5, 2, 3, '其他', '其他获得3积分', '2025-02-26 14:12:37');
INSERT INTO `points_records` VALUES (9, 2, -10, '消费', '消费消费10积分', '2025-02-26 15:21:07');
INSERT INTO `points_records` VALUES (10, 2, -10, '消费', '消费消费10积分', '2025-02-26 15:41:33');
INSERT INTO `points_records` VALUES (11, 2, -10, '消费', '消费消费10积分', '2025-02-26 16:10:50');
INSERT INTO `points_records` VALUES (12, 2, -10, '消费', '消费消费10积分', '2025-02-26 16:13:50');
INSERT INTO `points_records` VALUES (13, 2, -50, '消费', '消费消费50积分', '2025-02-26 16:15:29');
INSERT INTO `points_records` VALUES (14, 2, -10, '消费', '消费消费10积分', '2025-02-26 16:19:19');
INSERT INTO `points_records` VALUES (15, 2, -10, '消费', '消费消费10积分', '2025-02-26 17:25:16');
INSERT INTO `points_records` VALUES (16, 2, -10, '消费', '消费消费10积分', '2025-02-26 17:27:36');
INSERT INTO `points_records` VALUES (17, 2, -10, '消费', '消费消费10积分', '2025-02-26 17:44:12');
INSERT INTO `points_records` VALUES (18, 2, 1000, '其他', '其他获得1000积分', '2025-02-26 17:52:03');
INSERT INTO `points_records` VALUES (19, 2, -360, '消费', '消费消费360积分', '2025-02-26 17:54:24');
INSERT INTO `points_records` VALUES (20, 2, 3, '其他', '其他获得3积分', '2025-02-26 19:50:06');
INSERT INTO `points_records` VALUES (21, 10, 1, '签到', '每日签到获得积分', '2025-02-26 19:50:14');
INSERT INTO `points_records` VALUES (22, 10, 100, '其他', '其他获得100积分', '2025-02-26 20:07:47');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `price` int NOT NULL,
  `image_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `stock` int NULL DEFAULT NULL,
  `is_active` tinyint(1) NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, '步道乐跑', '此商品为虚拟产品，购买此类商品默认用户承担一定的账号管控风险。人工手动模拟定位，路线不穿墙，配速合理化，降低被BAN风险。欢迎用户选择购买。', 10, 'images/products/cba29f39-895e-432e-aa7a-665aed1034a1_logo.png', 0, 1, '2025-02-25 10:01:55', '2025-02-26 09:54:24');
INSERT INTO `products` VALUES (2, 'PS图像处理', '接PS人物简修、图片正色、证件照处理、PS作业。如需设计海报、人物精修、精细抠图价格另算。', 99, 'images/products/ed3a1c89-b053-4ec0-a646-e615aabcdf36_IMG_9246.PNG', 999, 1, '2025-02-26 09:24:50', '2025-02-26 11:54:40');
INSERT INTO `products` VALUES (3, '信息安全与评估培训', '为Luistin讲师代言的知识星球附赠授课，优惠价培训。海量的高价值学习资料风险，购买只会让你赚不会让你亏。信息安全与评估比赛是能够有机会获得免试专升本资格的。', 5999, 'images/products/48f67dbd-344c-46b4-b17c-e0cb19884433_IMG_9241.PNG', 8, 1, '2025-02-26 11:58:22', '2025-02-26 11:58:22');
INSERT INTO `products` VALUES (4, '云晞实验室', '云晞实验室是由云晞科技开展的知识星球，不定时分享各种各样的基础知识学习资料，价格实惠。', 399, 'images/products/3813c6e5-fdce-41a1-9c91-5c9bfbc6b1d0_IMG_9242.PNG', 10, 1, '2025-02-26 11:59:46', '2025-02-26 11:59:46');
INSERT INTO `products` VALUES (5, '电脑存储整理', '流氓软件卸载、注册表清理、碎片清理、缓存清理、C盘清理、内存优化。', 59, 'images/products/833c36fc-68ba-40f6-b73d-33d90fb70985_IMG_9244.PNG', 999, 1, '2025-02-26 12:01:36', '2025-02-26 12:01:36');
INSERT INTO `products` VALUES (6, 'Linux作业指导', '作业指导附赠Linux基础命令资料。', 49, 'images/products/c528131c-aa5a-4d20-94c1-9e55d282dedd_OIP-C.jpg', 999, 1, '2025-02-26 12:05:45', '2025-02-26 12:05:45');
INSERT INTO `products` VALUES (7, 'eNSP指导', 'eNSP40报错解决、命令指导、基础知识讲解。', 69, 'images/products/3789228d-cbd8-4aa3-96ef-bbb4346def89_OIP-C_1.jpg', 999, 1, '2025-02-26 12:07:19', '2025-02-26 12:07:19');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password_hash` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `points` int NULL DEFAULT NULL,
  `is_admin` tinyint(1) NULL DEFAULT NULL,
  `last_checkin` date NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `last_share` date NULL DEFAULT NULL,
  `total_points` int NULL DEFAULT NULL,
  `invitation_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `invited_by` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ix_users_username`(`username` ASC) USING BTREE,
  UNIQUE INDEX `ix_users_email`(`email` ASC) USING BTREE,
  UNIQUE INDEX `invitation_code`(`invitation_code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'lucifrix', '1013199991@qq.com', 'pbkdf2:sha256:260000$aMgDbc2s6pwHr9La$77f76ca88499cd008c945e55eb0851db6a4af1954289f65c3fbaa7a5e23661e8', 4, 0, '2025-02-25', '2025-02-25 05:34:06', '2025-02-25', NULL, '44DI87OX', NULL, NULL);
INSERT INTO `users` VALUES (2, 'admin', 'lucifrix@163.com', 'pbkdf2:sha256:260000$ZjtA6Zj7P8CbcUtw$22cefee3333157d61cd2fe475d6dbfb71e3d640529b053a6b3f654f114311783', 645, 1, '2025-02-26', '2025-02-25 05:37:20', '2025-02-26', 1233, 'AI9Z7CT3', NULL, '/static/uploads/avatars/40ba0346709b4a0f82a32be81ee9cdb0.jpg');
INSERT INTO `users` VALUES (10, 'yunxikeji', '768603120@qq.com', 'pbkdf2:sha256:260000$dIumTpxvnVMfK0By$525ffefb785517dbee3ff4f7bed37fdb2e76fcddce72a323c8572be986400953', 101, 0, '2025-02-26', '2025-02-26 11:50:06', NULL, 101, '0JQKHLLU', 'AI9Z7CT3', '/static/images/default-avatar.png');

SET FOREIGN_KEY_CHECKS = 1;
