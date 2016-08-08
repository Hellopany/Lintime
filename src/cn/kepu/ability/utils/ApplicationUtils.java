package cn.kepu.ability.utils;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import cn.kepu.base.memory.StaticStorage;
import cn.kepu.utils.StringUtils;


/**
 * 应用全局存储信息工具类
 * @author zhangzl
 */
public class ApplicationUtils {

	public static void setPoliticsCategory(Map<String, String> politicsMap) {
		StaticStorage.setStaticValue("POLITICS_MAP", politicsMap);
	}
	
	@SuppressWarnings("unchecked")
	public static Map<String,String> getPoliticsCategory(){
		return (Map<String,String>)StaticStorage.getStaticValue("POLITICS_MAP");
	}
	public static void setJoinCategory(Map<String, String> joinMap) {
		StaticStorage.setStaticValue("JOIN_MAP", joinMap);
	}
	
	@SuppressWarnings("unchecked")
	public static Map<String,String> getJoinCategory(){
		return (Map<String,String>)StaticStorage.getStaticValue("JOIN_MAP");
	}
	
	public static void setWorkCategory(Map<String, String> workMap) {
		StaticStorage.setStaticValue("WORK_MAP", workMap);
	}
	
	@SuppressWarnings("unchecked")
	public static Map<String,String> getWorkCategory(){
		return (Map<String,String>)StaticStorage.getStaticValue("WORK_MAP");
	}
	
	public static void setWorkUnitCategory(Map<String, String> workMap) {
		StaticStorage.setStaticValue("WORKUNIT_MAP", workMap);
	}
	
	@SuppressWarnings("unchecked")
	public static Map<String,String> getWorkUnitCategory(){
		return (Map<String,String>)StaticStorage.getStaticValue("WORKUNIT_MAP");
	}
	
	public static void setResearchCategory(Map<String, String> researchMap) {
		StaticStorage.setStaticValue("RESEARCH_MAP", researchMap);
	}
	
	@SuppressWarnings("unchecked")
	public static Map<String,String> getResearchCategory(){
		return (Map<String,String>)StaticStorage.getStaticValue("RESEARCH_MAP");
	}
	public static void setResearchGradeCategory(Map<String, String> researchgradeMap) {
		StaticStorage.setStaticValue("RESEARCHGRADE_MAP", researchgradeMap);
	}
	
	@SuppressWarnings("unchecked")
	public static Map<String,String> getResearchGradeCategory(){
		return (Map<String,String>)StaticStorage.getStaticValue("RESEARCHGRADE_MAP");
	}
	
	public static void setAttendCategory(Map<String, String> attendMap) {
		StaticStorage.setStaticValue("ATTEND_MAP", attendMap);
	}
	
	@SuppressWarnings("unchecked")
	public static Map<String,String> getAttendCategory(){
		return (Map<String,String>)StaticStorage.getStaticValue("ATTEND_MAP");
	}
	public static void setActivityGradeCategory(Map<String, String> activityMap) {
		StaticStorage.setStaticValue("ACTIVITYGRADE_MAP", activityMap);
	}
	
	@SuppressWarnings("unchecked")
	public static Map<String,String> getActivityGradeCategory(){
		return (Map<String,String>)StaticStorage.getStaticValue("ACTIVITYGRADE_MAP");
	}
	
	public static void setSchool(Map<Integer, String> honorMap) {
		StaticStorage.setStaticValue("SCHOOL_MAP", honorMap);
	}
	
	@SuppressWarnings("unchecked")
	public static Map<Integer,String> getSchool(){
		return (Map<Integer,String>)StaticStorage.getStaticValue("SCHOOL_MAP");
	}
	
	public static void setHonorGradeCategory(Map<String, String> honorMap) {
		StaticStorage.setStaticValue("HONORGRADE_MAP", honorMap);
	}
	
	@SuppressWarnings("unchecked")
	public static Map<String,String> getHonorGradeCategory(){
		return (Map<String,String>)StaticStorage.getStaticValue("HONORGRADE_MAP");
	}
	
	public static void setPracticsCategory(Map<String, String> practicsMap) {
		StaticStorage.setStaticValue("PRACTICS_MAP", practicsMap);
	}
	
	@SuppressWarnings("unchecked")
	public static Map<String,String> getPracticsCategory(){
		return (Map<String,String>)StaticStorage.getStaticValue("PRACTICS_MAP");
	}
	
	public static void setPaperCategory(Map<String, String> paperMap) {
		StaticStorage.setStaticValue("PAPER_MAP", paperMap);
	}
	
	@SuppressWarnings("unchecked")
	public static Map<String,String> getPaperCategory(){
		return (Map<String,String>)StaticStorage.getStaticValue("PAPER_MAP");
	}
	
	public static void setPaperQuanlityCategory(Map<String, String> paperQuanlityMap) {
		StaticStorage.setStaticValue("PAPERQUANLITY_MAP", paperQuanlityMap);
	} 
	
	@SuppressWarnings("unchecked")
	public static Map<String,String> getPaperQuanlityCategory(){
		return (Map<String,String>)StaticStorage.getStaticValue("PAPERQUANLITY_MAP");
	}
	
	public static void setStatusCategory(Map<String, String> statusMap) {
		StaticStorage.setStaticValue("STATUS_MAP", statusMap);
	} 
	
	@SuppressWarnings("unchecked")
	public static Map<String,String> getStatusCategory(){
		return (Map<String,String>)StaticStorage.getStaticValue("STATUS_MAP");
	}
	
	public static void setUserType(Map<String, String> typemap) {
		StaticStorage.setStaticValue("USERTYPE_MAP", typemap);
	}
	
	@SuppressWarnings("unchecked")
	public static Map<String,String> getUserType(){
		return (Map<String,String>)StaticStorage.getStaticValue("USERTYPE_MAP");
	}
	public static void setUserBusiness(Map<String, String> businessmap) {
		StaticStorage.setStaticValue("USEBUSINESS_MAP", businessmap);
		
	}
	@SuppressWarnings("unchecked")
	public static Map<String,String> getUserBusiness(){
		return (Map<String,String>)StaticStorage.getStaticValue("USEBUSINESS_MAP");
	}
	
	public static void setSbtype(Map<String, String> sbtype) {
		StaticStorage.setStaticValue("SBTYPE_MAP", sbtype);
		
	}
	@SuppressWarnings("unchecked")
	public static Map<String,String> getSbtype(){
		return (Map<String,String>)StaticStorage.getStaticValue("SBTYPE_MAP");
	}
	
	public static void setSbeleformat(Map<String, String> sbeleformat) {
		StaticStorage.setStaticValue("SBELEFORMAT_MAP", sbeleformat);
		
	}
	@SuppressWarnings("unchecked")
	public static Map<String,String> getSbeleformat(){
		return (Map<String,String>)StaticStorage.getStaticValue("SBELEFORMAT_MAP");
	}	
	
	public static String getSbele(String key){
		return getSbeleformat().get(key);
	}
	
	public static void setSbservices(Map<String, String> sbservices) {
		StaticStorage.setStaticValue("SBSERVICES_MAP", sbservices);
		
	}
	@SuppressWarnings("unchecked")
	public static Map<String,String> getSbservices(){
		return (Map<String,String>)StaticStorage.getStaticValue("SBSERVICES_MAP");
	}
	public static String getSbser(String key){
		return getSbservices().get(key);
	}
	
	
	
	public static void setSbpublicationtype(
			Map<String, String> sbpublicationtype) {
		StaticStorage.setStaticValue("SBPUBLICATIONTYPE_MAP", sbpublicationtype);
		
	}
	@SuppressWarnings("unchecked")
	public static Map<String,String> getSbpublicationtype(){
		return (Map<String,String>)StaticStorage.getStaticValue("SBPUBLICATIONTYPE_MAP");
	}	
	public static String getSbpub(String key){
		return getSbpublicationtype().get(key);
	}	
	
	public static void setSbcollecteditename(
			Map<String, String> sbcollecteditename) {
		StaticStorage.setStaticValue("SBCOLLECTEDITENAME_MAP", sbcollecteditename);
		
	}
	@SuppressWarnings("unchecked")
	public static Map<String,String> getSbcollecteditename(){
		return (Map<String,String>)StaticStorage.getStaticValue("SBCOLLECTEDITENAME_MAP");
	}
	public static String getSbcol(String key){
		return getSbcollecteditename().get(key);
	}	
	
	
	
	public static void setSfinvestmode(Map<String, String> sfinvestmode) {
		StaticStorage.setStaticValue("SFINVESTMODE_MAP", sfinvestmode);
		
	}
	@SuppressWarnings("unchecked")
	public static Map<String,String> getSfinvestmode(){
		return (Map<String,String>)StaticStorage.getStaticValue("SFINVESTMODE_MAP");
	}
	public static String getSfin(String key){
		return getSfinvestmode().get(key);
	}		
	
	public static void setSpprinttype(Map<String, String> spprinttype) {
		StaticStorage.setStaticValue("SPPRINTTYPE_MAP", spprinttype);
		
	}
	@SuppressWarnings("unchecked")
	public static Map<String,String> getSpprinttype(){
		return (Map<String,String>)StaticStorage.getStaticValue("SPPRINTTYPE_MAP");
	}
	public static String getSppr(String key){
		return getSpprinttype().get(key);
	}		
	

	/**
	 * 逗号分隔两个字符
	 */
	public static String getSplitYear(String year,int tag){
		if(!StringUtils.isEmpty(year)|| tag !=0){
			String []annul = year.split(",");
			return annul[tag-1];
		}
		
		return "";
		
	}
	
	
	/**
	 * 逗号分隔多选框取值
	 */
	public static List<String> getSplitCheckbox(String value){
		List<String> list = new ArrayList<String>();
		if(!StringUtils.isEmpty(value)){
			StringBuffer sb =new StringBuffer("{'");
			if(value.indexOf(",")>0){
				
				String []annul = value.split(",");
				for(int i=0;i<annul.length;i++){
					list.add(annul[i].trim());
				}
	
			}else
			{
				list.add(value);
			}
			return list;		
			
			
			
		}		
		return list;
		
	}

	public static String getServiceCheckboxValue(String services) {
		
		List<String> list = getSplitCheckbox(services);
		StringBuffer sb = new StringBuffer();
		if(list!=null){
			for(int i=0;i<list.size();i++){
				if(i<list.size()-1){
					sb.append(getSbservices().get(list.get(i))+",");
				}else{
					sb.append(getSbservices().get(list.get(i)));
				}
			}
			return sb.toString();
		}
		return "";
	}

	public static String getEleformatCheckboxValue(String reader) {
		List<String> list = getSplitCheckbox(reader);
		StringBuffer sb = new StringBuffer();
		if(list!=null){
			for(int i=0;i<list.size();i++){
				if(i<list.size()-1){
					sb.append(getSbeleformat().get(list.get(i))+",");
				}else{
					sb.append(getSbeleformat().get(list.get(i)));
				}
			}
			return sb.toString();
		}
		return "";
	}
	
}
