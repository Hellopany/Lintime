package cn.kepu.ability.kprc.bean;

import java.util.Date;

public class StudentEducation implements java.io.Serializable {
	 private Integer id;
	 private Integer studentid;
     private String schoolname;
     private String professional;
	 private String honor;
	 private String reportproject;
     private Date startdate;
     private Date finishdate;
     private String idcard;
     
     public StudentEducation() {
    	}

	public StudentEducation(Integer id, Integer studentid, 
			String professional, String honor, String reportproject,
			Date startdate, Date finishdate) {
		super();
		this.id = id;
		this.studentid = studentid;
		this.professional = professional;
		this.honor = honor;
		this.reportproject = reportproject;
		this.startdate = startdate;
		this.finishdate = finishdate;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getStudentid() {
		return studentid;
	}

	public void setStudentid(Integer studentid) {
		this.studentid = studentid;
	}

	public String getProfessional() {
		return professional;
	}

	public void setProfessional(String professional) {
		this.professional = professional;
	}

	public String getHonor() {
		return honor;
	}

	public void setHonor(String honor) {
		this.honor = honor;
	}

	public String getReportproject() {
		return reportproject;
	}

	public void setReportproject(String reportproject) {
		this.reportproject = reportproject;
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

	public String getSchoolname() {
		return schoolname;
	}

	public void setSchoolname(String schoolname) {
		this.schoolname = schoolname;
	}

	public String getIdcard() {
		return idcard;
	}

	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}

	
     
}
