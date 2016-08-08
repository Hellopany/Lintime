/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.5.28 
*********************************************************************
*/
/*!40101 SET NAMES utf8 */;

create table `pd_survey_incomedetail` (
	`id` double ,
	`newsroomid` double ,
	`insfunds` float ,
	`acafunds` float ,
	`minsfunds` float ,
	`depafunds` float ,
	`issueincome` float ,
	`pageincome` float ,
	`cnkiincome` float ,
	`intincome` float ,
	`adveincome` float ,
	`actincome` float ,
	`selffunds` float ,
	`emplcost` float ,
	`travcost` float ,
	`newsrcost` float ,
	`expcheck` float ,
	`authcost` float ,
	`meetingcost` float ,
	`rewardcost` float ,
	`relatecost` float ,
	`printcost` float ,
	`websitecost` float ,
	`promcost` float ,
	`oacost` float ,
	`othercost` float ,
	`expendname` varchar (600),
	`expendprice` float ,
	`status` varchar (3),
	`year` double ,
	`fillname` varchar (150)
); 
