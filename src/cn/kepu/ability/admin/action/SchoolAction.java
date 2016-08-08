package cn.kepu.ability.admin.action;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;

import cn.kepu.ability.common.Constants;
import cn.kepu.ability.kprc.bean.SPMember;
import cn.kepu.ability.kprc.bean.School;
import cn.kepu.ability.kprc.service.SPMemberService;
import cn.kepu.ability.kprc.service.SchoolService;
import cn.kepu.ability.utils.BusinessUtils;
import cn.kepu.base.MessageType;
import cn.kepu.base.action.PageAction;
import cn.kepu.base.annotation.Authority;
import cn.kepu.utils.ContextUtils;
import cn.kepu.utils.PageModel;

public class SchoolAction extends PageAction<School> {
	@Autowired
	private SchoolService schoolService;
	@Autowired
	private SPMemberService memberService;
	private School school;
	private SPMember member;

	private static final Log log = LogFactory.getLog(SchoolAction.class);
	
	/**
	 * 检查数据合法性
	 * 验证对象是否存在
	 * 验证所有字段是否合法
	 * @return
	 */
	private void checkData(){
		if (school==null){
			ContextUtils.setOpMessage(MessageType.VALIDATE_FAILED,"用户非法访问");
			return;
		}
		if(school.getName().length()>200){
			ContextUtils.setOpMessage(MessageType.VALIDATE_FAILED,"学校名称输入错误");
			return ;
		}
		if (school.getTelphone().length()>50){
			ContextUtils.setOpMessage(MessageType.VALIDATE_FAILED,"电话输入长度错误");
			return ;
		}
		if (school.getRelationuser().length()>50){
			ContextUtils.setOpMessage(MessageType.VALIDATE_FAILED,"联系人输入长度错误");
			return ;
		}
	}
	@Authority(roles={Constants.ST_ORG,Constants.ST_STUDENT})
	public String add() {
		return ADD;
	}
	@Authority(roles={Constants.ST_ORG,Constants.ST_STUDENT})
	public String remove() {
		if(school == null) {
			log.warn("用户非法访问");
			ContextUtils.setOpMessage(MessageType.WARN, "用户非法访问");
			return ERROR;
		}
		//删除用户
		SPMember mem = new SPMember();
		mem.setRoletype(Constants.ST_SCHOOL);
		mem.setBelongto(school.getId());
		PageModel<SPMember> pspm = memberService.getSPMember(mem, 1, 99);
		if (pspm!=null&&pspm.getList().size()>0){
			for(SPMember s:pspm.getList()){
				memberService.removeSPMember(s.getId());
			}
		}
		if(schoolService.removeSchool(school.getId())) {
    		ContextUtils.setOpMessage(MessageType.SUCCESS, "数据删除成功");
			return SUCCESS;
		}
		ContextUtils.setOpMessage(MessageType.ERROR, "数据删除失败");
		return SUCCESS;
	}
	@Authority(roles={Constants.ST_ADMIN})
	public String listschool() {
		pageModel = schoolService.getSchool(null, pageNo, pageSize);
        //变量学校的用户状态
		for(int i=0;i<pageModel.getList().size();i++){
			SPMember mem = new SPMember();
			mem.setRoletype(Constants.ST_SCHOOL);
			mem.setBelongto(pageModel.getList().get(i).getId());
			PageModel<SPMember> pspm = memberService.getSPMember(mem, 1, 1);
			if (pspm!=null&&pspm.getList().size()>0){
				int flag = pspm.getList().get(0).getIsfinishcheck();
				pageModel.getList().get(i).setIsfinishcheck(flag);
			}
		}
		return "schools";
	}
	
	@Authority(roles={Constants.ST_ADMIN})
	public String detail() {
		if(school == null) {
			log.warn("用户非法访问");
			ContextUtils.setOpMessage(MessageType.WARN, "用户非法访问");
			return ERROR;
		}
		school = schoolService.getSchool(school.getId());
		SPMember mem = new SPMember();
		mem.setRoletype(Constants.ST_SCHOOL);
		mem.setBelongto(school.getId());
		PageModel<SPMember> pspm = memberService.getSPMember(mem, 1, 1);
		if (pspm!=null&&pspm.getList().size()>0){
			member = pspm.getList().get(0);
		}
		return DETAIL;
	}
	
	@Authority(roles={Constants.ST_ADMIN})
	public String submit() {
		if(school == null) {
			log.warn("用户非法访问");
			ContextUtils.setOpMessage(MessageType.WARN, "用户非法访问");
			return ERROR;
		}
		school = schoolService.getSchool(school.getId());
		SPMember mem = new SPMember();
		mem.setRoletype(Constants.ST_SCHOOL);
		mem.setBelongto(school.getId());
		PageModel<SPMember> pspm = memberService.getSPMember(mem, 1, 1);
		if (pspm!=null&&pspm.getList().size()>0){
			member = pspm.getList().get(0);
		}
		member.setIsfinishcheck(1);
	    if (memberService.updateSPMember(member)!=null){
		   ContextUtils.setOpMessage(MessageType.SUCCESS, "启用成功");
		   return SUCCESS;
	    }
		return SUCCESS;
	}
	
	@Authority(roles={Constants.ST_ADMIN})
	public String modify() {
		school = schoolService.getSchool(school.getId());
		SPMember mem = new SPMember();
		mem.setRoletype(Constants.ST_SCHOOL);
		mem.setBelongto(school.getId());
		PageModel<SPMember> pspm = memberService.getSPMember(mem, 1, 1);
		if (pspm!=null&&pspm.getList().size()>0){
			member = pspm.getList().get(0);
		}
		return "modify";
	}
	@Authority(roles={Constants.ST_ADMIN})
	public String save() {
		if(school == null) {
			log.warn("用户非法访问");
			ContextUtils.setOpMessage(MessageType.WARN, "用户非法访问");
			return ERROR;
		}
        
		if((school=schoolService.addSchool(school)) != null) {
			member.setCreatedate(new Date());
			member.setLogindate(new Date());
			member.setBelongto(school.getId());
			member.setIsfinishcheck(0);
			member.setIslocked(0);
			member.setName(school.getName());
			member.setRoletype(Constants.ST_SCHOOL);
			String pass = member.getPassword();
			pass = BusinessUtils.getEncodePassword(pass);
			member.setPassword(pass);
		    if (memberService.addSPMember(member)!=null){
			   ContextUtils.setOpMessage(MessageType.SUCCESS, "数据添加成功");
			   return SUCCESS;
		    }
		}
		ContextUtils.setOpMessage(MessageType.ERROR, "数据添加失败");
		return SUCCESS;
	}
	@Authority(roles={Constants.ST_ADMIN})
	public String update() {
		if(school == null) {
			log.warn("用户非法访问");
			ContextUtils.setOpMessage(MessageType.WARN, "用户非法访问");
			return ERROR;
		}
		if(schoolService.updateSchool(school) != null) {
			member.setCreatedate(new Date());
			member.setLogindate(new Date());
			member.setBelongto(school.getId());
			member.setIsfinishcheck(0);
			member.setIslocked(0);
			member.setName(school.getName());
			member.setRoletype(Constants.ST_SCHOOL);
			String pass = member.getPassword();
			pass = BusinessUtils.getEncodePassword(pass);
			member.setPassword(pass);
		    if (memberService.updateSPMember(member)!=null){
			   ContextUtils.setOpMessage(MessageType.SUCCESS, "数据更新成功");
			   return SUCCESS;
		    }
		}
		ContextUtils.setOpMessage(MessageType.ERROR, "数据更新失败");
		return SUCCESS;
	}
	@Authority(roles={Constants.ST_ADMIN})
	public String resetpass() {
		if(school == null) {
			log.warn("用户非法访问");
			ContextUtils.setOpMessage(MessageType.WARN, "用户非法访问");
			return ERROR;
		}
		school = schoolService.getSchool(school.getId());
		SPMember mem = new SPMember();
		mem.setRoletype(Constants.ST_SCHOOL);
		mem.setBelongto(school.getId());
		PageModel<SPMember> pspm = memberService.getSPMember(mem, 1, 1);
		if (pspm!=null&&pspm.getList().size()>0){
			member = pspm.getList().get(0);
		}
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
	// Validate Methods
	public void validateSave() {
		checkData();
	}
	public void validateUpdate() {
		checkData();
	}

	public School getSchool() {
		return school;
	}

	public void setSchool(School school) {
		this.school = school;
	}

	public SPMember getMember() {
		return member;
	}

	public void setMember(SPMember member) {
		this.member = member;
	}

   }
