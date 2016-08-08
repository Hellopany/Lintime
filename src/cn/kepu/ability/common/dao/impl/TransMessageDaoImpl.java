package cn.kepu.ability.common.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import cn.kepu.ability.common.dao.TransMessageDao;
import cn.kepu.base.dao.DaoSupport;
import cn.kepu.ability.common.bean.TransMessage;
import cn.kepu.ability.kprc.bean.SPMember;

@Repository("transMessageDao")
public class TransMessageDaoImpl extends DaoSupport<TransMessage> implements
		TransMessageDao {
}
