/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 50505
 Source Host           : localhost
 Source Database       : avation

 Target Server Type    : MySQL
 Target Server Version : 50505
 File Encoding         : utf-8

 Date: 01/10/2016 22:23:37 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `air_line`
-- ----------------------------
DROP TABLE IF EXISTS `air_line`;
CREATE TABLE `air_line` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` varchar(255) NOT NULL,
  `start_point` varchar(255) NOT NULL,
  `end_point` varchar(255) NOT NULL,
  `brandNum` varchar(255) NOT NULL,
  `airline_company` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `landTime` varchar(255) DEFAULT NULL,
  `seat` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `air_line`
-- ----------------------------
BEGIN;
INSERT INTO `air_line` VALUES ('3', '2016-01-12', '长沙黄花机场', '石家庄机场', 'SH2016010709', '南航公司', '878.2', null, '12'), ('4', '2016-01-08', '乌鲁木齐机场', '广州白云机场', 'SN2016010802', '南航公司', '123.45', null, '23'), ('5', '2016-01-08', '深圳宝安机场', '北京西苑机场', 'SZ2016010801', '深圳航空', '1100.1', null, '34'), ('6', '2016-01-09', '成都机场', '贵阳阳明堡机场', 'CN20160101907', '中国航空', '678.01', null, '33'), ('7', '2016-01-10', '遵义机场', '怀化芷江机场', 'SN2016010904', '南方航空', '908.01', null, '31'), ('8', '2016-01-10', '长沙黄花机场', '厦门机场', 'XM2016011009', '厦门航空', '188.2', null, '8'), ('9', '2016-01-10', '三亚机场', '沈阳机场', 'HN2016011008', '海南航空', '908.3', null, '129'), ('10', '2016-01-11 ', '上海国际机场', '深圳宝安机场', 'SZ20160111', '南航公司', '458.8', null, '90'), ('30', '2016-01-19', '深圳宝安机场', '哈尔滨机场', 'SY2016011902', '南航公司', '398.3', '14:45', '233');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
