package cn.kepu.ability.common;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Repository;

import cn.kepu.ability.common.bean.User;
import cn.kepu.ability.utils.BusinessUtils;
import cn.kepu.base.annotation.Authority;
import cn.kepu.base.checker.AuthorityChecker;
import cn.kepu.utils.ContextUtils;
import cn.kepu.utils.PropertyConfigureUtils;
import cn.kepu.utils.StringUtils;

/**
 * Action级别的系统权限检测
 * 
 * @author zhangzl
 */
@Repository("auth_checker")
public class AuthChecker extends AuthorityChecker {

	private static final Log log = LogFactory.getLog(AuthorityChecker.class);

	private static final String LOGIN = "global_login";
	private static final String ADMINLOGIN = "global_admin_login";
	private static final String SUCCESS = "success";
	private static final String ERROR = "error";
	
	
	@Override
	public String check(Authority auth) {
		if(auth.login()) {
			if (!BusinessUtils.isUserLogin()) {
				if (log.isDebugEnabled()) {
					log.debug("用户需要登录后，才可访问！");
				}
				
				// This will not happened!!!
				return LOGIN;
			}
			User user = BusinessUtils.getCurrentUser();
			if (auth.modules().length > 0) {
				if(!inArray(auth.modules(), "")) {
					if (log.isDebugEnabled()) {
						log.debug("用户没有访问此模块的权限");
					}
					ContextUtils.setOpMessage("用户没有访问此模块的权限，请<a href=\""+PropertyConfigureUtils.getString("context_path")+"/logout.html\">更换账号</a>或与管理员联系！");
					return ERROR;
				}
			}
			/*
			if (auth.roles().length > 0) {
				if(!inArray(auth.roles(), "")) {
					if (log.isDebugEnabled()) {
						log.debug("用户没有操作权限");
					}
					ContextUtils.setOpMessage("用户没有操作权限，请<a href=\""+PropertyConfigureUtils.getString("context_path")+"/logout.html\">更换账号</a>或与管理员联系！");
					return ERROR;
				}
			} */
		}
		return SUCCESS;
	}
	
	private boolean inArray(String[] array, String item) {
		if (array == null) {
			return true;
		}
		if (StringUtils.isEmpty(item)) {
			return false;
		}
		for (String aitem : array) {
			if(item.indexOf("|"+aitem+"|") >= 0) {
				return true;
			}
		}
		return false;
	}

}
