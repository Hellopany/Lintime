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
import cn.kepu.ability.kprc.dao.StudentEducationDao;
import cn.kepu.ability.kprc.service.StudentEducationService;
import cn.kepu.utils.PageModel;
import cn.kepu.utils.StringUtils;
@Repository("studentEducationService")
public class StudentEducationServiceImpl implements StudentEducationService {
	private static final Log log = LogFactory.getLog(StudentEducationServiceImpl.class);
	@Autowired
	private StudentEducationDao studentEducationDao;
	
	@Override
	public PageModel<StudentEducation> getStudentEducation(StudentEducation studentEducation,
			int pageNo, int pageSize) {
		String where = "where 1=1";
		List<Object> queryParamList = new ArrayList<Object>();
		if(studentEducation != null) {
			if (!StringUtils.isEmpty(studentEducation.getStudentid())) {
				where += " and studentid =?";
				queryParamList.add(studentEducation.getStudentid());
			}
			if (!StringUtils.isEmpty(studentEducation.getSchoolname())) {
				where += " and schoolname like ?";
				queryParamList.add("%"+studentEducation.getSchoolname()+"%");
			}
			if (!StringUtils.isEmpty(studentEducation.getHonor())) {
				where += " and honor like ?";
				queryParamList.add("%"+studentEducation.getHonor()+"%");
			}
			if (!StringUtils.isEmpty(studentEducation.getProfessional())) {
				where += " and professional like ?";
				queryParamList.add("%"+studentEducation.getProfessional()+"%");
			}
			if (!StringUtils.isEmpty(studentEducation.getReportproject())) {
				where += " and reportproject like ?";
				queryParamList.add("%"+studentEducation.getReportproject()+"%");
			}
			if (studentEducation.getStartdate()!=null) {
				where += " and startdate >= ?";
				queryParamList.add(studentEducation.getStartdate());
			}
			if (studentEducation.getFinishdate()!=null) {
				where += " and finishdate < ?";
				queryParamList.add(studentEducation.getFinishdate());
			}
		}
		Map<String, String> orderby = new LinkedHashMap<String, String>();
		orderby.put("id", "desc");
		PageModel<StudentEducation> page = studentEducationDao.find(where, queryParamList.toArray(new Object[0]), orderby, pageNo, pageSize);
		return page;
	}

	@Override
	public StudentEducation getStudentEducation(int id) {
		return studentEducationDao.get(id);
	}

	@Override
	public boolean removeStudentEducation(int id) {
		try {
			studentEducationDao.delete(id);
			return true;
		} catch (Exception e) {
			log.error("删除"+id+"失败", e);
			return false;
		}
	}

	@Override
	public boolean removeStudentEducations(int[] ids) {
		for(int id : ids) {
			removeStudentEducation(id);
		}
		return true;
	}

	@Override
	public StudentEducation addStudentEducation(StudentEducation studentEducation) {
		try {
			int id = (Integer)studentEducationDao.save(studentEducation);
			return studentEducation;
		} catch (Exception e) {
			log.error("添加失败", e);
			return null;
		}
	}

	@Override
	public StudentEducation updateStudentEducation(StudentEducation studentEducation) {
		try {
			studentEducationDao.update(studentEducation);
		} catch (Exception e) {
			log.error("更新"+studentEducation.getHonor()+"失败", e);
			return null;
		}
		return studentEducation;
	}
}
