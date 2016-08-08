package cn.kepu.ability.common.service.impl;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cn.kepu.ability.common.bean.TransMessage;
import cn.kepu.ability.common.bean.User;
import cn.kepu.ability.common.dao.ChangepasDao;
import cn.kepu.ability.common.dao.StaticsDao;
import cn.kepu.ability.common.dao.TransMessageDao;
import cn.kepu.ability.common.dao.UserDao;
import cn.kepu.ability.common.service.StaticsService;
import cn.kepu.ability.common.service.TransMessageService;
import cn.kepu.ability.kprc.bean.SPMember;
import cn.kepu.ability.kprc.dao.SPMemberDao;
import cn.kepu.ability.kprc.service.impl.AdvertiseForServiceImpl;
import cn.kepu.utils.PageModel;
import cn.kepu.utils.StringUtils;

@Repository("staticsService")
public class StaticsServiceImpl implements StaticsService {

	@Autowired
	public StaticsDao staticsDao;
	
	@Override
	public List getDataHql(int pageNo,int pageSize,String schoolid,String careertype,String year) {
		return staticsDao.getDataHql(pageNo,pageSize, schoolid, careertype, year);
	}
	@Override
	public long getDataHqlCount(int pageNo,int pageSize,String schoolid,String careertype,String year) {
		return staticsDao.getDataHqlCount(pageNo,pageSize, schoolid, careertype, year);
	}
	@Override
	public List getStudentsWorkTypes(String schoolid, String careertype,
			String year) {
		// TODO Auto-generated method stub
		return staticsDao.getStudentsWorkTypes(schoolid, careertype, year);
	}
	@Override
	public List getSchoolStudents(String schoolid,String careertype, String year) {
		// TODO Auto-generated method stub
		return staticsDao.getSchoolStudents(schoolid,careertype, year);
	}
	
}

