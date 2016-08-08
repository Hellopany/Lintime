package cn.kepu.ability.kprc.bean;

import java.util.Date;

public class AdvertiseForApply implements java.io.Serializable {
	 private Integer id;
	 private Integer memberid;
     private String post;
     private String resume;
     private Date applydate;
     
     public AdvertiseForApply() {
    	}
     public AdvertiseForApply(Integer id, Integer memberid, String post,
 			String resume, Date applydate) {
 		this.id = id;
 		this.memberid = memberid;
 		this.post = post;
 		this.resume = resume;
 		this.applydate = applydate;
 	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getMemberid() {
		return memberid;
	}
	public void setMemberid(Integer memberid) {
		this.memberid = memberid;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getResume() {
		return resume;
	}
	public void setResume(String resume) {
		this.resume = resume;
	}
	public Date getApplydate() {
		return applydate;
	}
	public void setApplydate(Date applydate) {
		this.applydate = applydate;
	}
     
}
