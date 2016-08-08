package cn.kepu.ability.kprc.service.impl;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cn.kepu.ability.kprc.bean.StudentEducation;
import cn.kepu.ability.kprc.bean.StudentPractice;
import cn.kepu.ability.kprc.dao.StudentEducationDao;
import cn.kepu.ability.kprc.dao.StudentProticeDao;
import cn.kepu.ability.kprc.service.StudentProticeService;
import cn.kepu.utils.PageModel;
import cn.kepu.utils.StringUtils;
@Repository("studentProticeService")
public class StudentProticeServiceImpl implements StudentProticeService {
	private static final Log log = LogFactory.getLog(StudentProticeServiceImpl.class);
	@Autowired
	private StudentProticeDao studentProticeDao;
	
	@Override
	public PageModel<StudentPractice> getStudentProtice(StudentPractice studentProtice,
			int pageNo, int pageSize) {
		String where = "where 1=1";
		List<Object> queryParamList = new ArrayList<Object>();
		if(studentProtice != null) {
			if (!StringUtils.isEmpty(studentProtice.getStudentid())) {
				where += " and studentid =?";
				queryParamList.add(studentProtice.getStudentid());
			}
			if (!StringUtils.isEmpty(studentProtice.getCorporation())) {
				where += " and corporation like ?";
				queryParamList.add("%" + studentProtice.getCorporation() + "%");
			}
			if (!StringUtils.isEmpty(studentProtice.getTeacher())) {
				where += " and teacher like ?";
				queryParamList.add("%" + studentProtice.getTeacher()+"%");
			}
			if (!StringUtils.isEmpty(studentProtice.getType())) {
				where += " and type = ?";
				queryParamList.add(studentProtice.getType());
			}
			if (!StringUtils.isEmpty(studentProtice.getWork())) {
				where += " and work like ?";
				queryParamList.add(studentProtice.getWork());
			}
			if (studentProtice.getStartdate()!=null) {
				where += " and startdate >= ?";
				queryParamList.add(studentProtice.getStartdate());
			}
			if (studentProtice.getFinishdate()!=null) {
				where += " and finishdate < ?";
				queryParamList.add(studentProtice.getFinishdate());
			}
		}
		Map<String, String> orderby = new LinkedHashMap<String, String>();
		orderby.put("id", "desc");
		PageModel<StudentPractice> page = studentProticeDao.find(where, queryParamList.toArray(new Object[0]), orderby, pageNo, pageSize);
		return page;
	}

	@Override
	public StudentPractice getStudentProtice(int id) {
		return studentProticeDao.get(id);
	}

	@Override
	public boolean removeStudentProtice(int id) {
		try {
			studentProticeDao.delete(id);
			return true;
		} catch (Exception e) {
			log.error("删除"+id+"失败", e);
			return false;
		}
	}

	@Override
	public boolean removeStudentProtices(int[] ids) {
		for(int id : ids) {
			removeStudentProtice(id);
		}
		return true;
	}

	@Override
	public StudentPractice addStudentProtice(StudentPractice studentProtice) {
		try {
			int id = (Integer)studentProticeDao.save(studentProtice);
			return studentProtice;
		} catch (Exception e) {
			log.error("添加失败", e);
			return null;
		}
	}

	@Override
	public StudentPractice updateStudentProtice(StudentPractice studentProtice) {
		try {
			studentProticeDao.update(studentProtice);
		} catch (Exception e) {
			log.error("更新"+studentProtice.getCorporation()+"失败", e);
			return null;
		}
		return studentProtice;
	}
}
