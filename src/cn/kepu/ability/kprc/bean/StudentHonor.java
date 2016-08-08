package cn.kepu.ability.kprc.bean;

import java.util.Date;

public class StudentHonor implements java.io.Serializable {
	 private Integer id;
	 private Integer studentid;
     private String name;
     private String grade;
     private String gradename;
     private Date honordate;
     private String idcard;
     
     public StudentHonor() {
    	}

	public StudentHonor(Integer id, Integer studentid, String name,
			String grade, Date honordate) {
		super();
		this.id = id;
		this.studentid = studentid;
		this.name = name;
		this.grade = grade;
		this.honordate = honordate;
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

	public Date getHonordate() {
		return honordate;
	}

	public void setHonordate(Date honordate) {
		this.honordate = honordate;
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
     
	
}
