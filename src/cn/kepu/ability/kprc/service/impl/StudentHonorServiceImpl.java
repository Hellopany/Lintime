package cn.kepu.ability.kprc.service.impl;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cn.kepu.ability.kprc.bean.StudentHonor;
import cn.kepu.ability.kprc.dao.StudentHonorDao;
import cn.kepu.ability.kprc.service.StudentHonorService;
import cn.kepu.utils.PageModel;
import cn.kepu.utils.StringUtils;
@Repository("studentHonorService")
public class StudentHonorServiceImpl implements StudentHonorService {
	private static final Log log = LogFactory.getLog(StudentHonorServiceImpl.class);
	@Autowired
	private StudentHonorDao studentHonorDao;
	
	@Override
	public PageModel<StudentHonor> getStudentHonor(StudentHonor studentHonor,
			int pageNo, int pageSize) {
		String where = "where 1=1";
		List<Object> queryParamList = new ArrayList<Object>();
		if(studentHonor != null) {
			if (!StringUtils.isEmpty(studentHonor.getStudentid())) {
				where += " and studentid =?";
				queryParamList.add(studentHonor.getStudentid());
			}
			if (!StringUtils.isEmpty(studentHonor.getName())) {
				where += " and name like ?";
				queryParamList.add("%" + studentHonor.getName() + "%");
			}
			if (!StringUtils.isEmpty(studentHonor.getGrade())) {
				where += " and grade = ?";
				queryParamList.add(studentHonor.getGrade());
			}
			if (studentHonor.getHonordate()!=null) {
				where += " and honordate >= ?";
				queryParamList.add(studentHonor.getHonordate());
			}
		}
		Map<String, String> orderby = new LinkedHashMap<String, String>();
		orderby.put("id", "desc");
		PageModel<StudentHonor> page = studentHonorDao.find(where, queryParamList.toArray(new Object[0]), orderby, pageNo, pageSize);
		return page;
	}

	@Override
	public StudentHonor getStudentHonor(int id) {
		return studentHonorDao.get(id);
	}

	@Override
	public boolean removeStudentHonor(int id) {
		try {
			studentHonorDao.delete(id);
			return true;
		} catch (Exception e) {
			log.error("删除"+id+"失败", e);
			return false;
		}
	}

	@Override
	public boolean removeStudentHonors(int[] ids) {
		for(int id : ids) {
			removeStudentHonor(id);
		}
		return true;
	}

	@Override
	public StudentHonor addStudentHonor(StudentHonor studentHonor) {
		try {
			int id = (Integer)studentHonorDao.save(studentHonor);
			return studentHonor;
		} catch (Exception e) {
			log.error("添加失败", e);
			return null;
		}
	}

	@Override
	public StudentHonor updateStudentHonor(StudentHonor studentHonor) {
		try {
			studentHonorDao.update(studentHonor);
		} catch (Exception e) {
			log.error("更新"+studentHonor.getName()+"失败", e);
			return null;
		}
		return studentHonor;
	}
}
