package cn.kepu.ability.kprc.bean;

import java.util.Date;

public class StudentSchoolRoll implements java.io.Serializable {
	 private Integer id;
	 private Integer studentid;
     private String jointype;
     private String jointypename;
     private String classno;
	 private String grade;
	 private String classin;
     private Date joindate;
     private Date freedate;
     private Integer school;
     private String schoolname;
     private String professional;
     private String idcard;
     private String year;
     
     public StudentSchoolRoll() {
    	}

	public StudentSchoolRoll(Integer id, Integer studentid, String jointype,
			String classno, String grade, String classin, Date joindate,
			Integer school, String professional) {
		super();
		this.id = id;
		this.studentid = studentid;
		this.jointype = jointype;
		this.classno = classno;
		this.grade = grade;
		this.classin = classin;
		this.joindate = joindate;
		this.school = school;
		this.professional = professional;
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

	public String getJointype() {
		return jointype;
	}

	public void setJointype(String jointype) {
		this.jointype = jointype;
	}

	public String getClassno() {
		return classno;
	}

	public void setClassno(String classno) {
		this.classno = classno;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getClassin() {
		return classin;
	}

	public void setClassin(String classin) {
		this.classin = classin;
	}

	public Date getJoindate() {
		return joindate;
	}

	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}

	public Date getFreedate() {
		return freedate;
	}

	public void setFreedate(Date freedate) {
		this.freedate = freedate;
	}

	public Integer getSchool() {
		return school;
	}

	public void setSchool(Integer school) {
		this.school = school;
	}

	public String getProfessional() {
		return professional;
	}

	public void setProfessional(String professional) {
		this.professional = professional;
	}

	public String getSchoolname() {
		return schoolname;
	}

	public void setSchoolname(String schoolname) {
		this.schoolname = schoolname;
	}

	public String getJointypename() {
		return jointypename;
	}

	public void setJointypename(String jointypename) {
		this.jointypename = jointypename;
	}

	public String getIdcard() {
		return idcard;
	}

	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	
}
