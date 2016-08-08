package cn.kepu.ability.kprc.service.impl;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cn.kepu.ability.kprc.bean.StudentCareer;
import cn.kepu.ability.kprc.dao.StudentCareerDao;
import cn.kepu.ability.kprc.service.StudentCareerService;
import cn.kepu.utils.PageModel;
import cn.kepu.utils.StringUtils;
@Repository("studentCareerService")
public class StudentCareerServiceImpl implements StudentCareerService {
	private static final Log log = LogFactory.getLog(StudentCareerServiceImpl.class);
	@Autowired
	private StudentCareerDao studentCareerDao;
	
	@Override
	public PageModel<StudentCareer> getStudentCareer(StudentCareer studentCareer,
			int pageNo, int pageSize) {
		String where = "where 1=1";
		List<Object> queryParamList = new ArrayList<Object>();
		if(studentCareer != null) {
			if (!StringUtils.isEmpty(studentCareer.getStudentid())) {
				where += " and studentid =?";
				queryParamList.add(studentCareer.getStudentid());
			}
			if (!StringUtils.isEmpty(studentCareer.getCorporationname())) {
				where += " and corporationname like ?";
				queryParamList.add("%" + studentCareer.getCorporationname() + "%");
			}
			if (!StringUtils.isEmpty(studentCareer.getCareertype())) {
				where += " and careertype =?";
				queryParamList.add(studentCareer.getCareertype());
			}
			
		}
		Map<String, String> orderby = new LinkedHashMap<String, String>();
		orderby.put("id", "desc");
		PageModel<StudentCareer> page = studentCareerDao.find(where, queryParamList.toArray(new Object[0]), orderby, pageNo, pageSize);
		return page;
	}

	@Override
	public StudentCareer getStudentCareer(int id) {
		return studentCareerDao.get(id);
	}

	@Override
	public boolean removeStudentCareer(int id) {
		try {
			studentCareerDao.delete(id);
			return true;
		} catch (Exception e) {
			log.error("删除"+id+"失败", e);
			return false;
		}
	}

	@Override
	public boolean removeStudentCareers(int[] ids) {
		for(int id : ids) {
			removeStudentCareer(id);
		}
		return true;
	}

	@Override
	public StudentCareer addStudentCareer(StudentCareer studentCareer) {
		try {
			int id = (Integer)studentCareerDao.save(studentCareer);
			return studentCareer;
		} catch (Exception e) {
			log.error("添加失败", e);
			return null;
		}
	}

	@Override
	public StudentCareer updateStudentCareer(StudentCareer studentCareer) {
		try {
			studentCareerDao.update(studentCareer);
		} catch (Exception e) {
			log.error("更新"+studentCareer.getCorporationname()+"失败", e);
			return null;
		}
		return studentCareer;
	}
}
