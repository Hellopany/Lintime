package cn.kepu.ability.kprc.dao.impl;

import org.springframework.stereotype.Repository;

import cn.kepu.ability.kprc.bean.School;
import cn.kepu.ability.kprc.dao.SchoolDao;
import cn.kepu.base.dao.DaoSupport;

@Repository("schoolDao")
public class SchoolDaoImpl extends DaoSupport<School> implements SchoolDao {

}
