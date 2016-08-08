package cn.kepu.ability.kprc.dao.impl;

import org.springframework.stereotype.Repository;

import cn.kepu.ability.kprc.bean.StudentCareer;
import cn.kepu.ability.kprc.dao.StudentCareerDao;
import cn.kepu.base.dao.DaoSupport;

@Repository("studentCareerDao")
public class StudentCareerDaoImpl extends DaoSupport<StudentCareer> implements
		StudentCareerDao {

}
