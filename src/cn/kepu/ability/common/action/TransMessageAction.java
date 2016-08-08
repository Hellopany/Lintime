package cn.kepu.ability.common.action;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;

import cn.kepu.ability.common.Constants;
import cn.kepu.ability.common.bean.Attachment;
import cn.kepu.ability.common.bean.TransMessage;
import cn.kepu.ability.common.bean.User;
import cn.kepu.ability.common.service.AttachmentService;
import cn.kepu.ability.common.service.TransMessageService;
import cn.kepu.ability.common.service.UserService;
import cn.kepu.ability.common.shortmessage.ShortMessage;
import cn.kepu.ability.kprc.bean.SPMember;
import cn.kepu.ability.kprc.bean.Student;
import cn.kepu.ability.kprc.service.AdvertiseForService;
import cn.kepu.ability.kprc.service.SPMemberService;
import cn.kepu.ability.kprc.service.StudentService;
import cn.kepu.ability.utils.BusinessUtils;
import cn.kepu.base.MessageType;
import cn.kepu.base.action.PageAction;
import cn.kepu.base.annotation.Authority;
import cn.kepu.utils.ContextUtils;
import cn.kepu.utils.PageModel;
import cn.kepu.utils.PropertyConfigureUtils;
import cn.kepu.utils.StringUtils;

public class TransMessageAction extends PageAction<TransMessage> {
	@Autowired
	private AdvertiseForService advertiseForService;
	@Autowired
	private StudentService studentService;
	@Autowired
	private UserService userService;
	@Autowired
	private AttachmentService attachmentService;
	@Autowired
	private SPMemberService memberService;
	@Autowired
	private TransMessageService transMessageService;
	private TransMessage transMessage;
	public Map<String,String> map;
    private Integer inbox;
    private int[] ids;
    private String username;
    
    private Integer nowpage;
    private Integer tcunowpage;
    private Integer orgnowpage;
    private Integer schoolnowpage;
    private Integer studentnowpage;
    private String info;
    
    private File[] attach;
	private String[] attachFileName;
	private List<Attachment> attachments;
    
    private Map<String,String> orgMap = new HashMap<String,String>();
    private Map<String,String> schoolMap = new HashMap<String,String>();
    private Map<String,String> studentMap = new HashMap<String,String>();
    private Map<String,String> tcuMap=new HashMap<String,String>();
	private static final Log log = LogFactory.getLog(TransMessageAction.class);
	
	//根据不同用户类型返回跳转
	private String rtn(){
		User user = BusinessUtils.getCurrentUser();
		if (Constants.ST_ORG.equals(user.getUsertype())){
			return "orglist";
		}
		if (Constants.ST_SCHOOL.equals(user.getUsertype())){
			return "schoollist";
		}
		if (Constants.ST_STUDENT.equals(user.getUsertype())){
			return "studentlist";
		}
		if (Constants.ST_TCU.equals(user.getUsertype())){
			return "tculist";
		}
		return "adminlist";
	}
	//根据不同用户类型返回跳转
	private String messagertn(){
		User user = BusinessUtils.getCurrentUser();
		if (Constants.ST_ORG.equals(user.getUsertype())){
			return "orgsuccess";
		}
		if (Constants.ST_SCHOOL.equals(user.getUsertype())){
			return "schoolsuccess";
		}
		if (Constants.ST_STUDENT.equals(user.getUsertype())){
			return "studentsuccess";
		}
		if (Constants.ST_TCU.equals(user.getUsertype())){
			return "tcusuccess";
		}
		return "adminsuccess";
	}
	//根据不同用户类型返回跳转
	private String replyrtn(){ 
		User user = BusinessUtils.getCurrentUser();
		if (Constants.ST_ORG.equals(user.getUsertype())){
			return "orgsendmessage";
		}
		if (Constants.ST_SCHOOL.equals(user.getUsertype())){
			return "schoolsendmessage";
		}
		if (Constants.ST_STUDENT.equals(user.getUsertype())){
			return "studentsendmessage";
		}
		if (Constants.ST_TCU.equals(user.getUsertype())){
			return "tcusendmessage";
		}
		return "adminsendmessage";
	}
	//根据不同用户类型返回跳转
	private String detailrtn(){
		User user = BusinessUtils.getCurrentUser();
		if (Constants.ST_ORG.equals(user.getUsertype())){
			return "orgdetail";
		}
		if (Constants.ST_SCHOOL.equals(user.getUsertype())){
			return "schooldetail";
		}
		if (Constants.ST_STUDENT.equals(user.getUsertype())){
			return "studentdetail";
		}
		if(Constants.ST_TCU.equals(user.getUsertype())){
			return "tcudetail";
		}
		return "admindetail";
	}
	@Authority(roles={Constants.ST_ADMIN,Constants.ST_ORG,Constants.ST_SCHOOL,Constants.ST_STUDENT,Constants.ST_TCU})
	public String recvlist() {
		TransMessage tm = new TransMessage();
		User user = BusinessUtils.getCurrentUser();
		if (user.getUsertype().equals("admin")){
			tm.setReceivers("-1");
		}else{
			tm.setReceivers(String.valueOf(BusinessUtils.getCurrentUser().getId()));
		}
		
		pageModel = transMessageService.getTransMessages(tm, pageNo, pageSize);

		if(pageModel!=null){
			for(int i=0;i<pageModel.getList().size();i++){
				int id = pageModel.getList().get(i).getSender();
				if (id==-1){
					pageModel.getList().get(i).setSendername("管理员");
				}else{
				  SPMember s=memberService.getSPMember(id);
				  if (s!=null){
				      pageModel.getList().get(i).setSendername(s.getName());
				      pageModel.getList().get(i).setSendertype(s.getRoletype());
				  }
				}
			}
		}
		inbox =1;
		return rtn();
	}

	@Authority(roles={Constants.ST_ADMIN,Constants.ST_ORG,Constants.ST_SCHOOL,Constants.ST_STUDENT})
	public String sendlist() {
		TransMessage tm = new TransMessage();
		User user = BusinessUtils.getCurrentUser();
		if (user.getUsertype().equals("admin")){
			tm.setSender(-1);
		}else{
		    tm.setSender(BusinessUtils.getCurrentUser().getId());
		}
		pageModel = transMessageService.getTransMessages(tm, pageNo, pageSize);

		if(pageModel!=null){
			for(int i=0;i<pageModel.getList().size();i++){
				String receivers = pageModel.getList().get(i).getReceivers();
				List<SPMember> lspm = transMessageService.getAllReceivers(receivers);
				if (lspm!=null&&lspm.size()>0) {
					String tmp = "";
					for(SPMember s:lspm){
						tmp += ","+s.getName();
					}
					tmp = tmp.substring(1);
					
					pageModel.getList().get(i).setReceiversnames(tmp);
				}
				//是否包含管理员
				if (receivers.indexOf("|-1|")>=0){
					String tmp = pageModel.getList().get(i).getReceiversnames();
					if (tmp!=null)
					   pageModel.getList().get(i).setReceiversnames(tmp+",管理员");
					else
						pageModel.getList().get(i).setReceiversnames("管理员");
				}
			}
		}
		inbox =0;
		return rtn();
	}
	@Authority(roles={Constants.ST_ORG,Constants.ST_STUDENT})
	public String add() {
		return ADD;
	}
	
	@Authority(roles={Constants.ST_ADMIN,Constants.ST_SCHOOL,Constants.ST_ORG,Constants.ST_STUDENT})
	public String sendMessage() {
		String memberid = request.getParameter("id");
		if (!StringUtils.isEmpty(memberid)){
			username = memberService.getSPMember(Integer.parseInt(memberid)).getUsername();
		}
		//根据不同用户增加不同联系人（管理员是所有，学校是学生，其他用户没有）
		/*当前用户是管理员*/
		User user = BusinessUtils.getCurrentUser();
		if (Constants.ST_ADMIN.equals(user.getUsertype())){
			PageModel<SPMember> pm = memberService.getSPMember(null, 1, 50);
			if(pm!=null){
				for(SPMember s:pm.getList()){
					if(s.getRoletype().equals(Constants.ST_ORG)){
						orgMap.put(s.getUsername(), s.getName());
					} 
					if(s.getRoletype().equals(Constants.ST_SCHOOL)){
						schoolMap.put(s.getUsername(), s.getName());
					}
					if(s.getRoletype().equals(Constants.ST_STUDENT)){
						studentMap.put(s.getUsername(), s.getName());
					}
					if(s.getRoletype().equals(Constants.ST_TCU)){
						 tcuMap.put(s.getUsername(), s.getName());
					}
				}
			}
		}
		
		/*当前用户是学校*/
		if (Constants.ST_SCHOOL.equals(user.getUsertype())){
			int id = memberService.getSPMember(BusinessUtils.getCurrentUser().getId()).getBelongto();
			Student student = new Student();
			student.setSchoolid(id);
			String studentsids= "";
			PageModel<Student> pms = studentService.getStudent(student, 1, 50);
			if(pms!=null&&pms.getList().size()>0){
				for(Student s:pms.getList()){
				   	studentsids += s.getId()+",";
				}
			}
			if (studentsids.equals("")) return replyrtn();
			studentsids = studentsids.substring(0,studentsids.length()-1);
			PageModel<SPMember> pm = memberService.getSPMembersByBelongto(Constants.ST_STUDENT, studentsids);
			if(pm!=null){
				for(SPMember s:pm.getList()){
						studentMap.put(s.getUsername(), s.getName());
				}
			}
		}
		return replyrtn();
	}

	@Authority(roles={Constants.ST_ADMIN,Constants.ST_SCHOOL})
	public String getAjaxPageData() {
		int id = memberService.getSPMember(BusinessUtils.getCurrentUser().getId()).getBelongto();
		Student student = new Student();
		student.setSchoolid(id);
		String studentsids= "";
		PageModel<Student> pms = studentService.getStudent(student, 1, 50);
		if(pms!=null&&pms.getList().size()>0){
			for(Student s:pms.getList()){
			   	studentsids += s.getId()+",";
			}
		}
		int page = 1;
		if (nowpage!=null){
			page = nowpage;
		}
		if (studentsids.equals("")) return null;
		JSONArray jsonArray = new JSONArray();
		studentsids = studentsids.substring(0,studentsids.length()-1);
		PageModel<SPMember> pm = memberService.getSPMembersByBelongto(Constants.ST_STUDENT, studentsids);
		if(pm!=null){
			for(SPMember s:pm.getList()){
					//studentMap.put(s.getUsername(), s.getName());
					studentMap.put("username", s.getUsername());
					studentMap.put("name", s.getName());
					JSONObject jos = JSONObject.fromObject(studentMap);  
					jsonArray.add(jos);   
			}
		}
		info = jsonArray.toString();
		return "ajax";
	}
	
	@Authority(roles={Constants.ST_ADMIN,Constants.ST_SCHOOL})
	public String getAjaxTcu() {
		int page = 1;
		if (tcunowpage!=null){
			page = tcunowpage;
		}
		SPMember spmember = new SPMember();
		spmember.setRoletype(Constants.ST_TCU);
		JSONArray jsonArray = new JSONArray();
		PageModel<SPMember> pm = memberService.getSPMember(spmember, tcunowpage, 50);
		if(pm!=null){
			for(SPMember s:pm.getList()){
					tcuMap.put("username", s.getUsername());
					tcuMap.put("name", s.getName());
					JSONObject jos = JSONObject.fromObject(tcuMap);  
					jsonArray.add(jos);   
			}
		}
		info = jsonArray.toString();
		return "ajax";
	}
	@Authority(roles={Constants.ST_ADMIN,Constants.ST_SCHOOL})
	public String getAjaxOrg() {
		int page = 1;
		if (orgnowpage!=null){
			page = orgnowpage;
		}
		SPMember spmember = new SPMember();
		spmember.setRoletype(Constants.ST_ORG);
		JSONArray jsonArray = new JSONArray();
		PageModel<SPMember> pm = memberService.getSPMember(spmember, orgnowpage, 50);
		if(pm!=null){
			for(SPMember s:pm.getList()){
					studentMap.put("username", s.getUsername());
					studentMap.put("name", s.getName());
					JSONObject jos = JSONObject.fromObject(studentMap);  
					jsonArray.add(jos);   
			}
		}
		info = jsonArray.toString();
		return "ajax";
	}
	@Authority(roles={Constants.ST_ADMIN,Constants.ST_SCHOOL})
	public String getAjaxSchool() {
		int page = 1;
		if (schoolnowpage!=null){
			page = schoolnowpage;
		}
		SPMember spmember = new SPMember();
		spmember.setRoletype(Constants.ST_SCHOOL);
		JSONArray jsonArray = new JSONArray();
		PageModel<SPMember> pm = memberService.getSPMember(spmember, schoolnowpage, 50);
		if(pm!=null){
			for(SPMember s:pm.getList()){
					studentMap.put("username", s.getUsername());
					studentMap.put("name", s.getName());
					JSONObject jos = JSONObject.fromObject(studentMap);  
					jsonArray.add(jos);   
			}
		}
		info = jsonArray.toString();
		return "ajax";
	}
	
	@Authority(roles={Constants.ST_ADMIN,Constants.ST_SCHOOL})
	public String getAjaxStudent() {
		int page = 1;
		if (studentnowpage!=null){
			page = studentnowpage;
		}
		SPMember spmember = new SPMember();
		spmember.setRoletype(Constants.ST_STUDENT);
		JSONArray jsonArray = new JSONArray();
		PageModel<SPMember> pm = memberService.getSPMember(spmember, studentnowpage, 50);
		if(pm!=null){
			for(SPMember s:pm.getList()){
					studentMap.put("username", s.getUsername());
					studentMap.put("name", s.getName());
					JSONObject jos = JSONObject.fromObject(studentMap);  
					jsonArray.add(jos);   
			}
		}
		info = jsonArray.toString();
		return "ajax";
	}
	@Authority(roles={Constants.ST_ADMIN,Constants.ST_SCHOOL,Constants.ST_ORG,Constants.ST_STUDENT})
	public String reply() {
		transMessage = transMessageService.getTransMessage(transMessage.getId());
		int sender = transMessage.getSender();
		if (sender==-1){
			username = "admin";
		}else{
			username = memberService.getSPMember(sender).getUsername();
		}
		return replyrtn();
	}
	@Authority(roles={Constants.ST_ADMIN,Constants.ST_SCHOOL,Constants.ST_ORG,Constants.ST_STUDENT})
	public String send() {
		if (transMessage==null){
			log.warn("用户非法访问");
			ContextUtils.setOpMessage(MessageType.WARN, "用户非法访问");
			return ERROR;
		}
		//手机号码数组
		List<String> phoneList = new ArrayList<String>();
		
		User user = BusinessUtils.getCurrentUser();
		if (user.getUsertype().equals("admin")){
			transMessage.setSender(-1);
		}else{
		   transMessage.setSender(user.getId());
		}
		transMessage.setSenddate(new Date());
		//解析接收者
		String tmp = "";
		String users = "";
		String[] recs = transMessage.getReceivers().split(",");
		for(int i=0;i<recs.length;i++){
			if (recs[i].equals("admin")){
				tmp = "|-1|";
				//得到管理员电话
				User u = userService.getUserByName("admin");
				String mobile = u.getMobile();
				if (mobile!=null&&!mobile.equals("")){
					phoneList.add(mobile);
				}
			}else{
				users += "'"+ recs[i]+"',";
			}
		}
		if (!users.equals("")){
			users = users.substring(0,users.length()-1);
		
			PageModel<SPMember> pspm = memberService.getSPMembersByNames(users);
			if (pspm!=null&&pspm.getList().size()>0){
				for(SPMember p:pspm.getList()){
					tmp +="|"+ p.getId();
					
					//增加手机号码
					String mobile = p.getMobile();
					if (mobile!=null&&!mobile.equals("")){
						phoneList.add(mobile);
					}
				}
				if (!tmp.equals("")){
					tmp += "|";
				}
			}
		}
		
		if(tmp.equals("")) {
			ContextUtils.setOpMessage(MessageType.SUCCESS, "没有找到对应的接收人，消息发送失败");
			return messagertn();
		}
		transMessage.setReceivers(tmp);
		if((transMessage=transMessageService.addTransMessage(transMessage))!=null) {
			//上传附件
			String attachMsg = "";
			if(attach != null && attach.length > 0) {
				for(int counter = 0; counter < attach.length; counter++) {
					Attachment dbattachment = attachmentService.uploadFile("transmessage", transMessage.getId(), attach[counter], attachFileName[counter]);
					if(dbattachment == null) {
						log.error("文件上传失败，文件名："+attachFileName[counter]);
						attachMsg += "["+attachFileName[counter]+"]";
					}
				}
			}
			//发送短信
			if(transMessage.getIsshortmessage()!=null&&transMessage.getIsshortmessage().equals("on")){
				//得到接收人手机号码并发短信
				if (phoneList.size()>=1){
					String [] str = new String[phoneList.size()];
					for (int i = 0; i < phoneList.size(); i++) 
					{
						str[i] = phoneList.get(i).toString();
					}
					//如果有附件，增加附件的链接
					String content = transMessage.getContent();
				    attachments = attachmentService.getAttachmentByCid("transmessage", transMessage.getId());
				    if (attachments!=null&&attachments.size()>0){
				    	//配置文件，config.propertis 中必须指定能访问的公网ip
				    	String webaddress = PropertyConfigureUtils.getString("web.basepath");
					    for(Attachment a : attachments){
					    	//content += " 附件<"+a.getName()+">： "+webaddress+"/transmessage/"+a.getUrl();
					    	content += " 附件<"+a.getName()+">： "+webaddress+"/messages/download.html?id="+a.getId();
					    }
				    }
				    //System.out.println("**************************************");
				    //System.out.println(content);
				    ShortMessage.send(content, str);
				}
			}
			ContextUtils.setOpMessage(MessageType.SUCCESS, "消息发送成功");
			return messagertn();
		}
		ContextUtils.setOpMessage(MessageType.ERROR, "消息发送失败");
		return messagertn();
	}
	
	public void download() throws Exception{
		String webaddress = PropertyConfigureUtils.getString("web.basepath");
		String id = request.getParameter("id");
		if (id!=null&&!id.equals("")){
			Attachment am = attachmentService.getAttachment(Integer.parseInt(id));
			if(am!=null){
			   String str = webaddress+"/"+am.getUrl();
			   response.sendRedirect(str);
			}
		}
	}
	/**
	 * 检查数据合法性
	 * 验证对象是否存在
	 * 验证所有字段是否合法
	 * @return
	 */
	private void checkData(){
		if (transMessage==null){
			ContextUtils.setOpMessage(MessageType.VALIDATE_FAILED,"用户非法访问");
			return;
		}
		if(transMessage.getReceivers().length()>100){
			ContextUtils.setOpMessage(MessageType.VALIDATE_FAILED,"接收者长度输入错误");
			return ;
		}
		if(transMessage.getTitle().length()>100){
			ContextUtils.setOpMessage(MessageType.VALIDATE_FAILED,"标题长度输入错误");
			return ;
		}
		if(transMessage.getContent().length()>600){
			ContextUtils.setOpMessage(MessageType.VALIDATE_FAILED,"内容输入长度错误");
			return ;
		}
	}
	
	@Authority(roles={Constants.ST_ORG,Constants.ST_STUDENT})
	public String remove() {
		if(transMessageService.removeTransMessages(ids)) {
			ContextUtils.setOpMessage(MessageType.SUCCESS, "数据删除成功");
			return recvlist();
		}
		ContextUtils.setOpMessage(MessageType.ERROR, "数据删除失败");
		return recvlist();
	}

	@Authority(roles={Constants.ST_ADMIN,Constants.ST_ORG,Constants.ST_SCHOOL,Constants.ST_STUDENT})
	public String detail() {
		transMessage = transMessageService.getTransMessage(transMessage.getId());
		if(transMessage == null) {
			ContextUtils.setOpMessage(MessageType.WARN, "用户访问的数据不存在");
			return ERROR;
		}
		//查询附件
		attachments = attachmentService.getAttachmentByCid("transmessage", transMessage.getId());
		//判断是管理员发的还是会员发的，管理员发的id存为-1
		if (transMessage.getSender()==-1){
			transMessage.setSendername("管理员");
		}else{
			SPMember spm = memberService.getSPMember(transMessage.getSender());
			if (spm!=null){
				transMessage.setSendername(spm.getName());
			}
		}
		return detailrtn();
	}
	
	// Validate Methods
	public void validateSave() {
		checkData();
	}
	public void validateUpdate() {
		checkData();
	}
	// getters and setters
	public void setTransMessage(TransMessage transMessage) {
		this.transMessage = transMessage;
	}
	public TransMessage getTransMessage() {
		return transMessage;
	}
	public Integer getInbox() {
		return inbox;
	}
	public void setInbox(Integer inbox) {
		this.inbox = inbox;
	}
	public int[] getIds() {
		return ids;
	}
	public void setIds(int[] ids) {
		this.ids = ids;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Map<String, String> getOrgMap() {
		return orgMap;
	}
	public void setOrgMap(Map<String, String> orgMap) {
		this.orgMap = orgMap;
	}
	public Map<String, String> getSchoolMap() {
		return schoolMap;
	}
	public void setSchoolMap(Map<String, String> schoolMap) {
		this.schoolMap = schoolMap;
	}
	public Map<String, String> getStudentMap() {
		return studentMap;
	}
	public void setStudentMap(Map<String, String> studentMap) {
		this.studentMap = studentMap;
	}
	public Integer getNowpage() {
		return nowpage;
	}
	public void setNowpage(Integer nowpage) {
		this.nowpage = nowpage;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	
	public Integer getTcunowpage() {
		return tcunowpage;
	}
	public void setTcunowpage(Integer tcunowpage) {
		this.tcunowpage = tcunowpage;
	}
	public Integer getOrgnowpage() {
		return orgnowpage;
	}
	public void setOrgnowpage(Integer orgnowpage) {
		this.orgnowpage = orgnowpage;
	}
	public Integer getSchoolnowpage() {
		return schoolnowpage;
	}
	public void setSchoolnowpage(Integer schoolnowpage) {
		this.schoolnowpage = schoolnowpage;
	}
	public Integer getStudentnowpage() {
		return studentnowpage;
	}
	public void setStudentnowpage(Integer studentnowpage) {
		this.studentnowpage = studentnowpage;
	}
	public File[] getAttach() {
		return attach;
	}

	public void setAttach(File[] attach) {
		this.attach = attach;
	}

	public String[] getAttachFileName() {
		return attachFileName;
	}

	public void setAttachFileName(String[] attachFileName) {
		this.attachFileName = attachFileName;
	}
	public List<Attachment> getAttachments() {
		return attachments;
	}
	public void setAttachments(List<Attachment> attachments) {
		this.attachments = attachments;
	}
	public Map<String, String> getTcuMap() {
		return tcuMap;
	}
	public void setTcuMap(Map<String, String> tcuMap) {
		this.tcuMap = tcuMap;
	}
 }
