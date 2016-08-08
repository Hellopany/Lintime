/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.5.5-m3 : Database - kepuability
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

/*Table structure for table `example` */

DROP TABLE IF EXISTS `example`;

CREATE TABLE `example` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  `multitext` varchar(600) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `example` */


/*Table structure for table `t_basedata` */

DROP TABLE IF EXISTS `t_basedata`;

CREATE TABLE `t_basedata` (
   `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
   `gid` int(11) DEFAULT NULL COMMENT '单位编号',
   `uid` int(11) DEFAULT NULL COMMENT '填报用户',
   `create_time` datetime DEFAULT NULL COMMENT '填报时间',
   `event_time` datetime DEFAULT NULL COMMENT '事件发生时间',
   `name` varchar(600) DEFAULT NULL COMMENT '名称',
   `category` varchar(30) DEFAULT NULL COMMENT '类别，指定对应的子表',
   `type` char(1) DEFAULT NULL COMMENT '子类别，指定对应的子表所关联的业务类型',
   `submit_time` datetime DEFAULT NULL COMMENT '提交时间',
   `verify_time` datetime DEFAULT NULL COMMENT '数据确认时间',
   `status` char(1) DEFAULT NULL COMMENT '状态',
   `score` float DEFAULT NULL COMMENT '得分',
   `remark` varchar(200) DEFAULT NULL COMMENT '备注',
   PRIMARY KEY (`id`)
 ) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='平台基础数据，存储公共的内容';

/*Data for the table `t_basedata` */

/*Table structure for table `kp_activity` */

DROP TABLE IF EXISTS `kp_activity`;

CREATE TABLE `kp_activity` (
  `id` int(11) NOT NULL COMMENT '编号',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `describe` text DEFAULT NULL COMMENT '描述',
  `category` char(1) DEFAULT NULL COMMENT '类别',
  `type` char(1) DEFAULT NULL COMMENT '方式',
  `viewers` int(11) DEFAULT NULL COMMENT '参与活动的公众',
  `address` varchar(100) DEFAULT NULL COMMENT '活动地点',
  `start_time` date DEFAULT NULL COMMENT '开始时间',
  `end_time` date DEFAULT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='科普活动';

/*Data for the table `kp_activity` */

/*Table structure for table `kp_article` */

DROP TABLE IF EXISTS `kp_article`;

CREATE TABLE `kp_article` (
  `id` int(11) NOT NULL COMMENT '编号',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `describe` text DEFAULT NULL COMMENT '描述',
  `category` char(1) DEFAULT NULL COMMENT '类别',
  `type` char(1) DEFAULT NULL COMMENT '发表级别',
  `periodical_name` varchar(50) DEFAULT NULL COMMENT '刊物名称',
  `publish_time` date DEFAULT NULL COMMENT '发表时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='科普文章';

/*Data for the table `kp_article` */

/*Table structure for table `kp_award` */

DROP TABLE IF EXISTS `kp_award`;

CREATE TABLE `kp_award` (
  `id` int(11) NOT NULL COMMENT '编号',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `describe` text DEFAULT NULL COMMENT '描述',
  `category` char(1) DEFAULT NULL COMMENT '级别',
  `type` char(1) DEFAULT NULL COMMENT '性质',
  `honoree` varchar(50) DEFAULT NULL COMMENT '获奖对象',
  `award_time` date DEFAULT NULL COMMENT '获奖时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='获得荣誉';

/*Data for the table `kp_award` */

/*Table structure for table `kp_book` */

DROP TABLE IF EXISTS `kp_book`;

CREATE TABLE `kp_book` (
  `id` int(11) NOT NULL COMMENT '编号',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `describe` text DEFAULT NULL COMMENT '描述',
  `category` char(1) DEFAULT NULL COMMENT '类别',
  `series` char(1) DEFAULT NULL COMMENT '是否成系列',
  `publish_num` int(11) DEFAULT NULL COMMENT '发行量',
  `publish_time` date DEFAULT NULL COMMENT '发行时间',
  `press` varchar(50) DEFAULT NULL COMMENT '出版社',
  `auther` varchar(50) DEFAULT NULL COMMENT '作者',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='科普图书、教材、教辅';

/*Data for the table `kp_book` */

/*Table structure for table `kp_casweb` */

DROP TABLE IF EXISTS `kp_casweb`;

CREATE TABLE `kp_casweb` (
  `id` int(11) NOT NULL COMMENT '编号',
  `name` varchar(200) DEFAULT NULL COMMENT '标题',
  `describe` text DEFAULT NULL COMMENT '描述',
  `website` char(1) DEFAULT NULL COMMENT '发布类别',
  `repost_position` char(1) DEFAULT NULL COMMENT '发布位置',
  `repost_times` int(11) DEFAULT NULL COMMENT '转发次数',
  `happen_time` date DEFAULT NULL COMMENT '新闻发生时间',
  `post_time` date DEFAULT NULL COMMENT '推送时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='院科普网站';

/*Data for the table `kp_casweb` */

/*Table structure for table `kp_course` */

DROP TABLE IF EXISTS `kp_course`;

CREATE TABLE `kp_course` (
  `id` int(11) NOT NULL COMMENT '编号',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `describe` text DEFAULT NULL COMMENT '描述',
  `iscreate` char(1) DEFAULT NULL COMMENT '自行开发',
  `times` int(11) DEFAULT NULL COMMENT '讲解场次',
  `series` char(1) DEFAULT NULL COMMENT '成系列',
  `start_time` date DEFAULT NULL COMMENT '开发时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='科学课程';

/*Data for the table `kp_course` */

/*Table structure for table `kp_document` */

DROP TABLE IF EXISTS `kp_document`;

CREATE TABLE `kp_document` (
   `id` int(11) NOT NULL COMMENT '编号',
   `type` varchar(1) DEFAULT NULL COMMENT '文件类型',
   `attachfile` int(11) DEFAULT NULL COMMENT '文件编号',
   PRIMARY KEY (`id`)
 ) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='科普制度计划';

/*Data for the table `kp_document` */

/*Table structure for table `kp_exhibit` */

DROP TABLE IF EXISTS `kp_exhibit`;

CREATE TABLE `kp_exhibit` (
  `id` int(11) NOT NULL COMMENT '编号',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `describe` text DEFAULT NULL COMMENT '描述',
  `series` char(1) DEFAULT NULL COMMENT '是否成系列',
  `isnew` char(1) DEFAULT NULL COMMENT '是否新开发',
  `complete_time` date DEFAULT NULL COMMENT '展品完成时间',
  `type` char(1) DEFAULT NULL COMMENT '使用情况',
  `using_time` date DEFAULT NULL COMMENT '使用时间',
  `activity_name` varchar(80) DEFAULT NULL COMMENT '活动名称',
  `attachment` int(11) DEFAULT NULL COMMENT '证明附件',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='科普展品';

/*Data for the table `kp_exhibit` */

/*Table structure for table `kp_fund` */

DROP TABLE IF EXISTS `kp_fund`;

CREATE TABLE `kp_fund` (
  `id` int(11) NOT NULL COMMENT '编号',
  `self_fund` float DEFAULT NULL COMMENT '自筹科普经费',
  `other_fund` float DEFAULT NULL COMMENT '社会科普经费',
  `describe` text DEFAULT NULL COMMENT '经费描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='科普经费';

/*Data for the table `kp_fund` */

/*Table structure for table `kp_news` */

DROP TABLE IF EXISTS `kp_news`;

CREATE TABLE `kp_news` (
  `id` int(11) NOT NULL COMMENT '编号',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `describe` text DEFAULT NULL COMMENT '描述',
  `media_name` varchar(50) DEFAULT NULL COMMENT '媒体名称',
  `type` char(1) DEFAULT NULL COMMENT '媒体性质',
  `layout` char(1) DEFAULT NULL COMMENT '版面',
  `words` int(11) DEFAULT NULL COMMENT '字数',
  `report_time` date DEFAULT NULL COMMENT '报道时间',
  `url_address` varchar(200) DEFAULT NULL COMMENT '报道网页地址',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='报纸、期刊科普宣传报道';

/*Data for the table `kp_news` */

/*Table structure for table `kp_periodical` */

DROP TABLE IF EXISTS `kp_periodical`;

CREATE TABLE `kp_periodical` (
  `id` int(11) NOT NULL COMMENT '编号',
  `name` varchar(50) DEFAULT NULL COMMENT '刊物名称',
  `describe` text DEFAULT NULL COMMENT '描述',
  `category` char(1) DEFAULT NULL COMMENT '类别',
  `isnew` char(1) DEFAULT NULL COMMENT '最新创办',
  `circulation` int(11) DEFAULT NULL COMMENT '发行量、下载或浏览次数、图书量',
  `publish_no` varchar(20) DEFAULT NULL COMMENT '期刊发行刊号、电子出版物出版号',
  `start_time` date DEFAULT NULL COMMENT '创办时间',
  `contact` varchar(30) DEFAULT NULL COMMENT '联系人',
  `telephone` varchar(50) DEFAULT NULL COMMENT '联系电话',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='科普刊物';

/*Data for the table `kp_periodical` */

/*Table structure for table `kp_report` */

DROP TABLE IF EXISTS `kp_report`;

CREATE TABLE `kp_report` (
  `id` int(11) NOT NULL COMMENT '编号',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `describe` text DEFAULT NULL COMMENT '描述',
  `series` char(1) DEFAULT NULL COMMENT '是否成系列',
  `type` char(1) DEFAULT NULL COMMENT '组织、被邀请',
  `times` int(11) DEFAULT NULL COMMENT '被邀请次数',
  `number` int(11) DEFAULT NULL COMMENT '科普报告听众人数',
  `address` varchar(100) DEFAULT NULL COMMENT '报告举办地点',
  `start_time` date DEFAULT NULL COMMENT '报告举办时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='科普报告';

/*Data for the table `kp_report` */

/*Table structure for table `kp_teambuilding` */

DROP TABLE IF EXISTS `kp_teambuilding`;

CREATE TABLE `kp_teambuilding` (
  `id` int(11) NOT NULL COMMENT '编号',
  `type` char(1) DEFAULT NULL COMMENT '科普队伍',
  `isnew` char(1) DEFAULT NULL COMMENT '成立老科学家科普演讲团分团',
  `crew` int(11) DEFAULT NULL COMMENT '分团吸纳研究员人数',
  `recommend` int(11) DEFAULT NULL COMMENT '推荐研究员加入分团人数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='队伍建设';

/*Data for the table `kp_teambuilding` */

/*Table structure for table `kp_tv` */

DROP TABLE IF EXISTS `kp_tv`;

CREATE TABLE `kp_tv` (
  `id` int(11) NOT NULL COMMENT '编号',
  `name` varchar(100) DEFAULT NULL COMMENT '报道名称',
  `type` char(1) DEFAULT NULL COMMENT '媒体性质',
  `media_name` varchar(30) DEFAULT NULL COMMENT '媒体名称',
  `column` varchar(30) DEFAULT NULL COMMENT '栏目',
  `length` int(11) DEFAULT NULL COMMENT '时长',
  `report_time` date DEFAULT NULL COMMENT '报道时间',
  `describe` text DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='电视台、广播电台科普宣传报道';

/*Data for the table `kp_tv` */

/*Table structure for table `kp_venue` */

DROP TABLE IF EXISTS `kp_venue`;

CREATE TABLE `kp_venue` (
  `id` int(11) NOT NULL COMMENT '编号',
  `name` varchar(100) DEFAULT NULL COMMENT '场馆名称',
  `square` float DEFAULT NULL COMMENT '场馆面积',
  `address` varchar(200) DEFAULT NULL COMMENT '场馆地址',
  `principal` varchar(30) DEFAULT NULL COMMENT '负责人',
  `contact` varchar(30) DEFAULT NULL COMMENT '联系人',
  `telephone` varchar(50) DEFAULT NULL COMMENT '联系电话',
  `type` char(1) DEFAULT NULL COMMENT '科普类别',
  `grade` char(1) DEFAULT NULL COMMENT '科普基地等级',
  `start_time` date DEFAULT NULL COMMENT '建设完成时间',
  `reception_number` int(11) DEFAULT NULL COMMENT '接待人数',
  `describe` text DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='科普场馆';

/*Data for the table `kp_venue` */

/*Table structure for table `kp_video` */

DROP TABLE IF EXISTS `kp_video`;

CREATE TABLE `kp_video` (
  `id` int(11) NOT NULL COMMENT '编号',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `length` int(11) DEFAULT NULL COMMENT '时长',
  `category` char(1) DEFAULT NULL COMMENT '类别',
  `series` char(1) DEFAULT NULL COMMENT '是否成系列',
  `create_time` date DEFAULT NULL COMMENT '开发完成时间',
  `economic` float DEFAULT NULL COMMENT '产生经济效益',
  `have_adoption` char(1) DEFAULT NULL COMMENT '是否有被采用记录',
  `adoption_type` char(1) DEFAULT NULL COMMENT '被采用类型',
  `adoption_column` varchar(20) DEFAULT NULL COMMENT '采用的栏目',
  `using_time` date DEFAULT NULL COMMENT '采用时间',
  `url` varchar(100) DEFAULT NULL COMMENT '访问地址',
  `describe` text DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='科普视频';

/*Data for the table `kp_video` */

/*Table structure for table `kp_website` */

DROP TABLE IF EXISTS `kp_website`;

CREATE TABLE `kp_website` (
  `id` int(11) NOT NULL COMMENT '编号',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `category` char(1) DEFAULT NULL COMMENT '类别',
  `update_period` char(1) DEFAULT NULL COMMENT '更新周期',
  `pageviews` int(11) DEFAULT NULL COMMENT '日均浏览量、增涨量',
  `url` varchar(100) DEFAULT NULL COMMENT '访问地址/账号',
  `start_time` date DEFAULT NULL COMMENT '创办时间',
  `contact` varchar(30) DEFAULT NULL COMMENT '联系人',
  `telephone` varchar(50) DEFAULT NULL COMMENT '联系电话',
  `describe` text DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='网络与新媒体';

/*Data for the table `kp_website` */


/*Table structure for table `news_nreport` */

DROP TABLE IF EXISTS `news_report`;

CREATE TABLE news_report
( 
   `id`       INT(11) NOT NULL COMMENT '编号',
   `type`     CHAR(1) NOT NULL COMMENT '媒体类型：1报纸、期刊 2通讯社 3电视台、广播电台 4中央重点新闻网站 5其他媒体',
   `name`     VARCHAR (200) NOT NULL COMMENT '媒体名称',
   `level`    VARCHAR (50)  DEFAULT NULL COMMENT '媒体性质：1 中央媒体 2地方媒体 3国内外文媒体 4境外媒体 5新华社 6美联、彭博、路透、法新等国外通讯社 7其他通讯社 9其他 /10 新华网 11 人民网   12 光明网 13 央视国际网站 14 中国网15 国际在线16 中国日报网 17 中国青年网18 中国经济网19 中国广播网 20 中国西藏网21 中国台湾网  22:中新社',
   `country`  VARCHAR(50) COMMENT '媒体所属国家',
   `language` VARCHAR(50) COMMENT '语种',
   `title`    VARCHAR (600) NOT NULL COMMENT '报道标题',
   `translate`    VARCHAR (600) DEFAULT NULL COMMENT '报道标题英文译名',
   `rtime`    DATETIME NOT NULL COMMENT '报道时间',
   `author`   VARCHAR (200) NOT NULL COMMENT '原作者',
   `page`     VARCHAR (50) DEFAULT NULL  COMMENT '版面/栏目：1 头版头条（封面文章）2 头版3 其他版/4 中央电视台“新闻联播” 5 中央人民广播电台“新闻纵横” 6 其它栏目 7 纪录片 ',
   `content`  TEXT  COMMENT '报道内容',
   `length`   INT NOT NULL COMMENT '字数/时长',
   `url`      VARCHAR(200) COMMENT '报道的网页地址url',
   `influence`TEXT DEFAULT NULL COMMENT '产生重大社会影响或对实际工作产生推动作用 或者 推荐理由',
   `attachment` INT COMMENT '附件 （关联到附件表）',
   `isforeign`  CHAR(1) NOT NULL COMMENT '是否外宣：1 外文媒体 2 国内中文媒体',
   PRIMARY KEY (id)
)ENGINE=MYISAM DEFAULT CHARSET=utf8 COMMENT='新闻报道'; 


/*Data for the table `news_nreport` */

/*Table structure for table `news_reference` */

DROP TABLE IF EXISTS `news_reference`;

create table `news_reference` (
	`id` int(11) NOT NULL COMMENT '编号',
	`name` varchar (200) NOT NULL COMMENT '内参名称',
	`type` varchar (1) NOT NULL COMMENT '内参类型',
	`stype` varchar (1) DEFAULT NULL COMMENT '内参子类型',
	`title` varchar (250) NOT NULL COMMENT '内参标题',
	`periods` varchar (20) NOT NULL COMMENT '内参期数',
	`rtime` datetime  NOT NULL COMMENT '报道时间',
	`year` varchar (10)  NOT NULL COMMENT '年份',
	`ins` varchar (1) DEFAULT NULL COMMENT '党中央、国务院领导批示',
	`insname` varchar (200) DEFAULT NULL COMMENT '批示领导姓名',
	`institle` varchar (200) DEFAULT NULL COMMENT '批示领导职务',
	`author` varchar (100) NOT NULL COMMENT '原作者',
	`influence` TEXT  DEFAULT NULL COMMENT '产生重大社会影响或对实际工作产生推动作用',
	`content` TEXT COMMENT '报道内容',
	`attachment` int(11)  DEFAULT 0 COMMENT '内参附件',
	PRIMARY KEY (`id`)
)ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内参'; 


/*Data for the table `news_reference` */

/*Table structure for table `news_conference` */

DROP TABLE IF EXISTS `news_conference`;

CREATE TABLE `news_conference` (
   `id` int(11) NOT NULL COMMENT '编号',
   `name` varchar(200)  NOT NULL COMMENT '发布名称',
   `category` char(1)  NOT NULL COMMENT '分类：K科技成果类 N非科技成果类',
   `level` char(1)  NOT NULL COMMENT '发布层级  1所级 2院级',
   `type` char(1)  NOT NULL COMMENT '发布形式 1：新闻发布会  2新闻通气会 3组织记者采访 4发布新闻通稿 5 接受媒体采访',
   `place` varchar(250)  NOT NULL COMMENT '发布地点',
   `rtime` datetime NOT NULL COMMENT '发布时间',
   `content` text COMMENT '发布内容',
   `influence` varchar(1000)  default NULL COMMENT '产生重大社会影响或对实际工作产生推动作用',
   `attachment` int(11) default NULL,
   `isforeign` char(1)  NOT NULL default '0' COMMENT '是否涉外 0否 1是',
   `isagree` char(1)  NOT NULL default '0' COMMENT '是否领导同意 0否1是',
   `suggestion` varchar(500) default NULL COMMENT '领导审批意见',
   PRIMARY KEY  (`id`)
 ) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `news_achievement` */

DROP TABLE IF EXISTS `news_achievement`;

CREATE TABLE `news_achievement` (
  `id` int(11) NOT NULL auto_increment COMMENT 'ID',
  `name` varchar(100) collate utf8_bin NOT NULL COMMENT '成果名称',
  `category` varchar(30) collate utf8_bin default NULL COMMENT '成果类别',
  `type` varchar(200) collate utf8_bin default NULL COMMENT '成果类型（形式）',
  `content` text collate utf8_bin COMMENT '成果内容',
  `event_time` date default NULL COMMENT '成果获得日期',
  `attach` int(11) default NULL COMMENT '成果附件',
  `author` varchar(200) collate utf8_bin default NULL COMMENT '作者',
  `gid` int(11) default NULL COMMENT '成果单位',
  `tel` varchar(100) collate utf8_bin default NULL COMMENT '联系电话',
  `email` varchar(100) collate utf8_bin default NULL COMMENT '联系邮件',
  `uid` int(11) NOT NULL COMMENT '填写人',
  `submit_time` date NOT NULL COMMENT '填写时间',
  `remark` varchar(500) collate utf8_bin default NULL COMMENT '备注',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `pb_academypeople` */

DROP TABLE IF EXISTS `pb_academypeople`;

CREATE TABLE `pb_academypeople` (
  `peopleid` int(11) NOT NULL COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '文章名称',
  `publicationdate` date NOT NULL COMMENT '刊发日期',
  `author` varchar(50) default '' COMMENT '作者',
  `authorcorporation` int(11) NOT NULL COMMENT '作者单位',
  `columnname` varchar(5) default '' COMMENT '栏目名称',
  `address` varchar(200) default NULL COMMENT '地址',
  `tmpcolumnname` varchar(100) default NULL COMMENT '临时栏目名称',
  `tmpscore` decimal(15,2) default '0.00' COMMENT '临时栏目分值',
  `columntype` varchar(1) default '1' COMMENT '原创或转载 1 原创 0 转载',
  `institutes` varchar(600) default NULL COMMENT ' 相关的研究院所，以 |ID| 方式组成',
  PRIMARY KEY  (`peopleid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='科苑人';

/*Table structure for table `pb_advancedgroup` */

DROP TABLE IF EXISTS `pb_advancedgroup`;

CREATE TABLE `pb_advancedgroup` (
  `groupid` int(11) NOT NULL COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '奖项名称',
  `describe` varchar(100) default NULL COMMENT '奖项描述',
  `prizedate` date NOT NULL COMMENT '表彰日期',
  `persons` varchar(500) NOT NULL default '' COMMENT '获奖集体或个人',
  `corporation` int(11) default NULL COMMENT '获奖单位',
  `prizetype` varchar(5) NOT NULL default '' COMMENT '奖项类别',
  `address` varchar(200) default NULL COMMENT '地址',
  `institutes` varchar(600) default NULL COMMENT '获奖单位（多个）',
  PRIMARY KEY  (`groupid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='先进集体及个人';

/*Table structure for table `pb_innovatepublishing` */

DROP TABLE IF EXISTS `pb_innovatepublishing`;

CREATE TABLE `pb_innovatepublishing` (
  `publishingid` int(11) NOT NULL COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '出版物名称',
  `describe` varchar(500) default NULL COMMENT '描述',
  `innovatepublishingdate` date NOT NULL COMMENT '日期',
  `author` varchar(50) default NULL COMMENT '作者',
  `authorcorporation` varchar(500) default NULL COMMENT '作者单位',
  `ispublic` char(1) NOT NULL default '0' COMMENT '是否公开',
  `circulation` varchar(100) NOT NULL COMMENT '发行量',
  `issn` varchar(50) NOT NULL COMMENT '刊号',
  `address` varchar(100) default NULL COMMENT '地址',
  `certifyfile` varchar(100) default NULL COMMENT '证明文件',
  PRIMARY KEY  (`publishingid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='创新奖项';

/*Table structure for table `pb_leaderinstructions` */

DROP TABLE IF EXISTS `pb_leaderinstructions`;

CREATE TABLE `pb_leaderinstructions` (
  `instructionsid` int(11) NOT NULL COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '批示文章名称',
  `insdescribe` varchar(500) default NULL COMMENT '描述',
  `ispublic` char(1) NOT NULL default '0' COMMENT '是否保密',
  `leader` varchar(50) NOT NULL COMMENT '批示领导',
  `instructionsdate` date NOT NULL COMMENT '批示日期',
  `institutes` varchar(500) default NULL COMMENT '院所名称',
  `address` varchar(100) default NULL COMMENT '地址',
  `certifyfile` varchar(100) default NULL COMMENT '证明文件',
  PRIMARY KEY  (`instructionsid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='领导批示';

/*Table structure for table `pb_newsletter` */

DROP TABLE IF EXISTS `pb_newsletter`;

CREATE TABLE `pb_newsletter` (
  `letterid` int(11) NOT NULL COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `describe` mediumtext COMMENT '描述',
  `issue` varchar(10) default NULL COMMENT '期号',
  `publicationdate` date NOT NULL COMMENT '出版日期',
  `carrytype` varchar(5) NOT NULL default '' COMMENT '刊发性质',
  `institutes` varchar(600) default NULL COMMENT '提及单位',
  PRIMARY KEY  (`letterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='工作简讯';

/*Table structure for table `pb_organization` */

DROP TABLE IF EXISTS `pb_organization`;

CREATE TABLE `pb_organization` (
  `orgid` int(11) NOT NULL COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '文章名称',
  `describe` mediumtext COMMENT '描述',
  `publicationdate` date NOT NULL COMMENT '出版日期',
  `issue` varchar(10) default NULL COMMENT '期号',
  `author` varchar(50) default NULL COMMENT '作者',
  `authorcorporation` int(11) default NULL COMMENT '作者单位',
  `medianame` varchar(5) NOT NULL default '' COMMENT '刊发媒体',
  `mediadescribe` varchar(200) default NULL COMMENT '媒体说明',
  `address` varchar(200) default NULL COMMENT '地址',
  `institutes` varchar(600) default NULL COMMENT '作者单位（多选）',
  PRIMARY KEY  (`orgid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='上报上级组织';

/*Table structure for table `pb_prize` */

DROP TABLE IF EXISTS `pb_prize`;

CREATE TABLE `pb_prize` (
  `prizeid` int(11) NOT NULL COMMENT '主键',
  `name` varchar(50) NOT NULL default '' COMMENT '获奖课题名称',
  `describe` varchar(100) default NULL COMMENT '奖项描述',
  `prizedate` date NOT NULL COMMENT '刊发日期',
  `article` varchar(100) default NULL COMMENT '文章名称',
  `corporation` int(11) default NULL COMMENT '获奖单位',
  `prizetype` varchar(5) NOT NULL default '' COMMENT '获奖类型',
  `address` varchar(200) default NULL COMMENT '地址',
  `institutes` varchar(600) default NULL COMMENT '获奖单位（多个）',
  PRIMARY KEY  (`prizeid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='获奖';
/*Data for the table `pb_prize` */
DROP TABLE IF EXISTS `pb_statistics`;

CREATE TABLE `pb_statistics` (
  `id` int(11) NOT NULL COMMENT '主键',
  `institute` int(11) NOT NULL COMMENT '院所',
  `annual` varchar(4) NOT NULL COMMENT '年度',
  `quarteryear` varchar(1) NOT NULL COMMENT '季度',
  `organization_count` int(11) default '0' COMMENT '上报上级党组织采用数',
  `organization_score` float(15,2) default '0.00' COMMENT '上报上级党组织得分',
  `academy_count` int(11) default '0' COMMENT '科苑人采用数量',
  `prize_count` int(11) default '0' COMMENT '奖项采用数量',
  `academy_prize_score` float(15,2) default '0.00' COMMENT '科苑人和奖项的总得分',
  `newsletter_count` int(11) default '0' COMMENT '简讯采用数量',
  `newsletter_score` float(15,2) default '0.00' COMMENT '简讯得分',
  `group_count` int(11) default '0' COMMENT '先进集体采用数量',
  `group_score` float(15,2) default '0.00' COMMENT '先进集体得分',
  `publication_count` int(11) default '0' COMMENT '创新出版物采用数量',
  `leader_count` int(11) default '0' COMMENT '领导批示采用数量',
  `publication_leader_score` float(15,2) default '0.00' COMMENT '创新出版物和领导批示得分',
  `score` float(15,2) default '0.00' COMMENT '本季度得分',
  `totalscore` float(15,2) default '0.00' COMMENT '年度累计得分',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8  COMMENT='统计导出表样式 ';
/*Table structure for table `t_attachment` */

DROP TABLE IF EXISTS `pd_expert`;

CREATE TABLE `pd_expert` (
  `id` int(11) NOT NULL default '0' COMMENT '编号',
  `name` varchar(50) default NULL COMMENT '专家名称',
  `account` varchar(50) default NULL COMMENT '系统用户名',
  `password` varchar(50) default NULL COMMENT '登陆密码',
  `remark` varchar(200) default NULL COMMENT '备注 ',
  `createuser` int(11) default NULL COMMENT '创建人',
  `createdate` date default NULL COMMENT '创建日期',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `pd_expert` */

insert  into `pd_expert`(`id`,`name`,`account`,`password`,`remark`,`createuser`,`createdate`) values (1,'张先森','zhang','7a2fbb3ab564038c162a2bc16216f050',NULL,4,'2015-04-01');


/*Table structure for table `pd_expert_newsroom` */

DROP TABLE IF EXISTS `pd_expert_newsroom`;

CREATE TABLE `pd_expert_newsroom` (
  `id` int(11) NOT NULL default '0' COMMENT '编号',
  `expertid` int(11) default NULL COMMENT '专家',
  `newsroomid` int(11) default NULL COMMENT '期刊',
  `createuser` int(11) default NULL COMMENT '创建人',
  `createdate` date default NULL COMMENT '创建日期',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `pd_expert_newsroom` */

insert  into `pd_expert_newsroom`(`id`,`expertid`,`newsroomid`,`createuser`,`createdate`) values (1,1,45,3,'2015-04-02');
insert  into `pd_expert_newsroom`(`id`,`expertid`,`newsroomid`,`createuser`,`createdate`) values (2,1,3,3,'2015-04-02');


/*Table structure for table `pd_indicator` */

DROP TABLE IF EXISTS `pd_indicator`;

CREATE TABLE `pd_indicator` (
  `id` int(11) NOT NULL default '0' COMMENT '编号',
  `newsroomid` int(11) default NULL COMMENT '编辑部',
  `year` int(4) default NULL COMMENT '年度',
  `status` char(1) default 'U' COMMENT '状态',
  `score` float default '0' COMMENT '分数',
  `remark` varchar(200) COMMENT '备注',
  `createuser` int(11) default NULL COMMENT '创建人',
  `createdate` date default NULL COMMENT '创建日期',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `pd_indicator` */

/*Table structure for table `pd_survey` */

DROP TABLE IF EXISTS `pd_survey`;

CREATE TABLE `pd_survey` (
  `id` int(11) NOT NULL default '0' COMMENT '编号',
  `newsroomid` int(11) default NULL COMMENT '编辑部标识',
  `year` int(4) default NULL COMMENT '年度',
  `status` char(1) default NULL COMMENT '状态',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `pd_newsroom`;

CREATE TABLE `pd_newsroom` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL COMMENT '编辑部名称',
  `institute` int(11) NOT NULL COMMENT '所属研究所',
  `setupdate` date default NULL COMMENT '创刊日期',
  `type` char(1) default '1' COMMENT '期刊性质',
  `editor` varchar(20) default NULL COMMENT '主编',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='编辑部信息';

/*Data for the table `pd_newsroom` */

insert  into `pd_newsroom`(`id`,`name`,`institute`,`setupdate`,`type`,`editor`) values (45,'编辑部A',2,'2014-09-09','1','爱妃');
insert  into `pd_newsroom`(`id`,`name`,`institute`,`setupdate`,`type`,`editor`) values (2,'编辑部B',2,'2012-01-10','1','说的');



DROP TABLE IF EXISTS `pd_index`;

CREATE TABLE `pd_index` (
  `id` int(11) NOT NULL auto_increment COMMENT '编号',
  `code` varchar(50) default NULL COMMENT '编码',
  `name` varchar(100) default NULL COMMENT '名称',
  `isindex` char(1) default '0' COMMENT '是否最终录入指标',
  `indextype` char(1) default 'P' COMMENT '指标类型（P 编辑部提供 I 研究所提供 A 院提供）',
  `url` varchar(200) default NULL COMMENT 'url地址',
  `isvalid` char(1) default '1' COMMENT '是否有效',
  `remark` varchar(100) default NULL COMMENT '附件上传说明',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='期刊指标';

/*Data for the table `pd_index` */

insert  into `pd_index`(`id`,`code`,`name`,`isindex`,`indextype`,`url`,`isvalid`,`remark`) values (1,'01','主办单位支持期刊发展指标','0','P','','1','');
insert  into `pd_index`(`id`,`code`,`name`,`isindex`,`indextype`,`url`,`isvalid`,`remark`) values (2,'0101','学术支持情况','0','P','','1','');
insert  into `pd_index`(`id`,`code`,`name`,`isindex`,`indextype`,`url`,`isvalid`,`remark`) values (3,'010101','新创办期刊情况','1','A','','1','需要提供刊物名称、正式出版号以及证明资料');
insert  into `pd_index`(`id`,`code`,`name`,`isindex`,`indextype`,`url`,`isvalid`,`remark`) values (4,'0102','行政支持情况','0','P','','1','');
insert  into `pd_index`(`id`,`code`,`name`,`isindex`,`indextype`,`url`,`isvalid`,`remark`) values (5,'010201','为主办或承办期刊提供良好办刊条件情况','1','I','','1','附研究所在人员、经费及办公条件等方面为期刊支持的具体情况等相关材料（同时，请研究所所属期刊编辑部负责人签字认同）');
insert  into `pd_index`(`id`,`code`,`name`,`isindex`,`indextype`,`url`,`isvalid`,`remark`) values (6,'010202','主办或承办期刊人才队伍支持情况','0','P','','1','');
insert  into `pd_index`(`id`,`code`,`name`,`isindex`,`indextype`,`url`,`isvalid`,`remark`) values (7,'01020201','引进办刊人才情况','1','I','','1','附相关材料，应包含引进时间，为那个期刊引进，引进效果等。注：引进人才5年内有效，均可得分 ');
insert  into `pd_index`(`id`,`code`,`name`,`isindex`,`indextype`,`url`,`isvalid`,`remark`) values (8,'01020202','办刊人员待遇情况','1','I','','1','附相关材料，附工资表等资料。');
insert  into `pd_index`(`id`,`code`,`name`,`isindex`,`indextype`,`url`,`isvalid`,`remark`) values (9,'01020203','办刊人员职业发展情况','1','I','','1','附相关材料。注：研究所支持办刊人员聘任研究系列高级岗位的，视同得分。');
insert  into `pd_index`(`id`,`code`,`name`,`isindex`,`indextype`,`url`,`isvalid`,`remark`) values (10,'02','期刊发展指标','0','P','','1','');
insert  into `pd_index`(`id`,`code`,`name`,`isindex`,`indextype`,`url`,`isvalid`,`remark`) values (11,'0201','审读质量情况','1','A','','1','经审读发现政治问题的，实行一票否决制，期刊整体得0分；同时，取消期刊所在研究所获奖资格。');
insert  into `pd_index`(`id`,`code`,`name`,`isindex`,`indextype`,`url`,`isvalid`,`remark`) values (12,'0202','期刊数据库收录情况','0','P','','1','');
insert  into `pd_index`(`id`,`code`,`name`,`isindex`,`indextype`,`url`,`isvalid`,`remark`) values (13,'02020001','英文学术期刊','1','P','eninclude','1','');
insert  into `pd_index`(`id`,`code`,`name`,`isindex`,`indextype`,`url`,`isvalid`,`remark`) values (14,'02020002','中文学术期刊','1','P','chinclude','1','');
insert  into `pd_index`(`id`,`code`,`name`,`isindex`,`indextype`,`url`,`isvalid`,`remark`) values (15,'0203','期刊获奖及项目资助情况','0','P','','1','');
insert  into `pd_index`(`id`,`code`,`name`,`isindex`,`indextype`,`url`,`isvalid`,`remark`) values (16,'020301','期刊或个人获奖情况','1','P','','1','附相关材料，包含证书照片等。注：国家级奖励3年有效；其他奖励当年有效。');
insert  into `pd_index`(`id`,`code`,`name`,`isindex`,`indextype`,`url`,`isvalid`,`remark`) values (17,'020302','期刊或个人获得项目资助情况','1','P','','1','附相关材料，包含项目介绍，签订的合同等。注：项目实施期间有效。');
insert  into `pd_index`(`id`,`code`,`name`,`isindex`,`indextype`,`url`,`isvalid`,`remark`) values (18,'03','编辑部绩效工作指标','0','P','','1','');
insert  into `pd_index`(`id`,`code`,`name`,`isindex`,`indextype`,`url`,`isvalid`,`remark`) values (19,'0301','编辑部核心工作指标','0','P','','1','');
insert  into `pd_index`(`id`,`code`,`name`,`isindex`,`indextype`,`url`,`isvalid`,`remark`) values (20,'030101','学术体系与学风建设工作','0','P','','1','');
insert  into `pd_index`(`id`,`code`,`name`,`isindex`,`indextype`,`url`,`isvalid`,`remark`) values (21,'03010101','同行评议制度建设及实施情况','1','P','','1','附相关材料，包含制度范本，审稿数据库名称及访问地址等。');
insert  into `pd_index`(`id`,`code`,`name`,`isindex`,`indextype`,`url`,`isvalid`,`remark`) values (22,'03010102','发挥编委会作用情况','1','P','','1','附相关材料，包含发表的文章列表等。');
insert  into `pd_index`(`id`,`code`,`name`,`isindex`,`indextype`,`url`,`isvalid`,`remark`) values (23,'03010103','加强期刊学风建设情况','1','P','','1','附相关材料，包含学术诚信声明的范本，检查工具的名称及地址等。');
insert  into `pd_index`(`id`,`code`,`name`,`isindex`,`indextype`,`url`,`isvalid`,`remark`) values (24,'030102','编辑与策划工作','0','P','','1','');
insert  into `pd_index`(`id`,`code`,`name`,`isindex`,`indextype`,`url`,`isvalid`,`remark`) values (25,'03010201','整体策划','1','P','','1','附相关材料，包含专刊名称及重点栏目介绍等。');
insert  into `pd_index`(`id`,`code`,`name`,`isindex`,`indextype`,`url`,`isvalid`,`remark`) values (26,'03010202','组稿约稿','1','P','','1','附稿件题目、作者、组稿人，以及组约稿件相关邮件信息等证明材料');
insert  into `pd_index`(`id`,`code`,`name`,`isindex`,`indextype`,`url`,`isvalid`,`remark`) values (27,'03010203','初审把关','1','P','','1','附年度收稿量、送审量、录用量相关数据，以及编辑部主任签字证明材料');
insert  into `pd_index`(`id`,`code`,`name`,`isindex`,`indextype`,`url`,`isvalid`,`remark`) values (28,'03010204','出版总量','1','P','','1','附相关材料；由审读工作组核实。');
insert  into `pd_index`(`id`,`code`,`name`,`isindex`,`indextype`,`url`,`isvalid`,`remark`) values (29,'030103','学术传播与营销工作','0','P','','1','');
insert  into `pd_index`(`id`,`code`,`name`,`isindex`,`indextype`,`url`,`isvalid`,`remark`) values (30,'03010301','数字传播','1','P','','1','附相关材料，包含网站、博客等地址，运行情况，发表文章的地址等。');
insert  into `pd_index`(`id`,`code`,`name`,`isindex`,`indextype`,`url`,`isvalid`,`remark`) values (31,'03010302','学术交流与宣传','1','P','','1','附相关材料，包含宣传材料，会议通知，图片等。');
insert  into `pd_index`(`id`,`code`,`name`,`isindex`,`indextype`,`url`,`isvalid`,`remark`) values (32,'03010303','发表周期','1','P','search','1','依据学科差异（如：生命科学及化学等从A档起，物理学及天文学等从B档起，数学、地球科学及信息科学等从C档计起，为平均发表周期最快的，下一档为较快，下同），分别予以赋值（其中，平均发表周期最快的，得10分');
insert  into `pd_index`(`id`,`code`,`name`,`isindex`,`indextype`,`url`,`isvalid`,`remark`) values (33,'03010304','学术影响','1','P','','1','附相关材料，包含发表的媒体名称，发表文章的截图，日期等；年度Web下载量统计范围包括：期刊自主网站及所依托发布平台。');
insert  into `pd_index`(`id`,`code`,`name`,`isindex`,`indextype`,`url`,`isvalid`,`remark`) values (34,'03010305','市场营销','1','P','','1','附相关材料，包含发行信息，发布广告的资料，培训资料等。');
insert  into `pd_index`(`id`,`code`,`name`,`isindex`,`indextype`,`url`,`isvalid`,`remark`) values (35,'03010306','探索可持续发展','1','P','','1','如在下一个统计期成效显著的，集群化、市场化发展分值翻番，需附相关材料');
insert  into `pd_index`(`id`,`code`,`name`,`isindex`,`indextype`,`url`,`isvalid`,`remark`) values (36,'020200','.','0','P',NULL,'1','');
/*Table structure for table `pd_index_value` */

DROP TABLE IF EXISTS `pd_index_createnewsroom`;

CREATE TABLE `pd_index_createnewsroom` (
  `id` int(11) NOT NULL default '0' COMMENT '编号',
  `year` int(4) default NULL COMMENT '年度',
  `name` varchar(50) default NULL COMMENT '刊名',
  `issn` varchar(20) default NULL COMMENT '刊号',
  `institute` int(11) NOT NULL COMMENT '主管单位',
  `setupdate` date default NULL COMMENT '创刊日期',
  `belongscience` char(1) default '1' COMMENT '所属学科',
  `chorfl` char(1) default '1' COMMENT '文种-',
  `status` char(1) default 'U' COMMENT '状态',
  `createuser` varchar(50) default NULL COMMENT '录入人',
  `createdate` varchar(50) default NULL COMMENT '录入日期',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `pd_index_createnewsroom` */

/*Table structure for table `pd_index_eninclude` */
DROP TABLE IF EXISTS `pd_index_eninclude`;

CREATE TABLE `pd_index_eninclude` (
  `id` INT(11) NOT NULL DEFAULT '0' COMMENT '编号',
  `newsroomid` INT(11) DEFAULT NULL COMMENT '编辑部标识',
  `year` INT(4) DEFAULT NULL COMMENT '年度 ',
  `en_scie` INT(4) DEFAULT '0' COMMENT '英文scie收录数',
  `en_ei` INT(4) DEFAULT '0' COMMENT '英文ei收录数',
  `en_scopus` INT(4) DEFAULT '0' COMMENT '英文scopus收录数',
  `en_pubmed` INT(4) DEFAULT '0' COMMENT '英文pubmed收录数',
  `en_doaj` INT(4) DEFAULT '0' COMMENT '英文doaj收录数',
  `status` CHAR(1) DEFAULT 'U' COMMENT '状态',
  `createuser` INT(11) DEFAULT NULL,
  `createdate` DATE DEFAULT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MYISAM DEFAULT CHARSET=utf8;
/*Data for the table `pd_index_eninclude` */

/*Table structure for table `pd_index_chinclude` */
DROP TABLE IF EXISTS `pd_index_chinclude`;

CREATE TABLE `pd_index_chinclude` (
  `id` INT(11) NOT NULL DEFAULT '0' COMMENT '编号',
  `newsroomid` INT(11) DEFAULT NULL COMMENT '编辑部标识',
  `year` INT(4) DEFAULT NULL COMMENT '年度 ',
  `ch_scie` INT(4) DEFAULT '0' COMMENT '中文scie收录数',
  `ch_ei` INT(4) DEFAULT '0' COMMENT '中文ei收录数',
  `ch_scopus` INT(4) DEFAULT '0' COMMENT '中文scopus收录数',
  `ch_pubmed` INT(4) DEFAULT '0' COMMENT '中文pubmed收录数',
  `ch_doaj` INT(4) DEFAULT '0' COMMENT '中文doaj收录数',
  `ch_cscd` INT(4) DEFAULT '0' COMMENT '中文cscd收录数',
  `ch_cstpcd` INT(4) DEFAULT '0' COMMENT '中文cstpcd收录数',
  `ch_cnki` INT(4) DEFAULT '0' COMMENT '中文cnki收录数',
  `ch_corenewsroom` INT(4) DEFAULT '0' COMMENT '中问核心期刊收录数',
  `status` CHAR(1) DEFAULT 'U' COMMENT '状态',
  `createuser` INT(11) DEFAULT NULL,
  `createdate` DATE DEFAULT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MYISAM DEFAULT CHARSET=utf8;
/*Data for the table `pd_index_chinclude` */

/*Table structure for table `pd_index_publicate` */

DROP TABLE IF EXISTS `pd_index_publicate`;

CREATE TABLE `pd_index_publicate` (
  `id` int(11) NOT NULL default '0' COMMENT '编号',
  `newsroomid` int(11) default NULL COMMENT '编辑部标识',
  `year` int(4) default NULL COMMENT '年度',
  `pubcycle` char(1) default NULL COMMENT '发表周期',
  `remark` varchar(100) default NULL COMMENT '为优秀稿件开辟绿色通道情况',
  `createuser` int(11) default NULL COMMENT '创建人',
  `createdate` date default NULL COMMENT '创建日期',
  `status` char(1) default 'U' COMMENT '状态',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `pd_index_publicate` */

/*Table structure for table `pd_index_value` */

DROP TABLE IF EXISTS `pd_index_value`;

CREATE TABLE `pd_index_value` (
  `id` int(11) NOT NULL COMMENT '编号',
  `code` varchar(50) default NULL COMMENT '编码',
  `newsroomid` int(11) default NULL COMMENT '编辑部',
  `year` int(4) default NULL COMMENT '年度',
  `type` char(1) default 'P' COMMENT '数据类型（P 编辑部  I 研究所  A 院）',
  `status` char(1) default 'U' COMMENT '状态',
  `expert` varchar(50) default NULL COMMENT '专家名',
  `score` float default '0' COMMENT '分数',
  `scoretime` date default NULL COMMENT '评分时间',
  `remark` varchar(200) default NULL COMMENT '退回理由',
  `createuser` int(11) default NULL COMMENT '创建人',
  `createdate` date default NULL COMMENT '创建日期',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='期刊指标值';

/*Data for the table `pd_index_value` */

/*Table structure for table `pd_survey_base` */

DROP TABLE IF EXISTS `pd_survey_base`;

CREATE TABLE `pd_survey_base` (
  `id` int(11) NOT NULL COMMENT '编号',
  `status` char(1) DEFAULT NULL COMMENT '状态',
  `newsroomid` int(11) default NULL COMMENT '编辑部标识',
  `annual` varchar(4) default NULL COMMENT '年度',
  `cnname` varchar(50) default NULL COMMENT '中文刊名',
  `cnissn` varchar(20) default NULL COMMENT '国内统一刊号',
  `flname` varchar(50) default NULL COMMENT '外文刊名',
  `flissn` varchar(20) default NULL COMMENT '国际标准刊号',
  `manageinstitute` varchar(100) default NULL COMMENT '主管单位名称',
  `email` varchar(50) default NULL COMMENT '邮件地址',
  `website` varchar(200) default NULL COMMENT '期刊网址',
  `leaveadvertising` varchar(20) default NULL COMMENT '广告许可证号',
  `isindelegal` char(1) default '1' COMMENT '是否独立法人资格',
  `editor` varchar(20) default NULL COMMENT '主编',
  `editorialboard` int(11) default '0' COMMENT '编委会人数',
  `fleditorialboard` int(11) default '0' COMMENT '外籍编委会人数',
  `director` varchar(20) default NULL COMMENT '主任',
  `employees` int(11) default '0' COMMENT '人员数量',
  `presscards` int(11) default '0' COMMENT '记者证数量',
  `isunionnewsroom` char(1) default '1' COMMENT '是否设有联合编辑部',
  `unionnewsroomdirector` varchar(20) default NULL COMMENT '联合编辑部负责人',
  `unionnewsroomtel` varchar(20) default NULL COMMENT '联合编辑部联系方式',
  `setupdate` date default NULL COMMENT '创刊日期',
  `type` char(1) default '1' COMMENT '期刊性质',
  `belongscience` char(1) default '1' COMMENT '所属学科',
  `chorfl` char(1) default '1' COMMENT '文种-',
  `period` varchar(20) default NULL COMMENT '刊期',
  `booksize` varchar(10) default NULL COMMENT '开本',
  `pages` varchar(10) default NULL COMMENT '期均页码',
  `registeaddress` varchar(100) default NULL COMMENT '登记地',
  `publicationrange` varchar(100) default NULL COMMENT '发行范围',
  `pdc` varchar(20) default NULL COMMENT '邮发代号',
  `publicationdate` date default NULL COMMENT '出刊日期',
  `periodcount` int(11) default '0' COMMENT '每期印数',
  `prize` float(15,2) default '0.00' COMMENT '每册单价',
  `purpose` varchar(1000) default NULL COMMENT '办刊宗旨',
  `reader` varchar(100) default NULL COMMENT '读者对象',
  `isele` char(1) default '1' COMMENT '是否建有电子版',
  `eleback` varchar(10) default NULL COMMENT '电子版回溯年度',
  `eleformat` char(1) default '1' COMMENT '电子版格式',
  `elebuildtype` char(1) default '1' COMMENT '电子版建设方式',
  `isweb` char(1) default '1' COMMENT '是否建成网站',
  `iscurrdownload` char(1) default '1' COMMENT '当期下载是否免费',
  `ispassdownload` char(1) default '1' COMMENT '过期下载是否免费',
  `isarticle` char(1) default '1' COMMENT '是否仅可文章下载',
  `downloadcount` int(11) default '0' COMMENT '年均下载量',
  `iswebdeposit` char(1) default '1' COMMENT '是否托管',
  `ispriorpublic` char(1) default '1' COMMENT '是否优先出版',
  `priorpublicdays` int(1) default '0' COMMENT '优先出版提前天数',
  `services` char(1) default '1' COMMENT '是否开展服务',
  `iscollectedite` char(1) default '1' COMMENT '是否建有采编系统',
  `collecteditename` varchar(20) default NULL COMMENT '采编系统名称',
  `publicationtype` char(1) default '1' COMMENT '投稿及审稿方式',
  `iscnconstract` char(1) default '1' COMMENT '是否签订独家合同',
  `cnconstractpartner` varchar(100) default NULL COMMENT '合作单位名称',
  `cnconstractdate` date default NULL COMMENT '合同有效期',
  `cnconstractcontent` varchar(100) default NULL COMMENT '合同情况',
  `isflconstract` char(1) default '1' COMMENT '是否与境外签订独家合同',
  `flconstractpartner` varchar(100) default NULL COMMENT '境外合作单位名称',
  `flconstractdate` date default NULL COMMENT '境外合同有效期',
  `flconstractcontent` varchar(100) default NULL COMMENT '境外合同情况',
  `createuser` varchar(50) default NULL COMMENT '录入人',
  `createdate` varchar(50) default NULL COMMENT '录入日期',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='期刊调查基本情况';

/*Data for the table `pd_survey_base` */

/*Table structure for table `pd_survey_base_change` */

DROP TABLE IF EXISTS `pd_survey_base_change`;

CREATE TABLE `pd_survey_base_change` (
  `id` int(11) NOT NULL COMMENT '编号',
  `annual` varchar(4) default NULL COMMENT '年度',
  `baseid` int(11) default NULL COMMENT '编辑部基本情况标识',
  `changedate` date default NULL COMMENT '日期',
  `changecontent` varchar(200) default NULL COMMENT '变更内容',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='期刊调查基本情况编辑部变更情况';

/*Data for the table `pd_survey_base_change` */

/*Table structure for table `pd_survey_base_hostunit` */

DROP TABLE IF EXISTS `pd_survey_base_hostunit`;

CREATE TABLE `pd_survey_base_hostunit` (
  `id` int(11) NOT NULL COMMENT '编号',
  `baseid` int(11) default NULL COMMENT '编辑部基本情况标识',
  `annual` varchar(4) default NULL COMMENT '年度',
  `name` varchar(200) default NULL COMMENT '主办单位名称',
  `legalcorporate` varchar(50) default '1' COMMENT '法人代表',
  `address` varchar(20) default NULL COMMENT '地址邮编',
  `tel` varchar(20) default NULL COMMENT '电话传真',
  `type` char(1) default '1' COMMENT '类型：1 第一主办单位 2 其他主办单位 3 挂靠单位 4 出版单位 5 印刷单位',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='期刊调查基本情况';

/*Data for the table `pd_survey_base_hostunit` */

/*Table structure for table `pd_survey_base_prizeaid` */

DROP TABLE IF EXISTS `pd_survey_base_prizeaid`;

CREATE TABLE `pd_survey_base_prizeaid` (
  `id` int(11) NOT NULL COMMENT '编号',
  `baseid` int(11) default NULL COMMENT '编辑部基本情况标识',
  `year` varchar(4) default NULL COMMENT '数据保存年度',
  `annual` varchar(4) default NULL COMMENT '事件发生年度',
  `name` varchar(100) default NULL COMMENT '项目名称',
  `gradeormoney` varchar(50) default NULL COMMENT '奖项等级或者资助金额',
  `type` char(1) default NULL COMMENT '类型： 1 奖励 2 资助',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='期刊调查基本情况编辑部获奖和或资助情况';

/*Data for the table `pd_survey_base_prizeaid` */

/*Table structure for table `pd_survey_director` */

DROP TABLE IF EXISTS `pd_survey_director`;

CREATE TABLE `pd_survey_director` (
  `id` int(11) NOT NULL COMMENT '编号',
  `year` int(4) default NULL COMMENT '年度',
  `newsroomid` int(11) default NULL COMMENT '编辑部标识',
  `name` varchar(20) default NULL COMMENT '姓名',
  `tel` varchar(20) default NULL COMMENT '电话',
  `tax` varchar(20) default NULL COMMENT '传真',
  `mobile` varchar(20) default NULL COMMENT '手机',
  `email` varchar(50) default NULL COMMENT '邮件',
  `status` char(1) default 'U' COMMENT '状态',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='期刊调查编辑部期刊负责人';

/*Data for the table `pd_survey_director` */

/*Table structure for table `pd_survey_employee` */

DROP TABLE IF EXISTS `pd_survey_employee`;

CREATE TABLE `pd_survey_employee` (
  `id` int(11) NOT NULL COMMENT '编号',
  `newsroomid` int(11) default NULL COMMENT '编辑部标识',
  `headcount` int(4) default NULL COMMENT '总人数',
  `official` int(4) default NULL COMMENT '正式编制人数',
  `employ` int(4) default NULL COMMENT '项目聘用人数',
  `foreign` int(4) default NULL COMMENT '外聘数',
  `careercertify` int(4) default NULL COMMENT '职业资格证数',
  `editorcertify` int(4) default NULL COMMENT '责编证书数',
  `officaildoctor` int(4) default NULL COMMENT '正式编制博士人数',
  `officailmaster` int(4) default NULL COMMENT '正式编制硕士人数',
  `officailbachelor` int(4) default NULL COMMENT '正式编制本科人数',
  `officaillowbachelor` int(4) default NULL COMMENT '正式编制本科以下人数',
  `employdoctor` int(4) default NULL COMMENT '项目聘用博士人数',
  `employmaster` int(4) default NULL COMMENT '项目聘用硕士人数',
  `employbachelor` int(4) default NULL COMMENT '项目聘用本科人数',
  `employlowbachelor` int(4) default NULL COMMENT '项目聘用本科以下人数',
  `officialseniorengineer` int(4) default NULL COMMENT '正式编制正高人数',
  `officaildeputyseniorengineer` int(4) default NULL COMMENT '正式编制副高人数',
  `officailinterseniorengineer` int(4) default NULL COMMENT '正式编制中级人数',
  `officaillowinterseniorengineer` int(4) default NULL COMMENT '正式编制中级以下人数',
  `employseniorengineer` int(4) default NULL COMMENT '项目聘用正高人数',
  `employdeputyseniorengineer` int(4) default NULL COMMENT '项目聘用副高人数',
  `employinterseniorengineer` int(4) default NULL COMMENT '项目聘用中级人数',
  `employlowinterseniorengineer` int(4) default NULL COMMENT '项目聘用中级以下人数',
  `official30` int(4) default NULL COMMENT '正式编制30以下人数',
  `officail45` int(4) default NULL COMMENT '正式编制30-45人数',
  `officail60` int(4) default NULL COMMENT '正式编制45-60人数',
  `officailover60` int(4) default NULL COMMENT '正式编制60以上人数',
  `employ30` int(4) default NULL COMMENT '项目聘用30以下人数',
  `employ45` int(4) default NULL COMMENT '项目聘用30-45人数',
  `employ60` int(4) default NULL COMMENT '项目聘用45-60人数',
  `employover60` int(4) default NULL COMMENT '项目聘用60以上人数',
  `year` int(4) default NULL COMMENT '年度',
  `status` char(1) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='期刊调查编辑部人员情况表';

/*Data for the table `pd_survey_employee` */

/*Table structure for table `pd_survey_employee_doctor` */

DROP TABLE IF EXISTS `pd_survey_employee_doctor`;

CREATE TABLE `pd_survey_employee_doctor` (
  `id` int(11) NOT NULL COMMENT '编号',
  `employeeid` int(11) default NULL COMMENT '人员情况表标识',
  `name` varchar(50) default NULL COMMENT '姓名',
  `belongscience` varchar(50) default NULL COMMENT '学科',
  `age` int(4) default NULL COMMENT '年龄',
  `year` int(4) default NULL COMMENT '年度',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='期刊调查编辑部优秀人员情况表';

/*Data for the table `pd_survey_employee_doctor` */

/*Table structure for table `pd_survey_employee_excellent` */

DROP TABLE IF EXISTS `pd_survey_employee_excellent`;

CREATE TABLE `pd_survey_employee_excellent` (
  `id` int(11) NOT NULL COMMENT '编号',
  `employeeid` int(11) default NULL COMMENT '人员情况表标识',
  `name` varchar(50) default NULL COMMENT '姓名',
  `employdate` date default NULL COMMENT '聘用日期',
  `year` int(4) default NULL COMMENT '年度',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='期刊调查编辑部优秀人员情况表';

/*Data for the table `pd_survey_employee_excellent` */

/*Table structure for table `pd_survey_employee_leader` */

DROP TABLE IF EXISTS `pd_survey_employee_leader`;

CREATE TABLE `pd_survey_employee_leader` (
  `id` int(11) NOT NULL COMMENT '编号',
  `employeeid` int(11) default NULL COMMENT '人员情况表标识',
  `name` varchar(50) default NULL COMMENT '姓名',
  `sex` char(1) default 'M' COMMENT '性别',
  `birthday` varchar(10) default NULL COMMENT '出生日期',
  `political` varchar(10) default NULL COMMENT '政治面貌',
  `duty` varchar(50) default NULL COMMENT '职务',
  `degree` varchar(20) default NULL COMMENT '文化程度',
  `professional` varchar(20) default NULL COMMENT '职称',
  `isholdtwo` char(1) default '0' COMMENT '是否兼职',
  `type` char(1) default NULL COMMENT '类型：1 主编 2 主任',
  `year` int(4) default NULL COMMENT '年度',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='期刊调查编辑部人员情况表';

DROP TABLE IF EXISTS `pd_survey_attachement`;

CREATE TABLE `pd_survey_attachement` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `newsroomid` INT(11) DEFAULT NULL COMMENT '编辑部标识',
  `year` INT(4) DEFAULT NULL COMMENT '年度',
	`status` char(1) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY  (`id`)
) ENGINE=MYISAM DEFAULT CHARSET=utf8 COMMENT='期刊年度调查附件表';

/*Data for the table `pd_survey_employee_leader` */

/*Table structure for table `pd_survey_funds` */

DROP TABLE IF EXISTS `pd_survey_funds`;

CREATE TABLE `pd_survey_funds` (
  `id` int(11) NOT NULL COMMENT '编号',
  `newsroomid` int(11) default NULL COMMENT '编辑部标识',
  `investmode` char(1) default NULL COMMENT '经费投入模式',
  `allocate` float default '0' COMMENT '主办单位拨款',
  `aid` float default '0' COMMENT '主管单位资助',
  `publicate` float default '0' COMMENT '发行',
  `advertise` float default '0' COMMENT '广告',
  `database` float default '0' COMMENT '数据库加盟',
  `space` float default '0' COMMENT '版面费',
  `other` float default '0' COMMENT '其他',
  `status` char(1) DEFAULT NULL COMMENT '状态',
  `year` int(4) default NULL COMMENT '年度',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='期刊调查编辑部期刊经费情况表';

CREATE TABLE `pd_survey_incomedetail` (
	`id` int(11) NOT NULL COMMENT '编号',
	`newsroomid` int(11) default NULL COMMENT '编辑部标识',
	`insfunds` float default '0' COMMENT '所里支持经费',
	`acafunds` float default '0' COMMENT '院里支持经费',
	`minsfunds` float default '0' COMMENT '部委支持经费',
	`depafunds` float default '0' COMMENT '学会等其他部门支持经费',
	`issueincome` float default '0' COMMENT '发行收入',
	`pageincome` float default '0' COMMENT '版面发行收入',
	`cnkiincome` float default '0' COMMENT 'CNKI等合作的收入',
	`intincome` float default '0' COMMENT '与国际出版单位合作的收入',
	`adveincome` float default '0' COMMENT '广告收入',
	`actincome` float default '0' COMMENT '举办会议、培训或活动的收入',
	`selffunds` float default '0' COMMENT '其他自筹经费',
	`emplcost` float default '0' COMMENT '项目聘用人员工资及奖金',
	`travcost` float default '0' COMMENT '差旅费',
	`newsrcost` float default '0' COMMENT '其他编辑部开销',
	`expcheck` float default '0' COMMENT '专家的审稿费',
	`authcost` float default '0' COMMENT '作者稿酬',
	`meetingcost` float default '0' COMMENT '开编委会议的支出',
	`rewardcost` float default '0' COMMENT '给优秀作者及编委的奖励',
	`relatecost` float default '0' COMMENT '其他相关支出',
	`printcost` float default '0' COMMENT '排版及印刷的费用',
	`websitecost` float default '0' COMMENT '采编系统及网站运营的支出',
	`promcost` float default '0' COMMENT '在国际会议及其他场合、网站对期刊的宣传、推广费用',
	`oacost` float default '0' COMMENT '在国际合作出版中的OA等费用',
	`othercost` float default '0' COMMENT '其他费用',
	`expendname` varchar (600) default NULL COMMENT '其他支出项费用名称',
	`fillname` varchar (150) default NULL COMMENT '填报人',
	`expendprice` float default '0' COMMENT '其他支出项费用金额',
	`status` char(1) DEFAULT NULL COMMENT '状态',
	`year` int(4) default NULL COMMENT '年度',
	PRIMARY KEY  (`id`)
)ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='期刊收支明细';



/*Data for the table `pd_survey_funds` */

/*Table structure for table `pd_survey_include` */

DROP TABLE IF EXISTS `pd_survey_include`;

CREATE TABLE `pd_survey_include` (
  `id` int(11) NOT NULL COMMENT '编号',
  `newsroomid` int(11) default NULL COMMENT '编辑部标识',
  `isscidisk` char(1) default '1' COMMENT 'SCI有光盘',
  `issciweb` char(1) default '1' COMMENT 'SCI提供web',
  `iseidisk` char(1) default '1' COMMENT 'EI有光盘',
  `iseiweb` char(1) default '1' COMMENT 'EI提供web',
  `foreignother` varchar(50) default NULL COMMENT '其他',
  `scifactor` varchar(50) default NULL COMMENT 'SCI影响因子',
  `scifactororder` int(5) default '0' COMMENT 'SCI影响因子排名',
  `sciinclude` int(5) default '0' COMMENT 'SCI引用次数',
  `sciincludeorder` int(5) default '0' COMMENT 'SCI引用排名',
  `scicontrast` float default '0' COMMENT '对比',
  `iscscddatabase` char(1) default '1' COMMENT 'CSCD数据库',
  `iscstpcddatabase` char(1) default '1' COMMENT 'CSTP数据库',
  `iscnkidatabase` char(1) default '1' COMMENT 'CNKI数据库',
  `ismainperiod` char(1) default '1' COMMENT '中文主要媒体',
  `other` varchar(50) default NULL COMMENT '其他媒体',
  `cstpcdfactor` varchar(50) default NULL COMMENT 'CSTPCD影响因子',
  `cstpcdfactororder` int(5) default '0' COMMENT 'CSTPCD影响因子排名',
  `cstpcdinclude` int(5) default '0' COMMENT 'CSTPCD引用次数',
  `cstpcdincludeorder` int(5) default '0' COMMENT 'CSTPCD引用排名',
  `cstpcdcontrast` float default '0' COMMENT 'CSTPCD对比',
  `status` char(1) DEFAULT NULL COMMENT '状态',
  `year` int(4) default NULL COMMENT '年度',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='期刊调查编辑部期刊被引用和收录情况表';

/*Data for the table `pd_survey_include` */

/*Table structure for table `pd_survey_publicate` */

DROP TABLE IF EXISTS `pd_survey_publicate`;

CREATE TABLE `pd_survey_publicate` (
  `id` int(11) NOT NULL COMMENT '编号',
  `newsroomid` int(11) default NULL COMMENT '编辑部标识',
  `total` int(5) default NULL COMMENT '来稿数量',
  `invites` int(5) default NULL COMMENT '组约稿数量',
  `foreigns` int(5) default NULL COMMENT '国外来稿数量',
  `totalpublicate` int(5) default NULL COMMENT '发稿数量',
  `foreignpublicate` int(5) default NULL COMMENT '国外发稿数量',
  `cycle` float default '0' COMMENT '平均发表周期',
  `printtype` char(1) default NULL COMMENT '印刷形式',
  `totalsell` int(5) default NULL COMMENT '发行数量',
  `cnsell` int(5) default NULL COMMENT '国内发行数量',
  `foreignsell` int(5) default NULL COMMENT '国际发行数量',
  `inchange` int(5) default NULL COMMENT '交换数量',
  `isdisk` char(1) default '1' COMMENT '是否有配套光盘出版',
  `periods` int(5) default NULL COMMENT '增刊期数',
  `status` char(1) DEFAULT NULL COMMENT '状态',
  `year` int(4) default NULL COMMENT '年度',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='期刊调查编辑部期刊出版发行情况表';

/*Data for the table `pd_survey_publicate` */

/*Table structure for table `pd_survey_research` */

DROP TABLE IF EXISTS `pd_survey_research`;

CREATE TABLE `pd_survey_research` (
  `id` int(11) NOT NULL COMMENT '编号',
  `newsroomid` int(11) default NULL COMMENT '编辑部标识',
  `name` varchar(200) default NULL COMMENT '题目',
  `leader` varchar(20) default NULL COMMENT '负责人',
  `funds` float default '0' COMMENT '经费',
  `projectdate` date default NULL COMMENT '项目期',
  `enstructcorporation` varchar(200) default NULL COMMENT '委托单位',
  `isfinish` char(1) default '1' COMMENT '是否完成',
  `type` char(1) default NULL COMMENT '类型：1 承担项目 2 研究论文',
  `author` varchar(20) default NULL COMMENT '作者',
  `periodname` varchar(50) default NULL COMMENT '发表周期',
  `period` varchar(50) default NULL COMMENT '期卷',
  `pages` varchar(50) default NULL COMMENT '页码',
  `status` char(1) DEFAULT NULL COMMENT '状态',
  `year` int(4) default NULL COMMENT '年度',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='期刊调查编辑部期刊研究情况表';


DROP TABLE IF EXISTS `t_attachment`;

CREATE TABLE `t_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `category` varchar(30) DEFAULT NULL COMMENT '表单类型，指定对应的子表',
  `cid` int(11) DEFAULT NULL COMMENT '表单编号',
  `upload_time` datetime DEFAULT NULL COMMENT '上传时间',
  `name` varchar(200) DEFAULT NULL COMMENT '文件名',
  `url` varchar(100) DEFAULT NULL COMMENT '存储地址',
  `size` int(11) DEFAULT NULL COMMENT '文件大小',
  `describe` varchar(200) DEFAULT NULL COMMENT '文件描述',
  `status` char(1) DEFAULT NULL COMMENT '文件状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件信息';

/*Data for the table `t_attachment` */

/*Table structure for table `t_comment` */

DROP TABLE IF EXISTS `t_comment`;

CREATE TABLE `t_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `category` varchar(30) DEFAULT NULL COMMENT '变更内容类型，指定对应的子表',
  `cid` int(11) DEFAULT NULL COMMENT '变更内容编号',
  `change_time` datetime DEFAULT NULL COMMENT '变更时间',
  `uid` int(11) DEFAULT NULL COMMENT '用户编号',
  `name` varchar(50) DEFAULT NULL COMMENT '用户名称',
  `result` char(1) DEFAULT NULL COMMENT '变更结果',
  `comment` varchar(100) DEFAULT NULL COMMENT '变更意见',
  `status` char(1) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='变更记录';

/*Data for the table `t_comment` */

/*Table structure for table `t_delayreport` */

DROP TABLE IF EXISTS `t_delayreport`;

CREATE TABLE `t_delayreport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modualname` varchar(30) NOT NULL COMMENT '模块名称',
  `delaydays` int(3) unsigned NOT NULL DEFAULT '0' COMMENT '延迟填报的天数',
  `last_update` datetime DEFAULT NULL COMMENT '最近更新时间',
  PRIMARY KEY (`id`)
 ) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `t_delayreport` */

insert  into `t_delayreport`(`id`,`modualname`,`delaydays`,`last_update`) values (1,'kepu',0,NULL);
insert  into `t_delayreport`(`id`,`modualname`,`delaydays`,`last_update`) values (2,'party',0,NULL);
insert  into `t_delayreport`(`id`,`modualname`,`delaydays`,`last_update`) values (3,'news1',0,NULL);
insert  into `t_delayreport`(`id`,`modualname`,`delaydays`,`last_update`) values (4,'news2',0,NULL);
insert  into `t_delayreport`(`id`,`modualname`,`delaydays`,`last_update`) values (5,'periodical',0,NULL);

/*Table structure for table `t_institute` */

DROP TABLE IF EXISTS `t_institute`;

CREATE TABLE `t_institute` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '机构编号',
  `name` varchar(50) DEFAULT NULL COMMENT '机构名称',
  `shortname` varchar(20) DEFAULT NULL COMMENT '机构简称',
  `enname` varchar(30) DEFAULT NULL COMMENT '机构英文缩写',
  `type` varchar(5) DEFAULT NULL COMMENT '机构类别',
  `code` varchar(10) DEFAULT NULL COMMENT '单位代码',
  `substat` int(11) DEFAULT '0' COMMENT '小计项',
  `branch` int(11) DEFAULT '0' COMMENT '所属分院',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=176 DEFAULT CHARSET=utf8 COMMENT='院所信息表';

/*Data for the table `t_institute` */

insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (1,'办公厅（党组办）','办公厅（党组办）','go','A','312111',0,99,1);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (2,'学部工作局','学部工作局','casad','A','313812',0,99,2);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (3,'前沿科学与教育局','前沿局','bfse','A','311711',0,99,3);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (4,'重大科技任务局','重大任务局','bmrdb','A','311811',0,99,4);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (5,'科技促进发展局','科发局','std','A','311911',0,99,5);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (6,'发展规划局','规划局','bps','A','312211',0,99,6);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (7,'条件保障与财务局','条财局','bpf','A','312411',0,99,7);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (8,'人事局','人事局','pe','A','312D11',0,99,8);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (9,'国际合作局','合作局','bic','A','312511',0,99,9);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (10,'监察审计局','监审局','jianshen','A','313811',0,99,10);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (11,'离退休干部工作局','离退休局','lt','A','312911',0,99,11);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (12,'中国科学院北京分院（筹）','北京分院（京区党委）','bjb','A','313311',0,1,12);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (13,'中国科学院沈阳分院','沈阳分院','syb','A','321121',0,2,13);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (14,'中国科学院长春分院','长春分院','ccb','A','321222',0,3,14);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (15,'中国科学院上海分院','上海分院','shb','A','321331',0,4,15);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (16,'中国科学院南京分院','南京分院','njb','A','321432',0,5,16);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (17,'中国科学院武汉分院','武汉分院','whb','A','321642',0,6,17);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (18,'中国科学院广州分院','广州分院','gzb','A','321744',0,7,18);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (19,'中国科学院成都分院','成都分院','cdb','A','321851',0,8,19);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (20,'中国科学院昆明分院','昆明分院','kmb','A','321953',0,9,20);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (21,'中国科学院西安分院','西安分院','xab','A','321A61',0,10,21);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (22,'中国科学院兰州分院','兰州分院','lzb','A','321B62',0,11,22);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (23,'中国科学院新疆分院','新疆分院','xjb','A','321C65',0,12,23);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (24,'中国科学院数学与系统科学研究院','数学院','amss','C','111611',0,1,24);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (25,'中国科学院物理研究所','物理所','iop','C','112111',0,1,25);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (26,'中国科学院理论物理研究所','理论物理所','itp','C','112311',0,1,26);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (27,'中国科学院高能物理研究所','高能所','ihep','C','113111',0,1,27);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (28,'中国科学院力学研究所','力学所','imech','C','115111',0,1,28);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (29,'中国科学院声学研究所','声学所','ioa','C','112211',29,1,29);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (30,'中国科学院北海研究站','北海研究站','ioabh','C','',29,1,30);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (31,'中国科学院南海研究站','南海研究站','ioanh','C','',29,1,31);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (32,'中国科学院东海研究站','东海研究站','ioadh','C','',29,1,32);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (33,'中国科学院理化技术研究所','理化所','ipc','C','1A1111',0,1,33);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (34,'中国科学院化学研究所','化学所','ic','C','121111',0,1,34);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (35,'国家纳米科学中心','国家纳米中心','nanoctr','C','121D11',35,1,35);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (36,'国家纳米技术与工程研究院','国家工研院','cnane','C','',35,1,36);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (37,'中国科学院生态环境研究中心','生态中心','rcees','C','121311',0,1,37);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (38,'中国科学院过程工程研究所','过程工程所','ipe','C','122111',0,1,38);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (39,'中国科学院地理科学与资源研究所','地理资源所','igsnrr','C','131A11',0,1,39);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (40,'中国科学院国家天文台','国家天文台','nao','B','114A11',40,1,40);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (41,'中国科学院云南天文台','云南天文台','ynao','B','114A53',40,9,41);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (42,'中国科学院新疆天文台','新疆天文台','xao','B','114A65',40,12,42);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (43,'中国科学院国家天文台长春人造卫星观测站','长春人卫站','cho','B','114A22',40,3,43);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (44,'中国科学院国家天文台南京天文光学技术研究所','南京天文所','niaot','B','114A32',40,5,44);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (45,'中国科学院遥感与数字地球研究所','遥感地球所','radi','C','131211',0,1,45);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (46,'中国科学院地质与地球物理研究所','地质地球所','igg','C','132A11',46,1,46);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (47,'中国科学院地质与地球物理研究所兰州油气资源研究中心','兰州油气中心','lig','C','132962',46,11,47);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (48,'中国科学院青藏高原研究所','青藏高原所','itpcas','C','131C11',0,1,48);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (49,'中国科学院古脊椎动物与古人类研究所','古脊椎所','ivpp','B','132311',0,1,49);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (50,'中国科学院大气物理研究所','大气所','iap','C','134111',0,1,50);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (51,'中国科学院植物研究所','植物所','ib','B','151111',0,1,51);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (52,'中国科学院动物研究所','动物所','ioz','B','152111',0,1,52);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (53,'中国科学院心理研究所','心理所','psych','C','153111',0,1,53);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (54,'中国科学院微生物研究所','微生物所','im','C','153211',0,1,54);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (55,'中国科学院生物物理研究所','生物物理所','ibp','C','153311',0,1,55);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (56,'中国科学院遗传与发育生物学研究所','遗传发育所','genetics','C','153E11',56,1,56);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (57,'中国科学院遗传与发育生物学研究所农业资源研究中心','农业资源研究中心','sjziam','C','153E13',56,1,57);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (58,'中国科学院北京基因组研究所','北京基因组所','big','C','153F11',0,1,58);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (59,'中国科学院计算技术研究所','计算所','ict','C','171111',0,1,59);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (60,'中国科学院软件研究所','软件所','is','C','171311',0,1,60);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (61,'中国科学院半导体研究所','半导体所','semi','C','172111',0,1,61);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (62,'中国科学院微电子研究所','微电子所','ime','C','172511',0,1,62);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (63,'中国科学院电子学研究所','电子所','ie','C','173111',0,1,63);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (64,'中国科学院自动化研究所','自动化所','ia','C','173211',0,1,64);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (65,'中国科学院电工研究所','电工所','iee','C','182111',0,1,65);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (66,'中国科学院工程热物理研究所','工程热物理所','iet','C','182211',0,1,66);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (67,'中国科学院空间科学与应用研究中心','空间中心','cssar','C','183311',0,1,67);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (68,'中国科学院光电研究院','光电院','aoe','C','181811',0,1,68);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (69,'中国科学院自然科学史研究所','科学史所','ihns','C','191111',0,1,69);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (70,'中国科学院科技政策与管理科学研究所','政策与管理所','ipm','C','192111',0,1,70);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (71,'中国科学院信息工程研究所','信工所','iie','C','171411',71,1,71);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (72,'数据与通信保护研究教育中心','数据通信教育中心','dacas','C','',71,1,72);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (73,'中国科学院空间应用工程与技术中心','空间应用中心','csu','C','183511',0,1,73);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (74,'中国科学院北京综合研究中心','北京综合中心','basic','C','113511',0,1,74);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (75,'中国科学院天津工业生物技术研究所','天津工生所','tib','C','155112',0,1,75);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (76,'中国科学院山西煤炭化学研究所','山西煤化所','sxicc','C','122214',0,1,76);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (77,'中国科学院大连化学物理研究所','大连化物所','dicp','C','121421',0,2,77);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (78,'中国科学院金属研究所','金属所','imr','C','174321',0,2,78);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (79,'中国科学院沈阳应用生态研究所','沈阳生态所','iae','C','151221',0,2,79);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (80,'中国科学院沈阳自动化研究所','沈阳自动化所','sia','C','173321',0,2,80);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (81,'中国科学院海洋研究所','海洋所','qdio','C','133137',0,2,81);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (82,'中国科学院青岛生物能源与过程研究所','青岛能源所','qibebt','C','153937',0,2,82);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (83,'中国科学院烟台海岸带研究所','烟台海岸带所','yic','C','133337',0,2,83);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (84,'中国科学院长春光学精密机械与物理研究所','长春光机所','ciomp','C','181722',0,3,84);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (85,'中国科学院长春应用化学研究所','长春应化所','ciac','C','121522',0,3,85);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (86,'中国科学院东北地理与农业生态研究所','东北地理所','neigae','C','131322',86,3,86);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (87,'中国科学院东北地理与农业生态研究所农业技术中心','黑龙江农业技术中心','neigaehrb','C','131323',86,3,87);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (88,'中国科学院上海微系统与信息技术研究所','上海微系统所','sim','C','172231',0,4,88);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (89,'中国科学院上海技术物理研究所','上海技物所','sitp','C','181331',0,4,89);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (90,'中国科学院上海光学精密机械研究所','上海光机所','siom','C','181231',0,4,90);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (91,'中国科学院上海硅酸盐研究所','上海硅酸盐所','sic','C','121631',0,4,91);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (92,'中国科学院上海有机化学研究所','上海有机所','sioc','C','121731',0,4,92);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (93,'中国科学院上海应用物理研究所','上海应物所','sinap','C','113231',0,4,93);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (94,'中国科学院上海天文台','上海天文台','shao','B','114231',0,4,94);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (95,'中国科学院上海生命科学研究院','上海生科院','sibs','B','153D31',95,4,95);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (96,'上海巴斯德所','巴斯德所','pasteur','C','',95,4,96);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (97,'中国科学院上海药物研究所','上海药物所','simm','C','153631',0,4,97);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (98,'中国科学院上海高等研究院','上海高研院','sari','C','184131',0,4,98);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (99,'中国科学院宁波材料技术与工程研究所','宁波材料所','nimte','C','174433',0,4,99);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (100,'中国科学院福建物质结构研究所','福建物构所','fjirsm','C','121835',0,4,100);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (101,'中国科学院城市环境研究所','城市环境所','iue','C','132C35',0,4,101);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (102,'中国科学院南京地质古生物研究所','南京古生物所','nigpas','B','132432',0,5,102);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (103,'中国科学院南京土壤研究所','南京土壤所','issas','C','151432',0,5,103);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (104,'中国科学院南京地理与湖泊研究所','南京地理所','niglas','C','131432',0,5,104);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (105,'中国科学院紫金山天文台','紫金山天文台','pmo','B','114332',0,5,105);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (106,'中国科学院苏州纳米技术与纳米仿生研究所','苏州纳米所','sinano','C','121E32',0,5,106);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (107,'中国科学院苏州生物医学工程技术研究所','苏州医工所','sibet','C','154232',0,5,107);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (108,'中国科学院合肥物质科学研究院','合肥研究院','hf','C','116134',0,99,108);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (109,'中国科学院武汉岩土力学研究所','武汉岩土所','whrsm','C','115242',0,6,109);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (110,'中国科学院武汉物理与数学研究所','武汉物数所','wipm','C','112942',0,6,110);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (111,'中国科学院武汉病毒研究所','武汉病毒所','whiov','C','153B42',0,6,111);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (112,'中国科学院测量与地球物理研究所','测地所','whigg','C','132542',0,6,112);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (113,'中国科学院水生生物研究所','水生所','ihb','C','152342',0,6,113);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (114,'中国科学院武汉植物园','武汉植物园','wbg','B','151542',0,6,114);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (115,'中国科学院南海海洋研究所','南海海洋所','scsio','C','133244',0,7,115);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (116,'中国科学院华南植物园','华南植物园','scib','B','151644',0,7,116);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (117,'中国科学院广州能源研究所','广州能源所','giec','C','182344',0,7,117);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (118,'中国科学院广州地球化学研究所','广州地化所','gig','C','132744',118,7,118);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (119,'中国科学院广州地球化学研究所长沙矿产资源勘查中心','长沙矿产中心','cskczyzx','C','132643',118,7,119);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (120,'中国科学院广州生物医药与健康研究院','广州生物院','gibh','C','154144',0,7,120);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (121,'中国科学院深圳先进技术研究院','深圳先进院','siat','C','172644',0,7,121);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (122,'中国科学院亚热带农业生态研究所','亚热带生态所','isa','C','161343',0,7,122);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (123,'中国科学院成都生物研究所','成都生物所','cib','C','151751',0,8,123);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (124,'中国科学院水利部成都山地灾害与环境研究所','成都山地所','imde','C','131551',0,8,124);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (125,'中国科学院光电技术研究所','光电所','ioe','C','181551',0,8,125);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (126,'中国科学院重庆绿色智能技术研究院','重庆研究院','cigit','C','181950',0,8,126);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (127,'中国科学院昆明动物研究所','昆明动物所','kiz','B','152453',0,9,127);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (128,'中国科学院昆明植物研究所','昆明植物所','kib','B','151853',0,9,128);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (129,'中国科学院西双版纳热带植物园','版纳植物园','xtbg','B','151C53',0,9,129);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (130,'中国科学院地球化学研究所','地化所','gyig','C','132852',0,9,130);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (131,'中国科学院西安光学精密机械研究所','西安光机所','opt','C','181661',0,10,131);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (132,'中国科学院国家授时中心','授时中心','ntsc','B','241561',0,10,132);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (133,'中国科学院地球环境研究所','地球环境所','ieexa','C','132B61',0,10,133);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (134,'中国科学院近代物理研究所','近代物理所','imp','C','113462',0,11,134);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (135,'中国科学院兰州化学物理研究所','兰州化物所','licp','C','121B62',0,11,135);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (136,'中国科学院寒区旱区环境与工程研究所','寒旱所','careeri','C','131B62',0,11,136);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (137,'中国科学院青海盐湖研究所','青海盐湖所','isl','C','122363',0,11,137);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (138,'中国科学院西北高原生物研究所','西北高原所','nwipb','C','152563',0,11,138);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (139,'中国科学院新疆理化技术研究所','新疆理化所','xjipc','C','1A1365',0,12,139);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (140,'中国科学院新疆生态与地理研究所','新疆生态所','egi','C','131965',0,12,140);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (141,'中国科学院大学','国科大','gucas','B','211211',141,1,141);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (142,'中国科学院大学培训中心','国科大培训中心','gucaspx','B','',141,1,142);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (143,'中国科学技术大学','中国科大','ustc','B','211134',0,1,143);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (144,'中国科学院计算机网络信息中心','网络中心','cnic','B','241711',0,1,144);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (145,'中国科学院文献情报中心','文献中心','las','C','221111',145,1,145);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (146,'中国科学院兰州文献情报中心','兰州文献中心','llas','C','221562',145,11,146);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (147,'中国科学院成都文献情报中心','成都文献中心','clas','C','221451',145,8,147);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (148,'中国科学院武汉文献情报中心','武汉文献中心','whlib','C','221342',145,6,148);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (149,'科技名词审定中心','科技名词审定中心','term','C','',145,1,149);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (150,'中国科学报社','科学报社','sciencenet','C','222111',0,1,150);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (151,'中国科学院行政管理局','行管局','ab','C','251111',0,1,151);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (152,'中国科学院青岛疗养院','青岛疗养院','zylhotel','C','252137',0,2,152);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (153,'中国科学院庐山疗养院','庐山疗养院','hpkbg','C','252236',0,5,153);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (154,'中国科学院国有资产经营有限责任公司','国科控股','casholdings','C','418111',0,1,154);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (155,'联想控股有限公司','联想控股','legendholdings','C','413111',0,1,155);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (156,'中科实业集团（控股）有限公司','中科集团','csh','C','411111',0,1,156);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (157,'东方科学仪器进出口集团有限公司','东方科仪','osic','C','412111',0,1,157);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (158,'中国科技出版传媒集团有限公司','出版集团','cspg','C','431E11',0,1,158);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (159,'中国科技产业投资管理有限公司','国科投资','casim','C','414111',0,1,159);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (160,'北京中科科仪股份有限公司','北京科仪','kyky','C','416111',0,1,160);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (161,'北京中科院软件中心有限公司','软件中心','sec','C','431611',0,1,161);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (162,'中科院建筑设计研究院有限公司','中科设计','adcas','C','431711',0,1,162);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (163,'北京中科资源有限公司','中科资源','zkzy','C','431A11',0,1,163);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (164,'中国科学院沈阳计算技术研究所有限公司','沈阳计算','sict','C','431321',0,2,164);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (165,'中国科学院沈阳科学仪器股份有限公司','沈阳科仪','sky','C','431221',0,2,165);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (166,'南京中科天文仪器有限公司','南京天仪','nairc','C','431C32',0,5,166);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (167,'中科院广州化学有限公司','广州化学','gic','C','431844',0,7,167);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (168,'中科院广州电子技术有限公司','广州电子','giet','C','431944',0,7,168);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (169,'中国科学院成都有机化学有限公司','成都有机','cocc','C','431451',0,8,169);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (170,'中科院成都信息技术有限公司','成都信息','casit','C','431551',0,8,170);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (171,'成都中科唯实仪器有限责任公司','成都唯实','cdzkws','C','431B51',0,8,171);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (172,'中科院科技服务有限公司','中科服务','zkfw','C','431H11',0,1,172);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (173,'上海碧科清洁能源技术有限公司','上海碧科','cecc-tech','C','431G31',0,4,173);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (174,'深圳中科院知识产权投资有限公司','深圳IP','caship','C','431F44',0,7,174);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (175,'国科嘉和（北京）投资管理有限公司','国科嘉和','cashcapital','C','431I11',0,1,175);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (176,'北京纳米能源与系统研究所','纳米能源所','binn','C',NULL,0,1,176);
insert  into `t_institute`(`id`,`name`,`shortname`,`enname`,`type`,`code`,`substat`,`branch`,`sort`) values (177,'科学传播局','科学传播局','bsc','A',NULL,0,1,0);

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(20) DEFAULT NULL COMMENT '用户登录名',
  `password` varchar(64) DEFAULT NULL COMMENT '登录密码',
  `authority` char(1) DEFAULT NULL COMMENT '用户权限',
  `showname` varchar(20) DEFAULT NULL COMMENT '用户显示名',
  `email` varchar(50) DEFAULT NULL COMMENT '电子邮箱',
  `type` varchar(20) DEFAULT NULL COMMENT '用户类型',
  `business` varchar(20) DEFAULT NULL COMMENT '业务权限',
  `institute` int(11) DEFAULT NULL COMMENT '所属单位编号',
  `newsroom` int(11) DEFAULT 0 COMMENT '所属期刊',
  `telphone` varchar(15) DEFAULT NULL COMMENT '联系电话',
  `address` varchar(100) DEFAULT NULL COMMENT '联系地址',
  `lastlogin` datetime DEFAULT NULL COMMENT '上次登录时间',
  `lastip` varchar(20) DEFAULT NULL COMMENT '上次登录IP',
  `login_times` int(11) DEFAULT NULL COMMENT '登录次数',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

/*Data for the table `t_user` */

insert  into `t_user`(`uid`,`name`,`password`,`authority`,`showname`,`email`,`type`,`business`,`institute`,`telphone`,`address`,`lastlogin`,`lastip`,`login_times`) values (1,'test','7a2fbb3ab564038c162a2bc16216f050',NULL,'测试机构用户','test@cnic.cn','|I|','|K|P|PB|N1|N2|',45,NULL,NULL,'2014-12-05 17:26:00','127.0.0.1',1);
insert  into `t_user`(`uid`,`name`,`password`,`authority`,`showname`,`email`,`type`,`business`,`institute`,`telphone`,`address`,`lastlogin`,`lastip`,`login_times`) values (2,'admin','7a2fbb3ab564038c162a2bc16216f050',NULL,'测试总管理员','test@cnic.cn','|V|R|A|','|K|P|PB|N1|N2|',0,NULL,NULL,'2014-12-05 17:26:00','127.0.0.1',1);
insert  into `t_user`(`uid`,`name`,`password`,`authority`,`showname`,`email`,`type`,`business`,`institute`,`telphone`,`address`,`lastlogin`,`lastip`,`login_times`) values (3,'kpadmin','7a2fbb3ab564038c162a2bc16216f050',NULL,'KEPU管理员','test@cnic.cn','|V|R|','|K|',0,NULL,NULL,'2014-12-05 17:26:00','127.0.0.1',1);
insert  into `t_user`(`uid`,`name`,`password`,`authority`,`showname`,`email`,`type`,`business`,`institute`,`telphone`,`address`,`lastlogin`,`lastip`,`login_times`) values (4,'n1admin','7a2fbb3ab564038c162a2bc16216f050',NULL,'NEWS1管理员','test@cnic.cn','|V|R|','|N1|',0,NULL,NULL,'2014-12-05 17:26:00','127.0.0.1',1);
insert  into `t_user`(`uid`,`name`,`password`,`authority`,`showname`,`email`,`type`,`business`,`institute`,`telphone`,`address`,`lastlogin`,`lastip`,`login_times`) values (5,'n2admin','7a2fbb3ab564038c162a2bc16216f050',NULL,'NEWS2管理员','test@cnic.cn','|V|R|','|N2|',0,NULL,NULL,'2014-12-05 17:26:00','127.0.0.1',1);
insert  into `t_user`(`uid`,`name`,`password`,`authority`,`showname`,`email`,`type`,`business`,`institute`,`telphone`,`address`,`lastlogin`,`lastip`,`login_times`) values (6,'pbadmin','7a2fbb3ab564038c162a2bc16216f050',NULL,'PARTY管理员','test@cnic.cn','|V|R|','|PB|',0,NULL,NULL,'2014-12-05 17:26:00','127.0.0.1',1);

/*Table structure for table `st_billboard` */

DROP TABLE IF EXISTS `st_billboard`;

CREATE TABLE `st_billboard` (
  `id` int(11) NOT NULL auto_increment COMMENT '编号',
  `category` varchar(30) default NULL COMMENT '模块名:news kepu party magazine',
  `name` varchar(10) NOT NULL COMMENT '排行榜名，如S201501表示季度排名，为2015年第1季度',
  `gid` int(11) default NULL COMMENT '单位编号',
  `score` float default NULL COMMENT '临时总分',
  `rank` int(11) default '0' COMMENT '临时排名',
  `stat_time` DATE default NULL COMMENT '统计时间',
  PRIMARY KEY  (`id`)
 ) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='临时统计表（每天自动统计一次）';

/*Data for the table `st_billboard` */

/*Table structure for table `t_notice`;*/

DROP TABLE IF EXISTS `t_notice`;

CREATE TABLE `t_notice` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `title` VARCHAR(200) NOT NULL COMMENT '标题',
  `category` VARCHAR(20) NOT NULL COMMENT '栏目',
  `content` TEXT DEFAULT NULL COMMENT '内容',
  `url` VARCHAR(200) DEFAULT NULL COMMENT '外部链接地址',
  `istop` CHAR(1) DEFAULT '0' NOT NULL COMMENT '是否置顶 0否1是',
  `top_time` DATETIME DEFAULT NULL COMMENT '置顶时间',
  `status` CHAR(1) NOT NULL DEFAULT '0' COMMENT '状态 0 未发布 1已发布',
  `uid` INT(11) NOT NULL COMMENT '创建人',
  `create_time` DATETIME NOT NULL COMMENT '创建时间',
  PRIMARY KEY  (`id`)
 ) ENGINE=MYISAM DEFAULT CHARSET=utf8 COMMENT='新闻公告表';

/*Data for the table `t_notice`;*/
DROP TABLE IF EXISTS `t_itemfraction`;

CREATE TABLE `t_itemfraction` (
  `id` int(11) NOT NULL auto_increment COMMENT '主键',
  `condition` varchar(50) default '' COMMENT '其他条件',
  `score` float(6,1) NOT NULL default '0.0' COMMENT '分数',
  `subclass` varchar(50) default NULL COMMENT '项目表子类',
  PRIMARY KEY  (`id`)
) ENGINE=MYISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='项目分数表';

/*Data for the table `t_itemfraction` */

insert  into `t_itemfraction`(`id`,`condition`,`score`,`subclass`) values (1,'A-1',10.0,'ACADEMY_COLUMN_MAP');
insert  into `t_itemfraction`(`id`,`condition`,`score`,`subclass`) values (2,'A-0',5.0,'ACADEMY_COLUMN_MAP');
insert  into `t_itemfraction`(`id`,`condition`,`score`,`subclass`) values (3,'B-1',10.0,'ACADEMY_COLUMN_MAP');
insert  into `t_itemfraction`(`id`,`condition`,`score`,`subclass`) values (4,'B-0',5.0,'ACADEMY_COLUMN_MAP');
insert  into `t_itemfraction`(`id`,`condition`,`score`,`subclass`) values (5,'C-1',10.0,'ACADEMY_COLUMN_MAP');
insert  into `t_itemfraction`(`id`,`condition`,`score`,`subclass`) values (6,'C-0',5.0,'ACADEMY_COLUMN_MAP');
insert  into `t_itemfraction`(`id`,`condition`,`score`,`subclass`) values (7,'D-1',8.0,'ACADEMY_COLUMN_MAP');
insert  into `t_itemfraction`(`id`,`condition`,`score`,`subclass`) values (8,'D-0',2.0,'ACADEMY_COLUMN_MAP');
insert  into `t_itemfraction`(`id`,`condition`,`score`,`subclass`) values (9,'E-1',8.0,'ACADEMY_COLUMN_MAP');
insert  into `t_itemfraction`(`id`,`condition`,`score`,`subclass`) values (10,'E-0',2.0,'ACADEMY_COLUMN_MAP');
insert  into `t_itemfraction`(`id`,`condition`,`score`,`subclass`) values (11,'F-1',8.0,'ACADEMY_COLUMN_MAP');
insert  into `t_itemfraction`(`id`,`condition`,`score`,`subclass`) values (12,'F-0',2.0,'ACADEMY_COLUMN_MAP');
insert  into `t_itemfraction`(`id`,`condition`,`score`,`subclass`) values (13,'G-1',6.0,'ACADEMY_COLUMN_MAP');
insert  into `t_itemfraction`(`id`,`condition`,`score`,`subclass`) values (14,'G-0',2.0,'ACADEMY_COLUMN_MAP');
insert  into `t_itemfraction`(`id`,`condition`,`score`,`subclass`) values (15,'H-1',6.0,'ACADEMY_COLUMN_MAP');
insert  into `t_itemfraction`(`id`,`condition`,`score`,`subclass`) values (16,'H-0',2.0,'ACADEMY_COLUMN_MAP');
insert  into `t_itemfraction`(`id`,`condition`,`score`,`subclass`) values (17,'I-1',6.0,'ACADEMY_COLUMN_MAP');
insert  into `t_itemfraction`(`id`,`condition`,`score`,`subclass`) values (18,'I-0',2.0,'ACADEMY_COLUMN_MAP');
insert  into `t_itemfraction`(`id`,`condition`,`score`,`subclass`) values (19,'J-1',4.0,'ACADEMY_COLUMN_MAP');
insert  into `t_itemfraction`(`id`,`condition`,`score`,`subclass`) values (20,'J-0',1.0,'ACADEMY_COLUMN_MAP');
insert  into `t_itemfraction`(`id`,`condition`,`score`,`subclass`) values (21,'K-1',4.0,'ACADEMY_COLUMN_MAP');
insert  into `t_itemfraction`(`id`,`condition`,`score`,`subclass`) values (22,'K-0',1.0,'ACADEMY_COLUMN_MAP');
insert  into `t_itemfraction`(`id`,`condition`,`score`,`subclass`) values (23,'L-1',2.0,'ACADEMY_COLUMN_MAP');
insert  into `t_itemfraction`(`id`,`condition`,`score`,`subclass`) values (24,'M-1',2.0,'ACADEMY_COLUMN_MAP');
insert  into `t_itemfraction`(`id`,`condition`,`score`,`subclass`) values (25,'A',20.0,'ORGANIZATION_MEDIA_INSTITUTE_MAP');
insert  into `t_itemfraction`(`id`,`condition`,`score`,`subclass`) values (26,'B',20.0,'ORGANIZATION_MEDIA_INSTITUTE_MAP');
insert  into `t_itemfraction`(`id`,`condition`,`score`,`subclass`) values (27,'C',10.0,'ORGANIZATION_MEDIA_INSTITUTE_MAP');
insert  into `t_itemfraction`(`id`,`condition`,`score`,`subclass`) values (28,'D',10.0,'ORGANIZATION_MEDIA_INSTITUTE_MAP');
insert  into `t_itemfraction`(`id`,`condition`,`score`,`subclass`) values (29,'E',10.0,'ORGANIZATION_MEDIA_INSTITUTE_MAP');
insert  into `t_itemfraction`(`id`,`condition`,`score`,`subclass`) values (30,'F',10.0,'ORGANIZATION_MEDIA_INSTITUTE_MAP');
insert  into `t_itemfraction`(`id`,`condition`,`score`,`subclass`) values (31,'G',5.0,'ORGANIZATION_MEDIA_INSTITUTE_MAP');
insert  into `t_itemfraction`(`id`,`condition`,`score`,`subclass`) values (32,'H',5.0,'ORGANIZATION_MEDIA_ADMIN_MAP');
insert  into `t_itemfraction`(`id`,`condition`,`score`,`subclass`) values (33,'I',5.0,'ORGANIZATION_MEDIA_ADMIN_MAP');
insert  into `t_itemfraction`(`id`,`condition`,`score`,`subclass`) values (34,'J',5.0,'ORGANIZATION_MEDIA_ADMIN_MAP');
insert  into `t_itemfraction`(`id`,`condition`,`score`,`subclass`) values (35,'K',2.0,'ORGANIZATION_MEDIA_ADMIN_MAP');
insert  into `t_itemfraction`(`id`,`condition`,`score`,`subclass`) values (49,'L',5.0,'ORGANIZATION_MEDIA_INSTITUTE_MAP');
insert  into `t_itemfraction`(`id`,`condition`,`score`,`subclass`) values (50,'M',5.0,'ORGANIZATION_MEDIA_INSTITUTE_MAP');
insert  into `t_itemfraction`(`id`,`condition`,`score`,`subclass`) values (51,'N',5.0,'ORGANIZATION_MEDIA_INSTITUTE_MAP');
insert  into `t_itemfraction`(`id`,`condition`,`score`,`subclass`) values (52,'O',2.0,'ORGANIZATION_MEDIA_INSTITUTE_MAP');
insert  into `t_itemfraction`(`id`,`condition`,`score`,`subclass`) values (36,'A',40.0,'PRIZE_MAP');
insert  into `t_itemfraction`(`id`,`condition`,`score`,`subclass`) values (37,'B',20.0,'PRIZE_MAP');
insert  into `t_itemfraction`(`id`,`condition`,`score`,`subclass`) values (38,'C',15.0,'PRIZE_MAP');
insert  into `t_itemfraction`(`id`,`condition`,`score`,`subclass`) values (39,'D',40.0,'PRIZE_MAP');
insert  into `t_itemfraction`(`id`,`condition`,`score`,`subclass`) values (40,'E',20.0,'PRIZE_MAP');
insert  into `t_itemfraction`(`id`,`condition`,`score`,`subclass`) values (41,'F',15.0,'PRIZE_MAP');
insert  into `t_itemfraction`(`id`,`condition`,`score`,`subclass`) values (42,'A',10.0,'NEWSLETTER_CARRY_MAP');
insert  into `t_itemfraction`(`id`,`condition`,`score`,`subclass`) values (43,'B',2.0,'NEWSLETTER_CARRY_MAP');
insert  into `t_itemfraction`(`id`,`condition`,`score`,`subclass`) values (44,'B',10.0,'ADVANCEEDGROUP_PRIZE_MAP');
insert  into `t_itemfraction`(`id`,`condition`,`score`,`subclass`) values (45,'A',30.0,'ADVANCEEDGROUP_PRIZE_MAP');
insert  into `t_itemfraction`(`id`,`condition`,`score`,`subclass`) values (46,'Y',15.0,'INNOVATE_MAP');
insert  into `t_itemfraction`(`id`,`condition`,`score`,`subclass`) values (47,'N',5.0,'INNOVATE_MAP');
insert  into `t_itemfraction`(`id`,`condition`,`score`,`subclass`) values (48,'A',30.0,'LEADERINSTRUCTION_MAP');

/*Table structure for table `t_itemlist` */

DROP TABLE IF EXISTS `t_itemlist`;

CREATE TABLE `t_itemlist` (
  `id` int(11) NOT NULL auto_increment COMMENT '主键',
  `itemclass` varchar(10) NOT NULL default '' COMMENT '类别（新闻，科普，期刊，党建）',
  `subclass` varchar(50) NOT NULL default '' COMMENT '子类',
  `idno` varchar(10) NOT NULL default '' COMMENT '标识',
  `name` varchar(200) NOT NULL default '' COMMENT '名称',
  `isvalid` char(1) default 'Y' COMMENT '是否有效',
  PRIMARY KEY  (`id`)
) ENGINE=MYISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='各类型列表';

/*Data for the table `t_itemlist` */

insert  into `t_itemlist`(`id`,`itemclass`,`subclass`,`idno`,`name`,`isvalid`) values (1,'PB','ACADEMY_COLUMN_MAP','A','党建园地','Y');
insert  into `t_itemlist`(`id`,`itemclass`,`subclass`,`idno`,`name`,`isvalid`) values (2,'PB','ACADEMY_COLUMN_MAP','B','创新文化','Y');
insert  into `t_itemlist`(`id`,`itemclass`,`subclass`,`idno`,`name`,`isvalid`) values (3,'PB','ACADEMY_COLUMN_MAP','C','科学人生','Y');
insert  into `t_itemlist`(`id`,`itemclass`,`subclass`,`idno`,`name`,`isvalid`) values (4,'PB','ACADEMY_COLUMN_MAP','D','探索研究','Y');
insert  into `t_itemlist`(`id`,`itemclass`,`subclass`,`idno`,`name`,`isvalid`) values (5,'PB','ACADEMY_COLUMN_MAP','E','非常论道','Y');
insert  into `t_itemlist`(`id`,`itemclass`,`subclass`,`idno`,`name`,`isvalid`) values (6,'PB','ACADEMY_COLUMN_MAP','F','工作案例','Y');
insert  into `t_itemlist`(`id`,`itemclass`,`subclass`,`idno`,`name`,`isvalid`) values (7,'PB','ACADEMY_COLUMN_MAP','G','史海钩沉','Y');
insert  into `t_itemlist`(`id`,`itemclass`,`subclass`,`idno`,`name`,`isvalid`) values (8,'PB','ACADEMY_COLUMN_MAP','H','新科物语','Y');
insert  into `t_itemlist`(`id`,`itemclass`,`subclass`,`idno`,`name`,`isvalid`) values (9,'PB','ACADEMY_COLUMN_MAP','I','他山之石','Y');
insert  into `t_itemlist`(`id`,`itemclass`,`subclass`,`idno`,`name`,`isvalid`) values (10,'PB','ACADEMY_COLUMN_MAP','J','品味书香','Y');
insert  into `t_itemlist`(`id`,`itemclass`,`subclass`,`idno`,`name`,`isvalid`) values (11,'PB','ACADEMY_COLUMN_MAP','K','科海艺苑','Y');
insert  into `t_itemlist`(`id`,`itemclass`,`subclass`,`idno`,`name`,`isvalid`) values (12,'PB','ACADEMY_COLUMN_MAP','L','封二','Y');
insert  into `t_itemlist`(`id`,`itemclass`,`subclass`,`idno`,`name`,`isvalid`) values (13,'PB','ACADEMY_COLUMN_MAP','M','封三','Y');
insert  into `t_itemlist`(`id`,`itemclass`,`subclass`,`idno`,`name`,`isvalid`) values (14,'PB','ORGANIZATION_MEDIA_INSTITUTE_MAP','A','《党建研究》（中组部主管）','Y');
insert  into `t_itemlist`(`id`,`itemclass`,`subclass`,`idno`,`name`,`isvalid`) values (15,'PB','ORGANIZATION_MEDIA_INSTITUTE_MAP','B','《党建》（中宣部主管）','Y');
insert  into `t_itemlist`(`id`,`itemclass`,`subclass`,`idno`,`name`,`isvalid`) values (16,'PB','ORGANIZATION_MEDIA_INSTITUTE_MAP','C','《紫光阁》杂志（中央国家机关工委主管）','Y');
insert  into `t_itemlist`(`id`,`itemclass`,`subclass`,`idno`,`name`,`isvalid`) values (17,'PB','ORGANIZATION_MEDIA_INSTITUTE_MAP','D','《党建研究通讯》（全国党建研究会内刊）','Y');
insert  into `t_itemlist`(`id`,`itemclass`,`subclass`,`idno`,`name`,`isvalid`) values (18,'PB','ORGANIZATION_MEDIA_INSTITUTE_MAP','E','《思想政治工作研究》（中宣部主管）','Y');
insert  into `t_itemlist`(`id`,`itemclass`,`subclass`,`idno`,`name`,`isvalid`) values (19,'PB','ORGANIZATION_MEDIA_INSTITUTE_MAP','F','《中国工运》（中华全国总工会主办）','Y');
insert  into `t_itemlist`(`id`,`itemclass`,`subclass`,`idno`,`name`,`isvalid`) values (20,'PB','ORGANIZATION_MEDIA_INSTITUTE_MAP','G','省级及以上媒体刊发的党建消息','Y');
insert  into `t_itemlist`(`id`,`itemclass`,`subclass`,`idno`,`name`,`isvalid`) values (21,'PB','ORGANIZATION_MEDIA_ADMIN_MAP','H','中国共产党新闻网','Y');
insert  into `t_itemlist`(`id`,`itemclass`,`subclass`,`idno`,`name`,`isvalid`) values (22,'PB','ORGANIZATION_MEDIA_ADMIN_MAP','I','中国文明网','Y');
insert  into `t_itemlist`(`id`,`itemclass`,`subclass`,`idno`,`name`,`isvalid`) values (23,'PB','ORGANIZATION_MEDIA_ADMIN_MAP','J','工委《信息交流》','Y');
insert  into `t_itemlist`(`id`,`itemclass`,`subclass`,`idno`,`name`,`isvalid`) values (24,'PB','ORGANIZATION_MEDIA_ADMIN_MAP','K','紫光阁网站','Y');
insert  into `t_itemlist`(`id`,`itemclass`,`subclass`,`idno`,`name`,`isvalid`) values (35,'PB','ORGANIZATION_MEDIA_INSTITUTE_MAP','L','中国共产党新闻网','Y');
insert  into `t_itemlist`(`id`,`itemclass`,`subclass`,`idno`,`name`,`isvalid`) values (36,'PB','ORGANIZATION_MEDIA_INSTITUTE_MAP','M','中国文明网','Y');
insert  into `t_itemlist`(`id`,`itemclass`,`subclass`,`idno`,`name`,`isvalid`) values (37,'PB','ORGANIZATION_MEDIA_INSTITUTE_MAP','N','工委《信息交流》','Y');
insert  into `t_itemlist`(`id`,`itemclass`,`subclass`,`idno`,`name`,`isvalid`) values (38,'PB','ORGANIZATION_MEDIA_INSTITUTE_MAP','O','紫光阁网站','Y');
insert  into `t_itemlist`(`id`,`itemclass`,`subclass`,`idno`,`name`,`isvalid`) values (25,'PB','PRIZE_MAP','A','全国党建研究会一等奖','Y');
insert  into `t_itemlist`(`id`,`itemclass`,`subclass`,`idno`,`name`,`isvalid`) values (26,'PB','PRIZE_MAP','B','全国党建研究会二等奖','Y');
insert  into `t_itemlist`(`id`,`itemclass`,`subclass`,`idno`,`name`,`isvalid`) values (27,'PB','PRIZE_MAP','C','全国党建研究会三等奖','Y');
insert  into `t_itemlist`(`id`,`itemclass`,`subclass`,`idno`,`name`,`isvalid`) values (28,'PB','PRIZE_MAP','D','中国政研会一等奖','Y');
insert  into `t_itemlist`(`id`,`itemclass`,`subclass`,`idno`,`name`,`isvalid`) values (29,'PB','PRIZE_MAP','E','中国政研会二等奖','Y');
insert  into `t_itemlist`(`id`,`itemclass`,`subclass`,`idno`,`name`,`isvalid`) values (30,'PB','PRIZE_MAP','F','中国政研会三等奖','Y');
insert  into `t_itemlist`(`id`,`itemclass`,`subclass`,`idno`,`name`,`isvalid`) values (31,'PB','NEWSLETTER_CARRY_MAP','A','单独发','Y');
insert  into `t_itemlist`(`id`,`itemclass`,`subclass`,`idno`,`name`,`isvalid`) values (32,'PB','NEWSLETTER_CARRY_MAP','B','提到','Y');
insert  into `t_itemlist`(`id`,`itemclass`,`subclass`,`idno`,`name`,`isvalid`) values (33,'PB','ADVANCEEDGROUP_PRIZE_MAP','A','国家级表彰的先进集体、典型人物','Y');
insert  into `t_itemlist`(`id`,`itemclass`,`subclass`,`idno`,`name`,`isvalid`) values (34,'PB','ADVANCEEDGROUP_PRIZE_MAP','B','省部级单位评选表彰的先进集体、典型人物（院内、中央国家机关工委、各省及直辖市、省直机关工委）','Y');

/*Table structure for table `t_changepas` */

DROP TABLE IF EXISTS `t_changepas`;

create table `t_changepas` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `uid` INT(11) NOT NULL ,
  `createtime` DATETIME NOT NULL COMMENT '创建时间',
  `status` VARCHAR(2) NOT NULL COMMENT '确认状态',
  `code` VARCHAR(50) NOT NULL COMMENT '随机码',
  PRIMARY KEY  (`id`)
) ENGINE=MYISAM DEFAULT CHARSET=utf8 COMMENT='用户密码修改记录表';

/*Data for the table `t_changepas` */

/*Table structure for table `st_statistics` */

DROP TABLE IF EXISTS `st_statistics`;

CREATE TABLE `st_statistics` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `gid` INT(11) NOT NULL COMMENT '机构编号',
  `year` INT(11) NOT NULL COMMENT '年度',
  `quarter` INT(11) NOT NULL COMMENT '季度',
  `systype` VARCHAR(20) NOT NULL COMMENT '系统类型',
  `type` VARCHAR(50) NOT NULL COMMENT '统计指标',
  `score` FLOAT NOT NULL COMMENT '统计分数',
  `num` INT(11) NOT NULL COMMENT '统计数量',
  `year_score` float DEFAULT NULL COMMENT '年度总得分',
  `create_time` DATETIME NOT NULL COMMENT '创建时间',
  `year_rank` INT(11) DEFAULT NULL COMMENT '排名',
  `quarter_rank` INT(11) DEFAULT NULL COMMENT '季度排名',
  `uid` INT(11) DEFAULT NULL COMMENT '创建人的编号',
  PRIMARY KEY (`id`)
) ENGINE=MYISAM DEFAULT CHARSET=utf8 COMMENT='系统统计记录表';

/*Data for the table `st_statistics` */

/*Table structure for table `t_configure` */

DROP TABLE IF EXISTS `t_configure`;

CREATE TABLE `t_configure` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `key` VARCHAR(30) NOT NULL COMMENT '主键',
  `type` VARCHAR(10) NOT NULL COMMENT '类型',
  `value` VARCHAR(2000) NOT NULL COMMENT '取值',
  `update_time` DATETIME DEFAULT NULL COMMENT '更新时间',
  `comment` VARCHAR(100) DEFAULT NULL COMMENT '注释',
  PRIMARY KEY (`id`)
) ENGINE=MYISAM DEFAULT CHARSET=utf8 COMMENT='系统配置信息表';

/*Data for the table `t_configure` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;