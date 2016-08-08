package cn.kepu.ability.utils;

import java.io.BufferedWriter;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import cn.kepu.ability.common.Constants;
import cn.kepu.utils.PropertyConfigureUtils;
import cn.kepu.utils.StringUtils;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

public class ExportDocUtils {
	private static Configuration configuration = new Configuration(); 
    public ExportDocUtils(){  
    	configuration.setDefaultEncoding("UTF-8"); 
    }  
      
	public static  String exportWord(String template_name,Map<String,Object> dataMap,HttpServletRequest req, HttpServletResponse resp) throws IOException{  
    	req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/x-download");
        
        if (dataMap.size()==0) return null;
        Template t=null;  
        try {  
        	
        	configuration.setDefaultEncoding("UTF-8");
       	
             //configuration.setServletContextForTemplateLoading(req.getSession().getServletContext(), "/WEB-INF/template");
            configuration.setDirectoryForTemplateLoading(new File(PropertyConfigureUtils.getString("real_path")+"template"));
             t = configuration.getTemplate(template_name,"UTF-8");
             
             Date date1 = new Date();
  	         String name = "pdinfo"+String.valueOf(new SimpleDateFormat("yyyy-MM-dd").format(date1))+".doc";
             ((HttpServletResponse) resp).addHeader("Content-Disposition", "attachment;filename="+ name);
             
             OutputStream outs = resp.getOutputStream();
             Writer out= new BufferedWriter(new OutputStreamWriter(outs, "UTF-8"));
             t.process(dataMap, out);  
             out.close();
             return name;
        } catch (TemplateException e) {  
            e.printStackTrace();  
        } catch (IOException e) {  
            e.printStackTrace();  
        }  
        return null;
    }
	
	
	public static float getFloatDec(float value){

		BigDecimal aa = new BigDecimal(value); 
		float f1 = aa.setScale(2, BigDecimal.ROUND_HALF_UP).floatValue(); 
		return f1;
	} 
	
	public static String formatWordText(String text) {
		text = text.replaceAll("&", "&amp;")
					.replaceAll("\"", "&quot;")
					.replaceAll("<", "&lt;")
					.replaceAll(">", "&gt;");
		String[] tempTexts = text.split("\r\n");
		StringBuffer sb = new StringBuffer();
		for(int i = 0; i < tempTexts.length; i++) {
			sb.append(tempTexts[i].trim());
			if(i != tempTexts.length-1)
				sb.append(Constants.PD_LINE_BREAK);
		}
		return sb.toString();
	}
	
	public static String DateFormat(Date date){
		SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
		return dateformat.format(date);
	}
	
}
