package cn.kepu.ability.common.bean;

import java.util.Date;


public class TransMessage implements java.io.Serializable {
	 private Integer id;
     private Integer sender;
     private String sendertype; //为应聘查看学生用
     private String sendername;
	 private String title;
     private String content;
     private String receivers;
     private String receiversnames;
     private Date senddate;
     private String isshortmessage;
     
     public TransMessage() {
    	}


	public TransMessage(Integer id, Integer sender, String title,
			String content, String receivers, Date senddate) {
		super();
		this.id = id;
		this.sender = sender;
		this.title = title;
		this.content = content;
		this.receivers = receivers;
		this.senddate = senddate;
	}


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public Integer getSender() {
		return sender;
	}


	public void setSender(Integer sender) {
		this.sender = sender;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getReceivers() {
		return receivers;
	}


	public void setReceivers(String receivers) {
		this.receivers = receivers;
	}


	public Date getSenddate() {
		return senddate;
	}


	public void setSenddate(Date senddate) {
		this.senddate = senddate;
	}
	
	public String getSendername() {
		return sendername;
	}

	public void setSendername(String sendername) {
		this.sendername = sendername;
	}


	public String getReceiversnames() {
		return receiversnames;
	}


	public void setReceiversnames(String receiversnames) {
		this.receiversnames = receiversnames;
	}


	public String getIsshortmessage() {
		return isshortmessage;
	}


	public void setIsshortmessage(String isshortmessage) {
		this.isshortmessage = isshortmessage;
	}


	public String getSendertype() {
		return sendertype;
	}


	public void setSendertype(String sendertype) {
		this.sendertype = sendertype;
	}
}
