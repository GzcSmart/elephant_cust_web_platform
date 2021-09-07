/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80025
 Source Host           : localhost:3306
 Source Schema         : elephant

 Target Server Type    : MySQL
 Target Server Version : 80025
 File Encoding         : 65001

 Date: 01/09/2021 18:12:51
*/

SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for api_record
-- ----------------------------
DROP TABLE IF EXISTS `api_record`;
CREATE TABLE `api_record`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `customer_yw_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `system_yw_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `api_total` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `success_times` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `unknown_times` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `fail_times` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `total_cost` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `test_cost` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `back_cost` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `actual_cost` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `settle_total_price` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `settle_back_price` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `org_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `statement_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of api_record
-- ----------------------------
INSERT INTO `api_record` VALUES (1, '1', '7899787', '1', '3244', '324', '321', '243', '234', '453', '644', '43', '423', '324', '1', '2021-08-28');
INSERT INTO `api_record` VALUES (2, '1', '78946541', '2', '4535', '6464', '45', '4564', '4565', '6445', '64656', '456', '56', '567', '1', '2021-08-29');
INSERT INTO `api_record` VALUES (3, '1', '61646546', '3', '7849', '12354', '7879', '789746', '645', '464', '4646', '4654', '4646', '79789', '1', '2021-07-18');

-- ----------------------------
-- Table structure for customer_address
-- ----------------------------
DROP TABLE IF EXISTS `customer_address`;
CREATE TABLE `customer_address`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `area` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `detailed_area` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `telephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `postal_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `is_default_address` int NULL DEFAULT NULL,
  `customer_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of customer_address
-- ----------------------------
INSERT INTO `customer_address` VALUES (70, 'qwe456', '{\"provinceName\":\"北京\",\"cityName\":\"北京市\",\"districtName\":\"东城区\"}', 'da', '12345677912', '12345677912', '456789', 1, '1');
INSERT INTO `customer_address` VALUES (71, 'qwe', '{\"provinceName\":\"北京\",\"cityName\":\"北京市\",\"districtName\":\"东城区\"}', 'da', '12345677912', '12345677912', '456789', 1, '1');
INSERT INTO `customer_address` VALUES (72, 'qwe', '{\"provinceName\":\"天津\",\"cityName\":\"天津市\",\"districtName\":\"和平区\"}', 'da', '12345677912', '12345677912', '456789', 1, '1');

-- ----------------------------
-- Table structure for customer_info
-- ----------------------------
DROP TABLE IF EXISTS `customer_info`;
CREATE TABLE `customer_info`  (
  `customer_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `customer_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `customer_tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `email` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `balance` double NULL DEFAULT NULL,
  `last_operator_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `head_img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `audit_status` int NULL DEFAULT NULL,
  `cash_back_status` int NULL DEFAULT NULL,
  `cash_free_audit` int NULL DEFAULT NULL,
  `org_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`customer_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of customer_info
-- ----------------------------
INSERT INTO `customer_info` VALUES ('1', 'zzy', '123456', '13015912447', NULL, NULL, 1, 157, NULL, 'http://localhost:8080/static/images/12c0fa263cda41438a48ea31b21486aa-3.png', 1, NULL, NULL, '厦门市集微科技');
INSERT INTO `customer_info` VALUES ('6hhS7w', 'qwe', 'zz123456', '18059285682', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for customer_invoice
-- ----------------------------
DROP TABLE IF EXISTS `customer_invoice`;
CREATE TABLE `customer_invoice`  (
  `id` int NOT NULL,
  `customer_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `customer_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `invoice_title` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `tax_num` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `bank_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `bank_num` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `bus_lic_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `cust_lic_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `other_lic_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `tax_type` int NULL DEFAULT NULL,
  `org_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `org_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of customer_invoice
-- ----------------------------
INSERT INTO `customer_invoice` VALUES (1, '1', '1', 'djaksl3', '476465132', '建设银行', '62565645213256', '0592-6161982', '厦门市集美', 'http://localhost:8080/static/images/51f918b917f64102986bdee783fac6e4-enterpriseLegalPerson.jpg', 'http://localhost:8080/static/images/27e8c560584d43e29bc9bba9db3057e7-enterpriseLegalPerson.jpg', 'enterpriseLegalPerson.jpg', '1', 1, 1, '1', '厦门集微');

-- ----------------------------
-- Table structure for customer_invoice_apply
-- ----------------------------
DROP TABLE IF EXISTS `customer_invoice_apply`;
CREATE TABLE `customer_invoice_apply`  (
  `invoice_apply_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `org_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `org_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `invoice_title` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `bill_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `invoice_bank` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `bank_card_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `taxpayer_qualification` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `tax_register_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `invoice_type` int NULL DEFAULT NULL,
  `invoice_category` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `invoice_amount` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `receiver` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `received_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `received_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `ticketing_type` int NULL DEFAULT NULL,
  `need_bill` int NULL DEFAULT NULL,
  `stamp_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `audit_status` int NULL DEFAULT NULL,
  `auditor` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `auditor_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `auditor_department` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `audit_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `audit_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `org_mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `org_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `insert_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `customer_yw_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `yw_category` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`invoice_apply_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of customer_invoice_apply
-- ----------------------------
INSERT INTO `customer_invoice_apply` VALUES ('6b88f0bf63a54beda491f149f1eae891b36df4289304433d8e58d137d77ba8e8', '1', '厦门集微', 'djaksl3', '123', '建设银行', '62565645213256', NULL, '476465132', 1, '信息服务费，通信服务费', '0.00', 'qwe456', '详细地址：da', '12345677912', NULL, 0, '财务章', 0, NULL, NULL, NULL, NULL, NULL, '0592-6161982', '厦门市集美', '2021-09-01 13:21:02', NULL, '1', NULL);
INSERT INTO `customer_invoice_apply` VALUES ('9c335955d1dd4cf4a793165d2be71074263eb4ca4f9e4a709e8ba905e56120b3', '1', '厦门集微', 'djaksl3', '123', '建设银行', '62565645213256', NULL, '476465132', 0, '信息服务费，通信服务费', '0.00', 'qwe456', '详细地址：da', '12345677912', NULL, 0, '财务章', 0, NULL, NULL, NULL, NULL, NULL, '0592-6161982', '厦门市集美', '2021-08-31 18:33:05', NULL, '1', NULL);
INSERT INTO `customer_invoice_apply` VALUES ('f7043542ee9f4a59b18d0bd21bdcf98fc7d5b9ce49b04d94bdfea6b7ccda8043', '1', '厦门集微', 'djaksl3', '123', '建设银行', '62565645213256', NULL, '476465132', 0, '信息服务费，通信服务费', '0.00', 'qwe456', '详细地址：da', '12345677912', NULL, 0, '财务章', 0, NULL, NULL, NULL, NULL, NULL, '0592-6161982', '厦门市集美', '2021-08-31 18:31:47', NULL, '1', NULL);

-- ----------------------------
-- Table structure for cverification_cus_app_info
-- ----------------------------
DROP TABLE IF EXISTS `cverification_cus_app_info`;
CREATE TABLE `cverification_cus_app_info`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_platform` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `app_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `app_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `customer_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `system_yw_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `audit_status` int NULL DEFAULT NULL,
  `app_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `app_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cverification_cus_app_info
-- ----------------------------
INSERT INTO `cverification_cus_app_info` VALUES (1, 'ios', '集微云办公IOSr3', '1962745788237106015', '1', '1,3', 1, '一键登录\r\n本机号码校验', 'http://localhost:8080/static/images/work1.png');
INSERT INTO `cverification_cus_app_info` VALUES (2, '安卓', '思空办公安卓rm2', '3886051396706061272', '1', '1,3', 1, '一键登录\r\n本机号码校验', 'http://localhost:8080/static/images/work2.png');
INSERT INTO `cverification_cus_app_info` VALUES (3, 'ios', '思空办公应用Ios', '3004568087949034846', '1', '1,3', 1, '一键登录\r\n本机号码校验', 'http://localhost:8080/static/images/work1.png');
INSERT INTO `cverification_cus_app_info` VALUES (4, 'ios', '百悟办公应用IOS', '202004080954', '1', '1,3', 1, '一键登录\r\n本机号码校验', 'http://localhost:8080/static/images/work2.png');

-- ----------------------------
-- Table structure for individual_info
-- ----------------------------
DROP TABLE IF EXISTS `individual_info`;
CREATE TABLE `individual_info`  (
  `customer_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `org_id` int NOT NULL AUTO_INCREMENT,
  `unit_type` int NULL DEFAULT NULL,
  `org_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `register_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `org_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `tel_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `business_scope` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `business_term` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `temp_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `recommender` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `org_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `audit_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of individual_info
-- ----------------------------
INSERT INTO `individual_info` VALUES ('1', 1, 1, '厦门集微科技有限公司专用', '123456789', '福建,厦门,厦门市集美区集美大道1302号', '039-1234555', '互联网', '长期', '18559316031', 'zzy', 'http://localhost:8080/static/images/14.png', '1');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `id` int NOT NULL,
  `customer_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `msg_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `msg_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `is_delete` int NULL DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `insert_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES (1, '1', '应用审核已通过', '系统消息', 1, 1, '1', '2018-05-14', '2018-05-14', '尊敬的jiweitech_001，恭喜您，您提交的集微云办公IOSr3(1962745788237106015)应用，已经审核通过');
INSERT INTO `message` VALUES (2, '1', '代价昂贵', '系统消息', 1, 0, '1', '2020-05-18', '2019-08-10', '您好，欢迎您的来到');
INSERT INTO `message` VALUES (3, '1', '自动递增', '系统消息', 0, 0, '1', '2020-05-19', '2019-06-15', '你好欢迎你的来到');
INSERT INTO `message` VALUES (4, '1', '自动递增', '系统消息', 0, 0, '1', '2020-05-19', '2019-06-15', '你好欢迎你的来到');
INSERT INTO `message` VALUES (5, '1', 'jdlkajlk', '系统消息', 0, 0, '1', '2020-05-19', '2019-06-15', '你好欢迎你的来到');
INSERT INTO `message` VALUES (6, '1', 'dsfsf', '系统消息', 0, 0, '1', '2020-05-19', '2020-05-19', '你好欢迎你的来到');
INSERT INTO `message` VALUES (7, '1', 'adada', '系统消息', 0, 0, '1', '2020-05-19', '2020-05-19', '你好欢迎你的来到');
INSERT INTO `message` VALUES (8, '1', 'zxcxz', '系统消息', 0, 0, '1', '2020-05-19', '2020-05-19', '你好欢迎你的来到');
INSERT INTO `message` VALUES (9, '1', 'dasd', '系统消息', 0, 0, '1', '2020-05-19', '2020-05-19', '你好欢迎你的来到');
INSERT INTO `message` VALUES (10, '1', 'sdfffs', '系统消息', 0, 0, '1', '2020-05-19', '2020-05-19', '你好欢迎你的来到');
INSERT INTO `message` VALUES (11, '1', 'czxczxc', '系统消息', 0, 0, '1', '2020-05-19', '2020-05-19', '你好欢迎你的来到');

-- ----------------------------
-- Table structure for org_balance_info
-- ----------------------------
DROP TABLE IF EXISTS `org_balance_info`;
CREATE TABLE `org_balance_info`  (
  `id` int NOT NULL,
  `org_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `org_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `org_balance` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `org_status` int NULL DEFAULT NULL,
  `customer_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `child_org_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of org_balance_info
-- ----------------------------
INSERT INTO `org_balance_info` VALUES (1, '1', '厦门集微有限公司', '1', 1, '1', '1');

-- ----------------------------
-- Table structure for org_info
-- ----------------------------
DROP TABLE IF EXISTS `org_info`;
CREATE TABLE `org_info`  (
  `sn` int NULL DEFAULT NULL,
  `org_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `unit_type` int NULL DEFAULT NULL,
  `org_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `customer_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `register_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `org_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `org_level` int NULL DEFAULT NULL,
  `org_domain` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `org_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `org_scope` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `due_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `tel_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `temp_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `audit_status` int NULL DEFAULT NULL,
  `admin_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `max_ext` int NULL DEFAULT NULL,
  `org_status` int NULL DEFAULT NULL,
  `del_status` int NULL DEFAULT NULL,
  `create_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `pay_type` int NULL DEFAULT NULL,
  PRIMARY KEY (`org_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of org_info
-- ----------------------------
INSERT INTO `org_info` VALUES (1, '1', 1, '厦门集微有限公司', '1', '11453', '19874684', 14658465, '115163', '厦门集美', '1', '1', '19845641', '16526', 1, '1', 1, 1, 1, '1', '11', 1);

-- ----------------------------
-- Table structure for yw_info
-- ----------------------------
DROP TABLE IF EXISTS `yw_info`;
CREATE TABLE `yw_info`  (
  `system_yw_id` int NOT NULL,
  `category_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `yw_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `customer_yw_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `customer_yw_pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `customer_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `parent_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`system_yw_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of yw_info
-- ----------------------------
INSERT INTO `yw_info` VALUES (1, '统一认证', '一键登录', '7899787', 'RZu15VULA5', 1, '1', 2);
INSERT INTO `yw_info` VALUES (2, '语音类', '语音验证码', '78946541', '798456', 1, '1', 4);
INSERT INTO `yw_info` VALUES (3, '统一认证', '本机号码校验', '61646546', '7946141', 1, '1', 2);
INSERT INTO `yw_info` VALUES (5, '手机号信息类', '携号转网', '7894461', '4646513', 1, '1', 5);
INSERT INTO `yw_info` VALUES (6, '短信类', '短信通知', '7897984', '3247489', 1, '1', 3);
INSERT INTO `yw_info` VALUES (7, '短信类', '国际短信', '7654156', '79846513', 1, '1', 3);
INSERT INTO `yw_info` VALUES (8, '手机号信息类', '国际号码查询', '1421331', '3213123', 1, '1', 5);
INSERT INTO `yw_info` VALUES (9, '语音类', '语音通知', '321313213', '31232132', 1, '1', 4);
INSERT INTO `yw_info` VALUES (10, '短信类', '视频短信	', '123213', '31231', 1, '1', 3);
INSERT INTO `yw_info` VALUES (11, '手机号信息类', '号段归属', '123123123', '12331', 1, '1', 5);
INSERT INTO `yw_info` VALUES (12, '短信类', '短信验证码', '12312222', '654355345', 1, '1', 3);

-- ----------------------------
-- Table structure for yw_info_category
-- ----------------------------
DROP TABLE IF EXISTS `yw_info_category`;
CREATE TABLE `yw_info_category`  (
  `id` int NOT NULL,
  `category_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `parent_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `is_parent` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of yw_info_category
-- ----------------------------
INSERT INTO `yw_info_category` VALUES (2, '统一认证', '', '1');
INSERT INTO `yw_info_category` VALUES (3, '短信类', NULL, '1');
INSERT INTO `yw_info_category` VALUES (4, '语音类', NULL, '1');
INSERT INTO `yw_info_category` VALUES (5, '手机号信息类', NULL, '1');

-- ----------------------------
-- Table structure for yw_record
-- ----------------------------
DROP TABLE IF EXISTS `yw_record`;
CREATE TABLE `yw_record`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_yw_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `serial_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `return_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `operator` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `receiving_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `app_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `app_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `org_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `org_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `start_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `end_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `category_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `consumption` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `return_code_describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of yw_record
-- ----------------------------
INSERT INTO `yw_record` VALUES (1, '7899787', '17765464656', '2000', '电信', '16454567899', '1', '集微云办公IOSr3', '厦门集微科技', '1', '2020-05-19', NULL, '2', '5435', '成功');
INSERT INTO `yw_record` VALUES (2, '78946541', '14564564646', '2000', '联通', '14567894121', '1', '思空办公安卓rm2', '厦门集微科技', '1', '2020-04-15', '2020-04-16', '4', '4234', '成功');

SET FOREIGN_KEY_CHECKS = 1;
