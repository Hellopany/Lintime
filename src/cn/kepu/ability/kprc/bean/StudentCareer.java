package cn.kepu.ability.kprc.bean;

import java.util.Date;

import cn.kepu.ability.utils.ApplicationUtils;

public class StudentCareer implements java.io.Serializable {
	 private Integer id;
	 private Integer studentid;
     private String corporationname;
     private String address;
	 private String careertype;
	 private String othername;
	 private String unittype;
	 private String unittypename;
	 private String careertypename;
     private Date startdate;
     private Date finishdate;
     private String idcard;

     
     public StudentCareer() {
    	}

	public StudentCareer(Integer id, Integer studentid, String corporationname,
			String address, String careertype, String unittype,Date startdate) {
		super();
		this.id = id;
		this.studentid = studentid;
		this.corporationname = corporationname;
		this.address = address;
		this.careertype = careertype;
		this.unittype = unittype;
		this.startdate = startdate;
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

	public String getCorporationname() {
		return corporationname;
	}

	public void setCorporationname(String corporationname) {
		this.corporationname = corporationname;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCareertype() {
		return careertype;
	}

	public void setCareertype(String careertype) {
		this.careertype = careertype;
	}

	public Date getStartdate() {
		return startdate;
	}

	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}

	public String getCareertypename() {
		return careertypename;
	}

	public void setCareertypename(String careertypename) {
		this.careertypename = careertypename;
	}

	public Date getFinishdate() {
		return finishdate;
	}

	public void setFinishdate(Date finishdate) {
		this.finishdate = finishdate;
	}

	public String getIdcard() {
		return idcard;
	}

	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}

	public String getUnittype() {
		
		return unittype;
	}

	public void setUnittype(String unittype) {
		this.unittype = unittype;
	}

	public String getOthername() {
		return othername;
	}

	public void setOthername(String othername) {
		this.othername = othername;
	}

	public String getUnittypename() {
		if (unittype==null||unittype.equals("")) return "";
		return ApplicationUtils.getWorkUnitCategory().get(unittype);
	}

	public void setUnittypename(String unittypename) {
		this.unittypename = unittypename;
	}
     
}
