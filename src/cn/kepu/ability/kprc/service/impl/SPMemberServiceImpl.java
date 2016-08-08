package cn.kepu.ability.kprc.service.impl;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cn.kepu.ability.common.bean.User;
import cn.kepu.ability.common.email.EmailTemplate;
import cn.kepu.ability.kprc.bean.SPMember;
import cn.kepu.ability.kprc.dao.SPMemberDao;
import cn.kepu.ability.kprc.service.SPMemberService;
import cn.kepu.ability.utils.BusinessUtils;
import cn.kepu.ability.utils.MailUtils;
import cn.kepu.base.MessageType;
import cn.kepu.utils.ContextUtils;
import cn.kepu.utils.PageModel;
import cn.kepu.utils.StringUtils;
@Repository("memberService")
public class SPMemberServiceImpl implements SPMemberService {
	private static final Log log = LogFactory.getLog(SPMemberServiceImpl.class);
	@Autowired
	private SPMemberDao spmemberDao;
	
	@Override
	public PageModel<SPMember> getSPMember(SPMember spmember,
			int pageNo, int pageSize) {
		String where = "where 1=1";
		List<Object> queryParamList = new ArrayList<Object>();
		if(spmember != null) {
			if (!StringUtils.isEmpty(spmember.getName())) {
				where += " and name like ?";
				queryParamList.add("%" + spmember.getName() + "%");
			}
			if (!StringUtils.isEmpty(spmember.getMobile())) {
				where += " and mobile like ?";
				queryParamList.add("%"+spmember.getMobile()+"%");
			}
			if (!StringUtils.isEmpty(spmember.getRoletype())) {
				where += " and roletype = ?";
				queryParamList.add(spmember.getRoletype());
			}
			if (!StringUtils.isEmpty(spmember.getBelongto())) {
				where += " and belongto = ?";
				queryParamList.add(spmember.getBelongto());
			}
			if (!StringUtils.isEmpty(spmember.getIsfinishcheck())) {
				where += " and isfinishcheck = ?";
				queryParamList.add(spmember.getIsfinishcheck());
			}
		}
		Map<String, String> orderby = new LinkedHashMap<String, String>();
		orderby.put("id", "desc");
		PageModel<SPMember> page = spmemberDao.find(where, queryParamList.toArray(new Object[0]), orderby, pageNo, pageSize);
		return page;
	}

	@Override
	public SPMember getSPMember(int id) {
		return spmemberDao.get(id);
	}

	@Override
	public boolean removeSPMember(int id) {
		try {
			spmemberDao.delete(id);
			return true;
		} catch (Exception e) {
			log.error("删除"+id+"失败", e);
			return false;
		}
	}

	@Override
	public boolean removeSPMembers(int[] ids) {
		for(int id : ids) {
			removeSPMember(id);
		}
		return true;
	}

	@Override
	public SPMember addSPMember(SPMember spmember) {
		try {
			int id = (Integer)spmemberDao.save(spmember);
			return spmember;
		} catch (Exception e) {
			log.error("添加失败", e);
			return null;
		}
	}

	@Override
	public SPMember updateSPMember(SPMember spmember) {
		try {
			spmemberDao.update(spmember);
		} catch (Exception e) {
			log.error("更新"+spmember.getName()+"失败", e);
			return null;
		}
		return spmember;
	}

	@Override
	public SPMember checkSPMember(SPMember spmember) {
		if(spmember == null) {
			ContextUtils.setOpMessage(MessageType.ERROR, "请输入用户名和密码");
			return null;
		}
		SPMember dbuser = null;
		dbuser = getSPMemberByName(spmember.getName());

		if(dbuser == null || !BusinessUtils.getEncodePassword(spmember.getPassword()).equals(dbuser.getPassword())) {
			ContextUtils.setOpMessage(MessageType.ERROR, "用户名或密码错误，用户登录失败");
			return null;
		}
		return dbuser;
	}
	@Override
	public SPMember getSPMemberByName(String name) {
		String where = "where username=?";
		Object[] queryParams = new Object[] { name };
		PageModel<SPMember> page = spmemberDao.find(where, queryParams, null, 1, 1);
		if (!PageModel.isEmpty(page)) {
			return page.getList().get(0);
		}
		return null;
	}
	
	@Override
	public PageModel<SPMember> getSPMembersByNames(String names) {
		String where = "where username in ("+names+")";
		PageModel<SPMember> page = spmemberDao.find(where, null, null, 1, 999);
		if (!PageModel.isEmpty(page)) {
			return page;
		}
		return null;
	}
	
	@Override
	public PageModel<SPMember> getSPMembersByBelongto(String usertype,String belongto) {
		String where = "where roletype='"+usertype+"' and belongto in ("+belongto+")";
		PageModel<SPMember> page = spmemberDao.find(where, null, null, 1, 999);
		if (!PageModel.isEmpty(page)) {
			return page;
		}
		return null;
	}
	@Override
	public SPMember updateLoginInfo(SPMember spmember, String newip) {
		spmemberDao.update(spmember);
		return spmember;
	}
	
	@Override
	public boolean sendEmail(int uid, String code) {
		try {
			SPMember member = spmemberDao.get(uid);
			String emailcontent = EmailTemplate.FORGET_PASSWORD;
			String subject = EmailTemplate.SETPASS_EMAIL_TITLE;
			String url = cn.kepu.utils.StringUtils.combineUnixPath(BusinessUtils
					.getWebbasePath(), "/pass_confirm.html?code="
					+ code);
			
			emailcontent = emailcontent.replace("{user_name}", member.getName());
			emailcontent = emailcontent.replace("{url}", url);
			MailUtils.sendMail(member.getEmail(), subject, emailcontent);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
}
