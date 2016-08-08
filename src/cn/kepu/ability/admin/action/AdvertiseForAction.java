package cn.kepu.ability.admin.action;


import java.util.Date;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;

import cn.kepu.ability.common.Constants;
import cn.kepu.ability.common.bean.TransMessage;
import cn.kepu.ability.common.service.AttachmentService;
import cn.kepu.ability.common.service.TransMessageService;
import cn.kepu.ability.kprc.bean.AdvertiseFor;
import cn.kepu.ability.kprc.bean.SPMember;
import cn.kepu.ability.kprc.service.AdvertiseForService;
import cn.kepu.ability.kprc.service.SPMemberService;
import cn.kepu.ability.utils.ApplicationUtils;
import cn.kepu.ability.utils.BusinessUtils;
import cn.kepu.base.MessageType;
import cn.kepu.base.action.PageAction;
import cn.kepu.base.annotation.Authority;
import cn.kepu.utils.ContextUtils;
import cn.kepu.utils.PageModel;


public class AdvertiseForAction extends PageAction<AdvertiseFor> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 3265015262741813098L;
	@Autowired
	private AdvertiseForService advertiseForService;
	@Autowired
	private TransMessageService transMessageService;
	@Autowired
	private AttachmentService attachmentService;
	@Autowired
	private SPMemberService memberService;
	
	private AdvertiseFor advertiseFor;
	public Map<String,String> map;
	PageModel<TransMessage> list;

	
	private static final Log log = LogFactory.getLog(AdvertiseForAction.class);

	public String index() {
		//获取消息
		TransMessage transMessage = new TransMessage();
		transMessage.setReceivers("-1");
		list  = transMessageService.getTransMessages(transMessage, 1, 20);
		if(list!=null){
			for(int i=0;i<list.getList().size();i++){
				SPMember s=memberService.getSPMember(list.getList().get(i).getSender());
				list.getList().get(i).setSendername(s.getName());
			}
		}
		AdvertiseFor af = new AdvertiseFor();
		af.setStatus("S");
		pageModel = advertiseForService.getAdvertiseFor(af, 1, 20);
		return "index";
	}
	
	@Authority(roles={Constants.ST_ADMIN})
	public String list() {
		pageModel = advertiseForService.getAdvertiseFor(null, pageNo, pageSize);

		if(pageModel!=null){
			for(int i=0;i<pageModel.getList().size();i++){
				SPMember s=memberService.getSPMember(pageModel.getList().get(i).getMemberid());
				if (s!=null){
				   pageModel.getList().get(i).setMembername(s.getName());
				}
				String status = pageModel.getList().get(i).getStatus();
				pageModel.getList().get(i).setStatusname(ApplicationUtils.getStatusCategory().get(status));
			}
		}
		return "list";
	}
	@Authority(roles={Constants.ST_ADMIN})
	public String pass() {
		if(advertiseFor == null) {
			log.warn("用户非法访问");
			ContextUtils.setOpMessage(MessageType.WARN, "用户非法访问");
			return ERROR;
		}
		advertiseFor = advertiseForService.getAdvertiseFor(advertiseFor.getId());
		advertiseFor.setStatus("C");
		if (advertiseForService.updateAdvertiseFor(advertiseFor)!=null){
			   ContextUtils.setOpMessage(MessageType.SUCCESS, "审核通过成功");
			   return SUCCESS;
		}
		ContextUtils.setOpMessage(MessageType.SUCCESS, "审核通过失败");
		return SUCCESS;
	}
	@Authority(roles={Constants.ST_ADMIN})
	public String refuse() {
		if(advertiseFor == null) {
			log.warn("用户非法访问");
			ContextUtils.setOpMessage(MessageType.WARN, "用户非法访问");
			return ERROR;
		}
		advertiseFor = advertiseForService.getAdvertiseFor(advertiseFor.getId());
		advertiseFor.setStatus("R");
		if (advertiseForService.updateAdvertiseFor(advertiseFor)!=null){
			   ContextUtils.setOpMessage(MessageType.SUCCESS, "审核通过成功");
			   return SUCCESS;
		}
		ContextUtils.setOpMessage(MessageType.SUCCESS, "审核通过失败");
		return SUCCESS;
	}
	/**
	 * 检查数据合法性
	 * 验证对象是否存在
	 * 验证所有字段是否合法
	 * @return
	 */
	private void checkData(){
		if (advertiseFor==null){
			ContextUtils.setOpMessage(MessageType.VALIDATE_FAILED,"用户非法访问");
			return;
		}
		if(advertiseFor.getPost().length()>200){
			ContextUtils.setOpMessage(MessageType.VALIDATE_FAILED,"招聘岗位输入错误");
			return ;
		}
		if(advertiseFor.getDescribe().length()>500){
			ContextUtils.setOpMessage(MessageType.VALIDATE_FAILED,"招聘描述输入错误");
			return ;
		}
		if(advertiseFor.getContent().length()>2000){
			ContextUtils.setOpMessage(MessageType.VALIDATE_FAILED,"招聘内容输入长度错误");
			return ;
		}
		if (advertiseFor.getRequeire().length()>2000){
			ContextUtils.setOpMessage(MessageType.VALIDATE_FAILED,"应聘要求输入长度错误");
			return ;
		}
	}


	@Authority(roles={Constants.ST_ORG,Constants.ST_STUDENT})
	public String detail() {
		//attachments = attachmentService.getAttachmentByCid("advertiseFor", advertiseFor.getId());
		//request.setAttribute("attachments", attachments);
		advertiseFor = advertiseForService.getAdvertiseFor(advertiseFor.getId());
		if(advertiseFor == null) {
			ContextUtils.setOpMessage(MessageType.WARN, "用户访问的数据不存在");
			return ERROR;
		}
		SPMember spm = memberService.getSPMember(advertiseFor.getMemberid());
		if (spm!=null){
			advertiseFor.setMembername(spm.getName());
		}
		return DETAIL;
	}

	@Authority(roles={Constants.ST_ORG,Constants.ST_STUDENT})
	public String submit() {
		if(advertiseFor == null) {
			log.warn("用户非法访问");
			ContextUtils.setOpMessage(MessageType.WARN, "用户非法访问");
			return ERROR;
		}
		int id = advertiseFor.getId();
		advertiseFor = advertiseForService.getAdvertiseFor(id);
		advertiseFor.setStatus("S");
		if(advertiseForService.updateAdvertiseFor(advertiseFor) != null) {
			ContextUtils.setOpMessage(MessageType.SUCCESS, "提交成功");
			return SUCCESS;
		}
		ContextUtils.setOpMessage(MessageType.ERROR, "提交失败");
		return SUCCESS;
	}
	// Validate Methods
	public void validateSave() {
		checkData();
	}
	public void validateUpdate() {
		checkData();
	}
	// getters and setters
	public void setAdvertiseFor(AdvertiseFor advertiseFor) {
		this.advertiseFor = advertiseFor;
	}
	public AdvertiseFor getAdvertiseFor() {
		return advertiseFor;
	}

	public PageModel<TransMessage> getList() {
		return list;
	}

	public void setList(PageModel<TransMessage> list) {
		this.list = list;
	}

   }
