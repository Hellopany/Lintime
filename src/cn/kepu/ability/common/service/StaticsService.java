package cn.kepu.ability.common.service;

import java.util.List;

import cn.kepu.ability.common.bean.TransMessage;
import cn.kepu.ability.common.bean.User;
import cn.kepu.ability.kprc.bean.AdvertiseFor;
import cn.kepu.ability.kprc.bean.SPMember;
import cn.kepu.utils.PageModel;

public interface StaticsService {
	
	public List getDataHql(int pageNO,int pageSize,String schoolid,String careertype,String year);
	
	public long getDataHqlCount(int pageNO,int pageSize,String schoolid,String careertype,String year);
	
	public List getStudentsWorkTypes(String schoolid, String careertype,
			String year);
	public List getSchoolStudents(String schoolid,String careertype, String year);
}
