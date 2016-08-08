package cn.kepu.ability.kprc.bean;

import java.util.Date;

import cn.kepu.ability.utils.ApplicationUtils;
import cn.kepu.utils.StringUtils;

public class Statics implements java.io.Serializable {
	 /**
	 * 
	 */
	private static final long serialVersionUID = -8514475261595698125L;
	 
	 private Integer id;
     private String name;
     private String gender;
	 private String idcard;
     private String politics;
     private String nation;
     private Integer schoolid;
     private String schoolname;
     private String professional;
     private Date joindate;
     private String praticeunit;
     private boolean iswork;
     private String worktype;
     private String worked;
     private String worktypename;
     
     private Integer graduatecount;
     private Integer workcount;
     private Integer notworkcount;
     private Integer kpcount;
     
     public Statics() {
    	}

 	public Statics(Integer id, String name, String gender, String idcard,
 			String politics, String nation, Integer schoolid,
 			String schoolname, String professional, Date joindate,
 			String praticeunit, boolean iswork, String worktype,
 			String worktypename) {
 		super();
 		this.id = id;
 		this.name = name;
 		this.gender = gender;
 		this.idcard = idcard;
 		this.politics = politics;
 		this.nation = nation;
 		this.schoolid = schoolid;
 		this.schoolname = schoolname;
 		this.professional = professional;
 		this.joindate = joindate;
 		this.praticeunit = praticeunit;
 		this.iswork = iswork;
 		this.worktype = worktype;
 		this.worktypename = worktypename;
 	}

	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getIdcard() {
		return idcard;
	}


	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}


	public String getPolitics() {
		return politics;
	}


	public void setPolitics(String politics) {
		this.politics = politics;
	}


	public String getNation() {
		return nation;
	}


	public void setNation(String nation) {
		this.nation = nation;
	}


	public Integer getSchoolid() {
		return schoolid;
	}


	public void setSchoolid(Integer schoolid) {
		this.schoolid = schoolid;
	}


	public String getSchoolname() {
		return schoolname;
	}


	public void setSchoolname(String schoolname) {
		this.schoolname = schoolname;
	}


	public String getProfessional() {
		return professional;
	}


	public void setProfessional(String professional) {
		this.professional = professional;
	}


	public Date getJoindate() {
		return joindate;
	}


	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}


	public String getPraticeunit() {
		return praticeunit;
	}


	public void setPraticeunit(String praticeunit) {
		this.praticeunit = praticeunit;
	}


	public boolean isIswork() {
		return iswork;
	}


	public void setIswork(boolean iswork) {
		this.iswork = iswork;
	}


	public String getWorktype() {
		return worktype;
	}


	public void setWorktype(String worktype) {
		this.worktype = worktype;
	}


	public String getWorktypename() {
		return worktypename;
	}


	public void setWorktypename(String worktypename) {
		this.worktypename = worktypename;
	}

	public String getWorked() {
		return worked;
	}

	public void setWorked(String worked) {
		this.worked = worked;
	}

	public Integer getGraduatecount() {
		return graduatecount;
	}

	public void setGraduatecount(Integer graduatecount) {
		this.graduatecount = graduatecount;
	}

	public Integer getWorkcount() {
		return workcount;
	}

	public void setWorkcount(Integer workcount) {
		this.workcount = workcount;
	}

	public Integer getNotworkcount() {
		return notworkcount;
	}

	public void setNotworkcount(Integer notworkcount) {
		this.notworkcount = notworkcount;
	}

	public Integer getKpcount() {
		return kpcount;
	}

	public void setKpcount(Integer kpcount) {
		this.kpcount = kpcount;
	}


}
