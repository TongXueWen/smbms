/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50555
Source Host           : 127.0.0.1:3306
Source Database       : smbms

Target Server Type    : MYSQL
Target Server Version : 50555
File Encoding         : 65001

Date: 2019-04-19 17:54:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for smbms_address
-- ----------------------------
DROP TABLE IF EXISTS `smbms_address`;
CREATE TABLE `smbms_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `contact` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '联系人姓名',
  `addressDesc` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '收货地址明细',
  `postCode` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮编',
  `tel` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '联系人电话',
  `createdBy` bigint(20) DEFAULT NULL COMMENT '创建者',
  `creationDate` datetime DEFAULT NULL COMMENT '创建时间',
  `modifyBy` bigint(20) DEFAULT NULL COMMENT '修改者',
  `modifyDate` datetime DEFAULT NULL COMMENT '修改时间',
  `userId` bigint(20) DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of smbms_address
-- ----------------------------
INSERT INTO `smbms_address` VALUES ('1', '王丽', '北京市东城区东交民巷44号', '100010', '13678789999', '1', '2016-04-13 00:00:00', null, null, '1');
INSERT INTO `smbms_address` VALUES ('2', '张红丽', '北京市海淀区丹棱街3号', '100000', '18567672312', '1', '2016-04-13 00:00:00', null, null, '1');
INSERT INTO `smbms_address` VALUES ('3', '任志强', '北京市东城区美术馆后街23号', '100021', '13387906742', '1', '2016-04-13 00:00:00', null, null, '1');
INSERT INTO `smbms_address` VALUES ('4', '曹颖', '北京市朝阳区朝阳门南大街14号', '100053', '13568902323', '1', '2016-04-13 00:00:00', null, null, '2');
INSERT INTO `smbms_address` VALUES ('5', '李慧', '北京市西城区三里河路南三巷3号', '100032', '18032356666', '1', '2016-04-13 00:00:00', null, null, '3');
INSERT INTO `smbms_address` VALUES ('6', '王国强', '北京市顺义区高丽营镇金马工业区18号', '100061', '13787882222', '1', '2016-04-13 00:00:00', null, null, '3');

-- ----------------------------
-- Table structure for smbms_bill
-- ----------------------------
DROP TABLE IF EXISTS `smbms_bill`;
CREATE TABLE `smbms_bill` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `billCode` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '账单编码',
  `productName` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '商品名称',
  `productDesc` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '商品描述',
  `productUnit` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '商品单位',
  `productCount` decimal(20,2) DEFAULT NULL COMMENT '商品数量',
  `totalPrice` decimal(20,2) DEFAULT NULL COMMENT '商品总额',
  `isPayment` int(10) DEFAULT NULL COMMENT '是否支付（1：未支付 2：已支付）',
  `createdBy` bigint(20) DEFAULT NULL COMMENT '创建者（userId）',
  `creationDate` datetime DEFAULT NULL COMMENT '创建时间',
  `modifyBy` bigint(20) DEFAULT NULL COMMENT '更新者（userId）',
  `modifyDate` datetime DEFAULT NULL COMMENT '更新时间',
  `providerId` int(20) DEFAULT NULL COMMENT '供应商ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of smbms_bill
-- ----------------------------
INSERT INTO `smbms_bill` VALUES ('1', 'BILL2016_001', '洗发水、护发素', '日用品-洗发、护发', '瓶', '500.00', '25000.00', '2', '1', '2014-12-14 13:02:03', '15', '2019-04-16 21:43:12', '13');
INSERT INTO `smbms_bill` VALUES ('2', 'BILL2016_002', '香皂、肥皂、药皂', '日用品-皂类', '块', '1000.00', '10000.00', '2', '1', '2016-03-23 04:20:40', null, null, '13');
INSERT INTO `smbms_bill` VALUES ('3', 'BILL2016_003', '大豆油', '食品-食用油', '斤', '300.00', '5890.00', '2', '1', '2014-12-14 13:02:03', null, null, '6');
INSERT INTO `smbms_bill` VALUES ('4', 'BILL2016_004', '橄榄油', '食品-进口食用油', '斤', '200.00', '9800.00', '2', '1', '2013-10-10 03:12:13', null, null, '7');
INSERT INTO `smbms_bill` VALUES ('5', 'BILL2016_005', '洗洁精', '日用品-厨房清洁', '瓶', '500.00', '7000.00', '2', '1', '2014-12-14 13:02:03', null, null, '9');
INSERT INTO `smbms_bill` VALUES ('6', 'BILL2016_006', '美国大杏仁', '食品-坚果', '袋', '300.00', '5000.00', '2', '1', '2016-04-14 06:08:09', null, null, '4');
INSERT INTO `smbms_bill` VALUES ('7', 'BILL2016_007', '沐浴液、精油', '日用品-沐浴类', '瓶', '500.00', '23000.00', '1', '1', '2016-07-22 10:10:22', null, null, '14');
INSERT INTO `smbms_bill` VALUES ('8', 'BILL2016_008', '不锈钢盘碗', '日用品-厨房用具', '个', '600.00', '6000.00', '2', '1', '2016-04-14 05:12:13', null, null, '14');
INSERT INTO `smbms_bill` VALUES ('9', 'BILL2016_009', '塑料杯', '日用品-杯子', '个', '350.00', '1750.00', '2', '1', '2016-02-04 11:40:20', null, null, '14');
INSERT INTO `smbms_bill` VALUES ('10', 'BILL2016_010', '豆瓣酱', '食品-调料', '瓶', '200.00', '2000.00', '2', '1', '2013-10-29 05:07:03', null, null, '8');
INSERT INTO `smbms_bill` VALUES ('11', 'BILL2016_011', '海之蓝', '饮料-国酒', '瓶', '50.00', '10000.00', '1', '1', '2016-04-14 16:16:00', null, null, '1');
INSERT INTO `smbms_bill` VALUES ('12', 'BILL2016_012', '芝华士', '饮料-洋酒', '瓶', '20.00', '6000.00', '1', '1', '2016-09-09 17:00:00', null, null, '1');
INSERT INTO `smbms_bill` VALUES ('13', 'BILL2016_013', '长城红葡萄酒', '饮料-红酒', '瓶', '60.00', '800.00', '2', '1', '2016-11-14 15:23:00', null, null, '1');
INSERT INTO `smbms_bill` VALUES ('14', 'BILL2016_014', '泰国香米', '食品-大米', '斤', '400.00', '5000.00', '2', '1', '2016-10-09 15:20:00', null, null, '3');
INSERT INTO `smbms_bill` VALUES ('15', 'BILL2016_015', '东北大米', '食品-大米', '斤', '600.00', '4000.00', '2', '1', '2016-11-14 14:00:00', null, null, '3');
INSERT INTO `smbms_bill` VALUES ('16', 'BILL2016_016', '可口可乐', '饮料', '瓶', '2000.00', '6000.00', '2', '1', '2012-03-27 13:03:01', null, null, '2');
INSERT INTO `smbms_bill` VALUES ('17', 'BILL2016_017', '脉动', '饮料', '瓶', '1500.00', '4500.00', '2', '1', '2016-05-10 12:00:00', null, null, '2');

-- ----------------------------
-- Table structure for smbms_provider
-- ----------------------------
DROP TABLE IF EXISTS `smbms_provider`;
CREATE TABLE `smbms_provider` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `proCode` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '供应商编码',
  `proName` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '供应商名称',
  `proDesc` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '供应商详细描述',
  `proContact` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '供应商联系人',
  `proPhone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '联系电话',
  `proAddress` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '地址',
  `proFax` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '传真',
  `createdBy` bigint(20) DEFAULT NULL COMMENT '创建者（userId）',
  `creationDate` datetime DEFAULT NULL COMMENT '创建时间',
  `modifyDate` datetime DEFAULT NULL COMMENT '更新时间',
  `modifyBy` bigint(20) DEFAULT NULL COMMENT '更新者（userId）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of smbms_provider
-- ----------------------------
INSERT INTO `smbms_provider` VALUES ('1', 'BJ_GYS001', '北京三木堂商贸有限公司', '长期合作伙伴，主营产品:茅台、五粮液、郎酒、酒鬼酒、泸州老窖、赖茅酒、法国红酒等', '张国强', '13566669999', '北京市丰台区育芳园北路', '010-58858787', '1', '2013-03-21 16:52:07', '2019-04-12 16:44:03', '10');
INSERT INTO `smbms_provider` VALUES ('2', 'HB_GYS001', '石家庄帅益食品贸易有限公司', '长期合作伙伴，主营产品:饮料、水饮料、植物蛋白饮料、休闲食品、果汁饮料、功能饮料等', '王军', '13309094212', '河北省石家庄新华区', '0311-67738876', '1', '2016-04-13 04:20:40', null, null);
INSERT INTO `smbms_provider` VALUES ('3', 'GZ_GYS001', '深圳市泰香米业有限公司', '初次合作伙伴，主营产品：良记金轮米,龙轮香米等', '郑程瀚', '13402013312', '广东省深圳市福田区深南大道6006华丰大厦', '0755-67776212', '1', '2014-03-21 16:56:07', null, null);
INSERT INTO `smbms_provider` VALUES ('4', 'GZ_GYS002', '深圳市喜来客商贸有限公司', '长期合作伙伴，主营产品：坚果炒货.果脯蜜饯.天然花茶.营养豆豆.特色美食.进口食品.海味零食.肉脯肉', '林妮', '18599897645', '广东省深圳市福龙工业区B2栋3楼西', '0755-67772341', '1', '2013-03-22 16:52:07', null, null);
INSERT INTO `smbms_provider` VALUES ('5', 'JS_GYS001', '兴化佳美调味品厂', '长期合作伙伴，主营产品：天然香辛料、鸡精、复合调味料', '徐国洋', '13754444221', '江苏省兴化市林湖工业区', '0523-21299098', '1', '2015-11-22 16:52:07', null, null);
INSERT INTO `smbms_provider` VALUES ('6', 'BJ_GYS002', '北京纳福尔食用油有限公司', '长期合作伙伴，主营产品：山茶油、大豆油、花生油、橄榄油等', '马莺', '13422235678', '北京市朝阳区珠江帝景1号楼', '010-588634233', '1', '2012-03-21 17:52:07', null, null);
INSERT INTO `smbms_provider` VALUES ('7', 'BJ_GYS003', '北京国粮食用油有限公司', '初次合作伙伴，主营产品：花生油、大豆油、小磨油等', '王驰', '13344441135', '北京大兴青云店开发区', '010-588134111', '1', '2016-04-13 00:00:00', null, null);
INSERT INTO `smbms_provider` VALUES ('8', 'ZJ_GYS001', '慈溪市广和绿色食品厂', '长期合作伙伴，主营产品：豆瓣酱、黄豆酱、甜面酱，辣椒，大蒜等农产品', '薛圣丹', '18099953223', '浙江省宁波市慈溪周巷小安村', '0574-34449090', '1', '2013-11-21 06:02:07', null, null);
INSERT INTO `smbms_provider` VALUES ('9', 'GX_GYS001', '优百商贸有限公司', '长期合作伙伴，主营产品：日化产品', '李立国', '13323566543', '广西南宁市秀厢大道42-1号', '0771-98861134', '1', '2013-03-21 19:52:07', null, null);
INSERT INTO `smbms_provider` VALUES ('10', 'JS_GYS002', '南京火头军信息技术有限公司', '长期合作伙伴，主营产品：不锈钢厨具等', '陈女士', '13098992113', '江苏省南京市浦口区浦口大道1号新城总部大厦A座903室', '025-86223345', '1', '2013-03-25 16:52:07', null, null);
INSERT INTO `smbms_provider` VALUES ('11', 'GZ_GYS003', '广州市白云区美星五金制品厂', '长期合作伙伴，主营产品：海绵床垫、坐垫、靠垫、海绵枕头、头枕等', '梁天', '13562276775', '广州市白云区钟落潭镇福龙路20号', '020-85542231', '1', '2016-12-21 06:12:17', null, null);
INSERT INTO `smbms_provider` VALUES ('12', 'BJ_GYS004', '北京隆盛日化科技', '长期合作伙伴，主营产品：日化环保清洗剂，家居洗涤专卖、洗涤用品网、墙体除霉剂、墙面霉菌清除剂等', '孙欣', '13689865678', '北京市大兴区旧宫', '010-35576786', '1', '2014-11-21 12:51:11', null, null);
INSERT INTO `smbms_provider` VALUES ('13', 'SD_GYS001', '山东豪克华光联合发展有限公司', '长期合作伙伴，主营产品：洗衣皂、洗衣粉、洗衣液、洗洁精、消杀类、香皂等', '吴洪转', '13245468787', '山东济阳济北工业区仁和街21号', '0531-53362445', '1', '2015-01-28 10:52:07', null, null);

-- ----------------------------
-- Table structure for smbms_role
-- ----------------------------
DROP TABLE IF EXISTS `smbms_role`;
CREATE TABLE `smbms_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `roleCode` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '角色编码',
  `roleName` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '角色名称',
  `createdBy` bigint(20) DEFAULT NULL COMMENT '创建者',
  `creationDate` datetime DEFAULT NULL COMMENT '创建时间',
  `modifyBy` bigint(20) DEFAULT NULL COMMENT '修改者',
  `modifyDate` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of smbms_role
-- ----------------------------
INSERT INTO `smbms_role` VALUES ('1', 'SMBMS_ADMIN', '系统管理员', '1', '2016-04-13 00:00:00', null, null);
INSERT INTO `smbms_role` VALUES ('2', 'SMBMS_MANAGER', '经理', '1', '2016-04-13 00:00:00', null, null);
INSERT INTO `smbms_role` VALUES ('3', 'SMBMS_EMPLOYEE', '普通员工', '1', '2016-04-13 00:00:00', null, null);

-- ----------------------------
-- Table structure for smbms_user
-- ----------------------------
DROP TABLE IF EXISTS `smbms_user`;
CREATE TABLE `smbms_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `userCode` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户编码',
  `userName` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户名称',
  `userPassword` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户密码',
  `gender` int(10) DEFAULT NULL COMMENT '性别（1:女、 2:男）',
  `birthday` date DEFAULT NULL COMMENT '出生日期',
  `phone` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手机',
  `address` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '地址',
  `userRole` int(10) DEFAULT NULL COMMENT '用户角色（取自角色表-角色id）',
  `createdBy` bigint(20) DEFAULT NULL COMMENT '创建者（userId）',
  `creationDate` datetime DEFAULT NULL COMMENT '创建时间',
  `modifyBy` bigint(20) DEFAULT NULL COMMENT '更新者（userId）',
  `modifyDate` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of smbms_user
-- ----------------------------
INSERT INTO `smbms_user` VALUES ('1', 'wen', '系统管理员', '123', '1', '1997-01-01', '15200981234', '湖南省衡阳市蒸湘区南华大学', '1', '1', '2019-04-07 10:15:55', null, null);
INSERT INTO `smbms_user` VALUES ('5', 'hanlubiao', '韩路彪', '0000000', '2', '1984-06-05', '18567542321', '北京市朝阳区北辰中心12号', '2', '1', '2014-12-31 19:52:09', null, null);
INSERT INTO `smbms_user` VALUES ('6', 'zhanghua', '张华', '0000000', '1', '1983-06-15', '13544561111', '北京市海淀区学院路61号', '3', '1', '2013-02-11 10:51:17', null, null);
INSERT INTO `smbms_user` VALUES ('7', 'wangyang', '王洋', '0000000', '2', '1982-12-31', '13444561124', '北京市海淀区西二旗辉煌国际16层', '3', '1', '2014-06-11 19:09:07', null, null);
INSERT INTO `smbms_user` VALUES ('8', 'zhaoyan', '赵燕', '0000000', '1', '1986-03-07', '18098764545', '北京市海淀区回龙观小区10号楼', '3', '1', '2016-04-21 13:54:07', null, null);
INSERT INTO `smbms_user` VALUES ('10', 'sunlei', '孙磊', '0000000', '2', '1981-01-04', '13387676765', '北京市朝阳区管庄新月小区12楼', '3', '1', '2015-05-06 10:52:07', null, null);
INSERT INTO `smbms_user` VALUES ('11', 'sunxing', '孙兴', '0000000', '2', '1978-03-12', '13367890900', '北京市朝阳区建国门南大街10号', '3', '1', '2016-11-09 16:51:17', null, null);
INSERT INTO `smbms_user` VALUES ('12', 'zhangchen', '张晨', '0000000', '1', '1986-03-28', '18098765434', '朝阳区管庄路口北柏林爱乐三期13号楼', '3', '1', '2016-08-09 05:52:37', '1', '2016-04-14 14:15:36');
INSERT INTO `smbms_user` VALUES ('13', 'dengchao', '邓超', '0000000', '2', '1981-11-04', '13689674534', '北京市海淀区北航家属院10号楼', '3', '1', '2016-07-11 08:02:47', null, null);
INSERT INTO `smbms_user` VALUES ('14', 'yangguo', '杨过', '0000000', '2', '1980-01-01', '13388886623', '北京市朝阳区北苑家园茉莉园20号楼', '3', '1', '2015-02-01 03:52:07', null, null);
INSERT INTO `smbms_user` VALUES ('15', 'test', 'test', '111', '1', '2019-04-16', '123456789', '南华大学', '1', '1', '2019-04-16 19:52:37', null, null);
