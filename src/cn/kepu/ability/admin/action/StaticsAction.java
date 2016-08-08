package cn.kepu.ability.admin.action;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;

import cn.kepu.ability.common.Constants;
import cn.kepu.ability.common.service.StaticsService;
import cn.kepu.ability.kprc.bean.School;
import cn.kepu.ability.kprc.bean.Statics;
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
import cn.kepu.ability.utils.ExportUtils;
import cn.kepu.base.MessageType;
import cn.kepu.base.action.PageAction;
import cn.kepu.base.annotation.Authority;
import cn.kepu.utils.ContextUtils;
import cn.kepu.utils.PageModel;

public class StaticsAction extends PageAction<Statics> {
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
	@Autowired
	private StaticsService staticsService;
	private Student student;
	private StudentCareer studentCareer;
	private StudentSchoolRoll studentSchoolRoll;
	
	
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
	
	private Map<String,String> schoolMap;
	private Map<String,String> typeMap;
	private Map<String,String> yearMap;
	
	private static final Log log = LogFactory.getLog(StaticsAction.class);
	
	@Authority(roles={Constants.ST_ADMIN})
	public String query() {
		schoolMap = new HashMap<String,String>();
		typeMap = new HashMap<String,String>();
		yearMap = new HashMap<String,String>();
		//pageModel = studentService.getStudent(student, pageNo, pageSize);
        PageModel<School> pms = schoolService.getSchool(null, 1, 999);
        if (pms!=null&&pms.getList().size()>0){
        	for(School s: pms.getList()){
        		schoolMap.put(s.getId().toString(), s.getName());
        	}
        }
        schoolMap.put("", "所有");
        //查看年度
        //typeMap = ApplicationUtils.getWorkCategory();
        typeMap.putAll(ApplicationUtils.getWorkCategory());
        typeMap.put("", "所有");
        
        DateFormat format = new SimpleDateFormat("yyyy");
        if (studentSchoolRoll==null||studentSchoolRoll.getYear()==null||studentSchoolRoll.getYear().equals("")){
        	if (studentSchoolRoll==null){
        		studentSchoolRoll = new StudentSchoolRoll();
        	}
        	studentSchoolRoll.setYear(format.format(new Date()));
        }
//        String sequence="";
//    	try{
//    		sequence = format.format(new Date());
//    	}catch(Exception e){
//    		log.error("转换日期异常：", e);
//    	}
//    	int newyear = Integer.parseInt(sequence);
//    	for(int i=10;i>0;i--){
//    		yearMap.put(String.valueOf(newyear-i), String.valueOf(newyear-i));
//    	}
//    	yearMap.put(String.valueOf(newyear), String.valueOf(newyear));
		return "statics";
	}
	@Authority(roles={Constants.ST_ADMIN})
	public String newquery() {
		query();
		int count = 0;
		String schoolid = "";
		String careertype = "";
		String year = "";
		if (student!=null&&student.getSchoolid()!=null&&!student.getSchoolid().equals("")){
            schoolid = student.getSchoolid().toString(); 			
		}
		if (studentCareer!=null&&studentCareer.getCareertype()!=null&&!studentCareer.getCareertype().equals("")){
			careertype = studentCareer.getCareertype();		
		}
		if (studentSchoolRoll!=null&&studentSchoolRoll.getYear()!=null&&!studentSchoolRoll.getYear().equals("")){
            year = studentSchoolRoll.getYear();		
		}
		//计算取多少个
		long records = staticsService.getDataHqlCount(pageNo,pageSize, schoolid, careertype, year);
		if (records>=1){
			List list = staticsService.getDataHql(pageNo,pageSize, schoolid, careertype, year);
			//取当前页面的数据
			List<Statics> staList = new ArrayList<Statics>();
			for(Object object : list){
				Object[] s = (Object[])object;
				int studentid =Integer.parseInt(s[0].toString());
				Statics statics = new Statics();
				//获取学生信息
				//获取基本信息
			    student = studentService.getStudent(studentid);
			    statics.setId(student.getId());
			    statics.setName(student.getName());
			    //获取学校信息
			    School school = schoolService.getSchool(student.getSchoolid());
			    statics.setSchoolid(student.getSchoolid());
			    statics.setSchoolname(school.getName());
				//获取学籍信息
				StudentSchoolRoll ssr = new StudentSchoolRoll();
				ssr.setStudentid(student.getId());
				schoolRollList = studentSchoolRollService.getStudentSchoolRoll(ssr, 1, 1).getList();
				if (schoolRollList!=null){
					StudentSchoolRoll studentSchoolRoll = schoolRollList.get(0);
					statics.setProfessional(studentSchoolRoll.getProfessional());
					statics.setJoindate(studentSchoolRoll.getJoindate());
				}
				//获取就业信息
				StudentCareer sc = new StudentCareer();
				sc.setStudentid(student.getId());
				careerList = studentCareerService.getStudentCareer(sc, 1, 1).getList();
				if (careerList!=null){
					sc = careerList.get(0);
					statics.setWorktype(sc.getCareertype());
					statics.setWorktypename(ApplicationUtils.getWorkCategory().get(sc.getCareertype()));
				}
				//获取实习信息
				StudentPractice sp = new StudentPractice();
				sp.setStudentid(student.getId());
				proticeList = studentProticeService.getStudentProtice(sp, 1, 999).getList();
				if (proticeList!=null){
					String tmp = "";
					for(StudentPractice stu:proticeList){
						tmp += stu.getCorporation()+" |";
					}
					if (!tmp.equals("")){
						tmp = tmp.substring(0,tmp.length()-1);
					}
					statics.setPraticeunit(tmp);
					statics.setIswork(true);
					statics.setWorked("是");
				}else{
					statics.setIswork(false);
					statics.setWorked("否");
				}
				
				staList.add(statics);
			}
			//重置查询条件
			if (!schoolid.equals(""))
			   student.setSchoolid(Integer.parseInt(schoolid));
			else
				student.setSchoolid(null);
			studentCareer.setCareertype(careertype);
			if (year!=null&&!year.equals(""))
			   studentSchoolRoll.setYear(year);
			
			pageModel = new PageModel<Statics>();
			pageModel.setList(staList);
			pageModel.setPageNo(pageNo);
			pageModel.setPageSize(pageSize);
			pageModel.setTotalRecords((int) records);
		}else{
			pageModel = new PageModel<Statics>();
			pageModel.setList(new ArrayList<Statics>());
			pageModel.setPageNo(pageNo);
			pageModel.setPageSize(pageSize);
			pageModel.setTotalRecords(0);
		}
		return "statics";
	}

	public String export()  throws Exception{
		pageNo = 1;
		pageSize = 9999;	
		newquery();
		String title = "学生就业情况信息表";
		String[] fieldname = {"学生名称","所属院校","专业","入学日期","就业意向","就业情况","实习单位"};
		String[] columnname = {"name","schoolname","professional","Joindate","worktypename","worked","praticeunit"};
		if (pageModel==null||pageModel.getList().size()==0){
			ContextUtils.setOpMessage(MessageType.SUCCESS, "没有查询到数据，不能导出");
			return SUCCESS;
		}
		ExportUtils.exportExcel2(title, fieldname, columnname, pageModel,request,response);
		return null;
	}
	
	@Authority(roles={Constants.ST_ADMIN})
	public String statics() {
		query();
		int count = 0;
		String schoolid = "";
		String careertype = "";
		String year = "";
		if (student!=null&&student.getSchoolid()!=null&&!student.getSchoolid().equals("")){
            schoolid = student.getSchoolid().toString(); 			
		}
		if (studentCareer!=null&&studentCareer.getCareertype()!=null&&!studentCareer.getCareertype().equals("")){
			careertype = studentCareer.getCareertype();		
		}
		if (studentSchoolRoll!=null&&studentSchoolRoll.getYear()!=null&&!studentSchoolRoll.getYear().equals("")){
            year = studentSchoolRoll.getYear();		
		}
		
		List list = staticsService.getSchoolStudents(schoolid,careertype, year);
		if (list!=null&&list.size()>0){
			//获取就业情况
			List workList = staticsService.getStudentsWorkTypes(schoolid, careertype, year);
			//取当前页面的数据
			List<Statics> staList = new ArrayList<Statics>();
			for(Object object : list){
				Object[] s = (Object[])object;
				int id =Integer.parseInt(s[0].toString());
				int gracount = Integer.parseInt(s[1].toString());
				Statics statics = new Statics();
			    //获取学校信息
			    School school = schoolService.getSchool(id);
			    statics.setSchoolid(student.getSchoolid());
			    statics.setSchoolname(school.getName());
			    statics.setGraduatecount(gracount);

				//获取就业信息
			    int wjy = 0;
			    int kp = 0;
			    //是否没有数据的标志
			    boolean flag = false;
			    for(Object obj : workList){
					Object[] w = (Object[])obj;
					String schools = w[0].toString();
					
					if (schools.equals(String.valueOf(id))){
					   Object wstr =w[2];
					   if (wstr==null||wstr.toString().equals("")){
						   wjy += Integer.parseInt(w[3].toString());
						   //计算科普行业人数
						   String tmp = w[1].toString();
						   if (!tmp.equals("B")&&!tmp.equals("E")&&!tmp.equals("F")&&!tmp.equals("H")){
							   kp += Integer.parseInt(w[3].toString());
						   }
					   }
					   flag = true;
					}
			    }
			    if (flag){
			    	statics.setNotworkcount(gracount);
				    statics.setWorkcount(0);
					statics.setKpcount(gracount);
			    }else{
				    statics.setNotworkcount(wjy);
				    statics.setWorkcount(gracount-wjy);
					statics.setKpcount(kp);
			    }
				staList.add(statics);
			}
			//重置查询条件
			if (!schoolid.equals(""))
			   student.setSchoolid(Integer.parseInt(schoolid));
			else
				student.setSchoolid(null);
			studentCareer.setCareertype(careertype);
			studentSchoolRoll.setYear(year);
			
			pageModel = new PageModel<Statics>();
			pageModel.setList(staList);
			pageModel.setPageNo(1);
			pageModel.setPageSize(9999);
			pageModel.setTotalRecords(list.size());
		}else{
			pageModel = new PageModel<Statics>();
			pageModel.setList(new ArrayList<Statics>());
			pageModel.setPageNo(pageNo);
			pageModel.setPageSize(pageSize);
			pageModel.setTotalRecords(0);
		}
		return "staticssum";
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
	public Map<String, String> getSchoolMap() {
		return schoolMap;
	}
	public void setSchoolMap(Map<String, String> schoolMap) {
		this.schoolMap = schoolMap;
	}
	public StudentCareer getStudentCareer() {
		return studentCareer;
	}
	public void setStudentCareer(StudentCareer studentCareer) {
		this.studentCareer = studentCareer;
	}
	public StudentSchoolRoll getStudentSchoolRoll() {
		return studentSchoolRoll;
	}
	public void setStudentSchoolRoll(StudentSchoolRoll studentSchoolRoll) {
		this.studentSchoolRoll = studentSchoolRoll;
	}
	public Map<String, String> getTypeMap() {
		return typeMap;
	}
	public void setTypeMap(Map<String, String> typeMap) {
		this.typeMap = typeMap;
	}
	public Map<String, String> getYearMap() {
		return yearMap;
	}
	public void setYearMap(Map<String, String> yearMap) {
		this.yearMap = yearMap;
	}
	
   }
