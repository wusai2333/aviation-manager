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

 Date: 01/10/2016 22:23:52 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `books`
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
  `brandNum` varchar(255) DEFAULT NULL,
  `oriderIds` varchar(255) NOT NULL,
  `times` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `cardIds` varchar(255) NOT NULL,
  `start_point` varchar(255) NOT NULL,
  `end_point` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `seat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `books`
-- ----------------------------
BEGIN;
INSERT INTO `books` VALUES ('XZ2016011110', '20160101061122058', '20160106', '帅气的小白', '430527198910000100', '深圳宝安机场', '长沙黄花机场', '289.98', 'B201'), ('FC2016011001', '20160101061122018', '20160110', '霸气少年', '430527198901020111', '北京国际机场', '上海浦东机场', '298.98', 'BC45'), ('WQ2016011601', '20160101061122018', '20160110', '霸气少年', '430527198901020111', '北京国际机场', '上海浦东机场', '298.98', 'AB34'), ('WZ2016010110', '20160101061122058', '20160106', '帅气的小白', '430527198910000100', '深圳宝安机场', '长沙黄花机场', '289.98', 'CF09'), ('JI20160110054', '2016011012313301', '20160110', '天霸', '4302444242424242424a2', '上海浦东机场', '北京国际机场', '348.33', 'ED09'), ('HJ2016013224', '2016011012313301', '20160110', '天霸', '4302444242424242424a2', '上海浦东机场', '北京国际机场', '348.33', 'ER03'), ('JL2016011111', '2016011012313301', '20160110', '天霸', '4302444242424242424a2', '上海浦东机场', '北京国际机场', '348.33', 'FQ08'), ('RT2016011121', '2016011012313301', '20160110', '天霸', '4302444242424242424a2', '上海浦东机场', '北京国际机场', '348.33', 'ER34');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
