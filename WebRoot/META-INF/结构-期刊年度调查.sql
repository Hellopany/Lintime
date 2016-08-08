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

/*Table structure for table `pd_survey` */

DROP TABLE IF EXISTS `pd_survey`;

CREATE TABLE `pd_survey` (
  `id` int(11) NOT NULL DEFAULT '0' COMMENT '编号',
  `newsroomid` int(11) DEFAULT NULL COMMENT '编辑部标识',
  `year` int(4) DEFAULT NULL COMMENT '年度',
  `status` char(1) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `pd_survey_attachement` */

DROP TABLE IF EXISTS `pd_survey_attachement`;

CREATE TABLE `pd_survey_attachement` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `newsroomid` int(11) DEFAULT NULL COMMENT '编辑部标识',
  `year` int(4) DEFAULT NULL COMMENT '年度',
  `status` char(1) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='期刊年度调查附件表';

/*Table structure for table `pd_survey_base` */

DROP TABLE IF EXISTS `pd_survey_base`;

CREATE TABLE `pd_survey_base` (
  `id` int(11) NOT NULL COMMENT '编号',
  `status` char(1) DEFAULT NULL COMMENT '状态',
  `newsroomid` int(11) DEFAULT NULL COMMENT '编辑部标识',
  `annual` varchar(4) DEFAULT NULL COMMENT '年度',
  `cnname` varchar(50) DEFAULT NULL COMMENT '中文刊名',
  `cnissn` varchar(20) DEFAULT NULL COMMENT '国内统一刊号',
  `flname` varchar(50) DEFAULT NULL COMMENT '外文刊名',
  `flissn` varchar(20) DEFAULT NULL COMMENT '国际标准刊号',
  `manageinstitute` varchar(100) DEFAULT NULL COMMENT '主管单位名称',
  `email` varchar(50) DEFAULT NULL COMMENT '邮件地址',
  `website` varchar(200) DEFAULT NULL COMMENT '期刊网址',
  `leaveadvertising` varchar(20) DEFAULT NULL COMMENT '广告许可证号',
  `isindelegal` char(1) DEFAULT '1' COMMENT '是否独立法人资格',
  `editor` varchar(20) DEFAULT NULL COMMENT '主编',
  `editorialboard` int(11) DEFAULT '0' COMMENT '编委会人数',
  `fleditorialboard` int(11) DEFAULT '0' COMMENT '外籍编委会人数',
  `director` varchar(20) DEFAULT NULL COMMENT '主任',
  `employees` int(11) DEFAULT '0' COMMENT '人员数量',
  `presscards` int(11) DEFAULT '0' COMMENT '记者证数量',
  `isunionnewsroom` char(1) DEFAULT '1' COMMENT '是否设有联合编辑部',
  `unionnewsroomdirector` varchar(20) DEFAULT NULL COMMENT '联合编辑部负责人',
  `unionnewsroomtel` varchar(20) DEFAULT NULL COMMENT '联合编辑部联系方式',
  `setupdate` date DEFAULT NULL COMMENT '创刊日期',
  `type` char(1) DEFAULT '1' COMMENT '期刊性质',
  `belongscience` char(1) DEFAULT '1' COMMENT '所属学科',
  `chorfl` char(1) DEFAULT '1' COMMENT '文种-',
  `period` varchar(20) DEFAULT NULL COMMENT '刊期',
  `booksize` varchar(10) DEFAULT NULL COMMENT '开本',
  `pages` varchar(10) DEFAULT NULL COMMENT '期均页码',
  `registeaddress` varchar(100) DEFAULT NULL COMMENT '登记地',
  `publicationrange` varchar(100) DEFAULT NULL COMMENT '发行范围',
  `pdc` varchar(20) DEFAULT NULL COMMENT '邮发代号',
  `publicationdate` varchar(20) DEFAULT NULL COMMENT '出刊日期',
  `periodcount` int(11) DEFAULT '0' COMMENT '每期印数',
  `prize` float(15,2) DEFAULT '0.00' COMMENT '每册单价',
  `purpose` varchar(1000) DEFAULT NULL COMMENT '办刊宗旨',
  `reader` varchar(100) DEFAULT NULL COMMENT '读者对象',
  `isele` char(1) DEFAULT '1' COMMENT '是否建有电子版',
  `eleback` varchar(10) DEFAULT NULL COMMENT '电子版回溯年度',
  `eleformat` char(1) DEFAULT '1' COMMENT '电子版格式',
  `elebuildtype` char(1) DEFAULT '1' COMMENT '电子版建设方式',
  `isweb` char(1) DEFAULT '1' COMMENT '是否建成网站',
  `iscurrdownload` char(1) DEFAULT '1' COMMENT '当期下载是否免费',
  `ispassdownload` char(1) DEFAULT '1' COMMENT '过期下载是否免费',
  `isarticle` char(1) DEFAULT '1' COMMENT '是否仅可文章下载',
  `downloadcount` int(11) DEFAULT '0' COMMENT '年均下载量',
  `iswebdeposit` char(1) DEFAULT '1' COMMENT '是否托管',
  `ispriorpublic` char(1) DEFAULT '1' COMMENT '是否优先出版',
  `priorpublicdays` int(1) DEFAULT '0' COMMENT '优先出版提前天数',
  `services` char(1) DEFAULT '1' COMMENT '是否开展服务',
  `iscollectedite` char(1) DEFAULT '1' COMMENT '是否建有采编系统',
  `collecteditename` varchar(20) DEFAULT NULL COMMENT '采编系统名称',
  `publicationtype` char(1) DEFAULT '1' COMMENT '投稿及审稿方式',
  `iscnconstract` char(1) DEFAULT '1' COMMENT '是否签订独家合同',
  `cnconstractpartner` varchar(100) DEFAULT NULL COMMENT '合作单位名称',
  `cnconstractdate` date DEFAULT NULL COMMENT '合同有效期',
  `cnconstractcontent` varchar(100) DEFAULT NULL COMMENT '合同情况',
  `isflconstract` char(1) DEFAULT '1' COMMENT '是否与境外签订独家合同',
  `flconstractpartner` varchar(100) DEFAULT NULL COMMENT '境外合作单位名称',
  `flconstractdate` date DEFAULT NULL COMMENT '境外合同有效期',
  `flconstractcontent` varchar(100) DEFAULT NULL COMMENT '境外合同情况',
  `createuser` varchar(50) DEFAULT NULL COMMENT '录入人',
  `createdate` varchar(50) DEFAULT NULL COMMENT '录入日期',
  `flconstractdateS` date DEFAULT NULL COMMENT '境外合同开始日期',
  `cnconstractdateS` date DEFAULT NULL COMMENT '合同开始日期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='期刊调查基本情况';

/*Table structure for table `pd_survey_base_change` */

DROP TABLE IF EXISTS `pd_survey_base_change`;

CREATE TABLE `pd_survey_base_change` (
  `id` int(11) NOT NULL COMMENT '编号',
  `annual` varchar(4) DEFAULT NULL COMMENT '年度',
  `baseid` int(11) DEFAULT NULL COMMENT '编辑部基本情况标识',
  `changedate` date DEFAULT NULL COMMENT '日期',
  `changecontent` varchar(200) DEFAULT NULL COMMENT '变更内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='期刊调查基本情况编辑部变更情况';

/*Table structure for table `pd_survey_base_hostunit` */

DROP TABLE IF EXISTS `pd_survey_base_hostunit`;

CREATE TABLE `pd_survey_base_hostunit` (
  `id` int(11) NOT NULL COMMENT '编号',
  `baseid` int(11) DEFAULT NULL COMMENT '编辑部基本情况标识',
  `annual` varchar(4) DEFAULT NULL COMMENT '年度',
  `name` varchar(200) DEFAULT NULL COMMENT '主办单位名称',
  `legalcorporate` varchar(50) DEFAULT '1' COMMENT '法人代表',
  `address` varchar(20) DEFAULT NULL COMMENT '地址邮编',
  `tel` varchar(20) DEFAULT NULL COMMENT '电话传真',
  `type` char(1) DEFAULT '1' COMMENT '类型：1 第一主办单位 2 其他主办单位 3 挂靠单位 4 出版单位 5 印刷单位',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='期刊调查基本情况';

/*Table structure for table `pd_survey_base_prizeaid` */

DROP TABLE IF EXISTS `pd_survey_base_prizeaid`;

CREATE TABLE `pd_survey_base_prizeaid` (
  `id` int(11) NOT NULL COMMENT '编号',
  `baseid` int(11) DEFAULT NULL COMMENT '编辑部基本情况标识',
  `year` varchar(4) DEFAULT NULL COMMENT '数据保存年度',
  `annual` varchar(4) DEFAULT NULL COMMENT '事件发生年度',
  `name` varchar(100) DEFAULT NULL COMMENT '项目名称',
  `gradeormoney` varchar(50) DEFAULT NULL COMMENT '奖项等级或者资助金额',
  `type` char(1) DEFAULT NULL COMMENT '类型： 1 奖励 2 资助',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='期刊调查基本情况编辑部获奖和或资助情况';

/*Table structure for table `pd_survey_director` */

DROP TABLE IF EXISTS `pd_survey_director`;

CREATE TABLE `pd_survey_director` (
  `id` int(11) NOT NULL COMMENT '编号',
  `year` int(4) DEFAULT NULL COMMENT '年度',
  `newsroomid` int(11) DEFAULT NULL COMMENT '编辑部标识',
  `name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `tel` varchar(20) DEFAULT NULL COMMENT '电话',
  `tax` varchar(20) DEFAULT NULL COMMENT '传真',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机',
  `email` varchar(50) DEFAULT NULL COMMENT '邮件',
  `status` char(1) DEFAULT 'U' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='期刊调查编辑部期刊负责人';

/*Table structure for table `pd_survey_employee` */

DROP TABLE IF EXISTS `pd_survey_employee`;

CREATE TABLE `pd_survey_employee` (
  `id` int(11) NOT NULL COMMENT '编号',
  `newsroomid` int(11) DEFAULT NULL COMMENT '编辑部标识',
  `headcount` int(4) DEFAULT NULL COMMENT '总人数',
  `official` int(4) DEFAULT NULL COMMENT '正式编制人数',
  `employ` int(4) DEFAULT NULL COMMENT '项目聘用人数',
  `foreign` int(4) DEFAULT NULL COMMENT '外聘数',
  `careercertify` int(4) DEFAULT NULL COMMENT '职业资格证数',
  `editorcertify` int(4) DEFAULT NULL COMMENT '责编证书数',
  `officaildoctor` int(4) DEFAULT NULL COMMENT '正式编制博士人数',
  `officailmaster` int(4) DEFAULT NULL COMMENT '正式编制硕士人数',
  `officailbachelor` int(4) DEFAULT NULL COMMENT '正式编制本科人数',
  `officaillowbachelor` int(4) DEFAULT NULL COMMENT '正式编制本科以下人数',
  `employdoctor` int(4) DEFAULT NULL COMMENT '项目聘用博士人数',
  `employmaster` int(4) DEFAULT NULL COMMENT '项目聘用硕士人数',
  `employbachelor` int(4) DEFAULT NULL COMMENT '项目聘用本科人数',
  `employlowbachelor` int(4) DEFAULT NULL COMMENT '项目聘用本科以下人数',
  `officialseniorengineer` int(4) DEFAULT NULL COMMENT '正式编制正高人数',
  `officaildeputyseniorengineer` int(4) DEFAULT NULL COMMENT '正式编制副高人数',
  `officailinterseniorengineer` int(4) DEFAULT NULL COMMENT '正式编制中级人数',
  `officaillowinterseniorengineer` int(4) DEFAULT NULL COMMENT '正式编制中级以下人数',
  `employseniorengineer` int(4) DEFAULT NULL COMMENT '项目聘用正高人数',
  `employdeputyseniorengineer` int(4) DEFAULT NULL COMMENT '项目聘用副高人数',
  `employinterseniorengineer` int(4) DEFAULT NULL COMMENT '项目聘用中级人数',
  `employlowinterseniorengineer` int(4) DEFAULT NULL COMMENT '项目聘用中级以下人数',
  `official30` int(4) DEFAULT NULL COMMENT '正式编制30以下人数',
  `officail45` int(4) DEFAULT NULL COMMENT '正式编制30-45人数',
  `officail60` int(4) DEFAULT NULL COMMENT '正式编制45-60人数',
  `officailover60` int(4) DEFAULT NULL COMMENT '正式编制60以上人数',
  `employ30` int(4) DEFAULT NULL COMMENT '项目聘用30以下人数',
  `employ45` int(4) DEFAULT NULL COMMENT '项目聘用30-45人数',
  `employ60` int(4) DEFAULT NULL COMMENT '项目聘用45-60人数',
  `employover60` int(4) DEFAULT NULL COMMENT '项目聘用60以上人数',
  `year` int(4) DEFAULT NULL COMMENT '年度',
  `status` char(1) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='期刊调查编辑部人员情况表';

/*Table structure for table `pd_survey_employee_doctor` */

DROP TABLE IF EXISTS `pd_survey_employee_doctor`;

CREATE TABLE `pd_survey_employee_doctor` (
  `id` int(11) NOT NULL COMMENT '编号',
  `employeeid` int(11) DEFAULT NULL COMMENT '人员情况表标识',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `belongscience` varchar(50) DEFAULT NULL COMMENT '学科',
  `age` int(4) DEFAULT NULL COMMENT '年龄',
  `year` int(4) DEFAULT NULL COMMENT '年度',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='期刊调查编辑部优秀人员情况表';

/*Table structure for table `pd_survey_employee_excellent` */

DROP TABLE IF EXISTS `pd_survey_employee_excellent`;

CREATE TABLE `pd_survey_employee_excellent` (
  `id` int(11) NOT NULL COMMENT '编号',
  `employeeid` int(11) DEFAULT NULL COMMENT '人员情况表标识',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `employdate` date DEFAULT NULL COMMENT '聘用日期',
  `year` int(4) DEFAULT NULL COMMENT '年度',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='期刊调查编辑部优秀人员情况表';

/*Table structure for table `pd_survey_employee_information` */

DROP TABLE IF EXISTS `pd_survey_employee_information`;

CREATE TABLE `pd_survey_employee_information` (
  `id` int(11) NOT NULL COMMENT '编号',
  `newsroomid` int(4) NOT NULL COMMENT '编辑部标识',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `year` int(4) DEFAULT NULL COMMENT '年度',
  `nationality` varchar(50) DEFAULT NULL COMMENT '国籍',
  `professional` varchar(50) DEFAULT NULL COMMENT '专业',
  `kyear` int(2) DEFAULT NULL COMMENT '从事科研工作/年',
  `study` date DEFAULT NULL COMMENT '留学时间',
  `unit` varchar(50) DEFAULT NULL COMMENT '留学单位',
  `employp` varchar(500) DEFAULT NULL COMMENT '聘用情况',
  `fulltime` char(1) DEFAULT 'Y' COMMENT '全职/非全职',
  `byear` int(2) DEFAULT NULL COMMENT '从事编辑工作/年',
  `btime` int(2) DEFAULT NULL COMMENT '在本刊每年投入时间（月/年）',
  `ttime` int(2) DEFAULT NULL COMMENT '在他刊每年投入时间（月/年）',
  `parttime` varchar(50) DEFAULT NULL COMMENT '兼职工作期刊名称',
  `expertise` varchar(200) DEFAULT NULL COMMENT '期刊工作中的专长',
  `email` varchar(50) DEFAULT NULL COMMENT 'E-mail地址',
  `qqid` varchar(20) DEFAULT NULL COMMENT 'QQ号码',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `wenxinid` varchar(50) DEFAULT NULL COMMENT '微信号',
  `status` char(1) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='期刊调查编辑部人员基本情况表';

/*Table structure for table `pd_survey_employee_leader` */

DROP TABLE IF EXISTS `pd_survey_employee_leader`;

CREATE TABLE `pd_survey_employee_leader` (
  `id` int(11) NOT NULL COMMENT '编号',
  `employeeid` int(11) DEFAULT NULL COMMENT '人员情况表标识',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `sex` char(1) DEFAULT 'M' COMMENT '性别',
  `birthday` varchar(10) DEFAULT NULL COMMENT '出生日期',
  `political` varchar(10) DEFAULT NULL COMMENT '政治面貌',
  `duty` varchar(50) DEFAULT NULL COMMENT '职务',
  `degree` varchar(20) DEFAULT NULL COMMENT '文化程度',
  `professional` varchar(20) DEFAULT NULL COMMENT '职称',
  `isholdtwo` char(1) DEFAULT '0' COMMENT '是否兼职',
  `type` char(1) DEFAULT NULL COMMENT '类型：1 主编 2 主任',
  `year` int(4) DEFAULT NULL COMMENT '年度',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='期刊调查编辑部人员情况表';

/*Table structure for table `pd_survey_funds` */

DROP TABLE IF EXISTS `pd_survey_funds`;

CREATE TABLE `pd_survey_funds` (
  `id` int(11) NOT NULL COMMENT '编号',
  `newsroomid` int(11) DEFAULT NULL COMMENT '编辑部标识',
  `investmode` char(1) DEFAULT NULL COMMENT '经费投入模式',
  `allocate` float DEFAULT '0' COMMENT '主办单位拨款',
  `aid` float DEFAULT '0' COMMENT '主管单位资助',
  `publicate` float DEFAULT '0' COMMENT '发行',
  `advertise` float DEFAULT '0' COMMENT '广告',
  `database` float DEFAULT '0' COMMENT '数据库加盟',
  `space` float DEFAULT '0' COMMENT '版面费',
  `other` float DEFAULT '0' COMMENT '其他',
  `status` char(1) DEFAULT NULL COMMENT '状态',
  `year` int(4) DEFAULT NULL COMMENT '年度',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='期刊调查编辑部期刊经费情况表';

/*Table structure for table `pd_survey_include` */

DROP TABLE IF EXISTS `pd_survey_include`;

CREATE TABLE `pd_survey_include` (
  `id` int(11) NOT NULL COMMENT '编号',
  `newsroomid` int(11) DEFAULT NULL COMMENT '编辑部标识',
  `isscidisk` char(1) DEFAULT '1' COMMENT 'SCI有光盘',
  `issciweb` char(1) DEFAULT '1' COMMENT 'SCI提供web',
  `iseidisk` char(1) DEFAULT '1' COMMENT 'EI有光盘',
  `iseiweb` char(1) DEFAULT '1' COMMENT 'EI提供web',
  `foreignother` varchar(50) DEFAULT NULL COMMENT '其他',
  `scifactor` varchar(50) DEFAULT NULL COMMENT 'SCI影响因子',
  `scifactororder` int(5) DEFAULT '0' COMMENT 'SCI影响因子排名',
  `sciinclude` int(5) DEFAULT '0' COMMENT 'SCI引用次数',
  `sciincludeorder` int(5) DEFAULT '0' COMMENT 'SCI引用排名',
  `scicontrast` varchar(20) DEFAULT NULL COMMENT '对比',
  `iscscddatabase` char(1) DEFAULT '1' COMMENT 'CSCD数据库',
  `iscstpcddatabase` char(1) DEFAULT '1' COMMENT 'CSTP数据库',
  `iscnkidatabase` char(1) DEFAULT '1' COMMENT 'CNKI数据库',
  `ismainperiod` char(1) DEFAULT '1' COMMENT '中文主要媒体',
  `other` varchar(50) DEFAULT NULL COMMENT '其他媒体',
  `cstpcdfactor` varchar(50) DEFAULT NULL COMMENT 'CSTPCD影响因子',
  `cstpcdfactororder` int(5) DEFAULT '0' COMMENT 'CSTPCD影响因子排名',
  `cstpcdinclude` int(5) DEFAULT '0' COMMENT 'CSTPCD引用次数',
  `cstpcdincludeorder` int(5) DEFAULT '0' COMMENT 'CSTPCD引用排名',
  `cstpcdcontrast` float DEFAULT '0' COMMENT 'CSTPCD对比',
  `status` char(1) DEFAULT NULL COMMENT '状态',
  `year` int(4) DEFAULT NULL COMMENT '年度',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='期刊调查编辑部期刊被引用和收录情况表';

/*Table structure for table `pd_survey_publicate` */

DROP TABLE IF EXISTS `pd_survey_publicate`;

CREATE TABLE `pd_survey_publicate` (
  `id` int(11) NOT NULL COMMENT '编号',
  `newsroomid` int(11) DEFAULT NULL COMMENT '编辑部标识',
  `total` int(5) DEFAULT NULL COMMENT '来稿数量',
  `invites` int(5) DEFAULT NULL COMMENT '组约稿数量',
  `foreigns` int(5) DEFAULT NULL COMMENT '国外来稿数量',
  `totalpublicate` int(5) DEFAULT NULL COMMENT '发稿数量',
  `foreignpublicate` int(5) DEFAULT NULL COMMENT '国外发稿数量',
  `cycle` float DEFAULT '0' COMMENT '平均发表周期',
  `printtype` char(1) DEFAULT NULL COMMENT '印刷形式',
  `totalsell` int(5) DEFAULT NULL COMMENT '发行数量',
  `cnsell` int(5) DEFAULT NULL COMMENT '国内发行数量',
  `foreignsell` int(5) DEFAULT NULL COMMENT '国际发行数量',
  `inchange` int(5) DEFAULT NULL COMMENT '交换数量',
  `isdisk` char(1) DEFAULT '1' COMMENT '是否有配套光盘出版',
  `periods` int(5) DEFAULT NULL COMMENT '增刊期数',
  `status` char(1) DEFAULT NULL COMMENT '状态',
  `year` int(4) DEFAULT NULL COMMENT '年度',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='期刊调查编辑部期刊出版发行情况表';

/*Table structure for table `pd_survey_research` */

DROP TABLE IF EXISTS `pd_survey_research`;

CREATE TABLE `pd_survey_research` (
  `id` int(11) NOT NULL COMMENT '编号',
  `newsroomid` int(11) DEFAULT NULL COMMENT '编辑部标识',
  `name` varchar(200) DEFAULT NULL COMMENT '题目',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `funds` float DEFAULT '0' COMMENT '经费',
  `projectdate` date DEFAULT NULL COMMENT '项目期',
  `enstructcorporation` varchar(200) DEFAULT NULL COMMENT '委托单位',
  `isfinish` char(1) DEFAULT '1' COMMENT '是否完成',
  `type` char(1) DEFAULT NULL COMMENT '类型：1 承担项目 2 研究论文',
  `author` varchar(20) DEFAULT NULL COMMENT '作者',
  `periodname` varchar(50) DEFAULT NULL COMMENT '发表周期',
  `period` varchar(50) DEFAULT NULL COMMENT '期卷',
  `pages` varchar(50) DEFAULT NULL COMMENT '页码',
  `status` char(1) DEFAULT NULL COMMENT '状态',
  `year` int(4) DEFAULT NULL COMMENT '年度',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='期刊调查编辑部期刊研究情况表';

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
