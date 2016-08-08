package cn.kepu.ability.kprc.bean;

import java.util.Date;

public class StudentPractice implements java.io.Serializable {
	 private Integer id;
	 private Integer studentid;
     private String corporation;
     private String work;
     private String teacher;
	 private String type;
	 private String typename;
     private Date startdate;
     private Date finishdate;
     private String idcard;
     
     public StudentPractice() {
    	}

	public StudentPractice(Integer id, Integer studentid, String corporation,
			String work, String teacher, String type, Date startdate,
			Date finishdate) {
		super();
		this.id = id;
		this.studentid = studentid;
		this.corporation = corporation;
		this.work = work;
		this.teacher = teacher;
		this.type = type;
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

	public String getCorporation() {
		return corporation;
	}

	public void setCorporation(String corporation) {
		this.corporation = corporation;
	}

	public String getWork() {
		return work;
	}

	public void setWork(String work) {
		this.work = work;
	}

	public String getTeacher() {
		return teacher;
	}

	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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

	public String getIdcard() {
		return idcard;
	}

	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}

	
}
