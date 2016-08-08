package cn.kepu.ability.kprc.dao.impl;

import org.springframework.stereotype.Repository;

import cn.kepu.ability.kprc.bean.StudentPaper;
import cn.kepu.ability.kprc.dao.StudentPaperDao;
import cn.kepu.base.dao.DaoSupport;

@Repository("studentPaperDao")
public class StudentPaperDaoImpl extends DaoSupport<StudentPaper> implements
		StudentPaperDao {

}
