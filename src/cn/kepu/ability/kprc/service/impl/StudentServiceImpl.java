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
import cn.kepu.ability.kprc.dao.StudentDao;
import cn.kepu.ability.kprc.service.StudentService;
import cn.kepu.utils.PageModel;
import cn.kepu.utils.StringUtils;
@Repository("studentService")
public class StudentServiceImpl implements StudentService {

	private static final Log log = LogFactory.getLog(StudentServiceImpl.class);
	@Autowired
	private StudentDao studentDao;
	
	@Override
	public PageModel<Student> getStudent(Student student,
			int pageNo, int pageSize) {
		String where = "where 1=1 and status!=null";
		List<Object> queryParamList = new ArrayList<Object>();
		if(student != null) {
			if (!StringUtils.isEmpty(student.getNewid())) {
				where += " and newid = ?";
				queryParamList.add(student.getNewid());
			}
			if (!StringUtils.isEmpty(student.getSchoolid())) {
				where += " and schoolid = ?";
				queryParamList.add(student.getSchoolid());
			}
			if (!StringUtils.isEmpty(student.getBirthaddress())) {
				where += " and birthaddress like ?";
				queryParamList.add("%"+student.getBirthaddress()+"%");
			}
			if (!StringUtils.isEmpty(student.getGender())) {
				where += " and schoolname like ?";
				queryParamList.add("%" + student.getGender() + "%");
			}
			if (!StringUtils.isEmpty(student.getIdcard())) {
				where += " and idcard like ?";
				queryParamList.add("%"+student.getIdcard()+"%");
			}
			if (!StringUtils.isEmpty(student.getName())) {
				where += " and name like ?";
				queryParamList.add("%"+student.getName()+"%");
			}
			if (!StringUtils.isEmpty(student.getNation())) {
				where += " and nation like ?";
				queryParamList.add("%"+student.getNation()+"%");
			}
			if (!StringUtils.isEmpty(student.getOriginaddress())) {
				where += " and originaddress like ?";
				queryParamList.add("%"+student.getOriginaddress()+"%");
			}
			if (!StringUtils.isEmpty(student.getPolitics())) {
				where += " and politics like ?";
				queryParamList.add("%"+student.getPolitics()+"%");
			}
			if (!StringUtils.isEmpty(student.getResidencyaddress())) {
				where += " and residencyaddress like ?";
				queryParamList.add("%"+student.getResidencyaddress()+"%");
			}
			if (student.getBirthday()!=null) {
				where += " and birthday >= ?";
				queryParamList.add(student.getBirthday());
			}
		}
		Map<String, String> orderby = new LinkedHashMap<String, String>();
		orderby.put("id", "desc");
		PageModel<Student> page = studentDao.find(where, queryParamList.toArray(new Object[0]), orderby, pageNo, pageSize);
		return page;
	}

	@Override
	public Student getStudent(int id) {
		return studentDao.get(id);
	}

	@Override
	public boolean removeStudent(int id) {
		try {
			studentDao.delete(id);
			return true;
		} catch (Exception e) {
			log.error("删除"+id+"失败", e);
			return false;
		}
	}

	@Override
	public boolean removeStudents(int[] ids) {
		for(int id : ids) {
			removeStudent(id);
		}
		return true;
	}

	@Override
	public Student addStudent(Student student) {
		try {
			int id = (Integer)studentDao.save(student);
			return student;
		} catch (Exception e) {
			log.error("添加失败", e);
			return null;
		}
	}

	@Override
	public Student updateStudent(Student student) {
		try {
			studentDao.update(student);
		} catch (Exception e) {
			log.error("更新"+student.getName()+"失败", e);
			return null;
		}
		return student;
	}
	
	@Override
	public Student getStudentByIdcard(String idcard) {
		if(StringUtils.isEmpty(idcard)){
			return null;
		}
		String where = "where 1=1 and status!=null";
		where += " and idcard ='"+idcard+"'";
		PageModel<Student> page = studentDao.find(where,null, null, 1,1);
		if (page!=null&&page.getList().size()>0)
			return page.getList().get(0);
		return null;
	}
}
