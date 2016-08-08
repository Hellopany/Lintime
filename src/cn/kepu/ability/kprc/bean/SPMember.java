package cn.kepu.ability.kprc.bean;

import java.util.Date;

public class SPMember implements java.io.Serializable {
	 private Integer id;
     private String name;
     private String username;
	 private String password;
	 private String gender;
	 private String email;
	 private String telphone;
	 private String mobile;
	 private String roletype;
	 private Integer isfinishcheck;
	 private Integer islocked;
     private Date createdate;
     private Date logindate;
     private String loginip;
     private Integer belongto;
     private Integer ismanagercreate;
     
     public SPMember() {
    	}

	public SPMember(Integer id, String name, String username, String password,
			String gender, String email, String telphone, String mobile,
			String roletype, Integer isfinishcheck, Integer islocked,
			Date createdate, Date logindate, String loginip,Integer belongto) {
		super();
		this.id = id;
		this.name = name;
		this.username = username;
		this.password = password;
		this.gender = gender;
		this.email = email;
		this.telphone = telphone;
		this.mobile = mobile;
		this.roletype = roletype;
		this.isfinishcheck = isfinishcheck;
		this.islocked = islocked;
		this.createdate = createdate;
		this.logindate = logindate;
		this.loginip = loginip;
		this.belongto = belongto;
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

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelphone() {
		return telphone;
	}

	public void setTelphone(String telphone) {
		this.telphone = telphone;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getRoletype() {
		return roletype;
	}

	public void setRoletype(String roletype) {
		this.roletype = roletype;
	}

	public Integer getIsfinishcheck() {
		return isfinishcheck;
	}

	public void setIsfinishcheck(Integer isfinishcheck) {
		this.isfinishcheck = isfinishcheck;
	}

	public Integer getIslocked() {
		return islocked;
	}

	public void setIslocked(Integer islocked) {
		this.islocked = islocked;
	}

	public Date getCreatedate() {
		return createdate;
	}

	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}

	public Date getLogindate() {
		return logindate;
	}

	public void setLogindate(Date logindate) {
		this.logindate = logindate;
	}

	public String getLoginip() {
		return loginip;
	}

	public void setLoginip(String loginip) {
		this.loginip = loginip;
	}

	public Integer getBelongto() {
		return belongto;
	}

	public void setBelongto(Integer belongto) {
		this.belongto = belongto;
	}

	public Integer getIsmanagercreate() {
		return ismanagercreate;
	}

	public void setIsmanagercreate(Integer ismanagercreate) {
		this.ismanagercreate = ismanagercreate;
	}
    
}
