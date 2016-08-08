package cn.kepu.ability.kprc.dao.impl;

import org.springframework.stereotype.Repository;

import cn.kepu.ability.kprc.bean.StudentHonor;
import cn.kepu.ability.kprc.dao.StudentHonorDao;
import cn.kepu.base.dao.DaoSupport;

@Repository("studentHonorDao")
public class StudentHonorDaoImpl extends DaoSupport<StudentHonor> implements
		StudentHonorDao {

}
