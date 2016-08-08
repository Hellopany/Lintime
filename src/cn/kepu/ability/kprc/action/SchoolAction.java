package cn.kepu.ability.kprc.action;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

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
import cn.kepu.ability.kprc.bean.AdvertiseFor;
import cn.kepu.ability.kprc.bean.SPMember;
import cn.kepu.ability.kprc.bean.School;
import cn.kepu.ability.kprc.bean.Student;
import cn.kepu.ability.kprc.bean.StudentCareer;
import cn.kepu.ability.kprc.bean.StudentEducation;
import cn.kepu.ability.kprc.bean.StudentHonor;
import cn.kepu.ability.kprc.bean.StudentPaper;
import cn.kepu.ability.kprc.bean.StudentPractice;
import cn.kepu.ability.kprc.bean.StudentRelation;
import cn.kepu.ability.kprc.bean.StudentResearch;
import cn.kepu.ability.kprc.bean.StudentResearchActivity;
import cn.kepu.ability.kprc.bean.StudentSchoolRoll;
import cn.kepu.ability.kprc.service.AdvertiseForService;
import cn.kepu.ability.kprc.service.SPMemberService;
import cn.kepu.ability.kprc.service.SchoolService;
import cn.kepu.ability.kprc.service.StudentCareerService;
import cn.kepu.ability.kprc.service.StudentEducationService;
import cn.kepu.ability.kprc.service.StudentHonorService;
import cn.kepu.ability.kprc.service.StudentPaperService;
import cn.kepu.ability.kprc.service.StudentProticeService;
import cn.kepu.ability.kprc.service.StudentRelationService;
import cn.kepu.ability.kprc.service.StudentResearchActivityService;
import cn.kepu.ability.kprc.service.StudentResearchService;
import cn.kepu.ability.kprc.service.StudentSchoolRollService;
import cn.kepu.ability.kprc.service.StudentService;
import cn.kepu.ability.utils.ApplicationUtils;
import cn.kepu.ability.utils.BusinessUtils;
import cn.kepu.ability.utils.ImportUtils;
import cn.kepu.base.MessageType;
import cn.kepu.base.action.PageAction;
import cn.kepu.base.annotation.Authority;
import cn.kepu.utils.ContextUtils;
import cn.kepu.utils.PageModel;

public class SchoolAction extends PageAction<Student> {
	/**
	 * 
	 */
	private static final long serialVersionUID = -7909131299444742463L;
	@Autowired
	private AdvertiseForService advertiseForService;
	@Autowired
	private TransMessageService transMessageService;
	@Autowired
	private UserService userService;
	@Autowired
	private AttachmentService attachmentService;
	@Autowired
	private SchoolService schoolService;
	@Autowired
	private SPMemberService memberService;
	@Autowired
	private StudentService studentService;
	@Autowired
	private StudentCareerService studentCareerService;
	@Autowired
	private StudentEducationService studentEducationService;
	@Autowired
	private StudentHonorService studentHonorService;
	@Autowired
	private StudentPaperService studentPaperService;
	@Autowired
	private StudentProticeService studentProticeService;
	@Autowired
	private StudentRelationService studentRelationService;
	@Autowired
	private StudentResearchService studentResearchService;
	@Autowired
	private StudentResearchActivityService studentResearchActivityService;
	@Autowired
	private StudentSchoolRollService studentSchoolRollService;
/*教育信息*/
	//本科学校
	private List<String> Aschoolname;
	//所学专业
	private List<String> Aprofessional;
	//所获荣誉
	private List<String> Ahonor;
	//申报项目
	private List<String> Areportproject;
	//开始时间
	private List<Date> Astartdate;
	//结束时间
	private List<Date> Afinishdate;
/*实习信息*/
	private List<String> Bcorporation;
	private List<String> Bteacher;
	private List<String> Btype;
	private List<String> Bwork;
	private List<Date> Bstartdate;
	private List<Date> Bfinishdate;
/*论文信息*/
	private List<String> Cname;
	private List<String> Cteacher;
	private List<String> Ctype;
	private List<String> Cquanlity;
	private List<String> Cresume;
	private List<String> Cwork;
/*科研信息*/
	private List<String> Dtitle;
	private List<String> Dtype;
	private List<String> Dgrade;
	private List<String> Drole;
	private List<Date> Dstartdate;
	private List<Date> Dfinishdate;
/*科研活动信息*/
	private List<String> DEname;
	private List<String> Ename;
	private List<String> Epapername;
	private List<String> Egrade;
	private List<String> Epaperorder;
	private List<Date> Estartdate;
	private List<Date> Efinishdate;
/*荣誉信息*/
	private List<String> Fname;
	private List<String> Fgrade;
	private List<Date> Fhonordate;
/*就业信息*/	  
	//就业意向
	private List<String> careertype;
	private List<String> othername;
	private List<String> unittype;
	//工作单位
	private List<String> corporationname;
	//单位地址
	private List<String> address;
	//开始时间
	private List<Date> startdate;
	//结束时间
	private List<Date> finishdate;
	
	private StudentPractice studentPractice;
	private StudentPaper studentPaper;
	private StudentResearch studentResearch;
	private StudentResearchActivity studentResearchActivity;
	private StudentHonor studentHonor;
	private StudentSchoolRoll studentSchoolRoll;
	private StudentRelation studentRelation;
	private StudentEducation studentEducation;
	
	private Student student;
	private AdvertiseFor advertiseFor;
	public Map<String,String> map;

	private File file;
	private String fileFileName;
	public List<Attachment> attachments;
	public Attachment attachment;
	
	private List<StudentSchoolRoll> schoolRollList;
	private List<StudentCareer> careerList;
	private List<StudentEducation> educationList;
	private List<StudentHonor> honorList;
	private List<StudentPractice> proticeList;
	private List<StudentResearch> researchList;
	private List<StudentResearchActivity> activityList;
	private List<StudentRelation> relationList;
	private List<StudentPaper> paperList;

	private static final Log log = LogFactory.getLog(SchoolAction.class);
	
	@Authority(roles={Constants.ST_ORG,Constants.ST_STUDENT})
	public String list() {
		//得到学校标识
		int id = memberService.getSPMember(BusinessUtils.getCurrentUser().getId()).getBelongto();
		Student student = new Student();
		student.setSchoolid(id);
		pageModel = studentService.getStudent(student, pageNo, pageSize);

		//除了审批人和学生  其余角色都进行如下处理
		for(int i=0;i<pageModel.getList().size();i++){
			if("A".equals(pageModel.getList().get(i).getStatus())){
				Student stu = new Student();
				stu = studentService.getStudent(pageModel.getList().get(i).getNewid()); 
				//添加为新数据
				pageModel.getList().add(stu);				
				//审批通过后 删除原数据
				pageModel.getList().remove(i);				
			}
			
		}		
		return LIST;
	}
	/**
	 * 审核列表
	 * @return
	 */
	@Authority(roles={Constants.ST_ORG,Constants.ST_STUDENT})
	public String examinelist() {
		//得到学校标识
		int id = memberService.getSPMember(BusinessUtils.getCurrentUser().getId()).getBelongto();
		Student student = new Student();
		student.setSchoolid(id);
		
		List<Student> list=new ArrayList<Student>();
		
		pageModel = studentService.getStudent(student, pageNo, pageSize);
		//审批的人进行如下处理
		for (int i = 0; i < pageModel.getList().size(); i++) {
			if ("S".equals(pageModel.getList().get(i).getStatus())) {
				Student stu = new Student();
				stu = studentService.getStudent(pageModel.getList().get(i).getNewid());
				list.add(stu);
			}		
		}
		pageModel.setList(list);
		return "examine_list";
	}

	@Authority(roles={Constants.ST_ORG,Constants.ST_STUDENT})
	public String updateStatusA() {
		//通过新数据找到原数据
		Student stu=new Student();
		stu.setNewid(student.getId());
		stu= studentService.getStudent(stu, 1, 999).getList().get(0);
		//提交
		stu.setStatus(Constants.FILE_ADOPT);
		if(studentService.updateStudent(stu)!=null){
			TransMessage tm = new TransMessage();
			tm.setContent(BusinessUtils.getCurrentUser().getName()+"学校用户通过学生数据");
			tm.setReceivers("|-1|");
			tm.setSenddate(new Date());
			tm.setSender(BusinessUtils.getCurrentUser().getId());
			tm.setSendertype(Constants.ST_SCHOOL);
			tm.setTitle(BusinessUtils.getCurrentUser().getName()+"学生信息通过通知");
			if(transMessageService.addTransMessage(tm)!=null) {
				//发送短信
				//得到接收人手机号码并发短信
				User user = userService.getUserByName("admin");
				if (user!=null&&user.getMobile()!=null&&!user.getMobile().equals("")){
					ShortMessage.send(tm.getContent(), new String[]{user.getMobile()});
				}
			}
			ContextUtils.setOpMessage(MessageType.SUCCESS, "数据修改成功");			
		}else{
			ContextUtils.setOpMessage(MessageType.ERROR, "数据修改失败");
		}
		return examinelist();
	}
	@Authority(roles={Constants.ST_ORG,Constants.ST_STUDENT})
	public String updateStatusB() {
		//通过新数据找到原数据
		Student stu=new Student();
		stu.setNewid(student.getId());
		stu= studentService.getStudent(stu, 1, 999).getList().get(0);
		//提交
		stu.setStatus(Constants.FILE_REFUSE);		
		if(studentService.updateStudent(stu)!=null){
			ContextUtils.setOpMessage(MessageType.SUCCESS, "数据修改成功");			
		}else{
			ContextUtils.setOpMessage(MessageType.ERROR, "数据修改失败");
		}
		return examinelist();
	}
	
	
	@Authority(roles={Constants.ST_SCHOOL})
	public String schooldetail() {
	    if(student == null) {
			ContextUtils.setOpMessage(MessageType.WARN, "用户访问的数据不存在");
			return ERROR;
		}
	    student = studentService.getStudent(student.getId());
		//获取学籍信息
		StudentSchoolRoll ssr = new StudentSchoolRoll();
		ssr.setStudentid(student.getId());
		schoolRollList = studentSchoolRollService.getStudentSchoolRoll(ssr, 1, 999).getList();
		if (schoolRollList!=null){
			for(StudentSchoolRoll stu:schoolRollList){
				School school = schoolService.getSchool(stu.getSchool());
				if (school!=null){
					stu.setSchoolname(school.getName());
				}
				stu.setJointypename(ApplicationUtils.getJoinCategory().get(stu.getJointype()));
			}
		}
		//获取联系方式信息
		StudentRelation sr = new StudentRelation();
		sr.setStudentid(student.getId());
		relationList = studentRelationService.getStudentRelation(sr, 1, 999).getList();
		//获取教育信息
		StudentEducation se = new StudentEducation();
		se.setStudentid(student.getId());
		educationList = studentEducationService.getStudentEducation(se, 1, 999).getList();
		//获取就业信息
		StudentCareer sc = new StudentCareer();
		sc.setStudentid(student.getId());
		careerList = studentCareerService.getStudentCareer(sc, 1, 999).getList();
		if (careerList!=null){
			for(StudentCareer stu:careerList){
				stu.setCareertypename(ApplicationUtils.getWorkCategory().get(stu.getCareertype()));
			}
		}
		//获取实习信息
		StudentPractice sp = new StudentPractice();
		sp.setStudentid(student.getId());
		proticeList = studentProticeService.getStudentProtice(sp, 1, 999).getList();
		if (proticeList!=null){
			for(StudentPractice stu:proticeList){
				stu.setTypename(ApplicationUtils.getPracticsCategory().get(stu.getType()));
			}
		}
		//获取论文信息
		StudentPaper spp = new StudentPaper();
		spp.setStudentid(student.getId());
		paperList = studentPaperService.getStudentPaper(spp, 1, 999).getList();
		if (paperList!=null){
			for(StudentPaper stu:paperList){
				stu.setTypename(ApplicationUtils.getPaperCategory().get(stu.getType()));
				stu.setQuanlityname(ApplicationUtils.getPaperQuanlityCategory().get(stu.getQuanlity()));
			}
		}
		//获取科研信息
		StudentResearch srs = new StudentResearch();
		srs.setStudentid(student.getId());
		researchList = studentResearchService.getStudentResearch(srs, 1, 999).getList();
		if (researchList!=null){
			for(StudentResearch stu:researchList){
				stu.setTypename(ApplicationUtils.getResearchCategory().get(stu.getType()));
				stu.setGradename(ApplicationUtils.getResearchGradeCategory().get(stu.getGrade()));
				stu.setRolename(ApplicationUtils.getAttendCategory().get(stu.getRole()));
			}
		}
		//获取科研活动信息
        /*遍历科研，取所有的活动*/
		if (researchList!=null&&researchList.size()>0){
			String tmp = "";
			for(StudentResearch r:researchList){
			   	tmp += ","+r.getId();
			}
			tmp = tmp.substring(1);
			
			activityList = studentResearchActivityService.getStudentResearchActivity(tmp);
			if (activityList!=null){
				for(StudentResearchActivity stu:activityList){
					stu.setGradename(ApplicationUtils.getActivityGradeCategory().get(stu.getGrade()));
				}
			}
		}
		//获取获得荣誉信息
		StudentHonor sh = new StudentHonor();
		sh.setStudentid(student.getId());
		honorList = studentHonorService.getStudentHonor(sh, 1, 999).getList();
		if (honorList!=null){
			for(StudentHonor stu:honorList){
				stu.setGradename(ApplicationUtils.getHonorGradeCategory().get(stu.getGrade()));
			}
		}
		return "student_detail";
	}
	
	@Authority(roles={Constants.ST_ORG,Constants.ST_STUDENT})
	public String save() {
		if(student == null) {
			log.warn("用户非法访问");
			ContextUtils.setOpMessage(MessageType.WARN, "用户非法访问");
			return ERROR;
		}
		try {
			//基本信息
			student.setStatus(Constants.FILE_INITIALIZATION);
			student.setSchoolid(memberService.getSPMember(BusinessUtils.getCurrentUser().getId()).getBelongto());
			student = studentService.addStudent(student);
			if(student!=null){
				//学籍信息
				studentSchoolRoll.setStudentid(student.getId());
				studentSchoolRoll.setSchool(memberService.getSPMember(BusinessUtils.getCurrentUser().getId()).getBelongto());
				studentSchoolRoll=studentSchoolRollService.addStudentSchoolRoll(studentSchoolRoll);
				//联系方式信息
				studentRelation.setStudentid(student.getId());
				studentRelation=studentRelationService.addStudentRelation(studentRelation);
			    //教育信息
				if(Aschoolname!=null){
					for(int i=0;i<Aschoolname.size();i++){
						 StudentEducation a=new StudentEducation();
						 a.setFinishdate(Afinishdate.get(i));
						 if(Ahonor.get(i)!=null){
							 a.setHonor(Ahonor.get(i)); 
						 }else{
							 a.setHonor(null);
						 }					 
						 a.setProfessional(Aprofessional.get(i));
						 if(Areportproject.get(i)!=null){
							 a.setReportproject(Areportproject.get(i)); 
						 }else{
							 a.setReportproject(null);
						 }					 
						 a.setSchoolname(Aschoolname.get(i));
						 a.setStartdate(Astartdate.get(i));
						 a.setStudentid(student.getId());
						 studentEducationService.addStudentEducation(a);
					}
				}
				
				//就业信息	
				if(careertype!=null){
					for(int i=0;i<careertype.size();i++){
						StudentCareer s=new StudentCareer();
						s.setStudentid(student.getId());
						s.setCareertype(careertype.get(i));
						s.setCorporationname(corporationname.get(i));
						s.setAddress(address.get(i));
						s.setStartdate(startdate.get(i));
						s.setFinishdate(finishdate.get(i));
						s.setUnittype(unittype.get(i));
						//增加其他就业意向的说明
						if (careertype.get(i).equals("H")){
							s.setOthername(othername.get(i));
						}
						studentCareerService.addStudentCareer(s);
					}
				}
				
				
				//实习信息
				if(Btype!=null){
					for(int i=0;i<Btype.size();i++){
						StudentPractice b=new StudentPractice();
						b.setCorporation(Bcorporation.get(i));
						b.setFinishdate(Bfinishdate.get(i));
						b.setStartdate(Bstartdate.get(i));
						b.setStudentid(student.getId());
						b.setTeacher(Bteacher.get(i));
						b.setType(Btype.get(i));
						b.setWork(Bwork.get(i));
						studentProticeService.addStudentProtice(b);
					}
				}
				
				//论文信息
				if(Ctype!=null){
					for(int i=0;i<Ctype.size();i++){
						StudentPaper c=new StudentPaper();
						c.setName(Cname.get(i));
						c.setQuanlity(Cquanlity.get(i));
						c.setResume(Cresume.get(i));
						c.setStudentid(student.getId());
						c.setTeacher(Cteacher.get(i));
						c.setType(Ctype.get(i));
						c.setWork(Cwork.get(i));
						studentPaperService.addStudentPaper(c);
					}
				}
				
				
				//科研信息
				if(Dtype!=null){
					for(int i=0;i<Dtype.size();i++){
						StudentResearch d=new StudentResearch();
						d.setFinishdate(Dfinishdate.get(i));
						d.setGrade(Dgrade.get(i));
						d.setRole(Drole.get(i));
						d.setStartdate(Dstartdate.get(i));
						d.setStudentid(student.getId());
						d.setTitle(Dtitle.get(i));
						d.setType(Dtype.get(i));
						studentResearchService.addStudentResearch(d);
					}
				}
				
//				//科研活动信息
				if(DEname!=null){
					for(int i=0;i<DEname.size();i++){
						StudentResearch d=new StudentResearch();
						d.setTitle(DEname.get(i));
						d=studentResearchService.getStudentResearch(d, 1, 999).getList().get(0);
						
						StudentResearchActivity e=new StudentResearchActivity();
						e.setStudentresearchid(d.getId());
						e.setStartdate(Estartdate.get(i));
						e.setFinishdate(Efinishdate.get(i));
						e.setGrade(Egrade.get(i));
						if(Epapername.get(i)!=null && Epapername.get(i)!=""){
							e.setPapername(Epapername.get(i));
							e.setPaperorder(Integer.valueOf(Epaperorder.get(i)));
							e.setIspaper(1);
						}else{
							e.setPapername(null);
							e.setPaperorder(null);
							e.setIspaper(0);
						}
						e.setName(Ename.get(i));
						studentResearchActivityService.addStudentResearchActivity(e);

					}
				}
				
				//活动荣誉信息
				if(Fname!=null){
					for(int i=0;i<Fname.size();i++){
						StudentHonor f=new StudentHonor();
						f.setGrade(Fgrade.get(i));
						f.setHonordate(Fhonordate.get(i));
						f.setName(Fname.get(i));
						f.setStudentid(student.getId());
						studentHonorService.addStudentHonor(f);
					}
				}
				
				//最后增加登录信息
				SPMember spmember=new SPMember();
				spmember.setUsername(student.getIdcard());
				spmember.setCreatedate(BusinessUtils.getRequestTime());
				spmember.setEmail(studentRelation.getEmail());
				spmember.setRoletype("1");
				spmember.setIsfinishcheck(1);
				spmember.setName(student.getName());
				spmember.setIslocked(0);
//				spmember.setBelongto(memberService.getSPMember(BusinessUtils.getCurrentUser().getId()).getBelongto());
				spmember.setBelongto(student.getId());
				spmember.setPassword(BusinessUtils.getEncodePassword(student.getIdcard().substring(student.getIdcard().length()-6, student.getIdcard().length())));
				memberService.addSPMember(spmember);
				
				TransMessage tm = new TransMessage();
				tm.setContent(BusinessUtils.getCurrentUser().getName()+"学校用户添加学生数据");
				tm.setReceivers("|-1|");
				tm.setSenddate(new Date());
				tm.setSender(BusinessUtils.getCurrentUser().getId());
				tm.setSendertype(Constants.ST_SCHOOL);
				tm.setTitle(BusinessUtils.getCurrentUser().getName()+"学生信息添加通知");
				if(transMessageService.addTransMessage(tm)!=null) {
					//发送短信
					//得到接收人手机号码并发短信
					User user = userService.getUserByName("admin");
					if (user!=null&&user.getMobile()!=null&&!user.getMobile().equals("")){
						ShortMessage.send(tm.getContent(), new String[]{user.getMobile()});
					}
				}
			}
		} catch (Exception e) {
			ContextUtils.setOpMessage(MessageType.SUCCESS, "数据添加失败");
			return list();
		}
		ContextUtils.setOpMessage(MessageType.ERROR, "数据添加成功");
		return list();
	}
	
	@Authority(roles={Constants.ST_ORG,Constants.ST_STUDENT})
	public String modify() {
		//基本信息
		student = studentService.getStudent(student.getId());
		if(student!=null){
			//学籍信息
			StudentSchoolRoll ssr = new StudentSchoolRoll();
			ssr.setStudentid(student.getId());
			PageModel<StudentSchoolRoll> pssr = studentSchoolRollService.getStudentSchoolRoll(ssr, 1, 999);
			if (pssr!=null&&pssr.getList().size()>0){
			    studentSchoolRoll=pssr.getList().get(0);
			}
			//联系方式信息
			StudentRelation str=new StudentRelation();
			str.setStudentid(student.getId());
			PageModel<StudentRelation> psr = studentRelationService.getStudentRelation(str, 1, 999);
			if (psr!=null&&psr.getList().size()>0){
			   studentRelation=psr.getList().get(0);
			}
			//教育信息
			StudentEducation se = new StudentEducation();
			se.setStudentid(student.getId());
			educationList = studentEducationService.getStudentEducation(se, 1, 999).getList();

			//就业信息
			StudentCareer stc=new StudentCareer();
			stc.setStudentid(student.getId());
			careerList = studentCareerService.getStudentCareer(stc, 1, 999).getList();

			//获取实习信息
			StudentPractice sp = new StudentPractice();
			sp.setStudentid(student.getId());
			proticeList = studentProticeService.getStudentProtice(sp, 1, 999).getList();

			//获取论文信息
			StudentPaper spp = new StudentPaper();
			spp.setStudentid(student.getId());
			paperList = studentPaperService.getStudentPaper(spp, 1, 999).getList();

			//获取科研信息
			StudentResearch srs = new StudentResearch();
			srs.setStudentid(student.getId());
			researchList = studentResearchService.getStudentResearch(srs, 1, 999).getList();

			//获取科研活动信息
	        /*遍历科研，取所有的活动*/
			if (researchList!=null&&researchList.size()>0){
				String tmp = "";
				for(StudentResearch r:researchList){
				   	tmp += ","+r.getId();
				}
				tmp = tmp.substring(1);
				
				activityList = studentResearchActivityService.getStudentResearchActivity(tmp);
			}
			//获取获得荣誉信息
			StudentHonor sh = new StudentHonor();
			sh.setStudentid(student.getId());
			honorList = studentHonorService.getStudentHonor(sh, 1, 999).getList();
		}
		return "modify";
	}
	@Authority(roles={Constants.ST_ORG,Constants.ST_STUDENT})
	public String update() {
		if(student == null) {
			log.warn("用户非法访问");
			ContextUtils.setOpMessage(MessageType.WARN, "用户非法访问");
			return ERROR;
		}

		try {
			//基本信息
			student.setSchoolid(memberService.getSPMember(BusinessUtils.getCurrentUser().getId()).getBelongto());
			student.setStatus(Constants.FILE_INITIALIZATION);
			student = studentService.updateStudent(student);
			//学籍信息
			studentSchoolRoll.setSchool(memberService.getSPMember(BusinessUtils.getCurrentUser().getId()).getBelongto());		
			studentSchoolRoll=studentSchoolRollService.updateStudentSchoolRoll(studentSchoolRoll);
			//联系方式信息
			studentRelation=studentRelationService.updateStudentRelation(studentRelation);
			//教育信息
			if(Aschoolname!=null){
				StudentEducation se = new StudentEducation();
				se.setStudentid(student.getId());
				educationList = studentEducationService.getStudentEducation(se, 1, 999).getList();
				if(educationList!=null){
					for(StudentEducation a:educationList){
						studentEducationService.removeStudentEducation(a.getId());
					}
				}			
				for(int i=0;i<Aschoolname.size();i++){
					 StudentEducation a=new StudentEducation();
					 a.setFinishdate(Afinishdate.get(i));
					 if(Ahonor.get(i)!=null){
						 a.setHonor(Ahonor.get(i)); 
					 }else{
						 a.setHonor(null);
					 }				 
					 a.setProfessional(Aprofessional.get(i));
					 if(Areportproject.get(i)!=null){
						 a.setReportproject(Areportproject.get(i));
					 }else{
						 a.setReportproject(null);
					 }				 
					 a.setSchoolname(Aschoolname.get(i));
					 a.setStartdate(Astartdate.get(i));
					 a.setStudentid(student.getId());
					 studentEducationService.addStudentEducation(a);
				}
			}
			
			
			//就业信息 先删除 再添加
			if(careertype!=null){
				StudentCareer stc=new StudentCareer();
				stc.setStudentid(student.getId());
				careerList=studentCareerService.getStudentCareer(stc, 1, 999).getList();
				if(careerList!=null){
					for(StudentCareer s:careerList){
						studentCareerService.removeStudentCareer(s.getId());
					}
				}
				
				//添加						
				for(int i=0;i<careertype.size();i++){
					StudentCareer s=new StudentCareer();
					s.setStudentid(student.getId());
					s.setCareertype(careertype.get(i));
					s.setCorporationname(corporationname.get(i));
					s.setAddress(address.get(i));
					s.setStartdate(startdate.get(i));
					s.setFinishdate(finishdate.get(i));
					s.setUnittype(unittype.get(i));
					//增加其他就业意向的说明
					if (careertype.get(i).equals("H")){
						s.setOthername(othername.get(i));
					}
					studentCareerService.addStudentCareer(s);
				}
			}
			
			
			//实习信息
			if(Btype!=null){
				StudentPractice sp = new StudentPractice();
				sp.setStudentid(student.getId());
				proticeList = studentProticeService.getStudentProtice(sp, 1, 999).getList();
				if(proticeList!=null){
					for(StudentPractice b:proticeList){
						studentProticeService.removeStudentProtice(b.getId());
					}
				}				
				for(int i=0;i<Btype.size();i++){
					StudentPractice b=new StudentPractice();
					b.setCorporation(Bcorporation.get(i));
					b.setFinishdate(Bfinishdate.get(i));
					b.setStartdate(Bstartdate.get(i));
					b.setStudentid(student.getId());
					b.setTeacher(Bteacher.get(i));
					b.setType(Btype.get(i));
					b.setWork(Bwork.get(i));
					studentProticeService.addStudentProtice(b);
				}
			}
			
			//论文信息
			if(Ctype!=null){
				StudentPaper spp = new StudentPaper();
				spp.setStudentid(student.getId());
				paperList = studentPaperService.getStudentPaper(spp, 1, 999).getList();
				if(paperList!=null){
					for(StudentPaper c:paperList){
						studentPaperService.removeStudentPaper(c.getId());
					}
				}
				
				for(int i=0;i<Ctype.size();i++){
					StudentPaper c=new StudentPaper();
					c.setName(Cname.get(i));
					c.setQuanlity(Cquanlity.get(i));
					c.setResume(Cresume.get(i));
					c.setStudentid(student.getId());
					c.setTeacher(Cteacher.get(i));
					c.setType(Ctype.get(i));
					c.setWork(Cwork.get(i));
					studentPaperService.addStudentPaper(c);
				}
			}
			
			
			//科研信息
			if(Dtype!=null){
				StudentResearch srs = new StudentResearch();
				srs.setStudentid(student.getId());
				researchList = studentResearchService.getStudentResearch(srs, 1, 999).getList();
				if(researchList!=null){
					for(StudentResearch d:researchList){
						studentResearchService.removeStudentResearch(d.getId());
					}
				}
				
				for(int i=0;i<Dtype.size();i++){
					StudentResearch d=new StudentResearch();
					d.setFinishdate(Dfinishdate.get(i));
					d.setGrade(Dgrade.get(i));
					d.setRole(Drole.get(i));
					d.setStartdate(Dstartdate.get(i));
					d.setStudentid(student.getId());
					d.setTitle(Dtitle.get(i));
					d.setType(Dtype.get(i));
					studentResearchService.addStudentResearch(d);
				}
			}
						
			//科研活动信息
			
			if(DEname!=null){
				if (researchList!=null&&researchList.size()>0){
					String tmp = "";
					for(StudentResearch r:researchList){
					   	tmp += ","+r.getId();
					}
					tmp = tmp.substring(1);
					
					activityList = studentResearchActivityService.getStudentResearchActivity(tmp);
					if(activityList!=null){
						for(StudentResearchActivity e:activityList){
							studentResearchActivityService.removeStudentResearchActivity(e.getId());
						}
					}
					
				}
								
				for(int i=0;i<DEname.size();i++){
					StudentResearch d=new StudentResearch();
					d.setTitle(DEname.get(i));
					d=studentResearchService.getStudentResearch(d, 1, 999).getList().get(0);
					
					StudentResearchActivity e=new StudentResearchActivity();
					e.setStudentresearchid(d.getId());
					e.setStartdate(Estartdate.get(i));
					e.setFinishdate(Efinishdate.get(i));
					e.setGrade(Egrade.get(i));
					if(Epapername.get(i)!=null && Epapername.get(i)!=""){
						e.setPapername(Epapername.get(i));
						e.setPaperorder(Integer.valueOf(Epaperorder.get(i)));
						e.setIspaper(1);
					}else{
						e.setPapername(null);
						e.setPaperorder(null);
						e.setIspaper(0);
					}
					e.setName(Ename.get(i));
					studentResearchActivityService.addStudentResearchActivity(e);

				}
			}
			
			//活动荣誉信息
			if(Fname!=null){
				StudentHonor sh = new StudentHonor();
				sh.setStudentid(student.getId());
				honorList = studentHonorService.getStudentHonor(sh, 1, 999).getList();
				for(StudentHonor f:honorList){
					studentHonorService.removeStudentHonor(f.getId());
				}
				
				for(int i=0;i<Fname.size();i++){
					StudentHonor f=new StudentHonor();
					f.setGrade(Fgrade.get(i));
					f.setHonordate(Fhonordate.get(i));
					f.setName(Fname.get(i));
					f.setStudentid(student.getId());
					studentHonorService.addStudentHonor(f);
				}
			}			
		} catch (Exception e) {
			ContextUtils.setOpMessage(MessageType.SUCCESS, "数据修改失败");
			return list();
		}
			ContextUtils.setOpMessage(MessageType.ERROR, "数据修改成功");
			return list();		
	}

	@Authority(roles={Constants.ST_SCHOOL})
	public String examinedetail() {
		if (student == null) {
			ContextUtils.setOpMessage(MessageType.WARN, "用户访问的数据不存在");
			return ERROR;
		}
		student = studentService.getStudent(student.getId());
		// 获取学籍信息
		StudentSchoolRoll ssr = new StudentSchoolRoll();
		ssr.setStudentid(student.getId());
		schoolRollList = studentSchoolRollService.getStudentSchoolRoll(ssr, 1,
				999).getList();
		if (schoolRollList != null) {
			for (StudentSchoolRoll stu : schoolRollList) {
				School school = schoolService.getSchool(stu.getSchool());
				if (school != null) {
					stu.setSchoolname(school.getName());
				}
				stu.setJointypename(ApplicationUtils.getJoinCategory().get(
						stu.getJointype()));
			}
		}
		// 获取联系方式信息
		StudentRelation sr = new StudentRelation();
		sr.setStudentid(student.getId());
		relationList = studentRelationService.getStudentRelation(sr, 1, 999)
				.getList();
		// 获取教育信息
		StudentEducation se = new StudentEducation();
		se.setStudentid(student.getId());
		educationList = studentEducationService.getStudentEducation(se, 1, 999)
				.getList();
		// 获取就业信息
		StudentCareer sc = new StudentCareer();
		sc.setStudentid(student.getId());
		careerList = studentCareerService.getStudentCareer(sc, 1, 999)
				.getList();
		if (careerList != null) {
			for (StudentCareer stu : careerList) {
				stu.setCareertype(ApplicationUtils.getWorkCategory().get(
						stu.getCareertype()));
			}
		}
		// 获取实习信息
		StudentPractice sp = new StudentPractice();
		sp.setStudentid(student.getId());
		proticeList = studentProticeService.getStudentProtice(sp, 1, 999)
				.getList();
		if (proticeList != null) {
			for (StudentPractice stu : proticeList) {
				stu.setTypename(ApplicationUtils.getPracticsCategory().get(
						stu.getType()));
			}
		}
		// 获取论文信息
		StudentPaper spp = new StudentPaper();
		spp.setStudentid(student.getId());
		paperList = studentPaperService.getStudentPaper(spp, 1, 999).getList();
		if (paperList != null) {
			for (StudentPaper stu : paperList) {
				stu.setTypename(ApplicationUtils.getPaperCategory().get(
						stu.getType()));
				stu.setQuanlityname(ApplicationUtils.getPaperQuanlityCategory()
						.get(stu.getQuanlity()));
			}
		}
		// 获取科研信息
		StudentResearch srs = new StudentResearch();
		srs.setStudentid(student.getId());
		researchList = studentResearchService.getStudentResearch(srs, 1, 999)
				.getList();
		if (researchList != null) {
			for (StudentResearch stu : researchList) {
				stu.setTypename(ApplicationUtils.getResearchCategory().get(
						stu.getType()));
				stu.setGradename(ApplicationUtils.getResearchGradeCategory()
						.get(stu.getGrade()));
				stu.setRolename(ApplicationUtils.getAttendCategory().get(
						stu.getRole()));
			}
		}
		// 获取科研活动信息
		/* 遍历科研，取所有的活动 */
		if (researchList != null && researchList.size() > 0) {
			String tmp = "";
			for (StudentResearch r : researchList) {
				tmp += "," + r.getId();
			}
			tmp = tmp.substring(1);

			activityList = studentResearchActivityService
					.getStudentResearchActivity(tmp);
			if (activityList != null) {
				for (StudentResearchActivity stu : activityList) {
					stu.setGradename(ApplicationUtils
							.getActivityGradeCategory().get(stu.getGrade()));
				}
			}
		}
		// 获取获得荣誉信息
		StudentHonor sh = new StudentHonor();
		sh.setStudentid(student.getId());
		honorList = studentHonorService.getStudentHonor(sh, 1, 999).getList();
		if (honorList != null) {
			for (StudentHonor stu : honorList) {
				stu.setGradename(ApplicationUtils.getHonorGradeCategory().get(
						stu.getGrade()));
			}
		}
		return "examine_detail";
	}
	
	@Authority(roles={Constants.ST_ORG,Constants.ST_STUDENT})
	public String remove() {
		if(student == null) {
			log.warn("用户非法访问");
			ContextUtils.setOpMessage(MessageType.WARN, "用户非法访问");
			return ERROR;
		}		
		student=studentService.getStudent(student.getId());
		if(student!=null){
			if(transMessageService.isExists(student.getId())){
				ContextUtils.setOpMessage(MessageType.ERROR, "此学生已有业务信息，不能删除");
				return list();
			}
		}		
		try {			
			//删除学籍信息
			StudentSchoolRoll ssr = new StudentSchoolRoll();
			ssr.setStudentid(student.getId());
			for(StudentSchoolRoll s:studentSchoolRollService.getStudentSchoolRoll(ssr, 1, 999).getList()){
				studentSchoolRollService.removeStudentSchoolRoll(s.getId());
			}
			//删除联系方式信息
			StudentRelation sr = new StudentRelation();
			sr.setStudentid(student.getId());
			for(StudentRelation s:studentRelationService.getStudentRelation(sr, 1, 999).getList()){
				studentRelationService.removeStudentRelation(s.getId());
			}
			//删除教育信息
			StudentEducation se = new StudentEducation();
			se.setStudentid(student.getId());
			for(StudentEducation s:studentEducationService.getStudentEducation(se, 1, 999).getList()){
				studentEducationService.removeStudentEducation(s.getId());
			}
			//删除就业信息
			StudentCareer sc = new StudentCareer();
			sc.setStudentid(student.getId());
			for(StudentCareer s:studentCareerService.getStudentCareer(sc, 1, 999).getList()){
				studentCareerService.removeStudentCareer(s.getId());
			}
			//删除实习信息
			StudentPractice sp = new StudentPractice();
			sp.setStudentid(student.getId());
			for(StudentPractice s:studentProticeService.getStudentProtice(sp, 1, 999).getList()){
				studentProticeService.removeStudentProtice(s.getId());
			}
			//删除论文信息
			StudentPaper spp = new StudentPaper();
			spp.setStudentid(student.getId());
			for(StudentPaper s:studentPaperService.getStudentPaper(spp, 1, 999).getList()){
				studentPaperService.removeStudentPaper(s.getId());
			}
			//删除科研信息
			StudentResearch srs = new StudentResearch();
			srs.setStudentid(student.getId());
			for(StudentResearch s:studentResearchService.getStudentResearch(srs, 1, 999).getList()){
				//删除科研活动信息
				StudentResearchActivity sra=new StudentResearchActivity();
				sra.setStudentresearchid(s.getId());
				for(StudentResearchActivity d:studentResearchActivityService.getStudentResearchActivity(sra, 1, 999).getList()){
					studentResearchActivityService.removeStudentResearchActivity(d.getId());
				}		
				studentResearchService.removeStudentResearch(s.getId());
			}
			//删除获得荣誉信息
			StudentHonor sh = new StudentHonor();
			sh.setStudentid(student.getId());
			for(StudentHonor s:studentHonorService.getStudentHonor(sh, 1, 999).getList()){
				studentHonorService.removeStudentHonor(s.getId());
			}
			//删除基本信息
			//通过新数据找到原数据
			Student stu=new Student();
			stu.setNewid(student.getId());
			PageModel<Student> ps = studentService.getStudent(stu, 1, 999);
			if (ps!=null&&ps.getList().size()>0){
			    stu= ps.getList().get(0);
				studentService.removeStudent(stu.getId());
			}else{
				studentService.removeStudent(student.getId());
			}			
			//删除此帐户
			SPMember m=new SPMember();
			m=memberService.getSPMemberByName(student.getIdcard());
			if(m!=null){
				memberService.removeSPMember(m.getId());
			}
		} catch (Exception e) {
			ContextUtils.setOpMessage(MessageType.ERROR, "数据删除失败");
			return list();
		}		
		ContextUtils.setOpMessage(MessageType.SUCCESS, "数据删除成功");
		return list();
	}
	
	
	@Authority(roles={Constants.ST_ORG,Constants.ST_STUDENT})
	public String add() {
		return ADD;
	}
	/**
	 * 检查数据合法性
	 * 验证对象是否存在
	 * 验证所有字段是否合法
	 * @return
	 */
	private void checkData(){
		/*if (advertiseFor==null){
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
		}*/
	}
	//删除附件调用的方法
	@Authority(roles={Constants.ST_ORG,Constants.ST_STUDENT})
	public String delfile() {
		attachmentService.deleteAttachment(attachment.getId());
		attachments = attachmentService.getAttachmentByCid("pb_prize", attachment.getCid());
		request.setAttribute("attachments", attachments);
		advertiseFor = advertiseForService.getAdvertiseFor(attachment.getCid());

		return "modify";
	}
	/*@Authority(roles={Constants.ST_ORG,Constants.ST_STUDENT})
	public String remove() {
		if(advertiseFor == null) {
			log.warn("用户非法访问");
			ContextUtils.setOpMessage(MessageType.WARN, "用户非法访问");
			return ERROR;
		}
		if(advertiseForService.removeAdvertiseFor(advertiseFor.getId())) {
			//删除附件
			attachments = attachmentService.getAttachmentByCid("advertiseFor", advertiseFor.getId());
			if (attachments!=null){
				for(int i=0;i<attachments.size();i++){
				      attachmentService.deleteAttachment(attachments.get(i).getId());
				}
	        }
			ContextUtils.setOpMessage(MessageType.SUCCESS, "数据删除成功");
			return SUCCESS;
		}
		ContextUtils.setOpMessage(MessageType.ERROR, "数据删除失败");
		return SUCCESS;
	}*/
	
	@Authority(roles={Constants.ST_ORG,Constants.ST_STUDENT})
	public String myself() {
		//获取基本信息
	    student = studentService.getStudentByIdcard(BusinessUtils.getCurrentUser().getUsername());
	    return detail();
	}
	
	@Authority(roles={Constants.ST_ORG,Constants.ST_STUDENT})
	public String detail() {
		//attachments = attachmentService.getAttachmentByCid("advertiseFor", advertiseFor.getId());
		//request.setAttribute("attachments", attachments);
		
		//获取基本信息
	    student = studentService.getStudent(student.getId());
	    if(student == null) {
			ContextUtils.setOpMessage(MessageType.WARN, "用户访问的数据不存在");
			return ERROR;
		}
		//获取学籍信息
		StudentSchoolRoll ssr = new StudentSchoolRoll();
		ssr.setStudentid(student.getId());
		schoolRollList = studentSchoolRollService.getStudentSchoolRoll(ssr, 1, 999).getList();
		if (schoolRollList!=null){
			for(StudentSchoolRoll stu:schoolRollList){
				School school = schoolService.getSchool(stu.getSchool());
				if (school!=null){
					stu.setSchoolname(school.getName());
				}
				stu.setJointypename(ApplicationUtils.getJoinCategory().get(stu.getJointype()));
			}
		}
		//获取联系方式信息
		StudentRelation sr = new StudentRelation();
		sr.setStudentid(student.getId());
		relationList = studentRelationService.getStudentRelation(sr, 1, 999).getList();
		//获取教育信息
		StudentEducation se = new StudentEducation();
		se.setStudentid(student.getId());
		educationList = studentEducationService.getStudentEducation(se, 1, 999).getList();
		//获取就业信息
		StudentCareer sc = new StudentCareer();
		sc.setStudentid(student.getId());
		careerList = studentCareerService.getStudentCareer(sc, 1, 999).getList();
		if (careerList!=null){
			for(StudentCareer stu:careerList){
				stu.setCareertype(ApplicationUtils.getWorkCategory().get(stu.getCareertype()));
				stu.setUnittype(ApplicationUtils.getWorkUnitCategory().get(stu.getUnittype()));
			}
		}
		//获取实习信息
		StudentPractice sp = new StudentPractice();
		sp.setStudentid(student.getId());
		proticeList = studentProticeService.getStudentProtice(sp, 1, 999).getList();
		if (proticeList!=null){
			for(StudentPractice stu:proticeList){
				stu.setTypename(ApplicationUtils.getPracticsCategory().get(stu.getType()));
			}
		}
		//获取论文信息
		StudentPaper spp = new StudentPaper();
		spp.setStudentid(student.getId());
		paperList = studentPaperService.getStudentPaper(spp, 1, 999).getList();
		if (paperList!=null){
			for(StudentPaper stu:paperList){
				stu.setTypename(ApplicationUtils.getPaperCategory().get(stu.getType()));
				stu.setQuanlityname(ApplicationUtils.getPaperQuanlityCategory().get(stu.getQuanlity()));
			}
		}
		//获取科研信息
		StudentResearch srs = new StudentResearch();
		srs.setStudentid(student.getId());
		researchList = studentResearchService.getStudentResearch(srs, 1, 999).getList();
		if (researchList!=null){
			for(StudentResearch stu:researchList){
				stu.setTypename(ApplicationUtils.getResearchCategory().get(stu.getType()));
				stu.setGradename(ApplicationUtils.getResearchGradeCategory().get(stu.getGrade()));
				stu.setRolename(ApplicationUtils.getAttendCategory().get(stu.getRole()));
			}
		}
		//获取科研活动信息
        /*遍历科研，取所有的活动*/
		if (researchList!=null&&researchList.size()>0){
			String tmp = "";
			for(StudentResearch r:researchList){
			   	tmp += ","+r.getId();
			}
			tmp = tmp.substring(1);
			
			activityList = studentResearchActivityService.getStudentResearchActivity(tmp);
			if (activityList!=null){
				for(StudentResearchActivity stu:activityList){
					stu.setGradename(ApplicationUtils.getActivityGradeCategory().get(stu.getGrade()));
				}
			}
		}
		//获取获得荣誉信息
		StudentHonor sh = new StudentHonor();
		sh.setStudentid(student.getId());
		honorList = studentHonorService.getStudentHonor(sh, 1, 999).getList();
		if (honorList!=null){
			for(StudentHonor stu:honorList){
				stu.setGradename(ApplicationUtils.getHonorGradeCategory().get(stu.getGrade()));
			}
		}
		return DETAIL;
	}
	
/*	@Authority(roles={Constants.ST_ORG,Constants.ST_STUDENT})
	public String modify() {
		attachments = attachmentService.getAttachmentByCid("advertiseFor", advertiseFor.getId());
		request.setAttribute("attachments", attachments);
		advertiseFor = advertiseForService.getAdvertiseFor(advertiseFor.getId());

		return "modify";
	}
	@Authority(roles={Constants.ST_ORG,Constants.ST_STUDENT})
	public String save() {
		if(advertiseFor == null) {
			log.warn("用户非法访问");
			ContextUtils.setOpMessage(MessageType.WARN, "用户非法访问");
			return ERROR;
		}
        
		if(advertiseForService.addAdvertiseFor(advertiseFor) != null) {
			
			ContextUtils.setOpMessage(MessageType.SUCCESS, "数据添加成功");
			return SUCCESS;
		}
		ContextUtils.setOpMessage(MessageType.ERROR, "数据添加失败");
		return SUCCESS;
	}
	@Authority(roles={Constants.ST_ORG,Constants.ST_STUDENT})
	public String update() {
		if(advertiseFor == null) {
			log.warn("用户非法访问");
			ContextUtils.setOpMessage(MessageType.WARN, "用户非法访问");
			return ERROR;
		}
		if(advertiseForService.updateAdvertiseFor(advertiseFor) != null) {
			ContextUtils.setOpMessage(MessageType.SUCCESS, "数据更新成功");
			return SUCCESS;
		}
		ContextUtils.setOpMessage(MessageType.ERROR, "数据更新失败");
		return SUCCESS;
	}*/
	@Authority(roles={Constants.ST_SCHOOL})
	public String importstudents() {
		if (file==null){
			ContextUtils.setOpMessage(MessageType.ERROR, "请选择要导入的文件！");
			return SUCCESS;
		}
        //上传要导入的文件
		Attachment atta=attachmentService.uploadFile("student_import", file, fileFileName);
		if (atta==null){
			ContextUtils.setOpMessage(MessageType.ERROR, "导入文件上传失败！\n");
			return SUCCESS;
		}
		SPMember member = memberService.getSPMember(BusinessUtils.getCurrentUser().getId());
		int id = member.getBelongto();
		int IMCOUNT = 0;
		List<String> errorlist = new ArrayList<String>();
		String errs ="";
		try{
			String tmpfile = this.getProjectPath()+atta.getUrl();
		    //导入数据
		    Map<String,List> maplist = ImportUtils.importExcel(tmpfile, id);
		    
	        List<Student> studentlist = maplist.get("studentlist");
	        List<StudentRelation> relationlist = maplist.get("relationlist");
	        List<StudentSchoolRoll> rolllist = maplist.get("rolllist");
	        List<StudentEducation> educationlist = maplist.get("educationlist");
	        List<StudentCareer> careerlist = maplist.get("careerlist");
	        List<StudentPractice> practicelist = maplist.get("practicelist");
	        List<StudentPaper> paperlist = maplist.get("paperlist");
	        List<StudentResearch> researchlist = maplist.get("researchlist");
	        List<StudentResearchActivity> activitylist = maplist.get("activitylist");
	        List<StudentHonor> honorlist = maplist.get("honorlist");
	        
	        errorlist = maplist.get("error");
	        errs = errorlist.get(0);
	        /*如果没有合法的学生信息则直接退出*/
	        if (studentlist==null||studentlist.size()==0){
	        	ContextUtils.setOpMessage(MessageType.ERROR, "没有验证通过的数据可以导入，请检查，错误原因：\n "+errs);
	        	return ERROR;
	        }
	        for(Student s: studentlist){
	        	s.setSchoolid(id);
	        	s.setStatus("I");
	        	Student newstudent = studentService.addStudent(s);
	        	//增加账号
	        	SPMember spm = new SPMember();
	        	spm.setBelongto(newstudent.getId());
	        	spm.setCreatedate(new Date());
	        	spm.setGender(newstudent.getGender());
	        	spm.setIsfinishcheck(1);
	        	spm.setIslocked(0);
	        	spm.setName(newstudent.getName());
	        	String idcard = newstudent.getIdcard();
	        	String pass = idcard.substring(idcard.length()-6);
	        	String newpass = BusinessUtils.getEncodePassword(pass);
	        	spm.setPassword(newpass);
	        	spm.setRoletype(Constants.ST_STUDENT);
	        	spm.setUsername(idcard);
	        	for(StudentRelation sr :relationlist){
	        		if (sr.getIdcard().equals(s.getIdcard())){
		        		spm.setTelphone(sr.getPhone());
			        	spm.setEmail(sr.getEmail());
			        	spm.setMobile(sr.getPhone());
			        	break;
	        		}
	        	}
	        	
	        	memberService.addSPMember(spm);
	        	
	        	IMCOUNT++;
	        }
	        for(StudentRelation sr:relationlist){
	        	Student student = studentService.getStudentByIdcard(sr.getIdcard());
	        	if(student!=null){
		        	sr.setStudentid(student.getId());
		           	studentRelationService.addStudentRelation(sr);
	        	}
	        }
	        for(StudentSchoolRoll ssr:rolllist){
	        	Student student = studentService.getStudentByIdcard(ssr.getIdcard());
	        	if(student!=null){
		        	ssr.setStudentid(student.getId());
		           	studentSchoolRollService.addStudentSchoolRoll(ssr);
	        	}
	        }
	        for(StudentEducation se:educationlist){
	        	Student student = studentService.getStudentByIdcard(se.getIdcard());
	        	if(student!=null){
		        	se.setStudentid(student.getId());
		           	studentEducationService.addStudentEducation(se);
	        	}
	        }
	        for(StudentCareer sc:careerlist){
	        	Student student = studentService.getStudentByIdcard(sc.getIdcard());
	        	if(student!=null){
		        	sc.setStudentid(student.getId());
		           	studentCareerService.addStudentCareer(sc);
	        	}
	        }
	        for(StudentPractice sp:practicelist){
	        	Student student = studentService.getStudentByIdcard(sp.getIdcard());
	        	if(student!=null){
		        	sp.setStudentid(student.getId());
		        	studentProticeService.addStudentProtice(sp);
	        	}
	        }
	        for(StudentPaper sc:paperlist){
	        	Student student = studentService.getStudentByIdcard(sc.getIdcard());
	        	if(student!=null){
		        	sc.setStudentid(student.getId());
		           	studentPaperService.addStudentPaper(sc);
	        	}
	        }
	        for(StudentResearch sr:researchlist){
	        	String idcard = sr.getIdcard();
	        	String title = sr.getTitle();
	        	Student student = studentService.getStudentByIdcard(sr.getIdcard());
	        	if(student!=null){
		        	sr.setStudentid(student.getId());
		        	StudentResearch res = studentResearchService.addStudentResearch(sr);
		        
			        for(StudentResearchActivity sra:activitylist){
			        	if (idcard.equals(sra.getIdcard())&&title.equals(sra.getResearchname())){
				        	sra.setStudentresearchid(res.getId());
			        		studentResearchActivityService.addStudentResearchActivity(sra);
			        	}
			        }
	        	}
	        }
	        for(StudentHonor sh:honorlist){
	        	Student student = studentService.getStudentByIdcard(sh.getIdcard());
	        	if(student!=null){
		        	sh.setStudentid(student.getId());
		           	studentHonorService.addStudentHonor(sh);
	        	}
	        }
		}catch(Exception e){
			e.printStackTrace();
			log.error(e.getMessage());
			if (errs!=null){
			   ContextUtils.setOpMessage(MessageType.ERROR, errs+"\n数据导入完成，部分数据失败\n "+e.getMessage());
			}else{
				ContextUtils.setOpMessage(MessageType.ERROR, "数据导入完成，部分数据失败\n "+e.getMessage());
			}
			return ERROR;
		}
		if (errs!=null){
		   ContextUtils.setOpMessage(MessageType.SUCCESS, "数据导入完成！\n "+errs);
		}else{
			ContextUtils.setOpMessage(MessageType.SUCCESS, "数据导入成功！\n");
		}
		//给管理员发站内短信和手机短信
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	String sequence="";
    	try{
    		sequence = format.format(new Date());
    	}catch(Exception e){
    		log.error("转换日期异常：", e);
    	}
    	//如果导入数据的条数大于0条，则给管理员发短信
    	if (IMCOUNT>0){
			TransMessage tm = new TransMessage();
			tm.setContent(member.getName()+" 学校用户在"+sequence+"时刻导入了"+IMCOUNT+"条学生数据");
			tm.setReceivers("|-1|");
			tm.setSenddate(new Date());
			tm.setSender(member.getId());
			tm.setSendertype(Constants.ST_SCHOOL);
			tm.setTitle(member.getName()+"学生信息数据导入通知");
			if(transMessageService.addTransMessage(tm)!=null) {
				//发送短信
				//得到接收人手机号码并发短信
				User user = userService.getUserByName("admin");
				if (user!=null&&user.getMobile()!=null&&!user.getMobile().equals("")){
					ShortMessage.send(tm.getContent(), new String[]{user.getMobile()});
				}
			}
    	}
    	return SUCCESS;
	}
	
	//得到项目路径
	private String getProjectPath(){
		String path = Thread.currentThread().getContextClassLoader().getResource("").getPath();
   	 //将web-inf后的去掉
        int pos = path.indexOf("WEB-INF");
        path = path.substring(0, pos);
        //判断操作系统，如果是windows的，去掉前面的“/”
        String os = System.getProperty("os.name");

        if(os.startsWith("win") || os.startsWith("Win")){
       	 path = path.substring(1);
        }
        
        return path;
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
	public List<Attachment> getAttachments() {
		return attachments;
	}
	public void setAttachments(List<Attachment> attachments) {
		this.attachments = attachments;
	}
	public Attachment getAttachment() {
		return attachment;
	}
	public void setAttachment(Attachment attachment) {
		this.attachment = attachment;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public List<StudentSchoolRoll> getSchoolRollList() {
		return schoolRollList;
	}

	public void setSchoolRollList(List<StudentSchoolRoll> schoolRollList) {
		this.schoolRollList = schoolRollList;
	}

	public List<StudentCareer> getCareerList() {
		return careerList;
	}

	public void setCareerList(List<StudentCareer> careerList) {
		this.careerList = careerList;
	}

	public List<StudentEducation> getEducationList() {
		return educationList;
	}

	public void setEducationList(List<StudentEducation> educationList) {
		this.educationList = educationList;
	}

	public List<StudentHonor> getHonorList() {
		return honorList;
	}

	public void setHonorList(List<StudentHonor> honorList) {
		this.honorList = honorList;
	}

	public List<StudentPractice> getProticeList() {
		return proticeList;
	}

	public void setProticeList(List<StudentPractice> proticeList) {
		this.proticeList = proticeList;
	}

	public List<StudentResearch> getResearchList() {
		return researchList;
	}

	public void setResearchList(List<StudentResearch> researchList) {
		this.researchList = researchList;
	}

	public List<StudentResearchActivity> getActivityList() {
		return activityList;
	}

	public void setActivityList(List<StudentResearchActivity> activityList) {
		this.activityList = activityList;
	}

	public List<StudentRelation> getRelationList() {
		return relationList;
	}

	public void setRelationList(List<StudentRelation> relationList) {
		this.relationList = relationList;
	}

	public List<StudentPaper> getPaperList() {
		return paperList;
	}

	public void setPaperList(List<StudentPaper> paperList) {
		this.paperList = paperList;
	}
	
	public File getFile() {
		return file;
	}
	public void setFile(File file) {
		this.file = file;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}
	public List<String> getCareertype() {
		return careertype;
	}
	public void setCareertype(List<String> careertype) {
		this.careertype = careertype;
	}
	public List<String> getCorporationname() {
		return corporationname;
	}
	public void setCorporationname(List<String> corporationname) {
		this.corporationname = corporationname;
	}
	public List<String> getAddress() {
		return address;
	}
	public void setAddress(List<String> address) {
		this.address = address;
	}
	public List<Date> getStartdate() {
		return startdate;
	}
	public void setStartdate(List<Date> startdate) {
		this.startdate = startdate;
	}
	public List<Date> getFinishdate() {
		return finishdate;
	}
	public void setFinishdate(List<Date> finishdate) {
		this.finishdate = finishdate;
	}
	public StudentPractice getStudentPractice() {
		return studentPractice;
	}
	public void setStudentPractice(StudentPractice studentPractice) {
		this.studentPractice = studentPractice;
	}
	public StudentPaper getStudentPaper() {
		return studentPaper;
	}
	public void setStudentPaper(StudentPaper studentPaper) {
		this.studentPaper = studentPaper;
	}
	public StudentResearch getStudentResearch() {
		return studentResearch;
	}
	public void setStudentResearch(StudentResearch studentResearch) {
		this.studentResearch = studentResearch;
	}
	public StudentResearchActivity getStudentResearchActivity() {
		return studentResearchActivity;
	}
	public void setStudentResearchActivity(
			StudentResearchActivity studentResearchActivity) {
		this.studentResearchActivity = studentResearchActivity;
	}
	public StudentHonor getStudentHonor() {
		return studentHonor;
	}
	public void setStudentHonor(StudentHonor studentHonor) {
		this.studentHonor = studentHonor;
	}
	public StudentSchoolRoll getStudentSchoolRoll() {
		return studentSchoolRoll;
	}
	public void setStudentSchoolRoll(StudentSchoolRoll studentSchoolRoll) {
		this.studentSchoolRoll = studentSchoolRoll;
	}
	public StudentRelation getStudentRelation() {
		return studentRelation;
	}
	public void setStudentRelation(StudentRelation studentRelation) {
		this.studentRelation = studentRelation;
	}
	public StudentEducation getStudentEducation() {
		return studentEducation;
	}
	public void setStudentEducation(StudentEducation studentEducation) {
		this.studentEducation = studentEducation;
	}
	public List<String> getAschoolname() {
		return Aschoolname;
	}
	public void setAschoolname(List<String> aschoolname) {
		Aschoolname = aschoolname;
	}
	public List<String> getAprofessional() {
		return Aprofessional;
	}
	public void setAprofessional(List<String> aprofessional) {
		Aprofessional = aprofessional;
	}
	public List<String> getAhonor() {
		return Ahonor;
	}
	public void setAhonor(List<String> ahonor) {
		Ahonor = ahonor;
	}
	public List<String> getAreportproject() {
		return Areportproject;
	}
	public void setAreportproject(List<String> areportproject) {
		Areportproject = areportproject;
	}
	public List<Date> getAstartdate() {
		return Astartdate;
	}
	public void setAstartdate(List<Date> astartdate) {
		Astartdate = astartdate;
	}
	public List<Date> getAfinishdate() {
		return Afinishdate;
	}
	public void setAfinishdate(List<Date> afinishdate) {
		Afinishdate = afinishdate;
	}
	public List<String> getBcorporation() {
		return Bcorporation;
	}
	public void setBcorporation(List<String> bcorporation) {
		Bcorporation = bcorporation;
	}
	public List<String> getBteacher() {
		return Bteacher;
	}
	public void setBteacher(List<String> bteacher) {
		Bteacher = bteacher;
	}
	public List<String> getBtype() {
		return Btype;
	}
	public void setBtype(List<String> btype) {
		Btype = btype;
	}
	public List<String> getBwork() {
		return Bwork;
	}
	public void setBwork(List<String> bwork) {
		Bwork = bwork;
	}
	public List<Date> getBstartdate() {
		return Bstartdate;
	}
	public void setBstartdate(List<Date> bstartdate) {
		Bstartdate = bstartdate;
	}
	public List<Date> getBfinishdate() {
		return Bfinishdate;
	}
	public void setBfinishdate(List<Date> bfinishdate) {
		Bfinishdate = bfinishdate;
	}
	public List<String> getCname() {
		return Cname;
	}
	public void setCname(List<String> cname) {
		Cname = cname;
	}
	public List<String> getCteacher() {
		return Cteacher;
	}
	public void setCteacher(List<String> cteacher) {
		Cteacher = cteacher;
	}
	public List<String> getCtype() {
		return Ctype;
	}
	public void setCtype(List<String> ctype) {
		Ctype = ctype;
	}
	public List<String> getCquanlity() {
		return Cquanlity;
	}
	public void setCquanlity(List<String> cquanlity) {
		Cquanlity = cquanlity;
	}
	public List<String> getCresume() {
		return Cresume;
	}
	public void setCresume(List<String> cresume) {
		Cresume = cresume;
	}
	public List<String> getCwork() {
		return Cwork;
	}
	public void setCwork(List<String> cwork) {
		Cwork = cwork;
	}
	public List<String> getDtitle() {
		return Dtitle;
	}
	public void setDtitle(List<String> dtitle) {
		Dtitle = dtitle;
	}
	public List<String> getDtype() {
		return Dtype;
	}
	public void setDtype(List<String> dtype) {
		Dtype = dtype;
	}
	public List<String> getDgrade() {
		return Dgrade;
	}
	public void setDgrade(List<String> dgrade) {
		Dgrade = dgrade;
	}
	public List<String> getDrole() {
		return Drole;
	}
	public void setDrole(List<String> drole) {
		Drole = drole;
	}
	public List<Date> getDstartdate() {
		return Dstartdate;
	}
	public void setDstartdate(List<Date> dstartdate) {
		Dstartdate = dstartdate;
	}
	public List<Date> getDfinishdate() {
		return Dfinishdate;
	}
	public void setDfinishdate(List<Date> dfinishdate) {
		Dfinishdate = dfinishdate;
	}
	public List<String> getDEname() {
		return DEname;
	}
	public void setDEname(List<String> dEname) {
		DEname = dEname;
	}
	public List<String> getEname() {
		return Ename;
	}
	public void setEname(List<String> ename) {
		Ename = ename;
	}
	public List<String> getEpapername() {
		return Epapername;
	}
	public void setEpapername(List<String> epapername) {
		Epapername = epapername;
	}
	public List<String> getEgrade() {
		return Egrade;
	}
	public void setEgrade(List<String> egrade) {
		Egrade = egrade;
	}
	public List<Date> getEstartdate() {
		return Estartdate;
	}
	public void setEstartdate(List<Date> estartdate) {
		Estartdate = estartdate;
	}
	public List<Date> getEfinishdate() {
		return Efinishdate;
	}
	public void setEfinishdate(List<Date> efinishdate) {
		Efinishdate = efinishdate;
	}
	public List<String> getEpaperorder() {
		return Epaperorder;
	}
	public void setEpaperorder(List<String> epaperorder) {
		Epaperorder = epaperorder;
	}
	public List<String> getFname() {
		return Fname;
	}
	public void setFname(List<String> fname) {
		Fname = fname;
	}
	public List<String> getFgrade() {
		return Fgrade;
	}
	public void setFgrade(List<String> fgrade) {
		Fgrade = fgrade;
	}
	public List<Date> getFhonordate() {
		return Fhonordate;
	}
	public void setFhonordate(List<Date> fhonordate) {
		Fhonordate = fhonordate;
	}

	public List<String> getUnittype() {
		return unittype;
	}
	public void setUnittype(List<String> unittype) {
		this.unittype = unittype;
	}
	public List<String> getOthername() {
		return othername;
	}
	public void setOthername(List<String> othername) {
		this.othername = othername;
	}
   }
