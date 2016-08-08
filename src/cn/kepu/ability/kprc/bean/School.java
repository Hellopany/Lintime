package cn.kepu.ability.kprc.bean;


public class School implements java.io.Serializable {
	 private Integer id;
     private String name;
     private String describe;
	 private String telphone;
     private String address;
     private String relationuser;
     private Integer isfinishcheck;
     
     public School() {
    	}

	public School(Integer id, String name, String describe, String telphone,
			String address, String relationuser) {
		super();
		this.id = id;
		this.name = name;
		this.describe = describe;
		this.telphone = telphone;
		this.address = address;
		this.relationuser = relationuser;
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

	public String getDescribe() {
		return describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}

	public String getTelphone() {
		return telphone;
	}

	public void setTelphone(String telphone) {
		this.telphone = telphone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getRelationuser() {
		return relationuser;
	}

	public void setRelationuser(String relationuser) {
		this.relationuser = relationuser;
	}

	public Integer getIsfinishcheck() {
		return isfinishcheck;
	}

	public void setIsfinishcheck(Integer isfinishcheck) {
		this.isfinishcheck = isfinishcheck;
	}
     
}
