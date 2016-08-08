/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.1.66 : Database - kepuability
*********************************************************************
*/
/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`kepuability` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `kepuability`;

/*Table structure for table `pd_expert` */

DROP TABLE IF EXISTS `pd_expert`;

CREATE TABLE `pd_expert` (
  `id` int(11) NOT NULL DEFAULT '0' COMMENT '编号',
  `name` varchar(50) DEFAULT NULL COMMENT '专家名称',
  `account` varchar(50) DEFAULT NULL COMMENT '系统用户名',
  `password` varchar(50) DEFAULT NULL COMMENT '登陆密码',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注 ',
  `createuser` int(11) DEFAULT NULL COMMENT '创建人',
  `createdate` date DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='期刊评审专家表 ';


/*Table structure for table `pd_expert_newsroom` */

DROP TABLE IF EXISTS `pd_expert_newsroom`;

CREATE TABLE `pd_expert_newsroom` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `expertid` int(11) DEFAULT NULL COMMENT '专家',
  `insid` int(11) DEFAULT NULL COMMENT '单位id（只要专家和单位对应，不用到期刊）',
  `createuser` int(11) DEFAULT NULL COMMENT '创建人',
  `createdate` date DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='期刊专家与评审单位关系表 ';


/*Table structure for table `pd_index` */

DROP TABLE IF EXISTS `pd_index`;

CREATE TABLE `pd_index` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `code` varchar(50) NOT NULL COMMENT '编码',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `isindex` char(1) DEFAULT '0' COMMENT '是否最终录入指标',
  `indextype` varchar(5) DEFAULT 'P' COMMENT '指标类型（P 编辑部提供 I 研究所提供 A 院提供）',
  `url` varchar(200) DEFAULT NULL COMMENT 'url地址',
  `optionoryesno` char(1) DEFAULT NULL,
  `score` decimal(15,2) DEFAULT '0.00',
  `isvalid` char(1) DEFAULT '1' COMMENT '是否有效',
  `remark` varchar(500) DEFAULT NULL COMMENT '附件上传说明',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='期刊指标字典表 ';

/*Table structure for table `pd_index_value` */

DROP TABLE IF EXISTS `pd_index_value`;

CREATE TABLE `pd_index_value` (
  `id` int(11) NOT NULL COMMENT '编号',
  `code` varchar(50) DEFAULT NULL COMMENT '编码',
  `newsroomid` int(11) DEFAULT NULL COMMENT '编辑部',
  `year` int(4) DEFAULT NULL COMMENT '年度',
  `type` char(1) DEFAULT 'P' COMMENT '数据类型（P 编辑部  I 研究所  A 院）',
  `typevalue` varchar(50) DEFAULT NULL COMMENT '类型值',
  `status` char(1) DEFAULT 'U' COMMENT '状态',
  `expert` varchar(50) DEFAULT NULL COMMENT '专家名',
  `score` float DEFAULT '0' COMMENT '分数',
  `scoretime` date DEFAULT NULL COMMENT '评分时间',
  `remark` varchar(200) DEFAULT NULL COMMENT '退回理由',
  `createuser` int(11) DEFAULT NULL COMMENT '创建人',
  `createdate` date DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='期刊指标填报记录';

/*Table structure for table `pd_indicator` */

DROP TABLE IF EXISTS `pd_indicator`;

CREATE TABLE `pd_indicator` (
  `id` int(11) NOT NULL DEFAULT '0' COMMENT '编号',
  `newsroomid` int(11) DEFAULT NULL COMMENT '编辑部id，type为单位时为null',
  `institute` int(11) NOT NULL COMMENT '单位id',
  `year` int(4) DEFAULT NULL COMMENT '年度',
  `status` char(1) DEFAULT 'U' COMMENT '状态',
  `score` float DEFAULT '0' COMMENT '分数',
  `type` char(1) DEFAULT NULL COMMENT '数据类型（P 期刊 I 研究所 A 院填报: 转到单位或期刊中，通过指标判断权限。该类型实际不存在）',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `createuser` int(11) DEFAULT NULL COMMENT '创建人',
  `createdate` date DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='期刊绩效填报基表 ';

/*Table structure for table `pd_newsroom` */

DROP TABLE IF EXISTS `pd_newsroom`;

CREATE TABLE `pd_newsroom` (
  `id` int(11) NOT NULL,
  `name` varchar(300) NOT NULL COMMENT '期刊名称',
  `institute` int(11) NOT NULL COMMENT '所属单位',
  `direction` varchar(300) DEFAULT NULL COMMENT '所属学科，改成期刊号，或者isbn号',
  `issue` int(11) DEFAULT NULL COMMENT '刊期（1 旬刊 2 双周刊 3 半月刊 4 月刊 5 双月刊 6 季刊 7 其他）',
  `language` int(11) DEFAULT NULL COMMENT '语种（1 中文 2 英文 3 中英文 4 其他）',
  `setupdate` date DEFAULT NULL COMMENT '创刊日期',
  `type` char(1) DEFAULT '6' comment '期刊性质（1 技术类 2 检索类 3 科普类 4 指导类 5 学术类 6 其他）',
  `editor` varchar(60) DEFAULT NULL comment '主编',
  `status` char(1) DEFAULT NULL  COMMENT '状态（1 正常 2 未出刊 3 休刊 4 已转出 5 其他）',
  `isstatistics` char(1) NOT NULL DEFAULT '1'  COMMENT '是否纳入绩效统计',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


alter table `kepuability`.`t_delayreport` 
   add column `start_date` date NULL COMMENT '填报开始日期' after `last_update`, 
   add column `end_date` date NULL COMMENT '填报结束日期' after `start_date`;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
