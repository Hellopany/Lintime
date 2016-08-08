package cn.kepu.ability.utils;


import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.poi.xssf.usermodel.XSSFCell; 
import org.apache.poi.xssf.usermodel.XSSFRow; 
import org.apache.poi.xssf.usermodel.XSSFSheet; 
import org.apache.poi.xssf.usermodel.XSSFWorkbook; 

import cn.kepu.ability.kprc.bean.Student;
import cn.kepu.ability.kprc.bean.StudentCareer;
import cn.kepu.ability.kprc.bean.StudentEducation;
import cn.kepu.ability.kprc.bean.StudentHonor;
import cn.kepu.ability.kprc.bean.StudentPaper;
import cn.kepu.ability.kprc.bean.StudentPractice;
import cn.kepu.ability.kprc.bean.StudentRelation;
import cn.kepu.ability.kprc.bean.StudentResearch;
import cn.kepu.ability.kprc.bean.StudentResearchActivity;
import cn.kepu.ability.kprc.bean.StudentSchoolRoll;

/**
 * excel导入类
 * @author zy
 */
public class ImportUtils{
	
	private static final Log log = LogFactory.getLog(ImportUtils.class);
    /**
     * 导入数据
     */
	public static Map<String,List> importExcel(String filename,int schoolid) throws IOException{
		
		/*记录错误信息*/
		StringBuffer errs = new StringBuffer();
		//记录信息完善的学生信息，导入
		Map<String,List> maplist = new HashMap<String,List>();
		try {
			List<Student> studentlist = new ArrayList<Student>();
			List<StudentCareer> careerlist = new ArrayList<StudentCareer>();
			List<StudentEducation> educationlist = new ArrayList<StudentEducation>();
			List<StudentHonor> honorlist = new ArrayList<StudentHonor>();
			List<StudentPaper> paperlist = new ArrayList<StudentPaper>();
			List<StudentPractice> practicelist = new ArrayList<StudentPractice>();
			List<StudentRelation> relationlist = new ArrayList<StudentRelation>();
			List<StudentResearch> researchlist = new ArrayList<StudentResearch>();
			List<StudentResearchActivity> activitylist = new ArrayList<StudentResearchActivity>();
			List<StudentSchoolRoll> rolllist = new ArrayList<StudentSchoolRoll>();
			FileInputStream file = new FileInputStream(filename);
			//根据指定的文件输入流导入Excel从而产生Workbook对象
			//POIFSFileSystem fs = new POIFSFileSystem(file); 
			XSSFWorkbook wb = new XSSFWorkbook(file); 
			//获取Excel文档中的第一个表单
			//Workbook wbs = WorkbookFactory.create(file); 
			//XSSFSheet childSheet = wbs.getSheetAt(0);
			//遍历8张sheet
			for(int count=0;count<8;count++){
				 XSSFSheet sheet = wb.getSheetAt(count); 
				 
				 int rows = sheet.getLastRowNum();  
				 int start = 0;
				 //读取基本信息
				 if (count==0){
					 start = 3;
					 for(int j=start;j<=rows;j++) {
						try{
						//创建一个行对象
						XSSFRow row = sheet.getRow(j); 
						int cols = row.getLastCellNum();
						//把一行里的每一个字段遍历出来

						//创建一个行里的一个字段的对象，也就是获取到的一个单元格中的值
						XSSFCell cell = row.getCell(1);
						//在这里我们就可以做很多自己想做的操作了，比如往数据库中添加数据等
						if (cell.getRichStringCellValue().toString().equals("")){
							int xh = j-2;
							errs.append("序号为 "+xh+" 的学生没有填写姓名；");
							continue;
						}
						Student student =new Student();
						student.setName(cell.getRichStringCellValue().toString());
						cell = row.getCell(2);
						if (cell.getRichStringCellValue().toString().equals("男"))
						    student.setGender("M");
						else
							student.setGender("F");
						cell = row.getCell(3);
						String cardinfo = cell.getRichStringCellValue().toString();
						if (cardinfo.equals("")){
							int xh = j-2;
							errs.append("序号为 "+xh+" 的学生没有填写身份证号码；");
							continue;
						}
						//判断身份证号码是否合法
						if (!cardinfo.equals("")){
							int xh = j-2;
							if (!IdcardUtils.validateCard(cardinfo)){
								errs.append("序号为 "+xh+" 的学生填写的身份证号码不合法；");
								continue;
							}
						}
						student.setIdcard(cell.getRichStringCellValue().toString());
						cell = row.getCell(4);
						student.setNation(cell.getRichStringCellValue().toString());
						cell = row.getCell(5);
						Map<String,String> map = ApplicationUtils.getPoliticsCategory();
						for (Map.Entry<String,String> entry : map.entrySet()) {  
							if (cell.getRichStringCellValue().toString().equals(entry.getValue())){
								student.setPolitics(entry.getKey());
								break;
							}
						} 
						cell = row.getCell(6);
						student.setBirthday(cell.getDateCellValue());
						cell = row.getCell(7);
						student.setBirthaddress(cell.getRichStringCellValue().toString());
						cell = row.getCell(8);
						student.setOriginaddress(cell.getRichStringCellValue().toString());
						cell = row.getCell(9);
						student.setResidencyaddress(cell.getRichStringCellValue().toString());
						
						studentlist.add(student);
						
						StudentRelation studentRelation = new StudentRelation();
						studentRelation.setIdcard(student.getIdcard());
						cell = row.getCell(10);
						studentRelation.setPhone(cell.getRichStringCellValue().toString());
						cell = row.getCell(11);
						studentRelation.setEmail(cell.getRichStringCellValue().toString());
						cell = row.getCell(12);
						studentRelation.setAddress(cell.getRichStringCellValue().toString());
						cell = row.getCell(13);
						studentRelation.setZipcode(cell.getRichStringCellValue().toString());
						cell = row.getCell(14);
						studentRelation.setHomeaddress(cell.getRichStringCellValue().toString());
						cell = row.getCell(15);
						studentRelation.setTemporaryaddress(cell.getRichStringCellValue().toString());
						
						relationlist.add(studentRelation);
						
						StudentSchoolRoll studentRoll = new StudentSchoolRoll();
						//当前学校的标识
						studentRoll.setSchool(schoolid);
						studentRoll.setIdcard(student.getIdcard());
						cell = row.getCell(16);
						studentRoll.setJoindate(cell.getDateCellValue());
						cell = row.getCell(17);
						studentRoll.setFreedate(cell.getDateCellValue());
						cell = row.getCell(18);
						map = ApplicationUtils.getJoinCategory();
						for (Map.Entry<String,String> entry : map.entrySet()) {  
							if (cell.getRichStringCellValue().toString().equals(entry.getValue())){
								studentRoll.setJointype(entry.getKey());
								break;
							}
						} 
						cell = row.getCell(19);
						studentRoll.setProfessional(cell.getRichStringCellValue().toString());
						cell = row.getCell(20);
						studentRoll.setClassin(cell.getRichStringCellValue().toString());
						cell = row.getCell(21);
						studentRoll.setClassno(cell.getRichStringCellValue().toString());
						
						rolllist.add(studentRoll);
						
						}catch(Exception ex){
							 int xh = j-2;
							 errs.append("读取【基本信息】数据时，序号为 "+xh+" 的学生信息读取错误；");
							 continue;
						}
					}
					 
					 /*如果没有一个学生的信息符合导入要求，则退出*/
					 if (studentlist==null||studentlist.size()==0){
						 break;
					 }
				 }
				 
				//读取教育信息
				 if (count==1){
					 start = 2;
					 for(int j=start;j<=rows;j++) {
						 try{
						//创建一个行对象
						XSSFRow row = sheet.getRow(j); 
						int cols = row.getLastCellNum();

						//创建一个行里的一个字段的对象，也就是获取到的一个单元格中的值
						XSSFCell cell = row.getCell(1);
						
						StudentEducation studenteducation =new StudentEducation();
						studenteducation.setIdcard(cell.getRichStringCellValue().toString());
						cell = row.getCell(2);
						studenteducation.setSchoolname(cell.getRichStringCellValue().toString());
						cell = row.getCell(3);
						studenteducation.setProfessional(cell.getRichStringCellValue().toString());	
						cell = row.getCell(4);
						studenteducation.setStartdate(cell.getDateCellValue());
						cell = row.getCell(5);
						studenteducation.setFinishdate(cell.getDateCellValue());
						cell = row.getCell(6);
						studenteducation.setHonor(cell.getRichStringCellValue().toString());	
						cell = row.getCell(7);
						studenteducation.setReportproject(cell.getRichStringCellValue().toString());
						
						educationlist.add(studenteducation);
						 }catch(Exception ex){
							 int xh = j-1;
							 errs.append("读取【教育信息】数据时，序号为 "+xh+" 的学生信息读取错误；");
							 continue;
						}
					}
				 }
				 
				//读取就业信息
				 if (count==2){
					 start = 2;
				 
					 for(int j=start;j<=rows;j++) {
						    try{
							//创建一个行对象
							XSSFRow row = sheet.getRow(j); 
							int cols = row.getLastCellNum();

							//创建一个行里的一个字段的对象，也就是获取到的一个单元格中的值
							XSSFCell cell = row.getCell(1);
							if (cell.getRichStringCellValue().toString().equals("")){
								continue;
							}
							StudentCareer studentcareer =new StudentCareer();
							studentcareer.setIdcard(cell.getRichStringCellValue().toString());
							cell = row.getCell(2);
							Map<String,String> map = ApplicationUtils.getWorkCategory();
							for (Map.Entry<String,String> entry : map.entrySet()) {  
								if (cell.getRichStringCellValue().toString().equals(entry.getValue())){
									studentcareer.setCareertype(entry.getKey());
									break;
								}
							} 
							cell = row.getCell(3);
							studentcareer.setCorporationname(cell.getRichStringCellValue().toString());
							cell = row.getCell(4);
							Map<String,String> unitmap = ApplicationUtils.getWorkUnitCategory();
							for (Map.Entry<String,String> entry : unitmap.entrySet()) {  
								if (cell.getRichStringCellValue().toString().equals(entry.getValue())){
									studentcareer.setUnittype(entry.getKey());
									break;
								}
							}
							cell = row.getCell(5);
							studentcareer.setAddress(cell.getRichStringCellValue().toString());	
							cell = row.getCell(6);
							studentcareer.setStartdate(cell.getDateCellValue());
							cell = row.getCell(7);
							studentcareer.setFinishdate(cell.getDateCellValue());
														
							careerlist.add(studentcareer);
							
						    }catch(Exception ex){
								 int xh = j-1;
								 errs.append("读取【就业信息】数据时，序号为 "+xh+" 的学生信息读取错误；");
								 continue;
							}
						}
				 }
				 
				//读取实习情况
				 if (count==3){
					 start = 2;
				 
					 for(int j=start;j<=rows;j++) {
						   try{
							//创建一个行对象
							XSSFRow row = sheet.getRow(j); 
							int cols = row.getLastCellNum();

							//创建一个行里的一个字段的对象，也就是获取到的一个单元格中的值
							XSSFCell cell = row.getCell(1);
							if (cell.getRichStringCellValue().toString().equals("")){
								continue;
							}
							StudentPractice studentprac =new StudentPractice();
							studentprac.setIdcard(cell.getRichStringCellValue().toString());
							cell = row.getCell(2);
							studentprac.setCorporation(cell.getRichStringCellValue().toString());
							cell = row.getCell(3);
							studentprac.setStartdate(cell.getDateCellValue());
							cell = row.getCell(4);
							studentprac.setFinishdate(cell.getDateCellValue());
							cell = row.getCell(5);
							Map<String,String> map = ApplicationUtils.getPracticsCategory();
							for (Map.Entry<String,String> entry : map.entrySet()) {  
								if (cell.getRichStringCellValue().toString().equals(entry.getValue())){
									studentprac.setType(entry.getKey());
									break;
								}
							} 		
							cell = row.getCell(6);
							studentprac.setTeacher(cell.getRichStringCellValue().toString());
							cell = row.getCell(7);
							studentprac.setWork(cell.getRichStringCellValue().toString());
							
							practicelist.add(studentprac);
							
						   }catch(Exception ex){
								 int xh = j-1;
								 errs.append("读取【实习情况】数据时，序号为 "+xh+" 的学生信息读取错误；");
								 continue;
							}
						}
				 }
				 
				//读取论文情况
				 if (count==4){
					 start = 2;
				 
					 for(int j=start;j<=rows;j++) {
						  try{
							//创建一个行对象
							XSSFRow row = sheet.getRow(j); 
							int cols = row.getLastCellNum();

							//创建一个行里的一个字段的对象，也就是获取到的一个单元格中的值
							XSSFCell cell = row.getCell(1);
							if (cell.getRichStringCellValue().toString().equals("")){
								continue;
							}
							StudentPaper studentpaper =new StudentPaper();
							studentpaper.setIdcard(cell.getRichStringCellValue().toString());
							cell = row.getCell(2);
							studentpaper.setName(cell.getRichStringCellValue().toString());
							cell = row.getCell(3);
							Map<String,String> map = ApplicationUtils.getPaperCategory();
							for (Map.Entry<String,String> entry : map.entrySet()) {  
								if (cell.getRichStringCellValue().toString().equals(entry.getValue())){
									studentpaper.setType(entry.getKey());
									break;
								}
							} 	
							cell = row.getCell(4);
							studentpaper.setTeacher(cell.getRichStringCellValue().toString());
							cell = row.getCell(5);
							map = ApplicationUtils.getPaperQuanlityCategory();
							for (Map.Entry<String,String> entry : map.entrySet()) {  
								if (cell.getRichStringCellValue().toString().equals(entry.getValue())){
									studentpaper.setQuanlity(entry.getKey());
									break;
								}
							} 		
							cell = row.getCell(6);
							studentpaper.setResume(cell.getRichStringCellValue().toString());
							cell = row.getCell(7);
							studentpaper.setWork(cell.getRichStringCellValue().toString());
							
							paperlist.add(studentpaper);
							
						  }catch(Exception ex){
								 int xh = j-1;
								 errs.append("读取【论文情况】数据时，序号为 "+xh+" 的学生信息读取错误；");
								 continue;
							}
						}
				 }
				 
				//读取科研情况
				 if (count==5){
					 start = 2;
				 
					 for(int j=start;j<=rows;j++) {
						 try{
							//创建一个行对象
							XSSFRow row = sheet.getRow(j); 
							int cols = row.getLastCellNum();

							//创建一个行里的一个字段的对象，也就是获取到的一个单元格中的值
							XSSFCell cell = row.getCell(1);
							if (cell.getRichStringCellValue().toString().equals("")){
								continue;
							}
							StudentResearch studentres =new StudentResearch();
							studentres.setIdcard(cell.getRichStringCellValue().toString());
							cell = row.getCell(2);
							studentres.setTitle(cell.getRichStringCellValue().toString());
							cell = row.getCell(3);
							studentres.setStartdate(cell.getDateCellValue());
							cell = row.getCell(4);
							studentres.setFinishdate(cell.getDateCellValue());
							cell = row.getCell(5);
							Map<String,String> map = ApplicationUtils.getResearchCategory();
							for (Map.Entry<String,String> entry : map.entrySet()) {  
								if (cell.getRichStringCellValue().toString().equals(entry.getValue())){
									studentres.setType(entry.getKey());
									break;
								}
							} 	
							cell = row.getCell(6);
							map = ApplicationUtils.getResearchGradeCategory();
							for (Map.Entry<String,String> entry : map.entrySet()) {  
								if (cell.getRichStringCellValue().toString().equals(entry.getValue())){
									studentres.setGrade(entry.getKey());
									break;
								}
							} 	
							cell = row.getCell(7);
							map = ApplicationUtils.getAttendCategory();
							for (Map.Entry<String,String> entry : map.entrySet()) {  
								if (cell.getRichStringCellValue().toString().equals(entry.getValue())){
									studentres.setRole(entry.getKey());
									break;
								}
							} 		
							
							researchlist.add(studentres);
							
						 }catch(Exception ex){
							 int xh = j-1;
							 errs.append("读取【科研情况】数据时，序号为 "+xh+" 的学生信息读取错误；");
							 continue;
						}
						}
				 }
				 
				//读取科研活动
				 if (count==6){
					 start = 2;
				 
					 for(int j=start;j<=rows;j++) {
						 try{
							//创建一个行对象
							XSSFRow row = sheet.getRow(j); 
							int cols = row.getLastCellNum();

							//创建一个行里的一个字段的对象，也就是获取到的一个单元格中的值
							XSSFCell cell = row.getCell(1);
							if (cell.getRichStringCellValue().toString().equals("")){
								continue;
							}
							StudentResearchActivity studentactivity =new StudentResearchActivity();
							studentactivity.setIdcard(cell.getRichStringCellValue().toString());
							cell = row.getCell(2);
							studentactivity.setResearchname(cell.getRichStringCellValue().toString());
							cell = row.getCell(3);
							studentactivity.setName(cell.getRichStringCellValue().toString());
							cell = row.getCell(4);
							studentactivity.setStartdate(cell.getDateCellValue());
							cell = row.getCell(5);
							studentactivity.setFinishdate(cell.getDateCellValue());
							cell = row.getCell(6);
							Map<String,String> map = ApplicationUtils.getActivityGradeCategory();
							for (Map.Entry<String,String> entry : map.entrySet()) {  
								if (cell.getRichStringCellValue().toString().equals(entry.getValue())){
									studentactivity.setGrade(entry.getKey());
									break;
								}
							} 		
							cell = row.getCell(7);
							if (cell.getRichStringCellValue().toString().equals("是"))
								studentactivity.setIspaper(1);
							else
								studentactivity.setIspaper(0);
							cell = row.getCell(8);
							studentactivity.setPapername(cell.getRichStringCellValue().toString());
							cell = row.getCell(9);
							studentactivity.setPaperorder((int)cell.getNumericCellValue());
							
							activitylist.add(studentactivity);
							
						 }catch(Exception ex){
							 int xh = j-1;
							 errs.append("读取【科研活动】数据时，序号为 "+xh+" 的学生信息读取错误；");
							 continue;
						}
						}
				 }
				 
				//读取获得荣誉情况
				 if (count==7){
					 start = 2;
				 
					 for(int j=start;j<=rows;j++) {
						 try{
							//创建一个行对象
							XSSFRow row = sheet.getRow(j); 
							int cols = row.getLastCellNum();

							//创建一个行里的一个字段的对象，也就是获取到的一个单元格中的值
							XSSFCell cell = row.getCell(1);
							if (cell.getRichStringCellValue().toString().equals("")){
								continue;
							}
							StudentHonor studenthonor =new StudentHonor();
							studenthonor.setIdcard(cell.getRichStringCellValue().toString());
							cell = row.getCell(2);
							studenthonor.setName(cell.getRichStringCellValue().toString());
							cell = row.getCell(3);
							studenthonor.setHonordate(cell.getDateCellValue());
							cell = row.getCell(4);
							Map<String,String> map = ApplicationUtils.getHonorGradeCategory();
							for (Map.Entry<String,String> entry : map.entrySet()) {  
								if (cell.getRichStringCellValue().toString().equals(entry.getValue())){
									studenthonor.setGrade(entry.getKey());
									break;
								}
							} 						
							honorlist.add(studenthonor);
							
						 }catch(Exception ex){
							 int xh = j-1;
							 errs.append("读取【获得荣誉】数据时，序号为 "+xh+" 的学生信息读取错误；");
							 continue;
						}
						}
				 }
			}
	        file.close();
	        
	        /*保存操作*/
	        maplist.put("studentlist", studentlist);
	        maplist.put("relationlist", relationlist);
	        maplist.put("rolllist", rolllist);
	        maplist.put("educationlist", educationlist);
	        maplist.put("careerlist", careerlist);
	        maplist.put("practicelist", practicelist);
	        maplist.put("paperlist", paperlist);
	        maplist.put("researchlist", researchlist);
	        maplist.put("activitylist", activitylist);
	        maplist.put("honorlist", honorlist);
	        
	        List<String> errorlist = new ArrayList<String>();
	        errorlist.add(errs.toString());
	        maplist.put("error", errorlist);
	        
		} catch (Exception e) {
			 errs.append(e.getMessage());
	         e.printStackTrace();
	    } 
		log.error(errs.toString());
	    return maplist;    
	}
}
