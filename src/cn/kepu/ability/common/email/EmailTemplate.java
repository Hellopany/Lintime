package cn.kepu.ability.common.email;
/**
 * 邮件模板常量
 * 
 */
public class EmailTemplate {
	
	public static final String FORGET_PASSWORD = "<p>您好，<strong>{user_name}</strong>：</p><p>您在“高层次科普人才数据管理系统”点击了“忘记密码”按钮，故系统自动为您发送了这封邮件。</p>"
			+"<p>您可以点击以下链接修改您的密码：<a href=\"{url}\" target=\"_blank\" title=\"\">{url}</a><br/></p>"
			+"<p>如果您的邮箱禁止直接点击，您也可以复制以上链接在浏览器中打开。</p>" 
			+"<p>该链接地址当日有效，过期作废!请及时完成密码重置。如果您不需要修改密码或者您从未点击过“忘记密码”按钮，请忽略本邮件。  </p>"
			+"<p>如果您有任何疑问，请联系系统管理员。联系电话:01058813711"
			+ "</p><p><br/></p><p style=\"text-align: right;\">来自：高层次科普人才数据管理系统</p><hr/>"
			+ "<p style=\"text-align: left;\"><span style=\"color: rgb(191, 191, 191);\">如果不是您主动提交，请直接忽略本邮件。</span></p>"
			+ "<p style=\"text-align: left;\"><span style=\"color: rgb(191, 191, 191);\">本邮件为系统自动发出，请勿回复。</span></p>";

	
	public static final String SETPASS_EMAIL_TITLE = "用户密码重置-高层次科普人才数据管理系统";
	
	public static final String REGISTE_ACTIVE = "<p>您好，<strong>{user_name}</strong>：</p><p>您在“高层次科普人才数据管理系统”点击了“注册”按钮，故系统自动为您发送了这封邮件。</p>"
			+"<p>您可以点击以下链接激活您的账号：<a href=\"{url}\" target=\"_blank\" title=\"\">{url}</a><br/></p>"
			+"<p>如果您的邮箱禁止直接点击，您也可以复制以上链接在浏览器中打开。</p>" 
			+"<p>该链接地址当日有效，过期作废!请及时完成账号激活。如果您不需要注册或者您从未点击过“注册”按钮，请忽略本邮件。  </p>"
			+"<p>如果您有任何疑问，请联系系统管理员。联系电话:01058813711"
			+ "</p><p><br/></p><p style=\"text-align: right;\">来自：高层次科普人才数据管理系统</p><hr/>"
			+ "<p style=\"text-align: left;\"><span style=\"color: rgb(191, 191, 191);\">如果不是您主动提交，请直接忽略本邮件。</span></p>"
			+ "<p style=\"text-align: left;\"><span style=\"color: rgb(191, 191, 191);\">本邮件为系统自动发出，请勿回复。</span></p>";

	
	public static final String SETREGISTE_EMAIL_TITLE = "用户密码重置-高层次科普人才数据管理系统";

}
