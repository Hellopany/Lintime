package cn.kepu.ability.admin.action;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;

import cn.kepu.ability.common.Constants;
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
import cn.kepu.base.MessageType;
import cn.kepu.base.action.PageAction;
import cn.kepu.base.annotation.Authority;
import cn.kepu.utils.ContextUtils;

public class StudentAction extends PageAction<Student> {
	@Autowired
	private StudentService studentService;
	@Autowired
	private SchoolService schoolService;
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
	
	private Student student;
	
	
	private List<StudentSchoolRoll> schoolRollList;
	private List<StudentCareer> careerList;
	private List<StudentEducation> educationList;
	private List<StudentHonor> honorList;
	private List<StudentPractice> proticeList;
	private List<StudentResearch> researchList;
	private List<StudentResearchActivity> activityList;
	private List<StudentRelation> relationList;
	private List<StudentPaper> paperList;
	private Integer size;
	private static final Log log = LogFactory.getLog(StudentAction.class);
	
	@Authority(roles={Constants.ST_ADMIN})
	public String liststudent() {
		pageModel = studentService.getStudent(null, pageNo, pageSize);
		// 除了审批人和学生 其余角色都进行如下处理
		for (int i = 0; i < pageModel.getList().size(); i++) {
			if ("A".equals(pageModel.getList().get(i).getStatus())) {
				Student stu = new Student();
				stu = studentService.getStudent(pageModel.getList().get(i).getNewid());
				// 添加为新数据
				pageModel.getList().add(stu);
				// 审批通过后 删除原数据
				pageModel.getList().remove(i);
			}

		}
		size=pageModel.getList().size();
		return "students";
	}

	@Authority(roles={Constants.ST_ORG,Constants.ST_STUDENT})
	public String list() {
		pageModel = studentService.getStudent(null, pageNo, pageSize);

		return LIST;
	}

	
	@Authority(roles={Constants.ST_ORG,Constants.ST_STUDENT})
	public String detail() {
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
		return "student";
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
	public Integer getSize() {
		return size;
	}
	public void setSize(Integer size) {
		this.size = size;
	}
	
   }
