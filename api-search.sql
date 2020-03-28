/*
Navicat MySQL Data Transfer

Source Server         : localhostTest
Source Server Version : 50547
Source Host           : localhost:3306
Source Database       : api-search

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2020-03-20 17:03:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adminid` int(12) NOT NULL AUTO_INCREMENT COMMENT '管理员编号',
  `adminuname` varchar(30) DEFAULT NULL COMMENT '管理员用户名',
  `adminpwd` varchar(18) DEFAULT NULL COMMENT '密码',
  `name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `adminrole` int(2) DEFAULT '1' COMMENT '管理员权限(0:超级管理员 1:管理员)  ',
  `adminphone` varchar(11) DEFAULT NULL COMMENT '管理员手机号码',
  `idno` varchar(20) DEFAULT NULL COMMENT '身份证号',
  `sex` char(2) DEFAULT NULL COMMENT '性别(1: 男  2  : 女)',
  `addrs` varchar(100) DEFAULT NULL COMMENT '住址',
  `pic` varchar(100) DEFAULT NULL COMMENT '照片路径',
  PRIMARY KEY (`adminid`)
) ENGINE=InnoDB AUTO_INCREMENT=2047 DEFAULT CHARSET=utf8mb4 COMMENT='管理员(用户)(教练员)数据表';

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('2009', 'zyx', '111111', '张艺兴', '2', '15588854534', '372925198812181726', '1', '北京', null);
INSERT INTO `admin` VALUES ('2011', 'dad', '111111', 'dadad', '1', '15511111111', '372925197712191828', '1', 'sasdsd', '/top20190314171148.png');
INSERT INTO `admin` VALUES ('2012', 'ww', '111111', 'www', '1', '15511111112', '372925197712191823', '1', 'wdwwad', '/top20190314171435.jpg');
INSERT INTO `admin` VALUES ('2013', 'da', '111111', 'da', '1', '15555555555', '372925197712191826', '1', '222', '/top20190314171743.png');
INSERT INTO `admin` VALUES ('2014', '22', '111111', '22', '2', '15566666666', '372925197712191887', '2', '而我打撒大撒', '/top20190314172115.png');
INSERT INTO `admin` VALUES ('2015', '88888888', '111111', 'wdsa', '1', '15588889999', '', '1', 'dasd', '/top20190314172624.png');
INSERT INTO `admin` VALUES ('2016', 'ada', '111111', 'dada', '2', '15566667777', '372925197712191834', '1', '我去打球我去', '/top20190314172948.jpg');
INSERT INTO `admin` VALUES ('2017', '0000000000000000', '111111', 'adasd', '1', '15566667778', '372925197712191834', '1', 'das', '/top20190314173509.jpg');
INSERT INTO `admin` VALUES ('2018', 'qwer', '111111', 'qwer', '2', '15588889998', '372925197712191822', '1', 'wdw', '/top20190314174805.png');
INSERT INTO `admin` VALUES ('2019', 'wewe', '111111', 'wew', '1', '15566666699', '372925197712191889', '1', 'qq', '/top20190314174910.png');
INSERT INTO `admin` VALUES ('2020', 'ewe', '111111', '121', '2', '15566666600', '372925197712191821', '2', 'wewq', '/top20190314175639.jpg');
INSERT INTO `admin` VALUES ('2021', 'dsaasd', '111111', 'dsad', '2', '15588889993', '372925197712191828', '2', 'ada', '/top20190314175846.jpg');
INSERT INTO `admin` VALUES ('2023', 'adasdas', '111111', 'dadada', '2', '15544443333', '37292519771219182x', '2', 'adada', '/top20190314202501.jpg');
INSERT INTO `admin` VALUES ('2025', 'qaz', '111111', 'dadasdassd', '2', '14443332222', '372925197712191834', '1', 'adwd', '/top20190314203010.jpg');
INSERT INTO `admin` VALUES ('2026', 'dasda', '111111', 'dadas', '2', '15577777777', '372925197712191826', '1', 'as', '/top20190314204418.jpg');
INSERT INTO `admin` VALUES ('2027', 'admin', '111111', '管理员', '0', null, null, '1', null, null);
INSERT INTO `admin` VALUES ('2028', 'dwdwd', '111111', 'dwdwd', '2', '15559990000', '372925197712191826', '1', 'ad', null);
INSERT INTO `admin` VALUES ('2029', 'gfghhvh', '111111', 'yyyyghb', '2', '15557778899', '372925197712191822', '1', 'asdasd', null);
INSERT INTO `admin` VALUES ('2030', '0000000', '111111', 'dadadd', '2', '15500009999', '372925197712191821', '1', 'sdasda', null);
INSERT INTO `admin` VALUES ('2031', '1qaz', '111111', '1qaz', '2', '13233344445', '372925197712191834', '1', 'ssas', '/top20190314211746.jpg');
INSERT INTO `admin` VALUES ('2032', 'dadadada11', '111111', 'dada', '2', '17776668889', '372925197712191889', '1', 'adadsad', '/top20190314212047.jpg');
INSERT INTO `admin` VALUES ('2033', 'qqq', '111111', 'qqq', '2', '15566667775', '37292519771219182x', '1', 'dada', '/top20190314212333.jpg');
INSERT INTO `admin` VALUES ('2034', 'qqq111', null, '迪丽热牛1111', '2', '15566667775', '37292519771219182x', '1', 'dada', '/top20190315142530.jpg');
INSERT INTO `admin` VALUES ('2035', 'adass', '111111', 'dassdas', '1', '15677777777', '372925197712191834', '1', 'sasdsds', null);
INSERT INTO `admin` VALUES ('2036', 'dwd', '111111', 'asdsad', '2', '15455555555', '37292519771219182x', '1', 'qw', null);
INSERT INTO `admin` VALUES ('2037', 'dasdassd', '111111', 'dadas', '1', '15566669898', '372925197712191826', '1', 'asdasd', null);
INSERT INTO `admin` VALUES ('2038', 'wdqqwdwq', '111111', 'wdwdwq', '1', '15567767777', '372925197712191826', '1', '11w1', '/top20190318222658.jpg');
INSERT INTO `admin` VALUES ('2039', 'dawdad', '111111', 'dada', '1', '15566665656', '372925197712191887', '1', '313', '/top20190318222850.jpg');
INSERT INTO `admin` VALUES ('2040', 'qwerrrt', '111111', '刘得花', '2', '15611112222', '37292519771219182x', '1', '香港', null);
INSERT INTO `admin` VALUES ('2041', '12345y', '111111', '周星驰', '2', '15677778888', '372925197712191889', '1', '123456', '/top20190323230236.jpg');
INSERT INTO `admin` VALUES ('2042', '112121', '111111', '312312312', '2', '15566677788', '372925197712191821', '1', '我的武器多钱我都', '/top20190323231208.jpg');
INSERT INTO `admin` VALUES ('2043', 'lixiaolu', '111111', '李小璐', '2', '18899990000', '37292519771219182x', '2', 'asdasd', '/top20190323231617.jpg');
INSERT INTO `admin` VALUES ('2044', 'dasdasdasdsa', '111111', '六小龄童', '2', '13222212222', '372925197712191834', '1', 'dadaw', '/top20190323231727.jpg');
INSERT INTO `admin` VALUES ('2045', 'sadasdas', '111111', 'wangxiaohu2', '2', '17766666111', '372925197712191826', '1', 'swqdsqw', '/top20190410155900.jpg');
INSERT INTO `admin` VALUES ('2046', 'dasdas', '111111', 'dadadada', '1', '15643432424', '372925198812181719', '2', 'dasdassdasd', '/top20190410160046.jpg');

-- ----------------------------
-- Table structure for feedback
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `fbid` int(12) NOT NULL AUTO_INCREMENT COMMENT '意见反馈编号',
  `fbcontent` varchar(255) NOT NULL COMMENT '反馈内容',
  `fbtime` datetime NOT NULL COMMENT '反馈时间',
  `fbuname` varchar(20) DEFAULT NULL COMMENT '用户名',
  `userid` int(12) NOT NULL COMMENT '反馈用户ID',
  PRIMARY KEY (`fbid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of feedback
-- ----------------------------
INSERT INTO `feedback` VALUES ('1', '真的不错', '2018-10-16 14:09:53', 'user1001', '1');
INSERT INTO `feedback` VALUES ('2', '学习有进步', '2018-10-09 14:10:53', 'user1003', '11');
INSERT INTO `feedback` VALUES ('3', '我觉得我非常帅\n', '2018-10-27 23:40:21', 'admin', '1');
INSERT INTO `feedback` VALUES ('4', 'dadadadada', '2018-10-27 23:50:25', 'admin', '1');
INSERT INTO `feedback` VALUES ('5', 'adadwdwdwdwd', '2018-10-27 23:50:39', 'admin', '1');
INSERT INTO `feedback` VALUES ('6', '2222222222222222222', '2018-10-27 23:57:42', 'admin', '1');
INSERT INTO `feedback` VALUES ('7', 'vhgfh mf', '2019-03-05 22:45:34', 'admin', '0');

-- ----------------------------
-- Table structure for tb_api
-- ----------------------------
DROP TABLE IF EXISTS `tb_api`;
CREATE TABLE `tb_api` (
  `apiid` int(12) NOT NULL AUTO_INCREMENT COMMENT 'API唯一标识 自动编号 主键',
  `sname` varchar(100) NOT NULL,
  `url` varchar(255) DEFAULT NULL COMMENT '调用地址',
  `returnDataFormat` char(2) NOT NULL COMMENT '返回的数据格式，如：0:json、1:XML',
  `returnData` varchar(50) DEFAULT NULL COMMENT '返回的结果对象名，方便从返回结果中解析出输出参数',
  `requestMode` char(2) DEFAULT NULL COMMENT '0:Get  1:Put 2:Post 3:Delete  4: Options 5:HEAD',
  `requestExample` text COMMENT '请求示例',
  `remark` text COMMENT '备注',
  `exeStateObj` varchar(200) DEFAULT NULL COMMENT '返回的执行状态名，方便查询执行状态。如状态码或状态提示',
  `apiTypeTag` varchar(100) DEFAULT NULL COMMENT 'API类型标签，可标注多个，如：用户管理、毕业设计过程、校外实习申请等',
  PRIMARY KEY (`apiid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_api
-- ----------------------------
INSERT INTO `tb_api` VALUES ('1', 'aliyun', 'https://maven.aliyun.com/mvn/view', '0', 'Api', '2', null, '测试接口', '0', '用户管理');

-- ----------------------------
-- Table structure for tb_exception
-- ----------------------------
DROP TABLE IF EXISTS `tb_exception`;
CREATE TABLE `tb_exception` (
  `apiid` int(12) NOT NULL COMMENT 'API唯一标识  tb_api(APIID) 主键属性',
  `excName` varchar(50) NOT NULL COMMENT '异常名，API范围内唯一标识 主键属性',
  `excValue` varchar(10) DEFAULT NULL,
  `excMsg` varchar(50) DEFAULT NULL,
  `excType` char(10) DEFAULT NULL COMMENT '异常类型，如服务级错误（可能需重新输入）、系统异常、网络异常、平台系统级错误（权限错误）',
  PRIMARY KEY (`apiid`,`excName`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='异常基本信息表（tb_exception）';

-- ----------------------------
-- Records of tb_exception
-- ----------------------------

-- ----------------------------
-- Table structure for tb_inputparam
-- ----------------------------
DROP TABLE IF EXISTS `tb_inputparam`;
CREATE TABLE `tb_inputparam` (
  `apiid` int(12) NOT NULL COMMENT 'API唯一标识  tb_api(APIID) 主键属性',
  `pname` varchar(100) NOT NULL COMMENT '参数名，同一个API中唯一 主键属性',
  `datetype` varchar(50) DEFAULT NULL COMMENT '数据类型，可能是类名，也可能是基本数据类型',
  `pformat` varchar(50) DEFAULT NULL COMMENT '参数值的格式，如，时间类型采用的时间格式、数值型采用的单位、字符型采用的不同简称等。',
  `parentParam` varchar(50) DEFAULT NULL COMMENT '父参数名，参数可以嵌套',
  `isSet` char(10) DEFAULT NULL COMMENT '是否是集合参数，即若干元素的集合，若为true，否则为false.',
  `required` char(10) DEFAULT NULL COMMENT '是否为必填项，若是为true，否则为false',
  `preset` varchar(2) DEFAULT NULL COMMENT '该参数值是否需要预设（将一个实际API拆分成若干理想API时使用）',
  PRIMARY KEY (`apiid`,`pname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='输入参数基本信息';

-- ----------------------------
-- Records of tb_inputparam
-- ----------------------------

-- ----------------------------
-- Table structure for tb_outputparam
-- ----------------------------
DROP TABLE IF EXISTS `tb_outputparam`;
CREATE TABLE `tb_outputparam` (
  `apiid` int(12) NOT NULL COMMENT 'API唯一标识  tb_api(APIID) 主键属性',
  `pname` varchar(100) NOT NULL COMMENT '参数名，同一个API中唯一 主键属性',
  `datetype` varchar(50) DEFAULT NULL COMMENT '数据类型，可能是类名，也可能是基本数据类型',
  `pformat` varchar(50) DEFAULT NULL COMMENT '参数值的格式，如，时间类型采用的时间格式、数值型采用的单位、字符型采用的不同简称等。',
  `parentParam` varchar(50) DEFAULT NULL COMMENT '父参数名，参数可以嵌套',
  `isSet` char(10) DEFAULT NULL COMMENT '是否是集合参数，即若干元素的集合，若是为true，否则为false.',
  `preset` char(2) DEFAULT NULL COMMENT '该参数值是否需要预设（将一个实际API拆分成若干理想API时使用）',
  PRIMARY KEY (`apiid`,`pname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_outputparam
-- ----------------------------

-- ----------------------------
-- Table structure for tb_service
-- ----------------------------
DROP TABLE IF EXISTS `tb_service`;
CREATE TABLE `tb_service` (
  `sname` varchar(100) NOT NULL COMMENT '所属服务名（在注册中心服务器注册的名字）主键',
  `provider` varchar(100) DEFAULT NULL COMMENT '	供应商',
  `providerUrl` varchar(255) DEFAULT NULL COMMENT '供应商地址',
  `remark` text COMMENT '备注',
  PRIMARY KEY (`sname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tb_service
-- ----------------------------
