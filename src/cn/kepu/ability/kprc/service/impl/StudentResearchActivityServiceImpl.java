package cn.kepu.ability.kprc.service.impl;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cn.kepu.ability.kprc.bean.Student;
import cn.kepu.ability.kprc.bean.StudentResearchActivity;
import cn.kepu.ability.kprc.dao.StudentResearchActivityDao;
import cn.kepu.ability.kprc.service.StudentResearchActivityService;
import cn.kepu.utils.PageModel;
import cn.kepu.utils.StringUtils;
@Repository("studentResearchActivityService")
public class StudentResearchActivityServiceImpl implements
		StudentResearchActivityService {
	private static final Log log = LogFactory.getLog(StudentResearchActivityServiceImpl.class);
	@Autowired
	private StudentResearchActivityDao studentResearchActivityDao;
	
	@Override
	public PageModel<StudentResearchActivity> getStudentResearchActivity(StudentResearchActivity studentResearchActivity,
			int pageNo, int pageSize) {
		String where = "where 1=1";
		List<Object> queryParamList = new ArrayList<Object>();
		if(studentResearchActivity != null) {
			if (!StringUtils.isEmpty(studentResearchActivity.getStudentresearchid())) {
				where += " and studentresearchid =?";
				queryParamList.add(studentResearchActivity.getStudentresearchid());
			}
			if (!StringUtils.isEmpty(studentResearchActivity.getGrade())) {
				where += " and grade = ?";
				queryParamList.add(studentResearchActivity.getGrade());
			}
			if (!StringUtils.isEmpty(studentResearchActivity.getIspaper())) {
				where += " and ispapaer = ?";
				queryParamList.add(studentResearchActivity.getIspaper());
			}
			if (!StringUtils.isEmpty(studentResearchActivity.getName())) {
				where += " and name like ?";
				queryParamList.add("%"+studentResearchActivity.getName()+"%");
			}
			if (!StringUtils.isEmpty(studentResearchActivity.getPapername())) {
				where += " and papername like ?";
				queryParamList.add("%"+studentResearchActivity.getPapername()+"%");
			}
			if (!StringUtils.isEmpty(studentResearchActivity.getPaperorder())) {
				where += " and paperorder = ?";
				queryParamList.add(studentResearchActivity.getPaperorder());
			}
			if (studentResearchActivity.getStartdate()!=null) {
				where += " and startdate >= ?";
				queryParamList.add(studentResearchActivity.getStartdate());
			}
			if (studentResearchActivity.getFinishdate()!=null) {
				where += " and finishdate < ?";
				queryParamList.add(studentResearchActivity.getFinishdate());
			}
		}
		Map<String, String> orderby = new LinkedHashMap<String, String>();
		orderby.put("id", "desc");
		PageModel<StudentResearchActivity> page = studentResearchActivityDao.find(where, queryParamList.toArray(new Object[0]), orderby, pageNo, pageSize);
		return page;
	}

	@Override
	public StudentResearchActivity getStudentResearchActivity(int id) {
		return studentResearchActivityDao.get(id);
	}

	@Override
	public boolean removeStudentResearchActivity(int id) {
		try {
			studentResearchActivityDao.delete(id);
			return true;
		} catch (Exception e) {
			log.error("删除"+id+"失败", e);
			return false;
		}
	}

	@Override
	public boolean removeStudentResearchActivitys(int[] ids) {
		for(int id : ids) {
			removeStudentResearchActivity(id);
		}
		return true;
	}

	@Override
	public StudentResearchActivity addStudentResearchActivity(StudentResearchActivity studentResearchActivity) {
		try {
			int id = (Integer)studentResearchActivityDao.save(studentResearchActivity);
			return studentResearchActivity;
		} catch (Exception e) {
			log.error("添加失败", e);
			return null;
		}
	}

	@Override
	public StudentResearchActivity updateStudentResearchActivity(StudentResearchActivity studentResearchActivity) {
		try {
			studentResearchActivityDao.update(studentResearchActivity);
		} catch (Exception e) {
			log.error("更新"+studentResearchActivity.getName()+"失败", e);
			return null;
		}
		return studentResearchActivity;
	}
	
	@Override
	public List<StudentResearchActivity> getStudentResearchActivity(String researchids) {
		if(StringUtils.isEmpty(researchids)){
			return null;
		}
		String where = "where 1=1";
		where += " and studentresearchid in ("+researchids+")";
		PageModel<StudentResearchActivity> page = studentResearchActivityDao.find(where,null, null, 1,999);
		if (page!=null&&page.getList().size()>0)
			return page.getList();
		return null;
	}
}
