/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.0.22-community-nt : Database - kepuability
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

/*Table structure for table `pb_academypeople` */

DROP TABLE IF EXISTS `pb_academypeople`;

CREATE TABLE `pb_academypeople` (
  `peopleid` int(11) NOT NULL COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '文章名称',
  `publicationdate` date NOT NULL COMMENT '刊发日期',
  `author` varchar(50) default '' COMMENT '作者',
  `authorcorporation` int(11) NOT NULL COMMENT '作者单位',
  `columnname` varchar(5) default '' COMMENT '栏目名称',
  `address` varchar(100) default NULL COMMENT '地址',
  `tmpcolumnname` varchar(100) default NULL COMMENT '临时栏目名称',
  `tmpscore` decimal(15,2) default '0.00' COMMENT '临时栏目分值',
  `columntype` varchar(1) default '1' COMMENT '原创或转载 1 原创 0 转载',
  `institutes` varchar(600) default NULL COMMENT ' 相关的研究院所，以 |ID| 方式组成',
  PRIMARY KEY  (`peopleid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='科苑人';

/*Data for the table `pb_academypeople` */

insert  into `pb_academypeople`(`peopleid`,`name`,`publicationdate`,`author`,`authorcorporation`,`columnname`,`address`,`tmpcolumnname`,`tmpscore`,`columntype`,`institutes`) values (44,'儿童sdg 111','2014-12-12','阿尔dfg111',1,'A','','23 ','0.00','0',NULL),(203,'srert儿童','2014-12-12','erte色丰富',1,'B','',NULL,'0.00','0',NULL),(204,'sdgds','2014-12-12','sdgsdg',1,'A','sdgdg',NULL,'0.00','0',NULL),(209,'是的冯绍峰','2014-12-12','暗室逢灯',1,'A','asdf',NULL,'0.00','0',NULL),(259,'0000','2014-12-12','00000',1,'A','0000',NULL,'0.00',NULL,'|3|6|8|9|'),(263,'撒地方','2014-12-12',' 徐电饭锅',45,'A','',NULL,'0.00','1',NULL),(271,'rsgsrg ','2014-12-25','sdgsdg',45,'A','sdfgsdfg ',NULL,'0.00','1',NULL),(279,'sdfghfhfsdh','2014-12-18','sdg',45,'A','',NULL,'0.00','1',NULL),(300,'adf','2014-12-26','afasd',45,'E','',NULL,'0.00','1',NULL),(319,'asfdas','2013-01-15','',45,'D','',NULL,'0.00','1',NULL),(320,'ssssss','2014-10-15','',45,'E','',NULL,'0.00','1',NULL),(321,'asdfas','2014-10-15','',45,'F','',NULL,'0.00','1',NULL),(325,'sdfsdf','2014-10-15','',45,'C','',NULL,'0.00','1',NULL),(331,'5555','2014-10-23','',45,'D','',NULL,'0.00','1',NULL);

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
  `address` varchar(100) default NULL COMMENT '地址',
  `certifyfile` varchar(100) default NULL COMMENT '证明文件',
  PRIMARY KEY  (`groupid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='先进集体及个人';

/*Data for the table `pb_advancedgroup` */

insert  into `pb_advancedgroup`(`groupid`,`name`,`describe`,`prizedate`,`persons`,`corporation`,`prizetype`,`address`,`certifyfile`) values (1,'',NULL,'2014-12-12','asdfas阿斯顿反馈',1,'A','afasf','asdfasf'),(2,'asf',NULL,'2014-12-12','asdfas阿斯顿反馈',1,'B','afasf','asdfasf'),(3,'asf','afasfasf','2014-12-12','asdfas阿斯顿反馈',1,'A','afasf','asdfasf'),(237,'dfh','dfhdf','2014-12-12','dfh',1,'A','dfh',NULL),(88,'zy','asf','2014-12-12','asdfbdfaf asf asf',1,'A','http://sohu.com',NULL),(242,'wert','wetewt','2014-12-12','ewrt',45,'A','wet',NULL),(266,'是大法官','到分公司的十多个是电饭锅十多个','2014-12-12','撒地方管事的',45,'B','三个',NULL),(125,'srsert','rstr','2014-12-12','wrstgsr ',1,'B','',NULL),(126,'ertet','ertet','2014-12-12','were',1,'B','asdf ',NULL),(194,'asdf','asasfas','2014-12-12','asfasf',45,'B','asfd',NULL),(195,'fffffrrrrr','fffffffff','2014-12-12','ffff',45,'B','fff',NULL),(273,'adfasdf','adfasdf','2014-12-16','asfasf',45,'B','adfasdf',NULL),(282,'dh df','hdfhdfh','2014-12-24','dfhdfh',45,'B','',NULL),(283,'dfghf','dfhdf','2014-12-11','dfh',45,'B','',NULL),(284,'dfh','dfh','2014-12-17','dfh',45,'B','',NULL),(285,'dgh','dfh','2014-12-13','dfghfh',45,'B','',NULL),(303,'sdgsd','gsdg','2014-12-17','sdgsdgsdg',45,'A','sdg',NULL);

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

/*Data for the table `pb_innovatepublishing` */

insert  into `pb_innovatepublishing`(`publishingid`,`name`,`describe`,`innovatepublishingdate`,`author`,`authorcorporation`,`ispublic`,`circulation`,`issn`,`address`,`certifyfile`) values (339,'3','3','2014-12-02','3','Y','1','33','3','3',NULL),(340,'e','e','2014-12-03','3','Y','1','2','2','',NULL);

/*Table structure for table `pb_leaderinstructions` */

DROP TABLE IF EXISTS `pb_leaderinstructions`;

CREATE TABLE `pb_leaderinstructions` (
  `instructionsid` int(11) NOT NULL COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '批示文章名称',
  `insdescribe` varchar(500) default NULL COMMENT '描述',
  `ispublic` char(1) NOT NULL default '0' COMMENT '是否保密',
  `leader` varchar(50) NOT NULL COMMENT '批示领导',
  `instructionsdate` date NOT NULL COMMENT '批示日期',
  `address` varchar(100) default NULL COMMENT '地址',
  `certifyfile` varchar(100) default NULL COMMENT '证明文件',
   `institutes` varchar(500) default NULL COMMENT '院所名称',
  PRIMARY KEY  (`instructionsid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='领导批示';

/*Data for the table `pb_leaderinstructions` */

insert  into `pb_leaderinstructions`(`instructionsid`,`name`,`insdescribe`,`ispublic`,`leader`,`instructionsdate`,`address`,`certifyfile`,`institutes`) values (293,'a','a','Y','a','2014-12-03','',NULL,NULL),(295,'b','b','Y','b','2014-12-01','b',NULL,NULL),(298,'2','2','N','2','2014-11-04','',NULL,NULL),(332,'6','6','Y','6','2014-12-03','',NULL,NULL),(333,'4','4','Y','4','2014-12-05','',NULL,NULL);

/*Table structure for table `pb_newsletter` */

DROP TABLE IF EXISTS `pb_newsletter`;

CREATE TABLE `pb_newsletter` (
  `letterid` int(11) NOT NULL COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `describe` varchar(100) default NULL COMMENT '描述',
  `issue` varchar(10) default NULL COMMENT '期号',
  `publicationdate` date NOT NULL COMMENT '出版日期',
  `authorcorporation` int(11) NOT NULL COMMENT '作者单位',
  `carrytype` varchar(5) NOT NULL default '' COMMENT '刊发性质',
  PRIMARY KEY  (`letterid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='工作简讯';

/*Data for the table `pb_newsletter` */

insert  into `pb_newsletter`(`letterid`,`name`,`describe`,`issue`,`publicationdate`,`authorcorporation`,`carrytype`) values (141,'工作简讯：【234】','afasff','234','2014-12-09',1,'A'),(211,'工作简讯：【424】','fdasfasdf','424','2014-12-10',1,'B'),(235,'工作简讯：【dg】','sdgsdgsdg','dg','2014-12-16',1,'C'),(241,'工作简讯：【wert】','wet','wert','2014-12-04',9,'A'),(214,'工作简讯：【346】','是电饭锅个','346','2014-12-22',9,'A'),(265,'工作简讯：【3453】','是大法官','3453','2014-12-17',1,'A'),(274,'工作简讯：【fffff】','xdgdzgd','fffff','2014-12-23',28,'A'),(281,'工作简讯：【dfgd】','fghdth','dfgd','2014-12-18',1,'B'),(302,'工作简讯：【er】','sdggs','er','2014-12-16',7,'A');

/*Table structure for table `pb_organization` */

DROP TABLE IF EXISTS `pb_organization`;

CREATE TABLE `pb_organization` (
  `orgid` int(11) NOT NULL COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '文章名称',
  `describe` varchar(100) default NULL COMMENT '描述',
  `publicationdate` date NOT NULL COMMENT '出版日期',
  `issue` varchar(10) default NULL COMMENT '期号',
  `author` varchar(50) NOT NULL COMMENT '作者',
  `authorcorporation` int(11) NOT NULL COMMENT '作者单位',
  `medianame` varchar(5) NOT NULL default '' COMMENT '刊发媒体',
  `mediadescribe` varchar(200) default NULL COMMENT '媒体说明',
  `address` varchar(100) default NULL COMMENT '地址',
  `certifyfile` varchar(100) default NULL COMMENT '证明文件',
  PRIMARY KEY  (`orgid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='上报上级组织';

/*Data for the table `pb_organization` */

insert  into `pb_organization`(`orgid`,`name`,`describe`,`publicationdate`,`issue`,`author`,`authorcorporation`,`medianame`,`mediadescribe`,`address`,`certifyfile`) values (63,'副研究员',NULL,'2014-12-11',NULL,'符号',1,'A',NULL,'规范化',NULL),(186,'rrrr','rrrr','2014-12-25','54r','rrrrasdfsdf',45,'B',NULL,'ert',NULL),(215,'嗯嗯','嗯嗯','2014-12-12','嗯嗯','嗯嗯',45,'C',NULL,'对对对',NULL),(171,'qqqqrrrr','','2014-12-13','qqq','qqq',45,'D',NULL,'qqq',NULL),(239,'wet','wetr','2014-12-06','wt','wet',45,'A',NULL,'wetwet',NULL),(269,'ddfds','safasf','2014-12-26','saf','safsf',45,'F',NULL,'sdfsf',NULL),(270,'tyr','ydrhdf','2014-12-25','fdh','dfhdf',45,'A',NULL,'dfh',NULL),(278,'sgrstr','sg','2014-12-17','dg','sdgsg',45,'A','sgssdgsdgsg','sfgsdg',NULL),(292,'666','666666666','2014-12-09','6666','6666',45,'D','6','666',NULL),(296,'0000','00','2014-12-15','000','000',45,'K','000','00000',NULL),(299,'ADF','ADF','2014-12-09','df','ASDF',45,'C','sdfg','sdg',NULL);

/*Table structure for table `pb_prize` */

DROP TABLE IF EXISTS `pb_prize`;

CREATE TABLE `pb_prize` (
  `prizeid` int(11) NOT NULL COMMENT '主键',
  `name` varchar(50) NOT NULL default '' COMMENT '获奖课题名称',
  `describe` varchar(100) default NULL COMMENT '奖项描述',
  `prizedate` date NOT NULL COMMENT '刊发日期',
  `article` varchar(100) default NULL COMMENT '文章名称',
  `corporation` int(11) NOT NULL COMMENT '获奖单位',
  `prizetype` varchar(5) NOT NULL default '' COMMENT '获奖类型',
  `address` varchar(100) default NULL COMMENT '地址',
  `certifyfile` varchar(100) default NULL COMMENT '证明文件',
  PRIMARY KEY  (`prizeid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='获奖';

/*Data for the table `pb_prize` */

insert  into `pb_prize`(`prizeid`,`name`,`describe`,`prizedate`,`article`,`corporation`,`prizetype`,`address`,`certifyfile`) values (75,', 符号','东方红','2014-12-12','个',45,'A','',NULL),(76,', dfg \'飞“\", , dfg \'飞“\"df dfsdgd','h dfhdfh','2014-12-12','ukuy fhh',1,'B','dfh',NULL),(77,', fgjh ','fgj','2014-12-12','fgj',1,'C','fgj',NULL),(78,', asdfasdf','asdf','2014-12-12','asdf',1,'D','',NULL),(116,'rurturtu','rtyu','2014-12-12','rtutu',45,'A','ru',NULL),(199,'ffg','sdfgsdg','2014-12-12','fgsdf',45,'A','sdg',NULL),(198,'sdfdsdfg','sdfgsdg','2014-12-12','sdgds',45,'A','sdfg',NULL),(240,'wertwe','wetwet','2014-12-12','twt',45,'A','wert',NULL),(264,'的双方各','撒地方管事的','2014-12-12','斯蒂芬归属感公司',45,'A','',NULL),(272,'sd sg','sdfgdfg','2014-12-17','sdfg ',45,'A','sdfgsdfg',NULL),(280,'dsfd','dsg','2014-12-18','gdfgd',45,'A','dfg',NULL),(301,'rwts ','','2014-12-18','sdgsd',45,'D','',NULL);

/*Table structure for table `t_delayreport` */

DROP TABLE IF EXISTS `t_delayreport`;

CREATE TABLE `t_delayreport` (
  `id` int(11) NOT NULL auto_increment,
  `modualname` varchar(30) NOT NULL,
  `year` int(5) NOT NULL,
  `quarter` int(2) NOT NULL,
  `delaydays` int(3) NOT NULL default '0',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_delayreport` */

insert  into `t_delayreport`(`id`,`modualname`,`year`,`quarter`,`delaydays`) values (1,'pb_academypeople',2014,4,56);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
