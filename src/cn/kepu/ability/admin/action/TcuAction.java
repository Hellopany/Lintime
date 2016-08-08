package cn.kepu.ability.admin.action;

import java.util.Date;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;

import cn.kepu.ability.common.Constants;
import cn.kepu.ability.common.bean.TransMessage;
import cn.kepu.ability.kprc.bean.SPMember;
import cn.kepu.ability.kprc.bean.Tcu;
import cn.kepu.ability.kprc.service.SPMemberService;
import cn.kepu.ability.kprc.service.TcuService;
import cn.kepu.base.MessageType;
import cn.kepu.base.action.PageAction;
import cn.kepu.utils.ContextUtils;
import cn.kepu.utils.PageModel;
 
public class TcuAction  extends PageAction<Tcu>{
	private static final Log log = LogFactory.getLog(MemberAction.class);
	@Autowired
	private TcuService tcuService;
	private SPMemberService memberService;
	public SPMemberService getMemberService() {
		return memberService;
	}
	public void setMemberService(SPMemberService memberService) {
		this.memberService = memberService;
	}
	private Tcu tcu;
	PageModel<TransMessage> list;
	private SPMember member;
	public SPMember getMember() {
		return member;
	}
	public void setMember(SPMember member) {
		this.member = member;
	}
	public String listtcus(){
	    pageModel=tcuService.getTcus(null,1,99);
		return "tcus";
	}
	public String add(){
		return "add";
	}
	public String sava(){
		if (tcu==null){
    		ContextUtils.setOpMessage(MessageType.WARN, "数据不存在");
			return ERROR;
    	}
		 tcu.setIsfinishcheck(0);
		if ((tcu=tcuService.addTcu(tcu))!=null){
    		ContextUtils.setOpMessage(MessageType.SUCCESS, "单位添加成功");
			return listtcus();
    	}
    	ContextUtils.setOpMessage(MessageType.ERROR, "单位添加失败");
		return listtcus();
    
	}
	public String detail() {
	tcu = tcuService.getTcu(tcu.getId());
		return "tcu";
	}
	
	public String remove(){
		tcu = tcuService.getTcu(tcu.getId());
		if(tcu == null) {
			log.warn("用户非法访问");
			ContextUtils.setOpMessage(MessageType.WARN, "用户非法访问");
			return ERROR;
		}
		if (tcuService.removeTcu(tcu.getId())){
			   ContextUtils.setOpMessage(MessageType.SUCCESS, "删除成功");
			   return SUCCESS;
		}
		ContextUtils.setOpMessage(MessageType.SUCCESS, "删除失败");
		return SUCCESS;
	}
	public String update(){
		tcu.setIsfinishcheck(0);
		if ((tcu=tcuService.updateTcu(tcu))!=null){
    		ContextUtils.setOpMessage(MessageType.SUCCESS, "单位修改成功");
			return listtcus();
    	}
    	ContextUtils.setOpMessage(MessageType.ERROR, "单位修改失败");
		return listtcus();
		
	}
	public String modify() {
		if (tcu==null){
    		ContextUtils.setOpMessage(MessageType.WARN, "数据不存在");
			return ERROR;
    	}
		tcu = tcuService.getTcu(tcu.getId());
		return "modify";
	}
	public String pass() {
		if(tcu == null) {
			log.warn("用户非法访问");
			ContextUtils.setOpMessage(MessageType.WARN, "用户非法访问");
			return ERROR;
		}
		tcu =tcuService.getTcu(tcu.getId());
		tcu.setIsfinishcheck(1);
		SPMember mem = new SPMember();
		mem.setCreatedate(new Date());
		mem.setEmail(tcu.getEmail());
		mem.setIslocked(0);
		mem.setIsfinishcheck(tcu.getIsfinishcheck());
	    mem.setRoletype(Constants.ST_TCU);
	    mem.setPassword("7a2fbb3ab564038c162a2bc16216f050");
	    mem.setUsername(tcu.getName());
	    mem.setName(tcu.getPost());
	    mem.setGender("M");
	    mem.setIsmanagercreate(1);
		memberService.addSPMember(mem);
		if (tcuService.updateTcu(tcu)!=null){
			   ContextUtils.setOpMessage(MessageType.SUCCESS, "审核通过成功");
			   return SUCCESS;
		}
		ContextUtils.setOpMessage(MessageType.SUCCESS, "审核通过失败");
		return SUCCESS;
	   
	}

	
	
	
	public Tcu getTcu() {
		return tcu;
	}
	public void setTcu(Tcu tcu) {
		this.tcu = tcu;
	}
	public TcuService getTcuService() {
		return tcuService;
	}
	public void setTcuService(TcuService tcuService) {
		this.tcuService = tcuService;
	}
	
}
