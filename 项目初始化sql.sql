/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50704
Source Host           : localhost:3306
Source Database       : martian_book

Target Server Type    : MYSQL
Target Server Version : 50704
File Encoding         : 65001

Date: 2018-05-02 21:05:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_book
-- ----------------------------
DROP TABLE IF EXISTS `t_book`;
CREATE TABLE `t_book` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `book_name` varchar(128) NOT NULL COMMENT '书名',
  `type_id` varchar(32) NOT NULL COMMENT '图书类型Id',
  `shelf_id` varchar(32) DEFAULT NULL COMMENT '书架ID',
  `author` varchar(64) NOT NULL COMMENT '作者',
  `translator` varchar(64) DEFAULT NULL COMMENT '译者',
  `isbn` varchar(32) DEFAULT NULL COMMENT '国际书标号',
  `book_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '图书价格',
  `press` varchar(64) NOT NULL COMMENT '出版社',
  `is_lend` varchar(1) DEFAULT NULL COMMENT '是否借出',
  `book_image` varchar(255) DEFAULT NULL COMMENT '封面',
  `is_valid` varchar(1) DEFAULT NULL COMMENT '是否有效 Y有效 N无效',
  `create_by` varchar(255) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='图书信息';

-- ----------------------------
-- Records of t_book
-- ----------------------------
INSERT INTO `t_book` VALUES ('035ee146f5944a63aff135a6aeee839b', '医学心悟', '1b645be0e16149fe93ce86784087007f', null, '清·程国彭,王键,郜峦', '', '', '23.58', '中国中医药出版社', 'N', 'assets/upload/book/image/201803/20180307213437_104.jpg', 'Y', 'admin', '2017-11-06 22:18:25', 'admin', '2018-03-07 21:34:39');
INSERT INTO `t_book` VALUES ('240e4ca17dea4602975547f9e6910b2a', 'Java Web从入门到精通', '4', null, '明日学院', '', '', '89.80', '水利水电出版社', 'Y', 'assets/upload/book/image/201803/20180307213459_471.jpg', 'Y', 'admin', '2017-11-06 22:14:42', 'admin', '2018-03-07 21:47:28');
INSERT INTO `t_book` VALUES ('2d2e001af48b4d3da282e985506f3490', 'Spring源码深度解析', '4', null, '郝佳', '', '', '69.00', '人民邮电出版社', 'Y', 'assets/upload/book/image/201803/20180310184842_815.jpg', 'Y', 'admin', '2017-11-06 22:22:46', 'admin', '2018-05-01 11:46:37');
INSERT INTO `t_book` VALUES ('2dbc50bc8290435cb15c9b30449b04dd', '呼吸：音乐就在我们的身体里', '3', null, '杨照', '', '', '24.50', '广西师范大学出版社', 'N', 'assets/upload/book/image/201803/20180310184834_268.jpg', 'Y', 'admin', '2017-11-06 22:23:55', 'admin', '2018-03-10 18:48:36');
INSERT INTO `t_book` VALUES ('3ccab108c74541f882f61e42753d7119', '音乐之光', '3', null, '施慧', '', '', '14.43', '云南人民出版社', 'N', 'assets/upload/book/image/201803/20180310184850_200.jpg', 'Y', 'admin', '2017-11-06 22:20:57', 'admin', '2018-03-10 18:48:51');
INSERT INTO `t_book` VALUES ('4f6d2bafa74e4d0585cb1b7a30cd8740', '穿过生命中的泥泞时刻', '1', null, '真实故事计划', '', '', '9.99', '百花洲文艺出版社', 'Y', 'assets/upload/book/image/201803/20180307213446_549.jpg', 'Y', 'admin', '2017-11-06 22:16:51', 'admin', '2018-03-07 22:51:00');
INSERT INTO `t_book` VALUES ('9237b92d76284407afc98d5d62dec7d6', '书香，也醉人', '1', '1', '朱永新', '', '', '4.00', '海天出版社', 'N', 'assets/upload/book/image/201803/20180310184807_421.jpg', 'Y', 'admin', '2017-11-06 22:26:03', 'admin', '2018-05-01 11:47:30');
INSERT INTO `t_book` VALUES ('9e2c95e5bf804d59bc840a5d6f0a026b', '建筑艺术', '2', null, '李慕南', '', '', '2.93', '河南大学出版社', 'N', 'assets/upload/book/image/201803/20180307213430_634.jpg', 'Y', 'admin', '2017-11-06 22:19:40', 'admin', '2018-03-07 21:34:32');
INSERT INTO `t_book` VALUES ('f6f9bfeacabd4ae4b664f3467140e840', 'cc', '1', '3', 'd', '', '', '0.00', 'x', 'N', 'assets/upload/book/image/201805/20180501111022_490.png', 'N', 'admin', '2018-05-01 11:10:33', 'admin', '2018-05-01 11:10:53');
INSERT INTO `t_book` VALUES ('ff45c18d34134ca79679e3adc954e02e', '建筑美学', '2', null, '张棨', '', '', '15.30', '云南人民出版社', 'N', 'assets/upload/book/image/201803/20180310184820_911.jpg', 'Y', 'admin', '2017-11-06 22:24:53', 'admin', '2018-05-01 12:26:15');

-- ----------------------------
-- Table structure for t_book_shelf
-- ----------------------------
DROP TABLE IF EXISTS `t_book_shelf`;
CREATE TABLE `t_book_shelf` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `name` varchar(64) NOT NULL COMMENT '书架名称',
  `is_valid` varchar(1) DEFAULT NULL COMMENT '是否有效 Y有效 N无效',
  `create_by` varchar(255) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT=' 书架';

-- ----------------------------
-- Records of t_book_shelf
-- ----------------------------
INSERT INTO `t_book_shelf` VALUES ('1', '书架1', 'Y', 'system', '2017-10-14 18:13:49', 'admin', '2017-10-23 20:38:05');
INSERT INTO `t_book_shelf` VALUES ('2', '书架2', 'Y', 'system', '2017-10-14 18:14:40', 'admin', '2017-10-29 18:10:45');
INSERT INTO `t_book_shelf` VALUES ('3', '书架3', 'Y', 'system', '2017-10-14 18:14:40', 'system', '2017-10-14 18:14:42');
INSERT INTO `t_book_shelf` VALUES ('4', '书架4', 'Y', 'system', '2017-10-14 18:14:40', 'admin', '2017-10-21 13:31:53');
INSERT INTO `t_book_shelf` VALUES ('e830f0bea8ef495a9b41d39cdc04da57', '书架5', 'Y', 'admin', '2018-05-01 09:55:09', 'admin', '2018-05-01 10:00:18');

-- ----------------------------
-- Table structure for t_book_type
-- ----------------------------
DROP TABLE IF EXISTS `t_book_type`;
CREATE TABLE `t_book_type` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `name` varchar(64) NOT NULL COMMENT '类型名称',
  `is_valid` varchar(1) DEFAULT NULL COMMENT '是否有效 Y有效 N无效',
  `create_by` varchar(255) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='图书类型';

-- ----------------------------
-- Records of t_book_type
-- ----------------------------
INSERT INTO `t_book_type` VALUES ('1', '文学', 'Y', 'system', '2017-10-14 18:13:49', 'admin', '2017-10-23 20:38:05');
INSERT INTO `t_book_type` VALUES ('1b645be0e16149fe93ce86784087007f', '医学', 'Y', 'admin', '2017-11-06 22:11:46', 'admin', '2017-11-06 22:11:46');
INSERT INTO `t_book_type` VALUES ('2', '建筑', 'Y', 'system', '2017-10-14 18:14:40', 'admin', '2017-10-29 18:10:45');
INSERT INTO `t_book_type` VALUES ('3', '音乐', 'Y', 'system', '2017-10-14 18:14:40', 'system', '2017-10-14 18:14:42');
INSERT INTO `t_book_type` VALUES ('4', '计算机', 'Y', 'system', '2017-10-14 18:14:40', 'admin', '2017-10-21 13:31:53');

-- ----------------------------
-- Table structure for t_borrow
-- ----------------------------
DROP TABLE IF EXISTS `t_borrow`;
CREATE TABLE `t_borrow` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `reader_id` varchar(32) NOT NULL COMMENT '借阅者Id',
  `book_id` varchar(32) NOT NULL COMMENT '图书Id',
  `out_date` date NOT NULL COMMENT '借出日期',
  `back_date` date NOT NULL COMMENT '应归还日期',
  `is_back` varchar(1) NOT NULL COMMENT '是否归还 Y是N否',
  `is_renew` varchar(1) DEFAULT NULL COMMENT '是否续借',
  `back_time` datetime DEFAULT NULL COMMENT '实际归还时间',
  `is_valid` varchar(1) DEFAULT NULL COMMENT '是否有效 Y有效 N无效',
  `create_by` varchar(255) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='借阅信息';

-- ----------------------------
-- Records of t_borrow
-- ----------------------------
INSERT INTO `t_borrow` VALUES ('3422a04547d24f46aeb8149a48d7907e', '2fd64a4fae584f948b5b68480f16affe', '240e4ca17dea4602975547f9e6910b2a', '2017-11-06', '2017-12-06', 'Y', null, '2017-11-06 22:35:22', 'Y', 'admin', '2017-11-06 22:30:20', 'admin', '2017-11-06 22:35:22');
INSERT INTO `t_borrow` VALUES ('620afc209c7b4056988e5beafe471b51', 'c70a9c05f81e48498585fa91697235e5', '240e4ca17dea4602975547f9e6910b2a', '2018-03-07', '2018-05-06', 'N', null, null, 'Y', 'admin', '2018-03-07 21:47:28', 'admin', '2018-03-07 21:47:28');
INSERT INTO `t_borrow` VALUES ('87f7d55a84e94685a2f335d838e3e5bc', '2fd64a4fae584f948b5b68480f16affe', 'ff45c18d34134ca79679e3adc954e02e', '2018-05-01', '2018-06-30', 'Y', 'Y', '2018-05-01 12:26:15', 'Y', 'admin', '2018-05-01 12:25:51', 'admin', '2018-05-01 12:26:15');
INSERT INTO `t_borrow` VALUES ('8d8dbd3220e3426991b3a0aff19d0bca', '2fd64a4fae584f948b5b68480f16affe', '2d2e001af48b4d3da282e985506f3490', '2017-11-06', '2017-12-06', 'Y', null, '2018-03-07 22:41:43', 'Y', 'admin', '2017-11-06 22:32:38', 'admin', '2018-03-07 22:41:43');
INSERT INTO `t_borrow` VALUES ('a199c0a7d29a44b59d8c0fe263a76275', '2fd64a4fae584f948b5b68480f16affe', '9237b92d76284407afc98d5d62dec7d6', '2018-05-01', '2018-06-30', 'Y', 'Y', '2018-05-01 11:47:30', 'Y', 'admin', '2018-05-01 11:29:27', 'admin', '2018-05-01 11:47:30');
INSERT INTO `t_borrow` VALUES ('b25c6f2f32c546dc8e6eb16669e869ea', '2fd64a4fae584f948b5b68480f16affe', '4f6d2bafa74e4d0585cb1b7a30cd8740', '2018-03-07', '2018-05-06', 'N', 'Y', null, 'Y', 'admin', '2018-03-07 22:51:00', 'admin', '2018-05-01 11:41:35');
INSERT INTO `t_borrow` VALUES ('bdd3531ddb854b5780eee66fbf0a3c92', '2fd64a4fae584f948b5b68480f16affe', '2d2e001af48b4d3da282e985506f3490', '2018-05-01', '2018-06-30', 'N', 'Y', null, 'Y', 'admin', '2018-05-01 11:46:37', 'admin', '2018-05-01 11:48:07');

-- ----------------------------
-- Table structure for t_message
-- ----------------------------
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE `t_message` (
  `id` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL COMMENT '公告名称',
  `content` varchar(2048) NOT NULL COMMENT '内容',
  `is_valid` varchar(1) DEFAULT NULL COMMENT '是否有效 Y有效 N无效',
  `create_by` varchar(255) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息公告表';

-- ----------------------------
-- Records of t_message
-- ----------------------------
INSERT INTO `t_message` VALUES ('1', '关于图书馆自修室座位预约管理系统试运行的通知', '为了提高图书馆自修室利用效率，更好的为广大同学服务，图书馆将于寒假期间对长安校区图书馆自修室进行座位管理系统的安装和调试，并暂定于下学期初（即3月5日）起试运行。\r\n　　自下学期起，使用图书馆自修室的读者可使用“图书馆自修室座位管理系统”进行预约选座、实时选座等功能，具体使用方法详见附件。\r\n　　试运行期间如果遇到问题请到二楼流通办公室（A203）咨询。请读者认真遵守图书馆自修室座位管理系统规则，爱护设施，做文明读者。', 'Y', 'system', '2018-04-29 17:25:45', 'system', '2018-04-29 17:25:45');

-- ----------------------------
-- Table structure for t_reader
-- ----------------------------
DROP TABLE IF EXISTS `t_reader`;
CREATE TABLE `t_reader` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `user_id` varchar(32) NOT NULL COMMENT '用户Id',
  `name` varchar(64) NOT NULL COMMENT '姓名',
  `sex` int(1) DEFAULT NULL COMMENT '性别：0女 1男',
  `card_no` varchar(32) DEFAULT NULL COMMENT '借阅证编号',
  `type_id` varchar(32) NOT NULL COMMENT '读者类型Id',
  `mobile` varchar(11) DEFAULT NULL COMMENT '手机号',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `id_no` varchar(32) DEFAULT NULL COMMENT '证件号',
  `days` int(11) DEFAULT '0' COMMENT '可借阅天数',
  `num` int(11) DEFAULT '0' COMMENT '可借图书本数',
  `has_num` int(11) DEFAULT '0' COMMENT '已借图书本数',
  `is_valid` varchar(1) DEFAULT NULL COMMENT '是否有效 Y有效 N无效',
  `create_by` varchar(255) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='读者信息';

-- ----------------------------
-- Records of t_reader
-- ----------------------------
INSERT INTO `t_reader` VALUES ('2fd64a4fae584f948b5b68480f16affe', '52f4f0e409474b45bf5be5b459f39a10', '老九', '1', '1711068084145999', '1', '18900000000', '', '511625129852128215', '30', '5', '2', 'Y', 'admin', '2017-11-06 22:28:51', 'admin', '2018-05-01 12:26:15');
INSERT INTO `t_reader` VALUES ('5386600d281148d08e0ae9bcc3d1f5c5', '0bca368da8cf4dc5bf7b782271ce080a', '李四', '1', '1803077954478538', '1', '18200000001', '', '511', '30', '5', '0', 'N', 'admin', '2018-03-07 22:06:15', 'admin', '2018-04-11 19:43:41');
INSERT INTO `t_reader` VALUES ('c70a9c05f81e48498585fa91697235e5', '45d8d59b4a3e4c5ba513272abfab8070', '黄飞鸿', '1', '1803077826840733', '2', '18200000000', '', '511', '60', '10', '1', 'Y', 'admin', '2018-03-07 21:45:11', 'admin', '2018-03-07 21:47:28');

-- ----------------------------
-- Table structure for t_reader_type
-- ----------------------------
DROP TABLE IF EXISTS `t_reader_type`;
CREATE TABLE `t_reader_type` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `name` varchar(64) NOT NULL COMMENT '类型名称',
  `days` int(3) NOT NULL DEFAULT '0' COMMENT '可借阅天数',
  `num` int(3) NOT NULL DEFAULT '0' COMMENT '可借图书本数',
  `is_valid` varchar(1) DEFAULT NULL COMMENT '是否有效 Y有效 N无效',
  `create_by` varchar(255) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='读者类型';

-- ----------------------------
-- Records of t_reader_type
-- ----------------------------
INSERT INTO `t_reader_type` VALUES ('1', '学生', '30', '5', 'Y', 'system', '2017-10-21 14:37:22', 'admin', '2017-11-06 22:12:23');
INSERT INTO `t_reader_type` VALUES ('2', '老师', '60', '10', 'Y', 'system', '2017-10-21 14:37:54', 'admin', '2017-11-06 22:12:35');
INSERT INTO `t_reader_type` VALUES ('3', '其他', '30', '5', 'Y', 'system', '2017-10-21 20:59:44', 'admin', '2017-11-06 22:12:46');

-- ----------------------------
-- Table structure for t_resource
-- ----------------------------
DROP TABLE IF EXISTS `t_resource`;
CREATE TABLE `t_resource` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `pid` varchar(32) DEFAULT NULL COMMENT '父资源id',
  `name` varchar(64) DEFAULT NULL COMMENT '名称',
  `tree_code` varchar(32) DEFAULT NULL COMMENT '树编码',
  `url` varchar(128) DEFAULT NULL COMMENT '菜单路径',
  `icon` varchar(64) DEFAULT NULL COMMENT '图标',
  `resource_type` int(1) NOT NULL COMMENT '资源类别：1菜单2按钮',
  `is_leaf` varchar(1) NOT NULL COMMENT '是否叶子节点 Y或N',
  `state` int(1) DEFAULT NULL COMMENT '菜单状态:0 禁用 1启用',
  `sort` int(3) DEFAULT '1' COMMENT '排序',
  `is_valid` varchar(1) NOT NULL DEFAULT 'Y' COMMENT '是否有效，Y表示有效，N表示无效',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资源表';

-- ----------------------------
-- Records of t_resource
-- ----------------------------
INSERT INTO `t_resource` VALUES ('0719d070e3244e36967848e969159afa', 'bcfffbd5f6a848758dcea265e963dff8', '借阅记录', '1104', 'reader/borrow/record', '', '1', 'Y', '1', '1', 'Y', 'admin', '2018-05-01 12:00:31', 'admin', '2018-05-01 12:00:31');
INSERT INTO `t_resource` VALUES ('33fd3d2ded12406597a53f85b257a19d', '66e7e2bc818040c2a42bf490537755f7', '图书分类', '1202', 'book/type/list', '', '1', 'Y', '1', '2', 'Y', 'admin', '2017-10-22 19:35:08', 'admin', '2017-10-22 19:35:08');
INSERT INTO `t_resource` VALUES ('452383655ff442fcbd3ff7e8b6ee73ad', '837f3fa6118349f1809b31eb24204797', '读者列表', '1301', 'reader/list', '', '1', 'Y', '1', '1', 'Y', 'admin', '2017-10-22 19:36:30', 'admin', '2017-10-22 19:36:30');
INSERT INTO `t_resource` VALUES ('66e7e2bc818040c2a42bf490537755f7', '0', '图书管理', '12', 'javascript:;', '', '1', 'N', '1', '3', 'Y', 'admin', '2017-10-22 19:33:02', 'admin', '2018-05-01 09:52:00');
INSERT INTO `t_resource` VALUES ('766e7510a1f54f089cd76ba8c4bb2606', 'bcfffbd5f6a848758dcea265e963dff8', '借阅记录', '1103', 'borrow/record', '', '1', 'Y', '1', '3', 'Y', 'admin', '2017-10-30 22:02:32', 'admin', '2017-10-30 22:02:32');
INSERT INTO `t_resource` VALUES ('82401b0177df444abb1ba0c79d4b4aa3', '66e7e2bc818040c2a42bf490537755f7', '图书列表', '1201', 'book/list', '', '1', 'Y', '1', '1', 'Y', 'admin', '2017-10-22 19:34:38', 'admin', '2017-10-22 19:34:38');
INSERT INTO `t_resource` VALUES ('837f3fa6118349f1809b31eb24204797', '0', '读者管理', '13', 'javascript:;', '', '1', 'N', '1', '4', 'Y', 'admin', '2017-10-22 19:33:14', 'admin', '2017-10-29 18:29:09');
INSERT INTO `t_resource` VALUES ('87c4a506f8a84dbabe54d0980701488e', 'bcfffbd5f6a848758dcea265e963dff8', '图书借阅', '1101', 'borrow/list', '', '1', 'Y', '1', '1', 'Y', 'admin', '2017-10-30 22:01:46', 'admin', '2017-10-30 22:01:46');
INSERT INTO `t_resource` VALUES ('9e55dfe3bbbc4fb1924074ab47d4b4fa', '0', '系统管理', '10', 'javascript:;', '', '1', 'N', '1', '1', 'Y', 'admin', '2017-10-22 19:30:49', 'admin', '2018-05-01 10:33:28');
INSERT INTO `t_resource` VALUES ('b703dc5f66704e238d0f6d6fba7f3e6e', '9e55dfe3bbbc4fb1924074ab47d4b4fa', '修改密码', '1001', 'user/goUpdatePwd', '', '1', 'Y', '1', '1', 'Y', 'admin', '2017-11-05 20:33:17', 'admin', '2017-11-05 20:33:17');
INSERT INTO `t_resource` VALUES ('bcfffbd5f6a848758dcea265e963dff8', '0', '借阅管理', '11', 'javascript:;', '', '1', 'N', '1', '2', 'Y', 'admin', '2017-10-22 19:32:26', 'admin', '2018-05-01 12:00:31');
INSERT INTO `t_resource` VALUES ('c5e880cde8f44c8ea6c3f8b47d75b9bc', 'bcfffbd5f6a848758dcea265e963dff8', '图书归还', '1102', 'giveback/list', '', '1', 'Y', '1', '2', 'Y', 'admin', '2017-10-30 22:02:02', 'admin', '2017-10-30 22:02:02');
INSERT INTO `t_resource` VALUES ('cf50edfeaad24ad0b6b717c669dec958', '9e55dfe3bbbc4fb1924074ab47d4b4fa', '公告管理', '1003', 'message/list', '', '1', 'Y', '1', '1', 'Y', 'admin', '2018-05-01 10:33:28', 'admin', '2018-05-01 10:33:28');
INSERT INTO `t_resource` VALUES ('e62b3bd25fa04c4bafee4f9f477cb5c8', '9e55dfe3bbbc4fb1924074ab47d4b4fa', '个人信息', '1002', 'reader/goUpdatePersonInfo', '', '1', 'Y', '1', '2', 'Y', 'admin', '2018-03-07 22:56:52', 'admin', '2018-03-07 22:56:52');
INSERT INTO `t_resource` VALUES ('f007864ea8624c1b9c91b99df7e2a1b1', '837f3fa6118349f1809b31eb24204797', '读者分类', '1302', 'reader/type/list', '', '1', 'Y', '1', '2', 'Y', 'admin', '2017-10-29 18:29:09', 'admin', '2017-10-29 18:29:09');
INSERT INTO `t_resource` VALUES ('f24ea7beb3ab4f7598a48b96be601d25', '66e7e2bc818040c2a42bf490537755f7', '图书书架', '1203', 'book/shelf/list', '', '1', 'Y', '1', '1', 'Y', 'admin', '2018-05-01 09:51:59', 'admin', '2018-05-01 09:51:59');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `role_name` varchar(50) DEFAULT NULL,
  `role_desc` varchar(100) DEFAULT NULL COMMENT '角色信息描述',
  `is_valid` varchar(1) NOT NULL DEFAULT 'Y' COMMENT '是否有效，Y表示有效，N表示无效',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', '管理员', '管理员描述', 'Y', '1', '2017-09-05 23:15:05', '1', '2017-09-05 23:15:05');
INSERT INTO `t_role` VALUES ('2', '读者', '读者描述', 'Y', '1', '2017-09-05 23:20:58', '1', '2017-09-05 23:20:58');
INSERT INTO `t_role` VALUES ('2c0a0e6155bd497c9482f41349285b1b', '管理员2', '管理员描述2', 'Y', '1', '2018-03-08 20:21:19', '1', '2018-03-08 20:21:19');
INSERT INTO `t_role` VALUES ('dfbc5402deb44acfabd5e917a6cea01c', '管理员2', '管理员描述2', 'Y', '1', '2018-04-11 19:49:54', '1', '2018-04-11 19:49:54');

-- ----------------------------
-- Table structure for t_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `t_role_resource`;
CREATE TABLE `t_role_resource` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `role_id` varchar(32) DEFAULT NULL,
  `resource_id` varchar(32) DEFAULT NULL,
  `is_valid` varchar(1) NOT NULL DEFAULT 'Y' COMMENT '是否有效，Y表示有效，N表示无效',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-资源表';

-- ----------------------------
-- Records of t_role_resource
-- ----------------------------
INSERT INTO `t_role_resource` VALUES ('1', '1', '33fd3d2ded12406597a53f85b257a19d', 'Y', 'system', '2017-10-22 19:37:09', 'system', '2017-10-22 19:37:12');
INSERT INTO `t_role_resource` VALUES ('10', '1', 'c5e880cde8f44c8ea6c3f8b47d75b9bc', 'Y', 'system', '2017-10-30 22:05:08', 'system', '2017-10-30 22:05:11');
INSERT INTO `t_role_resource` VALUES ('100', '1', 'f24ea7beb3ab4f7598a48b96be601d25', 'Y', 'system', '2018-05-01 09:52:59', 'system', '2018-05-01 09:53:01');
INSERT INTO `t_role_resource` VALUES ('101', '1', 'cf50edfeaad24ad0b6b717c669dec958', 'Y', 'system', '2018-05-01 09:52:59', 'system', '2018-05-01 09:52:59');
INSERT INTO `t_role_resource` VALUES ('102', '2', '0719d070e3244e36967848e969159afa', 'Y', 'system', '2018-05-01 09:52:59', 'system', '2018-05-01 09:52:59');
INSERT INTO `t_role_resource` VALUES ('11', '1', '766e7510a1f54f089cd76ba8c4bb2606', 'Y', 'system', '2017-10-30 22:05:33', 'system', '2017-10-30 22:05:36');
INSERT INTO `t_role_resource` VALUES ('12', '1', 'b703dc5f66704e238d0f6d6fba7f3e6e', 'Y', 'system', '2017-11-05 20:33:57', 'system', '2017-11-05 20:33:59');
INSERT INTO `t_role_resource` VALUES ('13', '2', '66e7e2bc818040c2a42bf490537755f7', 'Y', 'system', '2018-03-07 21:51:13', 'system', '2018-03-07 21:51:15');
INSERT INTO `t_role_resource` VALUES ('14', '2', '82401b0177df444abb1ba0c79d4b4aa3', 'Y', 'system', '2018-03-07 21:51:13', 'system', '2018-03-07 21:51:13');
INSERT INTO `t_role_resource` VALUES ('15', '2', 'bcfffbd5f6a848758dcea265e963dff8', 'Y', 'system', '2018-03-07 21:51:13', 'system', '2018-03-07 21:51:13');
INSERT INTO `t_role_resource` VALUES ('16', '2', '87c4a506f8a84dbabe54d0980701488e', 'Y', 'system', '2018-03-07 21:51:13', 'system', '2018-03-07 21:51:13');
INSERT INTO `t_role_resource` VALUES ('17', '2', 'c5e880cde8f44c8ea6c3f8b47d75b9bc', 'Y', 'system', '2018-03-07 21:51:13', 'system', '2018-03-07 21:51:13');
INSERT INTO `t_role_resource` VALUES ('18', '2', '9e55dfe3bbbc4fb1924074ab47d4b4fa', 'Y', 'system', '2018-03-07 21:51:13', 'system', '2018-03-07 21:51:13');
INSERT INTO `t_role_resource` VALUES ('19', '2', 'b703dc5f66704e238d0f6d6fba7f3e6e', 'Y', 'system', '2018-03-07 21:51:13', 'system', '2018-03-07 21:51:13');
INSERT INTO `t_role_resource` VALUES ('2', '1', '452383655ff442fcbd3ff7e8b6ee73ad', 'Y', 'system', '2017-10-22 19:37:09', 'system', '2017-10-22 19:37:12');
INSERT INTO `t_role_resource` VALUES ('20', '2', 'e62b3bd25fa04c4bafee4f9f477cb5c8', 'Y', 'system', '2017-10-30 22:04:40', 'system', '2017-10-30 22:04:40');
INSERT INTO `t_role_resource` VALUES ('3', '1', '66e7e2bc818040c2a42bf490537755f7', 'Y', 'system', '2017-10-22 19:37:09', 'system', '2017-10-22 19:37:12');
INSERT INTO `t_role_resource` VALUES ('4', '1', '82401b0177df444abb1ba0c79d4b4aa3', 'Y', 'system', '2017-10-22 19:37:09', 'system', '2017-10-22 19:37:12');
INSERT INTO `t_role_resource` VALUES ('5', '1', '837f3fa6118349f1809b31eb24204797', 'Y', 'system', '2017-10-22 19:37:09', 'system', '2017-10-22 19:37:12');
INSERT INTO `t_role_resource` VALUES ('6', '1', '9e55dfe3bbbc4fb1924074ab47d4b4fa', 'Y', 'system', '2017-10-22 19:37:09', 'system', '2017-10-22 19:37:12');
INSERT INTO `t_role_resource` VALUES ('7', '1', 'bcfffbd5f6a848758dcea265e963dff8', 'Y', 'system', '2017-10-22 19:37:09', 'system', '2017-10-22 19:37:12');
INSERT INTO `t_role_resource` VALUES ('8', '1', 'f007864ea8624c1b9c91b99df7e2a1b1', 'Y', 'system', '2017-10-29 18:31:18', 'system', '2017-10-29 18:31:21');
INSERT INTO `t_role_resource` VALUES ('9', '1', '87c4a506f8a84dbabe54d0980701488e', 'Y', 'system', '2017-10-30 22:04:40', 'system', '2017-10-30 22:04:44');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `user_name` varchar(64) NOT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `salt` varchar(255) DEFAULT NULL COMMENT '盐值',
  `is_enable` varchar(1) NOT NULL COMMENT '是否可用Y可用N禁用',
  `is_valid` varchar(1) DEFAULT NULL COMMENT '是否有效 Y有效 N无效',
  `create_by` varchar(255) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('0bca368da8cf4dc5bf7b782271ce080a', 'lisi', '0bcd84afb699c20f51e9011fbd43cfbe', 'RZhFWS', 'Y', 'N', 'admin', '2018-03-07 22:06:15', 'admin', '2018-04-11 19:43:41');
INSERT INTO `t_user` VALUES ('1', 'admin', 'eef3365852273121b6ab689d5148a813', 'JdHXZC', 'Y', 'Y', 'system', '2017-10-22 13:51:08', '1', '2017-11-05 21:06:18');
INSERT INTO `t_user` VALUES ('45d8d59b4a3e4c5ba513272abfab8070', 'zhangsan', '178dd09760878b667c3a0186420992ed', 'NMizof', 'Y', 'Y', 'admin', '2018-03-07 21:45:11', 'admin', '2018-03-07 21:45:11');
INSERT INTO `t_user` VALUES ('52f4f0e409474b45bf5be5b459f39a10', 'laojiu', 'ae21162852048391714e24b96be85c45', 'WqoML8', 'Y', 'Y', 'admin', '2017-11-06 22:28:51', '52f4f0e409474b45bf5be5b459f39a10', '2018-03-07 21:43:41');

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户Id',
  `role_id` varchar(32) DEFAULT NULL COMMENT '角色Id',
  `is_valid` varchar(1) NOT NULL DEFAULT 'Y' COMMENT '是否有效，Y表示有效，N表示无效',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色表';

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('1', '1', '1', 'Y', 'system', '2017-10-22 19:22:41', 'system', '2017-10-22 19:22:43');
INSERT INTO `t_user_role` VALUES ('2', '45d8d59b4a3e4c5ba513272abfab8070', '2', 'Y', 'system', '2017-10-22 19:22:41', 'system', '2017-10-22 19:22:41');
INSERT INTO `t_user_role` VALUES ('3', '52f4f0e409474b45bf5be5b459f39a10', '2', 'Y', 'system', '2017-10-22 19:22:41', 'system', '2017-10-22 19:22:41');
INSERT INTO `t_user_role` VALUES ('a3413e6aac994fa1bd23ad679152ea0f', '0bca368da8cf4dc5bf7b782271ce080a', '2', 'Y', 'admin', '2018-03-07 22:06:15', 'admin', '2018-03-07 22:06:15');
