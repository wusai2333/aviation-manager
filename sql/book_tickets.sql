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

 Date: 01/10/2016 22:23:45 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `book_tickets`
-- ----------------------------
DROP TABLE IF EXISTS `book_tickets`;
CREATE TABLE `book_tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brandNum` varchar(255) NOT NULL,
  `orderId` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `cardId` varchar(255) NOT NULL,
  `start_point` varchar(255) NOT NULL,
  `end_point` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `seat` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `book_tickets`
-- ----------------------------
BEGIN;
INSERT INTO `book_tickets` VALUES ('6', 'ZX2016012212', '2016011102210212', '20160111', '陈赤赤', '23141414131313131', '石家庄机场', '怀化芷江机场', '987.4', 'RT90'), ('7', 'SH2016010709', '20160110201420', '2016-01-12', '天霸小白', '44424242424242a', '长沙黄花机场', '石家庄机场', '878.2', ''), ('8', 'SH2016010709', '20160110201618', '2016-01-12', '天霸小白', '44424242424242a', '长沙黄花机场', '石家庄机场', '878.2', ''), ('9', 'SH2016010709', '20160110201742', '2016-01-12', '天霸小白', '44424242424242a', '长沙黄花机场', '石家庄机场', '878.2', ''), ('10', 'SH2016010709', '20160110201845', '2016-01-12', '天霸小白', '44424242424242a', '长沙黄花机场', '石家庄机场', '878.2', ''), ('11', 'SH2016010709', '20160110202055', '2016-01-12', '天霸小白', '44424242424242a', '长沙黄花机场', '石家庄机场', '878.2', '');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
