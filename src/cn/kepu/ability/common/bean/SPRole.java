package cn.kepu.ability.common.bean;


public class SPRole implements java.io.Serializable {
	 private Integer id;
     private String name;
     private String describe;

     
     public SPRole() {
    	}


	public SPRole(Integer id, String name, String describe) {
		super();
		this.id = id;
		this.name = name;
		this.describe = describe;
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
    
}
