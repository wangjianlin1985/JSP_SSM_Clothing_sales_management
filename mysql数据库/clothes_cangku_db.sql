/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : clothes_cangku_db

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2019-03-13 20:22:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL default '',
  `password` varchar(32) default NULL,
  PRIMARY KEY  (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a', 'a');

-- ----------------------------
-- Table structure for `t_attendance`
-- ----------------------------
DROP TABLE IF EXISTS `t_attendance`;
CREATE TABLE `t_attendance` (
  `attendanceId` int(11) NOT NULL auto_increment COMMENT '考勤id',
  `attendanceDate` varchar(20) default NULL COMMENT '考勤日期',
  `employeeObj` varchar(30) NOT NULL COMMENT '考勤员工',
  `attendanceStateObj` int(11) NOT NULL COMMENT '考勤结果',
  `attendanceMemo` varchar(800) default NULL COMMENT '考勤备注',
  PRIMARY KEY  (`attendanceId`),
  KEY `employeeObj` (`employeeObj`),
  KEY `attendanceStateObj` (`attendanceStateObj`),
  CONSTRAINT `t_attendance_ibfk_1` FOREIGN KEY (`employeeObj`) REFERENCES `t_employee` (`employeeNo`),
  CONSTRAINT `t_attendance_ibfk_2` FOREIGN KEY (`attendanceStateObj`) REFERENCES `t_attendancestate` (`stateId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_attendance
-- ----------------------------
INSERT INTO `t_attendance` VALUES ('1', '2019-03-05', 'EM001', '2', '迟到了5分钟');

-- ----------------------------
-- Table structure for `t_attendancestate`
-- ----------------------------
DROP TABLE IF EXISTS `t_attendancestate`;
CREATE TABLE `t_attendancestate` (
  `stateId` int(11) NOT NULL auto_increment COMMENT '考勤状态id',
  `stateName` varchar(20) NOT NULL COMMENT '考勤状态名称',
  PRIMARY KEY  (`stateId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_attendancestate
-- ----------------------------
INSERT INTO `t_attendancestate` VALUES ('1', '正常');
INSERT INTO `t_attendancestate` VALUES ('2', '迟到');
INSERT INTO `t_attendancestate` VALUES ('3', '早退');
INSERT INTO `t_attendancestate` VALUES ('4', '旷工');

-- ----------------------------
-- Table structure for `t_buyinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_buyinfo`;
CREATE TABLE `t_buyinfo` (
  `buyId` int(11) NOT NULL auto_increment COMMENT '进货id',
  `productObj` int(11) NOT NULL COMMENT '进货商品',
  `supplierObj` int(11) NOT NULL COMMENT '供应商',
  `price` float NOT NULL COMMENT '进货单价',
  `number` int(11) NOT NULL COMMENT '进货数量',
  `totalPrice` float NOT NULL COMMENT '总价格',
  `buyDate` varchar(20) default NULL COMMENT '进货日期',
  `buyMemo` varchar(800) default NULL COMMENT '进货备注',
  `employeeObj` varchar(30) NOT NULL COMMENT '进货员工',
  PRIMARY KEY  (`buyId`),
  KEY `productObj` (`productObj`),
  KEY `supplierObj` (`supplierObj`),
  KEY `employeeObj` (`employeeObj`),
  CONSTRAINT `t_buyinfo_ibfk_1` FOREIGN KEY (`productObj`) REFERENCES `t_product` (`productId`),
  CONSTRAINT `t_buyinfo_ibfk_2` FOREIGN KEY (`supplierObj`) REFERENCES `t_suppllier` (`supplierId`),
  CONSTRAINT `t_buyinfo_ibfk_3` FOREIGN KEY (`employeeObj`) REFERENCES `t_employee` (`employeeNo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_buyinfo
-- ----------------------------
INSERT INTO `t_buyinfo` VALUES ('1', '1', '1', '150', '20', '3000', '2019-03-01', '11412', 'EM001');
INSERT INTO `t_buyinfo` VALUES ('2', '1', '1', '150', '10', '1500', '2019-03-10', 'test', 'EM001');
INSERT INTO `t_buyinfo` VALUES ('3', '2', '1', '120', '20', '2400', '2019-03-12', '进货了', 'EM001');
INSERT INTO `t_buyinfo` VALUES ('4', '2', '1', '120', '10', '1200', '2019-03-12', '测试进货', 'EM001');
INSERT INTO `t_buyinfo` VALUES ('5', '2', '1', '120', '12', '1440', '2019-03-12', '我来进货一个', 'EM001');

-- ----------------------------
-- Table structure for `t_employee`
-- ----------------------------
DROP TABLE IF EXISTS `t_employee`;
CREATE TABLE `t_employee` (
  `employeeNo` varchar(30) NOT NULL COMMENT 'employeeNo',
  `password` varchar(30) NOT NULL COMMENT '登录密码',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `gender` varchar(4) NOT NULL COMMENT '性别',
  `birthDate` varchar(20) default NULL COMMENT '出生日期',
  `employeePhoto` varchar(60) NOT NULL COMMENT '雇员照片',
  `telephone` varchar(20) NOT NULL COMMENT '联系电话',
  `email` varchar(50) NOT NULL COMMENT '邮箱',
  `address` varchar(80) default NULL COMMENT '家庭地址',
  `regTime` varchar(20) default NULL COMMENT '注册时间',
  PRIMARY KEY  (`employeeNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_employee
-- ----------------------------
INSERT INTO `t_employee` VALUES ('EM001', '123', '双鱼林', '男', '2019-03-01', 'upload/f34dbf84-2975-402b-920a-84c5c53735a1.jpg', '13984019834', 'lingege@163.com', '四川达州', '2019-03-06 11:08:55');
INSERT INTO `t_employee` VALUES ('EM002', '123', '张晓馨', '女', '2019-03-06', 'upload/32319049-0ed3-4942-aba0-f3c91d765ba4.jpg', '13983908342', 'xiaoxing@163.com', '福建南平', '2019-03-12 11:27:47');

-- ----------------------------
-- Table structure for `t_loginfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_loginfo`;
CREATE TABLE `t_loginfo` (
  `logId` int(11) NOT NULL auto_increment COMMENT '日志id',
  `logType` varchar(30) NOT NULL COMMENT '日志类型',
  `logContent` varchar(500) NOT NULL COMMENT '日志内容',
  `logTime` varchar(20) default NULL COMMENT '日志时间',
  PRIMARY KEY  (`logId`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_loginfo
-- ----------------------------
INSERT INTO `t_loginfo` VALUES ('20', '系统登录', '超级管理员a登录系统', '2019-03-13 20:18:53');
INSERT INTO `t_loginfo` VALUES ('21', '系统登录', '普通管理员gl001登录系统', '2019-03-13 20:19:07');
INSERT INTO `t_loginfo` VALUES ('22', '系统登录', '员工EM001登录系统', '2019-03-13 20:19:55');

-- ----------------------------
-- Table structure for `t_lostproduct`
-- ----------------------------
DROP TABLE IF EXISTS `t_lostproduct`;
CREATE TABLE `t_lostproduct` (
  `lostId` int(11) NOT NULL auto_increment COMMENT '记录id',
  `productObj` int(11) NOT NULL COMMENT '丢失物品',
  `lostNumber` int(11) NOT NULL COMMENT '丢失数量',
  `lostTime` varchar(20) default NULL COMMENT '丢失时间',
  `lostPlace` varchar(40) NOT NULL COMMENT '丢失地点',
  `productMoney` float NOT NULL COMMENT '总价值',
  `employeeObj` varchar(30) NOT NULL COMMENT '操作员',
  PRIMARY KEY  (`lostId`),
  KEY `productObj` (`productObj`),
  KEY `employeeObj` (`employeeObj`),
  CONSTRAINT `t_lostproduct_ibfk_1` FOREIGN KEY (`productObj`) REFERENCES `t_product` (`productId`),
  CONSTRAINT `t_lostproduct_ibfk_2` FOREIGN KEY (`employeeObj`) REFERENCES `t_employee` (`employeeNo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_lostproduct
-- ----------------------------
INSERT INTO `t_lostproduct` VALUES ('1', '1', '2', '2019-03-06 11:11:33', '门店超市', '700', 'EM001');
INSERT INTO `t_lostproduct` VALUES ('2', '2', '3', '2019-03-11 23:29:24', '门店超市', '500', 'EM001');

-- ----------------------------
-- Table structure for `t_manager`
-- ----------------------------
DROP TABLE IF EXISTS `t_manager`;
CREATE TABLE `t_manager` (
  `managerUserName` varchar(20) NOT NULL COMMENT 'managerUserName',
  `password` varchar(20) NOT NULL COMMENT '登录密码',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `sex` varchar(4) NOT NULL COMMENT '性别',
  `birthday` varchar(20) default NULL COMMENT '出生日期',
  `telephone` varchar(20) NOT NULL COMMENT '联系电话',
  `managerMemo` varchar(800) default NULL COMMENT '管理备注',
  PRIMARY KEY  (`managerUserName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_manager
-- ----------------------------
INSERT INTO `t_manager` VALUES ('gl001', '123', '王忠', '男', '2019-03-02', '13959342344', 'test');
INSERT INTO `t_manager` VALUES ('gl002', '123', '李二', '男', '2019-03-06', '13984893423', 'test');

-- ----------------------------
-- Table structure for `t_member`
-- ----------------------------
DROP TABLE IF EXISTS `t_member`;
CREATE TABLE `t_member` (
  `memberUserName` varchar(30) NOT NULL COMMENT 'memberUserName',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `gender` varchar(4) NOT NULL COMMENT '性别',
  `birthDate` varchar(20) default NULL COMMENT '出生日期',
  `telephone` varchar(20) NOT NULL COMMENT '联系电话',
  `address` varchar(80) default NULL COMMENT '住宅地址',
  `memberMemo` varchar(800) default NULL COMMENT '会员备注',
  PRIMARY KEY  (`memberUserName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_member
-- ----------------------------
INSERT INTO `t_member` VALUES ('member1', '李明', '男', '2019-03-01', '13539802432', '四川成都红星路13号', 'test');
INSERT INTO `t_member` VALUES ('member2', '王超', '男', '2019-03-06', '13985083423', '四川攀枝花', '高级会员');

-- ----------------------------
-- Table structure for `t_product`
-- ----------------------------
DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product` (
  `productId` int(11) NOT NULL auto_increment COMMENT '商品id',
  `productClassObj` int(11) NOT NULL COMMENT '商品类别',
  `productName` varchar(50) NOT NULL COMMENT '商品名称',
  `mainPhoto` varchar(60) NOT NULL COMMENT '商品主图',
  `productPrice` float NOT NULL COMMENT '商品单价',
  `productCount` int(11) NOT NULL COMMENT '商品库存',
  `productDesc` varchar(5000) NOT NULL COMMENT '商品描述',
  `addTime` varchar(20) default NULL COMMENT '发布时间',
  PRIMARY KEY  (`productId`),
  KEY `productClassObj` (`productClassObj`),
  CONSTRAINT `t_product_ibfk_1` FOREIGN KEY (`productClassObj`) REFERENCES `t_productclass` (`classId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_product
-- ----------------------------
INSERT INTO `t_product` VALUES ('1', '1', '公主家2019春装复古碎花衬衫', 'upload/74e144fa-7370-46d1-a287-152f607ba1c7.jpg', '299', '50', '<ul class=\"attributes-list list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>成分含量:&nbsp;31%(含)-50%(含)</p></li><li><p>袖长:&nbsp;长袖</p></li><li><p>品牌:&nbsp;other/其他</p></li><li><p>货号:&nbsp;132000</p></li><li><p>服装版型:&nbsp;修身</p></li><li><p>风格:&nbsp;百搭</p></li><li><p>穿着方式:&nbsp;开衫</p></li><li><p>组合形式:&nbsp;单件</p></li><li><p>衣长:&nbsp;常规款</p></li><li><p>领型:&nbsp;圆领</p></li><li><p>袖型:&nbsp;荷叶袖</p></li><li><p>图案:&nbsp;纯色</p></li><li><p>服装款式细节:&nbsp;荷叶边 纽扣 蕾丝</p></li><li><p>适用年龄:&nbsp;18-24周岁</p></li><li><p>年份季节:&nbsp;2019年春季</p></li><li><p>颜色分类:&nbsp;粉底花色</p></li><li><p>尺码:&nbsp;S M</p></li></ul><p><br/></p>', '2019-03-06 11:10:04');
INSERT INTO `t_product` VALUES ('2', '1', '娃娃领少女萝莉卫衣2019', 'upload/6a5ac8f3-428a-4254-9ff1-4f128b7c9edb.jpg', '238', '62', '<ul class=\"attributes-list list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>货号:&nbsp;C94WYM</p></li><li><p>服装版型:&nbsp;宽松</p></li><li><p>厚薄:&nbsp;常规</p></li><li><p>风格:&nbsp;甜美</p></li><li><p>甜美:&nbsp;森女</p></li><li><p>款式:&nbsp;套头</p></li><li><p>组合形式:&nbsp;单件</p></li><li><p>衣长:&nbsp;常规</p></li><li><p>袖长:&nbsp;长袖</p></li><li><p>领子:&nbsp;娃娃领</p></li><li><p>袖型:&nbsp;灯笼袖</p></li><li><p>品牌:&nbsp;森女部落</p></li><li><p>图案:&nbsp;字母</p></li><li><p>服装款式细节:&nbsp;绣花 系带 拼接</p></li><li><p>面料材质:&nbsp;棉</p></li><li><p>成分含量:&nbsp;81%(含)-90%(含)</p></li><li><p>适用年龄:&nbsp;18-24周岁</p></li><li><p>年份季节:&nbsp;2019年春季</p></li><li><p>颜色分类:&nbsp;灰蓝色</p></li><li><p>尺码:&nbsp;S M L</p></li></ul><p><br/></p>', '2019-03-11 19:00:37');
INSERT INTO `t_product` VALUES ('3', '3', '洛丽塔萝莉软妹日常连衣裙', 'upload/4f0c4f13-26ba-4d66-a1a4-de5b139e63e6.jpg', '28', '80', '<ul class=\"attributes-list list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>货号:&nbsp;sy0202精灵公主</p></li><li><p>组合形式:&nbsp;假两件</p></li><li><p>裙长:&nbsp;长裙</p></li><li><p>款式:&nbsp;其他/other</p></li><li><p>袖长:&nbsp;七分袖</p></li><li><p>领型:&nbsp;娃娃领</p></li><li><p>袖型:&nbsp;灯笼袖</p></li><li><p>腰型:&nbsp;高腰</p></li><li><p>衣门襟:&nbsp;套头</p></li><li><p>裙型:&nbsp;公主裙</p></li><li><p>图案:&nbsp;花色</p></li><li><p>流行元素/工艺:&nbsp;印花</p></li><li><p>品牌:&nbsp;丝苑汉元素</p></li><li><p>面料:&nbsp;其他</p></li><li><p>材质:&nbsp;麻</p></li><li><p>年份季节:&nbsp;2017年秋季</p></li><li><p>颜色分类:&nbsp;精灵公主假两件</p></li><li><p>尺码:&nbsp;S&nbsp;</p></li></ul><p><br/></p>', '2019-03-12 11:30:11');

-- ----------------------------
-- Table structure for `t_productclass`
-- ----------------------------
DROP TABLE IF EXISTS `t_productclass`;
CREATE TABLE `t_productclass` (
  `classId` int(11) NOT NULL auto_increment COMMENT '类别id',
  `className` varchar(40) NOT NULL COMMENT '类别名称',
  `classDesc` varchar(500) NOT NULL COMMENT '类别描述',
  PRIMARY KEY  (`classId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_productclass
-- ----------------------------
INSERT INTO `t_productclass` VALUES ('1', '上衣', '上衣');
INSERT INTO `t_productclass` VALUES ('2', '裤子', '裤子');
INSERT INTO `t_productclass` VALUES ('3', '裙子', '裙子');
INSERT INTO `t_productclass` VALUES ('4', '内衣', '内衣');

-- ----------------------------
-- Table structure for `t_sell`
-- ----------------------------
DROP TABLE IF EXISTS `t_sell`;
CREATE TABLE `t_sell` (
  `sellId` int(11) NOT NULL auto_increment COMMENT '记录id',
  `sellNo` varchar(20) NOT NULL COMMENT '订单号',
  `productObj` int(11) NOT NULL COMMENT '销售商品',
  `price` float NOT NULL COMMENT '销售价格',
  `number` int(11) NOT NULL COMMENT '销售数量',
  `totalPrice` float NOT NULL COMMENT '销售总价',
  `memberObj` varchar(30) NOT NULL COMMENT '购买会员',
  `employeeObj` varchar(30) NOT NULL COMMENT '销售员工',
  `sellTime` varchar(20) default NULL COMMENT '销售时间',
  PRIMARY KEY  (`sellId`),
  KEY `productObj` (`productObj`),
  KEY `employeeObj` (`employeeObj`),
  KEY `memberObj` (`memberObj`),
  CONSTRAINT `t_sell_ibfk_1` FOREIGN KEY (`productObj`) REFERENCES `t_product` (`productId`),
  CONSTRAINT `t_sell_ibfk_2` FOREIGN KEY (`employeeObj`) REFERENCES `t_employee` (`employeeNo`),
  CONSTRAINT `t_sell_ibfk_3` FOREIGN KEY (`memberObj`) REFERENCES `t_member` (`memberUserName`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sell
-- ----------------------------
INSERT INTO `t_sell` VALUES ('1', 'EM00120190306111113', '1', '350', '2', '700', 'member1', 'EM001', '2019-03-01 11:11:20');
INSERT INTO `t_sell` VALUES ('2', 'EM00120190311223342', '1', '299', '4', '1196', 'member1', 'EM001', '2019-03-02 22:33:42');
INSERT INTO `t_sell` VALUES ('3', 'EM00120190311223342', '2', '238', '2', '476', 'member1', 'EM001', '2019-03-02 22:33:42');
INSERT INTO `t_sell` VALUES ('4', 'EM00120190311230608', '1', '299', '2', '598', 'member1', 'EM001', '2019-03-03 23:06:08');
INSERT INTO `t_sell` VALUES ('5', 'EM00120190311230611', '1', '299', '2', '598', 'member1', 'EM001', '2019-03-04 23:06:11');
INSERT INTO `t_sell` VALUES ('6', 'EM00120190311230618', '1', '299', '2', '598', 'member1', 'EM001', '2019-03-05 23:06:18');
INSERT INTO `t_sell` VALUES ('7', 'EM00120190311230626', '1', '299', '2', '598', 'member1', 'EM001', '2019-03-06 23:06:26');
INSERT INTO `t_sell` VALUES ('8', 'EM00120190311230739', '1', '299', '2', '598', 'member1', 'EM001', '2019-03-07 23:07:39');
INSERT INTO `t_sell` VALUES ('9', 'EM00120190311230739', '2', '238', '1', '238', 'member1', 'EM001', '2019-03-07 23:07:39');
INSERT INTO `t_sell` VALUES ('10', 'EM00120190311230843', '1', '299', '2', '598', 'member1', 'EM001', '2019-03-08 23:08:43');
INSERT INTO `t_sell` VALUES ('11', 'EM00120190311231028', '1', '299', '2', '598', 'member1', 'EM001', '2019-03-09 23:10:28');
INSERT INTO `t_sell` VALUES ('12', 'EM00120190311231028', '2', '238', '1', '238', 'member1', 'EM001', '2019-03-09 23:10:28');
INSERT INTO `t_sell` VALUES ('13', 'EM00120190312111830', '1', '299', '2', '598', 'member1', 'EM001', '2019-03-12 11:18:30');
INSERT INTO `t_sell` VALUES ('14', 'EM00220190312113617', '1', '299', '1', '299', 'member1', 'EM002', '2019-03-12 11:36:17');
INSERT INTO `t_sell` VALUES ('15', 'EM00220190312113617', '3', '28', '2', '56', 'member1', 'EM002', '2019-03-12 11:36:17');

-- ----------------------------
-- Table structure for `t_sellcart`
-- ----------------------------
DROP TABLE IF EXISTS `t_sellcart`;
CREATE TABLE `t_sellcart` (
  `sellCartId` int(11) NOT NULL auto_increment COMMENT '购物车id',
  `employeeObj` varchar(30) NOT NULL COMMENT '员工',
  `productObj` int(11) NOT NULL COMMENT '商品',
  `productCount` int(11) NOT NULL COMMENT '商品数量',
  PRIMARY KEY  (`sellCartId`),
  KEY `employeeObj` (`employeeObj`),
  KEY `productObj` (`productObj`),
  CONSTRAINT `t_sellcart_ibfk_1` FOREIGN KEY (`employeeObj`) REFERENCES `t_employee` (`employeeNo`),
  CONSTRAINT `t_sellcart_ibfk_2` FOREIGN KEY (`productObj`) REFERENCES `t_product` (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sellcart
-- ----------------------------

-- ----------------------------
-- Table structure for `t_suppllier`
-- ----------------------------
DROP TABLE IF EXISTS `t_suppllier`;
CREATE TABLE `t_suppllier` (
  `supplierId` int(11) NOT NULL auto_increment COMMENT '供应商id',
  `supplierName` varchar(20) NOT NULL COMMENT '供应商名称',
  `supplierLawyer` varchar(20) NOT NULL COMMENT '法人代表',
  `supplierTelephone` varchar(20) NOT NULL COMMENT '供应商电话',
  `supplierAddress` varchar(80) NOT NULL COMMENT '供应商地址',
  PRIMARY KEY  (`supplierId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_suppllier
-- ----------------------------
INSERT INTO `t_suppllier` VALUES ('1', '四川服装供应商总代理', '王强', '028-83948083', '四川成都建设路');

-- ----------------------------
-- Table structure for `t_ziliao`
-- ----------------------------
DROP TABLE IF EXISTS `t_ziliao`;
CREATE TABLE `t_ziliao` (
  `ziliaoId` int(11) NOT NULL auto_increment COMMENT '资料id',
  `title` varchar(60) NOT NULL COMMENT '标题',
  `content` varchar(8000) NOT NULL COMMENT '描述',
  `ziliaoFile` varchar(60) NOT NULL COMMENT '资料文件',
  `addTime` varchar(20) default NULL COMMENT '添加时间',
  PRIMARY KEY  (`ziliaoId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_ziliao
-- ----------------------------
INSERT INTO `t_ziliao` VALUES ('1', '员工手册文件', '<p>为了方便门店的管理，我们门店的员工制度规则，请下载阅读！</p><p><br/></p>', 'upload/9b4efb2f-6b24-4988-a26b-c221379104ff.doc', '2019-03-06 11:12:19');
