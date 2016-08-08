package cn.kepu.ability.kprc.dao.impl;

import org.springframework.stereotype.Repository;

import cn.kepu.ability.kprc.bean.StudentEducation;
import cn.kepu.ability.kprc.dao.StudentEducationDao;
import cn.kepu.base.dao.DaoSupport;

@Repository("studentEducationDao")
public class StudentEducationDaoImpl extends DaoSupport<StudentEducation>
		implements StudentEducationDao {

}
