/*
Navicat MySQL Data Transfer

Source Server         : 47.106.39.83_3306
Source Server Version : 50720
Source Host           : 47.106.39.83:3306
Source Database       : cnadmart

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-07-05 19:23:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cn_address
-- ----------------------------
DROP TABLE IF EXISTS `cn_address`;
CREATE TABLE `cn_address` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `detailed_address` varchar(200) NOT NULL COMMENT '详细地址',
  `postcode` varchar(20) NOT NULL DEFAULT '0' COMMENT '邮编',
  `person_name` varchar(20) NOT NULL COMMENT '收货人姓名',
  `person_tel` varchar(50) NOT NULL COMMENT '收货人电话',
  `city` varchar(20) NOT NULL COMMENT '市',
  `area` varchar(20) NOT NULL DEFAULT '' COMMENT '区',
  `is_default` varchar(10) NOT NULL DEFAULT '0' COMMENT '是否默认地址 0：否 1：是',
  `province` varchar(10) DEFAULT NULL COMMENT '省',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='收货地址表';

-- ----------------------------
-- Records of cn_address
-- ----------------------------
INSERT INTO `cn_address` VALUES ('1', '111', '千岭乡向阳街', '246521', '刘齐', '13033087652', '安庆市', '宿松县', '0', '安徽');
INSERT INTO `cn_address` VALUES ('23', '8', '西二环', '2300001', '哈哥', '13000001111', '武汉', '蜀山', '0', '湖北');
INSERT INTO `cn_address` VALUES ('24', '8', '西二环', '2300001', '哈哥', '13000001111', '武汉', '蜀山', '0', '湖北');
INSERT INTO `cn_address` VALUES ('38', '9', '上海市人民政府办公厅组织', '147852', '李五', '17698522148', '上海市', '卢湾区', '0', '上海市');
INSERT INTO `cn_address` VALUES ('39', '10', '明发商业广场13楼', '000000', '广品汇', '18888888888', '合肥市', '包河区', '0', '安徽省');
INSERT INTO `cn_address` VALUES ('40', '10', '不知反思就是那句话大喊大叫', '000000', '哈哈哈', '123456789', '蚌埠市', '蚌山区', '1', '安徽省');
INSERT INTO `cn_address` VALUES ('45', '11', '四里河路明发商业广场', '340000', '宋许超', '17682153207', '合肥市', '庐阳区', '0', '安徽省');

-- ----------------------------
-- Table structure for cn_admart
-- ----------------------------
DROP TABLE IF EXISTS `cn_admart`;
CREATE TABLE `cn_admart` (
  `mart_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `keyword` varchar(255) DEFAULT NULL COMMENT '店铺关键字',
  `log` varchar(255) DEFAULT '' COMMENT '品牌log',
  `mart_name` varchar(255) DEFAULT '' COMMENT '店铺名称',
  `self` tinyint(1) DEFAULT NULL COMMENT '是否自营 0：否 1：自营',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(50) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '最后一次修改时间',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `type` tinyint(1) DEFAULT NULL COMMENT '商户类型 1:个人商户 2：个体户，企业用户',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态 0:审核中 1:审核通过 2:审核拒绝',
  `real_name` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `id_card_img` varchar(255) DEFAULT '' COMMENT '身份证照片',
  `license_no` varchar(100) DEFAULT NULL COMMENT '营业执照号',
  `license_img` varchar(255) DEFAULT NULL COMMENT '营业执照图片',
  `contact` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '联系方式',
  `total_assets` decimal(11,2) DEFAULT '0.00' COMMENT '总资产',
  PRIMARY KEY (`mart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='商户表';

-- ----------------------------
-- Records of cn_admart
-- ----------------------------
INSERT INTO `cn_admart` VALUES ('1', '广品会', '', '广品会', '1', '2018-05-25 10:25:39', '超级管理员', null, null, null, null, '2', null, null, null, null, null, '1799.00');
INSERT INTO `cn_admart` VALUES ('2', null, '', '杂货店', '0', '2018-06-29 15:36:02', null, null, null, '23', '1', '1', '刘齐', '', null, null, null, '0.00');
INSERT INTO `cn_admart` VALUES ('7', null, '', '哈哈哈', '0', '2018-06-30 11:16:28', null, 'admin', '2018-06-30 11:35:32', '10', '2', '2', null, '', '897558555', 'http://img.cnadmart.com//STORE/certification/011833820180630111616.jpeg', null, '0.00');
INSERT INTO `cn_admart` VALUES ('18', null, '', null, '0', '2018-07-02 14:06:53', null, null, null, '9', '1', '2', 'Jack', '200820180702140634.png', null, null, null, '0.00');

-- ----------------------------
-- Table structure for cn_admart_assets_detail
-- ----------------------------
DROP TABLE IF EXISTS `cn_admart_assets_detail`;
CREATE TABLE `cn_admart_assets_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admart_id` int(11) DEFAULT NULL COMMENT '商户id',
  `type` tinyint(1) DEFAULT NULL COMMENT '类型 1：支出2：收入',
  `trading_time` datetime DEFAULT NULL COMMENT '交易时间',
  `trading_matter` varchar(250) DEFAULT NULL COMMENT '交易事项',
  `trading_amount` decimal(11,2) DEFAULT NULL COMMENT '交易金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='商户资产明细表';

-- ----------------------------
-- Records of cn_admart_assets_detail
-- ----------------------------
INSERT INTO `cn_admart_assets_detail` VALUES ('1', '1', '2', '2018-07-04 14:55:10', '商品id:213,规格价格id:807，购买数量:1', '554.00');

-- ----------------------------
-- Table structure for cn_admart_audit_log
-- ----------------------------
DROP TABLE IF EXISTS `cn_admart_audit_log`;
CREATE TABLE `cn_admart_audit_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admart_id` int(11) DEFAULT NULL COMMENT '商户id',
  `mart_name` varchar(255) DEFAULT NULL COMMENT '商户名称',
  `status` int(1) DEFAULT NULL COMMENT '审核状态 1：审核通过 2：审核拒绝',
  `note` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(255) DEFAULT NULL COMMENT '审核人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='商户审核记录';

-- ----------------------------
-- Records of cn_admart_audit_log
-- ----------------------------
INSERT INTO `cn_admart_audit_log` VALUES ('1', '7', null, '1', '资料不完整', '2018-06-30 11:36:22', 'admin');
INSERT INTO `cn_admart_audit_log` VALUES ('2', '1', null, null, null, '2018-06-30 15:42:18', 'admin');
INSERT INTO `cn_admart_audit_log` VALUES ('3', '1', null, null, null, '2018-06-30 15:43:05', 'admin');
INSERT INTO `cn_admart_audit_log` VALUES ('4', '1', null, null, null, '2018-06-30 15:45:48', 'admin');
INSERT INTO `cn_admart_audit_log` VALUES ('5', '1', null, null, null, '2018-06-30 15:46:35', 'admin');
INSERT INTO `cn_admart_audit_log` VALUES ('6', '1', null, '1', null, '2018-06-30 15:49:05', 'admin');
INSERT INTO `cn_admart_audit_log` VALUES ('7', '1', null, '1', null, '2018-06-30 15:49:51', 'admin');
INSERT INTO `cn_admart_audit_log` VALUES ('8', '1', null, '2', null, '2018-06-30 15:53:43', 'admin');
INSERT INTO `cn_admart_audit_log` VALUES ('9', '9', null, '2', '上传图片不清晰', '2018-06-30 15:54:20', 'admin');
INSERT INTO `cn_admart_audit_log` VALUES ('10', '1', null, '2', 'fdg', '2018-06-30 15:58:11', 'admin');
INSERT INTO `cn_admart_audit_log` VALUES ('11', '1', null, '1', 'sdf', '2018-06-30 16:00:12', 'admin');
INSERT INTO `cn_admart_audit_log` VALUES ('12', '1', null, '2', 'sdf', '2018-06-30 16:00:26', 'admin');
INSERT INTO `cn_admart_audit_log` VALUES ('13', '2', null, '1', 'wrwt wt rt', '2018-06-30 16:55:07', 'admin');
INSERT INTO `cn_admart_audit_log` VALUES ('14', '10', null, '2', 'fsdfljkslkjsdlkjjjjjjjjjjkkfjjjjjjjjjjjjjjjjjjjjjjjjjjjjj', '2018-07-02 08:36:47', 'admin');
INSERT INTO `cn_admart_audit_log` VALUES ('15', '12', null, '1', null, '2018-07-02 08:45:44', 'admin');
INSERT INTO `cn_admart_audit_log` VALUES ('16', '13', null, '1', null, '2018-07-02 08:46:10', 'admin');
INSERT INTO `cn_admart_audit_log` VALUES ('17', '14', null, '1', null, '2018-07-02 09:04:10', 'admin');
INSERT INTO `cn_admart_audit_log` VALUES ('18', '15', null, '1', 'qwe', '2018-07-02 09:04:48', 'admin');
INSERT INTO `cn_admart_audit_log` VALUES ('19', '16', null, '2', '图片不符合', '2018-07-02 09:17:02', 'admin');
INSERT INTO `cn_admart_audit_log` VALUES ('20', '17', null, '2', '46456654645654', '2018-07-02 09:32:51', 'admin');
INSERT INTO `cn_admart_audit_log` VALUES ('21', '17', null, '2', '快乐快乐加扣扣快捷键\n', '2018-07-02 13:52:48', 'admin');
INSERT INTO `cn_admart_audit_log` VALUES ('22', '17', null, '1', null, '2018-07-02 13:55:24', 'admin');
INSERT INTO `cn_admart_audit_log` VALUES ('23', '16', null, '1', null, '2018-07-02 14:04:32', 'admin');
INSERT INTO `cn_admart_audit_log` VALUES ('24', '18', null, '2', null, '2018-07-02 14:07:20', 'admin');

-- ----------------------------
-- Table structure for cn_cart
-- ----------------------------
DROP TABLE IF EXISTS `cn_cart`;
CREATE TABLE `cn_cart` (
  `cart_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '购物车ID',
  `good_spec_price_id` int(11) unsigned DEFAULT NULL COMMENT '商品规格价格id',
  `user_id` int(11) unsigned DEFAULT NULL COMMENT '用户ID',
  `buy_number` int(11) DEFAULT '1' COMMENT '购买数量',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `check_status` tinyint(2) DEFAULT '1' COMMENT '购物车状态：0,未选中；1,选中',
  PRIMARY KEY (`cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='购物车';

-- ----------------------------
-- Records of cn_cart
-- ----------------------------
INSERT INTO `cn_cart` VALUES ('19', '179', '10', '3', '2018-06-20 17:05:45', null, '1');
INSERT INTO `cn_cart` VALUES ('20', '185', '10', '6', '2018-06-20 17:06:00', null, '1');
INSERT INTO `cn_cart` VALUES ('21', '185', '10', '1', '2018-06-20 17:14:37', null, '1');
INSERT INTO `cn_cart` VALUES ('22', '179', '10', '1', '2018-06-20 17:15:00', null, '1');
INSERT INTO `cn_cart` VALUES ('23', '179', '10', '1', '2018-06-20 17:45:16', null, '1');
INSERT INTO `cn_cart` VALUES ('24', '179', '10', '1', '2018-06-20 17:45:22', null, '1');
INSERT INTO `cn_cart` VALUES ('25', '176', '10', '1', '2018-06-20 17:45:24', null, '1');
INSERT INTO `cn_cart` VALUES ('26', '176', '10', '1', '2018-06-20 17:49:05', null, '1');
INSERT INTO `cn_cart` VALUES ('28', '196', '9', '2', '2018-06-21 15:39:54', '2018-06-21 19:51:56', '1');

-- ----------------------------
-- Table structure for cn_category
-- ----------------------------
DROP TABLE IF EXISTS `cn_category`;
CREATE TABLE `cn_category` (
  `category_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父分类ID',
  `name` varchar(64) DEFAULT NULL COMMENT '分类名称',
  `sort` int(9) DEFAULT NULL COMMENT '排序',
  `type` tinyint(2) DEFAULT NULL COMMENT '目录类型 2=二级目录/1=一级目录/0=总目录',
  `status` tinyint(2) DEFAULT '0' COMMENT '状态 1=显示/0=隐藏',
  `show_in_commend` tinyint(2) DEFAULT '0' COMMENT '是否推荐（0：不推荐 1：推荐）',
  `show_in_nav` tinyint(2) DEFAULT '0' COMMENT '是否导航栏 1=显示/0=隐藏',
  `show_in_top` tinyint(2) DEFAULT '0' COMMENT '是否置顶 1=置顶/0=默认',
  `show_in_hot` tinyint(2) DEFAULT '0' COMMENT '是否热门 1=热门/0=默认',
  `icon` varchar(255) DEFAULT NULL COMMENT '分类小图标',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '更新者',
  `page_title` varchar(64) DEFAULT NULL COMMENT '页面标题',
  `page_description` varchar(64) DEFAULT NULL COMMENT '页面描述',
  `page_keyword` varchar(64) DEFAULT NULL COMMENT '页面关键词',
  `remarks` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '备注信息',
  `channel_id` varchar(255) DEFAULT NULL COMMENT '频道id',
  PRIMARY KEY (`category_id`),
  KEY `sort_index` (`sort`) USING BTREE,
  KEY `nav_index` (`show_in_nav`) USING BTREE,
  KEY `hot_index` (`show_in_hot`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Records of cn_category
-- ----------------------------
INSERT INTO `cn_category` VALUES ('2', '0', '喷绘耗材', null, '1', '1', '1', '1', '1', '1', null, '2017-02-25 21:44:43', '猫宁', '2018-06-21 14:33:27', 'admin', null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('3', '0', '写真耗材', null, '1', '1', null, '1', '1', null, null, '2018-05-21 11:24:34', '', '2018-06-19 10:41:24', 'admin', null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('4', '0', '标牌展示', null, '1', '1', null, '1', '1', null, null, '2018-05-21 11:28:30', '', '2018-06-19 10:41:36', 'admin', null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('5', '0', '板材型材', null, '1', '1', null, '1', '1', null, null, '2018-05-21 11:28:28', '', '2018-06-19 10:42:15', 'admin', null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('6', '0', '光电产品', null, '1', '1', null, '1', '1', null, null, '2018-05-21 11:28:24', '', '2018-06-19 10:42:00', 'admin', null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('7', '0', '机器配件', null, '1', '1', null, '1', '1', null, null, '2018-05-21 11:28:19', '', '2018-06-19 10:41:47', 'admin', null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('38', '2', '喷绘布', '1', '2', '1', '1', '1', '0', '1', null, null, '', '2018-06-26 17:37:59', 'admin', '', null, null, null, '1');
INSERT INTO `cn_category` VALUES ('57', '2', '黑白布', '1', '2', '1', '0', '1', '0', '0', null, '2018-05-29 16:51:48', 'admin', '2018-06-12 09:54:33', 'admin', '', '', '', '', '1');
INSERT INTO `cn_category` VALUES ('58', '2', '旗帜布', '7', '2', '1', '0', '1', '0', '0', null, '2018-05-29 17:05:34', 'admin', '2018-06-12 09:54:50', 'admin', null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('71', '2', '户外条幅布', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 10:00:28', 'admin', '2018-06-28 10:01:17', 'admin', null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('72', '2', '网格布', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 10:01:51', 'admin', '2018-06-12 10:33:27', 'admin', null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('73', '2', '车身贴', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 10:02:14', 'admin', '2018-07-05 14:44:45', 'admin', null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('74', '2', '单面透', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 10:02:56', 'admin', '2018-06-12 10:34:36', 'admin', null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('75', '2', '弱溶剂油画布', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 10:06:19', 'admin', '2018-06-12 10:34:43', 'admin', null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('76', '2', '弱溶剂PVC片', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 10:06:41', 'admin', '2018-06-12 10:34:49', 'admin', null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('77', '2', '弱溶剂背胶', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 10:07:03', 'admin', '2018-06-12 10:34:55', 'admin', null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('78', '2', '弱溶剂PP', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 10:07:19', 'admin', '2018-06-12 10:35:00', 'admin', null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('79', '2', '弱溶剂相纸', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 10:10:48', 'admin', '2018-06-12 10:35:06', 'admin', null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('80', '2', '玻璃贴', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 10:11:05', 'admin', '2018-06-12 10:35:12', 'admin', null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('81', '2', '墨水', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 10:11:28', 'admin', '2018-06-12 10:35:18', 'admin', null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('82', '3', '背胶', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 10:13:31', 'admin', '2018-06-12 10:35:25', 'admin', null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('83', '3', '冷裱膜', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 10:13:52', 'admin', '2018-06-12 10:35:30', 'admin', null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('84', '3', '合成纸', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 10:30:34', 'admin', '2018-06-12 10:35:37', 'admin', null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('85', '3', '相纸', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 10:42:35', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('86', '3', 'PVC硬片', null, '2', '1', '0', '1', '0', '0', 'http://img.cnadmart.com/20180621/cefe5f15f0f8437d9f5031297bd3849c.jpg', '2018-06-12 10:42:57', 'admin', '2018-06-21 14:34:47', 'admin', null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('87', '3', '写真布', null, '2', '1', '0', '1', '0', '0', 'http://img.cnadmart.com/20180621/a56ef80d8afc46c3bacfbbadb94de3e6.jpg', '2018-06-12 10:55:34', 'admin', '2018-06-21 14:38:47', 'admin', null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('88', '3', '油画布', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 10:55:56', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('89', '3', '灯片', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 10:57:04', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('90', '3', '地板膜', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 10:57:24', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('91', '3', '反光膜', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 10:57:47', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('92', '3', '即时贴', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 10:58:22', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('93', '3', '转移膜', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 10:58:56', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('94', '4', '标牌', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 11:12:45', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('95', '4', '易拉宝', null, '2', '1', '0', '1', '0', '0', 'http://img.cnadmart.com/20180621/574ebe22c1dc406cbe3caf6db994092e.jpg', '2018-06-12 11:13:04', 'admin', '2018-06-21 14:37:54', 'admin', null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('96', '4', 'X展架', null, '2', '1', '0', '1', '0', '0', 'http://img.cnadmart.com/20180621/bdfb722a206f45f2b6dcf1864e1dd512.jpg', '2018-06-12 11:13:21', 'admin', '2018-06-21 14:36:15', 'admin', null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('97', '4', '挂画架', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 11:13:37', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('98', '4', '注水旗杆', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 11:13:53', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('99', '4', '立人展架', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 11:14:08', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('100', '4', '海报架', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 11:14:23', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('101', '4', '栏杆座', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 11:14:39', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('102', '4', '告示指示牌', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 11:14:56', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('103', '4', '促销类', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 11:15:15', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('104', '5', '亚力克板', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 11:15:33', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('105', '5', '双色板', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 11:15:47', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('106', '5', 'KT板', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 11:16:04', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('107', '5', 'PS有机板', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 11:16:23', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('108', '5', 'PVC发泡板', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 11:16:43', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('109', '6', '灯带', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 11:17:07', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('110', '6', 'LED贴片模组', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 11:27:49', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('111', '6', 'LED开关电源', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 11:28:07', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('112', '6', 'LED显示屏单元板', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 11:28:34', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('113', '6', '灯箱', null, '2', '1', '0', '1', '0', '0', 'http://img.cnadmart.com/20180621/b74371b65eb646e6baa20d1135710420.jpg', '2018-06-12 11:28:56', 'admin', '2018-06-21 14:36:38', 'admin', null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('114', '7', '打扣机', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 12:01:01', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('115', '7', '刻字机', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 12:01:23', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('116', '7', '打印机', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 13:28:09', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('117', '7', '喷绘机', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 13:29:07', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('118', '7', '写真机', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 13:32:20', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('119', '7', '覆膜机', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 13:32:48', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('120', '7', '条幅机', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 13:35:12', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('121', '7', '旗帜机', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 13:35:32', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('122', '7', '印花机', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 13:35:54', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('123', '7', '雕刻机', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 13:36:13', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('124', '7', '弯字机', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 13:36:37', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('125', '7', '围字机', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 13:36:52', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('126', '7', '切割机', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 13:37:08', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('127', '7', '焊字机', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 13:37:51', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('128', '7', '打标机', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 13:38:09', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('129', '7', '吸塑机', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 13:38:31', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('130', '7', '多功能一体机', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 13:38:52', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('131', '7', '电话机', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 13:39:07', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('132', '7', '碎纸机', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 13:39:29', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('133', '7', '点钞机', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 13:39:45', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('134', '7', '装订机', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 13:40:01', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('135', '7', '过塑机', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 13:40:22', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('136', '7', '订书机', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 13:40:42', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('137', '7', '书壳机', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 13:41:00', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('138', '7', '棉胶类', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 13:41:18', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('139', '7', '扣眼', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 13:41:35', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('140', '7', '刮板', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 13:41:51', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('141', '7', '五金工具 ', null, '2', '1', '0', '1', '0', '0', null, '2018-06-12 13:42:06', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('142', '3', '双面胶', '0', '2', '1', '0', '1', '0', '0', null, '2018-06-15 13:53:17', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('143', '3', '单孔透', '0', '2', '1', '0', '1', '0', '0', null, '2018-06-15 14:01:34', 'admin', '2018-06-15 15:07:25', 'admin', null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('144', '3', '胶片', '0', '2', '1', '0', '1', '0', '0', null, '2018-06-15 14:06:59', 'admin', '2018-06-15 15:07:35', 'admin', null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('145', '3', '艺术布', '0', '2', '1', '0', '1', '0', '0', null, '2018-06-15 15:30:32', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('147', '6', '穿孔灯', '0', '2', '1', '0', '1', '0', '0', null, '2018-06-19 12:00:15', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('148', '6', '贴片灯', '0', '2', '1', '0', '1', '1', '0', null, '2018-06-19 13:48:57', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('149', '6', '数码管', '0', '2', '1', '0', '1', '1', '0', null, '2018-06-19 14:07:17', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('151', '4', '抽奖箱', '0', '2', '1', '0', '1', '0', '0', null, '2018-06-21 11:32:10', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('152', '4', '意见箱', '0', '2', '1', '0', '1', '0', '0', null, '2018-06-21 14:07:16', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('153', '4', '酒水牌', '0', '2', '1', '0', '1', '0', '0', null, '2018-06-21 15:11:06', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('154', '4', '营业执照框', '0', '2', '1', '0', '1', '0', '0', null, '2018-06-21 15:15:48', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('155', '4', '电梯广告框', '0', '2', '1', '0', '1', '0', '0', null, '2018-06-21 16:37:54', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('156', '4', '木托奖牌', '0', '2', '1', '0', '1', '0', '0', null, '2018-06-22 09:06:53', 'admin', null, null, null, null, null, null, '1');
INSERT INTO `cn_category` VALUES ('157', '4', '胸卡', '0', '2', '1', '0', '1', '0', '0', null, '2018-06-22 09:52:43', 'admin', null, null, null, null, null, null, '1');

-- ----------------------------
-- Table structure for cn_category_advert
-- ----------------------------
DROP TABLE IF EXISTS `cn_category_advert`;
CREATE TABLE `cn_category_advert` (
  `category_advert_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '类目广告ID',
  `category_id` bigint(20) DEFAULT NULL COMMENT '类目ID',
  `title` varchar(64) DEFAULT NULL COMMENT '标题',
  `sort` int(9) DEFAULT NULL COMMENT '排序',
  `href` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '链接地址',
  `status` tinyint(2) DEFAULT NULL COMMENT '状态 1=显示/0=隐藏',
  `pic_img` varchar(255) DEFAULT NULL COMMENT '展示图片',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '更新者',
  `begin_time` datetime DEFAULT NULL COMMENT '广告起始时间',
  `end_time` datetime DEFAULT NULL COMMENT '广告结束时间',
  `remarks` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`category_advert_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='类目广告表';

-- ----------------------------
-- Records of cn_category_advert
-- ----------------------------
INSERT INTO `cn_category_advert` VALUES ('1', '2', '测试产品广告4', '3', 'detail/1472581220748', '1', 'images/advert/20170228/1471798587971.jpg', null, '', null, null, '2017-04-05 18:09:16', '2017-06-30 14:39:50', '地方');
INSERT INTO `cn_category_advert` VALUES ('2', '2', '测试产品广告2', '2', 'detail/1472581220748', '1', 'images/advert/20170228/1471798587971.jpg', null, '', null, null, '2017-04-05 18:09:16', '2017-06-30 14:39:50', '地方');
INSERT INTO `cn_category_advert` VALUES ('3', '2', '测试产品广告1', '1', 'detail/1472581220748', '1', 'images/advert/20170228/1471798587971.jpg', null, '', null, null, '2017-04-05 18:09:16', '2017-06-30 14:39:50', '地方');
INSERT INTO `cn_category_advert` VALUES ('4', '3', '测试产品广告5', '1', 'detail/1472581220748', '1', 'images/advert/20170228/1471798587971.jpg', null, '', null, null, '2017-04-05 18:09:16', '2017-06-30 14:39:50', '地方');

-- ----------------------------
-- Table structure for cn_category_good
-- ----------------------------
DROP TABLE IF EXISTS `cn_category_good`;
CREATE TABLE `cn_category_good` (
  `category_good_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `category_id` bigint(20) NOT NULL,
  `category_name` varchar(100) NOT NULL DEFAULT '',
  `good_id` bigint(20) DEFAULT NULL COMMENT '商品id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(255) DEFAULT '' COMMENT '创建者',
  PRIMARY KEY (`category_good_id`)
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Records of cn_category_good
-- ----------------------------
INSERT INTO `cn_category_good` VALUES ('87', '38', '户外条幅布网格布车身贴单面透弱溶剂油画布弱溶剂PVC片弱溶剂背胶弱溶剂PP弱溶剂相纸玻璃贴墨水喷绘布黑白布旗帜布', '95', '2018-06-15 08:50:08', 'admin');
INSERT INTO `cn_category_good` VALUES ('88', '38', '户外条幅布网格布车身贴单面透弱溶剂油画布弱溶剂PVC片弱溶剂背胶弱溶剂PP弱溶剂相纸玻璃贴墨水喷绘布黑白布旗帜布', '96', '2018-06-15 08:59:31', 'admin');
INSERT INTO `cn_category_good` VALUES ('89', '38', '户外条幅布网格布车身贴单面透弱溶剂油画布弱溶剂PVC片弱溶剂背胶弱溶剂PP弱溶剂相纸玻璃贴墨水喷绘布黑白布旗帜布', '97', '2018-06-15 09:01:56', 'admin');
INSERT INTO `cn_category_good` VALUES ('91', '73', '户外条幅布网格布车身贴单面透弱溶剂油画布弱溶剂PVC片弱溶剂背胶弱溶剂PP弱溶剂相纸玻璃贴墨水喷绘布黑白布旗帜布', '99', '2018-06-15 09:16:21', 'admin');
INSERT INTO `cn_category_good` VALUES ('92', '72', '户外条幅布网格布车身贴单面透弱溶剂油画布弱溶剂PVC片弱溶剂背胶弱溶剂PP弱溶剂相纸玻璃贴墨水喷绘布黑白布旗帜布', '100', '2018-06-15 09:28:54', 'admin');
INSERT INTO `cn_category_good` VALUES ('93', '91', '背胶冷裱膜合成纸相纸PVC硬片写真布油画布灯片地板膜反光膜即时贴转移膜', '101', '2018-06-15 09:38:37', 'admin');
INSERT INTO `cn_category_good` VALUES ('94', '82', '背胶冷裱膜合成纸相纸PVC硬片写真布油画布灯片地板膜反光膜即时贴转移膜', '102', '2018-06-15 09:44:08', 'admin');
INSERT INTO `cn_category_good` VALUES ('95', '82', '背胶冷裱膜合成纸相纸PVC硬片写真布油画布灯片地板膜反光膜即时贴转移膜', '103', '2018-06-15 09:52:51', 'admin');
INSERT INTO `cn_category_good` VALUES ('96', '83', '背胶冷裱膜合成纸相纸PVC硬片写真布油画布灯片地板膜反光膜即时贴转移膜', '104', '2018-06-15 09:58:50', 'admin');
INSERT INTO `cn_category_good` VALUES ('97', '83', '背胶冷裱膜合成纸相纸PVC硬片写真布油画布灯片地板膜反光膜即时贴转移膜', '105', '2018-06-15 10:06:18', 'admin');
INSERT INTO `cn_category_good` VALUES ('98', '83', '背胶冷裱膜合成纸相纸PVC硬片写真布油画布灯片地板膜反光膜即时贴转移膜', '106', '2018-06-15 10:13:45', 'admin');
INSERT INTO `cn_category_good` VALUES ('99', '86', '背胶冷裱膜合成纸相纸PVC硬片写真布油画布灯片地板膜反光膜即时贴转移膜', '107', '2018-06-15 10:21:06', 'admin');
INSERT INTO `cn_category_good` VALUES ('101', '89', '背胶冷裱膜合成纸相纸PVC硬片写真布油画布灯片地板膜反光膜即时贴转移膜', '109', '2018-06-15 10:30:24', 'admin');
INSERT INTO `cn_category_good` VALUES ('102', '89', '背胶冷裱膜合成纸相纸PVC硬片写真布油画布灯片地板膜反光膜即时贴转移膜', '110', '2018-06-15 10:35:15', 'admin');
INSERT INTO `cn_category_good` VALUES ('103', '84', '背胶冷裱膜合成纸相纸PVC硬片写真布油画布灯片地板膜反光膜即时贴转移膜', '111', '2018-06-15 10:59:33', 'admin');
INSERT INTO `cn_category_good` VALUES ('104', '85', '背胶冷裱膜合成纸相纸PVC硬片写真布油画布灯片地板膜反光膜即时贴转移膜', '112', '2018-06-15 13:36:41', 'admin');
INSERT INTO `cn_category_good` VALUES ('105', '85', '背胶冷裱膜合成纸相纸PVC硬片写真布油画布灯片地板膜反光膜即时贴转移膜', '113', '2018-06-15 13:48:31', 'admin');
INSERT INTO `cn_category_good` VALUES ('106', '142', '背胶冷裱膜合成纸相纸PVC硬片写真布油画布灯片地板膜反光膜即时贴转移膜双面胶', '114', '2018-06-15 13:55:04', 'admin');
INSERT INTO `cn_category_good` VALUES ('107', '143', '背胶冷裱膜合成纸相纸PVC硬片写真布油画布灯片地板膜反光膜即时贴转移膜双面胶单孔透', '115', '2018-06-15 14:03:58', 'admin');
INSERT INTO `cn_category_good` VALUES ('108', '144', '背胶冷裱膜合成纸相纸PVC硬片写真布油画布灯片地板膜反光膜即时贴转移膜双面胶单孔透胶片', '116', '2018-06-15 14:09:31', 'admin');
INSERT INTO `cn_category_good` VALUES ('109', '90', '背胶冷裱膜合成纸相纸PVC硬片写真布油画布灯片地板膜反光膜即时贴转移膜双面胶单孔透胶片', '117', '2018-06-15 14:38:54', 'admin');
INSERT INTO `cn_category_good` VALUES ('110', '87', '背胶冷裱膜合成纸相纸PVC硬片写真布油画布灯片地板膜反光膜即时贴转移膜双面胶单孔透胶片', '118', '2018-06-15 15:17:42', 'admin');
INSERT INTO `cn_category_good` VALUES ('111', '88', '背胶冷裱膜合成纸相纸PVC硬片写真布油画布灯片地板膜反光膜即时贴转移膜双面胶单孔透胶片', '119', '2018-06-15 15:26:56', 'admin');
INSERT INTO `cn_category_good` VALUES ('112', '145', '背胶冷裱膜合成纸相纸PVC硬片写真布油画布灯片地板膜反光膜即时贴转移膜双面胶单孔透胶片艺术布', '120', '2018-06-15 15:31:09', 'admin');
INSERT INTO `cn_category_good` VALUES ('113', '88', '背胶冷裱膜合成纸相纸PVC硬片写真布油画布灯片地板膜反光膜即时贴转移膜双面胶单孔透胶片艺术布', '121', '2018-06-15 15:34:20', 'admin');
INSERT INTO `cn_category_good` VALUES ('114', '146', '户外条幅布网格布车身贴单面透弱溶剂油画布弱溶剂PVC片弱溶剂背胶弱溶剂PP弱溶剂相纸玻璃贴墨水天花软膜喷绘布黑白布旗帜布', '122', '2018-06-15 15:38:29', 'admin');
INSERT INTO `cn_category_good` VALUES ('115', '106', '亚力克板双色板KT板PS有机板PVC发泡板', '123', '2018-06-19 08:54:10', 'admin');
INSERT INTO `cn_category_good` VALUES ('116', '106', '亚力克板双色板KT板PS有机板PVC发泡板', '128', '2018-06-19 09:06:19', 'admin');
INSERT INTO `cn_category_good` VALUES ('117', '106', '亚力克板双色板KT板PS有机板PVC发泡板', '129', '2018-06-19 09:13:03', 'admin');
INSERT INTO `cn_category_good` VALUES ('118', '113', '灯带LED贴片模组LED开关电源LED显示屏单元板灯箱', '130', '2018-06-19 09:25:34', 'admin');
INSERT INTO `cn_category_good` VALUES ('119', '113', '灯带LED贴片模组LED开关电源LED显示屏单元板灯箱', '131', '2018-06-19 09:36:54', 'admin');
INSERT INTO `cn_category_good` VALUES ('120', '113', '灯带LED贴片模组LED开关电源LED显示屏单元板灯箱', '132', '2018-06-19 10:52:47', 'admin');
INSERT INTO `cn_category_good` VALUES ('121', '113', '灯带LED贴片模组LED开关电源LED显示屏单元板灯箱', '133', '2018-06-19 10:55:21', 'admin');
INSERT INTO `cn_category_good` VALUES ('122', '111', '灯带LED贴片模组LED开关电源LED显示屏单元板灯箱', '134', '2018-06-19 11:23:12', 'admin');
INSERT INTO `cn_category_good` VALUES ('123', '111', '灯带LED贴片模组LED开关电源LED显示屏单元板灯箱', '135', '2018-06-19 11:49:17', 'admin');
INSERT INTO `cn_category_good` VALUES ('124', '111', '灯带LED贴片模组LED开关电源LED显示屏单元板灯箱', '136', '2018-06-19 11:54:26', 'admin');
INSERT INTO `cn_category_good` VALUES ('125', '111', '灯带LED贴片模组LED开关电源LED显示屏单元板灯箱穿孔灯', '137', '2018-06-19 13:47:07', 'admin');
INSERT INTO `cn_category_good` VALUES ('128', '148', '灯带LED贴片模组LED开关电源LED显示屏单元板灯箱穿孔灯贴片灯', '140', '2018-06-19 13:55:10', 'admin');
INSERT INTO `cn_category_good` VALUES ('129', '148', '灯带LED贴片模组LED开关电源LED显示屏单元板灯箱穿孔灯贴片灯', '141', '2018-06-19 13:56:42', 'admin');
INSERT INTO `cn_category_good` VALUES ('130', '147', '灯带LED贴片模组LED开关电源LED显示屏单元板灯箱穿孔灯贴片灯', '142', '2018-06-19 13:59:45', 'admin');
INSERT INTO `cn_category_good` VALUES ('131', '149', '灯带LED贴片模组LED开关电源LED显示屏单元板灯箱穿孔灯贴片灯数码管', '143', '2018-06-19 14:07:38', 'admin');
INSERT INTO `cn_category_good` VALUES ('133', '106', '亚力克板双色板KT板PS有机板PVC发泡板', '145', '2018-06-19 14:12:19', 'admin');
INSERT INTO `cn_category_good` VALUES ('134', '106', '亚力克板双色板KT板PS有机板PVC发泡板', '146', '2018-06-19 14:15:35', 'admin');
INSERT INTO `cn_category_good` VALUES ('135', '106', '亚力克板双色板KT板PS有机板PVC发泡板', '147', '2018-06-19 14:18:40', 'admin');
INSERT INTO `cn_category_good` VALUES ('136', '106', '亚力克板双色板KT板PS有机板PVC发泡板', '148', '2018-06-19 14:24:03', 'admin');
INSERT INTO `cn_category_good` VALUES ('137', '106', '亚力克板双色板KT板PS有机板PVC发泡板', '149', '2018-06-19 14:26:42', 'admin');
INSERT INTO `cn_category_good` VALUES ('138', '106', '亚力克板双色板KT板PS有机板PVC发泡板', '150', '2018-06-19 14:27:40', 'admin');
INSERT INTO `cn_category_good` VALUES ('139', '104', '亚力克板双色板KT板PS有机板PVC发泡板', '151', '2018-06-20 08:43:11', 'admin');
INSERT INTO `cn_category_good` VALUES ('140', '104', '亚力克板双色板KT板PS有机板PVC发泡板', '152', '2018-06-20 08:48:30', 'admin');
INSERT INTO `cn_category_good` VALUES ('141', '104', '亚力克板双色板KT板PS有机板PVC发泡板', '153', '2018-06-20 09:33:13', 'admin');
INSERT INTO `cn_category_good` VALUES ('142', '107', '亚力克板双色板KT板PS有机板PVC发泡板', '154', '2018-06-20 09:44:35', 'admin');
INSERT INTO `cn_category_good` VALUES ('143', '108', '亚力克板双色板KT板PS有机板PVC发泡板', '155', '2018-06-20 09:49:52', 'admin');
INSERT INTO `cn_category_good` VALUES ('144', '103', '标牌易拉宝X展架挂画架注水旗杆立人展架海报架栏杆座告示指示牌促销类', '156', '2018-06-20 14:35:52', 'admin');
INSERT INTO `cn_category_good` VALUES ('146', '97', '标牌易拉宝X展架挂画架注水旗杆立人展架海报架栏杆座告示指示牌促销类', '158', '2018-06-20 14:45:54', 'admin');
INSERT INTO `cn_category_good` VALUES ('148', '103', '标牌易拉宝X展架挂画架注水旗杆立人展架海报架栏杆座告示指示牌促销类', '160', '2018-06-20 15:00:32', 'admin');
INSERT INTO `cn_category_good` VALUES ('149', '95', '标牌易拉宝X展架挂画架注水旗杆立人展架海报架栏杆座告示指示牌促销类', '161', '2018-06-20 15:30:00', 'admin');
INSERT INTO `cn_category_good` VALUES ('150', '99', '标牌易拉宝X展架挂画架注水旗杆立人展架海报架栏杆座告示指示牌促销类', '162', '2018-06-20 16:59:01', 'admin');
INSERT INTO `cn_category_good` VALUES ('151', '97', '标牌易拉宝X展架挂画架注水旗杆立人展架海报架栏杆座告示指示牌促销类', '163', '2018-06-21 09:33:29', 'admin');
INSERT INTO `cn_category_good` VALUES ('152', '97', '标牌易拉宝X展架挂画架注水旗杆立人展架海报架栏杆座告示指示牌促销类', '164', '2018-06-21 09:36:46', 'admin');
INSERT INTO `cn_category_good` VALUES ('154', '97', '标牌易拉宝X展架挂画架注水旗杆立人展架海报架栏杆座告示指示牌促销类', '166', '2018-06-21 09:46:14', 'admin');
INSERT INTO `cn_category_good` VALUES ('155', '97', '标牌易拉宝X展架挂画架注水旗杆立人展架海报架栏杆座告示指示牌促销类', '167', '2018-06-21 09:48:06', 'admin');
INSERT INTO `cn_category_good` VALUES ('156', '98', '标牌易拉宝X展架挂画架注水旗杆立人展架海报架栏杆座告示指示牌促销类', '168', '2018-06-21 09:58:31', 'admin');
INSERT INTO `cn_category_good` VALUES ('158', '103', '标牌易拉宝X展架挂画架注水旗杆立人展架海报架栏杆座告示指示牌促销类', '170', '2018-06-21 10:34:36', 'admin');
INSERT INTO `cn_category_good` VALUES ('159', '103', '标牌易拉宝X展架挂画架注水旗杆立人展架海报架栏杆座告示指示牌促销类', '171', '2018-06-21 10:37:39', 'admin');
INSERT INTO `cn_category_good` VALUES ('160', '96', '标牌易拉宝X展架挂画架注水旗杆立人展架海报架栏杆座告示指示牌促销类', '172', '2018-06-21 11:19:25', 'admin');
INSERT INTO `cn_category_good` VALUES ('161', '96', '标牌易拉宝X展架挂画架注水旗杆立人展架海报架栏杆座告示指示牌促销类', '173', '2018-06-21 11:24:36', 'admin');
INSERT INTO `cn_category_good` VALUES ('162', '96', '标牌易拉宝X展架挂画架注水旗杆立人展架海报架栏杆座告示指示牌促销类', '174', '2018-06-21 11:25:32', 'admin');
INSERT INTO `cn_category_good` VALUES ('164', '151', '标牌易拉宝X展架挂画架注水旗杆立人展架海报架栏杆座告示指示牌促销类抽奖箱', '176', '2018-06-21 11:34:22', 'admin');
INSERT INTO `cn_category_good` VALUES ('165', '152', '标牌易拉宝X展架挂画架注水旗杆立人展架海报架栏杆座告示指示牌促销类抽奖箱意见箱', '177', '2018-06-21 14:08:36', 'admin');
INSERT INTO `cn_category_good` VALUES ('166', '153', '标牌易拉宝X展架挂画架注水旗杆立人展架海报架栏杆座告示指示牌促销类抽奖箱意见箱酒水牌', '178', '2018-06-21 15:12:00', 'admin');
INSERT INTO `cn_category_good` VALUES ('167', '154', '标牌易拉宝X展架挂画架注水旗杆立人展架海报架栏杆座告示指示牌促销类抽奖箱意见箱酒水牌营业执照框', '179', '2018-06-21 16:07:17', 'admin');
INSERT INTO `cn_category_good` VALUES ('168', '155', '标牌易拉宝X展架挂画架注水旗杆立人展架海报架栏杆座告示指示牌促销类抽奖箱意见箱酒水牌营业执照框电梯广告框', '180', '2018-06-21 16:39:36', 'admin');
INSERT INTO `cn_category_good` VALUES ('169', '155', '标牌易拉宝X展架挂画架注水旗杆立人展架海报架栏杆座告示指示牌促销类抽奖箱意见箱酒水牌营业执照框电梯广告框', '181', '2018-06-21 16:42:08', 'admin');
INSERT INTO `cn_category_good` VALUES ('170', '156', '标牌易拉宝X展架挂画架注水旗杆立人展架海报架栏杆座告示指示牌促销类抽奖箱意见箱酒水牌营业执照框电梯广告框木托奖牌', '182', '2018-06-22 09:07:47', 'admin');
INSERT INTO `cn_category_good` VALUES ('171', '157', '标牌易拉宝X展架挂画架注水旗杆立人展架海报架栏杆座告示指示牌促销类抽奖箱意见箱酒水牌营业执照框电梯广告框木托奖牌胸卡', '183', '2018-06-22 09:57:18', 'admin');
INSERT INTO `cn_category_good` VALUES ('172', '157', '标牌易拉宝X展架挂画架注水旗杆立人展架海报架栏杆座告示指示牌促销类抽奖箱意见箱酒水牌营业执照框电梯广告框木托奖牌胸卡', '184', '2018-06-22 10:26:16', 'admin');
INSERT INTO `cn_category_good` VALUES ('173', '71', '户外条幅布网格布车身贴单面透弱溶剂油画布弱溶剂PVC片弱溶剂背胶弱溶剂PP弱溶剂相纸玻璃贴墨水天花软膜喷绘布黑白布旗帜布', '185', '2018-06-24 17:47:12', 'admin');
INSERT INTO `cn_category_good` VALUES ('174', '71', '户外条幅布网格布车身贴单面透弱溶剂油画布弱溶剂PVC片弱溶剂背胶弱溶剂PP弱溶剂相纸玻璃贴墨水天花软膜喷绘布黑白布旗帜布', '186', '2018-06-25 09:01:56', 'admin');
INSERT INTO `cn_category_good` VALUES ('175', '83', '背胶冷裱膜合成纸相纸PVC硬片写真布油画布灯片地板膜反光膜即时贴转移膜双面胶单孔透胶片艺术布', '187', '2018-06-25 21:51:57', 'admin');
INSERT INTO `cn_category_good` VALUES ('176', '71', '户外条幅布网格布车身贴单面透弱溶剂油画布弱溶剂PVC片弱溶剂背胶弱溶剂PP弱溶剂相纸玻璃贴墨水天花软膜喷绘布黑白布旗帜布', '188', '2018-06-25 22:49:18', 'admin');
INSERT INTO `cn_category_good` VALUES ('177', '71', '户外条幅布网格布车身贴单面透弱溶剂油画布弱溶剂PVC片弱溶剂背胶弱溶剂PP弱溶剂相纸玻璃贴墨水天花软膜喷绘布黑白布旗帜布', '189', '2018-06-26 10:23:58', 'admin');
INSERT INTO `cn_category_good` VALUES ('178', '71', '户外条幅布网格布车身贴单面透弱溶剂油画布弱溶剂PVC片弱溶剂背胶弱溶剂PP弱溶剂相纸玻璃贴墨水天花软膜喷绘布黑白布旗帜布', '190', '2018-06-26 14:27:57', 'admin');
INSERT INTO `cn_category_good` VALUES ('179', '85', '背胶冷裱膜合成纸相纸PVC硬片写真布油画布灯片地板膜反光膜即时贴转移膜双面胶单孔透胶片艺术布', '191', '2018-06-26 18:13:02', 'admin');
INSERT INTO `cn_category_good` VALUES ('180', '73', '户外条幅布网格布车身贴单面透弱溶剂油画布弱溶剂PVC片弱溶剂背胶弱溶剂PP弱溶剂相纸玻璃贴墨水天花软膜喷绘布黑白布旗帜布', '192', '2018-06-26 18:22:28', 'admin');
INSERT INTO `cn_category_good` VALUES ('181', '72', '户外条幅布网格布车身贴单面透弱溶剂油画布弱溶剂PVC片弱溶剂背胶弱溶剂PP弱溶剂相纸玻璃贴墨水天花软膜喷绘布黑白布旗帜布', '193', '2018-06-26 19:06:24', 'admin');
INSERT INTO `cn_category_good` VALUES ('182', '73', '户外条幅布网格布车身贴单面透弱溶剂油画布弱溶剂PVC片弱溶剂背胶弱溶剂PP弱溶剂相纸玻璃贴墨水天花软膜喷绘布黑白布旗帜布', '194', '2018-06-26 21:39:38', 'admin');
INSERT INTO `cn_category_good` VALUES ('183', '72', '户外条幅布网格布车身贴单面透弱溶剂油画布弱溶剂PVC片弱溶剂背胶弱溶剂PP弱溶剂相纸玻璃贴墨水天花软膜喷绘布黑白布旗帜布', '195', '2018-06-26 21:46:07', 'admin');
INSERT INTO `cn_category_good` VALUES ('184', '86', '背胶冷裱膜合成纸相纸PVC硬片写真布油画布灯片地板膜反光膜即时贴转移膜双面胶单孔透胶片艺术布', '196', '2018-06-26 22:32:14', 'admin');
INSERT INTO `cn_category_good` VALUES ('185', '87', '背胶冷裱膜合成纸相纸PVC硬片写真布油画布灯片地板膜反光膜即时贴转移膜双面胶单孔透胶片艺术布', '197', '2018-06-27 09:13:33', 'admin');
INSERT INTO `cn_category_good` VALUES ('186', '71', '户外条幅布网格布车身贴单面透弱溶剂油画布弱溶剂PVC片弱溶剂背胶弱溶剂PP弱溶剂相纸玻璃贴墨水天花软膜喷绘布黑白布旗帜布', '198', '2018-06-27 09:14:36', 'admin');
INSERT INTO `cn_category_good` VALUES ('187', '82', '背胶冷裱膜合成纸相纸PVC硬片写真布油画布灯片地板膜反光膜即时贴转移膜双面胶单孔透胶片艺术布', '199', '2018-06-27 09:15:35', 'admin');
INSERT INTO `cn_category_good` VALUES ('188', '71', '户外条幅布网格布车身贴单面透弱溶剂油画布弱溶剂PVC片弱溶剂背胶弱溶剂PP弱溶剂相纸玻璃贴墨水天花软膜喷绘布黑白布旗帜布', '200', '2018-06-27 09:57:33', 'admin');
INSERT INTO `cn_category_good` VALUES ('189', '72', '户外条幅布网格布车身贴单面透弱溶剂油画布弱溶剂PVC片弱溶剂背胶弱溶剂PP弱溶剂相纸玻璃贴墨水天花软膜喷绘布黑白布旗帜布', '201', '2018-06-27 13:44:07', 'admin');
INSERT INTO `cn_category_good` VALUES ('190', '72', '户外条幅布网格布车身贴单面透弱溶剂油画布弱溶剂PVC片弱溶剂背胶弱溶剂PP弱溶剂相纸玻璃贴墨水天花软膜喷绘布黑白布旗帜布', '202', '2018-06-27 15:54:39', 'admin');
INSERT INTO `cn_category_good` VALUES ('191', '72', '户外条幅布网格布车身贴单面透弱溶剂油画布弱溶剂PVC片弱溶剂背胶弱溶剂PP弱溶剂相纸玻璃贴墨水天花软膜喷绘布黑白布旗帜布', '203', '2018-06-27 16:42:49', 'admin');
INSERT INTO `cn_category_good` VALUES ('192', '98', '标牌易拉宝X展架挂画架注水旗杆立人展架海报架栏杆座告示指示牌促销类抽奖箱意见箱酒水牌营业执照框电梯广告框木托奖牌胸卡', '204', '2018-06-28 16:56:17', 'admin');
INSERT INTO `cn_category_good` VALUES ('193', '72', '户外条幅布网格布车身贴单面透弱溶剂油画布弱溶剂PVC片弱溶剂背胶弱溶剂PP弱溶剂相纸玻璃贴墨水天花软膜喷绘布黑白布旗帜布', '205', '2018-06-28 16:58:00', 'admin');
INSERT INTO `cn_category_good` VALUES ('194', '88', '背胶冷裱膜合成纸相纸PVC硬片写真布油画布灯片地板膜反光膜即时贴转移膜双面胶单孔透胶片艺术布', '206', '2018-06-30 22:33:11', 'admin');
INSERT INTO `cn_category_good` VALUES ('195', '71', '户外条幅布网格布车身贴单面透弱溶剂油画布弱溶剂PVC片弱溶剂背胶弱溶剂PP弱溶剂相纸玻璃贴墨水天花软膜喷绘布黑白布旗帜布', '207', '2018-07-01 01:41:55', 'admin');
INSERT INTO `cn_category_good` VALUES ('196', '72', '户外条幅布网格布车身贴单面透弱溶剂油画布弱溶剂PVC片弱溶剂背胶弱溶剂PP弱溶剂相纸玻璃贴墨水天花软膜喷绘布黑白布旗帜布', '208', '2018-07-02 08:30:38', 'admin');
INSERT INTO `cn_category_good` VALUES ('197', '72', '户外条幅布网格布车身贴单面透弱溶剂油画布弱溶剂PVC片弱溶剂背胶弱溶剂PP弱溶剂相纸玻璃贴墨水天花软膜喷绘布黑白布旗帜布', '209', '2018-07-02 10:45:31', 'admin');
INSERT INTO `cn_category_good` VALUES ('198', '87', '背胶冷裱膜合成纸相纸PVC硬片写真布油画布灯片地板膜反光膜即时贴转移膜双面胶单孔透胶片艺术布', '212', '2018-07-02 15:47:45', 'admin');
INSERT INTO `cn_category_good` VALUES ('199', '73', '户外条幅布网格布车身贴单面透弱溶剂油画布弱溶剂PVC片弱溶剂背胶弱溶剂PP弱溶剂相纸玻璃贴墨水天花软膜喷绘布黑白布旗帜布', '213', '2018-07-04 14:54:19', 'admin');
INSERT INTO `cn_category_good` VALUES ('200', '92', '背胶冷裱膜合成纸相纸PVC硬片写真布油画布灯片地板膜反光膜即时贴转移膜双面胶单孔透胶片艺术布', '214', '2018-07-05 15:58:27', 'admin');
INSERT INTO `cn_category_good` VALUES ('201', '86', '背胶冷裱膜合成纸相纸PVC硬片写真布油画布灯片地板膜反光膜即时贴转移膜双面胶单孔透胶片艺术布', '216', '2018-07-05 17:37:25', 'admin');
INSERT INTO `cn_category_good` VALUES ('202', '83', '背胶冷裱膜合成纸相纸PVC硬片写真布油画布灯片地板膜反光膜即时贴转移膜双面胶单孔透胶片艺术布', '217', '2018-07-05 18:50:20', 'admin');

-- ----------------------------
-- Table structure for cn_category_spec
-- ----------------------------
DROP TABLE IF EXISTS `cn_category_spec`;
CREATE TABLE `cn_category_spec` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL COMMENT '商品分类id（商品规格和商品分类关联）',
  `spec_name` varchar(50) NOT NULL DEFAULT '' COMMENT '规格名称',
  `sort` varchar(50) NOT NULL DEFAULT '' COMMENT '规格排序',
  `is_show` varchar(10) NOT NULL COMMENT '是否可见 1 可见 0不可见',
  `is_mobile_show` tinyint(1) DEFAULT NULL COMMENT '手机端是否可见 1可见 0不可见',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COMMENT='分类规格表';

-- ----------------------------
-- Records of cn_category_spec
-- ----------------------------
INSERT INTO `cn_category_spec` VALUES ('24', '2', '款式', '0', '0', '1');
INSERT INTO `cn_category_spec` VALUES ('25', '2', '规格', '0', '1', '1');
INSERT INTO `cn_category_spec` VALUES ('26', '3', '款式', '0', '1', '1');
INSERT INTO `cn_category_spec` VALUES ('27', '3', '规格', '0', '1', '1');
INSERT INTO `cn_category_spec` VALUES ('28', '5', '款式', '1', '1', '1');
INSERT INTO `cn_category_spec` VALUES ('29', '6', '款式', '1', '1', '1');
INSERT INTO `cn_category_spec` VALUES ('30', '7', '款式', '1', '1', '1');
INSERT INTO `cn_category_spec` VALUES ('31', '4', '规格', '1', '1', '1');
INSERT INTO `cn_category_spec` VALUES ('32', '5', '规格', '1', '1', '1');
INSERT INTO `cn_category_spec` VALUES ('33', '6', '规格', '1', '1', '1');
INSERT INTO `cn_category_spec` VALUES ('34', '7', '规格', '1', '1', '1');
INSERT INTO `cn_category_spec` VALUES ('35', '4', '款式', '0', '1', '1');
INSERT INTO `cn_category_spec` VALUES ('36', null, 'guige', '0', '1', '1');
INSERT INTO `cn_category_spec` VALUES ('37', null, 'test', '0', '1', '1');
INSERT INTO `cn_category_spec` VALUES ('38', '2', 'aaaa', '1', '1', '1');
INSERT INTO `cn_category_spec` VALUES ('39', '3', 'aaaa', '1', '1', '1');
INSERT INTO `cn_category_spec` VALUES ('40', '4', 'aaaa', '1', '1', '1');
INSERT INTO `cn_category_spec` VALUES ('41', '5', 'aaaa', '1', '1', '1');
INSERT INTO `cn_category_spec` VALUES ('42', '6', 'aaaa', '1', '1', '1');
INSERT INTO `cn_category_spec` VALUES ('43', '7', 'aaaa', '1', '1', '1');
INSERT INTO `cn_category_spec` VALUES ('44', '2', '第二规格', '1', '1', '1');
INSERT INTO `cn_category_spec` VALUES ('45', '3', '第二规格', '1', '1', '1');
INSERT INTO `cn_category_spec` VALUES ('46', '4', '第二规格', '1', '1', '1');
INSERT INTO `cn_category_spec` VALUES ('47', '5', '第二规格', '1', '1', '1');
INSERT INTO `cn_category_spec` VALUES ('48', '6', '第二规格', '1', '1', '1');
INSERT INTO `cn_category_spec` VALUES ('49', '7', '第二规格', '1', '1', '1');
INSERT INTO `cn_category_spec` VALUES ('50', '2', '111', '0', '1', '1');
INSERT INTO `cn_category_spec` VALUES ('51', '3', '111', '0', '1', '1');
INSERT INTO `cn_category_spec` VALUES ('52', '4', '111', '0', '1', '1');
INSERT INTO `cn_category_spec` VALUES ('53', '5', '111', '0', '1', '1');
INSERT INTO `cn_category_spec` VALUES ('54', '6', '111', '0', '1', '1');
INSERT INTO `cn_category_spec` VALUES ('55', '7', '111', '0', '1', '1');
INSERT INTO `cn_category_spec` VALUES ('56', '2', '11111', '0', '1', '1');
INSERT INTO `cn_category_spec` VALUES ('57', '3', '11111', '0', '1', '1');
INSERT INTO `cn_category_spec` VALUES ('58', '4', '11111', '0', '1', '1');
INSERT INTO `cn_category_spec` VALUES ('59', '5', '11111', '0', '1', '1');
INSERT INTO `cn_category_spec` VALUES ('60', '6', '11111', '0', '1', '1');
INSERT INTO `cn_category_spec` VALUES ('61', '7', '11111', '0', '1', '1');
INSERT INTO `cn_category_spec` VALUES ('62', '5', 'demo', '0', '1', '1');
INSERT INTO `cn_category_spec` VALUES ('63', '2', '123', '0', '1', '1');
INSERT INTO `cn_category_spec` VALUES ('64', '3', '123', '0', '1', '1');
INSERT INTO `cn_category_spec` VALUES ('65', '2', '1', '0', '1', '1');
INSERT INTO `cn_category_spec` VALUES ('66', '3', '1', '0', '1', '1');
INSERT INTO `cn_category_spec` VALUES ('67', '4', '1', '0', '1', '1');
INSERT INTO `cn_category_spec` VALUES ('68', '6', '1', '0', '1', '1');
INSERT INTO `cn_category_spec` VALUES ('69', null, 'weq', '0', '1', '1');
INSERT INTO `cn_category_spec` VALUES ('70', '2', '321321', '0', '1', '1');
INSERT INTO `cn_category_spec` VALUES ('71', '3', '321321', '0', '1', '1');
INSERT INTO `cn_category_spec` VALUES ('72', '4', '321321', '0', '1', '1');
INSERT INTO `cn_category_spec` VALUES ('73', '5', '321321', '0', '1', '1');
INSERT INTO `cn_category_spec` VALUES ('74', '7', '321321', '0', '1', '1');
INSERT INTO `cn_category_spec` VALUES ('75', null, '33', '330', '1', '1');

-- ----------------------------
-- Table structure for cn_channel
-- ----------------------------
DROP TABLE IF EXISTS `cn_channel`;
CREATE TABLE `cn_channel` (
  `channel_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '频道名称',
  `sort` int(3) DEFAULT NULL,
  `is_show` tinyint(1) DEFAULT NULL COMMENT '是否展示（0展示，1不展示）',
  `model` tinyint(1) DEFAULT NULL COMMENT '模式 1:商城 2：服务',
  PRIMARY KEY (`channel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cn_channel
-- ----------------------------
INSERT INTO `cn_channel` VALUES ('1', '广告器材', '1', null, null);
INSERT INTO `cn_channel` VALUES ('2', '素材/模板', '2', null, null);
INSERT INTO `cn_channel` VALUES ('8', '广告制作', '4', null, null);
INSERT INTO `cn_channel` VALUES ('10', '自助设计', '6', null, null);
INSERT INTO `cn_channel` VALUES ('11', '广告金融', '7', null, null);
INSERT INTO `cn_channel` VALUES ('12', '广告商学院', '8', null, null);
INSERT INTO `cn_channel` VALUES ('13', '广告设计', '9', null, null);
INSERT INTO `cn_channel` VALUES ('14', '企业服务', '10', null, null);
INSERT INTO `cn_channel` VALUES ('15', '技术开发', '11', null, null);
INSERT INTO `cn_channel` VALUES ('16', '自助视频', '12', null, null);
INSERT INTO `cn_channel` VALUES ('17', '行业信息', '13', null, null);

-- ----------------------------
-- Table structure for cn_express_company
-- ----------------------------
DROP TABLE IF EXISTS `cn_express_company`;
CREATE TABLE `cn_express_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_number` varchar(255) DEFAULT NULL COMMENT '快递公司编号',
  `company_name` varchar(255) DEFAULT NULL COMMENT '快递公司名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cn_express_company
-- ----------------------------
INSERT INTO `cn_express_company` VALUES ('5', 'EMS', 'EMS');
INSERT INTO `cn_express_company` VALUES ('7', 'HHTT', '天天快递');
INSERT INTO `cn_express_company` VALUES ('8', 'QFKD', '全峰快递');
INSERT INTO `cn_express_company` VALUES ('9', 'SF', '顺丰快递');
INSERT INTO `cn_express_company` VALUES ('10', 'YD4', '韵达快递');

-- ----------------------------
-- Table structure for cn_good
-- ----------------------------
DROP TABLE IF EXISTS `cn_good`;
CREATE TABLE `cn_good` (
  `good_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `good_name` varchar(50) NOT NULL DEFAULT '' COMMENT '商品名称',
  `good_number` varchar(70) DEFAULT NULL COMMENT '商品编号',
  `max_price` decimal(10,2) DEFAULT '0.00' COMMENT '最大价格',
  `min_price` decimal(10,2) DEFAULT '0.00' COMMENT '最小价格',
  `introduce` varchar(255) DEFAULT '' COMMENT '商品简介',
  `pic_img` varchar(255) DEFAULT '' COMMENT '展示图片',
  `show_in_top` tinyint(1) DEFAULT '0' COMMENT '是否置顶 1=置顶/0=默认',
  `show_in_nav` tinyint(1) DEFAULT '0' COMMENT '是否导航栏 1=显示/0=隐藏',
  `show_in_like` tinyint(1) DEFAULT '0' COMMENT '猜你喜欢 1=显示/0=隐藏',
  `show_in_hot` tinyint(1) DEFAULT '0' COMMENT '是否热门 1=热门/0=默认',
  `show_in_shelve` tinyint(1) DEFAULT '0' COMMENT '是否上架：1=上架/0=下架',
  `search_key` varchar(255) DEFAULT '' COMMENT '搜索的关键词',
  `units` varchar(10) DEFAULT NULL COMMENT '单位',
  `activate` tinyint(1) DEFAULT '0' COMMENT '激活状态(0:未激活 1：激活)',
  `page_title` varchar(255) DEFAULT NULL COMMENT '页面标题',
  `page_description` varchar(255) DEFAULT '' COMMENT '页面的描述',
  `page_keyword` varchar(255) DEFAULT '' COMMENT '页面的关键词',
  `remarks` varchar(255) DEFAULT '' COMMENT '备注信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `shelve_time` datetime DEFAULT NULL COMMENT '上架时间',
  `shelve_by` varchar(64) DEFAULT '' COMMENT '上架人',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `mart_id` bigint(20) DEFAULT NULL COMMENT '商户id',
  `del_flag` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`good_id`)
) ENGINE=InnoDB AUTO_INCREMENT=218 DEFAULT CHARSET=utf8 COMMENT='商品表';

-- ----------------------------
-- Records of cn_good
-- ----------------------------
INSERT INTO `cn_good` VALUES ('95', '喷绘布蓝标', null, '3.00', '2.00', '111111', null, '0', '0', '0', '0', '1', '', '平方', '1', '喷绘耗材', '喷绘耗材', '喷绘耗材', '1111111', '2018-06-15 08:50:07', 'admin', null, '', 'admin', '2018-07-05 19:14:15', '1', null);
INSERT INTO `cn_good` VALUES ('96', '喷绘布绿标', null, '0.00', '0.00', '', 'http://img.cnadmart.com/20180615/7690cefa49db420888ce58cc69e69a5e.png', '0', '0', '0', '0', '0', '', '平方', '1', null, '', '', '', '2018-06-15 08:59:31', 'admin', null, '', 'admin', '2018-07-05 18:53:07', '1', null);
INSERT INTO `cn_good` VALUES ('97', '喷绘布紫标', null, '2.25', '2.25', '', 'http://img.cnadmart.com/20180615/e9af2bef260a4573ac1452b5f66cb186.png', '0', '0', '0', '0', '1', '', '平方', '1', null, '', '', '', '2018-06-15 09:01:56', 'admin', null, '', 'admin', '2018-07-01 23:29:42', '1', null);
INSERT INTO `cn_good` VALUES ('99', '车贴', null, '4.60', '2.85', '', 'http://img.cnadmart.com/20180615/798c1e0f98634a6abbe4569531237c9c.png', '0', '0', '0', '0', '1', '', '平方', '1', null, '', '', '', '2018-06-15 09:16:21', 'admin', null, '', 'admin', '2018-07-01 23:30:07', '1', null);
INSERT INTO `cn_good` VALUES ('100', '网格布', null, '3.70', '3.70', '', 'http://img.cnadmart.com/20180615/dde80de69632402082fe557659554418.jpg', '0', '0', '0', '0', '1', '', '平方', '1', null, '', '', '', '2018-06-15 09:28:54', 'admin', null, '', 'admin', '2018-06-27 10:00:30', '1', null);
INSERT INTO `cn_good` VALUES ('101', '可喷绘反光膜', null, '13.00', '13.00', '', 'http://img.cnadmart.com/20180615/55a2471b927b4486ad5cec3e3375ad71.jpg', '0', '0', '0', '0', '1', '', '平方', '1', null, '', '', '', '2018-06-15 09:38:36', 'admin', null, '', 'admin', '2018-06-15 09:39:50', '1', null);
INSERT INTO `cn_good` VALUES ('102', '户内背胶', null, '1.65', '2.10', '', 'http://img.cnadmart.com/20180615/275095df3361461cbc2c6872b2c57c0a.jpg', '0', '0', '0', '0', '1', '', '平方', '1', null, '', '', '', '2018-06-15 09:44:08', 'admin', null, '', 'admin', '2018-06-15 09:45:13', '1', null);
INSERT INTO `cn_good` VALUES ('103', '户外背胶', null, '0.00', '2.00', '', 'http://img.cnadmart.com/20180615/009118d7e3da4c8b9ec0217ce2eece47.png', '0', '0', '0', '0', '1', '', '平方', '1', null, '', '', '', '2018-06-15 09:52:51', 'admin', null, '', 'admin', '2018-06-26 13:05:12', '1', null);
INSERT INTO `cn_good` VALUES ('104', '冷裱膜', null, '1.85', '2.10', '', 'http://img.cnadmart.com/20180615/3b46e689bf38405d961dccee61dd0b30.png', '0', '0', '0', '0', '1', '', '平方', '1', null, '', '', '', '2018-06-15 09:58:50', 'admin', null, '', 'admin', '2018-06-15 10:01:28', '1', null);
INSERT INTO `cn_good` VALUES ('105', '覆膜机专用冷裱膜', null, '1.30', '1.30', '', 'http://img.cnadmart.com/20180615/fcc0b3b124684942a6077340c33f330e.png', '0', '0', '0', '0', '1', '', '平方', '1', null, '', '', '', '2018-06-15 10:06:18', 'admin', null, '', 'admin', '2018-06-15 10:07:21', '1', null);
INSERT INTO `cn_good` VALUES ('106', '十字纹冷裱膜', null, '5.50', '5.50', '', 'http://img.cnadmart.com/20180615/ed4caeac710144aea9907128b096ce58.png', '0', '0', '0', '0', '1', '', '平方', '1', null, '', '', '', '2018-06-15 10:13:45', 'admin', null, '', 'admin', '2018-06-15 10:21:58', '1', null);
INSERT INTO `cn_good` VALUES ('107', 'PVC硬片', null, '3.50', '4.50', '', 'http://img.cnadmart.com/20180615/ec96b14713b84707a5d9fb5b9149be5e.jpg', '0', '0', '0', '0', '1', '', '平方', '1', null, '', '', '', '2018-06-15 10:21:06', 'admin', null, '', 'admin', '2018-06-15 10:22:02', '1', null);
INSERT INTO `cn_good` VALUES ('109', '水性被喷灯片（户内）', null, '3.20', '4.00', '', null, '0', '0', '0', '0', '1', '', '平方', '1', null, '', '', '', '2018-06-15 10:30:24', 'admin', null, '', 'admin', '2018-06-15 11:04:20', '1', null);
INSERT INTO `cn_good` VALUES ('110', '弱溶剂正喷灯片（户外）', null, '7.00', '7.00', '', 'http://img.cnadmart.com/20180615/729e7a091b0e4139b6cf47ac445c10d0.jpg', '0', '0', '0', '0', '1', '', '平方', '1', null, '', '', '', '2018-06-15 10:35:15', 'admin', null, '', 'admin', '2018-06-15 10:53:22', '1', null);
INSERT INTO `cn_good` VALUES ('111', 'PP合成纸', null, '1.90', '3.10', '', 'http://img.cnadmart.com/20180615/d746d903466549319dea00823898a2ea.jpg', '0', '0', '0', '0', '1', '', '平方', '1', null, '', '', '', '2018-06-15 10:59:33', 'admin', null, '', 'admin', '2018-06-15 11:00:43', '1', null);
INSERT INTO `cn_good` VALUES ('112', '高光相纸（户内）', null, '2.50', '3.00', '', 'http://img.cnadmart.com/20180615/79c993c9b2d04deab197b3d0aed1024c.jpg', '0', '0', '0', '0', '1', '', '平方', '1', null, '', '', '', '2018-06-15 13:36:41', 'admin', null, '', 'admin', '2018-06-15 13:49:55', '1', null);
INSERT INTO `cn_good` VALUES ('113', '弱溶剂相纸（户外）', null, '5.00', '6.00', '', 'http://img.cnadmart.com/20180615/80e7db82e37643be9e127d71f1e07551.jpg', '0', '0', '0', '0', '1', '', '平方', '1', null, '', '', '', '2018-06-15 13:48:31', 'admin', null, '', 'admin', '2018-06-15 13:49:34', '1', null);
INSERT INTO `cn_good` VALUES ('114', '透明双面胶', null, '3.80', '3.80', '', 'http://img.cnadmart.com/20180615/fa268208cf7148c09ec5cb72de220cf9.jpg', '0', '0', '0', '0', '1', '', '平方', '1', null, '', '', '', '2018-06-15 13:55:04', 'admin', null, '', 'admin', '2018-06-15 13:56:01', '1', null);
INSERT INTO `cn_good` VALUES ('115', '单孔透', null, '6.20', '6.20', '', 'http://img.cnadmart.com/20180615/fa06cfd294b148a281871fefae4866f4.png', '0', '0', '0', '0', '0', '', '平方', '1', null, '', '', '', '2018-06-15 14:03:58', 'admin', null, '', 'admin', '2018-06-15 14:05:18', '1', null);
INSERT INTO `cn_good` VALUES ('116', 'X展架专用胶片', null, '6.50', '6.50', '', 'http://img.cnadmart.com/20180615/84704c2c79744e4d88d59e25e2f5a9c7.png', '0', '0', '0', '0', '1', '', null, '1', null, '', '', '', '2018-06-15 14:09:31', 'admin', null, '', 'admin', '2018-06-15 14:12:49', '1', null);
INSERT INTO `cn_good` VALUES ('117', '地板膜', null, '6.50', '8.00', '', 'http://img.cnadmart.com/20180615/443d50701a5b4816b96f32d66d018374.jpg', '0', '0', '0', '0', '1', '', 'pfan', '1', null, '', '', '', '2018-06-15 14:38:54', 'admin', null, '', 'admin', '2018-06-15 15:31:45', '1', null);
INSERT INTO `cn_good` VALUES ('118', '防水写真布', null, '3.00', '3.00', '', 'http://img.cnadmart.com/20180615/37ee00c5e58c4a4e9fe9a8ef5f4bc115.jpg', '0', '0', '0', '0', '1', '', '平方', '1', null, '', '', '', '2018-06-15 15:17:42', 'admin', null, '', 'admin', '2018-06-15 15:31:48', '1', null);
INSERT INTO `cn_good` VALUES ('119', '油画布', null, '7.00', '13.00', '', 'http://img.cnadmart.com/20180615/638f7d0642f84f2da1f4f5d7c91727d3.jpg', '0', '0', '0', '0', '1', '', '平方', '1', null, '', '', '', '2018-06-15 15:26:56', 'admin', null, '', 'admin', '2018-06-15 15:31:51', '1', null);
INSERT INTO `cn_good` VALUES ('120', '防水艺术布', null, '5.00', '5.00', '', 'http://img.cnadmart.com/20180615/4d721bdacc6840728cc715d58d89a839.png', '0', '0', '0', '0', '1', '', '平方', '1', null, '', '', '', '2018-06-15 15:31:09', 'admin', null, '', 'admin', '2018-06-15 15:31:53', '1', null);
INSERT INTO `cn_good` VALUES ('121', '防水棉质油画布', null, '15.00', '15.00', '', 'http://img.cnadmart.com/20180615/c4c17fd4aa9d40d29f4908a0d8f0673b.png', '0', '0', '0', '0', '1', '', '平方', '1', null, '', '', '', '2018-06-15 15:34:20', 'admin', null, '', 'admin', '2018-06-19 08:59:24', '1', null);
INSERT INTO `cn_good` VALUES ('122', '天花软膜', null, '3.30', '3.30', '', 'http://img.cnadmart.com/20180615/3076feafdd74414e8116fb139553368c.jpg', '0', '0', '0', '0', '1', '', '平方', '1', null, '', '', '', '2018-06-15 15:38:29', 'admin', null, '', 'admin', '2018-06-19 08:57:46', '1', null);
INSERT INTO `cn_good` VALUES ('123', 'KT板 普通板（20张/包）', null, '0.00', '0.00', '', 'http://img.cnadmart.com/20180619/7560ad1f14c543309bc839f3232cc3e0.png', '0', '0', '0', '0', '1', '', '张', '0', null, '', '', '', '2018-06-19 08:54:10', 'admin', null, '', 'admin', '2018-06-19 08:57:41', '1', null);
INSERT INTO `cn_good` VALUES ('128', 'KT板 布纹板（20张/包）', null, '9.00', '10.00', '', 'http://img.cnadmart.com/20180619/ae9f30d642754b25abc4338719395799.png', '0', '0', '0', '0', '0', '', '张', '1', null, '', '', '', '2018-06-19 09:06:19', 'admin', null, '', 'admin', '2018-06-19 09:06:47', '1', null);
INSERT INTO `cn_good` VALUES ('129', 'KT板 单晶板（10张/包）', null, '9.00', '10.50', '', 'http://img.cnadmart.com/20180619/3609c18bc5234610abd2cd7e1efa3530.jpg', '0', '0', '0', '0', '0', '', '张', '1', null, '', '', '', '2018-06-19 09:13:03', 'admin', null, '', 'admin', '2018-06-19 09:13:36', '1', null);
INSERT INTO `cn_good` VALUES ('130', '广告灯箱 超薄灯箱', null, '180.00', '180.00', '', 'http://img.cnadmart.com/20180619/d6c969ff69c043dcb860026de8f3df1d.jpg', '0', '0', '0', '0', '1', '', '平方', '1', null, '', '', '', '2018-06-19 09:25:34', 'admin', null, '', 'admin', '2018-06-19 09:37:48', '1', null);
INSERT INTO `cn_good` VALUES ('131', '广告灯箱 卡布灯箱', null, '260.00', '300.00', '', 'http://img.cnadmart.com/20180619/eac2f65a808f45609ba1aedd8cad974d.jpg', '0', '0', '0', '0', '1', '', '平方', '1', null, '', '', '', '2018-06-19 09:36:54', 'admin', null, '', 'admin', '2018-06-19 09:37:44', '1', null);
INSERT INTO `cn_good` VALUES ('132', '广告灯箱 吸塑灯箱', null, '60.00', '110.00', '', 'http://img.cnadmart.com/20180619/22485e6da50747cc8a0d3c28c0cec798.jpg', '0', '0', '0', '0', '1', '', '平方', '1', null, '', '', '', '2018-06-19 10:52:47', 'admin', null, '', 'admin', '2018-06-19 10:54:22', '1', null);
INSERT INTO `cn_good` VALUES ('133', '广告灯箱 点餐灯箱', null, '80.00', '80.00', '', 'http://img.cnadmart.com/20180619/8d0549a14769409c838b3f7d0f193d97.jpg', '0', '0', '0', '0', '1', '', '平方', '1', null, '', '', '', '2018-06-19 10:55:21', 'admin', null, '', 'admin', '2018-06-19 11:45:01', '1', null);
INSERT INTO `cn_good` VALUES ('134', '铁壳防雨电源', null, '30.00', '48.00', '', '', '0', '0', '0', '0', '1', '', '个', '1', null, '', '', '', '2018-06-19 11:23:12', 'admin', null, '', 'admin', '2018-06-19 11:44:58', '1', null);
INSERT INTO `cn_good` VALUES ('135', '铝壳防雨电源', null, '30.00', '48.00', '', 'http://img.cnadmart.com/20180619/bbe33674f45a42b4b1cffbad9f33b780.png', '0', '0', '0', '0', '1', '', '个', '1', null, '', '', '', '2018-06-19 11:49:17', 'admin', null, '', 'admin', '2018-06-19 14:16:38', '1', null);
INSERT INTO `cn_good` VALUES ('136', '卡布灯箱电源', null, '53.00', '60.00', '', '', '0', '0', '0', '0', '1', '', '个', '1', null, '', '', '', '2018-06-19 11:54:26', 'admin', null, '', 'admin', '2018-06-19 14:16:34', '1', null);
INSERT INTO `cn_good` VALUES ('137', '超薄灯箱电源', null, '15.00', '30.00', '', 'http://img.cnadmart.com/20180619/8f0946480ef548f8bef32d2ced65de4d.png', '0', '0', '0', '0', '1', '', '个', '1', null, '', '', '', '2018-06-19 13:47:07', 'admin', null, '', 'admin', '2018-06-19 14:16:31', '1', null);
INSERT INTO `cn_good` VALUES ('140', '贴片灯5730', null, '0.20', '0.24', '', 'http://img.cnadmart.com/20180619/05c1d120dc85442ca0dda9e6f55fd312.jpg', '0', '0', '0', '0', '1', '', '个', '1', null, '', '', '', '2018-06-19 13:55:10', 'admin', null, '', 'admin', '2018-06-19 14:16:28', '1', null);
INSERT INTO `cn_good` VALUES ('141', '贴片灯5054', null, '0.26', '0.29', '', 'http://img.cnadmart.com/20180619/2ebd50486b0e476791753706e04c069c.jpg', '0', '0', '0', '0', '1', '', '个', '1', null, '', '', '', '2018-06-19 13:56:42', 'admin', null, '', 'admin', '2018-06-19 14:16:25', '1', null);
INSERT INTO `cn_good` VALUES ('142', '穿孔灯', null, '0.10', '0.13', '', 'http://img.cnadmart.com/20180619/06d45b4e702047d8ace4b9993d6f38cc.jpg', '0', '0', '0', '0', '1', '', '个', '1', null, '', '', '', '2018-06-19 13:59:45', 'admin', null, '', 'admin', '2018-06-19 14:16:19', '1', null);
INSERT INTO `cn_good` VALUES ('143', '数码管', null, '12.00', '13.00', '', 'http://img.cnadmart.com/20180619/b9aa3acb9fec4a069ad8d475d78295a9.jpg', '0', '0', '0', '0', '1', '', '个', '1', null, '', '', '', '2018-06-19 14:07:38', 'admin', null, '', 'admin', '2018-06-19 14:16:16', '1', null);
INSERT INTO `cn_good` VALUES ('145', 'KT板 布纹板（20张/包）', null, '9.00', '10.00', '', 'http://img.cnadmart.com/20180619/2a6f30734f1a4d7a88475bf32dd7e889.png', '0', '0', '0', '0', '1', '', '张', '1', null, '', '', '', '2018-06-19 14:12:19', 'admin', null, '', 'admin', '2018-06-19 14:13:13', '1', null);
INSERT INTO `cn_good` VALUES ('146', 'KT板 单晶板（10张/包）', null, '9.00', '10.50', '', 'http://img.cnadmart.com/20180619/2206563a4ea446ac8f5e80db754a42b9.jpg', '0', '0', '0', '0', '1', '', '张', '1', null, '', '', '', '2018-06-19 14:15:35', 'admin', null, '', 'admin', '2018-06-19 14:16:11', '1', null);
INSERT INTO `cn_good` VALUES ('147', 'KT板 双晶板（10张/包）', null, '9.50', '11.50', '', '', '0', '0', '0', '0', '1', '', '张', '1', null, '', '', '', '2018-06-19 14:18:40', 'admin', null, '', 'admin', '2018-06-19 14:28:02', '1', null);
INSERT INTO `cn_good` VALUES ('148', 'KT板 龙卡板（10张/包）', null, '14.50', '16.50', '', 'http://img.cnadmart.com/20180619/ecf44c92d0d544369a2108039e8375ed.jpg', '0', '0', '0', '0', '1', '', '张', '1', null, '', '', '', '2018-06-19 14:24:03', 'admin', null, '', 'admin', '2018-06-19 14:28:05', '1', null);
INSERT INTO `cn_good` VALUES ('149', 'KT板 涂塑板（10张/包）', null, '11.00', '13.00', '', 'http://img.cnadmart.com/20180619/a7fdee1564574517ba25842eb2610062.png', '0', '0', '0', '0', '1', '', '张', '1', null, '', '', '', '2018-06-19 14:26:42', 'admin', null, '', 'admin', '2018-06-19 14:28:09', '1', null);
INSERT INTO `cn_good` VALUES ('150', 'KT板 1cm雕刻龙鑫板（10张/包）', null, '26.00', '26.00', '', '', '0', '0', '0', '0', '1', '', '张', '1', null, '', '', '', '2018-06-19 14:27:40', 'admin', null, '', 'admin', '2018-06-19 14:28:12', '1', null);
INSERT INTO `cn_good` VALUES ('151', '亚克力吸塑板', null, '165.00', '225.00', '', 'http://img.cnadmart.com/20180620/740ed082d6d8489c96eb9a5fd872c7f8.jpg', '0', '0', '0', '0', '1', '', '张', '1', null, '', '', '', '2018-06-20 08:43:11', 'admin', null, '', 'admin', '2018-06-20 08:49:47', '1', null);
INSERT INTO `cn_good` VALUES ('152', '亚克力吸塑板', null, '165.00', '165.00', '', null, '0', '0', '0', '0', '1', '', '张', '1', null, '', '', '', '2018-06-20 08:48:30', 'admin', null, '', 'admin', '2018-06-21 11:39:00', '1', null);
INSERT INTO `cn_good` VALUES ('153', '亚克力透明板', null, '155.00', '1350.00', '', 'http://img.cnadmart.com/20180620/1eaad80d8696405884db02541431da28.png', '0', '0', '0', '0', '1', '', '张', '1', null, '', '', '', '2018-06-20 09:33:12', 'admin', null, '', 'admin', '2018-06-20 09:48:08', '1', null);
INSERT INTO `cn_good` VALUES ('154', 'PS有机板', null, '43.00', '200.00', '', 'http://img.cnadmart.com/20180620/94b10eaff05d48909ce839f92154e1c8.jpg', '0', '0', '0', '0', '1', '', '张', '1', null, '', '', '', '2018-06-20 09:44:35', 'admin', null, '', 'admin', '2018-06-20 09:48:05', '1', null);
INSERT INTO `cn_good` VALUES ('155', 'PVC自由发泡板', null, '21.00', '128.00', '', 'http://img.cnadmart.com/20180620/34ff465670764fe58e0ad3f43aa8eb68.jpg', '0', '0', '0', '0', '1', '', '张', '1', null, '', '', '', '2018-06-20 09:49:52', 'admin', null, '', 'admin', '2018-06-20 10:44:55', '1', null);
INSERT INTO `cn_good` VALUES ('156', '抽奖转盘', null, '65.00', '85.00', '', 'http://img.cnadmart.com/20180620/073c56787f1b4a73a434a0b4958d291b.jpg', '0', '0', '0', '0', '1', '', '个', '1', null, '', '', '', '2018-06-20 14:35:52', 'admin', null, '', 'admin', '2018-06-20 17:05:47', '1', null);
INSERT INTO `cn_good` VALUES ('158', '木质挂画架', null, '35.00', '40.00', '', 'http://img.cnadmart.com/20180620/7eea711d611542f59b3f2602666b619b.png', '0', '0', '0', '0', '1', '', '个', '1', null, '', '', '', '2018-06-20 14:45:54', 'admin', null, '', 'admin', '2018-06-20 17:05:50', '1', null);
INSERT INTO `cn_good` VALUES ('160', '手举牌', null, '7.00', '10.00', '', 'http://img.cnadmart.com/20180620/3443219f3fa648f6ad1a6d3179a89904.png', '0', '0', '0', '0', '1', '', '个', '1', null, '', '', '', '2018-06-20 15:00:32', 'admin', null, '', 'admin', '2018-06-20 17:05:56', '1', null);
INSERT INTO `cn_good` VALUES ('161', '易拉宝', null, '16.00', '22.00', '', 'http://img.cnadmart.com/20180620/13c3c81d8ed049dfac79e9fc2eeb23f3.jpg', '0', '0', '0', '0', '1', '', '个', '1', null, '', '', '', '2018-06-20 15:30:00', 'admin', null, '', 'admin', '2018-06-20 17:06:02', '1', null);
INSERT INTO `cn_good` VALUES ('162', '模特支架', null, '16.00', '18.00', '', 'http://img.cnadmart.com/20180620/d11d13093a4042dc83117de637ff1424.jpg', '0', '0', '0', '0', '1', '', '个', '1', null, '', '', '', '2018-06-20 16:59:01', 'admin', null, '', 'admin', '2018-06-20 17:06:58', '1', null);
INSERT INTO `cn_good` VALUES ('163', 'KT板挂画架 H型伸缩', null, '45.00', '50.00', '', '', '0', '0', '0', '0', '1', '', '个', '1', null, '', '', '', '2018-06-21 09:33:29', 'admin', null, '', 'admin', '2018-06-21 09:49:39', '1', null);
INSERT INTO `cn_good` VALUES ('164', 'KT板挂画架 倾斜可伸缩', null, '45.00', '50.00', '', 'http://img.cnadmart.com/20180621/49a395961aaa4e51a71ce9f512f49bc4.png', '0', '0', '0', '0', '1', '', '个', '1', null, '', '', '', '2018-06-21 09:36:46', 'admin', null, '', 'admin', '2018-06-21 09:49:36', '1', null);
INSERT INTO `cn_good` VALUES ('166', 'KT板挂画架 三角架款（双面）', null, '18.00', '18.00', '', 'http://img.cnadmart.com/20180621/ad28d41b362947b3b9c0e2a3249bde94.png', '0', '0', '0', '0', '1', '', '个', '1', null, '', '', '', '2018-06-21 09:46:14', 'admin', null, '', 'admin', '2018-06-21 09:49:31', '1', null);
INSERT INTO `cn_good` VALUES ('167', 'KT板挂画架 POP三角挂画架', null, '23.00', '23.00', '', '', '0', null, null, '0', '1', null, '个', '1', null, null, null, null, '2018-06-21 09:48:06', 'admin', null, null, 'admin', '2018-06-21 09:49:28', '1', null);
INSERT INTO `cn_good` VALUES ('168', '注水旗杆', null, '20.00', '135.00', '', 'http://img.cnadmart.com/20180621/6415b202e22f4b868c493a2dc35b7dc6.jpg', '0', '0', '0', '0', '1', '', '个', '1', null, '', '', '', '2018-06-21 09:58:31', 'admin', null, '', 'admin', '2018-06-21 10:58:10', '1', null);
INSERT INTO `cn_good` VALUES ('170', '门型展架 铁质实用型底座', null, '25.00', '28.00', '', 'http://img.cnadmart.com/20180621/c90cf28ff34148efbcbf17b15530e55c.png', '0', '0', '0', '0', '1', '', '个', '1', null, '', '', '', '2018-06-21 10:34:36', 'admin', null, '', 'admin', '2018-06-21 10:58:07', '1', null);
INSERT INTO `cn_good` VALUES ('171', '门型展架', null, '28.00', '50.00', '', 'http://img.cnadmart.com/20180621/fc6eba1cfe4b4c90b515f91034b12d13.jpg', '0', '0', '0', '0', '1', '', '个', '1', null, '', '', '', '2018-06-21 10:37:39', 'admin', null, '', 'admin', '2018-06-21 10:58:03', '1', null);
INSERT INTO `cn_good` VALUES ('172', 'X展架 韩式', null, '4.50', '12.00', '', 'http://img.cnadmart.com/20180621/f722603cf8ef45b2bd732bad598c590f.png', '0', '0', '0', '0', '1', '', '个', '1', null, '', '', '', '2018-06-21 11:19:25', 'admin', null, '', 'admin', '2018-06-21 11:21:13', '1', null);
INSERT INTO `cn_good` VALUES ('173', '普通可调式 X展架', null, '8.00', '8.00', '', 'http://img.cnadmart.com/20180621/6550fd18799e4593994ee2265e3feef6.jpg', '0', '0', '0', '0', '1', '', '个', '1', null, '', '', '', '2018-06-21 11:24:35', 'admin', null, '', 'admin', '2018-06-21 14:06:24', '1', null);
INSERT INTO `cn_good` VALUES ('174', '美式可调式 X展架', null, '18.00', '18.00', '', 'http://img.cnadmart.com/20180621/9af4ee1f09ff4ac1bdf78f67b79a9d40.png', '0', '0', '0', '0', '1', '', '个', '1', null, '', '', '', '2018-06-21 11:25:32', 'admin', null, '', 'admin', '2018-06-21 14:06:27', '1', null);
INSERT INTO `cn_good` VALUES ('176', '抽奖箱', null, '35.00', '40.00', '', 'http://img.cnadmart.com/20180621/97bdc2e84e4043269320ddd915cee2e0.jpg', '0', '0', '0', '0', '1', '', '个', '1', null, '', '', '', '2018-06-21 11:34:22', 'admin', null, '', 'admin', '2018-06-21 14:06:32', '1', null);
INSERT INTO `cn_good` VALUES ('177', '意见箱', null, '25.00', '35.00', '', 'http://img.cnadmart.com/20180621/678ff504eece4b05b1297c3581322dcb.jpg', '0', '0', '0', '0', '1', '', '个', '1', null, '', '', '', '2018-06-21 14:08:36', 'admin', null, '', 'admin', '2018-06-21 15:08:23', '1', null);
INSERT INTO `cn_good` VALUES ('178', '旋转酒水牌', null, '20.00', '20.00', '', 'http://img.cnadmart.com/20180621/05205fe500a6411f8cddb7d92572d8f5.jpg', '0', '0', '0', '0', '1', '', '个', '1', null, '', '', '', '2018-06-21 15:12:00', 'admin', null, '', 'admin', '2018-06-21 16:32:44', '1', null);
INSERT INTO `cn_good` VALUES ('179', '营业执照框', null, '12.00', '12.00', '', '', '0', '0', '0', '0', '1', '', '个', '1', null, '', '', '', '2018-06-21 16:07:17', 'admin', null, '', 'admin', '2018-06-21 16:32:40', '1', null);
INSERT INTO `cn_good` VALUES ('180', '电梯广告框', null, '13.00', '20.00', '', '', '0', '0', '0', '0', '1', '', '个', '1', null, '', '', '', '2018-06-21 16:39:36', 'admin', null, '', 'admin', '2018-06-22 09:58:04', '1', null);
INSERT INTO `cn_good` VALUES ('181', '电梯广告框 仿大理石', null, '35.00', '55.00', '', 'http://img.cnadmart.com/20180621/7f2c9fe482f84cdaa349b6f5083664b9.jpg', '0', '0', '0', '0', '1', '', '个', '1', null, '', '', '', '2018-06-21 16:42:08', 'admin', null, '', 'admin', '2018-06-22 09:58:08', '1', null);
INSERT INTO `cn_good` VALUES ('182', '木托奖牌', null, '6.00', '12.00', '', 'http://img.cnadmart.com/20180622/8e877cae39f142d095ed1cdf52f68ab4.png', '0', '0', '0', '0', '1', '', '个', '1', null, '', '', '', '2018-06-22 09:07:47', 'admin', null, '', 'admin', '2018-06-22 09:58:17', '1', null);
INSERT INTO `cn_good` VALUES ('183', '胸卡吊牌 胸卡硬卡 横款', null, '0.30', '0.40', '', 'http://img.cnadmart.com/20180622/cb3cf6c3333c48cc8a3c645201d61e8f.jpg', '0', '0', '0', '0', '1', '', '个', '1', null, '', '', '', '2018-06-22 09:57:18', 'admin', null, '', 'admin', '2018-06-22 09:58:32', '1', null);
INSERT INTO `cn_good` VALUES ('184', '胸卡吊牌 胸卡硬卡 竖款', null, '0.30', '0.50', '', 'http://img.cnadmart.com/20180622/703514daded74bd397dbcdf7d5f153b5.jpg', '0', '0', '0', '0', '0', '', '个', '1', null, '', '', '', '2018-06-22 10:26:16', 'admin', null, '', 'admin', '2018-06-22 10:27:22', '1', null);
INSERT INTO `cn_good` VALUES ('185', 'tst', null, '0.00', '0.00', 'wste', '', '0', '0', '0', '0', '0', '', null, '0', null, '', '', '', '2018-06-24 17:47:12', 'admin', null, '', '', null, '1', null);
INSERT INTO `cn_good` VALUES ('186', 'sdfgdfg ', null, '0.00', '0.00', '', '', '0', '0', '0', '0', '0', '', null, '0', null, '', '', '', '2018-06-25 09:01:56', 'admin', null, '', '', null, '1', null);
INSERT INTO `cn_good` VALUES ('187', '22', null, '0.00', '0.00', '22', '', '0', '0', '0', '0', '1', '', null, '1', null, '', '', '', '2018-06-25 21:51:57', 'admin', null, '', 'admin', '2018-06-25 21:53:05', '1', null);
INSERT INTO `cn_good` VALUES ('188', 'df ', null, '0.00', '0.00', '', '', '0', '0', '0', '0', '0', '', null, '0', null, '', '', '', '2018-06-25 22:49:18', 'admin', null, '', '', null, '1', null);
INSERT INTO `cn_good` VALUES ('189', '德辅道', null, '0.00', '0.00', '', '', '0', '0', '0', '0', '0', '', null, '0', null, '', '', '', '2018-06-26 10:23:58', 'admin', null, '', '', null, '1', null);
INSERT INTO `cn_good` VALUES ('190', '嗲是打发', null, '0.00', '0.00', '', '', '0', '0', '0', '0', '0', '', null, '0', null, '', '', '', '2018-06-26 14:27:57', 'admin', null, '', '', null, '1', null);
INSERT INTO `cn_good` VALUES ('191', 'admin', null, '0.00', '0.00', 'admin', '', '1', '0', '0', '1', '0', '', '1111', '0', 'admin', 'admin', 'admin', 'admin', '2018-06-26 18:13:02', 'admin', null, '', '', null, '1', null);
INSERT INTO `cn_good` VALUES ('192', 'dsafdsf', null, '0.00', '0.00', '', '', '0', '0', '0', '0', '0', '', null, '0', null, '', '', '', '2018-06-26 18:22:28', 'admin', null, '', '', null, '1', null);
INSERT INTO `cn_good` VALUES ('193', 'aaa', null, '0.00', '0.00', 'aaaa', '', '0', '0', '0', '1', '0', '', '1', '0', null, '', '', '', '2018-06-26 19:06:24', 'admin', null, '', '', null, '1', null);
INSERT INTO `cn_good` VALUES ('194', 'test', null, '0.00', '0.00', '', '', '0', '0', '0', '0', '0', '', null, '0', null, '', '', '', '2018-06-26 21:39:38', 'admin', null, '', '', null, '1', null);
INSERT INTO `cn_good` VALUES ('195', 'test', null, '44.00', '44.00', '', '', '0', '0', '0', '0', '0', '', null, '1', null, '', '', '', '2018-06-26 21:46:07', 'admin', null, '', 'admin', '2018-06-26 21:47:19', '1', null);
INSERT INTO `cn_good` VALUES ('196', 'cs', null, '0.00', '0.00', 'cs', '', '0', '0', '0', '0', '0', '', '1', '0', 'cs', 'cs', 'cs', 'cs', '2018-06-26 22:32:14', 'admin', null, '', '', null, '1', null);
INSERT INTO `cn_good` VALUES ('197', '11', null, '0.00', '0.00', '11', '', '0', '0', '0', '0', '0', '', '11', '0', '11', '11', '11', '11', '2018-06-27 09:13:33', 'admin', null, '', '', null, '1', null);
INSERT INTO `cn_good` VALUES ('198', '11', null, '0.00', '0.00', '11', '', '0', '0', '0', '0', '0', '', '11', '1', '11', '11', '11', '11', '2018-06-27 09:14:36', 'admin', null, '', 'admin', '2018-06-27 09:15:40', '1', null);
INSERT INTO `cn_good` VALUES ('199', 'fdgdg', null, '0.00', '0.00', '', '', '0', '0', '0', '0', '0', '', null, '0', null, '', '', '', '2018-06-27 09:15:35', 'admin', null, '', '', null, '1', null);
INSERT INTO `cn_good` VALUES ('200', 'SSS测试', null, '0.00', '0.00', 'SSS测试', '', '0', '0', '0', '0', '1', '', 'SSS测试', '0', 'SSS测试', 'SSS测试', 'SSS测试', 'SSS测试', '2018-06-27 09:57:33', 'admin', null, '', 'admin', '2018-06-27 09:57:54', '1', null);
INSERT INTO `cn_good` VALUES ('201', 'asdf', null, '111.00', '232.00', 'sadfasdfsd', '', '0', '0', '0', '0', '0', '', 'k', '1', null, '', '', '', '2018-06-27 13:44:07', 'admin', null, '', 'admin', '2018-06-27 13:45:37', '1', null);
INSERT INTO `cn_good` VALUES ('202', '123', null, '0.00', '2.00', '', '', '0', '0', '0', '0', '0', '', null, '1', null, '', '', '', '2018-06-27 15:54:39', 'admin', null, '', 'admin', '2018-06-27 15:55:43', '1', null);
INSERT INTO `cn_good` VALUES ('203', '1', null, '0.00', '0.00', '1', '', '0', '0', '0', '0', '0', '', '1', '0', '1', '1', '1', '1', '2018-06-27 16:42:49', 'admin', null, '', '', null, '1', null);
INSERT INTO `cn_good` VALUES ('204', 'ssss', null, '0.00', '0.00', '', '', '0', '0', '0', '0', '0', '', null, '0', null, '', '', '', '2018-06-28 16:56:17', 'admin', null, '', '', null, '1', null);
INSERT INTO `cn_good` VALUES ('205', 'cfds', null, '0.00', '0.00', '', '', '0', '0', '0', '0', '0', '', null, '1', null, '', '', '', '2018-06-28 16:58:00', 'admin', null, '', 'admin', '2018-06-28 16:59:04', '1', null);
INSERT INTO `cn_good` VALUES ('206', 'tretr', null, '10.00', '10.00', 'tre', '', '0', '0', '0', '0', '0', '', null, '1', null, '', '', '', '2018-06-30 22:33:11', 'admin', null, '', 'admin', '2018-06-30 22:35:30', '1', null);
INSERT INTO `cn_good` VALUES ('207', '1111', null, '0.00', '0.00', '1111', '', '0', '0', '0', '0', '0', '', null, '1', '111', '111', '111', '111', '2018-07-01 01:41:55', 'admin', null, '', 'admin', '2018-07-01 23:33:23', '1', null);
INSERT INTO `cn_good` VALUES ('208', 'rer', null, '0.00', '0.00', '', '', '0', '0', '0', '0', '0', '', null, '0', null, '', '', '', '2018-07-02 08:30:38', 'admin', null, '', '', null, '1', null);
INSERT INTO `cn_good` VALUES ('209', 'dsfdsf', null, '0.00', '0.00', '', '', '0', '0', '0', '0', '0', '', null, '0', null, '', '', '', '2018-07-02 10:45:31', 'admin', null, '', '', null, '1', null);
INSERT INTO `cn_good` VALUES ('210', '1q', null, '0.00', '0.00', '', '', '0', '0', '0', '0', '0', '', null, '0', null, '', '', '', '2018-07-02 13:01:16', 'admin', null, '', '', null, '1', null);
INSERT INTO `cn_good` VALUES ('211', '1q', null, '0.00', '0.00', '', '', '0', '0', '0', '0', '0', '', null, '0', null, '', '', '', '2018-07-02 13:01:19', 'admin', null, '', '', null, '1', null);
INSERT INTO `cn_good` VALUES ('212', 'sss', null, '1000.00', '1000.00', 'ddd', '', '0', '0', '0', '0', '1', '', 'dd', '0', 'd', 'd', 'd', 'd', '2018-07-02 15:47:44', 'admin', null, '', 'admin', '2018-07-02 15:50:18', '1', null);
INSERT INTO `cn_good` VALUES ('213', '13123123112312312', null, '0.00', '0.00', '', '', '0', '0', '0', '0', '0', '', '123123', '0', null, '', '', '', '2018-07-04 14:54:19', 'admin', null, '', 'admin', '2018-07-05 16:03:24', '1', null);
INSERT INTO `cn_good` VALUES ('214', 'test', null, '3.00', '1.00', 'test', '', '0', '0', '0', '0', '0', '', '个', '1', null, '', '', '', '2018-07-05 15:58:27', 'admin', null, '', 'admin', '2018-07-05 19:15:06', '1', null);
INSERT INTO `cn_good` VALUES ('215', '234234', null, '0.00', '0.00', '234234', '', '0', '0', '0', '0', '0', '', '234234', '0', null, '', '', '', '2018-07-05 16:52:46', 'admin', null, '', '', null, '1', null);
INSERT INTO `cn_good` VALUES ('216', '皮皮测试', null, '0.00', '0.00', '皮皮测试皮皮测试皮皮测试皮皮测试皮皮测试皮皮测试皮皮测试皮皮测试皮皮测试', '', '0', '0', '0', '0', '0', '', '问问', '0', '撒打算的', '为', '反反复复反反复复反反复复', '问问', '2018-07-05 17:37:25', 'admin', null, '', '', null, '1', null);
INSERT INTO `cn_good` VALUES ('217', 'jjjjjjjjjj', null, '0.00', '0.00', 'gggggggggggggggggggggg', '', '0', '0', '0', '0', '0', '', 'g', '0', '2222222222222222', '11111111111111', '11111111111111111', '222222222222222', '2018-07-05 18:50:20', 'admin', null, '', '', null, '1', null);

-- ----------------------------
-- Table structure for cn_good_attribute
-- ----------------------------
DROP TABLE IF EXISTS `cn_good_attribute`;
CREATE TABLE `cn_good_attribute` (
  `attribute_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '属性ID',
  `good_id` bigint(20) DEFAULT NULL COMMENT '商品ID',
  `stock` bigint(20) DEFAULT '0' COMMENT '总库存',
  `sales_volume` bigint(20) DEFAULT '0' COMMENT '销售量',
  `page_views` bigint(20) DEFAULT '0' COMMENT '总访问量',
  `comment_number` bigint(20) DEFAULT '0' COMMENT '评论数量',
  `comment_total` bigint(20) DEFAULT '0' COMMENT '累计评价',
  `comment_average` decimal(10,2) DEFAULT '0.00' COMMENT '平均评价',
  `favorite_number` bigint(20) DEFAULT '0' COMMENT '收藏数',
  `question_number` bigint(20) DEFAULT '0' COMMENT '提问数',
  PRIMARY KEY (`attribute_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COMMENT='商品属性表';

-- ----------------------------
-- Records of cn_good_attribute
-- ----------------------------
INSERT INTO `cn_good_attribute` VALUES ('1', '1', '19887', '500', '0', '0', '0', '0.00', '0', '0');
INSERT INTO `cn_good_attribute` VALUES ('36', '96', '55', '144', '0', '0', '0', '0.00', '0', '0');
INSERT INTO `cn_good_attribute` VALUES ('37', '206', '35', '444', '0', '0', '0', '0.00', '0', '0');
INSERT INTO `cn_good_attribute` VALUES ('38', '97', '60112', '7701', '0', '0', '0', '0.00', '0', '0');
INSERT INTO `cn_good_attribute` VALUES ('39', '99', '451499', '0', '0', '0', '0', '0.00', '0', '0');
INSERT INTO `cn_good_attribute` VALUES ('40', '207', '0', '0', '0', '0', '0', '0.00', '0', '0');
INSERT INTO `cn_good_attribute` VALUES ('41', '212', '10', '0', '0', '0', '0', '0.00', '0', '0');
INSERT INTO `cn_good_attribute` VALUES ('43', '214', '7', '7', '0', '0', '0', '0.00', '0', '0');
INSERT INTO `cn_good_attribute` VALUES ('54', '95', '7', '7', '0', '0', '0', '0.00', '0', '0');

-- ----------------------------
-- Table structure for cn_good_detail
-- ----------------------------
DROP TABLE IF EXISTS `cn_good_detail`;
CREATE TABLE `cn_good_detail` (
  `good_detail_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品描述ID',
  `good_id` bigint(20) DEFAULT NULL COMMENT '商品ID',
  `description` text COMMENT '商品描述',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`good_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='商品描述表';

-- ----------------------------
-- Records of cn_good_detail
-- ----------------------------
INSERT INTO `cn_good_detail` VALUES ('1', '95', '<p>sdfsdafsasdfsdad</p>', '2018-07-05 14:50:58', 'admin', '2018-07-05 14:57:45', 'admin');

-- ----------------------------
-- Table structure for cn_good_image
-- ----------------------------
DROP TABLE IF EXISTS `cn_good_image`;
CREATE TABLE `cn_good_image` (
  `pic_img_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品图片ID',
  `good_id` bigint(20) DEFAULT NULL COMMENT '商品ID',
  `pic_img` varchar(255) DEFAULT NULL COMMENT '展示图片',
  `sort` tinyint(2) DEFAULT NULL COMMENT '排序',
  `status` tinyint(2) DEFAULT NULL COMMENT '状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`pic_img_id`)
) ENGINE=InnoDB AUTO_INCREMENT=347 DEFAULT CHARSET=utf8 COMMENT='商品图片表';

-- ----------------------------
-- Records of cn_good_image
-- ----------------------------
INSERT INTO `cn_good_image` VALUES ('71', '99', 'http://img.cnadmart.com/20180615/fc8912582ca44444977c64ee2bfa1589.png', null, '1', '2018-06-15 09:16:21', 'admin');
INSERT INTO `cn_good_image` VALUES ('72', '99', 'http://img.cnadmart.com/20180615/5d812cdd6df849fe8e79b4335587538a.png', null, '1', '2018-06-15 09:16:21', 'admin');
INSERT INTO `cn_good_image` VALUES ('73', '99', 'http://img.cnadmart.com/20180615/90bff4ab9a8c4bc09a95a1ba60c37f4b.png', null, '1', '2018-06-15 09:16:21', 'admin');
INSERT INTO `cn_good_image` VALUES ('74', '99', 'http://img.cnadmart.com/20180615/72070abe42e643338389b5e5d001bf4a.jpg', null, '1', '2018-06-15 09:16:21', 'admin');
INSERT INTO `cn_good_image` VALUES ('75', '99', 'http://img.cnadmart.com/20180615/44987d87f19d46968cfc82475a65de1e.jpg', null, '1', '2018-06-15 09:16:21', 'admin');
INSERT INTO `cn_good_image` VALUES ('76', '100', 'http://img.cnadmart.com/20180615/7b0666826254423f9aa8611bad0e5fc3.jpg', null, '1', '2018-06-15 09:28:54', 'admin');
INSERT INTO `cn_good_image` VALUES ('77', '100', 'http://img.cnadmart.com/20180615/76387a585b82443c81f3772bd4344619.jpg', null, '1', '2018-06-15 09:28:54', 'admin');
INSERT INTO `cn_good_image` VALUES ('78', '100', 'http://img.cnadmart.com/20180615/06e0b1d44ebe4a7a8764a901db3f710f.jpg', null, '1', '2018-06-15 09:28:54', 'admin');
INSERT INTO `cn_good_image` VALUES ('79', '100', 'http://img.cnadmart.com/20180615/8aacc4b317034f0e82c681c7589c7705.jpg', null, '1', '2018-06-15 09:28:54', 'admin');
INSERT INTO `cn_good_image` VALUES ('80', '100', 'http://img.cnadmart.com/20180615/0b6fafaa1ed44dfd907a23e80fe842b0.jpg', null, '1', '2018-06-15 09:28:54', 'admin');
INSERT INTO `cn_good_image` VALUES ('81', '101', 'http://img.cnadmart.com/20180615/b6a644ff26a34196bbc25523eb18e5d0.png', null, '1', '2018-06-15 09:38:37', 'admin');
INSERT INTO `cn_good_image` VALUES ('82', '101', 'http://img.cnadmart.com/20180615/b50dd6e500814629b1b9bd2958578ad0.jpg', null, '1', '2018-06-15 09:38:37', 'admin');
INSERT INTO `cn_good_image` VALUES ('83', '101', 'http://img.cnadmart.com/20180615/0d1da9c7371044ff939e41a44be3fbcf.jpg', null, '1', '2018-06-15 09:38:37', 'admin');
INSERT INTO `cn_good_image` VALUES ('84', '101', 'http://img.cnadmart.com/20180615/a52ba85fe4d9472f9c63105ad200aabe.jpg', null, '1', '2018-06-15 09:38:37', 'admin');
INSERT INTO `cn_good_image` VALUES ('85', '102', 'http://img.cnadmart.com/20180615/a80f86f8bf4249b9be264e0958572003.jpg', null, '1', '2018-06-15 09:44:08', 'admin');
INSERT INTO `cn_good_image` VALUES ('86', '102', 'http://img.cnadmart.com/20180615/03d38fbdc2a044119463d5f748f84deb.jpg', null, '1', '2018-06-15 09:44:08', 'admin');
INSERT INTO `cn_good_image` VALUES ('87', '102', 'http://img.cnadmart.com/20180615/bcfb8d1be5be4e4c8a69abf9dbcd6209.jpg', null, '1', '2018-06-15 09:44:08', 'admin');
INSERT INTO `cn_good_image` VALUES ('88', '103', 'http://img.cnadmart.com/20180615/43ef3736473c426a985107461adc2eb0.png', null, '1', '2018-06-15 09:52:51', 'admin');
INSERT INTO `cn_good_image` VALUES ('89', '104', 'http://img.cnadmart.com/20180615/82cdcc0727764e2c867bbd07f60db768.png', null, '1', '2018-06-15 09:58:50', 'admin');
INSERT INTO `cn_good_image` VALUES ('90', '105', 'http://img.cnadmart.com/20180615/41b2b2d1a1d343878f36c96af2133e77.png', null, '1', '2018-06-15 10:06:18', 'admin');
INSERT INTO `cn_good_image` VALUES ('91', '106', 'http://img.cnadmart.com/20180615/a3c4cf36849b4dfa94c11e114a486c11.png', null, '1', '2018-06-15 10:13:45', 'admin');
INSERT INTO `cn_good_image` VALUES ('92', '107', 'http://img.cnadmart.com/20180615/9a8838c3bd9c4642b8173da67b2de24e.jpg', null, '1', '2018-06-15 10:21:06', 'admin');
INSERT INTO `cn_good_image` VALUES ('93', '107', 'http://img.cnadmart.com/20180615/f86e7438870e4641918f7254f552e3e7.jpg', null, '1', '2018-06-15 10:21:06', 'admin');
INSERT INTO `cn_good_image` VALUES ('100', '110', 'http://img.cnadmart.com/20180615/5799789db2eb466db946b0c0627c3bf4.jpg', null, '1', '2018-06-15 10:35:15', 'admin');
INSERT INTO `cn_good_image` VALUES ('101', '110', 'http://img.cnadmart.com/20180615/abb9724a87824e74866167f873615208.jpg', null, '1', '2018-06-15 10:35:15', 'admin');
INSERT INTO `cn_good_image` VALUES ('102', '110', 'http://img.cnadmart.com/20180615/645ca01131e94e9d9b705de6b98ba139.jpg', null, '1', '2018-06-15 10:35:15', 'admin');
INSERT INTO `cn_good_image` VALUES ('103', '111', 'http://img.cnadmart.com/20180615/9d6279aebf6a41169c2a88161cb70af6.jpg', null, '1', '2018-06-15 10:59:33', 'admin');
INSERT INTO `cn_good_image` VALUES ('104', '111', 'http://img.cnadmart.com/20180615/23db70c132c74e2685e1a1ba3899a0d7.jpg', null, '1', '2018-06-15 10:59:33', 'admin');
INSERT INTO `cn_good_image` VALUES ('105', '111', 'http://img.cnadmart.com/20180615/9f8941b2b6fb4b229573c33cd8463218.jpg', null, '1', '2018-06-15 10:59:33', 'admin');
INSERT INTO `cn_good_image` VALUES ('106', '111', 'http://img.cnadmart.com/20180615/171456d1007040098ac71db24aa42f5a.jpg', null, '1', '2018-06-15 10:59:33', 'admin');
INSERT INTO `cn_good_image` VALUES ('107', '109', 'http://img.cnadmart.com/20180615/dbf11b4eeb8b405a92cddc7692ec89ae.jpg', null, null, '2018-06-15 11:04:49', 'admin');
INSERT INTO `cn_good_image` VALUES ('108', '109', 'http://img.cnadmart.com/20180615/88dd8d42e38b4e4aaaf3016dda407a89.jpg', null, null, '2018-06-15 11:04:51', 'admin');
INSERT INTO `cn_good_image` VALUES ('109', '112', 'http://img.cnadmart.com/20180615/d8756675376d4f019d3fbcf7a5db8944.jpg', null, '1', '2018-06-15 13:36:41', 'admin');
INSERT INTO `cn_good_image` VALUES ('110', '112', 'http://img.cnadmart.com/20180615/f60d0f94f4ae47fda8f5fda0ae14f68b.jpg', null, '1', '2018-06-15 13:36:41', 'admin');
INSERT INTO `cn_good_image` VALUES ('111', '112', 'http://img.cnadmart.com/20180615/4d20be8e6a404f198a21aff1cce577c8.jpg', null, '1', '2018-06-15 13:36:41', 'admin');
INSERT INTO `cn_good_image` VALUES ('112', '113', 'http://img.cnadmart.com/20180615/7d4e669a2baf4e0392a7925aaf97d713.jpg', null, '1', '2018-06-15 13:48:32', 'admin');
INSERT INTO `cn_good_image` VALUES ('113', '113', 'http://img.cnadmart.com/20180615/ebba240eb76e43f897bb656dc2eddd11.jpg', null, '1', '2018-06-15 13:48:32', 'admin');
INSERT INTO `cn_good_image` VALUES ('114', '113', 'http://img.cnadmart.com/20180615/cc8db101ad4f4c08a55d0fbfde2a9edf.jpg', null, '1', '2018-06-15 13:48:32', 'admin');
INSERT INTO `cn_good_image` VALUES ('115', '114', 'http://img.cnadmart.com/20180615/ad68935909684ab1b4a94981e67e52b8.jpg', null, '1', '2018-06-15 13:55:04', 'admin');
INSERT INTO `cn_good_image` VALUES ('116', '114', 'http://img.cnadmart.com/20180615/176ad0d6df074697a2824b8a163f3456.jpg', null, '1', '2018-06-15 13:55:04', 'admin');
INSERT INTO `cn_good_image` VALUES ('117', '114', 'http://img.cnadmart.com/20180615/005905b7d1ec486cbbe5aca9b3db18d6.jpg', null, '1', '2018-06-15 13:55:04', 'admin');
INSERT INTO `cn_good_image` VALUES ('118', '114', 'http://img.cnadmart.com/20180615/e10302c9a9674fb1946a22562177b913.jpg', null, '1', '2018-06-15 13:55:04', 'admin');
INSERT INTO `cn_good_image` VALUES ('119', '115', 'http://img.cnadmart.com/20180615/c8d80393674f401a85256c4749bdb502.png', null, '1', '2018-06-15 14:03:58', 'admin');
INSERT INTO `cn_good_image` VALUES ('120', '116', 'http://img.cnadmart.com/20180615/5dd16016db1f4b8797ab7d91b3cdb634.png', null, '1', '2018-06-15 14:09:31', 'admin');
INSERT INTO `cn_good_image` VALUES ('121', '117', 'http://img.cnadmart.com/20180615/cda649d0258f45b6b5d26d51ce00a365.jpg', null, '1', '2018-06-15 14:38:54', 'admin');
INSERT INTO `cn_good_image` VALUES ('122', '117', 'http://img.cnadmart.com/20180615/5309fed5808d4b479a84efd6ef9dacac.jpg', null, '1', '2018-06-15 14:38:54', 'admin');
INSERT INTO `cn_good_image` VALUES ('123', '117', 'http://img.cnadmart.com/20180615/619c5d7b54cd45e4887e0b35db28df3a.jpg', null, '1', '2018-06-15 14:38:54', 'admin');
INSERT INTO `cn_good_image` VALUES ('124', '118', 'http://img.cnadmart.com/20180615/f1b1f4a76e8044a685eb733d66d91da6.jpg', null, '1', '2018-06-15 15:17:42', 'admin');
INSERT INTO `cn_good_image` VALUES ('125', '119', 'http://img.cnadmart.com/20180615/5f0776f5ef3545deabfe2a4ff3e8165a.jpg', null, '1', '2018-06-15 15:26:56', 'admin');
INSERT INTO `cn_good_image` VALUES ('126', '119', 'http://img.cnadmart.com/20180615/31937d9447b14d5eabcea94aac4d92f6.jpg', null, '1', '2018-06-15 15:26:56', 'admin');
INSERT INTO `cn_good_image` VALUES ('127', '119', 'http://img.cnadmart.com/20180615/0684620e420947e089392585416f1cf6.jpg', null, '1', '2018-06-15 15:26:56', 'admin');
INSERT INTO `cn_good_image` VALUES ('128', '120', 'http://img.cnadmart.com/20180615/325d943071594572acc00f80eae68367.png', null, '1', '2018-06-15 15:31:09', 'admin');
INSERT INTO `cn_good_image` VALUES ('129', '121', 'http://img.cnadmart.com/20180615/06dcb0dbe1374c2bb47e02d8730ca820.png', null, '1', '2018-06-15 15:34:20', 'admin');
INSERT INTO `cn_good_image` VALUES ('130', '122', 'http://img.cnadmart.com/20180615/19cef6286cbc4e2eb39c1a47f80d4a12.jpg', null, '1', '2018-06-15 15:38:29', 'admin');
INSERT INTO `cn_good_image` VALUES ('131', '122', 'http://img.cnadmart.com/20180615/a6949074b2fe4339a4ce662f4527e74b.png', null, '1', '2018-06-15 15:38:29', 'admin');
INSERT INTO `cn_good_image` VALUES ('132', '122', 'http://img.cnadmart.com/20180615/e56414aabda444f4a7139fa0d9c3a504.jpg', null, '1', '2018-06-15 15:38:29', 'admin');
INSERT INTO `cn_good_image` VALUES ('133', '122', 'http://img.cnadmart.com/20180615/84beb8a6b98647809737140008baaeeb.jpg', null, '1', '2018-06-15 15:38:29', 'admin');
INSERT INTO `cn_good_image` VALUES ('134', '122', 'http://img.cnadmart.com/20180615/90a3c9c141b54c3a9cafd1f71587023c.jpg', null, '1', '2018-06-15 15:38:29', 'admin');
INSERT INTO `cn_good_image` VALUES ('135', '123', 'http://img.cnadmart.com/20180619/efd9fd3a3aad4eaf99a4db6490746cdf.jpg', null, '1', '2018-06-19 08:54:10', 'admin');
INSERT INTO `cn_good_image` VALUES ('136', '123', 'http://img.cnadmart.com/20180619/b96166b7bb334b068fd3b77afda30153.jpg', null, '1', '2018-06-19 08:54:10', 'admin');
INSERT INTO `cn_good_image` VALUES ('137', '123', 'http://img.cnadmart.com/20180619/97306539728c4906a9833df216cb467d.jpg', null, '1', '2018-06-19 08:54:10', 'admin');
INSERT INTO `cn_good_image` VALUES ('138', '123', 'http://img.cnadmart.com/20180619/a8fad7a0b12c43e1a434c7a06113903b.png', null, '1', '2018-06-19 08:54:10', 'admin');
INSERT INTO `cn_good_image` VALUES ('139', '128', 'http://img.cnadmart.com/20180619/778e8d9bc92b4e2ea31d55b2ec777ec8.png', null, '1', '2018-06-19 09:06:19', 'admin');
INSERT INTO `cn_good_image` VALUES ('140', '128', 'http://img.cnadmart.com/20180619/ffb6c6f5f6e2443d971376cbfea6d274.png', null, '1', '2018-06-19 09:06:19', 'admin');
INSERT INTO `cn_good_image` VALUES ('141', '128', 'http://img.cnadmart.com/20180619/58981824fa0c44939d4e3d2ac79d0600.png', null, '1', '2018-06-19 09:06:19', 'admin');
INSERT INTO `cn_good_image` VALUES ('143', '129', 'http://img.cnadmart.com/20180619/d702a0f6b4dd485d88d9e78b4c9eb8db.jpg', null, '1', '2018-06-19 09:13:03', 'admin');
INSERT INTO `cn_good_image` VALUES ('144', '129', 'http://img.cnadmart.com/20180619/08fee5f3d8504a258eab16f303b106f8.jpg', null, '1', '2018-06-19 09:13:03', 'admin');
INSERT INTO `cn_good_image` VALUES ('145', '129', 'http://img.cnadmart.com/20180619/7a5b7e47a0ab432dbfd02fe4f1721853.jpg', null, '1', '2018-06-19 09:13:03', 'admin');
INSERT INTO `cn_good_image` VALUES ('146', '129', 'http://img.cnadmart.com/20180619/198723bcdcce432f8d29d0f8725d6093.jpg', null, '1', '2018-06-19 09:13:03', 'admin');
INSERT INTO `cn_good_image` VALUES ('147', '130', 'http://img.cnadmart.com/20180619/4462d36cde03491886f4ae132478e443.jpg', null, '1', '2018-06-19 09:25:34', 'admin');
INSERT INTO `cn_good_image` VALUES ('148', '130', 'http://img.cnadmart.com/20180619/a5e37a9fbd2c4742a8a969a52bb637f4.jpg', null, '1', '2018-06-19 09:25:34', 'admin');
INSERT INTO `cn_good_image` VALUES ('149', '130', 'http://img.cnadmart.com/20180619/8e5b3c3c9d03488fb2bf4b966cc6906e.jpg', null, '1', '2018-06-19 09:25:34', 'admin');
INSERT INTO `cn_good_image` VALUES ('150', '130', 'http://img.cnadmart.com/20180619/ee2c1c6348ff4070aefa8b3eb82432cc.jpg', null, '1', '2018-06-19 09:25:34', 'admin');
INSERT INTO `cn_good_image` VALUES ('151', '130', 'http://img.cnadmart.com/20180619/6790d3f41e074f14b3a7e221ad382c10.jpg', null, '1', '2018-06-19 09:25:34', 'admin');
INSERT INTO `cn_good_image` VALUES ('152', '131', 'http://img.cnadmart.com/20180619/44a71e6459cb404bb618c60b0d29052b.jpg', null, '1', '2018-06-19 09:36:54', 'admin');
INSERT INTO `cn_good_image` VALUES ('153', '131', 'http://img.cnadmart.com/20180619/5f412d0450484631bb88531e975fc5cc.jpg', null, '1', '2018-06-19 09:36:54', 'admin');
INSERT INTO `cn_good_image` VALUES ('154', '131', 'http://img.cnadmart.com/20180619/3aa0989583e04314ad830b307f2f4835.jpg', null, '1', '2018-06-19 09:36:54', 'admin');
INSERT INTO `cn_good_image` VALUES ('155', '131', 'http://img.cnadmart.com/20180619/35d09f2d5c6949369017aeb71aa5a453.jpg', null, '1', '2018-06-19 09:36:54', 'admin');
INSERT INTO `cn_good_image` VALUES ('157', '132', 'http://img.cnadmart.com/20180619/6a8aa55c15f649b6bce0b5f780bf899c.jpg', null, '1', '2018-06-19 10:52:47', 'admin');
INSERT INTO `cn_good_image` VALUES ('158', '132', 'http://img.cnadmart.com/20180619/647cec32ab0b4f5fa29bfdd066476c85.jpg', null, '1', '2018-06-19 10:52:47', 'admin');
INSERT INTO `cn_good_image` VALUES ('159', '132', 'http://img.cnadmart.com/20180619/bbb306c74e0e4911bc92fa422ff72007.jpg', null, '1', '2018-06-19 10:52:47', 'admin');
INSERT INTO `cn_good_image` VALUES ('160', '132', 'http://img.cnadmart.com/20180619/65b49cc3f9ac4c7d8aa5c3850f929c5d.jpg', null, '1', '2018-06-19 10:52:47', 'admin');
INSERT INTO `cn_good_image` VALUES ('161', '132', 'http://img.cnadmart.com/20180619/9be15186dfcb4fe9bfa4372dc9c14944.jpg', null, '1', '2018-06-19 10:52:47', 'admin');
INSERT INTO `cn_good_image` VALUES ('162', '133', 'http://img.cnadmart.com/20180619/15f798346c3d43db88248cc31e6db53d.jpg', null, '1', '2018-06-19 10:55:21', 'admin');
INSERT INTO `cn_good_image` VALUES ('163', '133', 'http://img.cnadmart.com/20180619/41ab319736b94a718d13e49347df862f.jpg', null, '1', '2018-06-19 10:55:21', 'admin');
INSERT INTO `cn_good_image` VALUES ('164', '133', 'http://img.cnadmart.com/20180619/182191f61163493da83bbfcec5d713a2.jpg', null, '1', '2018-06-19 10:55:21', 'admin');
INSERT INTO `cn_good_image` VALUES ('165', '133', 'http://img.cnadmart.com/20180619/46d883eff74b4f4f808a9fa70dbfd615.jpg', null, '1', '2018-06-19 10:55:21', 'admin');
INSERT INTO `cn_good_image` VALUES ('166', '133', 'http://img.cnadmart.com/20180619/1be8633155314e1395ca3bafef2ae76c.jpg', null, '1', '2018-06-19 10:55:21', 'admin');
INSERT INTO `cn_good_image` VALUES ('167', '135', 'http://img.cnadmart.com/20180619/b59a5b522379495f83a7bbabbef66e27.png', null, '1', '2018-06-19 11:49:17', 'admin');
INSERT INTO `cn_good_image` VALUES ('168', '137', 'http://img.cnadmart.com/20180619/63449fc25d554287b34905404cf860d0.jpg', null, '1', '2018-06-19 13:47:07', 'admin');
INSERT INTO `cn_good_image` VALUES ('169', '137', 'http://img.cnadmart.com/20180619/f4555cead2514f0db334a45c8e2996eb.png', null, '1', '2018-06-19 13:47:07', 'admin');
INSERT INTO `cn_good_image` VALUES ('174', '140', 'http://img.cnadmart.com/20180619/801a032ce82547879fdf7a492e5a3675.jpg', null, '1', '2018-06-19 13:55:10', 'admin');
INSERT INTO `cn_good_image` VALUES ('175', '140', 'http://img.cnadmart.com/20180619/4a79d7055eff483da4d18d7c30198a53.jpg', null, '1', '2018-06-19 13:55:10', 'admin');
INSERT INTO `cn_good_image` VALUES ('176', '140', 'http://img.cnadmart.com/20180619/caf3c9f2a1bc4c50944da6fb305dfc7d.jpg', null, '1', '2018-06-19 13:55:10', 'admin');
INSERT INTO `cn_good_image` VALUES ('177', '141', 'http://img.cnadmart.com/20180619/938071a98cb04f3ebc6d77ba4279994b.jpg', null, '1', '2018-06-19 13:56:42', 'admin');
INSERT INTO `cn_good_image` VALUES ('178', '142', 'http://img.cnadmart.com/20180619/244eb408cc9a4b26a7ee2c48ac1945fd.jpg', null, '1', '2018-06-19 13:59:45', 'admin');
INSERT INTO `cn_good_image` VALUES ('179', '142', 'http://img.cnadmart.com/20180619/0c024130a7ce4ce7b60dff3de01eed08.jpg', null, '1', '2018-06-19 13:59:45', 'admin');
INSERT INTO `cn_good_image` VALUES ('180', '142', 'http://img.cnadmart.com/20180619/2356789fec73434fb7ea9c0a1edcca7c.jpg', null, '1', '2018-06-19 13:59:45', 'admin');
INSERT INTO `cn_good_image` VALUES ('181', '142', 'http://img.cnadmart.com/20180619/9efeb04c122049edb5dcfe23cf575ec4.jpg', null, '1', '2018-06-19 13:59:45', 'admin');
INSERT INTO `cn_good_image` VALUES ('182', '143', 'http://img.cnadmart.com/20180619/26d80045ec7749aeb2a51d28dd3f7246.jpg', null, '1', '2018-06-19 14:07:38', 'admin');
INSERT INTO `cn_good_image` VALUES ('186', '145', 'http://img.cnadmart.com/20180619/78fb9ab063254ad79256c4a16c24599a.png', null, '1', '2018-06-19 14:12:19', 'admin');
INSERT INTO `cn_good_image` VALUES ('187', '145', 'http://img.cnadmart.com/20180619/9a6693f9ea60493e972f69c8ee5ff078.png', null, '1', '2018-06-19 14:12:19', 'admin');
INSERT INTO `cn_good_image` VALUES ('188', '145', 'http://img.cnadmart.com/20180619/4d9f42c4fcfa4626a5b2a3bfd411035c.png', null, '1', '2018-06-19 14:12:19', 'admin');
INSERT INTO `cn_good_image` VALUES ('189', '146', 'http://img.cnadmart.com/20180619/4cc7dbfeb003432898752e395722092c.jpg', null, '1', '2018-06-19 14:15:35', 'admin');
INSERT INTO `cn_good_image` VALUES ('190', '146', 'http://img.cnadmart.com/20180619/12aa49471f15478fb66e457d59a04600.jpg', null, '1', '2018-06-19 14:15:35', 'admin');
INSERT INTO `cn_good_image` VALUES ('191', '146', 'http://img.cnadmart.com/20180619/8a668b311bc64750b4e3a815ac4ebb22.jpg', null, '1', '2018-06-19 14:15:35', 'admin');
INSERT INTO `cn_good_image` VALUES ('192', '146', 'http://img.cnadmart.com/20180619/7aa50a3d7cf644b6973701373c15cb0f.jpg', null, '1', '2018-06-19 14:15:35', 'admin');
INSERT INTO `cn_good_image` VALUES ('193', '146', 'http://img.cnadmart.com/20180619/b3b51066e098412e84b7527b3504532f.png', null, '1', '2018-06-19 14:15:35', 'admin');
INSERT INTO `cn_good_image` VALUES ('194', '148', 'http://img.cnadmart.com/20180619/dc15e575cb9e437dabde060954c1239f.jpg', null, '1', '2018-06-19 14:24:03', 'admin');
INSERT INTO `cn_good_image` VALUES ('195', '148', 'http://img.cnadmart.com/20180619/9e7b6067269847a0b0c0e7e7be0fd178.png', null, '1', '2018-06-19 14:24:03', 'admin');
INSERT INTO `cn_good_image` VALUES ('196', '148', 'http://img.cnadmart.com/20180619/2fe6cb7863bc4445b050ca8ad1f361ae.png', null, '1', '2018-06-19 14:24:03', 'admin');
INSERT INTO `cn_good_image` VALUES ('197', '149', 'http://img.cnadmart.com/20180619/fcc7cd0e1a1f4b85b2ef9eea0c16d4d2.jpg', null, '1', '2018-06-19 14:26:42', 'admin');
INSERT INTO `cn_good_image` VALUES ('198', '149', 'http://img.cnadmart.com/20180619/7ca51255e1654c12b69e19ef98dece3a.jpg', null, '1', '2018-06-19 14:26:42', 'admin');
INSERT INTO `cn_good_image` VALUES ('199', '149', 'http://img.cnadmart.com/20180619/0c4f6cbe7fda4efb83778f6c1d9e484b.jpg', null, '1', '2018-06-19 14:26:42', 'admin');
INSERT INTO `cn_good_image` VALUES ('200', '149', 'http://img.cnadmart.com/20180619/b271e066e1f945559861fbaa714d6fc6.png', null, '1', '2018-06-19 14:26:42', 'admin');
INSERT INTO `cn_good_image` VALUES ('206', '151', 'http://img.cnadmart.com/20180620/6285bef6720346e1a4c45a640f58093a.jpg', null, null, '2018-06-20 08:46:14', 'admin');
INSERT INTO `cn_good_image` VALUES ('207', '151', 'http://img.cnadmart.com/20180620/c7eeee9bf50248dfad4faea3eabf179f.jpg', null, null, '2018-06-20 08:46:15', 'admin');
INSERT INTO `cn_good_image` VALUES ('208', '151', 'http://img.cnadmart.com/20180620/26b39907b8514ccb8f9d5b80b333caef.jpg', null, null, '2018-06-20 08:46:16', 'admin');
INSERT INTO `cn_good_image` VALUES ('209', '151', 'http://img.cnadmart.com/20180620/44d5a59ca8f44341a391c91f7974a125.jpg', null, null, '2018-06-20 08:46:17', 'admin');
INSERT INTO `cn_good_image` VALUES ('215', '153', 'http://img.cnadmart.com/20180620/0605430737c947b39f714c4bde436891.png', null, '1', '2018-06-20 09:33:13', 'admin');
INSERT INTO `cn_good_image` VALUES ('216', '153', 'http://img.cnadmart.com/20180620/1fccdb2f641847f6a533a9769fac2aeb.png', null, '1', '2018-06-20 09:33:13', 'admin');
INSERT INTO `cn_good_image` VALUES ('228', '156', 'http://img.cnadmart.com/20180620/ce421d3db0d0485cad711681bf300cfb.jpg', null, '1', '2018-06-20 14:35:52', 'admin');
INSERT INTO `cn_good_image` VALUES ('229', '156', 'http://img.cnadmart.com/20180620/1491baaa11d94137bc489ad4d71cffe5.jpg', null, '1', '2018-06-20 14:35:52', 'admin');
INSERT INTO `cn_good_image` VALUES ('230', '156', 'http://img.cnadmart.com/20180620/8c0604280291400ba2d40022e9b65c61.jpg', null, '1', '2018-06-20 14:35:52', 'admin');
INSERT INTO `cn_good_image` VALUES ('231', '156', 'http://img.cnadmart.com/20180620/a507265d76a84650858f38f95d4ae1a5.jpg', null, '1', '2018-06-20 14:35:52', 'admin');
INSERT INTO `cn_good_image` VALUES ('237', '158', 'http://img.cnadmart.com/20180620/6526cdfc80ab42afaea6dd867b3298a0.png', null, '1', '2018-06-20 14:45:54', 'admin');
INSERT INTO `cn_good_image` VALUES ('238', '158', 'http://img.cnadmart.com/20180620/bdd8ffc651834f19826928cfec72ba63.jpg', null, '1', '2018-06-20 14:45:54', 'admin');
INSERT INTO `cn_good_image` VALUES ('239', '158', 'http://img.cnadmart.com/20180620/9444c038e16e47369963fa1d23f33cb4.jpg', null, '1', '2018-06-20 14:45:54', 'admin');
INSERT INTO `cn_good_image` VALUES ('240', '158', 'http://img.cnadmart.com/20180620/0de0370bfa9b49aba73d2d55ca218d3b.jpg', null, '1', '2018-06-20 14:45:54', 'admin');
INSERT INTO `cn_good_image` VALUES ('241', '158', 'http://img.cnadmart.com/20180620/710da9d8961e410b8f4af0dde598fc77.jpg', null, '1', '2018-06-20 14:45:54', 'admin');
INSERT INTO `cn_good_image` VALUES ('247', '160', 'http://img.cnadmart.com/20180620/1dd41d156c6143da83331a9e456440f7.jpg', null, '1', '2018-06-20 15:00:32', 'admin');
INSERT INTO `cn_good_image` VALUES ('248', '160', 'http://img.cnadmart.com/20180620/116053af60004c97be91578546c46700.jpg', null, '1', '2018-06-20 15:00:32', 'admin');
INSERT INTO `cn_good_image` VALUES ('249', '160', 'http://img.cnadmart.com/20180620/98c952bdd43949d1ab3ff88786b36535.png', null, '1', '2018-06-20 15:00:32', 'admin');
INSERT INTO `cn_good_image` VALUES ('250', '160', 'http://img.cnadmart.com/20180620/acebc2160c084a5b95f36d57dd4d431d.png', null, '1', '2018-06-20 15:00:32', 'admin');
INSERT INTO `cn_good_image` VALUES ('251', '160', 'http://img.cnadmart.com/20180620/398ea92d2378457784aa393fc1d8423c.jpg', null, '1', '2018-06-20 15:00:32', 'admin');
INSERT INTO `cn_good_image` VALUES ('252', '161', 'http://img.cnadmart.com/20180620/0d63b57ae9b140fa9f618c03a30c62a3.jpg', null, '1', '2018-06-20 15:30:00', 'admin');
INSERT INTO `cn_good_image` VALUES ('253', '161', 'http://img.cnadmart.com/20180620/a1b2f67855624e89971a6dee1f311e3b.jpg', null, '1', '2018-06-20 15:30:00', 'admin');
INSERT INTO `cn_good_image` VALUES ('254', '161', 'http://img.cnadmart.com/20180620/0e1bf45a8ac446b0901b4aa478dcc3aa.jpg', null, '1', '2018-06-20 15:30:00', 'admin');
INSERT INTO `cn_good_image` VALUES ('255', '161', 'http://img.cnadmart.com/20180620/0543378a4ac949189078c0c5a7ce1269.jpg', null, '1', '2018-06-20 15:30:00', 'admin');
INSERT INTO `cn_good_image` VALUES ('256', '161', 'http://img.cnadmart.com/20180620/3d96eff870f94a869b699a07d9efcfc5.jpg', null, '1', '2018-06-20 15:30:00', 'admin');
INSERT INTO `cn_good_image` VALUES ('257', '162', 'http://img.cnadmart.com/20180620/802886618b9447628b13561c227ad42b.jpg', null, '1', '2018-06-20 16:59:01', 'admin');
INSERT INTO `cn_good_image` VALUES ('258', '162', 'http://img.cnadmart.com/20180620/8bf7b59e9af44fc39406cb061933dc89.jpg', null, '1', '2018-06-20 16:59:01', 'admin');
INSERT INTO `cn_good_image` VALUES ('259', '162', 'http://img.cnadmart.com/20180620/73e14e475d4c424793e39ab556afbcf7.jpg', null, '1', '2018-06-20 16:59:01', 'admin');
INSERT INTO `cn_good_image` VALUES ('260', '162', 'http://img.cnadmart.com/20180620/d7905ed1e23441018b4024509187682e.jpg', null, '1', '2018-06-20 16:59:01', 'admin');
INSERT INTO `cn_good_image` VALUES ('261', '163', 'http://img.cnadmart.com/20180621/78df7cef996b4e3cbea7ff0bb83b9be3.jpg', null, null, '2018-06-21 09:34:16', 'admin');
INSERT INTO `cn_good_image` VALUES ('262', '163', 'http://img.cnadmart.com/20180621/c329237fc36145cdaa1d868ee87bb780.jpg', null, null, '2018-06-21 09:34:17', 'admin');
INSERT INTO `cn_good_image` VALUES ('263', '163', 'http://img.cnadmart.com/20180621/bba11be0cd324634b3fb97fcd130dd9c.jpg', null, null, '2018-06-21 09:34:18', 'admin');
INSERT INTO `cn_good_image` VALUES ('264', '163', 'http://img.cnadmart.com/20180621/4b970ca72a6a46518c0be22187f18bf5.jpg', null, null, '2018-06-21 09:34:19', 'admin');
INSERT INTO `cn_good_image` VALUES ('265', '164', 'http://img.cnadmart.com/20180621/d31567efa2654795a57c058a29836b94.png', null, '1', '2018-06-21 09:36:46', 'admin');
INSERT INTO `cn_good_image` VALUES ('271', '166', 'http://img.cnadmart.com/20180621/06506053056b4954b276fc596aa9739e.jpg', null, '1', '2018-06-21 09:46:14', 'admin');
INSERT INTO `cn_good_image` VALUES ('272', '166', 'http://img.cnadmart.com/20180621/c9b5a86aff904223966dab00de5d097d.png', null, '1', '2018-06-21 09:46:14', 'admin');
INSERT INTO `cn_good_image` VALUES ('273', '166', 'http://img.cnadmart.com/20180621/0dabae1261e4487eafd0e0123a61a951.jpg', null, '1', '2018-06-21 09:46:14', 'admin');
INSERT INTO `cn_good_image` VALUES ('274', '166', 'http://img.cnadmart.com/20180621/b40fd2668924431ca3091a43d0790d57.jpg', null, '1', '2018-06-21 09:46:14', 'admin');
INSERT INTO `cn_good_image` VALUES ('275', '166', 'http://img.cnadmart.com/20180621/6e210167740048d3b96fe4969b35c16c.jpg', null, '1', '2018-06-21 09:46:14', 'admin');
INSERT INTO `cn_good_image` VALUES ('276', '168', 'http://img.cnadmart.com/20180621/17fe22748ec64ac98a5ae96fe15fddcc.png', null, '1', '2018-06-21 09:58:31', 'admin');
INSERT INTO `cn_good_image` VALUES ('277', '168', 'http://img.cnadmart.com/20180621/fa4fc5fe071846588e4f9a594c786b5c.jpg', null, '1', '2018-06-21 09:58:31', 'admin');
INSERT INTO `cn_good_image` VALUES ('278', '168', 'http://img.cnadmart.com/20180621/e20d39f4e66c42aca0f7e867807af8c4.jpg', null, '1', '2018-06-21 09:58:31', 'admin');
INSERT INTO `cn_good_image` VALUES ('279', '168', 'http://img.cnadmart.com/20180621/9ffe65073e7c42888022524cb37192d6.jpg', null, '1', '2018-06-21 09:58:31', 'admin');
INSERT INTO `cn_good_image` VALUES ('280', '168', 'http://img.cnadmart.com/20180621/e98deee902c1407ab62a02b5c4e13f84.jpg', null, '1', '2018-06-21 09:58:31', 'admin');
INSERT INTO `cn_good_image` VALUES ('286', '170', 'http://img.cnadmart.com/20180621/e2351850dc7a429083fa577b30c01ccd.png', null, '1', '2018-06-21 10:34:36', 'admin');
INSERT INTO `cn_good_image` VALUES ('287', '171', 'http://img.cnadmart.com/20180621/6be85375e45f4eea8b75e222dad9b8a8.jpg', null, '1', '2018-06-21 10:37:39', 'admin');
INSERT INTO `cn_good_image` VALUES ('288', '171', 'http://img.cnadmart.com/20180621/ac1704a3be7544478a8b731ee5de7924.jpg', null, '1', '2018-06-21 10:37:39', 'admin');
INSERT INTO `cn_good_image` VALUES ('289', '171', 'http://img.cnadmart.com/20180621/c6a2073a62484b6781abc2e5abfc608d.jpg', null, '1', '2018-06-21 10:37:39', 'admin');
INSERT INTO `cn_good_image` VALUES ('290', '171', 'http://img.cnadmart.com/20180621/7bcec5d2b870494caaaf3a4e1a40b8fe.jpg', null, '1', '2018-06-21 10:37:39', 'admin');
INSERT INTO `cn_good_image` VALUES ('291', '171', 'http://img.cnadmart.com/20180621/7bcc7a0333034892a148e9688944b4b4.jpg', null, '1', '2018-06-21 10:37:39', 'admin');
INSERT INTO `cn_good_image` VALUES ('292', '172', 'http://img.cnadmart.com/20180621/479bb09929944bcc8b3ec4fb0aedba05.png', null, '1', '2018-06-21 11:19:25', 'admin');
INSERT INTO `cn_good_image` VALUES ('293', '172', 'http://img.cnadmart.com/20180621/0ccb7b843c4647399665c132b09b118d.jpg', null, '1', '2018-06-21 11:19:25', 'admin');
INSERT INTO `cn_good_image` VALUES ('294', '172', 'http://img.cnadmart.com/20180621/8d19e6a0bcfb4eac9ecd417901e1a242.jpg', null, '1', '2018-06-21 11:19:25', 'admin');
INSERT INTO `cn_good_image` VALUES ('295', '172', 'http://img.cnadmart.com/20180621/31368537458f42c092f5ec8af069f895.jpg', null, '1', '2018-06-21 11:19:25', 'admin');
INSERT INTO `cn_good_image` VALUES ('296', '172', 'http://img.cnadmart.com/20180621/3b44933476004bc4b83c259b23d036d6.jpg', null, '1', '2018-06-21 11:19:25', 'admin');
INSERT INTO `cn_good_image` VALUES ('297', '173', 'http://img.cnadmart.com/20180621/551d0619af6a4d49aa9751cec7428f19.jpg', null, '1', '2018-06-21 11:24:36', 'admin');
INSERT INTO `cn_good_image` VALUES ('298', '174', 'http://img.cnadmart.com/20180621/cb3642f47c544eeca13cd4e277211111.png', null, '1', '2018-06-21 11:25:32', 'admin');
INSERT INTO `cn_good_image` VALUES ('302', '176', 'http://img.cnadmart.com/20180621/860b4991571f4cf3937117c38fcd8d5c.jpg', null, '1', '2018-06-21 11:34:22', 'admin');
INSERT INTO `cn_good_image` VALUES ('303', '176', 'http://img.cnadmart.com/20180621/fc1da91d2f7f421689f3569a87172713.jpg', null, '1', '2018-06-21 11:34:22', 'admin');
INSERT INTO `cn_good_image` VALUES ('304', '176', 'http://img.cnadmart.com/20180621/8998e675a2504fddba252c759247ac42.png', null, '1', '2018-06-21 11:34:22', 'admin');
INSERT INTO `cn_good_image` VALUES ('305', '152', 'http://img.cnadmart.com/20180621/9174aa12b3654a60a5b78e7a483c0cb0.jpg', null, null, '2018-06-21 11:39:24', 'admin');
INSERT INTO `cn_good_image` VALUES ('306', '152', 'http://img.cnadmart.com/20180621/ece6a1cc7fd84ebbae21acbd3b75a27f.jpg', null, null, '2018-06-21 11:39:25', 'admin');
INSERT INTO `cn_good_image` VALUES ('307', '152', 'http://img.cnadmart.com/20180621/e07ac0af94ee4887aa1881aa748299f3.jpg', null, null, '2018-06-21 11:39:26', 'admin');
INSERT INTO `cn_good_image` VALUES ('308', '152', 'http://img.cnadmart.com/20180621/6a60e829af114007b6ff0d890580fc7a.jpg', null, null, '2018-06-21 11:39:29', 'admin');
INSERT INTO `cn_good_image` VALUES ('309', '152', 'http://img.cnadmart.com/20180621/31c796ae9a2e430288213a36cbb41817.png', null, null, '2018-06-21 11:39:32', 'admin');
INSERT INTO `cn_good_image` VALUES ('310', '177', 'http://img.cnadmart.com/20180621/a3563e30c71f4eba86852f1b71a34b8c.jpg', null, '1', '2018-06-21 14:08:36', 'admin');
INSERT INTO `cn_good_image` VALUES ('311', '177', 'http://img.cnadmart.com/20180621/17594c5d284a49e5a1c33635ba87047d.jpg', null, '1', '2018-06-21 14:08:36', 'admin');
INSERT INTO `cn_good_image` VALUES ('312', '177', 'http://img.cnadmart.com/20180621/b654e26e648b47a59b5979bcb291b6b7.jpg', null, '1', '2018-06-21 14:08:36', 'admin');
INSERT INTO `cn_good_image` VALUES ('313', '177', 'http://img.cnadmart.com/20180621/505bf1dd7d4b4a1c9eade8897c4a65c1.jpg', null, '1', '2018-06-21 14:08:36', 'admin');
INSERT INTO `cn_good_image` VALUES ('314', '153', 'http://img.cnadmart.com/20180621/a2211027ce9f4ae9ab42ef4f836d212b.png', null, null, '2018-06-21 14:22:01', 'admin');
INSERT INTO `cn_good_image` VALUES ('315', '155', 'http://img.cnadmart.com/20180621/185b0884a3bd4b1caec468e9cc1be5d1.jpg', null, null, '2018-06-21 14:27:58', 'admin');
INSERT INTO `cn_good_image` VALUES ('316', '155', 'http://img.cnadmart.com/20180621/6b7f32932e7243e2a8df465db64fc97c.jpg', null, null, '2018-06-21 14:27:58', 'admin');
INSERT INTO `cn_good_image` VALUES ('317', '155', 'http://img.cnadmart.com/20180621/6a2d24fa80d94d26b0d9811ec5f2dfe9.jpg', null, null, '2018-06-21 14:28:00', 'admin');
INSERT INTO `cn_good_image` VALUES ('318', '155', 'http://img.cnadmart.com/20180621/08c3b9973b00406d8655ac06aa07526b.jpg', null, null, '2018-06-21 14:28:02', 'admin');
INSERT INTO `cn_good_image` VALUES ('319', '155', 'http://img.cnadmart.com/20180621/a12eda3e51da4390873a127ac322a57d.jpg', null, null, '2018-06-21 14:28:02', 'admin');
INSERT INTO `cn_good_image` VALUES ('320', '154', 'http://img.cnadmart.com/20180621/2bf8702f5cc345359605b00070c49ba9.jpg', null, null, '2018-06-21 14:41:03', 'admin');
INSERT INTO `cn_good_image` VALUES ('321', '154', 'http://img.cnadmart.com/20180621/c9ccb386b39840ae9d4d1a2169b79b50.jpg', null, null, '2018-06-21 14:41:04', 'admin');
INSERT INTO `cn_good_image` VALUES ('322', '154', 'http://img.cnadmart.com/20180621/4f73130ae4524964b4f43f14d78e8ae7.jpg', null, null, '2018-06-21 14:41:05', 'admin');
INSERT INTO `cn_good_image` VALUES ('323', '154', 'http://img.cnadmart.com/20180621/6dc6783973794fa3b6853900b0f59595.jpg', null, null, '2018-06-21 14:41:06', 'admin');
INSERT INTO `cn_good_image` VALUES ('324', '154', 'http://img.cnadmart.com/20180621/4aabdacb60cf492a9c0d2a7a252c7d95.jpg', null, null, '2018-06-21 14:41:11', 'admin');
INSERT INTO `cn_good_image` VALUES ('325', '154', 'http://img.cnadmart.com/20180621/d62913992f484ce3b72d75cf0967d6ce.jpg', null, null, '2018-06-21 14:41:13', 'admin');
INSERT INTO `cn_good_image` VALUES ('326', '178', 'http://img.cnadmart.com/20180621/23f96fc742a34ef2ae7c9e3f4510a018.jpg', null, '1', '2018-06-21 15:12:00', 'admin');
INSERT INTO `cn_good_image` VALUES ('327', '178', 'http://img.cnadmart.com/20180621/2900c82dc10c48a1bc75b4e6309e9f90.jpg', null, '1', '2018-06-21 15:12:00', 'admin');
INSERT INTO `cn_good_image` VALUES ('328', '178', 'http://img.cnadmart.com/20180621/e2674e10387b448e9adeed3a394630cf.jpg', null, '1', '2018-06-21 15:12:00', 'admin');
INSERT INTO `cn_good_image` VALUES ('329', '178', 'http://img.cnadmart.com/20180621/2f68dfe9ff5549d2b5da4778a89d8461.png', null, '1', '2018-06-21 15:12:00', 'admin');
INSERT INTO `cn_good_image` VALUES ('330', '179', 'http://img.cnadmart.com/20180621/b06390ceb4bf429cbf1d5164e49e19ca.png', null, '1', '2018-06-21 16:07:17', 'admin');
INSERT INTO `cn_good_image` VALUES ('334', '180', 'http://img.cnadmart.com/20180621/7568a42260cb4e11a5f15fb828690b01.png', null, '1', '2018-06-21 16:39:36', 'admin');
INSERT INTO `cn_good_image` VALUES ('335', '180', 'http://img.cnadmart.com/20180621/abd4c4ee747d4834b367c9ce789c894a.png', null, '1', '2018-06-21 16:39:36', 'admin');
INSERT INTO `cn_good_image` VALUES ('336', '181', 'http://img.cnadmart.com/20180621/b55d2df52bce4422b82f33389b53e654.jpg', null, '1', '2018-06-21 16:42:08', 'admin');
INSERT INTO `cn_good_image` VALUES ('337', '181', 'http://img.cnadmart.com/20180621/ac30f1f004db43829fe81debfe6ebf87.jpg', null, '1', '2018-06-21 16:42:08', 'admin');
INSERT INTO `cn_good_image` VALUES ('338', '181', 'http://img.cnadmart.com/20180621/28fb6bb652ee4ae48d01f6d6ed0dc1cf.jpg', null, '1', '2018-06-21 16:42:08', 'admin');
INSERT INTO `cn_good_image` VALUES ('339', '182', 'http://img.cnadmart.com/20180622/bb00f3f750624407b06e42dc8bc4781b.png', null, '1', '2018-06-22 09:07:47', 'admin');
INSERT INTO `cn_good_image` VALUES ('340', '182', 'http://img.cnadmart.com/20180622/e7fa05c6347a49148a2e18a69e8edcf7.jpg', null, '1', '2018-06-22 09:07:47', 'admin');
INSERT INTO `cn_good_image` VALUES ('341', '183', 'http://img.cnadmart.com/20180622/dba980d1ab664f3c9ca1d0fa0e95c43e.jpg', null, '1', '2018-06-22 09:57:18', 'admin');
INSERT INTO `cn_good_image` VALUES ('342', '184', 'http://img.cnadmart.com/20180622/716a4822a1194b60be779935637c47c4.jpg', null, '1', '2018-06-22 10:26:16', 'admin');
INSERT INTO `cn_good_image` VALUES ('343', '184', 'http://img.cnadmart.com/20180622/0f333a064d6645cd97b7fecb82235743.jpg', null, '1', '2018-06-22 10:26:16', 'admin');
INSERT INTO `cn_good_image` VALUES ('344', '184', 'http://img.cnadmart.com/20180622/84cb0de06bc341afbff3a756a6c1dac8.jpg', null, '1', '2018-06-22 10:26:16', 'admin');
INSERT INTO `cn_good_image` VALUES ('345', '184', 'http://img.cnadmart.com/20180622/cdf234b955724090b90ea4247e218136.jpg', null, '1', '2018-06-22 10:26:16', 'admin');
INSERT INTO `cn_good_image` VALUES ('346', '184', 'http://img.cnadmart.com/20180622/79c938f282a34f9e98b58d19a570d840.jpg', null, '1', '2018-06-22 10:26:16', 'admin');

-- ----------------------------
-- Table structure for cn_good_parameter
-- ----------------------------
DROP TABLE IF EXISTS `cn_good_parameter`;
CREATE TABLE `cn_good_parameter` (
  `good_parameter_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '参数ID',
  `good_id` bigint(20) DEFAULT NULL COMMENT '商品ID',
  `name` varchar(64) DEFAULT NULL COMMENT '参数名',
  `value` varchar(64) DEFAULT NULL COMMENT '参数值',
  `status` tinyint(2) DEFAULT NULL COMMENT '状态：1.显示；0.隐藏',
  `sort` int(9) DEFAULT NULL COMMENT '排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`good_parameter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='商品参数表';

-- ----------------------------
-- Records of cn_good_parameter
-- ----------------------------
INSERT INTO `cn_good_parameter` VALUES ('1', '95', 'asd', '1', null, null, '2018-07-04 16:45:00', 'admin', null, null);
INSERT INTO `cn_good_parameter` VALUES ('2', '95', '12', '123', null, null, '2018-07-04 16:45:00', 'admin', null, null);
INSERT INTO `cn_good_parameter` VALUES ('3', '95', '12', '345423', null, null, '2018-07-04 16:45:00', 'admin', null, null);

-- ----------------------------
-- Table structure for cn_good_spec_price
-- ----------------------------
DROP TABLE IF EXISTS `cn_good_spec_price`;
CREATE TABLE `cn_good_spec_price` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品规格价格表id 主键',
  `good_id` int(11) NOT NULL COMMENT '商品id',
  `spec_name` varchar(500) DEFAULT '',
  `spec` varchar(100) DEFAULT '' COMMENT '规格 以，相隔  内容为规格值表的id',
  `price` decimal(11,2) DEFAULT '0.00' COMMENT '价格',
  `stock` int(11) DEFAULT '0' COMMENT '库存',
  `default_status` varchar(50) DEFAULT '' COMMENT '是否默认',
  `sales_volume` varchar(50) DEFAULT '0' COMMENT '销售量',
  `status` varchar(50) DEFAULT '' COMMENT '状态 0无库存 1 上架 2 下架',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=613 DEFAULT CHARSET=utf8 COMMENT='规格价格表';

-- ----------------------------
-- Records of cn_good_spec_price
-- ----------------------------
INSERT INTO `cn_good_spec_price` VALUES ('597', '95', '1', '679', '2.00', '2', '', '2', '');
INSERT INTO `cn_good_spec_price` VALUES ('598', '95', '2', '680', '2.00', '2', '', '2', '');
INSERT INTO `cn_good_spec_price` VALUES ('599', '95', '4', '681', '3.00', '3', '', '3', '');
INSERT INTO `cn_good_spec_price` VALUES ('609', '214', 'b,2', '688,690', '3.00', '2', '', '2', '');
INSERT INTO `cn_good_spec_price` VALUES ('610', '214', 'b,3', '688,691', '3.00', '2', '', '2', '');
INSERT INTO `cn_good_spec_price` VALUES ('611', '214', 'c,2', '689,690', '3.00', '2', '', '2', '');
INSERT INTO `cn_good_spec_price` VALUES ('612', '214', 'c,3', '689,691', '1.00', '1', '', '1', '');

-- ----------------------------
-- Table structure for cn_good_spec_value
-- ----------------------------
DROP TABLE IF EXISTS `cn_good_spec_value`;
CREATE TABLE `cn_good_spec_value` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品规格值表主键id',
  `good_id` int(11) NOT NULL COMMENT '商品id',
  `category_spec_id` int(11) NOT NULL COMMENT '分类规格id',
  `spec_value` varchar(50) NOT NULL COMMENT '商品规格值',
  `status` tinyint(1) DEFAULT '1' COMMENT '使用状态（0使用 1未使用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=692 DEFAULT CHARSET=utf8 COMMENT='商品规格值表';

-- ----------------------------
-- Records of cn_good_spec_value
-- ----------------------------
INSERT INTO `cn_good_spec_value` VALUES ('679', '95', '25', '1', '1');
INSERT INTO `cn_good_spec_value` VALUES ('680', '95', '25', '2', '1');
INSERT INTO `cn_good_spec_value` VALUES ('681', '95', '25', '4', '1');
INSERT INTO `cn_good_spec_value` VALUES ('688', '214', '26', 'b', '1');
INSERT INTO `cn_good_spec_value` VALUES ('689', '214', '26', 'c', '1');
INSERT INTO `cn_good_spec_value` VALUES ('690', '214', '27', '2', '1');
INSERT INTO `cn_good_spec_value` VALUES ('691', '214', '27', '3', '1');

-- ----------------------------
-- Table structure for cn_news
-- ----------------------------
DROP TABLE IF EXISTS `cn_news`;
CREATE TABLE `cn_news` (
  `id` bigint(20) DEFAULT NULL,
  `title` varchar(255) DEFAULT '' COMMENT '标题',
  `summary` varchar(255) DEFAULT '' COMMENT '摘要',
  `content` varchar(255) DEFAULT '' COMMENT '内容',
  `pub_time` datetime DEFAULT NULL COMMENT '发布时间',
  `create_by` bigint(20) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cn_news
-- ----------------------------

-- ----------------------------
-- Table structure for cn_order
-- ----------------------------
DROP TABLE IF EXISTS `cn_order`;
CREATE TABLE `cn_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_no` varchar(50) NOT NULL COMMENT '订单编号',
  `total_money` decimal(16,2) NOT NULL DEFAULT '0.00' COMMENT '订单总额',
  `order_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '订单状态 0:待支付 1:待支付关闭 2:已付款，待发货  3:待收货 4:已收货 5:待评价 6:申请退款 7:退款完成 8:已完成订单',
  `user_id` int(11) NOT NULL DEFAULT '1' COMMENT '用户id',
  `created_time` datetime NOT NULL COMMENT '订单提交时间',
  `pay_time` datetime DEFAULT NULL COMMENT '订单支付时间',
  `delivery_time` datetime DEFAULT NULL COMMENT '发货时间',
  `receiving_time` datetime DEFAULT NULL COMMENT '收货时间',
  `refund_period` datetime DEFAULT NULL COMMENT '申请退款时间',
  `refund_complete_period` datetime DEFAULT NULL COMMENT '退款完成时间',
  `detailed_address` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `area` varchar(20) DEFAULT NULL COMMENT '区',
  `city` varchar(20) DEFAULT NULL COMMENT '市',
  `province` varchar(20) DEFAULT NULL COMMENT '省',
  `consignee` varchar(10) NOT NULL COMMENT '收货人',
  `postcode` varchar(20) DEFAULT '0' COMMENT '邮编',
  `tel` varchar(20) NOT NULL COMMENT '收货人手机号',
  `express_number` varchar(100) DEFAULT '0' COMMENT '快递单号',
  `express_company_no` varchar(20) DEFAULT '' COMMENT '快递公司编号',
  `express_company_name` varchar(255) DEFAULT NULL COMMENT '快递公司名称',
  `express_type` tinyint(10) DEFAULT NULL COMMENT '快递类型 0：自主发货 1：快递发货',
  `delivery_person_tel` varchar(255) DEFAULT NULL COMMENT '配送人电话号码',
  `note` varchar(1000) DEFAULT NULL COMMENT '备注',
  `freight` decimal(10,0) DEFAULT NULL COMMENT '运费',
  `vir_del` int(10) DEFAULT '0' COMMENT '虚拟删除 0：未删除 1：删除',
  `consignor_id` int(11) DEFAULT NULL COMMENT '发货代理商id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8 COMMENT='订单主表';

-- ----------------------------
-- Records of cn_order
-- ----------------------------
INSERT INTO `cn_order` VALUES ('132', '20180627103520f6ahi', '702.00', '1', '9', '2018-06-27 10:35:21', null, null, null, null, null, '上海市人民政府办公厅组织', '卢湾区', '上海市', '上海市', '李五', '147852', '17698522148', '0', '', null, null, null, null, '0', '0', null);
INSERT INTO `cn_order` VALUES ('133', '20180627020101tzmlz', '75.00', '3', '10', '2018-06-27 14:01:02', null, '2018-06-30 15:12:15', null, null, null, '明发商业广场13楼', '包河区', '合肥市', '安徽省', '广品汇', '000000', '18888888888', '12345', 'YD4', '韵达快递', '1', null, null, '0', '0', '1');
INSERT INTO `cn_order` VALUES ('134', '20180627020213mgp3o', '328.00', '1', '22', '2018-06-27 14:02:13', null, null, null, null, null, '龙与虎', '延庆县', '县', '北京市', '嘛事', '653458', '15635856874', '0', '', null, null, null, null, '0', '1', null);
INSERT INTO `cn_order` VALUES ('135', '20180627022041ubw3k', '1745.00', '3', '22', '2018-06-27 14:20:42', '2018-06-27 14:20:52', '2018-06-30 22:37:50', null, null, null, '今生今世看手机', '卢湾区', '上海市', '上海市', '卡夹', '805234', '18856582519', 'tttt', 'QFKD', '全峰快递', '1', null, null, '0', '1', '1');
INSERT INTO `cn_order` VALUES ('136', '20180628090035eznfs', '1300.00', '0', '9', '2018-06-28 09:00:35', null, null, null, null, null, '四里河路明发商业广场13楼1325室', '庐阳区', '合肥市', '安徽省', '宋许超', '340000', '17682153207', '0', '', null, null, null, '测试', '0', '0', null);
INSERT INTO `cn_order` VALUES ('137', '20180628100445qvfaf', '584.00', '1', '9', '2018-06-28 10:04:58', null, null, null, null, null, '四里河路明发商业广场13楼1325室', '庐阳区', '合肥市', '安徽省', '宋许超', '340000', '17682153207', '0', '', null, null, null, null, '20', '0', null);
INSERT INTO `cn_order` VALUES ('138', '20180628043653r0oca', '2541.00', '3', '10', '2018-06-28 16:36:53', '2018-06-29 15:57:37', '2018-07-02 15:36:37', null, null, null, '歌手是谁世界上那你', '大观区', '安庆市', '安徽省', '哈哈哈', '000000', '15605655945', '11', 'EMS', 'EMS', '1', null, null, '0', '0', '1');
INSERT INTO `cn_order` VALUES ('139', '20180628044439nj8d1', '2112.00', '0', '13', '2018-06-28 16:44:40', null, null, null, null, null, '哈哈', '大观区', '安庆市', '安徽省', '哈哈', '12358', '1300000000', '0', '', null, null, null, null, '0', '0', null);
INSERT INTO `cn_order` VALUES ('140', '20180629025711udagv', '134.00', '3', '22', '2018-06-29 14:57:12', '2018-06-29 16:24:06', '2018-07-02 17:28:55', null, null, null, '静默', '大观区', '安庆市', '安徽省', '一周\nSOHO', '6582588', '18564804168', '基本技能', 'EMS', 'EMS', '1', null, null, '0', '0', '1');
INSERT INTO `cn_order` VALUES ('141', '201806290257541e2f7', '114.00', '3', '22', '2018-06-29 14:57:55', '2018-06-29 16:30:30', '2018-06-29 16:32:30', null, null, null, '静默', '大观区', '安庆市', '安徽省', '一周\nSOHO', '6582588', '18564804168', '0', '', null, '0', '123456', null, '0', '0', '1');
INSERT INTO `cn_order` VALUES ('142', '20180629025902qzzcw', '75.00', '3', '22', '2018-06-29 14:59:02', '2018-06-29 16:29:35', '2018-07-04 15:36:32', null, null, null, '静默', '大观区', '安庆市', '安徽省', '一周\nSOHO', '6582588', '18564804168', '0', '', null, '0', '888', null, '0', '0', '1');
INSERT INTO `cn_order` VALUES ('143', '20180629025920puvly', '75.00', '0', '22', '2018-06-29 14:59:20', null, null, null, null, null, '静默', '大观区', '安庆市', '安徽省', '一周\nSOHO', '6582588', '18564804168', '0', '', null, null, null, null, '0', '0', null);
INSERT INTO `cn_order` VALUES ('144', '20180629030145ka340', '130.00', '4', '22', '2018-06-29 15:01:46', '2018-06-29 15:02:59', '2018-06-29 15:03:47', null, null, null, '静默', '大观区', '安庆市', '安徽省', '一周\nSOHO', '6582588', '18564804168', '0', '', null, '0', '123456', null, '0', '0', '1');
INSERT INTO `cn_order` VALUES ('145', '20180629041308lmyr8', '234.00', '3', '10', '2018-06-29 16:13:09', '2018-06-29 16:24:19', '2018-07-05 12:43:29', null, null, null, '歌手是谁世界上那你', '大观区', '安庆市', '安徽省', '哈哈哈', '000000', '15605655945', 'sssssssss', 'QFKD', '全峰快递', '1', null, null, '0', '0', '1');
INSERT INTO `cn_order` VALUES ('146', '20180629041736i12e0', '405.00', '0', '22', '2018-06-29 16:17:37', null, null, null, null, null, '静默', '大观区', '安庆市', '安徽省', '一周\nSOHO', '6582588', '18564804168', '0', '', null, null, null, null, '0', '0', null);
INSERT INTO `cn_order` VALUES ('147', '20180629042435crv43', '468.00', '0', '10', '2018-06-29 16:24:35', null, null, null, null, null, '歌手是谁世界上那你', '大观区', '安庆市', '安徽省', '哈哈哈', '000000', '15605655945', '0', '', null, null, null, null, '0', '0', null);
INSERT INTO `cn_order` VALUES ('148', '20180629042557xb43b', '75.00', '0', '22', '2018-06-29 16:25:58', null, null, null, null, null, '静默', '大观区', '安庆市', '安徽省', '一周\nSOHO', '6582588', '18564804168', '0', '', null, null, null, null, '0', '0', null);
INSERT INTO `cn_order` VALUES ('149', '20180629090829ciyzz', '912.00', '0', '10', '2018-06-29 21:08:29', null, null, null, null, null, '歌手是谁世界上那你', '大观区', '安庆市', '安徽省', '哈哈哈', '000000', '15605655945', '0', '', null, null, null, null, '0', '0', null);
INSERT INTO `cn_order` VALUES ('150', '20180630111829h7j0o', '234.00', '3', '22', '2018-06-30 11:18:30', '2018-06-30 11:18:36', '2018-07-05 16:51:15', null, null, null, '静默', '大观区', '安庆市', '安徽省', '一周\nSOHO', '6582588', '18564804168', '11111111111', 'EMS', 'EMS', '1', null, null, '0', '0', '1');

-- ----------------------------
-- Table structure for cn_order_good
-- ----------------------------
DROP TABLE IF EXISTS `cn_order_good`;
CREATE TABLE `cn_order_good` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_no` varchar(50) NOT NULL COMMENT '订单id',
  `good_id` int(11) NOT NULL,
  `good_spec_price_id` int(11) NOT NULL COMMENT '商品规格价格id',
  `amount` int(10) NOT NULL COMMENT '商品购买数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cn_order_good
-- ----------------------------
INSERT INTO `cn_order_good` VALUES ('1', '1', '1', '45', '2');
INSERT INTO `cn_order_good` VALUES ('2', '20180530024541r6ps1', '1', '48', '5');
INSERT INTO `cn_order_good` VALUES ('3', '20180530024541r6ps1', '1', '45', '8');
INSERT INTO `cn_order_good` VALUES ('4', '201805300247146hxqz', '40', '48', '5');
INSERT INTO `cn_order_good` VALUES ('5', '201805300247146hxqz', '40', '45', '8');
INSERT INTO `cn_order_good` VALUES ('6', '20180530024803h52n5', '1', '48', '5');
INSERT INTO `cn_order_good` VALUES ('7', '20180530024803h52n5', '1', '45', '8');
INSERT INTO `cn_order_good` VALUES ('8', '20180530030155rpl7t', '1', '48', '5');
INSERT INTO `cn_order_good` VALUES ('9', '20180530030155rpl7t', '1', '45', '8');
INSERT INTO `cn_order_good` VALUES ('10', '20180530030438vgnr7', '1', '48', '5');
INSERT INTO `cn_order_good` VALUES ('11', '20180530030438vgnr7', '1', '45', '8');
INSERT INTO `cn_order_good` VALUES ('12', '20180530032302qzqos', '1', '48', '5');
INSERT INTO `cn_order_good` VALUES ('13', '20180530032302qzqos', '1', '45', '8');
INSERT INTO `cn_order_good` VALUES ('14', '20180530033415h8plw', '1', '48', '5');
INSERT INTO `cn_order_good` VALUES ('15', '20180530033415h8plw', '1', '45', '8');
INSERT INTO `cn_order_good` VALUES ('16', '20180530033651ykleb', '1', '48', '5');
INSERT INTO `cn_order_good` VALUES ('17', '20180530033651ykleb', '1', '45', '8');
INSERT INTO `cn_order_good` VALUES ('18', '201805300338552u6uh', '44', '46', '5');
INSERT INTO `cn_order_good` VALUES ('19', '201805300338552u6uh', '45', '45', '8');
INSERT INTO `cn_order_good` VALUES ('20', '20180530040030ihszd', '1', '48', '5');
INSERT INTO `cn_order_good` VALUES ('21', '20180530040030ihszd', '1', '45', '8');
INSERT INTO `cn_order_good` VALUES ('22', '201805300752298tuh1', '42', '48', '5');
INSERT INTO `cn_order_good` VALUES ('23', '201805300752298tuh1', '43', '45', '8');
INSERT INTO `cn_order_good` VALUES ('24', '201805310858305ip6l', '40', '48', '3');
INSERT INTO `cn_order_good` VALUES ('25', '201805310858305ip6l', '41', '45', '45');
INSERT INTO `cn_order_good` VALUES ('26', '20180613050624z1l79', '41', '47', '5');
INSERT INTO `cn_order_good` VALUES ('27', '20180613050808j2t8r', '41', '47', '5');
INSERT INTO `cn_order_good` VALUES ('28', '20180613051214a845k', '41', '47', '5');
INSERT INTO `cn_order_good` VALUES ('29', '20180613052400ocnbo', '41', '3', '2');
INSERT INTO `cn_order_good` VALUES ('30', '201806130804156e0sk', '41', '42', '5');
INSERT INTO `cn_order_good` VALUES ('31', '20180614085149fj7p2', '41', '42', '5555');
INSERT INTO `cn_order_good` VALUES ('32', '20180614085307z74kr', '41', '45', '1');
INSERT INTO `cn_order_good` VALUES ('33', '201806140911438ovlt', '41', '41', '3');
INSERT INTO `cn_order_good` VALUES ('34', '201806140911438ovlt', '41', '41', '1');
INSERT INTO `cn_order_good` VALUES ('35', '20180614105922wu4f5', '41', '46', '5');
INSERT INTO `cn_order_good` VALUES ('36', '20180614041123ww0sb', '90', '153', '2');
INSERT INTO `cn_order_good` VALUES ('37', '20180614045054pumvu', '90', '153', '1');
INSERT INTO `cn_order_good` VALUES ('38', '20180620064115zwklx', '96', '195', '1');
INSERT INTO `cn_order_good` VALUES ('39', '20180621093757u3cfh', '95', '181', '1');
INSERT INTO `cn_order_good` VALUES ('40', '20180621093913cn2wp', '95', '178', '1');
INSERT INTO `cn_order_good` VALUES ('41', '20180621094037vpd33', '95', '178', '1');
INSERT INTO `cn_order_good` VALUES ('42', '20180621095229ymmbu', '95', '182', '1');
INSERT INTO `cn_order_good` VALUES ('43', '201806210954238qatv', '95', '185', '1');
INSERT INTO `cn_order_good` VALUES ('44', '20180621101441f93l5', '95', '175', '1');
INSERT INTO `cn_order_good` VALUES ('45', '20180621102734nuav9', '95', '182', '1');
INSERT INTO `cn_order_good` VALUES ('46', '20180621103901xqhzl', '95', '178', '1');
INSERT INTO `cn_order_good` VALUES ('47', '20180621104048386hl', '96', '194', '1');
INSERT INTO `cn_order_good` VALUES ('48', '20180621114409e4ux6', '95', '181', '1');
INSERT INTO `cn_order_good` VALUES ('49', '20180621022218o4qas', '95', '179', '1');
INSERT INTO `cn_order_good` VALUES ('50', '20180621022218dwc45', '95', '179', '1');
INSERT INTO `cn_order_good` VALUES ('51', '20180621022218co7tn', '95', '179', '1');
INSERT INTO `cn_order_good` VALUES ('52', '20180621022218h04ek', '95', '179', '1');
INSERT INTO `cn_order_good` VALUES ('53', '20180621022218ehri5', '95', '179', '1');
INSERT INTO `cn_order_good` VALUES ('54', '20180621022218qc9kw', '95', '179', '1');
INSERT INTO `cn_order_good` VALUES ('55', '20180621022218m9fks', '95', '179', '1');
INSERT INTO `cn_order_good` VALUES ('56', '20180621022238rpzpr', '95', '176', '1');
INSERT INTO `cn_order_good` VALUES ('57', '2018062102361285mod', '95', '175', '1');
INSERT INTO `cn_order_good` VALUES ('58', '20180621023816knz46', '96', '191', '1');
INSERT INTO `cn_order_good` VALUES ('59', '20180621024152dq2h6', '96', '192', '1');
INSERT INTO `cn_order_good` VALUES ('60', '20180621024427hpgw4', '96', '191', '1');
INSERT INTO `cn_order_good` VALUES ('61', '20180621030905rakeb', '95', '182', '1');
INSERT INTO `cn_order_good` VALUES ('62', '20180621031033cmfnt', '96', '191', '1');
INSERT INTO `cn_order_good` VALUES ('63', '20180621031145b5hwp', '95', '176', '3');
INSERT INTO `cn_order_good` VALUES ('64', '201806210311563ng9s', '95', '178', '1');
INSERT INTO `cn_order_good` VALUES ('65', '20180621031221zcja0', '95', '178', '1');
INSERT INTO `cn_order_good` VALUES ('66', '20180621031747igpes', '96', '195', '1');
INSERT INTO `cn_order_good` VALUES ('67', '20180621031806y649c', '95', '178', '4');
INSERT INTO `cn_order_good` VALUES ('68', '20180621031904behdx', '95', '179', '1');
INSERT INTO `cn_order_good` VALUES ('69', '201806210322397h7bb', '95', '182', '1');
INSERT INTO `cn_order_good` VALUES ('70', '20180621032425i2q4g', '95', '179', '2');
INSERT INTO `cn_order_good` VALUES ('71', '20180621032449yh4j9', '96', '195', '1');
INSERT INTO `cn_order_good` VALUES ('72', '2018062103482036134', '95', '179', '1');
INSERT INTO `cn_order_good` VALUES ('73', '20180621042032hd78x', '95', '180', '1');
INSERT INTO `cn_order_good` VALUES ('74', '20180621042803ppyzz', '95', '174', '1');
INSERT INTO `cn_order_good` VALUES ('75', '20180621043207x1ri4', '95', '178', '1');
INSERT INTO `cn_order_good` VALUES ('76', '20180621043749wiime', '95', '179', '4');
INSERT INTO `cn_order_good` VALUES ('77', '20180621044422k49j2', '95', '176', '2');
INSERT INTO `cn_order_good` VALUES ('78', '20180621044643uh5l5', '95', '185', '1');
INSERT INTO `cn_order_good` VALUES ('79', '201806210448509u6sa', '95', '176', '1');
INSERT INTO `cn_order_good` VALUES ('80', '20180621045022bumbb', '95', '182', '1');
INSERT INTO `cn_order_good` VALUES ('81', '20180621045659z40uq', '95', '176', '2');
INSERT INTO `cn_order_good` VALUES ('82', '20180621050349to05m', '95', '174', '1');
INSERT INTO `cn_order_good` VALUES ('83', '20180621051326slkok', '95', '176', '1');
INSERT INTO `cn_order_good` VALUES ('84', '20180621051823s1jn4', '95', '182', '1');
INSERT INTO `cn_order_good` VALUES ('85', '20180621052149f0obo', '95', '185', '1');
INSERT INTO `cn_order_good` VALUES ('86', '201806210526187b2m7', '95', '179', '1');
INSERT INTO `cn_order_good` VALUES ('87', '20180621053209rav7e', '95', '176', '1');
INSERT INTO `cn_order_good` VALUES ('88', '20180621054214jf674', '95', '184', '1');
INSERT INTO `cn_order_good` VALUES ('89', '20180621055208s2ivm', '95', '185', '1');
INSERT INTO `cn_order_good` VALUES ('90', '20180621055852vc9pt', '95', '185', '1');
INSERT INTO `cn_order_good` VALUES ('91', '20180621060023avrg1', '95', '182', '1');
INSERT INTO `cn_order_good` VALUES ('92', '20180621060256lo511', '95', '182', '1');
INSERT INTO `cn_order_good` VALUES ('93', '20180621060410w9xwh', '95', '182', '1');
INSERT INTO `cn_order_good` VALUES ('94', '20180622091816gqvyl', '95', '181', '1');
INSERT INTO `cn_order_good` VALUES ('95', '20180622101326c4l5u', '95', '182', '1');
INSERT INTO `cn_order_good` VALUES ('96', '20180622110232ys54k', '96', '195', '1');
INSERT INTO `cn_order_good` VALUES ('97', '20180622111951y7dtc', '95', '175', '1');
INSERT INTO `cn_order_good` VALUES ('98', '201806221120000qekn', '95', '175', '1');

-- ----------------------------
-- Table structure for cn_user
-- ----------------------------
DROP TABLE IF EXISTS `cn_user`;
CREATE TABLE `cn_user` (
  `user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `id_card` varchar(50) DEFAULT NULL COMMENT '身份证号码',
  `user_number` varchar(50) DEFAULT NULL COMMENT '用户编号',
  `phone` varchar(12) NOT NULL DEFAULT '' COMMENT '手机号',
  `password` varchar(100) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(20) DEFAULT NULL COMMENT '盐',
  `user_name` varchar(30) DEFAULT NULL COMMENT '用户昵称',
  `real_name` varchar(30) DEFAULT NULL COMMENT '真实姓名',
  `sex` tinyint(1) DEFAULT NULL COMMENT '性别',
  `birth` date DEFAULT NULL COMMENT '出生日期',
  `age` tinyint(4) DEFAULT NULL COMMENT '年龄',
  `pic_img` varchar(255) DEFAULT '' COMMENT '用户头像',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态 0=冻结/1=正常',
  `amount` varchar(255) DEFAULT NULL COMMENT '总金额',
  `user_type` varchar(2) DEFAULT '0' COMMENT '用户类型',
  `regeist_time` datetime DEFAULT NULL COMMENT '注册时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '修改人',
  `idcard_front_img` varchar(200) DEFAULT NULL COMMENT '身份证正面照',
  `idcard_back_img` varchar(200) DEFAULT NULL COMMENT '身份证反面照',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of cn_user
-- ----------------------------
INSERT INTO `cn_user` VALUES ('8', null, null, '13485722069', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', null, '13485722069', null, '0', '2018-06-26', null, '', null, null, '0', '2018-06-09 09:05:16', null, '2018-06-30 09:44:57', 'admin', null, null);
INSERT INTO `cn_user` VALUES ('9', null, null, '17682153207', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', null, 'Jack ', null, null, null, null, 'http://img.cnadmart.com/FqiRJH3fOPGLvTN-5xtXR5Eia87D.jpeg', null, null, '0', '2018-06-11 17:13:42', null, '2018-06-26 17:22:28', 'admin', null, null);
INSERT INTO `cn_user` VALUES ('10', null, null, '18155122471', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', null, '王老板', null, null, null, null, 'http://img.cnadmart.com/STORE/certification/015856820180702155819.jpeg', null, null, '0', '2018-06-11 18:27:41', null, null, null, null, null);
INSERT INTO `cn_user` VALUES ('11', null, null, '17755152862', '', null, '17755152862', null, null, null, null, '', null, null, '0', '2018-06-22 11:00:07', null, null, null, null, null);
INSERT INTO `cn_user` VALUES ('12', null, null, '15256036352', '', null, '原子弹', null, null, null, null, '', null, null, '0', '2018-06-25 11:28:38', null, null, null, null, null);
INSERT INTO `cn_user` VALUES ('13', null, null, '18356087258', '', null, '18356087258', null, null, null, null, '', null, null, '0', '2018-06-25 11:38:47', null, null, null, null, null);
INSERT INTO `cn_user` VALUES ('14', null, null, '18133637706', '', null, '18133637706', null, null, null, null, '', null, null, '0', '2018-06-25 14:28:44', null, null, null, null, null);
INSERT INTO `cn_user` VALUES ('15', null, null, '18856001958', '', null, '18856001958', null, null, null, null, '', null, null, '0', '2018-06-25 14:41:13', null, null, null, null, null);
INSERT INTO `cn_user` VALUES ('16', null, null, '13956976379', '', null, '13956976379', null, null, null, null, '', null, null, '0', '2018-06-25 14:41:29', null, null, null, null, null);
INSERT INTO `cn_user` VALUES ('17', null, null, '13093381314', '', null, '13093381314', null, null, null, null, '', null, null, '0', '2018-06-25 14:41:35', null, null, null, null, null);
INSERT INTO `cn_user` VALUES ('18', null, null, '18956466130', '', null, '18956466130', null, null, null, null, '', null, null, '0', '2018-06-25 14:41:43', null, null, null, null, null);
INSERT INTO `cn_user` VALUES ('19', null, null, '18856980642', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', null, '', null, null, null, null, '', null, null, '0', '2018-06-25 14:43:00', null, null, null, null, null);
INSERT INTO `cn_user` VALUES ('20', null, null, '18214832895', '', null, '18214832895', null, null, null, null, '', null, null, '0', '2018-06-25 14:43:32', null, null, null, null, null);
INSERT INTO `cn_user` VALUES ('21', null, null, '15609685001', '', null, '15609685001', null, null, null, null, '', '0', null, '0', '2018-06-27 09:42:19', null, null, null, null, null);
INSERT INTO `cn_user` VALUES ('22', null, null, '18734804160', '', null, null, null, null, null, null, '', '0', null, '0', '2018-06-27 11:03:52', null, null, null, null, null);
INSERT INTO `cn_user` VALUES ('23', null, null, '13033087652', '', null, '13033087652', null, null, null, null, '', '0', null, '0', '2018-06-29 15:34:03', null, null, null, null, null);

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RenrenScheduler', 'TASK_2', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RenrenScheduler', 'TASK_3', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RenrenScheduler', 'TASK_4', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`) USING BTREE,
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`) USING BTREE,
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`) USING BTREE,
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', null, 'com.cnadmart.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000158BAF593307874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000017400047465737474000672656E72656E74000FE69C89E58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);
INSERT INTO `qrtz_job_details` VALUES ('RenrenScheduler', 'TASK_2', 'DEFAULT', null, 'com.cnadmart.modules.job.utils.ScheduleJob', '0', '0', '0', '1', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000158C377C4607874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000274000574657374327074000FE697A0E58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000017800);
INSERT INTO `qrtz_job_details` VALUES ('RenrenScheduler', 'TASK_3', 'DEFAULT', null, 'com.cnadmart.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000158BAF593307874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000037400047465737474000672656E72656E74000FE69C89E58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000017800);
INSERT INTO `qrtz_job_details` VALUES ('RenrenScheduler', 'TASK_4', 'DEFAULT', null, 'com.cnadmart.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000158C377C4607874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000474000574657374327074000FE697A0E58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000017800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RenrenScheduler', 'Wl-081530789101559', '1530789845557', '15000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`) USING BTREE,
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RenrenScheduler', 'TASK_2', 'DEFAULT', 'TASK_2', 'DEFAULT', null, '1524454200000', '-1', '5', 'PAUSED', 'CRON', '1524453910000', '0', null, '2', null);
INSERT INTO `qrtz_triggers` VALUES ('RenrenScheduler', 'TASK_3', 'DEFAULT', 'TASK_3', 'DEFAULT', null, '1526275800000', '-1', '5', 'PAUSED', 'CRON', '1526275341000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720031636F6D2E636E61646D6172742E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000158BAF593307874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000037400047465737474000672656E72656E74000FE69C89E58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000017800);
INSERT INTO `qrtz_triggers` VALUES ('RenrenScheduler', 'TASK_4', 'DEFAULT', 'TASK_4', 'DEFAULT', null, '1526275800000', '-1', '5', 'PAUSED', 'CRON', '1526275423000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720031636F6D2E636E61646D6172742E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000158C377C4607874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000474000574657374327074000FE697A0E58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000017800);

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='定时任务';

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
INSERT INTO `schedule_job` VALUES ('3', 'testTask', 'test', 'renren', '0 0/30 * * * ?', '1', '有参数测试', '2016-12-01 23:16:46');
INSERT INTO `schedule_job` VALUES ('4', 'testTask', 'test2', null, '0 0/30 * * * ?', '1', '无参数测试', '2016-12-03 14:55:56');

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='定时任务日志';

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------
INSERT INTO `schedule_job_log` VALUES ('1', '1', 'testTask', 'test', 'renren', '0', null, '1068', '2018-04-23 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('2', '1', 'testTask', 'test', 'renren', '0', null, '1053', '2018-04-23 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('3', '1', 'testTask', 'test', 'renren', '0', null, '1026', '2018-04-23 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('4', '1', 'testTask', 'test', 'renren', '0', null, '1018', '2018-04-23 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('5', '1', 'testTask', 'test', 'renren', '0', null, '1054', '2018-04-23 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('6', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-23 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('7', '1', 'testTask', 'test', 'renren', '0', null, '1093', '2018-04-23 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('8', '1', 'testTask', 'test', 'renren', '0', null, '1014', '2018-04-23 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('9', '1', 'testTask', 'test', 'renren', '0', null, '1026', '2018-04-23 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('10', '1', 'testTask', 'test', 'renren', '0', null, '1033', '2018-04-23 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('11', '1', 'testTask', 'test', 'renren', '0', null, '1227', '2018-04-23 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('12', '1', 'testTask', 'test', 'renren', '0', null, '1108', '2018-04-23 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('13', '1', 'testTask', 'test', 'renren', '0', null, '1054', '2018-04-24 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('14', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-24 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('15', '1', 'testTask', 'test', 'renren', '0', null, '1013', '2018-04-24 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('16', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-24 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('17', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2018-04-24 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('18', '1', 'testTask', 'test', 'renren', '0', null, '1028', '2018-04-24 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('19', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-24 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('20', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-24 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('21', '1', 'testTask', 'test', 'renren', '0', null, '1014', '2018-04-24 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('22', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-24 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('23', '1', 'testTask', 'test', 'renren', '0', null, '1051', '2018-04-25 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('24', '1', 'testTask', 'test', 'renren', '0', null, '1048', '2018-04-25 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('25', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-25 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('26', '1', 'testTask', 'test', 'renren', '0', null, '1080', '2018-04-25 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('27', '1', 'testTask', 'test', 'renren', '0', null, '1170', '2018-04-26 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('28', '1', 'testTask', 'test', 'renren', '0', null, '1018', '2018-04-26 16:30:00');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `param_key` (`param_key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='系统配置信息表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', 'CLOUD_STORAGE_CONFIG_KEY', '{\"type\":1,\"qiniuDomain\":\"http://img.test.com\",\"qiniuPrefix\":\"\",\"qiniuAccessKey\":\"test\",\"qiniuSecretKey\":\"bAE7MROdaMlz1qZZD3dlzEtj4SIiGYez66h8diMj\",\"qiniuBucketName\":\"img-cnadmart-com\",\"aliyunDomain\":\"\",\"aliyunPrefix\":\"\",\"aliyunEndPoint\":\"\",\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qcloudBucketName\":\"\"}', '0', '云存储配置信息');
INSERT INTO `sys_config` VALUES ('2', '3', '3', '1', '3');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级部门ID，一级部门为0',
  `name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='部门管理';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('1', '0', '寝室长', '0', '0');
INSERT INTO `sys_dept` VALUES ('2', '1', '628二哥', '1', '0');
INSERT INTO `sys_dept` VALUES ('3', '9', '628小四', '2', '0');
INSERT INTO `sys_dept` VALUES ('4', '3', '技术部', '0', '0');
INSERT INTO `sys_dept` VALUES ('5', '3', '销售部', '1', '0');
INSERT INTO `sys_dept` VALUES ('6', '0', null, '0', '-1');
INSERT INTO `sys_dept` VALUES ('7', '0', '444', '44', '-1');
INSERT INTO `sys_dept` VALUES ('8', '0', '628老大', '0', '0');
INSERT INTO `sys_dept` VALUES ('9', '8', '628老五', '0', '0');
INSERT INTO `sys_dept` VALUES ('10', '0', null, '0', '0');
INSERT INTO `sys_dept` VALUES ('11', '0', 'alert(\"xss\");', '0', '0');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '字典名称',
  `type` varchar(100) NOT NULL COMMENT '字典类型',
  `code` varchar(100) NOT NULL COMMENT '字典码',
  `value` varchar(1000) NOT NULL COMMENT '字典值',
  `order_num` int(11) DEFAULT '0' COMMENT '排序',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '删除标记  -1：已删除  0：正常',
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`,`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='数据字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('1', '性别', 'sex', '0', '女', '0', null, '0');
INSERT INTO `sys_dict` VALUES ('2', '性别', 'sex', '1', '男', '1', null, '0');
INSERT INTO `sys_dict` VALUES ('3', '性别', 'sex', '2', '未知', '3', null, '0');
INSERT INTO `sys_dict` VALUES ('4', '性别	', 'sex', '4', '人妖', '4', null, '0');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":41,\"parentId\":1,\"parentName\":\"系统管理\",\"name\":\"手机管理\",\"url\":\"modules/generator/tmobile.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '46', '127.0.0.1', '2018-04-23 11:27:48');
INSERT INTO `sys_log` VALUES ('2', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":41,\"parentId\":1,\"parentName\":\"系统管理\",\"name\":\"手机管理\",\"url\":\"modules/generator/mobile.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '35', '127.0.0.1', '2018-04-23 11:33:54');
INSERT INTO `sys_log` VALUES ('3', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '41', '8', '127.0.0.1', '2018-04-23 13:28:27');
INSERT INTO `sys_log` VALUES ('4', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '45', '65', '127.0.0.1', '2018-04-23 13:28:38');
INSERT INTO `sys_log` VALUES ('5', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '43', '39', '127.0.0.1', '2018-04-23 13:28:47');
INSERT INTO `sys_log` VALUES ('6', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '44', '44', '127.0.0.1', '2018-04-23 13:28:55');
INSERT INTO `sys_log` VALUES ('7', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '42', '29', '127.0.0.1', '2018-04-23 13:29:02');
INSERT INTO `sys_log` VALUES ('8', 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '41', '12', '127.0.0.1', '2018-04-23 13:29:20');
INSERT INTO `sys_log` VALUES ('9', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":46,\"parentId\":1,\"parentName\":\"系统管理\",\"name\":\"手机管理\",\"url\":\"modules/sys/mobile.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '25', '127.0.0.1', '2018-04-23 13:30:00');
INSERT INTO `sys_log` VALUES ('10', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":46,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"手机管理\",\"url\":\"modules/sys/mobile.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '11', '127.0.0.1', '2018-04-23 13:30:47');
INSERT INTO `sys_log` VALUES ('11', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":46,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"手机管理\",\"url\":\"modules/sys/mobile.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '13', '127.0.0.1', '2018-04-23 13:31:31');
INSERT INTO `sys_log` VALUES ('12', 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":51,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"手机管理\",\"type\":0,\"orderNum\":0}', '22', '127.0.0.1', '2018-04-23 13:32:56');
INSERT INTO `sys_log` VALUES ('13', 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":46,\"parentId\":51,\"parentName\":\"手机管理\",\"name\":\"手机管理\",\"url\":\"modules/sys/mobile.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '11', '127.0.0.1', '2018-04-23 13:33:29');
INSERT INTO `sys_log` VALUES ('14', 'admin', '保存配置', 'io.renren.modules.sys.controller.SysConfigController.save()', '{\"id\":2,\"paramKey\":\"3\",\"paramValue\":\"3\",\"remark\":\"3\"}', '94', '127.0.0.1', '2018-04-25 11:40:44');
INSERT INTO `sys_log` VALUES ('15', 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '{\"roleId\":1,\"roleName\":\"管理员角色\",\"deptId\":2,\"deptName\":\"长沙分公司\",\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26],\"deptIdList\":[],\"createTime\":\"May 14, 2018 4:33:20 PM\"}', '289', '0:0:0:0:0:0:0:1', '2018-05-14 16:33:20');
INSERT INTO `sys_log` VALUES ('16', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '{\"userId\":1,\"username\":\"admin\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"root@renren.io\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[1],\"createTime\":\"Nov 11, 2016 11:11:11 AM\",\"deptId\":1,\"deptName\":\"人人开源集团\"}', '131', '0:0:0:0:0:0:0:1', '2018-05-14 16:33:35');
INSERT INTO `sys_log` VALUES ('17', 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '{\"userId\":1,\"username\":\"admin\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"root@renren.io\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[1],\"createTime\":\"Nov 11, 2016 11:11:11 AM\",\"deptId\":1,\"deptName\":\"人人开源集团\"}', '53', '0:0:0:0:0:0:0:1', '2018-05-14 16:47:14');
INSERT INTO `sys_log` VALUES ('18', 'admin', '删除菜单', 'com.cnadmart.modules.sys.controller.SysMenuController.delete()', '51', '3', '0:0:0:0:0:0:0:1', '2018-05-26 09:21:16');
INSERT INTO `sys_log` VALUES ('19', 'admin', '删除菜单', 'com.cnadmart.modules.sys.controller.SysMenuController.delete()', '46', '2', '0:0:0:0:0:0:0:1', '2018-05-26 09:21:28');
INSERT INTO `sys_log` VALUES ('20', 'admin', '删除菜单', 'com.cnadmart.modules.sys.controller.SysMenuController.delete()', '51', '3', '0:0:0:0:0:0:0:1', '2018-05-26 09:21:35');
INSERT INTO `sys_log` VALUES ('21', 'admin', '删除菜单', 'com.cnadmart.modules.sys.controller.SysMenuController.delete()', '46', '4', '0:0:0:0:0:0:0:1', '2018-05-26 09:21:42');
INSERT INTO `sys_log` VALUES ('22', 'admin', '删除菜单', 'com.cnadmart.modules.sys.controller.SysMenuController.delete()', '46', '2', '0:0:0:0:0:0:0:1', '2018-05-26 09:21:55');
INSERT INTO `sys_log` VALUES ('23', 'admin', '删除菜单', 'com.cnadmart.modules.sys.controller.SysMenuController.delete()', '50', '62', '0:0:0:0:0:0:0:1', '2018-05-26 09:22:06');
INSERT INTO `sys_log` VALUES ('24', 'admin', '删除菜单', 'com.cnadmart.modules.sys.controller.SysMenuController.delete()', '47', '10', '0:0:0:0:0:0:0:1', '2018-05-26 09:22:20');
INSERT INTO `sys_log` VALUES ('25', 'admin', '删除菜单', 'com.cnadmart.modules.sys.controller.SysMenuController.delete()', '48', '18', '0:0:0:0:0:0:0:1', '2018-05-26 09:22:28');
INSERT INTO `sys_log` VALUES ('26', 'admin', '删除菜单', 'com.cnadmart.modules.sys.controller.SysMenuController.delete()', '49', '10', '0:0:0:0:0:0:0:1', '2018-05-26 09:22:59');
INSERT INTO `sys_log` VALUES ('27', 'admin', '删除菜单', 'com.cnadmart.modules.sys.controller.SysMenuController.delete()', '46', '8', '0:0:0:0:0:0:0:1', '2018-05-26 09:23:04');
INSERT INTO `sys_log` VALUES ('28', 'admin', '删除菜单', 'com.cnadmart.modules.sys.controller.SysMenuController.delete()', '51', '8', '0:0:0:0:0:0:0:1', '2018-05-26 09:23:09');
INSERT INTO `sys_log` VALUES ('29', 'admin', '保存菜单', 'com.cnadmart.modules.sys.controller.SysMenuController.save()', '{\"menuId\":62,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"商品管理\",\"type\":0,\"orderNum\":0}', '103', '127.0.0.1', '2018-05-29 08:59:09');
INSERT INTO `sys_log` VALUES ('30', 'admin', '修改菜单', 'com.cnadmart.modules.sys.controller.SysMenuController.update()', '{\"menuId\":57,\"parentId\":62,\"parentName\":\"商品管理\",\"name\":\"频道管理\",\"url\":\"modules/good/channel.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":1}', '109', '127.0.0.1', '2018-05-29 08:59:41');
INSERT INTO `sys_log` VALUES ('31', 'admin', '修改菜单', 'com.cnadmart.modules.sys.controller.SysMenuController.update()', '{\"menuId\":52,\"parentId\":62,\"parentName\":\"商品管理\",\"name\":\"分类管理\",\"url\":\"modules/good/category.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":2}', '98', '127.0.0.1', '2018-05-29 09:00:20');
INSERT INTO `sys_log` VALUES ('32', 'admin', '保存菜单', 'com.cnadmart.modules.sys.controller.SysMenuController.save()', '{\"menuId\":63,\"parentId\":62,\"parentName\":\"商品管理\",\"name\":\"商品发布\",\"url\":\"modules/good/good.html\",\"type\":1,\"orderNum\":0}', '168', '127.0.0.1', '2018-05-31 11:27:20');
INSERT INTO `sys_log` VALUES ('33', 'admin', '修改菜单', 'com.cnadmart.modules.sys.controller.SysMenuController.update()', '{\"menuId\":63,\"parentId\":62,\"parentName\":\"商品管理\",\"name\":\"商品发布\",\"url\":\"modules/good/good.html\",\"perms\":\"good:good:list\",\"type\":1,\"orderNum\":0}', '129', '127.0.0.1', '2018-05-31 11:28:46');
INSERT INTO `sys_log` VALUES ('34', 'admin', '修改菜单', 'com.cnadmart.modules.sys.controller.SysMenuController.update()', '{\"menuId\":63,\"parentId\":62,\"parentName\":\"商品管理\",\"name\":\"商品发布\",\"url\":\"modules/good/good.html\",\"perms\":\"good:good:list,good:good:info,good:good:save,good:good:update,good:good:delete\",\"type\":1,\"orderNum\":0}', '118', '127.0.0.1', '2018-05-31 11:35:19');
INSERT INTO `sys_log` VALUES ('35', 'admin', '保存菜单', 'com.cnadmart.modules.sys.controller.SysMenuController.save()', '{\"menuId\":64,\"parentId\":62,\"parentName\":\"商品管理\",\"name\":\"商品规格\",\"url\":\"modules/good/categoryspec.html\",\"perms\":\"good:categoryspec:list,good:categoryspec:info,good:categoryspec:save,good:categoryspec:update,good:categoryspec:delete\",\"type\":1,\"orderNum\":0}', '120', '127.0.0.1', '2018-05-31 18:37:32');
INSERT INTO `sys_log` VALUES ('36', 'admin', '保存菜单', 'com.cnadmart.modules.sys.controller.SysMenuController.save()', '{\"menuId\":65,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"test\",\"url\":\"test\",\"type\":1,\"orderNum\":0}', '111', '0:0:0:0:0:0:0:1', '2018-06-01 18:09:00');
INSERT INTO `sys_log` VALUES ('37', 'admin', '保存菜单', 'com.cnadmart.modules.sys.controller.SysMenuController.save()', '{\"menuId\":66,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"test2\",\"url\":\"test\",\"type\":1,\"orderNum\":0}', '103', '0:0:0:0:0:0:0:1', '2018-06-01 18:19:48');
INSERT INTO `sys_log` VALUES ('38', 'admin', '保存菜单', 'com.cnadmart.modules.sys.controller.SysMenuController.save()', '{\"menuId\":67,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"订单管理\",\"url\":\"/order\",\"type\":1,\"orderNum\":0}', '93', '0:0:0:0:0:0:0:1', '2018-06-01 18:22:13');
INSERT INTO `sys_log` VALUES ('39', 'admin', '删除菜单', 'com.cnadmart.modules.sys.controller.SysMenuController.delete()', '65', '149', '0:0:0:0:0:0:0:1', '2018-06-01 18:22:22');
INSERT INTO `sys_log` VALUES ('40', 'admin', '删除菜单', 'com.cnadmart.modules.sys.controller.SysMenuController.delete()', '66', '132', '0:0:0:0:0:0:0:1', '2018-06-01 18:22:27');
INSERT INTO `sys_log` VALUES ('41', 'admin', '修改角色', 'com.cnadmart.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"管理员角色\",\"deptId\":2,\"deptName\":\"长沙分公司\",\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,67],\"deptIdList\":[],\"createTime\":\"May 14, 2018 4:33:20 PM\"}', '527', '0:0:0:0:0:0:0:1', '2018-06-01 18:23:01');
INSERT INTO `sys_log` VALUES ('42', 'admin', '删除菜单', 'com.cnadmart.modules.sys.controller.SysMenuController.delete()', '67', '146', '0:0:0:0:0:0:0:1', '2018-06-01 18:23:40');
INSERT INTO `sys_log` VALUES ('43', 'admin', '保存菜单', 'com.cnadmart.modules.sys.controller.SysMenuController.save()', '{\"menuId\":68,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"订单管理\",\"type\":0,\"orderNum\":0}', '94', '0:0:0:0:0:0:0:1', '2018-06-01 18:23:57');
INSERT INTO `sys_log` VALUES ('44', 'admin', '删除菜单', 'com.cnadmart.modules.sys.controller.SysMenuController.delete()', '68', '143', '0:0:0:0:0:0:0:1', '2018-06-01 18:24:20');
INSERT INTO `sys_log` VALUES ('45', 'admin', '保存菜单', 'com.cnadmart.modules.sys.controller.SysMenuController.save()', '{\"menuId\":69,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"订单管理\",\"url\":\"modules/order/order.html\",\"type\":1,\"orderNum\":0}', '95', '0:0:0:0:0:0:0:1', '2018-06-01 18:26:32');
INSERT INTO `sys_log` VALUES ('46', 'admin', '修改角色', 'com.cnadmart.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"管理员角色\",\"deptId\":1,\"deptName\":\"人人开源集团\",\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,69],\"deptIdList\":[],\"createTime\":\"May 14, 2018 4:33:20 PM\"}', '411', '0:0:0:0:0:0:0:1', '2018-06-01 18:29:01');
INSERT INTO `sys_log` VALUES ('47', 'admin', '删除菜单', 'com.cnadmart.modules.sys.controller.SysMenuController.delete()', '69', '137', '0:0:0:0:0:0:0:1', '2018-06-01 18:29:49');
INSERT INTO `sys_log` VALUES ('48', 'admin', '保存菜单', 'com.cnadmart.modules.sys.controller.SysMenuController.save()', '{\"menuId\":70,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"订单管理\",\"type\":0,\"orderNum\":3}', '90', '0:0:0:0:0:0:0:1', '2018-06-01 18:30:12');
INSERT INTO `sys_log` VALUES ('49', 'admin', '保存菜单', 'com.cnadmart.modules.sys.controller.SysMenuController.save()', '{\"menuId\":71,\"parentId\":70,\"parentName\":\"订单管理\",\"name\":\"订单列表\",\"url\":\"modules/order/orderList.html\",\"type\":1,\"orderNum\":0}', '114', '0:0:0:0:0:0:0:1', '2018-06-01 18:45:17');
INSERT INTO `sys_log` VALUES ('50', 'admin', '保存菜单', 'com.cnadmart.modules.sys.controller.SysMenuController.save()', '{\"menuId\":72,\"parentId\":70,\"parentName\":\"订单管理\",\"name\":\"订单查询\",\"url\":\"modules/order/orderSelect.html\",\"type\":1,\"orderNum\":0}', '107', '0:0:0:0:0:0:0:1', '2018-06-05 17:08:08');
INSERT INTO `sys_log` VALUES ('51', 'admin', '保存菜单', 'com.cnadmart.modules.sys.controller.SysMenuController.save()', '{\"menuId\":73,\"parentId\":70,\"parentName\":\"订单管理\",\"name\":\"我的订单\",\"url\":\"modules/order/myOrder.html\",\"type\":1,\"orderNum\":0}', '329', '0:0:0:0:0:0:0:1', '2018-06-05 17:14:05');
INSERT INTO `sys_log` VALUES ('52', 'admin', '修改菜单', 'com.cnadmart.modules.sys.controller.SysMenuController.update()', '{\"menuId\":73,\"parentId\":70,\"parentName\":\"订单管理\",\"name\":\"我的订单\",\"url\":\"modules/order/myOrderList.html\",\"type\":1,\"orderNum\":0}', '121', '0:0:0:0:0:0:0:1', '2018-06-06 11:26:01');
INSERT INTO `sys_log` VALUES ('53', 'admin', '修改菜单', 'com.cnadmart.modules.sys.controller.SysMenuController.update()', '{\"menuId\":73,\"parentId\":70,\"parentName\":\"订单管理\",\"name\":\"我的订单\",\"url\":\"modules/order/myOrderList.html\",\"type\":1,\"orderNum\":0}', '113', '0:0:0:0:0:0:0:1', '2018-06-06 11:26:01');
INSERT INTO `sys_log` VALUES ('54', 'admin', '修改菜单', 'com.cnadmart.modules.sys.controller.SysMenuController.update()', '{\"menuId\":72,\"parentId\":70,\"parentName\":\"订单管理\",\"name\":\"订单发货\",\"url\":\"modules/order/orderSelect.html\",\"type\":1,\"orderNum\":0}', '124', '0:0:0:0:0:0:0:1', '2018-06-06 11:28:06');
INSERT INTO `sys_log` VALUES ('55', 'admin', '保存菜单', 'com.cnadmart.modules.sys.controller.SysMenuController.save()', '{\"menuId\":74,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"快递公司管理\",\"url\":\"modules/expressCompany/expresscompany.html\",\"type\":1,\"orderNum\":0}', '111', '0:0:0:0:0:0:0:1', '2018-06-06 13:13:48');
INSERT INTO `sys_log` VALUES ('56', 'admin', '修改角色', 'com.cnadmart.modules.sys.controller.SysRoleController.update()', '{\"roleId\":1,\"roleName\":\"管理员角色\",\"deptId\":1,\"deptName\":\"人人开源集团\",\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,70,71,72,73,74],\"deptIdList\":[],\"createTime\":\"May 14, 2018 4:33:20 PM\"}', '611', '0:0:0:0:0:0:0:1', '2018-06-06 13:15:39');
INSERT INTO `sys_log` VALUES ('57', 'admin', '修改菜单', 'com.cnadmart.modules.sys.controller.SysMenuController.update()', '{\"menuId\":74,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"快递公司管理\",\"url\":\"modules/expressCompany/expresscompany.html\",\"type\":0,\"orderNum\":0}', '91', '0:0:0:0:0:0:0:1', '2018-06-06 13:18:14');
INSERT INTO `sys_log` VALUES ('58', 'admin', '修改菜单', 'com.cnadmart.modules.sys.controller.SysMenuController.update()', '{\"menuId\":74,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"快递公司管理\",\"url\":\"modules/expressCompany/expresscompany.html\",\"type\":0,\"orderNum\":0}', '87', '0:0:0:0:0:0:0:1', '2018-06-06 13:18:14');
INSERT INTO `sys_log` VALUES ('59', 'admin', '修改菜单', 'com.cnadmart.modules.sys.controller.SysMenuController.update()', '{\"menuId\":74,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"快递公司管理\",\"url\":\"modules/expressCompany/expresscompany.html\",\"type\":0,\"orderNum\":4}', '84', '0:0:0:0:0:0:0:1', '2018-06-06 13:19:07');
INSERT INTO `sys_log` VALUES ('60', 'admin', '保存菜单', 'com.cnadmart.modules.sys.controller.SysMenuController.save()', '{\"menuId\":75,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"快递公司列表\",\"url\":\"modules/expressCompany/expresscompany\",\"type\":1,\"orderNum\":0}', '88', '0:0:0:0:0:0:0:1', '2018-06-06 13:20:11');
INSERT INTO `sys_log` VALUES ('61', 'admin', '删除菜单', 'com.cnadmart.modules.sys.controller.SysMenuController.delete()', '75', '137', '0:0:0:0:0:0:0:1', '2018-06-06 13:20:21');
INSERT INTO `sys_log` VALUES ('62', 'admin', '保存菜单', 'com.cnadmart.modules.sys.controller.SysMenuController.save()', '{\"menuId\":76,\"parentId\":74,\"parentName\":\"快递公司管理\",\"name\":\"快递公司列表\",\"url\":\"modules/expressCompany/expresscompany.html\",\"type\":1,\"orderNum\":0}', '102', '0:0:0:0:0:0:0:1', '2018-06-06 13:21:05');
INSERT INTO `sys_log` VALUES ('63', 'admin', '修改菜单', 'com.cnadmart.modules.sys.controller.SysMenuController.update()', '{\"menuId\":76,\"parentId\":74,\"parentName\":\"快递公司管理\",\"name\":\"快递公司列表\",\"url\":\"modules/expressCompany/expresscompany.html\",\"perms\":\"expressCompany:expresscompany:save,expressCompany:expresscompany:update,expressCompany:expresscompany:delete,expressCompany:expresscompany:list\",\"type\":1,\"orderNum\":0}', '113', '0:0:0:0:0:0:0:1', '2018-06-06 13:26:37');
INSERT INTO `sys_log` VALUES ('64', 'admin', '保存角色', 'com.cnadmart.modules.sys.controller.SysRoleController.save()', '{\"roleId\":2,\"roleName\":\"加盟商\",\"deptId\":8,\"deptName\":\"加盟商\",\"menuIdList\":[70,72,73],\"deptIdList\":[],\"createTime\":\"Jun 7, 2018 4:29:40 PM\"}', '260', '192.168.1.196', '2018-06-07 16:29:41');
INSERT INTO `sys_log` VALUES ('65', 'admin', '保存用户', 'com.cnadmart.modules.sys.controller.SysUserController.save()', '{\"userId\":2,\"username\":\"fuyang\",\"password\":\"2ba789379d577b4c649e8419393acd85124ab8da1ff8163e76848f34b37f7c48\",\"salt\":\"mTN50NIevjz53gIMUuf7\",\"email\":\"111@111.com\",\"mobile\":\"1300001\",\"status\":1,\"roleIdList\":[2],\"createTime\":\"Jun 7, 2018 4:31:26 PM\",\"deptId\":9,\"deptName\":\"阜阳加盟商\"}', '324', '192.168.1.196', '2018-06-07 16:31:27');
INSERT INTO `sys_log` VALUES ('66', 'admin', '修改用户', 'com.cnadmart.modules.sys.controller.SysUserController.update()', '{\"userId\":1,\"username\":\"admin\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"root@cnadmart.com\",\"mobile\":\"136000000\",\"status\":1,\"roleIdList\":[1],\"createTime\":\"Nov 11, 2016 11:11:11 AM\",\"deptId\":1,\"deptName\":\"广品会集团\"}', '218', '192.168.1.196', '2018-06-07 16:31:54');
INSERT INTO `sys_log` VALUES ('67', 'admin', '修改用户', 'com.freeter.modules.sys.controller.SysUserController.update()', '{\"userId\":1,\"username\":\"admin\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"root@freeter.com\",\"mobile\":\"136000000\",\"status\":1,\"roleIdList\":[1],\"createTime\":\"Nov 11, 2016 11:11:11 AM\",\"deptId\":1,\"deptName\":\"寝室长\"}', '960', '127.0.0.1', '2018-06-22 22:04:14');
INSERT INTO `sys_log` VALUES ('68', 'admin', '修改用户', 'com.freeter.modules.sys.controller.SysUserController.update()', '{\"userId\":1,\"username\":\"admin\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"root@freeter.com\",\"mobile\":\"136000000\",\"status\":1,\"roleIdList\":[1],\"createTime\":\"Nov 11, 2016 11:11:11 AM\",\"deptId\":5,\"deptName\":\"销售部\"}', '126', '119.123.204.210', '2018-06-27 02:56:22');
INSERT INTO `sys_log` VALUES ('69', 'admin', '修改用户', 'com.freeter.modules.sys.controller.SysUserController.update()', '{\"userId\":1,\"username\":\"admin\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"root@freeter.com\",\"mobile\":\"136000000\",\"status\":1,\"roleIdList\":[1],\"createTime\":\"Nov 11, 2016 11:11:11 AM\",\"deptId\":5,\"deptName\":\"销售部\"}', '77', '117.136.81.191', '2018-06-27 09:11:13');
INSERT INTO `sys_log` VALUES ('70', 'admin', '保存菜单', 'com.freeter.modules.sys.controller.SysMenuController.save()', '{\"menuId\":77,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"测试\",\"type\":0,\"orderNum\":0}', '308', '0:0:0:0:0:0:0:1', '2018-06-28 15:59:00');
INSERT INTO `sys_log` VALUES ('71', 'admin', '修改菜单', 'com.freeter.modules.sys.controller.SysMenuController.update()', '{\"menuId\":5,\"parentId\":1,\"parentName\":\"系统管理\",\"name\":\"SQL监控\",\"url\":\"druid/sql.html\",\"type\":1,\"icon\":\"fa fa-bug\",\"orderNum\":4}', '156', '127.0.0.1', '2018-06-29 11:29:38');
INSERT INTO `sys_log` VALUES ('72', 'admin', '修改菜单', 'com.freeter.modules.sys.controller.SysMenuController.update()', '{\"menuId\":5,\"parentId\":1,\"parentName\":\"系统管理\",\"name\":\"SQL监控\",\"url\":\"druid/sql.html\",\"type\":1,\"icon\":\"fa fa-bug\",\"orderNum\":4}', '2', '127.0.0.1', '2018-06-29 11:30:08');
INSERT INTO `sys_log` VALUES ('73', 'admin', '修改菜单', 'com.freeter.modules.sys.controller.SysMenuController.update()', '{\"menuId\":5,\"parentId\":1,\"parentName\":\"系统管理\",\"name\":\"SQL监控\",\"url\":\"druid/sql.html\",\"type\":1,\"icon\":\"fa fa-bug\",\"orderNum\":4}', '1', '127.0.0.1', '2018-06-29 11:31:12');
INSERT INTO `sys_log` VALUES ('74', 'admin', '修改菜单', 'com.freeter.modules.sys.controller.SysMenuController.update()', '{\"menuId\":5,\"parentId\":1,\"parentName\":\"系统管理\",\"name\":\"SQL监控\",\"url\":\"druid/sql.html\",\"type\":1,\"icon\":\"fa fa-bug\",\"orderNum\":4}', '2', '127.0.0.1', '2018-06-29 11:34:49');
INSERT INTO `sys_log` VALUES ('75', 'admin', '修改菜单', 'com.freeter.modules.sys.controller.SysMenuController.update()', '{\"menuId\":5,\"parentId\":1,\"parentName\":\"系统管理\",\"name\":\"SQL监控\",\"url\":\"druid/sql.html\",\"type\":1,\"icon\":\"fa fa-bug\",\"orderNum\":4}', '2', '127.0.0.1', '2018-06-29 11:35:46');
INSERT INTO `sys_log` VALUES ('76', 'admin', '修改菜单', 'com.freeter.modules.sys.controller.SysMenuController.update()', '{\"menuId\":78,\"parentId\":1,\"parentName\":\"系统管理\",\"name\":\"用户管理\",\"url\":\"modules/user/user.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '275', '127.0.0.1', '2018-06-30 13:49:31');
INSERT INTO `sys_log` VALUES ('77', 'admin', '保存菜单', 'com.freeter.modules.sys.controller.SysMenuController.save()', '{\"menuId\":83,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"会员管理\",\"type\":0,\"orderNum\":0}', '199', '127.0.0.1', '2018-06-30 13:49:43');
INSERT INTO `sys_log` VALUES ('78', 'admin', '修改菜单', 'com.freeter.modules.sys.controller.SysMenuController.update()', '{\"menuId\":78,\"parentId\":83,\"parentName\":\"会员管理\",\"name\":\"用户管理\",\"url\":\"modules/user/user.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '216', '127.0.0.1', '2018-06-30 13:50:08');
INSERT INTO `sys_log` VALUES ('79', 'admin', '保存用户', 'com.freeter.modules.sys.controller.SysUserController.save()', '{\"userId\":3,\"username\":\"aaa\",\"password\":\"802e9ec3eff8d4d2cc7d0ea810e67105d6bef0b67cf667cccf8a7b78aa564a42\",\"salt\":\"OrAy275H8yGALsHJwjwV\",\"email\":\"123456789@qq.com\",\"mobile\":\"18539978699\",\"status\":1,\"roleIdList\":[2],\"createTime\":\"Jul 3, 2018 5:04:16 PM\",\"deptId\":2,\"deptName\":\"628二哥\"}', '610', '0:0:0:0:0:0:0:1', '2018-07-03 17:04:17');
INSERT INTO `sys_log` VALUES ('80', 'admin', '删除用户', 'com.freeter.modules.sys.controller.SysUserController.delete()', '[3]', '424', '0:0:0:0:0:0:0:1', '2018-07-03 17:05:41');
INSERT INTO `sys_log` VALUES ('81', 'admin', '修改配置', 'com.freeter.modules.sys.controller.SysConfigController.update()', '{\"id\":2,\"paramKey\":\"3\",\"paramValue\":\"3\",\"remark\":\"3\"}', '58', '1.85.5.75', '2018-07-04 19:04:26');
INSERT INTO `sys_log` VALUES ('82', 'admin', '修改用户', 'com.freeter.modules.sys.controller.SysUserController.update()', '{\"userId\":1,\"username\":\"admin\",\"password\":\"c72dc7260d7829cb72221fddfb5a75c4cf1475979e2efb781409ef11a49afdb7\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"root@freeter.com\",\"mobile\":\"136000000\",\"status\":1,\"roleIdList\":[1],\"createTime\":\"Nov 11, 2016 11:11:11 AM\",\"deptId\":5,\"deptName\":\"销售部\"}', '117', '110.185.11.30', '2018-07-05 12:17:47');
INSERT INTO `sys_log` VALUES ('83', 'admin', '修改密码', 'com.freeter.modules.sys.controller.SysUserController.password()', '\"admin\"', '33', '222.249.170.85', '2018-07-05 14:45:50');
INSERT INTO `sys_log` VALUES ('84', 'admin', '删除菜单', 'com.freeter.modules.sys.controller.SysMenuController.delete()', '77', '1', '14.221.165.92', '2018-07-05 15:40:50');
INSERT INTO `sys_log` VALUES ('85', 'admin', '删除菜单', 'com.freeter.modules.sys.controller.SysMenuController.delete()', '77', '1', '14.221.165.92', '2018-07-05 15:40:51');
INSERT INTO `sys_log` VALUES ('86', 'admin', '删除菜单', 'com.freeter.modules.sys.controller.SysMenuController.delete()', '77', '0', '14.221.165.92', '2018-07-05 15:40:52');
INSERT INTO `sys_log` VALUES ('87', 'admin', '删除菜单', 'com.freeter.modules.sys.controller.SysMenuController.delete()', '77', '0', '14.221.165.92', '2018-07-05 15:40:52');
INSERT INTO `sys_log` VALUES ('88', 'admin', '删除菜单', 'com.freeter.modules.sys.controller.SysMenuController.delete()', '77', '0', '14.221.165.92', '2018-07-05 15:40:52');
INSERT INTO `sys_log` VALUES ('89', 'admin', '删除菜单', 'com.freeter.modules.sys.controller.SysMenuController.delete()', '77', '0', '14.221.165.92', '2018-07-05 15:41:05');
INSERT INTO `sys_log` VALUES ('90', 'admin', '删除菜单', 'com.freeter.modules.sys.controller.SysMenuController.delete()', '77', '0', '14.221.165.92', '2018-07-05 15:41:06');
INSERT INTO `sys_log` VALUES ('91', 'admin', '删除菜单', 'com.freeter.modules.sys.controller.SysMenuController.delete()', '77', '0', '14.221.165.92', '2018-07-05 15:41:06');
INSERT INTO `sys_log` VALUES ('92', 'admin', '删除菜单', 'com.freeter.modules.sys.controller.SysMenuController.delete()', '77', '0', '14.221.165.92', '2018-07-05 15:41:06');
INSERT INTO `sys_log` VALUES ('93', 'admin', '删除菜单', 'com.freeter.modules.sys.controller.SysMenuController.delete()', '77', '0', '14.221.165.92', '2018-07-05 15:41:06');
INSERT INTO `sys_log` VALUES ('94', 'admin', '删除菜单', 'com.freeter.modules.sys.controller.SysMenuController.delete()', '77', '0', '14.221.165.92', '2018-07-05 15:41:06');
INSERT INTO `sys_log` VALUES ('95', 'admin', '修改密码', 'com.freeter.modules.sys.controller.SysUserController.password()', '\"admin\"', '22', '123.116.246.68', '2018-07-05 15:43:08');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '系统管理', null, null, '0', 'fa fa-cog', '0');
INSERT INTO `sys_menu` VALUES ('2', '1', '管理员管理', 'modules/sys/user.html', null, '1', 'fa fa-user', '1');
INSERT INTO `sys_menu` VALUES ('3', '1', '角色管理', 'modules/sys/role.html', null, '1', 'fa fa-user-secret', '2');
INSERT INTO `sys_menu` VALUES ('4', '1', '菜单管理', 'modules/sys/menu.html', null, '1', 'fa fa-th-list', '3');
INSERT INTO `sys_menu` VALUES ('5', '1', 'SQL监控', 'druid/sql.html', null, '1', 'fa fa-bug', '4');
INSERT INTO `sys_menu` VALUES ('6', '1', '定时任务', 'modules/job/schedule.html', null, '1', 'fa fa-tasks', '5');
INSERT INTO `sys_menu` VALUES ('7', '6', '查看', null, 'sys:schedule:list,sys:schedule:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('8', '6', '新增', null, 'sys:schedule:save', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('9', '6', '修改', null, 'sys:schedule:update', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('10', '6', '删除', null, 'sys:schedule:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('11', '6', '暂停', null, 'sys:schedule:pause', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('12', '6', '恢复', null, 'sys:schedule:resume', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('13', '6', '立即执行', null, 'sys:schedule:run', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('14', '6', '日志列表', null, 'sys:schedule:log', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('15', '2', '查看', null, 'sys:user:list,sys:user:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('16', '2', '新增', null, 'sys:user:save,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('17', '2', '修改', null, 'sys:user:update,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('18', '2', '删除', null, 'sys:user:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('19', '3', '查看', null, 'sys:role:list,sys:role:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('20', '3', '新增', null, 'sys:role:save,sys:menu:perms', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('21', '3', '修改', null, 'sys:role:update,sys:menu:perms', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('22', '3', '删除', null, 'sys:role:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('23', '4', '查看', null, 'sys:menu:list,sys:menu:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('24', '4', '新增', null, 'sys:menu:save,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('25', '4', '修改', null, 'sys:menu:update,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('26', '4', '删除', null, 'sys:menu:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('27', '1', '参数管理', 'modules/sys/config.html', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', '1', 'fa fa-sun-o', '6');
INSERT INTO `sys_menu` VALUES ('29', '1', '系统日志', 'modules/sys/log.html', 'sys:log:list', '1', 'fa fa-file-text-o', '7');
INSERT INTO `sys_menu` VALUES ('30', '1', '文件上传', 'modules/oss/oss.html', 'sys:oss:all', '1', 'fa fa-file-image-o', '6');
INSERT INTO `sys_menu` VALUES ('31', '1', '部门管理', 'modules/sys/dept.html', null, '1', 'fa fa-file-code-o', '1');
INSERT INTO `sys_menu` VALUES ('32', '31', '查看', null, 'sys:dept:list,sys:dept:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('33', '31', '新增', null, 'sys:dept:save,sys:dept:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('34', '31', '修改', null, 'sys:dept:update,sys:dept:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('35', '31', '删除', null, 'sys:dept:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('36', '1', '字典管理', 'modules/sys/dict.html', null, '1', 'fa fa-bookmark-o', '6');
INSERT INTO `sys_menu` VALUES ('37', '36', '查看', null, 'sys:dict:list,sys:dict:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('38', '36', '新增', null, 'sys:dict:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('39', '36', '修改', null, 'sys:dict:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('40', '36', '删除', null, 'sys:dict:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('52', '62', '分类管理', 'modules/good/category.html', null, '1', 'fa fa-file-code-o', '2');
INSERT INTO `sys_menu` VALUES ('53', '52', '查看', null, 'good:category:list,good:category:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('54', '52', '新增', null, 'good:category:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('55', '52', '修改', null, 'good:category:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('56', '52', '删除', null, 'good:category:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('57', '62', '频道管理', 'modules/good/channel.html', null, '1', 'fa fa-file-code-o', '1');
INSERT INTO `sys_menu` VALUES ('58', '57', '查看', null, 'good:channel:list,good:channel:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('59', '57', '新增', null, 'good:channel:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('60', '57', '修改', null, 'good:channel:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('61', '57', '删除', null, 'good:channel:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('62', '0', '商品管理', null, null, '0', null, '0');
INSERT INTO `sys_menu` VALUES ('63', '62', '商品发布', 'modules/good/good.html', 'good:good:list,good:good:info,good:good:save,good:good:update,good:good:delete', '1', null, '0');
INSERT INTO `sys_menu` VALUES ('64', '62', '商品规格', 'modules/good/categoryspec.html', 'good:categoryspec:list,good:categoryspec:info,good:categoryspec:save,good:categoryspec:update,good:categoryspec:delete', '1', null, '0');
INSERT INTO `sys_menu` VALUES ('70', '0', '订单管理', null, null, '0', null, '3');
INSERT INTO `sys_menu` VALUES ('71', '70', '订单列表', 'modules/order/orderList.html', null, '1', null, '0');
INSERT INTO `sys_menu` VALUES ('72', '70', '订单发货', 'modules/order/orderSelect.html', null, '1', null, '0');
INSERT INTO `sys_menu` VALUES ('73', '70', '我的订单', 'modules/order/myOrderList.html', null, '1', null, '0');
INSERT INTO `sys_menu` VALUES ('74', '0', '快递公司管理', 'modules/expressCompany/expresscompany.html', null, '0', null, '4');
INSERT INTO `sys_menu` VALUES ('76', '74', '快递公司列表', 'modules/expressCompany/expresscompany.html', 'expressCompany:expresscompany:save,expressCompany:expresscompany:update,expressCompany:expresscompany:delete,expressCompany:expresscompany:list', '1', null, '0');
INSERT INTO `sys_menu` VALUES ('77', '0', '测试', null, null, '0', null, '0');
INSERT INTO `sys_menu` VALUES ('78', '83', '用户管理', 'modules/user/user.html', null, '1', 'fa fa-file-code-o', '6');
INSERT INTO `sys_menu` VALUES ('79', '78', '查看', null, 'user:user:list,user:user:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('80', '78', '新增', null, 'user:user:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('81', '78', '修改', null, 'user:user:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('82', '78', '删除', null, 'user:user:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('83', '0', '会员管理', null, null, '0', null, '0');

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COMMENT='文件上传';

-- ----------------------------
-- Records of sys_oss
-- ----------------------------
INSERT INTO `sys_oss` VALUES ('4', 'http://img.cnadmart.com/20180605/f49f6d5cadd242568b4342ba7daa38c5.jpg', '2018-06-05 11:12:45');
INSERT INTO `sys_oss` VALUES ('5', 'http://img.cnadmart.com/20180605/69f428161f4e4230b2db8f3b82c1c4ab.jpg', '2018-06-05 11:13:46');
INSERT INTO `sys_oss` VALUES ('6', 'http://img.cnadmart.com/20180605/cb37514906b447f3bd624eef495712e6.png', '2018-06-05 11:21:35');
INSERT INTO `sys_oss` VALUES ('7', 'http://img.cnadmart.com/20180605/5e11fdd394bb4cabb8d2e801dbd83392.png', '2018-06-05 11:23:56');
INSERT INTO `sys_oss` VALUES ('8', 'http://img.cnadmart.com/20180605/b898e0d3be854dfa8123d3e1a742b3f0.png', '2018-06-05 11:24:25');
INSERT INTO `sys_oss` VALUES ('9', 'http://img.cnadmart.com/20180605/cf57929da23c441e92f4fe6dc7dc8a6c.png', '2018-06-05 11:24:52');
INSERT INTO `sys_oss` VALUES ('10', 'http://img.cnadmart.com/20180605/adfb58d3765745bd897a57200b7256b2.png', '2018-06-05 11:25:10');
INSERT INTO `sys_oss` VALUES ('11', 'http://img.cnadmart.com/20180605/a02ac0cf95444cb2b0f8ddc11e17758f.jpg', '2018-06-05 11:30:50');
INSERT INTO `sys_oss` VALUES ('12', 'http://img.cnadmart.com/20180605/dee36d3f398b45ac9678887e32f4b12a.png', '2018-06-05 11:31:02');
INSERT INTO `sys_oss` VALUES ('13', 'http://img.cnadmart.com/20180605/25b4506d608c4f0eb76e9043d226c1d5.png', '2018-06-05 11:31:10');
INSERT INTO `sys_oss` VALUES ('14', 'http://img.cnadmart.com/20180605/2ecbe903b4ce4eed97c507dce21d9bd0.png', '2018-06-05 11:32:31');
INSERT INTO `sys_oss` VALUES ('15', 'http://img.cnadmart.com/20180605/6c92d0fcfeae43df9b4c1925d30e3f80.png', '2018-06-05 11:34:12');
INSERT INTO `sys_oss` VALUES ('16', 'http://img.cnadmart.com/20180605/53ec3dad38c340a0ac973c7cd6480e15.png', '2018-06-05 11:34:37');
INSERT INTO `sys_oss` VALUES ('17', 'http://img.cnadmart.com/20180605/abb5aab73a41473fa3a18fcbb0d63cd6.png', '2018-06-05 11:36:22');
INSERT INTO `sys_oss` VALUES ('18', 'http://img.cnadmart.com/20180605/efdacdca39244d41b2f0e6cc7005c4f4.png', '2018-06-05 11:37:59');
INSERT INTO `sys_oss` VALUES ('19', 'http://img.cnadmart.com/20180605/3a4a96fa3fe2430281d09aaeb9af03e7.png', '2018-06-05 11:41:48');
INSERT INTO `sys_oss` VALUES ('20', 'http://img.cnadmart.com/20180605/ef4c4f9654cd4baea537e6b58d44b695.png', '2018-06-05 11:43:05');
INSERT INTO `sys_oss` VALUES ('21', 'http://img.cnadmart.com/20180605/5239bc4ffeb244d1a58befaa84c196bd.jpg', '2018-06-05 11:43:15');
INSERT INTO `sys_oss` VALUES ('22', 'http://img.cnadmart.com/20180605/efe0764ad7af4bc59ee70dafa9733d8f.png', '2018-06-05 11:43:21');
INSERT INTO `sys_oss` VALUES ('23', 'http://img.cnadmart.com/20180605/c580255e108d479ca86f1bcec7b698ab.png', '2018-06-05 11:46:26');
INSERT INTO `sys_oss` VALUES ('24', 'http://img.cnadmart.com/20180605/83b9dbc71cf747f7a1db108a8cf9c3c8.jpg', '2018-06-05 11:47:21');
INSERT INTO `sys_oss` VALUES ('25', 'http://img.cnadmart.com/20180605/f92e75489ccc43b4b1c2c2f8a02c9d22.jpg', '2018-06-05 13:27:41');
INSERT INTO `sys_oss` VALUES ('26', 'http://img.cnadmart.com/20180605/c34001d84ed54a8f830be2500f780d21.png', '2018-06-05 13:28:04');
INSERT INTO `sys_oss` VALUES ('27', 'http://img.cnadmart.com/20180605/776c458999d942f4b72fd02bda5716db.png', '2018-06-05 13:30:03');
INSERT INTO `sys_oss` VALUES ('28', 'http://img.cnadmart.com/20180605/f78848de7df04acba3f39b1ed0d3bfd9.png', '2018-06-05 13:35:52');
INSERT INTO `sys_oss` VALUES ('29', 'http://img.cnadmart.com/20180605/a7a31ac6ad8a4d7c84dc3c291287ae8b.png', '2018-06-05 14:11:21');
INSERT INTO `sys_oss` VALUES ('30', 'http://img.cnadmart.com/20180605/6c860f313b294495a12d4dea3c49fc87.png', '2018-06-05 14:11:22');
INSERT INTO `sys_oss` VALUES ('31', 'http://img.cnadmart.com/20180605/57fd33c949884d8bbe3d1896b288fafe.png', '2018-06-05 14:12:30');
INSERT INTO `sys_oss` VALUES ('32', 'http://img.cnadmart.com/20180605/caa1d898682a4b0e8e5dbac220b9e853.jpg', '2018-06-05 14:12:30');
INSERT INTO `sys_oss` VALUES ('33', 'http://img.cnadmart.com/20180605/e9c5b531a57c43e1b1f9116e26122fa9.png', '2018-06-05 14:12:52');
INSERT INTO `sys_oss` VALUES ('34', 'http://img.cnadmart.com/20180605/e8f2f678d0e841a09b17076a7cf1ab4e.png', '2018-06-05 14:12:53');
INSERT INTO `sys_oss` VALUES ('35', 'http://img.cnadmart.com/20180605/97f0cf96dec64e8e977e7a48d154e9b6.png', '2018-06-05 14:24:04');
INSERT INTO `sys_oss` VALUES ('36', 'http://img.cnadmart.com/20180605/74fe971154ae4a95bb4e9b6d6bf88fb9.png', '2018-06-05 14:51:35');
INSERT INTO `sys_oss` VALUES ('37', 'http://img.cnadmart.com/20180605/a44d9e0046294695af1f9e9c37b958d1.png', '2018-06-05 14:59:58');
INSERT INTO `sys_oss` VALUES ('38', 'http://img.cnadmart.com/20180621/a48bde2c7fe14b39a825849626404799.jpg', '2018-06-21 10:27:14');
INSERT INTO `sys_oss` VALUES ('39', 'http://img.cnadmart.com/20180621/f4bb4447a6894653b2da80fcd745390a.jpg', '2018-06-21 10:42:00');
INSERT INTO `sys_oss` VALUES ('40', 'http://img.cnadmart.com/20180621/9b7b21a26bb74536985b073488eae307.png', '2018-06-21 10:46:30');
INSERT INTO `sys_oss` VALUES ('41', 'http://img.cnadmart.com/20180621/d5d9635baf644d26ac80e04c8a122668.jpg', '2018-06-21 14:21:00');
INSERT INTO `sys_oss` VALUES ('42', 'http://img.cnadmart.com/20180623/8ed6b37c0e354b219a76a2389fa733f5.png', '2018-06-23 00:16:35');
INSERT INTO `sys_oss` VALUES ('43', 'http://img.cnadmart.com/20180623/e1732d3dd44e4513a88cf4589b4960df.png', '2018-06-23 00:23:48');
INSERT INTO `sys_oss` VALUES ('44', 'http://img.cnadmart.com/20180623/87fc8c561d02475db2008b1bf6963cf0.png', '2018-06-23 00:24:27');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '管理员角色', null, '1', '2018-05-14 16:33:20');
INSERT INTO `sys_role` VALUES ('2', '加盟商', null, '8', '2018-06-07 16:29:40');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色与部门对应关系';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('51', '1', '1');
INSERT INTO `sys_role_menu` VALUES ('52', '1', '2');
INSERT INTO `sys_role_menu` VALUES ('53', '1', '15');
INSERT INTO `sys_role_menu` VALUES ('54', '1', '16');
INSERT INTO `sys_role_menu` VALUES ('55', '1', '17');
INSERT INTO `sys_role_menu` VALUES ('56', '1', '18');
INSERT INTO `sys_role_menu` VALUES ('57', '1', '3');
INSERT INTO `sys_role_menu` VALUES ('58', '1', '19');
INSERT INTO `sys_role_menu` VALUES ('59', '1', '20');
INSERT INTO `sys_role_menu` VALUES ('60', '1', '21');
INSERT INTO `sys_role_menu` VALUES ('61', '1', '22');
INSERT INTO `sys_role_menu` VALUES ('62', '1', '4');
INSERT INTO `sys_role_menu` VALUES ('63', '1', '23');
INSERT INTO `sys_role_menu` VALUES ('64', '1', '24');
INSERT INTO `sys_role_menu` VALUES ('65', '1', '25');
INSERT INTO `sys_role_menu` VALUES ('66', '1', '26');
INSERT INTO `sys_role_menu` VALUES ('67', '1', '70');
INSERT INTO `sys_role_menu` VALUES ('68', '1', '71');
INSERT INTO `sys_role_menu` VALUES ('69', '1', '72');
INSERT INTO `sys_role_menu` VALUES ('70', '1', '73');
INSERT INTO `sys_role_menu` VALUES ('71', '1', '74');
INSERT INTO `sys_role_menu` VALUES ('72', '2', '70');
INSERT INTO `sys_role_menu` VALUES ('73', '2', '72');
INSERT INTO `sys_role_menu` VALUES ('74', '2', '73');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) DEFAULT NULL COMMENT '盐',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'e1153123d7d180ceeb820d577ff119876678732a68eef4e6ffc0b1f06a01f91b', 'YzcmCZNvbXocrsz9dm8e', 'root@cnadmart.com', '136000000', '1', '1', '2016-11-11 11:11:11');
INSERT INTO `sys_user` VALUES ('2', 'fuyang', '2ba789379d577b4c649e8419393acd85124ab8da1ff8163e76848f34b37f7c48', 'mTN50NIevjz53gIMUuf7', '111@111.com', '1300001', '1', '9', '2018-06-07 16:31:27');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('3', '2', '2');
INSERT INTO `sys_user_role` VALUES ('8', '3', '2');
INSERT INTO `sys_user_role` VALUES ('9', '1', '1');
