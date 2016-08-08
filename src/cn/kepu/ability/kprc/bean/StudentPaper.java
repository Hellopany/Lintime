package cn.kepu.ability.kprc.bean;

import java.util.Date;

public class StudentPaper implements java.io.Serializable {
	 private Integer id;
	 private Integer studentid;
     private String name;
     private String work;
	 private String teacher;
     private String type;
     private String typename;
     private String quanlity;
     private String quanlityname;
     private String resume;
     private String idcard;
     
     public StudentPaper() {
    	}

	public StudentPaper(Integer id, Integer studentid, String name,
			String work, String teacher, String type, String quanlity,
			String resume) {
		super();
		this.id = id;
		this.studentid = studentid;
		this.name = name;
		this.work = work;
		this.teacher = teacher;
		this.type = type;
		this.quanlity = quanlity;
		this.resume = resume;
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

	public String getQuanlity() {
		return quanlity;
	}

	public void setQuanlity(String quanlity) {
		this.quanlity = quanlity;
	}

	public String getResume() {
		return resume;
	}

	public void setResume(String resume) {
		this.resume = resume;
	}

	public String getTypename() {
		return typename;
	}

	public void setTypename(String typename) {
		this.typename = typename;
	}

	public String getQuanlityname() {
		return quanlityname;
	}

	public void setQuanlityname(String quanlityname) {
		this.quanlityname = quanlityname;
	}

	public String getIdcard() {
		return idcard;
	}

	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}

}
