package cn.kepu.ability.common;

/**
 * 系统常类
 * 
 * @author zhangzl
 */
public class Constants {
	
	public static final String PASSWORD_SALT = "ANf6q24";
	public static final String LAST_USER_SESS_KEY = "_last_user";
	public static final String BACK_USER_RESET_PSWORD = "123456";
	
	public static final String FILE_INITIALIZATION="I"; //初始化
	public static final String FILE_MODIFY="M"; 		//修改 未提交
	public static final String FILE_SUBMIT="S"; 		//修改 已提交
	public static final String FILE_ADOPT="A"; 		    //审批 通过
	public static final String FILE_REFUSE="R"; 		//审批 拒绝
	
	
	
	public static final String UT_ADMIN = "A";		// 系统管理
	
	// 各个子系统类型(System Type)
	public static final String ST_STUDENT ="1";// "student";
	public static final String ST_SCHOOL = "2";//"school";
	public static final String ST_ORG = "3";//"org";
	public static final String ST_TCU="4";//tcu;
	public static final String ST_ADMIN = "admin";


	// 上传文件的状态
	public static final String FILE_UPLOADING = "U";	// 文件正在上传
	public static final String FILE_UPLOADED = "N";		// 文件已经上传完成
	public static final String FILE_DELETED = "D";		// 文件删除
	public static final String FILE_REJECT = "R";		// 文件被拒绝，审核不通过
	public static final String FILE_PHOTO = "Y";		// 附件是照片

	public static final int MAX_ATTACHMENT_NUM = 50;
	

	public static final int NAV_NEWS1_NO = 0;
	public static final int NAV_NEWS2_NO = 1;
	public static final int NAV_PARTY_NO = 2;
	public static final int NAV_KEPU_NO = 3;
	public static final int NAV_PERIODICAL_NO = 4;
	public static final int NAV_ADMIN_NO = 5;
	public static final int NAV_SETTING_NO = 6;
	public static final int NAV_USERINFO_NO = 7;
	public static final int NAV_QUERY_NO = 8;
	
	public static final String PD_INFO_TEMPLATE_FTL = "pdinfo.ftl";
	public static final String PD_LINE_BREAK = "</w:t></w:r></w:p><w:p wsp:rsidR=\"00BA339B\" wsp:rsidRPr=\"00687357\" wsp:rsidRDefault=\"00976842\" wsp:rsidP=\"00EB7D8E\"><w:pPr><w:adjustRightInd w:val=\"off\"/><w:snapToGrid w:val=\"off\"/><w:spacing w:line=\"500\" w:line-rule=\"exact\"/><w:rPr><w:rFonts w:ascii=\"仿宋_GB2312\" w:fareast=\"仿宋_GB2312\"/><wx:font wx:val=\"仿宋_GB2312\"/><w:sz w:val=\"28\"/></w:rPr></w:pPr><w:r wsp:rsidRPr=\"00976842\"><w:rPr><w:rFonts w:ascii=\"仿宋_GB2312\" w:fareast=\"仿宋_GB2312\"/><wx:font wx:val=\"仿宋_GB2312\"/><w:sz w:val=\"28\"/></w:rPr><w:t>";


}
