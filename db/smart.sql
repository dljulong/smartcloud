/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50623
Source Host           : localhost:3306
Source Database       : smart

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2018-12-25 21:08:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for hibernate_sequence
-- ----------------------------
DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hibernate_sequence
-- ----------------------------
INSERT INTO `hibernate_sequence` VALUES ('1');
INSERT INTO `hibernate_sequence` VALUES ('1');

-- ----------------------------
-- Table structure for sssp_department
-- ----------------------------
DROP TABLE IF EXISTS `sssp_department`;
CREATE TABLE `sssp_department` (
  `id` int(11) NOT NULL,
  `departmentName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sssp_department
-- ----------------------------
INSERT INTO `sssp_department` VALUES ('1', '部门1');
INSERT INTO `sssp_department` VALUES ('2', '部门2');
INSERT INTO `sssp_department` VALUES ('3', '部门3');

-- ----------------------------
-- Table structure for sssp_empoyee
-- ----------------------------
DROP TABLE IF EXISTS `sssp_empoyee`;
CREATE TABLE `sssp_empoyee` (
  `id` int(11) NOT NULL,
  `birth` date DEFAULT NULL,
  `crateTime` datetime DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `lastName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Department_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKtcwr5ppwc53d69rygy3up16b4` (`Department_ID`),
  CONSTRAINT `FKtcwr5ppwc53d69rygy3up16b4` FOREIGN KEY (`Department_ID`) REFERENCES `sssp_department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sssp_empoyee
-- ----------------------------
INSERT INTO `sssp_empoyee` VALUES ('1', '2017-09-19', '2017-09-19 08:38:53', '111@qq.com', '李雷', '1');
INSERT INTO `sssp_empoyee` VALUES ('2', '2017-09-01', '2017-09-19 08:41:38', '222@qq.com', '韩梅梅', '1');
INSERT INTO `sssp_empoyee` VALUES ('3', '2017-06-01', '2017-09-19 08:42:11', '333@qq.com', '李秋水', '2');
INSERT INTO `sssp_empoyee` VALUES ('4', '2017-06-01', '2017-09-19 08:43:32', '444@qq.com', '吴莫愁', '1');
INSERT INTO `sssp_empoyee` VALUES ('5', '2017-09-20', '2017-09-20 10:06:32', '555@qq.com', '李明', '1');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一主键',
  `value` varchar(20) NOT NULL COMMENT '值',
  `key` varchar(20) NOT NULL COMMENT 'key',
  `type` varchar(30) NOT NULL COMMENT '类型',
  `description` varchar(200) NOT NULL COMMENT '描述',
  `sort` int(10) NOT NULL COMMENT '排序',
  `remarks` varchar(200) DEFAULT NULL COMMENT '备注',
  `del_flag` varchar(1) NOT NULL DEFAULT '0' COMMENT '在线状态（0.初始创建 1.删除）',
  `update_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统数据字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` int(11) NOT NULL COMMENT '唯一主键',
  `menu_name` varchar(100) NOT NULL COMMENT '模块名称',
  `menu_pid` int(11) NOT NULL DEFAULT '0' COMMENT '父id',
  `menu_url` varchar(100) DEFAULT NULL,
  `update_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `menu_permission` varchar(100) NOT NULL COMMENT '用户权限',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单模块表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('0', '平台角色权限', '0', null, '2017-07-14 10:14:58', 'permission:menu:menu');
INSERT INTO `sys_menu` VALUES ('1', '维修角色权限', '0', null, '2017-07-14 10:32:09', 'repair:menu:menu');
INSERT INTO `sys_menu` VALUES ('2', '客户端角色权限', '0', null, '2017-07-14 10:32:09', 'customer:menu:menu');
INSERT INTO `sys_menu` VALUES ('110', '系统基础管理', '0', null, '2017-07-05 14:59:30', 'permission:basic:menu');
INSERT INTO `sys_menu` VALUES ('111', '用户管理', '110', 'user/view', '2017-07-31 19:35:50', 'permission:basic:user');
INSERT INTO `sys_menu` VALUES ('112', '机构管理', '110', 'orgManage/view', '2017-07-10 10:05:06', 'permission:basic:orgManage');
INSERT INTO `sys_menu` VALUES ('113', '角色管理', '110', 'role/view', '2017-07-05 14:59:33', 'permission:basic:role');
INSERT INTO `sys_menu` VALUES ('114', '版本管理', '110', 'app/view', '2017-07-31 19:35:50', 'permission:basic:app');
INSERT INTO `sys_menu` VALUES ('115', '参数设置', '110', 'dict/view', '2017-07-10 10:04:01', 'permission:basic:dict');
INSERT INTO `sys_menu` VALUES ('117', '系统日志查询', '110', 'log/view', '2017-07-05 14:59:36', 'permission:basic:log');
INSERT INTO `sys_menu` VALUES ('200', '维修系统基础管理', '1', null, '2017-07-17 14:16:52', 'repair:basic:menu');
INSERT INTO `sys_menu` VALUES ('201', '维修用户管理', '200', 'user/view', '2017-07-17 14:56:01', 'repair:basic:user');
INSERT INTO `sys_menu` VALUES ('202', '维修机构管理', '200', 'orgManage/view', '2017-07-17 14:57:20', 'repair:basic:orgManage');
INSERT INTO `sys_menu` VALUES ('203', '维修角色管理', '200', 'role/view', '2017-07-17 14:57:37', 'repair:basic:role');
INSERT INTO `sys_menu` VALUES ('204', '超时时间管理', '200', 'timeout/view', '2017-09-25 10:44:13', 'repair:basic:timeout');
INSERT INTO `sys_menu` VALUES ('210', '客户管理', '1', null, '2017-07-30 19:40:20', 'repair:custmanage:menu');
INSERT INTO `sys_menu` VALUES ('211', '客户机构管理', '210', 'custOrgMgmt/custOrgView', '2017-07-30 19:40:03', 'repair:custmanage:custOrgMgmt');
INSERT INTO `sys_menu` VALUES ('212', '客户管理', '210', 'custManage/custView', '2017-07-30 19:40:18', 'repair:custmanage:custManage');
INSERT INTO `sys_menu` VALUES ('220', '设备管理', '1', null, '2017-07-30 19:39:51', 'repair:terminal:menu');
INSERT INTO `sys_menu` VALUES ('221', '设备类型管理', '220', 'mType/view', '2017-07-30 19:36:00', 'repair:terminal:mType');
INSERT INTO `sys_menu` VALUES ('222', '设备型号管理', '220', 'basebusiness/machineVersionView', '2017-07-30 19:36:26', 'repair:terminal:machineVersion');
INSERT INTO `sys_menu` VALUES ('223', '初始化设备', '220', 'initMachine/view', '2017-07-30 19:36:31', 'repair:terminal:initMachine');
INSERT INTO `sys_menu` VALUES ('224', '设备补录管理', '220', 'machine/view', '2017-07-30 19:38:22', 'repair:terminal:machine');
INSERT INTO `sys_menu` VALUES ('230', '维修管理', '1', null, '2017-08-25 09:23:56', 'repair:repairManage:menu');
INSERT INTO `sys_menu` VALUES ('231', '维修组管理', '230', 'repairGroup/repairGroupManageView', '2017-08-25 09:24:21', 'repair:repairManage:repairGroup');
INSERT INTO `sys_menu` VALUES ('232', '工单管理', '230', 'repairOrderManage/repairOrderView', '2017-08-25 09:24:24', 'repair:repairManage:repairOrderManage');
INSERT INTO `sys_menu` VALUES ('233', '工作计划', '230', null, '2017-08-25 09:24:26', 'repair:repairManage:planOrderManage');
INSERT INTO `sys_menu` VALUES ('234', '失败单处理', '230', 'failOrderManage/failOrderView', '2017-08-25 09:24:28', 'repair:repairManage:failOrderManage');
INSERT INTO `sys_menu` VALUES ('235', '维修员状态查询', '230', 'repairUserState/repairUserStateView', '2017-08-25 09:24:30', 'repair:repairManage:repairUserState');
INSERT INTO `sys_menu` VALUES ('236', '工单历史', '230', 'repairOrderHistory/repairOrderView', '2017-08-25 09:24:33', 'repair:repairManage:repairOrderHistory');
INSERT INTO `sys_menu` VALUES ('240', '统计管理', '1', '', '2017-08-25 09:24:39', 'repair:countManage:menu');
INSERT INTO `sys_menu` VALUES ('241', '设备维修率', '240', 'machineRepair/view', '2017-08-25 09:24:54', 'repair:countManage:machineRepair');
INSERT INTO `sys_menu` VALUES ('242', '维修组维修率', '240', 'repairRroup/initView', '2017-08-25 09:24:56', 'repair:countManage:repairRroup');
INSERT INTO `sys_menu` VALUES ('243', '维修员维修率', '240', 'repairMan/initView', '2017-08-25 09:24:59', 'repair:countManage:repairMan');
INSERT INTO `sys_menu` VALUES ('310', '信息管理', '2', '', '2017-08-25 09:25:05', 'customer:message:menu');
INSERT INTO `sys_menu` VALUES ('311', '客户用户管理', '310', 'user/view', '2017-07-31 19:35:50', 'customer:message:user');
INSERT INTO `sys_menu` VALUES ('312', '客户角色管理', '310', 'role/view', '2017-07-05 14:59:33', 'customer:message:role');
INSERT INTO `sys_menu` VALUES ('313', '机构管理', '310', 'orgManage/view', '2017-08-25 09:25:46', 'customer:message:orgManage');
INSERT INTO `sys_menu` VALUES ('314', '维修商管理', '310', 'maintainer/view', '2017-08-25 09:25:38', 'customer:message:maintainer');
INSERT INTO `sys_menu` VALUES ('320', '设备管理', '2', '', '2017-08-25 09:25:52', 'customer:terminal:menu');
INSERT INTO `sys_menu` VALUES ('321', '分类管理', '320', 'classify/view', '2017-08-25 09:26:01', 'customer:terminal:classify');
INSERT INTO `sys_menu` VALUES ('322', '设备管理', '320', 'machine/view', '2017-08-25 09:26:04', 'customer:terminal:machine');
INSERT INTO `sys_menu` VALUES ('330', '盘点管理', '2', null, '2017-09-01 15:12:15', 'customer:check:menu');
INSERT INTO `sys_menu` VALUES ('331', '盘点单', '330', 'checkMain/view', '2017-08-28 15:15:46', 'customer:check:checkMain');
INSERT INTO `sys_menu` VALUES ('332', '盘点结果', '330', 'checkResult/view', '2017-08-28 15:18:16', 'customer:check:checkResult');
INSERT INTO `sys_menu` VALUES ('340', '报修管理', '2', null, '2017-09-01 15:12:12', 'customer:repair:menu');
INSERT INTO `sys_menu` VALUES ('341', '设备报修', '340', null, '2017-09-01 15:12:43', 'customer:repair:view');
INSERT INTO `sys_menu` VALUES ('342', '报修单历史', '340', null, '2017-09-05 13:39:28', 'customer:repair:historyview');
INSERT INTO `sys_menu` VALUES ('350', '统计分析', '2', null, '2017-09-05 11:16:17', 'customer:analysis:menu');
INSERT INTO `sys_menu` VALUES ('351', '设备维修统计', '350', 'repairAnalysis/view', '2017-09-05 11:16:21', 'costomer:analysis:repairAnalysis');
INSERT INTO `sys_menu` VALUES ('354', '厂商统计', '350', 'machineFactoryAnalysis/view', '2017-09-21 10:39:32', 'costomer:analysis:machineFactoryAnalysis');
INSERT INTO `sys_menu` VALUES ('355', '设备数量统计', '350', 'machineNumberAnalysis/view', '2017-09-21 10:39:14', 'costomer:analysis:machineNumberAnalysis');
INSERT INTO `sys_menu` VALUES ('356', '维修统计', '350', 'repairStatistics/view', '2017-09-21 14:09:50', 'costomer:analysis:statisticsCount');
INSERT INTO `sys_menu` VALUES ('1111', '用户查询', '111', null, '2017-07-31 19:36:29', 'permission:basic:userView');
INSERT INTO `sys_menu` VALUES ('1112', '用户添加', '111', null, '2017-07-31 19:36:51', 'permission:basic:userAdd');
INSERT INTO `sys_menu` VALUES ('1113', '用户编辑', '111', null, '2017-07-31 19:37:20', 'permission:basic:userEdit');
INSERT INTO `sys_menu` VALUES ('1114', '用户重置密码', '111', null, '2017-07-31 19:37:46', 'permission:basic:userReset');
INSERT INTO `sys_menu` VALUES ('1115', '用户删除', '111', null, '2017-07-31 19:39:20', 'permission:basic:userDelete');
INSERT INTO `sys_menu` VALUES ('1131', '角色查询', '113', null, '2017-08-01 00:07:47', 'permission:basic:roleView');
INSERT INTO `sys_menu` VALUES ('1132', '角色添加', '113', null, '2017-08-01 00:08:07', 'permission:basic:roleAdd');
INSERT INTO `sys_menu` VALUES ('1133', '角色修改', '113', null, '2017-08-01 00:08:34', 'permission:basic:roleEdit');
INSERT INTO `sys_menu` VALUES ('1134', '角色删除', '113', null, '2017-08-01 00:08:56', 'permission:basic:roleDelete');
INSERT INTO `sys_menu` VALUES ('1141', '版本查询', '114', null, '2017-07-31 19:36:29', 'permission:basic:appView');
INSERT INTO `sys_menu` VALUES ('1142', '版本添加', '114', null, '2017-07-31 19:36:51', 'permission:basic:appAdd');
INSERT INTO `sys_menu` VALUES ('1143', '版本编辑', '114', null, '2017-07-31 19:37:20', 'permission:basic:appEdit');
INSERT INTO `sys_menu` VALUES ('1144', '版本发布', '114', null, '2017-07-31 19:37:46', 'permission:basic:appRelease');
INSERT INTO `sys_menu` VALUES ('1145', '版本删除', '114', null, '2017-07-31 19:39:20', 'permission:basic:appDelete');
INSERT INTO `sys_menu` VALUES ('2011', '维修用户查询', '201', null, '2017-08-01 00:54:28', 'repair:basic:userView');
INSERT INTO `sys_menu` VALUES ('2012', '维修用户添加', '201', null, '2017-08-01 00:54:56', 'repair:basic:userAdd');
INSERT INTO `sys_menu` VALUES ('2013', '维修用户重置密码', '201', null, '2017-08-01 00:55:36', 'repair:basic:userReset');
INSERT INTO `sys_menu` VALUES ('2014', '维修用户修改', '201', null, '2017-08-01 00:56:05', 'repair:basic:userEdit');
INSERT INTO `sys_menu` VALUES ('2015', '维修用户删除', '201', null, '2017-08-01 00:56:26', 'repair:basic:userDelete');
INSERT INTO `sys_menu` VALUES ('2031', '维修角色查询', '203', null, '2017-08-01 00:57:01', 'repair:basic:roleView');
INSERT INTO `sys_menu` VALUES ('2032', '维修角色添加', '203', null, '2017-08-01 00:57:33', 'repair:basic:roleAdd');
INSERT INTO `sys_menu` VALUES ('2033', '维修角色修改', '203', null, '2017-08-01 00:57:57', 'repair:basic:roleEdit');
INSERT INTO `sys_menu` VALUES ('2034', '维修角色删除', '203', null, '2017-08-01 00:58:20', 'repair:basic:roleDelete');
INSERT INTO `sys_menu` VALUES ('3111', '用户查询', '311', null, '2017-07-31 19:36:29', 'customer:message:userView');
INSERT INTO `sys_menu` VALUES ('3112', '用户添加', '311', null, '2017-07-31 19:36:51', 'customer:message:userAdd');
INSERT INTO `sys_menu` VALUES ('3113', '用户编辑', '311', null, '2017-07-31 19:37:20', 'customer:message:userEdit');
INSERT INTO `sys_menu` VALUES ('3114', '用户重置密码', '311', null, '2017-07-31 19:37:46', 'customer:message:userReset');
INSERT INTO `sys_menu` VALUES ('3115', '用户删除', '311', null, '2017-07-31 19:39:20', 'customer:message:userDelete');
INSERT INTO `sys_menu` VALUES ('3121', '角色查询', '312', null, '2017-08-01 00:07:47', 'customer:message:roleView');
INSERT INTO `sys_menu` VALUES ('3122', '角色添加', '312', null, '2017-08-01 00:08:07', 'customer:message:roleAdd');
INSERT INTO `sys_menu` VALUES ('3123', '角色修改', '312', null, '2017-08-01 00:08:34', 'customer:message:roleEdit');
INSERT INTO `sys_menu` VALUES ('3124', '角色删除', '312', null, '2017-08-01 00:08:56', 'customer:message:roleDelete');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一主键',
  `role_name` varchar(50) NOT NULL COMMENT '角色名称',
  `role_job` varchar(50) DEFAULT NULL COMMENT '角色职位',
  `role_remark` varchar(200) DEFAULT NULL COMMENT '角色备注',
  `update_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_flag` varchar(1) NOT NULL DEFAULT '0' COMMENT '删除标志（0.初始创建 1.删除）',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一主键',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `menu_id` int(11) NOT NULL COMMENT '模块列表id',
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`role_menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-模块对应表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一主键',
  `fullname` varchar(30) DEFAULT NULL COMMENT '用户姓名',
  `username` varchar(30) NOT NULL COMMENT '用户登录名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `update_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_flag` varchar(1) NOT NULL DEFAULT '0' COMMENT '删除标示（0.初始创建 1.删除）',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '平台管理员', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '2017-07-05 09:58:48', '0');
INSERT INTO `sys_user` VALUES ('2', '维修管理员', 'wxadmin', 'e10adc3949ba59abbe56e057f20f883e', '2017-07-05 10:01:12', '0');
INSERT INTO `sys_user` VALUES ('3', '客户管理员', 'khadmin', 'e10adc3949ba59abbe56e057f20f883e', '2017-07-05 10:02:20', '0');
INSERT INTO `sys_user` VALUES ('4', '平台测试人员wqe', 'long', 'e10adc3949ba59abbe56e057f20f883e', '2017-07-10 13:18:45', '0');
INSERT INTO `sys_user` VALUES ('10', '维修测试test', 'WXtest', 'e10adc3949ba59abbe56e057f20f883e', '2017-07-11 14:18:46', '0');
INSERT INTO `sys_user` VALUES ('11', 'liutengfei', 'liu', 'e10adc3949ba59abbe56e057f20f883e', '2017-07-12 10:37:30', '0');
INSERT INTO `sys_user` VALUES ('12', '吴宇航', 'wyh', 'e10adc3949ba59abbe56e057f20f883e', '2017-07-12 11:30:00', '0');
INSERT INTO `sys_user` VALUES ('13', '维修测试子用户', 'wxtest11', 'e10adc3949ba59abbe56e057f20f883e', '2017-07-13 13:46:49', '0');
INSERT INTO `sys_user` VALUES ('14', '维修员1', 'weixiuyuan1', 'e10adc3949ba59abbe56e057f20f883e', '2017-07-18 13:32:10', '0');
INSERT INTO `sys_user` VALUES ('15', 'hefulong', 'hefulong', 'e10adc3949ba59abbe56e057f20f883e', '2017-07-19 10:05:25', '0');
INSERT INTO `sys_user` VALUES ('16', 'zz', 'zz', 'e10adc3949ba59abbe56e057f20f883e', '2017-07-20 02:05:43', '0');
INSERT INTO `sys_user` VALUES ('17', '维修员2222', 'weixiu2', 'e10adc3949ba59abbe56e057f20f883e', '2017-07-20 22:56:59', '0');
INSERT INTO `sys_user` VALUES ('18', 'zz1', 'zz1', 'e10adc3949ba59abbe56e057f20f883e', '2017-07-21 01:34:35', '0');
INSERT INTO `sys_user` VALUES ('19', '维修员3', 'weixiuyuan3', 'e10adc3949ba59abbe56e057f20f883e', '2017-07-20 22:56:59', '0');
INSERT INTO `sys_user` VALUES ('20', '维修站站长', 'zhangcy', 'e10adc3949ba59abbe56e057f20f883e', '2017-07-23 23:39:50', '0');
INSERT INTO `sys_user` VALUES ('21', 'gong123', 'gong', 'e10adc3949ba59abbe56e057f20f883e', '2017-07-24 19:37:13', '0');
INSERT INTO `sys_user` VALUES ('22', 'szb', 'szb', 'e10adc3949ba59abbe56e057f20f883e', '2017-07-19 10:05:25', '0');
INSERT INTO `sys_user` VALUES ('23', '删除测试', 'testdel', 'e10adc3949ba59abbe56e057f20f883e', '2017-08-10 23:16:51', '1');
INSERT INTO `sys_user` VALUES ('24', 'ceshishanchu', 'ceshishanchu', 'e10adc3949ba59abbe56e057f20f883e', '2017-08-14 21:33:20', '1');
INSERT INTO `sys_user` VALUES ('25', 'lyj111', 'lyj', 'e10adc3949ba59abbe56e057f20f883e', '2017-08-17 15:53:25', '0');
INSERT INTO `sys_user` VALUES ('26', '测试维修员的', 'testm', 'e10adc3949ba59abbe56e057f20f883e', '2017-08-18 12:46:09', '1');
INSERT INTO `sys_user` VALUES ('27', 'ctest', 'ctest', 'e10adc3949ba59abbe56e057f20f883e', '2017-08-23 16:22:07', '0');
INSERT INTO `sys_user` VALUES ('28', '吴宇航', 'wyhc', 'e10adc3949ba59abbe56e057f20f883e', '2017-08-24 10:12:25', '0');
INSERT INTO `sys_user` VALUES ('29', '123', 'testt', 'e10adc3949ba59abbe56e057f20f883e', '2017-08-24 10:56:13', '0');
INSERT INTO `sys_user` VALUES ('30', '客户', 'kh', 'e10adc3949ba59abbe56e057f20f883e', '2017-08-24 15:46:55', '0');
INSERT INTO `sys_user` VALUES ('31', 'zhangcyC', 'zhangcyC', 'e10adc3949ba59abbe56e057f20f883e', '2017-08-24 15:48:28', '0');
INSERT INTO `sys_user` VALUES ('32', 'zhangcyCC', 'zhangcyCC', 'e10adc3949ba59abbe56e057f20f883e', '2017-08-24 17:09:50', '0');
INSERT INTO `sys_user` VALUES ('33', 'hefulongc', 'hefulongc', 'e10adc3949ba59abbe56e057f20f883e', '2017-08-28 15:22:35', '0');
INSERT INTO `sys_user` VALUES ('34', 'stest', 'stest', 'e10adc3949ba59abbe56e057f20f883e', '2017-09-04 10:37:50', '0');
INSERT INTO `sys_user` VALUES ('35', 'ceshiweixiuyuan', 'ceshiweixiuyuan', 'e10adc3949ba59abbe56e057f20f883e', '2017-09-04 10:45:19', '0');
INSERT INTO `sys_user` VALUES ('36', 'wqm', 'wqm', 'e10adc3949ba59abbe56e057f20f883e', '2017-09-04 11:08:00', '0');
INSERT INTO `sys_user` VALUES ('37', '刘烨', 'liyye', 'e10adc3949ba59abbe56e057f20f883e', '2017-09-04 11:31:56', '1');
INSERT INTO `sys_user` VALUES ('38', '刘涛', 'liutao', 'e10adc3949ba59abbe56e057f20f883e', '2017-09-04 11:32:23', '1');
INSERT INTO `sys_user` VALUES ('39', '张琳', 'zhanglin', 'e10adc3949ba59abbe56e057f20f883e', '2017-09-04 13:16:04', '1');
INSERT INTO `sys_user` VALUES ('40', '张柳', 'zhangliu', 'e10adc3949ba59abbe56e057f20f883e', '2017-09-04 13:17:31', '1');
INSERT INTO `sys_user` VALUES ('41', 'szbc', 'szbc', 'e10adc3949ba59abbe56e057f20f883e', '2017-09-04 15:04:11', '0');
INSERT INTO `sys_user` VALUES ('42', '隆宏斌', 'longhongbin', 'e10adc3949ba59abbe56e057f20f883e', '2017-09-04 15:05:42', '1');
INSERT INTO `sys_user` VALUES ('43', '张晨', 'zhangchen', 'e10adc3949ba59abbe56e057f20f883e', '2017-09-04 15:19:59', '0');
INSERT INTO `sys_user` VALUES ('44', '张芳', 'zhangfang', 'e10adc3949ba59abbe56e057f20f883e', '2017-09-04 15:20:35', '0');
INSERT INTO `sys_user` VALUES ('45', '王力宏', 'wanglihong', 'e10adc3949ba59abbe56e057f20f883e', '2017-09-04 15:21:16', '0');
INSERT INTO `sys_user` VALUES ('46', '李天', 'litian', 'e10adc3949ba59abbe56e057f20f883e', '2017-09-04 15:21:55', '0');
INSERT INTO `sys_user` VALUES ('47', '蒙恬', 'mengtian', 'e10adc3949ba59abbe56e057f20f883e', '2017-09-04 15:22:43', '0');
INSERT INTO `sys_user` VALUES ('48', '王伟', 'wangwei', 'e10adc3949ba59abbe56e057f20f883e', '2017-09-04 15:23:29', '0');
INSERT INTO `sys_user` VALUES ('49', '赵文卓', 'zhaowenzhuo', 'e10adc3949ba59abbe56e057f20f883e', '2017-09-04 15:24:15', '0');
INSERT INTO `sys_user` VALUES ('50', '盖聂', 'genie', 'e10adc3949ba59abbe56e057f20f883e', '2017-09-04 15:24:51', '0');
INSERT INTO `sys_user` VALUES ('51', '胡歌', 'huge', 'e10adc3949ba59abbe56e057f20f883e', '2017-09-04 15:25:57', '0');
INSERT INTO `sys_user` VALUES ('52', '霍元甲', 'huoyuanjia', 'e10adc3949ba59abbe56e057f20f883e', '2017-09-04 15:26:32', '0');
INSERT INTO `sys_user` VALUES ('53', '王敏', 'wangmin', 'e10adc3949ba59abbe56e057f20f883e', '2017-09-04 15:27:06', '0');
INSERT INTO `sys_user` VALUES ('54', '刘泽', 'liuze', 'e10adc3949ba59abbe56e057f20f883e', '2017-09-04 15:27:39', '0');
INSERT INTO `sys_user` VALUES ('55', '孙俪', 'sunli', 'e10adc3949ba59abbe56e057f20f883e', '2017-09-04 15:28:17', '0');
INSERT INTO `sys_user` VALUES ('56', '文青', 'wenqing', 'e10adc3949ba59abbe56e057f20f883e', '2017-09-04 15:29:19', '0');
INSERT INTO `sys_user` VALUES ('57', '胡德', 'hude', 'e10adc3949ba59abbe56e057f20f883e', '2017-09-04 15:29:57', '0');
INSERT INTO `sys_user` VALUES ('58', '贾博', 'jiabo', 'e10adc3949ba59abbe56e057f20f883e', '2017-09-04 15:30:22', '0');
INSERT INTO `sys_user` VALUES ('59', 'ming', 'ming', 'e10adc3949ba59abbe56e057f20f883e', '2017-09-04 16:31:36', '0');
INSERT INTO `sys_user` VALUES ('60', 'khl', 'khl', 'e10adc3949ba59abbe56e057f20f883e', '2017-09-05 13:12:43', '0');
INSERT INTO `sys_user` VALUES ('61', 'weixiuyuan7', 'weixiuyuan7', 'e10adc3949ba59abbe56e057f20f883e', '2017-09-07 16:09:27', '1');
INSERT INTO `sys_user` VALUES ('62', 'zhangcy1', 'zhangcy1', 'e10adc3949ba59abbe56e057f20f883e', '2017-09-08 08:58:46', '0');
INSERT INTO `sys_user` VALUES ('63', '小夏', 'xiaoxia', 'e10adc3949ba59abbe56e057f20f883e', '2017-09-20 13:23:27', '0');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一主键',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户-角色表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
