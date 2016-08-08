package cn.kepu.ability.kprc.bean;


public class Tcu implements java.io.Serializable {
   private Integer id;
   private String company;
   private String name;
   private String post;
   private String tel;
   private String email;
   private Integer isfinishcheck;
public Integer getIsfinishcheck() {
	return isfinishcheck;
}
public void setIsfinishcheck(Integer isfinishcheck) {
	this.isfinishcheck = isfinishcheck;
}
public Tcu(){
	   
   }
   public Tcu(Integer id){
	   this.id=id;
   }
   public Tcu(Integer id,Integer isfinishcheck,String company,String name,String post,String tel,String email){
	   this.id=id;
	   this.company=company;
	   this.name=name;
	   this.email=email;
	   this.post=post;
	   this.tel=tel;
	   this.isfinishcheck=isfinishcheck;
	  
   }
public Integer getId() {
	return id;
}
public void setId(Integer id) {
	this.id = id;
}
public String getCompany() {
	return company;
}
public void setCompany(String company) {
	this.company = company;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getPost() {
	return post;
}
public void setPost(String post) {
	this.post = post;
}
public String getTel() {
	return tel;
}
public void setTel(String tel) {
	this.tel = tel;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
   
}
