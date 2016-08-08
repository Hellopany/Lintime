package cn.kepu.ability.kprc.bean;

import java.util.Date;

public class StudentResearchActivity implements java.io.Serializable {
	 private Integer id;
	 private Integer studentresearchid;
	 private String researchname;
     private String name;
	 private String grade;
	 private String gradename;
	 private Integer ispaper;
	 private String papername;
	 private Integer paperorder;
     private Date startdate;
     private Date finishdate;
     private String idcard;
     
     public StudentResearchActivity() {
    	}

	public StudentResearchActivity(Integer id, Integer studentresearchid,
			String name, String grade, Integer ispaper, String papername,
			Integer paperorder, Date startdate, Date finishdate) {
		super();
		this.id = id;
		this.studentresearchid = studentresearchid;
		this.name = name;
		this.grade = grade;
		this.ispaper = ispaper;
		this.papername = papername;
		this.paperorder = paperorder;
		this.startdate = startdate;
		this.finishdate = finishdate;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getStudentresearchid() {
		return studentresearchid;
	}

	public void setStudentresearchid(Integer studentresearchid) {
		this.studentresearchid = studentresearchid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public Integer getIspaper() {
		return ispaper;
	}

	public void setIspaper(Integer ispaper) {
		this.ispaper = ispaper;
	}

	public String getPapername() {
		return papername;
	}

	public void setPapername(String papername) {
		this.papername = papername;
	}

	public Integer getPaperorder() {
		return paperorder;
	}

	public void setPaperorder(Integer paperorder) {
		this.paperorder = paperorder;
	}

	public Date getStartdate() {
		return startdate;
	}

	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}

	public Date getFinishdate() {
		return finishdate;
	}

	public void setFinishdate(Date finishdate) {
		this.finishdate = finishdate;
	}

	public String getGradename() {
		return gradename;
	}

	public void setGradename(String gradename) {
		this.gradename = gradename;
	}

	public String getIdcard() {
		return idcard;
	}

	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}

	public String getResearchname() {
		return researchname;
	}

	public void setResearchname(String researchname) {
		this.researchname = researchname;
	}

	
}
