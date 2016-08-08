package cn.kepu.ability.admin.action;

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
import cn.kepu.ability.kprc.bean.School;
import cn.kepu.ability.kprc.bean.Student;
import cn.kepu.ability.kprc.service.AdvertiseForService;
import cn.kepu.ability.kprc.service.SPMemberService;
import cn.kepu.ability.kprc.service.SchoolService;
import cn.kepu.ability.kprc.service.StudentService;
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
public class UserAction extends PageAction<User>{

	private static final long serialVersionUID = -4148776874506302404L;

	private static final Log log = LogFactory.getLog(UserAction.class);

	@Autowired
	private UserService userService;
	@Autowired
	private SchoolService schoolService;
	@Autowired
	private SPMemberService memberService;
	@Autowired
	private AdvertiseForService advertiseForService;
	@Autowired
	private ChangepasService changepasService;

	@Autowired
	private TransMessageService transMessageService;

	private User user;
	
	private SPMember member;
	
	PageModel<TransMessage> list;
	PageModel<SPMember>  pageModel;
	PageModel<AdvertiseFor> advertiseModel;


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
		advertiseModel = advertiseForService.getAdvertiseFor(af, 1, 20);
		if (advertiseModel!=null&&advertiseModel.getList().size()>0){
			for(AdvertiseFor adv:advertiseModel.getList()){
				SPMember mb = memberService.getSPMember(adv.getMemberid());
				if (mb!=null)
				   adv.setMembername(mb.getName());
			}
		}
		return "index";
	}
    private void init(){
    	user = BusinessUtils.getCurrentUser();
    }
	
	// getters and setters
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
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
	public PageModel<AdvertiseFor> getAdvertiseModel() {
		return advertiseModel;
	}
	public void setAdvertiseModel(PageModel<AdvertiseFor> advertiseModel) {
		this.advertiseModel = advertiseModel;
	}
}
