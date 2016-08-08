package cn.kepu.ability.kprc.service.impl;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cn.kepu.ability.kprc.bean.StudentSchoolRoll;
import cn.kepu.ability.kprc.dao.StudentSchoolRollDao;
import cn.kepu.ability.kprc.service.StudentSchoolRollService;
import cn.kepu.utils.PageModel;
import cn.kepu.utils.StringUtils;
@Repository("studentSchoolRollService")
public class StudentSchoolRollServiceImpl implements StudentSchoolRollService {
	private static final Log log = LogFactory.getLog(StudentSchoolRollServiceImpl.class);
	@Autowired
	private StudentSchoolRollDao studentSchoolRollDao;
	
	@Override
	public PageModel<StudentSchoolRoll> getStudentSchoolRoll(StudentSchoolRoll studentSchoolRoll,
			int pageNo, int pageSize) {
		String where = "where 1=1";
		List<Object> queryParamList = new ArrayList<Object>();
		if(studentSchoolRoll != null) {
			if (!StringUtils.isEmpty(studentSchoolRoll.getStudentid())) {
				where += " and studentid =?";
				queryParamList.add(studentSchoolRoll.getStudentid());
			}
			if (!StringUtils.isEmpty(studentSchoolRoll.getClassin())) {
				where += " and classin like ?";
				queryParamList.add("%" + studentSchoolRoll.getClassin() + "%");
			}
			if (!StringUtils.isEmpty(studentSchoolRoll.getClassno())) {
				where += " and classno like ?";
				queryParamList.add("%"+studentSchoolRoll.getClassno()+"%");
			}
			if (!StringUtils.isEmpty(studentSchoolRoll.getProfessional())) {
				where += " and professional like ?";
				queryParamList.add(studentSchoolRoll.getProfessional());
			}
			if (!StringUtils.isEmpty(studentSchoolRoll.getGrade())) {
				where += " and grade = ?";
				queryParamList.add(studentSchoolRoll.getGrade());
			}
			if (!StringUtils.isEmpty(studentSchoolRoll.getJointype())) {
				where += " and jointype = ?";
				queryParamList.add(studentSchoolRoll.getJointype());
			}
			if (studentSchoolRoll.getJoindate()!=null) {
				where += " and joindate >= ?";
				queryParamList.add(studentSchoolRoll.getJoindate());
			}
		}
		Map<String, String> orderby = new LinkedHashMap<String, String>();
		orderby.put("id", "desc");
		PageModel<StudentSchoolRoll> page = studentSchoolRollDao.find(where, queryParamList.toArray(new Object[0]), orderby, pageNo, pageSize);
		return page;
	}

	@Override
	public StudentSchoolRoll getStudentSchoolRoll(int id) {
		return studentSchoolRollDao.get(id);
	}

	@Override
	public boolean removeStudentSchoolRoll(int id) {
		try {
			studentSchoolRollDao.delete(id);
			return true;
		} catch (Exception e) {
			log.error("删除"+id+"失败", e);
			return false;
		}
	}

	@Override
	public boolean removeStudentSchoolRolls(int[] ids) {
		for(int id : ids) {
			removeStudentSchoolRoll(id);
		}
		return true;
	}

	@Override
	public StudentSchoolRoll addStudentSchoolRoll(StudentSchoolRoll studentSchoolRoll) {
		try {
			int id = (Integer)studentSchoolRollDao.save(studentSchoolRoll);
			return studentSchoolRoll;
		} catch (Exception e) {
			log.error("添加失败", e);
			return null;
		}
	}

	@Override
	public StudentSchoolRoll updateStudentSchoolRoll(StudentSchoolRoll studentSchoolRoll) {
		try {
			studentSchoolRollDao.update(studentSchoolRoll);
		} catch (Exception e) {
			log.error("更新"+studentSchoolRoll.getSchool()+"失败", e);
			return null;
		}
		return studentSchoolRoll;
	}
}
