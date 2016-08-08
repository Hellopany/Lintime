package cn.kepu.ability.common.dao;

import java.util.List;

import cn.kepu.ability.common.bean.TransMessage;
import cn.kepu.ability.kprc.bean.SPMember;
import cn.kepu.ability.kprc.bean.School;
import cn.kepu.ability.kprc.bean.Statics;
import cn.kepu.base.dao.BaseDao;

public interface StaticsDao  extends BaseDao<Statics>{
	
	public List getDataHql(int pageNO,int pageSize,String schoolid,String careetype,String year);
	public long getDataHqlCount(int pageNO,int pageSize,String schoolid,String careetype,String year);
	
	//统计学校和学生人数
	public  List getSchoolStudents(String schoolid,String careertype,String year);
	//统计不同学校的不同就业意向的学生人数
	public List getStudentsWorkTypes(String schoolid,String careetype,String year);
}
