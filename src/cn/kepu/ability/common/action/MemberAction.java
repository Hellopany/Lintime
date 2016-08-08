package cn.kepu.ability.common.action;

import java.text.SimpleDateFormat;
import java.util.Date;
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
import cn.kepu.base.annotation.Authority;
import cn.kepu.utils.ContextUtils;
import cn.kepu.utils.DateTimeUtils;
import cn.kepu.utils.PageModel;
import cn.kepu.utils.StringUtils;

/**
 * 用户登录相关流程处理，包括用户登录和登出
 * @author zhangzl
 */
public class MemberAction extends BaseAction {

	private static final long serialVersionUID = -4148776874506302404L;

	private static final Log log = LogFactory.getLog(MemberAction.class);
	private String username;
	private String code;
	private Changepas changepas = new Changepas();
	private AdvertiseFor advertiseFor;

	@Autowired
	private UserService userService;
	
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
	PageModel<AdvertiseFor> pageModel;
	private String systype;
	private String checkcode;


	/**
	 * 系统首页面跳转
	 */
	public String index() {
		return INDEX;
	}
	public String login() {
		return INDEX;
	}
    private boolean init(){
    	if (!BusinessUtils.isUserLogin()) {
			return false;
		}
		int id=BusinessUtils.getCurrentUser().getId();
		member = memberService.getSPMember(id);
	    return true;	
    }
    
     /**
      * 用人单位注册
      */
    public String registe(){
    	return "registe";
    }
    //保存注册信息
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
    	if ((member=memberService.addSPMember(member))!=null){
    		//给管理员发站内信
    		TransMessage tm = new TransMessage();
    		tm.setTitle(member.getName()+"注册申请");
    		tm.setContent("用户名称："+member.getName()+" 联系电话："+member.getMobile());
    		tm.setReceivers("|-1|");
    		tm.setSenddate(new Date());
    		tm.setSender(member.getId());
    		transMessageService.addTransMessage(tm);
    		ContextUtils.setOpMessage(MessageType.SUCCESS, "用户注册成功");
			return "finishreg";
    	}
    	ContextUtils.setOpMessage(MessageType.ERROR, "用户注册失败");
		return "finishreg";
    }
	/**
	 * 各个子系统首页面跳转
	 */
	public String schoolindex() {
		if(!init()) return "login";
		//获取消息
		TransMessage transMessage = new TransMessage();
		transMessage.setReceivers(member.getId().toString());
		list  = transMessageService.getTransMessages(transMessage, 1, 20);
		if(list!=null){
			for(int i=0;i<list.getList().size();i++){
				int newid = list.getList().get(i).getSender();
				if (newid==-1){
					list.getList().get(i).setSendername("管理员");
				}else{
				   SPMember s=memberService.getSPMember(newid);
				   if (s!=null){
				      list.getList().get(i).setSendername(s.getName());
				   }
				}
			}
		}
		return "school_index";
	}
	public String studentindex() {
		if(!init()) return "login";
		//获取消息
		TransMessage transMessage = new TransMessage();
		transMessage.setReceivers(member.getId().toString());
		list  = transMessageService.getTransMessages(transMessage, 1, 20);
		if(list!=null){
			for(int i=0;i<list.getList().size();i++){
				int newid = list.getList().get(i).getSender();
				if (newid==-1){
					list.getList().get(i).setSendername("管理员");
				}else{
				   SPMember s=memberService.getSPMember(newid);
				   list.getList().get(i).setSendername(s.getName());
				}
			}
		}
		//获取招聘信息
		AdvertiseFor af = new AdvertiseFor();
		af.setStatus("C");
		pageModel  = advertiseForService.getAdvertiseFor(af, 1, 20);
		if(pageModel!=null){
			for(int i=0;i<pageModel.getList().size();i++){
				SPMember s=memberService.getSPMember(pageModel.getList().get(i).getMemberid());
				pageModel.getList().get(i).setMembername(s.getName());
			}
		}
		return "student_index";
	}
	public String orgindex() {
		if(!init()) return "login";
		if (!BusinessUtils.isUserLogin()) {
			return "login";
		}
		int id=BusinessUtils.getCurrentUser().getId();
		member = memberService.getSPMember(id);
		//获取消息
		TransMessage transMessage = new TransMessage();
		transMessage.setReceivers(member.getId().toString());
		list  = transMessageService.getTransMessages(transMessage, 1, 20);
		if(list!=null){
			for(int i=0;i<list.getList().size();i++){
				int newid = list.getList().get(i).getSender();
				if (newid==-1){
					list.getList().get(i).setSendername("管理员");
				}else{
				   SPMember s=memberService.getSPMember(newid);
				   list.getList().get(i).setSendername(s.getName());
				   list.getList().get(i).setSendertype(s.getRoletype());
				}
			}
		}
		//发布的招聘信息
		AdvertiseFor af = new AdvertiseFor();
		af.setMemberid(id);
		pageModel  = advertiseForService.getAdvertiseFor(af, 1, 20);
		if(pageModel!=null){
			for(int i=0;i<pageModel.getList().size();i++){
				SPMember s=memberService.getSPMember(pageModel.getList().get(i).getMemberid());
				pageModel.getList().get(i).setMembername(s.getName());
			}
		}
		return "org_index";
	}
    /**
     * 对外提供的招聘信息接口
     * @return
     */
	public String list() {
		//发布的招聘信息
		AdvertiseFor af = new AdvertiseFor();
		af.setStatus("C");
		pageModel  = advertiseForService.getAdvertiseFor(af, 1, 20);
		if(pageModel!=null){
			for(int i=0;i<pageModel.getList().size();i++){
				SPMember s=memberService.getSPMember(pageModel.getList().get(i).getMemberid());
				pageModel.getList().get(i).setMembername(s.getName());
			}
		}
		return "list";
	}
	/**
     * 对外提供的招聘信息接口
     * @return
     */
	public String detail() {
		//查看招聘信息
		if (advertiseFor==null){
			ContextUtils.setOpMessage(MessageType.WARN, "用户访问的数据不存在");
			return ERROR;
		}
		advertiseFor = advertiseForService.getAdvertiseFor(advertiseFor.getId());
		if(advertiseFor == null) {
			ContextUtils.setOpMessage(MessageType.WARN, "用户访问的数据不存在");
			return ERROR;
		}
		return DETAIL;
	}
	/**
	 * 登录表单处理
	 */
	public String memberlogin() {
		if (log.isDebugEnabled()) log.debug("[Debug] user login...");
		String verifyCode = (String) session.get(com.jwstudio.verifycode.Constants.JWVERIFYCODE_SESSION_KEY);
		if (!StringUtils.isEmpty(checkcode) && checkcode.equalsIgnoreCase(verifyCode)) {
			SPMember spmember = memberService.checkSPMember(member);
			if(spmember == null) {
				return "index";
			}
			//用户是否启用
			if (spmember.getIsfinishcheck()==0){
				ContextUtils.setOpMessage(MessageType.ERROR, "用户名或密码错误");
				return "index";
			}
			//用户角色是否匹配
			if (!spmember.getRoletype().equals(systype)){
				ContextUtils.setOpMessage(MessageType.ERROR, "用户名或密码错误");
				return "index";
			}
			member = spmember;
			memberService.updateLoginInfo(member, request.getRemoteAddr());
			BusinessUtils.setSessionCookie(member);
			return getIndexPage(systype);
		} else {
			ContextUtils.setOpMessage(MessageType.ERROR, "验证码输入错误");
		}
		return "index";
	}
	/**
	 * 用户登出
	 */
	public String logout() {
		if (log.isDebugEnabled()) log.debug("[Debug] user logout");
		BusinessUtils.removeSessionCookie();

		return "index";
	}

	@Authority
	public String changepassword() {
		return "change_password";
	}
	@Authority
	public String savepassword() {
		String verifyCode = (String) session.get(com.jwstudio.verifycode.Constants.JWVERIFYCODE_SESSION_KEY);
		if (StringUtils.isEmpty(checkcode) || !checkcode.equalsIgnoreCase(verifyCode)) {
			ContextUtils.setOpMessage(MessageType.ERROR, "验证码输入有误，请重新提交请求");
			return "to_change_password";
		}
		String oldpassword = request.getParameter("oldpassword");
		String newpassword = request.getParameter("password");
		if(StringUtils.isEmpty(oldpassword) || StringUtils.isEmpty(newpassword)) {
			ContextUtils.setOpMessage(MessageType.ERROR, "密码输入有误，请重新提交请求");
			return "to_change_password";
		}
		User user = new User();
		user.setId(BusinessUtils.getCurrentUser().getId());
		user.setPassword(oldpassword);
		if(userService.updateSecurity(user, newpassword) != null) {
			ContextUtils.setOpMessage(MessageType.SUCCESS, "密码修改成功");
		} else {
			ContextUtils.setOpMessage(MessageType.ERROR, "密码输入有误，请检查后重新提交请求");
		}
		return "to_change_password";
	}
	@Authority
	public String changeinfo() {
		user = userService.getUser(BusinessUtils.getCurrentUser().getId());
		return "change_info";
	}
	@Authority
	public String saveinfo() {
		if(user == null) {
			ContextUtils.setOpMessage(MessageType.WARN, "用户非法访问");
			return ERROR;
		}
		user.setId(BusinessUtils.getCurrentUser().getId());
		if(userService.updateInfo(user) != null) {
			ContextUtils.setOpMessage(MessageType.SUCCESS, "用户信息修改成功");
		} else {
			ContextUtils.setOpMessage(MessageType.ERROR, "用户信息修改失败，请检查后重新提交请求");
		}
		return "to_change_info";
	}
	@Authority
	public String statistics() {

		return "statistic";
	}

	// protected method
	protected String getIndexPage(String systype) {
		if(Constants.ST_SCHOOL.equals(systype)) {
			return schoolindex();
		}
		if(Constants.ST_STUDENT.equals(systype)) {
			return studentindex();
		}
		if(Constants.ST_ORG.equals(systype)) {
			return orgindex();
		}

		return "to_index";
	}

	public  String forgetPass(){
		return "to_set";
	}
	
	public String emailConfirm(){
		String verifyCode = (String) session.get(com.jwstudio.verifycode.Constants.JWVERIFYCODE_SESSION_KEY);
		if (StringUtils.isEmpty(checkcode) || !checkcode.equalsIgnoreCase(verifyCode)) {
			ContextUtils.setOpMessage(MessageType.ERROR, "验证码输入有误，请重新提交请求");
			return "to_reset";
		}

		SPMember member = memberService.getSPMemberByName(username);
		if(member == null){
			ContextUtils.setOpMessage(MessageType.ERROR, "该用户不存在，请重新提交请求");
			return "to_reset";
		}
		if(cn.kepu.utils.StringUtils.isEmpty(member.getEmail())){
			ContextUtils.setOpMessage(MessageType.ERROR, "该用户邮箱未设置，不能重置密码。请与管理员联系。");
			return "to_reset";
		}
		
		String passcode =DigestUtils.md5Hex(Constants.PASSWORD_SALT+new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()) + new Random().nextInt(512));
		Changepas resetpassword = changepasService.saversp(user.getId(),passcode);
		if(resetpassword!= null){
			boolean res = memberService.sendEmail(member.getId(),passcode);
			if(res == true){
				ContextUtils.setOpMessage(MessageType.SUCCESS, "已向用户（"+username+"）的电子邮箱（"+member.getEmail()+"）发送密码重置邮件！<br/><br/>请稍后查收邮件，并按照要求重置密码！");
			}else{
				ContextUtils.setOpMessage(MessageType.ERROR, "密码重置失败，请稍后再试!");
			}	
		}
		return INFO;

	}
	
	
	public String pass_confirm(){
		if(code == null ){
			ContextUtils.setOpMessage(MessageType.ERROR, "非法访问，请重新设置！");
			return INFO;
		}
		
		changepas = changepasService.getBycode(code);
		if(changepas == null){
			ContextUtils.setOpMessage(MessageType.ERROR, "非法访问，请重新设置！");
			return INFO;
		}
		
		String nowdate =new SimpleDateFormat("yyyyMMdd").format(DateTimeUtils.GetTimeNowTS());
		String createdate = new SimpleDateFormat("yyyyMMdd").format(changepas.getCreatetime());
		if(!nowdate.equals(createdate)){
			ContextUtils.setOpMessage(MessageType.ERROR, "确认身份时间已过期，请重新设置！");
			return INFO;
		}
		
		if(changepas.getStatus().equals("Y")){
			ContextUtils.setOpMessage(MessageType.ERROR, "你已经进行过链接确认了,链接无效！");
			return INFO;
		}
		changepasService.update(changepas);
		return "reset_password";
					
	}
	
	
	public String resetPassword(){
		String verifyCode = (String) session.get(com.jwstudio.verifycode.Constants.JWVERIFYCODE_SESSION_KEY);
		if (StringUtils.isEmpty(checkcode) || !checkcode.equalsIgnoreCase(verifyCode)) {
			ContextUtils.setOpMessage(MessageType.ERROR, "验证码输入有误，请重新提交请求");
			return "reset_password";
		}
		String newpassword = request.getParameter("password");
		if(StringUtils.isEmpty(newpassword)){
			ContextUtils.setOpMessage(MessageType.ERROR, "密码输入有误，请重新提交请求");
			return "reset_password";
		}
		
		if(StringUtils.isEmpty(changepas.getUid())) {
			ContextUtils.setOpMessage(MessageType.ERROR, "参数传递错误，请重新设置！");
			return INFO;
		}
		

		if(userService.resetPassword(changepas.getUid(), newpassword) != null) {
			ContextUtils.setOpMessage(MessageType.SUCCESS, "密码修改成功，请返回首页登入!");
		} else {
			ContextUtils.setOpMessage(MessageType.ERROR, "密码失败，请检查后重新提交请求");
		}
		
		
		return INFO;
	}
	
	// getters and setters
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public void setSystype(String systype) {
		this.systype = systype;
	}
	public String getSystype() {
		return systype;
	}
	public String getCheckcode() {
		return checkcode;
	}
	public void setCheckcode(String checkcode) {
		this.checkcode = checkcode;
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

	public Changepas getChangepas() {
		return changepas;
	}

	public void setChangepas(Changepas changepas) {
		this.changepas = changepas;
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

	public PageModel<AdvertiseFor> getPageModel() {
		return pageModel;
	}

	public void setPageModel(PageModel<AdvertiseFor> pageModel) {
		this.pageModel = pageModel;
	}

	public AdvertiseFor getAdvertiseFor() {
		return advertiseFor;
	}

	public void setAdvertiseFor(AdvertiseFor advertiseFor) {
		this.advertiseFor = advertiseFor;
	}
}
