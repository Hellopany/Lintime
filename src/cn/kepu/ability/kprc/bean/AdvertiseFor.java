package cn.kepu.ability.kprc.bean;

import java.util.Date;

public class AdvertiseFor implements java.io.Serializable {
	 private Integer id;
	 private Integer memberid;
	 private String membername;
     private String post;
     private String describe;
	 private String content;
     private Date publishdate;
     private String requeire;
     private String status;
     private String statusname;
     private String remark;
     
     public AdvertiseFor() {
    	}
     public AdvertiseFor(Integer id, Integer memberid, String post,
 			String describe, String content, Date publishdate, String requeire,String remark) {
 		this.id = id;
 		this.memberid = memberid;
 		this.post = post;
 		this.describe = describe;
 		this.content = content;
 		this.publishdate = publishdate;
 		this.requeire = requeire;
 		this.remark = remark;
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
	public String getDescribe() {
		return describe;
	}
	public void setDescribe(String describe) {
		this.describe = describe;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getPublishdate() {
		return publishdate;
	}
	public void setPublishdate(Date publishdate) {
		this.publishdate = publishdate;
	}
	public String getRequeire() {
		return requeire;
	}
	public void setRequeire(String requeire) {
		this.requeire = requeire;
	}
	public String getMembername() {
		return membername;
	}
	public void setMembername(String membername) {
		this.membername = membername;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getStatusname() {
		return statusname;
	}
	public void setStatusname(String statusname) {
		this.statusname = statusname;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
     
}
