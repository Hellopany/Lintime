package cn.kepu.ability.common.action;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import cn.kepu.base.MessageType;
import cn.kepu.base.action.BaseAction;
import cn.kepu.utils.ContextUtils;
import cn.kepu.utils.StringUtils;

/**
 * 跳转到指定的JSP页面，中转处理Action类
 * @author zhangzl
 * @version Create at 2013-4-5 19:27:11<br> $Id$
 */
public class GlobalAction extends BaseAction {

	private static final long serialVersionUID = 8764523764123123L;

	private String code;
	private boolean isAdmin;

	public String error() {
		if("403".equals(code)) {
			ContextUtils.setOpMessage(MessageType.WARN, "没有权限访问(403 Acess Denied)");//You don't have permission to access
		}
		if("404".equals(code)) {
			ContextUtils.setOpMessage(MessageType.WARN, "请求的页面不存在(404 NOT FOUND)");
		}
		if("500".equals(code)) {
			ContextUtils.setOpMessage(MessageType.ERROR, "用户请求处理异常，请稍后重新提交请求");//500 SERVER ERROR
		}
		String referUrl = request.getHeader("Referer");
		if(!StringUtils.isEmpty(referUrl) && referUrl.indexOf("/admin") > 0) {
			isAdmin = true;
		} else {
			isAdmin = false;
		}
		return "showmessage";
	}
	
	public String info() {
		StringBuffer message = new StringBuffer();
		Collection<String> actionErrors = this.getActionErrors();
		if(actionErrors != null && actionErrors.size() > 0) {
			message.append("-----------------------------------<br/>");
			for(String error : actionErrors) {
				message.append(error).append("<br/>");
			}
		}
		Collection<String> actionMessages = this.getActionMessages();
		if(actionMessages != null && actionMessages.size() > 0) {
			message.append("-----------------------------------<br/>");
			for(String msg : actionMessages) {
				message.append(msg).append("<br/>");
			}
		}
		Map<String, List<String>> fieldErrors = this.getFieldErrors();
		if(fieldErrors != null && fieldErrors.size() > 0) {
			message.append("-----------------------------------<br/>");
			for(String errorKey : fieldErrors.keySet()) {
				message.append("**").append(errorKey).append(":<br/>");
				for(String msg : fieldErrors.get(errorKey)) {
					message.append(msg).append("<br/>");
				}
			}
		}
		if(message.length() > 0) {
			message.append("-----------------------------------<br/>");
			ContextUtils.setOpMessage(MessageType.ERROR, message.toString());
		}
		String referUrl = request.getHeader("Referer");
		if(!StringUtils.isEmpty(referUrl) && referUrl.indexOf("/admin") > 0) {
			isAdmin = true;
		} else {
			isAdmin = false;
		}
		return "showmessage";
	}
	
	
	public String opinfo(){
		return "opsuccess_message";
		
	}

	// Getters and Setters
	public void setCode(String code) {
		this.code = code;
	}

	public boolean getIsAdmin() {
		return isAdmin;
	}
}
