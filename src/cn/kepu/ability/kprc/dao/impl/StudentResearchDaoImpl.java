package cn.kepu.ability.kprc.dao.impl;

import org.springframework.stereotype.Repository;

import cn.kepu.ability.kprc.bean.StudentResearch;
import cn.kepu.ability.kprc.dao.StudentResearchDao;
import cn.kepu.base.dao.DaoSupport;

@Repository("studentResearchDao")
public class StudentResearchDaoImpl extends DaoSupport<StudentResearch>
		implements StudentResearchDao {

}
