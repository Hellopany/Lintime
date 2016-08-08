package cn.kepu.ability.kprc.bean;

import java.util.Date;

import cn.kepu.ability.utils.ApplicationUtils;
import cn.kepu.utils.StringUtils;

public class Student implements java.io.Serializable {
	 /**
	 * 
	 */
	private static final long serialVersionUID = -8514475261595698125L;
	 
	
	 private Integer id;
     private String name;
     private Integer age;
     private String gender;
	 private String idcard;
     private Date birthday;
     private String birthaddress;
     private String politics;
     private String originaddress;
     private String nation;
     private String residencyaddress;
     private Integer schoolid;
     
     private String status;
     private Integer newid;
     
     public Student() {
    	}

	public Student(Integer id, String name, String gender, String idcard,
			Date birthday, String birthaddress, String politics,
			String originaddress, String nation, String residencyaddress) {
		super();
		this.id = id;
		this.name = name;
		this.gender = gender;
		this.idcard = idcard;
		this.birthday = birthday;
		this.birthaddress = birthaddress;
		this.politics = politics;
		this.originaddress = originaddress;
		this.nation = nation;
		this.residencyaddress = residencyaddress;
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

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getBirthaddress() {
		return birthaddress;
	}

	public void setBirthaddress(String birthaddress) {
		this.birthaddress = birthaddress;
	}

	public String getPolitics() {
		return politics;
	}

	public void setPolitics(String politics) {
		this.politics = politics;
	}

	public String getOriginaddress() {
		return originaddress;
	}

	public void setOriginaddress(String originaddress) {
		this.originaddress = originaddress;
	}

	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public String getResidencyaddress() {
		return residencyaddress;
	}

	public void setResidencyaddress(String residencyaddress) {
		this.residencyaddress = residencyaddress;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}
	public String getPoliticsStr() {
		if(StringUtils.isEmpty(this.politics)) return "";
		return ApplicationUtils.getPoliticsCategory().get(this.politics);
	}
	public Integer getSchoolid() {
		return schoolid;
	}

	public void setSchoolid(Integer schoolid) {
		this.schoolid = schoolid;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Integer getNewid() {
		return newid;
	}

	public void setNewid(Integer newid) {
		this.newid = newid;
	}

	
     
}
