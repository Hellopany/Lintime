package cn.kepu.ability.common.service.impl;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cn.kepu.ability.common.bean.TransMessage;
import cn.kepu.ability.common.bean.User;
import cn.kepu.ability.common.dao.TransMessageDao;
import cn.kepu.ability.common.dao.UserDao;
import cn.kepu.ability.common.service.TransMessageService;
import cn.kepu.ability.kprc.bean.SPMember;
import cn.kepu.ability.kprc.dao.SPMemberDao;
import cn.kepu.ability.kprc.service.impl.AdvertiseForServiceImpl;
import cn.kepu.utils.PageModel;
import cn.kepu.utils.StringUtils;

@Repository("transMessageService")
public class TransMessageServiceImpl implements TransMessageService {
	private static final Log log = LogFactory.getLog(TransMessageServiceImpl.class);
	@Autowired
	public TransMessageDao transMessageDao;
	@Autowired
	public SPMemberDao spmemberDao;
	@Override
	public PageModel<TransMessage> getTransMessages(TransMessage transMessage,int pageNo, int pageSize ){

		StringBuffer where = new StringBuffer("where 1=1 ");
		List<Object> queryParamList = new ArrayList<Object>();
		if (transMessage!=null){			
			if (!StringUtils.isEmpty(transMessage.getSender())) {
				where.append( " and sender=?");
				queryParamList.add(transMessage.getSender());
			}		
			if (!StringUtils.isEmpty(transMessage.getReceivers())) {				
				where.append( " and receivers like ?");
				queryParamList.add("%|"+transMessage.getReceivers()+"|%");
			}
			if (!StringUtils.isEmpty(transMessage.getTitle())) {				
				where.append( " and title like ?");
				queryParamList.add("%"+transMessage.getTitle()+"%");
			}
			if (transMessage.getSenddate()!=null) {
				where.append( " and senddate >= ?");
				queryParamList.add(transMessage.getSenddate());
			}
		}
		
		Map<String, String> orderby = new LinkedHashMap<String, String>();
		orderby.put("id", "desc");
		PageModel<TransMessage> page = transMessageDao.find(where.toString(), queryParamList.toArray(new Object[0]), orderby, pageNo, pageSize);
		return page;
	}
	
	@Override
	public boolean isExists(int id) {
		StringBuffer where = new StringBuffer("where ");		
		where.append(" sender= ")
		     .append(id)
		     .append(" or ")
		     .append(" receivers like '%|")
		     .append(id)
		     .append("|%'");		
		PageModel<TransMessage> page = transMessageDao.find(where.toString(), null, null, 1, 1);
		if (page!=null&&page.getList().size()>0) return true;
		return false;
	}

	@Override
	public List<SPMember> getAllReceivers(String receivers) {
		if (StringUtils.isEmpty(receivers)) {
			return null;
		}
		String tmp = receivers.replaceAll("\\|", ",");
		tmp = tmp.substring(1, tmp.length()-1);
		StringBuffer where = new StringBuffer("where 1=1 ");
		where.append( " and id in (")
		     .append(tmp)
		     .append(")");

		PageModel<SPMember> page = spmemberDao.find(where.toString(), null, null, 1, 9999);
		return page.getList();
	}

	@Override
	public TransMessage getTransMessage(int id) {
		return transMessageDao.get(id);
	}

	@Override
	public boolean removeTransMessage(int id) {
		try {
			transMessageDao.delete(id);
			return true;
		} catch (Exception e) {
			log.error("删除"+id+"失败", e);
			return false;
		}
	}

	@Override
	public boolean removeTransMessages(int[] ids) {
		for(int id : ids) {
			removeTransMessage(id);
		}
		return true;
	}

	@Override
	public TransMessage addTransMessage(TransMessage transMessage) {
		try {
			int id = (Integer)transMessageDao.save(transMessage);
			transMessage.setId(id);
			return transMessage;
		} catch (Exception e) {
			log.error("添加失败", e);
			return null;
		}
	}

	@Override
	public TransMessage updateTransMessage(TransMessage transMessage) {
		try {
			transMessageDao.update(transMessage);
		} catch (Exception e) {
			log.error("更新"+transMessage.getTitle()+"失败", e);
			return null;
		}
		return transMessage;
	}
}

