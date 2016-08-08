package cn.kepu.ability.kprc.dao.impl;

import org.springframework.stereotype.Repository;

import cn.kepu.ability.kprc.bean.StudentRelation;
import cn.kepu.ability.kprc.dao.StudentRelationDao;
import cn.kepu.base.dao.DaoSupport;


@Repository("studentRelationDao")
public class StudentRelationDaoImpl extends DaoSupport<StudentRelation>
		implements StudentRelationDao {

}
