package cn.kepu.ability.kprc.service.impl;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cn.kepu.ability.kprc.bean.StudentRelation;
import cn.kepu.ability.kprc.dao.StudentRelationDao;
import cn.kepu.ability.kprc.service.StudentRelationService;
import cn.kepu.utils.PageModel;
import cn.kepu.utils.StringUtils;
@Repository("studentRelationService")
public class StudentRelationServiceImpl implements StudentRelationService {
	private static final Log log = LogFactory.getLog(StudentRelationServiceImpl.class);
	@Autowired
	private StudentRelationDao studentRelationDao;
	
	@Override
	public PageModel<StudentRelation> getStudentRelation(StudentRelation studentRelation,
			int pageNo, int pageSize) {
		String where = "where 1=1";
		List<Object> queryParamList = new ArrayList<Object>();
		if(studentRelation != null) {
			if (!StringUtils.isEmpty(studentRelation.getStudentid())) {
				where += " and studentid =?";
				queryParamList.add(studentRelation.getStudentid());
			}
			if (!StringUtils.isEmpty(studentRelation.getAddress())) {
				where += " and address like ?";
				queryParamList.add("%" + studentRelation.getAddress() + "%");
			}
			if (!StringUtils.isEmpty(studentRelation.getEmail())) {
				where += " and email like ?";
				queryParamList.add("%" + studentRelation.getEmail()+ "%");
			}
			if (!StringUtils.isEmpty(studentRelation.getHomeaddress())) {
				where += " and homeaddress like ?";
				queryParamList.add("%" + studentRelation.getHomeaddress()+ "%");
			}
			if (!StringUtils.isEmpty(studentRelation.getPhone())) {
				where += " and phone like ?";
				queryParamList.add("%" +studentRelation.getPhone()+ "%");
			}
			if (!StringUtils.isEmpty(studentRelation.getTemporaryaddress())) {
				where += " and temporaryaddress like ?";
				queryParamList.add("%" +studentRelation.getTemporaryaddress()+ "%");
			}
			if (!StringUtils.isEmpty(studentRelation.getZipcode())) {
				where += " and zipcode like ?";
				queryParamList.add("%" +studentRelation.getZipcode()+ "%");
			}
		}
		Map<String, String> orderby = new LinkedHashMap<String, String>();
		orderby.put("id", "desc");
		PageModel<StudentRelation> page = studentRelationDao.find(where, queryParamList.toArray(new Object[0]), orderby, pageNo, pageSize);
		return page;
	}

	@Override
	public StudentRelation getStudentRelation(int id) {
		return studentRelationDao.get(id);
	}

	@Override
	public boolean removeStudentRelation(int id) {
		try {
			studentRelationDao.delete(id);
			return true;
		} catch (Exception e) {
			log.error("删除"+id+"失败", e);
			return false;
		}
	}

	@Override
	public boolean removeStudentRelations(int[] ids) {
		for(int id : ids) {
			removeStudentRelation(id);
		}
		return true;
	}

	@Override
	public StudentRelation addStudentRelation(StudentRelation studentRelation) {
		try {
			int id = (Integer)studentRelationDao.save(studentRelation);
			return studentRelation;
		} catch (Exception e) {
			log.error("添加失败", e);
			return null;
		}
	}

	@Override
	public StudentRelation updateStudentRelation(StudentRelation studentRelation) {
		try {
			studentRelationDao.update(studentRelation);
		} catch (Exception e) {
			log.error("更新"+studentRelation.getAddress()+"失败", e);
			return null;
		}
		return studentRelation;
	}
}
