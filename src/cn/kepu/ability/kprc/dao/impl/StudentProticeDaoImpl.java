package cn.kepu.ability.kprc.dao.impl;

import org.springframework.stereotype.Repository;

import cn.kepu.ability.kprc.bean.StudentPractice;
import cn.kepu.ability.kprc.dao.StudentProticeDao;
import cn.kepu.base.dao.DaoSupport;

@Repository("studentProticeDao")
public class StudentProticeDaoImpl extends DaoSupport<StudentPractice> implements
		StudentProticeDao {

}
