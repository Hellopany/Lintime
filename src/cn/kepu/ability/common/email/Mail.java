package cn.kepu.ability.common.email;
import java.util.ArrayList;
import java.util.Date;
import javax.activation.DataSource;
public class Mail {
	private String name = null; // 发件人名称
	private String from = null; // 发件人
	private String to[] = null; // 收件人,可以多个
	private String subject = ""; // 邮件主题
	private String content = ""; // 邮件内容
	private String cc[] = null; // 抄送,可以多个
	private ArrayList<DataSource> attachedFileList = null; // 附件列表
	private Date date = null; // 发送时间
	public Mail() {
		// TODO Auto-generated constructor stub
	}
	public ArrayList<DataSource> getAttachedFileList() {
		return attachedFileList;
	}
	public void setAttachedFileList(ArrayList<DataSource> attachedFileList) {
		this.attachedFileList = attachedFileList;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getName() {
		return name;
	}
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String[] getTo() {
		if (to == null)
			return new String[0];
		else
			return to;
	}
	public void setTo(String[] to) {
		this.to = to;
	}
	public void setTo(String to) {
		this.to = new String[1];
		this.to[0] = to;
	}
	public Date getDate() {
		if (date == null)
			return new Date();
		else
			return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String[] getCc() {
		if (cc == null)
			return new String[0];
		else
			return cc;
	}
	public void setCc(String[] ccusers) {
		this.cc = ccusers;
	}
}
