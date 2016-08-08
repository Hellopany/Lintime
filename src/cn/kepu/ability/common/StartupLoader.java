package cn.kepu.ability.common;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Repository;

import cn.kepu.ability.utils.ApplicationUtils;
import cn.kepu.base.annotation.LoaderFunction;
import cn.kepu.base.loader.BaseStartupLoader;
import cn.kepu.utils.PropertyConfigureUtils;

/**
 * 系统启动时，加载配置信息和相关的初始化操作
 * 
 * @author zhangzl
 */
@Repository("default_loader")
public class StartupLoader extends BaseStartupLoader {

	private static final Log log = LogFactory.getLog(StartupLoader.class);

	/**
	 * 政治面貌
	 */
	@LoaderFunction(1)
	public void loadPolitics() {
		Map<String, String> politicsMap = new LinkedHashMap<String, String>();
		politicsMap.put("A", "中共党员");
		politicsMap.put("B", "中共预备党员");
		politicsMap.put("C", "共青团员");
		politicsMap.put("D", "群众");
		politicsMap.put("E", "其他");
		ApplicationUtils.setPoliticsCategory(politicsMap);
	}
	/**
	 * 入学方式
	 */
	@LoaderFunction(2)
	public void loadJoinType() {
		Map<String, String> joinMap = new LinkedHashMap<String, String>();
		joinMap.put("A", "就近入学");
		joinMap.put("B", "统一招生考试/普通入学");
		joinMap.put("C", "体育特招");
		joinMap.put("D", "艺术特招");
		joinMap.put("E", "其他");
		ApplicationUtils.setJoinCategory(joinMap);
	}
	/**
	 * 就业意向类型
	 */
	@LoaderFunction(3)
	public void loadWorkType() {
		Map<String, String> workMap = new LinkedHashMap<String, String>();
		workMap.put("A", "科普企业");
		workMap.put("B", "科普场馆");
		workMap.put("C", "中小学");
		workMap.put("D", "科协机关和组织");
		workMap.put("E", "高校院所");
		workMap.put("F", "继续深造（考博、出国等）");
		workMap.put("G", "其它科技组织");
		workMap.put("H", "其它");
		ApplicationUtils.setWorkCategory(workMap);
	}
	/**
	 * 就业意向单位类型
	 */
	@LoaderFunction(3)
	public void loadWorkUnitType() {
		Map<String, String> workUnitMap = new LinkedHashMap<String, String>();
		workUnitMap.put("A", "科普");
		workUnitMap.put("B", "非科普");
		ApplicationUtils.setWorkUnitCategory(workUnitMap);
	}
	/**
	 * 科研类型
	 */
	@LoaderFunction(4)
	public void loadResearchType() {
		Map<String, String> researchMap = new LinkedHashMap<String, String>();
		researchMap.put("A", "项目");
		researchMap.put("B", "课题");
		researchMap.put("C", "竞赛");
		researchMap.put("D", "论文");
		researchMap.put("E", "作品（课件、视频、展品）");
		researchMap.put("F", "其它");
		ApplicationUtils.setResearchCategory(researchMap);
	}
	
	/**
	 * 实践类型
	 */
	@LoaderFunction(5)
	public void loadPracticsType() {
		Map<String, String> practicsMap = new LinkedHashMap<String, String>();
		practicsMap.put("A", "实习");
		practicsMap.put("B", "见习");
		practicsMap.put("C", "志愿者服务");
		practicsMap.put("D", "社团活动");
		ApplicationUtils.setPracticsCategory(practicsMap);
	}
	/**
	 * 论文类型
	 */
	@LoaderFunction(6)
	public void loadPaperType() {
		Map<String, String> paperMap = new LinkedHashMap<String, String>();
		paperMap.put("A", "初中");
		paperMap.put("B", "研究类");
		paperMap.put("C", "作品类");
		ApplicationUtils.setPaperCategory(paperMap);
	}
	/**
	 * 论文质量类型
	 */
	@LoaderFunction(7)
	public void loadPaperQuanlityType() {
		Map<String, String> paperQuanlityMap = new LinkedHashMap<String, String>();
		paperQuanlityMap.put("A", "院级优秀");
		paperQuanlityMap.put("B", "校级优秀");
		paperQuanlityMap.put("C", "省市级优秀");
		paperQuanlityMap.put("D", "无");
		ApplicationUtils.setPaperQuanlityCategory(paperQuanlityMap);
	}
	/**
	 * 科研级别
	 */
	@LoaderFunction(8)
	public void loadResearchGrade() {
		Map<String, String> researchGradeMap = new LinkedHashMap<String, String>();
		researchGradeMap.put("A", "国家");
		researchGradeMap.put("B", "学校");
		ApplicationUtils.setResearchGradeCategory(researchGradeMap);
	}
	/**
	 * 科研级别
	 */
	@LoaderFunction(9)
	public void loadAttendType() {
		Map<String, String> attendMap = new LinkedHashMap<String, String>();
		attendMap.put("A", "主持");
		attendMap.put("B", "参加");
		ApplicationUtils.setAttendCategory(attendMap);
	}
	/**
	 * 科研级别
	 */
	@LoaderFunction(10)
	public void loadActivityGrade() {
		Map<String, String> activityMap = new LinkedHashMap<String, String>();
		activityMap.put("A", "国际");
		activityMap.put("B", "国内");
		ApplicationUtils.setActivityGradeCategory(activityMap);
	}
	/**
	 * 获奖级别
	 */
	@LoaderFunction(11)
	public void loadHonorGrade() {
		Map<String, String> honorMap = new LinkedHashMap<String, String>();
		honorMap.put("A", "国家级");
		honorMap.put("B", "省级");
		honorMap.put("C", "市级");
		honorMap.put("D", "校级");
		ApplicationUtils.setHonorGradeCategory(honorMap);
	}
	/**
	 * 招聘信息发布状态
	 */
	@LoaderFunction(12)
	public void loadStatus() {
		Map<String, String> statusMap = new LinkedHashMap<String, String>();
		statusMap.put("U", "未提交");
		statusMap.put("S", "审核中");
		statusMap.put("C", "已发布");
		statusMap.put("R", "被拒绝");
		ApplicationUtils.setStatusCategory(statusMap);
	}
	/**
	 * 用户权限
	 * * */
	@LoaderFunction(14)
	public void loadUserType()
	{
		Map<String,String> typemap = new LinkedHashMap<String,String>();
		typemap.put("V", "V");
		typemap.put("P", "P");
		typemap.put("I", "I");
		typemap.put("R", "R");
		typemap.put("A", "A");
		ApplicationUtils.setUserType(typemap);
	}
	
	/**
	 * 学校
	 */
	@LoaderFunction(11)
	public void loadschool() {
		Map<Integer, String> honorMap = new LinkedHashMap<Integer, String>();
		honorMap.put(1, "清华大学美术学院");
		honorMap.put(2, "北京航空航天大学高等教育研究所");
		honorMap.put(3, "北京师范大学科学与技术教育专业");
		honorMap.put(4, "华东师范大学教育学部课程与教育系科技与技术教育领域");
		honorMap.put(5, "浙江大学教育学院");
		honorMap.put(6, "浙江大学文物与博物馆学系");
		honorMap.put(7, "浙江大学计算机科技与技术学院");
		honorMap.put(8, "华中科技大学教育科学研究院");
		ApplicationUtils.setSchool(honorMap);
	}
}
