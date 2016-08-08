package cn.kepu.ability.utils;
import java.util.ArrayList;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import cn.kepu.ability.common.email.Mail;
import cn.kepu.ability.common.email.MailSender;
import cn.kepu.utils.PropertyConfigureUtils;
import cn.kepu.utils.StringUtils;


/**
 * 邮件发送模板配置
 *
 */
public class MailUtils {
	private static final Log log = LogFactory.getLog(MailUtils.class);
	public static boolean sendMail(ArrayList<String> emailAddress,
			String subject, String content) {
		if (emailAddress != null) {
			String address = null;
			for (String email : emailAddress)
				address += email + "; ";
			if (StringUtils.isEmpty(subject) || StringUtils.isEmpty(content)
					|| (emailAddress.size() == 0))
				return false;
			Mail mail = new Mail();
			mail.setName(PropertyConfigureUtils.getString("system.email.name"));
			mail.setFrom(PropertyConfigureUtils
					.getString("system.email.account"));
			mail.setTo(emailAddress.toArray(new String[0]));
			mail.setSubject(subject);
			mail.setContent(content);
			MailSender sender = new MailSender(PropertyConfigureUtils
					.getString("system.email.mailhost"), PropertyConfigureUtils
					.getString("system.email.account"), PropertyConfigureUtils
					.getString("system.email.password"));
			try {
				sender.send(mail);
				return true;
			} catch (Exception e) {
				log.error("向 " + address + " 发送邮件失败！", e);
			}
		}
		return false;
	}
	public static boolean sendMail(String emailAddress, String subject,
			String content) {
		ArrayList<String> address = new ArrayList<String>();
		address.add(emailAddress);
		return sendMail(address, subject, content);
	}
	public static boolean sendMail(ArrayList<String> emailAddress,
			String subject, String content, boolean isSeperate) {
		if (isSeperate) {
			if (emailAddress != null) {
				for (String address : emailAddress) {
					sendMail(address, subject, content);
				}
				return true;
			}
			return false;
		} else {
			return sendMail(emailAddress, subject, content);
		}
	}
}
