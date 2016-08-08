package cn.kepu.ability.kprc.dao.impl;

import org.springframework.stereotype.Repository;

import cn.kepu.ability.kprc.bean.StudentSchoolRoll;
import cn.kepu.ability.kprc.dao.StudentSchoolRollDao;
import cn.kepu.base.dao.DaoSupport;

@Repository("studentSchoolRollDao")
public class StudentSchoolRollDaoImpl extends DaoSupport<StudentSchoolRoll>
		implements StudentSchoolRollDao {

}
