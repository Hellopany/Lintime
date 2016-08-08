package cn.kepu.ability.kprc.service.impl;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cn.kepu.ability.kprc.bean.StudentPaper;
import cn.kepu.ability.kprc.dao.StudentPaperDao;
import cn.kepu.ability.kprc.service.StudentPaperService;
import cn.kepu.utils.PageModel;
import cn.kepu.utils.StringUtils;
@Repository("studentPaperService")
public class StudentPaperServiceImpl implements StudentPaperService {
	private static final Log log = LogFactory.getLog(StudentPaperServiceImpl.class);
	@Autowired
	private StudentPaperDao studentPaperDao;
	
	@Override
	public PageModel<StudentPaper> getStudentPaper(StudentPaper studentPaper,
			int pageNo, int pageSize) {
		String where = "where 1=1";
		List<Object> queryParamList = new ArrayList<Object>();
		if(studentPaper != null) {
			if (!StringUtils.isEmpty(studentPaper.getStudentid())) {
				where += " and studentid =?";
				queryParamList.add(studentPaper.getStudentid());
			}
			if (!StringUtils.isEmpty(studentPaper.getName())) {
				where += " and name like ?";
				queryParamList.add("%" + studentPaper.getName() + "%");
			}
			if (!StringUtils.isEmpty(studentPaper.getQuanlity())) {
				where += " and quanlity like ?";
				queryParamList.add(studentPaper.getQuanlity());
			}
			if (!StringUtils.isEmpty(studentPaper.getResume())) {
				where += " and resume like ?";
				queryParamList.add(studentPaper.getResume());
			}
			if (!StringUtils.isEmpty(studentPaper.getTeacher())) {
				where += " and teacher like ?";
				queryParamList.add(studentPaper.getTeacher());
			}
			if (!StringUtils.isEmpty(studentPaper.getType())) {
				where += " and type = ?";
				queryParamList.add(studentPaper.getType());
			}
			if (!StringUtils.isEmpty(studentPaper.getWork())) {
				where += " and work like ?";
				queryParamList.add(studentPaper.getWork());
			}
		}
		Map<String, String> orderby = new LinkedHashMap<String, String>();
		orderby.put("id", "desc");
		PageModel<StudentPaper> page = studentPaperDao.find(where, queryParamList.toArray(new Object[0]), orderby, pageNo, pageSize);
		return page;
	}

	@Override
	public StudentPaper getStudentPaper(int id) {
		return studentPaperDao.get(id);
	}

	@Override
	public boolean removeStudentPaper(int id) {
		try {
			studentPaperDao.delete(id);
			return true;
		} catch (Exception e) {
			log.error("删除"+id+"失败", e);
			return false;
		}
	}

	@Override
	public boolean removeStudentPapers(int[] ids) {
		for(int id : ids) {
			removeStudentPaper(id);
		}
		return true;
	}

	@Override
	public StudentPaper addStudentPaper(StudentPaper studentPaper) {
		try {
			int id = (Integer)studentPaperDao.save(studentPaper);
			return studentPaper;
		} catch (Exception e) {
			log.error("添加失败", e);
			return null;
		}
	}

	@Override
	public StudentPaper updateStudentPaper(StudentPaper studentPaper) {
		try {
			studentPaperDao.update(studentPaper);
		} catch (Exception e) {
			log.error("更新"+studentPaper.getName()+"失败", e);
			return null;
		}
		return studentPaper;
	}
}
