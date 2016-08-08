alter table `kepuability`.`t_delayreport` 
   add column `start_date` date NULL COMMENT '填报开始日期' after `last_update`, 
   add column `end_date` date NULL COMMENT '填报结束日期' after `start_date`;

alter table `kepuability`.`pd_newsroom` 
   add column `direction` varchar(100) NULL COMMENT '所属学科' after `institute`, 
   add column `issue` int NULL COMMENT '刊期（1 旬刊 2 双周刊 3 半月刊 4 月刊 5 双月刊 6 季刊 7 其他）' after `direction`, 
   add column `language` int NULL COMMENT '语种（1 中文 2 英文 3 中英文 4 其他）' after `issue`, 
   add column `status` int NULL COMMENT '状态（1 正常 2 未出刊 3 休刊 4 已转出 5 其他）' after `editor`,
   change `type` `type` char(1) character set utf8 collate utf8_general_ci default '1' NULL  comment '期刊性质（1 技术类 2 检索类 3 科普类 4 指导类 5 学术类 6 其他）'

ALTER TABLE pd_newsroom ADD isstatistics INT(11) DEFAULT NULL COMMENT '是否需要期刊填报';

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
  `qqid` int(20) DEFAULT NULL COMMENT 'QQ号码',
  `phone` int(20) DEFAULT NULL COMMENT '手机号码',
  `wenxinid` varchar(50) DEFAULT NULL COMMENT '微信号',
  `status` char(1) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='期刊调查编辑部人员基本情况表';


ALTER TABLE pd_newsroom ADD isstatistics INT(11) DEFAULT NULL COMMENT '是否需要期刊填报';

ALTER TABLE pd_survey_base ADD flconstractdateS date DEFAULT NULL COMMENT '境外合同开始日期';
ALTER TABLE pd_survey_base ADD cnconstractdateS date DEFAULT NULL COMMENT '合同开始日期';

-- insert into t_institute(name,shortname,enname,type,code,substat,branch,sort)
-- select distinct a.iname,a.iname,null,'A',null,0,1,-1 from mytest a where a.iname<>'' and a.iname not in (select name from t_institute) 

-- insert into pd_newsroom(name,institute,direction,issue,language,setupdate,type,status,isstatistics)
-- select a.name,b.id,a.s,case a.kq when '旬刊' then 1  WHEN '双周刊' THEN 2  WHEN '半月刊' THEN 3  WHEN '月刊' THEN 4  WHEN '双月刊' THEN 5  WHEN '季刊' THEN 6  WHEN '' THEN 7 end as kq ,
-- case a.wz when '中文' then  1 when '英文' then 2 when '中英文' then 3  when '' then 4 end as l,'2015-9-14',case a.xz when '技术类' then 1 when '检索类' then 2 WHEN '科普类' THEN 3  WHEN '指导类' THEN 4  WHEN '学术类' THEN 5  WHEN '' THEN 6 end as x,1,1
-- from mytest a,t_institute b where a.iname=b.name 

alter table `kepuability`.`pd_indicator` 
   add column `type` char(1) NULL COMMENT '数据类型（P 期刊填报 I 研究所填报 A 院填报）' after `score`;

ALTER TABLE pd_survey_base  MODIFY COLUMN publicationdate VARCHAR(20) DEFAULT NULL COMMENT '出刊日期';
ALTER TABLE pd_survey_include  MODIFY COLUMN scicontrast VARCHAR(20) DEFAULT NULL COMMENT '对比';


DROP TABLE IF EXISTS `pd_index`;

CREATE TABLE `pd_index` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `code` varchar(50) DEFAULT NULL COMMENT '编码',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `isindex` char(1) DEFAULT '0' COMMENT '是否最终录入指标',
  `indextype` varchar(5) DEFAULT 'P' COMMENT '指标类型（P 编辑部提供 I 研究所提供 A 院提供）',
  `url` varchar(200) DEFAULT NULL COMMENT 'url地址',
  `isvalid` char(1) DEFAULT '1' COMMENT '是否有效',
  `remark` varchar(500) DEFAULT NULL COMMENT '附件上传说明',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='期刊指标 ';

/*Data for the table `pd_index` */

insert  into `pd_index`(`id`,`code`,`name`,`isindex`,`indextype`,`url`,`isvalid`,`remark`) values (1,'01','主办单位支持期刊发展指标','0','AI',NULL,'1',''),(2,'0101','学术支持情况','0','A',NULL,'1',''),(3,'010101','新创办期刊情况','1','A','','1','统计期内，研究所新创办期刊的，10分/种。附件提供新创办期刊需有正式批准的出版号等资料。\r\n'),(4,'0102','行政支持情况','0','I','','1',''),(5,'010201','为主办或承办期刊提供良好办刊条件情况','1','I','','1','统计期内，研究所在人员、经费及办公条件等方面为期刊提供较为充裕支持的，20分；\\n研究所在人员、经费及办公条件等方面为期刊提供一定支持的，10分；\\n研究所支持甚少或无支持，甚至收取相关费用的，期刊编辑部自收自支、举步维艰的，-5分。附研究所在人员、经费及办公条件等方面为期刊支持的具体情况等相关材料（同时，请研究所所属期刊编辑部负责人签字认同）。'),(6,'010202','主办或承办期刊人才队伍支持情况','0','I','','1',''),(7,'01020201','引进办刊人才情况','1','I','','1','统计期内，为编辑部引进骨干人才、并纳入研究所人才支持计划的，20分/位；为期刊编辑部引进骨干人才、效果显著的，并获得院期刊出版领域优秀人才择优支持的，30分/位。\'附相关材料，应包含引进时间，为那个期刊引进，引进效果等。注：引进人才5年内有效，均可得分。'),(8,'01020202','办刊人员待遇情况','1','I','','1','统计期内，办刊人员工资待遇相当于研究所同级研究岗位的，10分；办刊人员工资待遇相当于研究所同级管理岗位的，5分。附相关材料，附工资表等资料。'),(9,'01020203','办刊人员职业发展情况','1','I','','1','统计期内，研究所支持办刊人员申请院出版系列高评委资格评审、并落实相关聘任岗位的，10分；研究所支持办刊人员申请院出版系列高评委资格评审、但未落实相关聘任岗位的，5分；统计期内，研究所支持办刊人员在职取得更高学位或在国外进修的，10分。附相关材料。注：研究所支持办刊人员聘任研究系列高级岗位的，视同得分。'),(10,'02','期刊发展指标','0','AP','','1',''),(11,'0201','审读质量情况','1','A','','1','统计期内，期刊上年度审读结果为优的，10分；期刊上年度审读结果为良的，5分；期刊上年度审读结果为中的，-10分；期刊上年度审读结果为差的，-30分。经审读发现政治问题的，实行一票否决制，期刊整体得0分；同时，取消期刊所在研究所获奖资格。注：对于非我院主管的院属期刊，其审读结果也可由其主管部门提供。'),(12,'0202','期刊数据库收录情况','0','P','','1',''),(13,'02020001','英文学术期刊','1','P','eninclude','1','统计期内，期刊被SCIE、EI新收录的，5分/种；被Scopus、PubMed、DOAJ新收录的，3分/种；'),(14,'02020002','中文学术期刊','1','P','chinclude','1','统计期内，期刊被SCIE、EI、Scopus、PubMed、DOAJ新收录的，5分/种；期刊被CSCD、CSTPCD、CNKI统计源、中文核心期刊新收录的，3分/种。'),(15,'0203','期刊获奖及项目资助情况','0','P','','1',''),(16,'020301','期刊或个人获奖情况','1','P','','1','统计期内，编辑部人员荣获国家级奖励（中国出版政府奖优秀出版人物、优秀编辑、领军人才、“四个一批”人才、韬奋奖等）的，20分；期刊或编辑部人员荣获省部级奖励的，10分；期刊编辑部获得研究所、学协会表彰先进的，5分。附相关材料，包含证书照片等。注：国家级奖励3年有效；其他奖励当年有效。'),(17,'020302','期刊或个人获得项目资助情况','1','P','','1','统计期内，编辑部人员获得国家级项目（中宣部、新闻出版广电总局、基金委等）资助的，20分；期刊编辑部或个人获得省部级项目资助的，10分；期刊编辑部获得研究所、学协会专项资助的，5分。附相关材料，包含项目介绍，签订的合同等。注：项目实施期间有效。'),(18,'03','编辑部绩效工作指标','0','P','','1',''),(19,'0301','编辑部核心工作指标','0','P','','1',''),(20,'030101','学术体系与学风建设工作','0','P','','1',''),(21,'03010101','同行评议制度建设及实施情况','1','P','','1','统计期内，建立并实行科学完善的审稿制度的，10分；统计期内，建立并使用审稿人数据库的，5分。附相关材料，包含制度范本，审稿数据库名称及访问地址等。'),(22,'03010102','发挥编委会作用情况','1','P','','1','统计期内，编委每年人均投稿量大于1，且编委每年人均审稿量大于1的，10分；统计期内，开展优秀编委评选，予以表彰奖励的，5分。附相关材料，包含发表的文章列表等。'),(23,'03010103','加强期刊学风建设情况','1','P','','1','统计期内，公开发布期刊学术诚信声明的，5分；统计期内，使用期刊稿件预防学术不端行为检测工具的，5分。附相关材料，包含学术诚信声明的范本，检查工具的名称及地址等。'),(24,'030102','编辑与策划工作','0','P','','1',''),(25,'03010201','整体策划','1','P','','1','统计期内，为进一步明确期刊定位、服务科研一线需求，及时调整期刊报道方向与重点栏目，效果显著的，10分；统计期内，面向学科前沿及研究热点组织策划出版专刊的（专刊数量一般不超过年度出版刊期的50%），5分/次。附相关材料，包含专刊名称及重点栏目介绍等。'),(26,'03010202','组稿约稿','1','P','','1','统计期内，组约发表优秀稿件（包括专刊），占全部发表稿件总数超过20%的，20分；占全部发表稿件总数10-20%的，10分；占全部发表稿件总数5-10%的，5分。附稿件题目、作者、组稿人，以及组约稿件相关邮件信息等证明材料。'),(27,'03010203','初审把关','1','P','','1','统计期内，经编辑部初审把关后，稿件经同行评议录用比例高于80%，20分；录用比例在50%-80%的，10分；录用比例在30%-50%的，5分。附年度收稿量、送审量、录用量相关数据，以及编辑部主任签字证明材料。'),(28,'03010204','出版总量','1','P','','1','期刊年度出版总页数超过1000页的，10分；年度出版总页数500-1000页的，5分；年度出版总页数300-500页的，3分。附相关材料；由审读工作组核实。'),(29,'030103','学术传播与营销工作','0','P','','1',''),(30,'03010301','数字传播','1','P','','1','统计期内，期刊积极探索利用数字网络技术与平台传播学术内容，采取多种有效措施，进一步扩大期刊学术影响力，效果显著的，具体主要包括：——期刊自建网站升级 ——先进投审稿系统上线运行 ——OA及富媒体出版 ——博客、微博、微信等新媒体技术 ——在国内外主流媒体以及主要科技新闻发布平台进行推介 期刊每采取一种传播措施，3分/种。附相关材料，包含网站、博客等地址，运行情况，发表文章的地址等。'),(31,'03010302','学术交流与宣传','1','P','','1','统计期内，期刊编辑部主办或承办学术会议的，5分/次；期刊编委在参加学术会议作学术报告时，宣传介绍期刊的，2分/次；期刊编辑积极参加国内外学术会议、加强与学术界交流与推广的，1分/次。附相关材料，包含宣传材料，会议通知，图片等。'),(32,'03010303','发表周期','1','P','search','1','统计期内，平均发表周期（从收稿到在线或纸版发表）在60天以内的，A档；平均发表周期在60-120天的，B档；平均发表周期在120-180天的，C档；平均发表周期在180-360天的，D档；平均发表周期在360天以上的，E档。统计期内，为优秀稿件开辟绿色通道、数字优先发表或即时发表的，5分。院将依据学科差异（如：生命科学及化学等从A档起，物理学及天文学等从B档起，数学、地球科学及信息科学等从C档计起，为平均发表周期最快的，下一档为较快，下同），分别予以赋值（其中，平均发表周期最快的，得10分；平均发表周期较快的，得5分；如滞后1档的，扣5分；如滞后2档的，扣10分）。注：平均发表周期由审读工作组抽查核实。'),(33,'03010304','学术影响','1','P','','1','统计期内，期刊发表稿件获得国际知名期刊与媒体评介的，5分/篇；获得国内重点期刊与主流媒体评介的，2分/篇。统计期内，发表稿件获得SCI他引数超过3次的，2分/篇。统计期内，期刊年度Web下载量比上年度提升幅度较大，且增幅超过20%的，5分；期刊年度Web下载量比上年度稳步提升，且幅度在0%-20%之间的，2分。附相关材料，包含发表的媒体名称，发表文章的截图，日期等；年度Web下载量统计范围包括：期刊自主网站及所依托发布平台。'),(34,'03010305','市场营销','1','P','','1','期刊积极拓展自主经营模式，增强可持续发展能力，期刊年收入（版面费除外，下同）超过30万元的，10分；期刊年收入在10-30万元的，5分；期刊年收入在5-10万元的，3分。期刊年度电子订阅及纸版发行数量整体提高，且增幅超过20%的，5分；期刊年度电子订阅及纸版发行数量基本平稳，幅度在-20%-20%之间的，2分。附相关材料，包含发行信息，发布广告的资料，培训资料等。'),(35,'03010306','探索可持续发展','1','P','','1','统计期内，期刊积极组织院学科期刊集群建设的，8分；期刊积极参加院学科期刊集群建设的，2分/种。统计期内，期刊积极参与探索市场化发展，积极推动组建具有法人地位杂志社的并发挥核心作用的，10分；期刊积极参加组建具有法人地位杂志社的2分/种。如在下一个统计期成效显著的，集群化、市场化发展分值翻番，需附相关材料。'),(36,'020200','.','0','P','','1','');

ALTER TABLE pd_indicator  ADD `type` CHAR(1) DEFAULT NULL COMMENT '数据类型（P 期刊填报 I 研究所填报 A 院填报）';