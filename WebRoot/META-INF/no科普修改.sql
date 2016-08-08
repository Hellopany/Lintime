DROP TABLE IF EXISTS `kp_expert`;

CREATE TABLE `kp_expert` (
  `id` int(11) NOT NULL,
  `type` char(1) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `institute` int(11) DEFAULT NULL,
  `corporation` varchar(200) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `professional` varchar(100) DEFAULT NULL,
  `degree` char(1) DEFAULT NULL,
  `duty` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `telphone` varchar(50) DEFAULT NULL,
  `resume` varchar(500) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `photo` varchar(200) DEFAULT NULL,
  `idcard` varchar(50) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科普专家，包括院内和院外';

/*Table structure for table `kp_organize` */

DROP TABLE IF EXISTS `kp_organize`;

CREATE TABLE `kp_organize` (
  `id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `institute` int(11) DEFAULT NULL,
  `describe` varchar(500) DEFAULT NULL,
  `leader_name` varchar(50) DEFAULT NULL,
  `leader_institute` int(11) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `professional` varchar(100) DEFAULT NULL,
  `degree` char(1) DEFAULT NULL,
  `duty` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `telphone` varchar(50) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `member` varchar(500) DEFAULT NULL,
  `idcard` varchar(50) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `kp_professionaloffice` */

DROP TABLE IF EXISTS `kp_professionaloffice`;

CREATE TABLE `kp_professionaloffice` (
  `id` int(11) NOT NULL,
  `insitute` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `leader` varchar(50) DEFAULT NULL,
  `telphone` varchar(50) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `idcard` varchar(50) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `kp_train` */

DROP TABLE IF EXISTS `kp_train`;

CREATE TABLE `kp_train` (
  `id` int(11) NOT NULL COMMENT '编号',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `institute` int(11) DEFAULT NULL COMMENT '是否成系列',
  `type` char(1) DEFAULT NULL COMMENT '组织、被邀请',
  `grade` char(1) DEFAULT NULL COMMENT '被邀请次数',
  `number` int(11) DEFAULT NULL COMMENT '科普报告听众人数',
  `address` varchar(100) DEFAULT NULL COMMENT '报告举办地点',
  `start_time` date DEFAULT NULL COMMENT '报告举办时间',
  `content` varchar(500) DEFAULT NULL,
  `target` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='科普报告';

/*Table structure for table `kp_volunteer` */

DROP TABLE IF EXISTS `kp_volunteer`;

CREATE TABLE `kp_volunteer` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `institute` int(11) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `professional` varchar(100) DEFAULT NULL,
  `degree` char(1) DEFAULT NULL,
  `duty` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `telphone` varchar(50) DEFAULT NULL,
  `resume` varchar(500) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `photo` varchar(200) DEFAULT NULL,
  `start_time` date DEFAULT NULL,
  `end_time` date DEFAULT NULL,
  `idcard` varchar(50) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `kp_worker` */

DROP TABLE IF EXISTS `kp_worker`;

CREATE TABLE `kp_worker` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `institute` int(11) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `professional` varchar(100) DEFAULT NULL,
  `degree` char(1) DEFAULT NULL,
  `duty` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `telphone` varchar(50) DEFAULT NULL,
  `resume` varchar(500) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `photo` varchar(200) DEFAULT NULL,
  `idcard` varchar(50) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `kp_user`;

CREATE TABLE `kp_user` (
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '编号',
  `name` varchar(20) DEFAULT NULL COMMENT '用户登录名',
  `password` varchar(64) DEFAULT NULL COMMENT '登录密码',
  `authority` char(1) DEFAULT NULL COMMENT '权限',
  `status` char(1) DEFAULT NULL COMMENT '状态',
  `create_date` date DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `t_query`;

CREATE TABLE `t_query` (
  `id` int(5) NOT NULL COMMENT '主键',
  `table_des` varchar(200) DEFAULT NULL COMMENT '表描述',
  `table_name` varchar(50) DEFAULT NULL COMMENT '表名称',
  `column_number` varchar(100) DEFAULT NULL COMMENT '数字列，多列以逗号分隔',
  `column_char` varchar(100) DEFAULT NULL COMMENT '字符列，多列以逗号分隔',
  `column_date` varchar(100) DEFAULT NULL COMMENT '日期列，多列以逗号分隔',
  `column_change` varchar(100) DEFAULT NULL COMMENT '可转换的列，如保存的机构标识，按名称查询',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

alter table `kepuability`.`kp_activity` 
   add column `psr_contact` varchar(50) NULL default '' COMMENT '活动联系人' after `end_time`, add column `psr_telphone` varchar(50) NULL default '' COMMENT '联系电话' after `end_time`, add column `psr_website` varchar(100) NULL default '' COMMENT '活动网址' after `end_time`;
alter table `kepuability`.`kp_article` 
   add column `psr_author` varchar(50) NULL default '' COMMENT '作者' after `publish_time`, add column `psr_telphone` varchar(50) NULL default '' COMMENT '联系电话' after `publish_time`;

alter table `kepuability`.`kp_award` 
   add column `psr_institute` int(11) NULL default '' COMMENT '颁奖单位' after `award_time`;

alter table `kepuability`.`kp_book` 
   add column `psr_award` char(1) NULL default '' COMMENT '是否获奖' after `auther`, add column `psr_telphone` varchar(50) NULL default '' COMMENT '联系电话' after `auther`, add column `psr_awardname` varchar(200) NULL default '' COMMENT '获奖名称' after `auther`;

alter table `kepuability`.`kp_exhibit` 
   add column `psr_scope` varhcar(500) NULL default '' COMMENT '使用场合' after `using_time`;
alter table `kepuability`.`kp_expert` 
   add column `idcard` varchar(50) NULL after `photo`,add column `birthday` date NULL after `idcard`;

alter table `kepuability`.`kp_train` 
   add column `content` varhcar(500) NULL default '' COMMENT '内容' after `start_time`，add column `target` varhcar(500) NULL default '' COMMENT '目标' after `start_time`;
alter table `kepuability`.`kp_volunteer` 
   add column `idcard` varchar(50) NULL after `end_time`;
alter table `kepuability`.`kp_volunteer` 
   add column `birthday` date NULL after `idcard`;

alter table `kepuability`.`kp_worker` 
   add column `idcard` varchar(50) NULL after `photo`, 
   add column `birthday` date NULL after `idcard`;
alter table `kepuability`.`kp_organize` 
   add column `idcard` varchar(50) NULL after `member`, 
   add column `birthday` date NULL after `idcard`;
alter table `kepuability`.`kp_professionaloffice` 
   add column `idcard` varchar(50) NULL after `remark`, 
   add column `birthday` date NULL after `idcard`;

alter table `kepuability`.`kp_report` 
   add column `psr_reporter` varchar(50) NULL after `start_time`, 
   add column `psr_telphone` varchar(50) NULL default '' COMMENT '联系电话' after `start_time`;
alter table `kepuability`.`t_attachment` 
   add column `isphoto` char(1) NULL COMMENT '是否为照片' after `status`;

alter table `kepuability`.`kp_venue` 
   add column `psr_use_time` date NULL default '' COMMENT '启用时间' after `describe`, add column `psr_maxreception` int(11) NULL default '' COMMENT '日最大接待人数' after `describe`, add column `psr_website` varchar(200) NULL default '' COMMENT '活动网址' after `describe`;
alter table `kepuability`.`kp_video` 
   add column `psr_author` varchar(50) NULL default '' COMMENT '作者' after `describe`, add column `psr_telphone` varchar(50) NULL default '' COMMENT '联系电话' after `describe`;

alter table `kepuability`.`t_delayreport` 
   add column `start_date` date NULL COMMENT '开始日期' after `delaydays`,add column `end_date` date NULL COMMENT '结束日期' after `delaydays`;

insert  into `kp_user`(`uid`,`name`,`password`,`authority`,`status`,`create_date`) values (2,'11111','111111','A','1','2015-08-19');


insert  into `t_query`(`id`,`table_des`,`table_name`,`column_number`,`column_char`,`column_date`,`column_change`) values (1,'科普活动','kp_activity','viewers','name,describe,address,psrContact,psrTelphone,psrWebsite','startTime,endTime',NULL),(2,'科普文章','kp_article',NULL,'name,describe,author,telphone,periodicalName','publishTime',NULL),(3,'科普荣誉','kp_award',NULL,'name,describe,honoree','awardTime',NULL),(4,'科普书籍','kp_book','publishNum','name,describe,press,auther,telphone,award,awardname','publishTime',NULL),(5,'院内科普网站','kp_casweb','repostTimes','name,describe,website,repostPosition','happenTime,postTime',NULL),(6,'科普课程','kp_course','times','name,describe','startTime',NULL),(7,'科普展品','kp_exhibit',NULL,'name,describe,activityName','completeTime,usingTime',NULL),(8,'科普专家','kp_expert',NULL,'name,corporation,professional,degree,duty,title,telphone,resume,remark','birthday',NULL),(9,'报纸、期刊科普报道','kp_news',NULL,'name,describe,mediaName,urlAddress','reportTime',NULL),(10,'科普组织','kp_organize',NULL,'name,describe,leaderName,professional,degree,duty,title,telphone,remark','birthday',NULL),(11,'科普期刊','kp_periodical','circulation','name,describe,publishNo,contact,telephone','startTime',NULL),(12,'科普专业处室','kp_professionaloffice',NULL,'name,leader,telphone,remark',NULL,NULL),(13,'科普报告','kp_report','times,number','name,reporter,telphone,describe,address','startTime',NULL),(14,'科普培训/会议','kp_train',NULL,'name,address,content,target','startTime',NULL),(15,'电视、广播的科普报道','kp_tv',NULL,'name,describe,mediaName','reportTime',NULL),(16,'科普场馆/基地','kp_venue','maxreception','name,describe,address,principal,contact,telephone,website','startTime,useTime',NULL),(17,'科普视频','kp_video','length','name,author,telphone,describe,url','createTime,usingTime',NULL),(18,'科普志愿者','kp_volunteer',NULL,'name,professional,degree,duty,title,telphone,resume,remark','startTime,endTime,birthday',NULL),(19,'科普网站','kp_website','pageviews','name,describe,contact,telephone,url','startTime',NULL),(20,'科普工作者','kp_worker',NULL,'name,professional,degree,duty,title,telphone,resume,remark','birthday',NULL);


