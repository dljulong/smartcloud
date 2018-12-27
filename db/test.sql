/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50623
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2018-12-25 21:09:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(4000) NOT NULL,
  `create_date` datetime NOT NULL,
  `title` varchar(2000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', '内容11222', '2017-10-28 00:00:00', '标题1');
INSERT INTO `article` VALUES ('2', '内容2', '2017-10-28 00:00:00', '标题2');
INSERT INTO `article` VALUES ('3', '内容3', '2017-10-28 00:00:00', '标题3');
INSERT INTO `article` VALUES ('4', '内容4', '2017-10-28 00:00:00', '标题4');
INSERT INTO `article` VALUES ('5', '内容5', '2017-10-28 00:00:00', '标题5');
INSERT INTO `article` VALUES ('6', '内容6', '2017-10-28 00:00:00', '标题6');
INSERT INTO `article` VALUES ('7', '内容7', '2017-10-28 00:00:00', '标题7');
INSERT INTO `article` VALUES ('8', '内容8', '2017-10-28 00:00:00', '标题8');
INSERT INTO `article` VALUES ('9', '内容9', '2017-10-28 00:00:00', '标题9');
INSERT INTO `article` VALUES ('10', '内容10', '2017-10-28 00:00:00', '标题10');
INSERT INTO `article` VALUES ('11', '内容11', '2017-10-28 00:00:00', '标题11');
INSERT INTO `article` VALUES ('12', '内容12', '2017-10-28 00:00:00', '标题12');
INSERT INTO `article` VALUES ('13', '内容13', '2017-10-28 00:00:00', '标题13');
INSERT INTO `article` VALUES ('14', '内容14', '2017-10-28 00:00:00', '标题14');
INSERT INTO `article` VALUES ('15', '内容15', '2017-10-28 00:00:00', '标题15');
INSERT INTO `article` VALUES ('16', '内容16', '2017-10-28 00:00:00', '标题16');
INSERT INTO `article` VALUES ('17', '内容17', '2017-10-28 00:00:00', '标题17');
INSERT INTO `article` VALUES ('18', '内容18', '2017-10-28 00:00:00', '标题18');
INSERT INTO `article` VALUES ('19', '内容19', '2017-10-28 00:00:00', '标题19');
INSERT INTO `article` VALUES ('20', '内容20', '2017-10-28 00:00:00', '标题20');
INSERT INTO `article` VALUES ('21', '内容21', '2017-10-28 00:00:00', '标题21');
INSERT INTO `article` VALUES ('22', '内容22', '2017-10-28 00:00:00', '标题22');
INSERT INTO `article` VALUES ('23', '内容23', '2017-10-28 00:00:00', '标题23');
INSERT INTO `article` VALUES ('24', '内容24', '2017-10-28 00:00:00', '标题24');
INSERT INTO `article` VALUES ('25', '内容25', '2017-10-28 00:00:00', '标题25');
INSERT INTO `article` VALUES ('26', '内容26', '2017-10-28 00:00:00', '标题26');
INSERT INTO `article` VALUES ('27', '内容27', '2017-10-28 00:00:00', '标题27');
INSERT INTO `article` VALUES ('28', '内容28', '2017-10-28 00:00:00', '标题28');
INSERT INTO `article` VALUES ('29', '内容29', '2017-10-28 00:00:00', '标题29');

-- ----------------------------
-- Table structure for authority
-- ----------------------------
DROP TABLE IF EXISTS `authority`;
CREATE TABLE `authority` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of authority
-- ----------------------------
INSERT INTO `authority` VALUES ('1', 'ROLE_USER');
INSERT INTO `authority` VALUES ('2', 'ROLE_ADMIN');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastpasswordresetdate` datetime NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_sb8bbouer5wak8vyiiy4pf2bx` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin@admin.com', '', 'admin', '2017-10-28 00:00:00', 'admin', '$2a$10$rj9Hq.12GVArqiOJbOZNpuFq5IupVh2RrOGwYgAcMUbz/jNvS7gqu', 'admin');
INSERT INTO `user` VALUES ('2', 'enabled@user.com', '', 'user', '2017-10-28 00:00:00', 'user', '$2a$10$rj9Hq.12GVArqiOJbOZNpuFq5IupVh2RrOGwYgAcMUbz/jNvS7gqu', 'user');
INSERT INTO `user` VALUES ('3', 'disabled@user.com', '\0', 'user', '2017-10-28 00:00:00', 'user', '$2a$10$rj9Hq.12GVArqiOJbOZNpuFq5IupVh2RrOGwYgAcMUbz/jNvS7gqu', 'disabled');

-- ----------------------------
-- Table structure for user_authority
-- ----------------------------
DROP TABLE IF EXISTS `user_authority`;
CREATE TABLE `user_authority` (
  `user_id` bigint(20) NOT NULL,
  `authority_id` bigint(20) NOT NULL,
  KEY `FKgvxjs381k6f48d5d2yi11uh89` (`authority_id`),
  KEY `FKpqlsjpkybgos9w2svcri7j8xy` (`user_id`),
  CONSTRAINT `FKgvxjs381k6f48d5d2yi11uh89` FOREIGN KEY (`authority_id`) REFERENCES `authority` (`id`),
  CONSTRAINT `FKpqlsjpkybgos9w2svcri7j8xy` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_authority
-- ----------------------------
INSERT INTO `user_authority` VALUES ('1', '1');
INSERT INTO `user_authority` VALUES ('1', '2');
INSERT INTO `user_authority` VALUES ('2', '1');
INSERT INTO `user_authority` VALUES ('3', '1');
