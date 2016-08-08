package cn.kepu.ability.kprc.dao.impl;

import org.springframework.stereotype.Repository;

import cn.kepu.ability.kprc.bean.SPMember;
import cn.kepu.ability.kprc.dao.SPMemberDao;
import cn.kepu.base.dao.DaoSupport;

@Repository("spmemberDao")
public class SPMemberDaoImpl extends DaoSupport<SPMember> implements
		SPMemberDao {

}
