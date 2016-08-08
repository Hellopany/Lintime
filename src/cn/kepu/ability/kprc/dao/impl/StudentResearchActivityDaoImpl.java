package cn.kepu.ability.kprc.dao.impl;

import org.springframework.stereotype.Repository;

import cn.kepu.ability.kprc.bean.StudentResearchActivity;
import cn.kepu.ability.kprc.dao.StudentResearchActivityDao;
import cn.kepu.base.dao.DaoSupport;


@Repository("studentResearchActivityDao")
public class StudentResearchActivityDaoImpl extends
		DaoSupport<StudentResearchActivity> implements
		StudentResearchActivityDao {

}
