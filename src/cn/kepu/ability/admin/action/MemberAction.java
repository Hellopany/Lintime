package cn.kepu.ability.admin.action;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;

import cn.kepu.ability.common.Constants;
import cn.kepu.ability.common.bean.Changepas;
import cn.kepu.ability.common.bean.TransMessage;
import cn.kepu.ability.common.bean.User;
import cn.kepu.ability.common.service.ChangepasService;
import cn.kepu.ability.common.service.TransMessageService;
import cn.kepu.ability.common.service.UserService;
import cn.kepu.ability.kprc.bean.AdvertiseFor;
import cn.kepu.ability.kprc.bean.SPMember;
import cn.kepu.ability.kprc.service.AdvertiseForService;
import cn.kepu.ability.kprc.service.SPMemberService;
import cn.kepu.ability.utils.BusinessUtils;
import cn.kepu.base.MessageType;
import cn.kepu.base.action.BaseAction;
import cn.kepu.base.action.PageAction;
import cn.kepu.base.annotation.Authority;
import cn.kepu.utils.ContextUtils;
import cn.kepu.utils.DateTimeUtils;
import cn.kepu.utils.PageModel;
import cn.kepu.utils.StringUtils;

/**
 * @author zy
 */
public class MemberAction extends PageAction<SPMember> {

	private static final long serialVersionUID = -4148776874506302404L;

	private static final Log log = LogFactory.getLog(MemberAction.class);
	private String username;
	private String code;

	@Autowired
	private UserService userService;
	
	@Autowired
	private AdvertiseForService advertiseForService;
	
	@Autowired
	private SPMemberService memberService;

	@Autowired
	private TransMessageService transMessageService;

	private SPMember member;
	
	private AdvertiseFor advertiseFor;
	
	PageModel<TransMessage> list;

	
	@Authority(roles={Constants.ST_ADMIN})
	public String listorg() {
		SPMember m = new SPMember();
		m.setRoletype(Constants.ST_ORG);
		pageModel = memberService.getSPMember(m, pageNo, pageSize);

		return "orgs";
	}
	@Authority(roles={Constants.ST_ADMIN})
	public String add() {
		return ADD;
	}
	@Authority(roles={Constants.ST_ADMIN})
	public String modify() {
		if (member==null){
    		ContextUtils.setOpMessage(MessageType.WARN, "数据不存在");
			return ERROR;
    	}
		member = memberService.getSPMember(member.getId());
		return "modify";
	}
	@Authority(roles={Constants.ST_ADMIN})
	public String listmessage() {
		init();
		TransMessage tm = new TransMessage();
		tm.setReceivers("-1");
		//messageModel = transMessageService.getTransMessages(tm, pageNo, pageSize);
        
		return "messages";
	}

	@Authority(roles={Constants.ST_ADMIN})
	public String detail() {
		member = memberService.getSPMember(member.getId());

		return "org";
	}
	@Authority(roles={Constants.ST_ADMIN})
	public String detailadvertise() {
		advertiseFor = advertiseForService.getAdvertiseFor(advertiseFor.getId());
        SPMember member = memberService.getSPMember(advertiseFor.getMemberid());
        if (member!=null){
        	advertiseFor.setMembername(member.getName());
        }
		return "advertise";
	}
	@Authority(roles={Constants.ST_ADMIN})
	public String save(){
    	if (member==null){
    		ContextUtils.setOpMessage(MessageType.WARN, "数据不存在");
			return ERROR;
    	}
    	//添加默认信息
    	member.setCreatedate(new Date());
    	member.setIsfinishcheck(0);
    	member.setIslocked(0);
    	member.setLogindate(new Date());
    	member.setGender("M");
    	member.setRoletype(Constants.ST_ORG);
    	String pass = member.getPassword();
    	String newpass = BusinessUtils.getEncodePassword(pass);
    	member.setPassword(newpass);
    	member.setIsmanagercreate(1);
    	if ((member=memberService.addSPMember(member))!=null){
    		ContextUtils.setOpMessage(MessageType.SUCCESS, "单位添加成功");
			return listorg();
    	}
    	ContextUtils.setOpMessage(MessageType.ERROR, "单位添加失败");
		return listorg();
    }
	@Authority(roles={Constants.ST_ADMIN})
	public String update(){
    	if (member==null){
    		ContextUtils.setOpMessage(MessageType.WARN, "数据不存在");
			return ERROR;
    	}
    	//添加默认信息
    	member.setCreatedate(new Date());
    	member.setIsfinishcheck(0);
    	member.setIslocked(0);
    	member.setLogindate(new Date());
    	member.setGender("M");
    	member.setRoletype(Constants.ST_ORG);
    	String pass = member.getPassword();
    	String newpass = BusinessUtils.getEncodePassword(pass);
    	member.setPassword(newpass);
    	member.setIsmanagercreate(1);
    	if ((member=memberService.updateSPMember(member))!=null){
    		ContextUtils.setOpMessage(MessageType.SUCCESS, "单位修改成功");
			return listorg();
    	}
    	ContextUtils.setOpMessage(MessageType.ERROR, "单位修改失败");
		return listorg();
    }
	@Authority(roles={Constants.ST_ADMIN})
	public String remove() {
		if(member == null) {
			log.warn("用户非法访问");
			ContextUtils.setOpMessage(MessageType.WARN, "用户非法访问");
			return ERROR;
		}
		if (memberService.removeSPMember(member.getId())){
			   ContextUtils.setOpMessage(MessageType.SUCCESS, "删除成功");
			   return SUCCESS;
		}
		ContextUtils.setOpMessage(MessageType.SUCCESS, "删除失败");
		return SUCCESS;
	}
	@Authority(roles={Constants.ST_ADMIN})
	public String pass() {
		if(member == null) {
			log.warn("用户非法访问");
			ContextUtils.setOpMessage(MessageType.WARN, "用户非法访问");
			return ERROR;
		}
		member = memberService.getSPMember(member.getId());
		member.setIsfinishcheck(1);
		if (memberService.updateSPMember(member)!=null){
			   ContextUtils.setOpMessage(MessageType.SUCCESS, "审核通过成功");
			   return SUCCESS;
		}
		ContextUtils.setOpMessage(MessageType.SUCCESS, "审核通过失败");
		return SUCCESS;
	}
	@Authority(roles={Constants.ST_ADMIN})
	public String refuse() {
		if(member == null) {
			log.warn("用户非法访问");
			ContextUtils.setOpMessage(MessageType.WARN, "用户非法访问");
			return ERROR;
		}
		member = memberService.getSPMember(member.getId());
		member.setIsfinishcheck(-1);
		if (memberService.updateSPMember(member)!=null){
			   ContextUtils.setOpMessage(MessageType.SUCCESS, "拒绝成功");
			   return SUCCESS;
		}
		ContextUtils.setOpMessage(MessageType.SUCCESS, "拒绝失败");
		return SUCCESS;
	}
	@Authority(roles={Constants.ST_ADMIN})
	public String resetpass() {
		if(member == null) {
			log.warn("用户非法访问");
			ContextUtils.setOpMessage(MessageType.WARN, "用户非法访问");
			return ERROR;
		}
		member = memberService.getSPMember(member.getId());
		DateFormat format = new SimpleDateFormat("yyyyMMdd");
		String pass = format.format(new Date());
		String newpass = BusinessUtils.getEncodePassword(pass);
		member.setPassword(newpass);
		if (memberService.updateSPMember(member)!=null){
			   ContextUtils.setOpMessage(MessageType.SUCCESS, "重置密码成功！密码为当前日期，既："+pass);
			   return SUCCESS;
		}
		ContextUtils.setOpMessage(MessageType.ERROR, "重置密码失败");
		return SUCCESS;
	}
    private boolean init(){
    	if (!BusinessUtils.isUserLogin()) {
			return false;
		}
		int id=BusinessUtils.getCurrentUser().getId();
		member = memberService.getSPMember(id);
	    return true;	
    }
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public SPMember getMember() {
		return member;
	}

	public void setMember(SPMember member) {
		this.member = member;
	}

	public PageModel<TransMessage> getList() {
		return list;
	}

	public void setList(PageModel<TransMessage> list) {
		this.list = list;
	}
	public PageModel<SPMember> getPageModel() {
		return pageModel;
	}
	public void setPageModel(PageModel<SPMember> pageModel) {
		this.pageModel = pageModel;
	}
	public AdvertiseFor getAdvertiseFor() {
		return advertiseFor;
	}
	public void setAdvertiseFor(AdvertiseFor advertiseFor) {
		this.advertiseFor = advertiseFor;
	}

}
