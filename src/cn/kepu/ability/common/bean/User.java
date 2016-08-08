package cn.kepu.ability.common.bean;

import java.util.Date;

import cn.kepu.ability.utils.ApplicationUtils;

/**
 * TUser entity. @author MyEclipse Persistence Tools
 */

public class User implements java.io.Serializable, Cloneable {

	private static final long serialVersionUID = -2222996456190071652L;

	// Fields
	private int id;
	private String name;
	private String password;
	private String username;
	private String email;
	private Date createdate;
	private String mobile;

	//标识用户类型
	private String usertype;
	
	// Constructors

	/** default constructor */
	public User() {
	}



	// Property accessors

	public User(int id, String name, String password, String username,
			String email, Date createdate) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.username = username;
		this.email = email;
		this.createdate = createdate;
	}



	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Date getCreatedate() {
		return createdate;
	}

	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}

	public String getUsertype() {
		return usertype;
	}

	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}



	public String getMobile() {
		return mobile;
	}



	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

}