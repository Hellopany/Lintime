insert into `t_institute` (`id`, `name`, `shortname`, `enname`, `type`, `code`, `substat`, `branch`, `sort`) values('178','中国科学院水利部水土保持研究所','水保所','iswc','C',NULL,'0','10','177');
INSERT INTO t_user(NAME,PASSWORD,showname,TYPE,business,institute,login_times,newsroom) VALUE('iswc-xw','7a2fbb3ab564038c162a2bc16216f050','iswc-xw','|I|','|N1|',178,0,0);
INSERT INTO t_user(NAME,PASSWORD,showname,TYPE,business,institute,login_times,newsroom) VALUE('iswc-wx','7a2fbb3ab564038c162a2bc16216f050','iswc-wx','|I|','|N2|',178,0,0);
INSERT INTO t_user(NAME,PASSWORD,showname,TYPE,business,institute,login_times,newsroom) VALUE('iswc-kp','7a2fbb3ab564038c162a2bc16216f050','iswc-kp','|I|','|K|',178,0,0);
INSERT INTO t_user(NAME,PASSWORD,showname,TYPE,business,institute,login_times,newsroom) VALUE('iswc-dx','7a2fbb3ab564038c162a2bc16216f050','iswc-dx','|I|','|PB|',178,0,0);
INSERT INTO t_user(NAME,PASSWORD,showname,TYPE,business,institute,login_times,newsroom) VALUE('iswc-qk','7a2fbb3ab564038c162a2bc16216f050','iswc-qk','|I|','|P|',178,0,0);

INSERT INTO t_user(NAME,PASSWORD,showname,TYPE,business,institute,login_times,newsroom) SELECT direction,'7a2fbb3ab564038c162a2bc16216f050',NAME,'|P|','|P|',institute,0,id FROM pd_newsroom WHERE isstatistics=1;

UPDATE t_user SET PASSWORD='7a2fbb3ab564038c162a2bc16216f050' WHERE NAME LIKE '%-qk'

