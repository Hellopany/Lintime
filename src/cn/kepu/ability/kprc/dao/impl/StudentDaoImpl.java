package cn.kepu.ability.kprc.dao.impl;

import org.springframework.stereotype.Repository;

import cn.kepu.ability.kprc.bean.Student;
import cn.kepu.ability.kprc.dao.StudentDao;
import cn.kepu.base.dao.DaoSupport;

@Repository("studentDao")
public class StudentDaoImpl extends DaoSupport<Student> implements StudentDao {

}
