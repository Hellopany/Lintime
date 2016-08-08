package cn.kepu.ability.common.bean;

import java.io.Serializable;
import java.util.Date;

public class Changepas implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1133187070562971534L;
	private int id;
	private int uid;
	private String code;
	private Date createtime;
	private String status;
	
	public Changepas(){
		
	}
	
	public Changepas(int uid,String code,Date createtime,String status){
		this.uid = uid;
		this.code = code;
		this.createtime = createtime;
		this.status = status;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
