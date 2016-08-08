package cn.kepu.ability.kprc.service.impl;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cn.kepu.ability.kprc.bean.StudentResearch;
import cn.kepu.ability.kprc.dao.StudentResearchDao;
import cn.kepu.ability.kprc.service.StudentResearchService;
import cn.kepu.utils.PageModel;
import cn.kepu.utils.StringUtils;
@Repository("studentResearchService")
public class StudentResearchServiceImpl implements StudentResearchService {
	private static final Log log = LogFactory.getLog(StudentResearchServiceImpl.class);
	@Autowired
	private StudentResearchDao studentResearchDao;
	
	@Override
	public PageModel<StudentResearch> getStudentResearch(StudentResearch studentResearch,
			int pageNo, int pageSize) {
		String where = "where 1=1";
		List<Object> queryParamList = new ArrayList<Object>();
		if(studentResearch != null) {
			if (!StringUtils.isEmpty(studentResearch.getTitle())) {
				where += " and title =?";
				queryParamList.add(studentResearch.getTitle());
			}
			if (!StringUtils.isEmpty(studentResearch.getStudentid())) {
				where += " and studentid =?";
				queryParamList.add(studentResearch.getStudentid());
			}
			if (!StringUtils.isEmpty(studentResearch.getGrade())) {
				where += " and grade = ?";
				queryParamList.add(studentResearch.getGrade());
			}
			if (!StringUtils.isEmpty(studentResearch.getRole())) {
				where += " and honor like ?";
				queryParamList.add("%"+studentResearch.getRole()+"%");
			}
			if (!StringUtils.isEmpty(studentResearch.getType())) {
				where += " and type = ?";
				queryParamList.add(studentResearch.getType());
			}
			if (studentResearch.getStartdate()!=null) {
				where += " and startdate >= ?";
				queryParamList.add(studentResearch.getStartdate());
			}
			if (studentResearch.getFinishdate()!=null) {
				where += " and finishdate < ?";
				queryParamList.add(studentResearch.getFinishdate());
			}
		}
		Map<String, String> orderby = new LinkedHashMap<String, String>();
		orderby.put("id", "desc");
		PageModel<StudentResearch> page = studentResearchDao.find(where, queryParamList.toArray(new Object[0]), orderby, pageNo, pageSize);
		return page;
	}

	@Override
	public StudentResearch getStudentResearch(int id) {
		return studentResearchDao.get(id);
	}

	@Override
	public boolean removeStudentResearch(int id) {
		try {
			studentResearchDao.delete(id);
			return true;
		} catch (Exception e) {
			log.error("删除"+id+"失败", e);
			return false;
		}
	}

	@Override
	public boolean removeStudentResearchs(int[] ids) {
		for(int id : ids) {
			removeStudentResearch(id);
		}
		return true;
	}

	@Override
	public StudentResearch addStudentResearch(StudentResearch studentResearch) {
		try {
			int id = (Integer)studentResearchDao.save(studentResearch);
			studentResearch.setId(id);
			return studentResearch;
		} catch (Exception e) {
			log.error("添加失败", e);
			return null;
		}
	}

	@Override
	public StudentResearch updateStudentResearch(StudentResearch studentResearch) {
		try {
			studentResearchDao.update(studentResearch);
		} catch (Exception e) {
			log.error("更新"+studentResearch.getTitle()+"失败", e);
			return null;
		}
		return studentResearch;
	}
}
