package cn.kepu.ability.common.shortmessage;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.expression.spel.ast.OperatorInstanceof;

import cn.kepu.utils.PropertyConfigureUtils;

public class ShortMessage {

	private static String account = PropertyConfigureUtils.getString("system.message.server.account");
    private static String password = PropertyConfigureUtils.getString("system.message.server.password");
    private static String active = PropertyConfigureUtils.getString("system.message.server.active");

	public void sendMessage(){
		
		SmsOperatorImpService soi = new SmsOperatorImpService();
	    //port 28080
		ISmsOperator operator =  soi.getSmsOperatorImpPort();

		MtMessage mt = new MtMessage();
		
		String[] numbers = {"15010189659"};
		mt.setPhoneNumber(numbers);
		mt.setSubCode("9410260001");
		String content = "";
		for(int i=0;i<30;i++){
			content +="我的高级人测试信息吉安帕" ;
		}
		content += " http://192.168.1.100:90/seniorpersonnel/upload/20160509/091302_30.doc";
		mt.setContent(content);
		//mt.setContent("我的高级人测试信息 ");
		MtMessageRes res= operator.sendSms("cx_duiwai", "c528c51fec156aab32b17c7db363438a", "02", mt);
		System.out.println(res);
		System.out.println(res.subStat);
		System.out.println(res.subStatDes);
		
	}
	public static boolean send(String content,String[] phonenumbers){
			
		    if(active.equals("N")) return false;
		    if (account==null||account.equals("")||password==null||password.equals("")) return false;

			SmsOperatorImpService soi = new SmsOperatorImpService();
		    //port 28080
			ISmsOperator operator =  soi.getSmsOperatorImpPort();
	
			MtMessage mt = new MtMessage();
			
			mt.setPhoneNumber(phonenumbers);
			mt.setSubCode("9410260001");
			mt.setContent(content);
			MtMessageRes res= operator.sendSms(account, password, "02", mt);

            if (res.getSubStat().equals("r:000")) return true;
            
            return false;
	}
	public static void main(String[] args){
		ShortMessage sm = new ShortMessage();
		sm.sendMessage();

//		System.out.print(DigestUtils.md5Hex("cx_duiwai2015"));
   }
}
