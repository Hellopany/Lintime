package cn.kepu.ability.kprc.bean;

import java.util.Date;

public class StudentRelation implements java.io.Serializable {
	 private Integer id;
	 private Integer studentid;
     private String address;
     private String zipcode;
	 private String email;
     private String homeaddress;
     private String phone;
     private String temporaryaddress;
     private String idcard;
     
     public StudentRelation() {
    	}

	public StudentRelation(Integer id, Integer studentid, String address,
			String zipcode, String email, String homeaddress, String phone,
			String temporaryaddress) {
		super();
		this.id = id;
		this.studentid = studentid;
		this.address = address;
		this.zipcode = zipcode;
		this.email = email;
		this.homeaddress = homeaddress;
		this.phone = phone;
		this.temporaryaddress = temporaryaddress;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getHomeaddress() {
		return homeaddress;
	}

	public void setHomeaddress(String homeaddress) {
		this.homeaddress = homeaddress;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getTemporaryaddress() {
		return temporaryaddress;
	}

	public void setTemporaryaddress(String temporaryaddress) {
		this.temporaryaddress = temporaryaddress;
	}

	public String getIdcard() {
		return idcard;
	}

	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}

	
}
