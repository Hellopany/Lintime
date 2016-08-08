package cn.kepu.ability.kprc.bean;

import java.util.Date;

public class StudentResearch implements java.io.Serializable {
	 private Integer id;
	 private Integer studentid;
     private String type;
     private String typename;
     private String title;
	 private String grade;
	 private String gradename;
	 private String role;
	 private String rolename;
     private Date startdate;
     private Date finishdate;
     private String idcard;
     
     public StudentResearch() {
    	}

	public StudentResearch(Integer id, Integer studentid, String type,
			String title, String grade, String role, Date startdate,
			Date finishdate) {
		super();
		this.id = id;
		this.studentid = studentid;
		this.type = type;
		this.title = title;
		this.grade = grade;
		this.role = role;
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
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

	public String getTypename() {
		return typename;
	}

	public void setTypename(String typename) {
		this.typename = typename;
	}

	public String getGradename() {
		return gradename;
	}

	public void setGradename(String gradename) {
		this.gradename = gradename;
	}

	public String getRolename() {
		return rolename;
	}

	public void setRolename(String rolename) {
		this.rolename = rolename;
	}

	public String getIdcard() {
		return idcard;
	}

	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}
}
