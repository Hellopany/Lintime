/**
 * 基于 javamail建立的邮件发送公共程序
 * 另外使用了org.apache.log4j(单独log4j包), javax.activation(包含在j2se中)
 * version 1.0 by hhb,2011-11
 */
package cn.kepu.ability.common.email;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;
import org.apache.log4j.Logger;
public class MailSender {
	public static Logger logger = Logger.getLogger(MailSender.class);
	private Session session;
	private String mailhost;
	private String username;
	private String userpass;
	public MailSender(String mailhost, String username, String userpass) {
		this.mailhost = mailhost;
		this.username = username;
		this.userpass = userpass;
		Properties props = new Properties();
		// props.setProperty("mail.smtp.auth", "true");
		// 设置邮件服务器地址，连接超时时限等信息
		props.put("mail.smtp.host", mailhost);
		props.put("mail.smtp.connectiontimeout", "10000");
		props.put("mail.smtp.timeout", "10000");
		props.put("mail.smtp.auth", "true");
		// 创建缺省的session对象
		session = Session.getDefaultInstance(props, null);
		session.setDebug(true);
	}
	public boolean send(Mail mail) throws Exception {
		try {
			// 创建message对象
			MimeMessage mimemessage = new MimeMessage(session);
			// mimemessage.setFrom(new InternetAddress(mail.getFrom()));
			// 设置邮件发送时间
			try {
				// mimemessage.setSentDate(new java.util.Date());
				mimemessage.setSentDate(mail.getDate());
			} catch (Exception ex) {
			}
			// 设置发件人和收件人
			if (mail.getName() != null && !"".equals(mail.getName().trim())) {
				mimemessage.setFrom(new InternetAddress(mail.getFrom(), mail
						.getName()));
			} else {
				mimemessage.setFrom(new InternetAddress(mail.getFrom()));
			}
			mimemessage.setSentDate(mail.getDate());
			String[] recipients = mail.getTo();
			InternetAddress[] addressTo = new InternetAddress[recipients.length];
			for (int i = 0; i < recipients.length; i++) {
				addressTo[i] = new InternetAddress(recipients[i]);
			}
			try {
				mimemessage.setRecipients(javax.mail.Message.RecipientType.TO,
						addressTo);
			} catch (Exception exception1) {
				throw exception1;
			}
			String[] cc = mail.getCc();
			InternetAddress[] addressCc = null;
			if (cc != null) {
				addressCc = new InternetAddress[cc.length];
				for (int i = 0; i < cc.length; i++) {
					addressCc[i] = new InternetAddress(cc[i]);
				}
			}
			// 设置邮件标题，中文编码
			// String subject = MimeUtility.encodeText(new
			// String(mail.getSubject().getBytes(), "GB2312"), "GB2312", "B");
			String subject = MimeUtility.encodeText(mail.getSubject());
			mimemessage.setSubject(subject);
			// 设置邮件内容
			MimeBodyPart mimebodypart = new MimeBodyPart();
			// mimebodypart.setText(mail.getContent());
			mimebodypart.setContent(mail.getContent(),
					"text/html; charset=utf-8");
			// attach message BODY
			MimeMultipart mimemultipart = new MimeMultipart();
			mimemultipart.addBodyPart(mimebodypart);
			// attach FILE
			ArrayList<DataSource> attachedFileList = mail.getAttachedFileList();
			if (attachedFileList != null) {
				DataSource ds = null;
				;
				for (Iterator<DataSource> e = attachedFileList.iterator(); e
						.hasNext();) {
					ds = e.next();
					mimebodypart = new MimeBodyPart();
					try {
						mimebodypart.setDataHandler(new DataHandler(ds));
					} catch (Exception exception3) {
						throw exception3;
					}
					mimebodypart.setFileName("=?GB2312?B?"
							+ MimeUtility.encodeText(ds.getName()) + "?=");
					mimemultipart.addBodyPart(mimebodypart);
				}
			}
			// 将Multipart加入到信件
			mimemessage.setContent(mimemultipart);
			// set CC MAIL and SEND the mail
			if (addressTo != null && addressTo.length > 0) {
				// set CC MAIL
				if (addressCc != null && addressCc.length > 0)
					mimemessage.setRecipients(
							javax.mail.Message.RecipientType.CC, addressCc);
				mimemessage.saveChanges();
				try {
					// 调用抽send()发送邮件
					Transport transport = session.getTransport("smtp");
					transport.connect(mailhost, username, userpass);
					// transport.send(mimemessage);
					transport.sendMessage(mimemessage, addressTo);
					transport.close();
					logger.info(" Sent Successfully..........");
				} catch (Exception exception4) {
					throw exception4;
				}
			} else {
				logger.info(" Mail operation Failed..........");
			}
		} catch (Exception e) {
			throw e;
		}
		return true;
	}
}
