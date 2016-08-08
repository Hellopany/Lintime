package cn.kepu.ability.common.service.impl;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import cn.kepu.ability.common.Constants;
import cn.kepu.ability.common.bean.User;
import cn.kepu.ability.common.dao.UserDao;
import cn.kepu.ability.common.email.EmailTemplate;
import cn.kepu.ability.common.service.UserService;
import cn.kepu.ability.utils.BusinessUtils;
import cn.kepu.ability.utils.MailUtils;
import cn.kepu.base.MessageType;
import cn.kepu.utils.ContextUtils;
import cn.kepu.utils.PageModel;
import cn.kepu.utils.StringUtils;

/**
 * 用户相关业务处理
 * @author zhangzl
 */
@Repository("userService")
public class UserServiceImpl implements UserService {
	
	private static final Log log = LogFactory.getLog(UserServiceImpl.class);

	
	@Autowired
	public UserDao userDao;

	@Override
	public User getUser(int userId) {
		return userDao.get(userId);
	}

	@Override
	public User getUserByEmail(String email) {
		String where = "where email=?";
		Object[] queryParams = new Object[] { email };
		PageModel<User> page = userDao.find(where, queryParams, null, 1, 1);
		if (!PageModel.isEmpty(page)) {
			return page.getList().get(0);
		}
		return null;
	}

	@Override
	public User getUserByName(String name) {
		String where = "where username=?";
		Object[] queryParams = new Object[] { name };
		PageModel<User> page = userDao.find(where, queryParams, null, 1, 1);
		if (!PageModel.isEmpty(page)) {
			return page.getList().get(0);
		}
		return null;
	}

	@Override
	public User checkUser(User user) {
		if(user == null) {
			ContextUtils.setOpMessage(MessageType.ERROR, "请输入用户名和密码");
			return null;
		}
		User dbuser = null;
		//if(!StringUtils.isEmpty(user.getName()) && user.getName().indexOf("@") < 0) {
			dbuser = getUserByName(user.getName());
		/*} else if(!StringUtils.isEmpty(user.getName()) && user.getName().indexOf("@") > 0) {
			dbuser = getUserByEmail(user.getName());
		} else {
			ContextUtils.setOpMessage(MessageType.ERROR, "请输入正确的用户名或电子邮箱地址");
			return null;
		}*/
		if(dbuser == null || !BusinessUtils.getEncodePassword(user.getPassword()).equals(dbuser.getPassword())) {
			ContextUtils.setOpMessage(MessageType.ERROR, "用户名或密码错误，用户登录失败");
			return null;
		}
		return dbuser;
	}

	@Override
	public User updateLoginInfo(User dbuser, String newip) {
		// Store user information
		// Update ip address and access_token
		userDao.update(dbuser);
		return dbuser;
	}

	@Override
	public User updateSecurity(User user, String password) {
		User dbuser = getUser(user.getId());
		if(dbuser == null || !BusinessUtils.getEncodePassword(user.getPassword()).equals(dbuser.getPassword())) {
			ContextUtils.setOpMessage(MessageType.ERROR, "用户的原密码输入错误，密码修改失败");
			return null;
		}
		dbuser.setPassword(BusinessUtils.getEncodePassword(password));
		userDao.update(dbuser);
		return dbuser;
	}

	@Override
	public User updateInfo(User user) {
		User dbuser = getUser(user.getId());
		dbuser.setUsername(user.getUsername());
		dbuser.setEmail(user.getEmail());
		userDao.update(dbuser);
		return dbuser;
	}

	@Override
	public User resetPassword(int uid, String newpassword) {
		if(StringUtils.isEmpty(uid))
			return null;
		User dbuser = getUser(uid);
		dbuser.setPassword(BusinessUtils.getEncodePassword(newpassword));
		try{
		userDao.update(dbuser);
		}catch(Exception e){
			return null;
		}
		return dbuser;
	}

	@Override
	public boolean sendEmail(int uid, String code) {
		try {
			User user = userDao.get(uid);
			String emailcontent = EmailTemplate.FORGET_PASSWORD;
			String subject = EmailTemplate.SETPASS_EMAIL_TITLE;
			String url = cn.kepu.utils.StringUtils.combineUnixPath(BusinessUtils
					.getWebbasePath(), "/pass_confirm.html?code="
					+ code);
			
			emailcontent = emailcontent.replace("{user_name}", user.getName());
			emailcontent = emailcontent.replace("{url}", url);
			MailUtils.sendMail(user.getEmail(), subject, emailcontent);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	@Override
	public PageModel<User> getUsers(String keywords,String institute,int pageNo, int pageSize ){

		StringBuffer where = new StringBuffer("where 1=1 ");
		List<Object> queryParamList = new ArrayList<Object>();
		
					
		if (!StringUtils.isEmpty(keywords)) {
			where.append( " and ( name = ? or showname like ? )");
			queryParamList.add(keywords);
			queryParamList.add(keywords + "%");
		}		
		if (!StringUtils.isEmpty(institute)) {				
			where.append(" and institute in ("+institute+")");
		}
			
		
		Map<String, String> orderby = new LinkedHashMap<String, String>();
		orderby.put("name", "asc");
		PageModel<User> page = userDao.find(where.toString(), queryParamList.toArray(new Object[0]), orderby, pageNo, pageSize);
		return page;
	}
	
	@Override
	public boolean remove(int uid){

			try {
				userDao.delete(uid);	
				return true;
			} catch (Exception e) {
				log.error("删除"+uid+"失败", e);
				return false;
			}

	}
	
	@Override
	public boolean remove(int[] ids) {
		for(int id : ids) {
			remove(id);
		}
		return true;
	}

	@Override
	public User save(User user, String[] types, String[] business) {
		try{
		user.setPassword(BusinessUtils.getEncodePassword(user.getName()+Constants.BACK_USER_RESET_PSWORD));
		user.setUsername(user.getName());
		Integer uid = (Integer) userDao.save(user);
		user.setId(uid);
		
		}catch(Exception e){
			return null;
		}
		
		return user;
	}
	
}
