package cn.kepu.ability.kprc.service.impl;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cn.kepu.ability.kprc.bean.AdvertiseFor;
import cn.kepu.ability.kprc.bean.School;
import cn.kepu.ability.kprc.dao.AdvertiseForDao;
import cn.kepu.ability.kprc.dao.SchoolDao;
import cn.kepu.ability.kprc.service.SchoolService;
import cn.kepu.utils.PageModel;
import cn.kepu.utils.StringUtils;
@Repository("schoolService")
public class SchoolServiceImpl implements SchoolService {
	private static final Log log = LogFactory.getLog(SchoolServiceImpl.class);
	@Autowired
	private SchoolDao schoolDao;
	
	@Override
	public PageModel<School> getSchool(School school,
			int pageNo, int pageSize) {
		String where = "where 1=1";
		List<Object> queryParamList = new ArrayList<Object>();
		if(school != null) {
			if (!StringUtils.isEmpty(school.getName())) {
				where += " and name like ?";
				queryParamList.add("%" +school.getName()+"%" );
			}
			if (!StringUtils.isEmpty(school.getDescribe())) {
				where += " and describe like ?";
				queryParamList.add("%" + school.getDescribe() + "%");
			}
			if (!StringUtils.isEmpty(school.getAddress())) {
				where += " and address like ?";
				queryParamList.add("%"+school.getAddress()+"%");
			}
			if (!StringUtils.isEmpty(school.getRelationuser())) {
				where += " and content like ?";
				queryParamList.add("%" + school.getRelationuser() + "%");
			}
			if (!StringUtils.isEmpty(school.getTelphone())) {
				where += " and requeire like ?";
				queryParamList.add("%" + school.getTelphone() + "%");
			}
		}
		Map<String, String> orderby = new LinkedHashMap<String, String>();
		orderby.put("id", "desc");
		PageModel<School> page = schoolDao.find(where, queryParamList.toArray(new Object[0]), orderby, pageNo, pageSize);
		return page;
	}

	@Override
	public School getSchool(int id) {
		return schoolDao.get(id);
	}

	@Override
	public boolean removeSchool(int id) {
		try {
			schoolDao.delete(id);
			return true;
		} catch (Exception e) {
			log.error("删除"+id+"失败", e);
			return false;
		}
	}

	@Override
	public boolean removeSchools(int[] ids) {
		for(int id : ids) {
			removeSchool(id);
		}
		return true;
	}

	@Override
	public School addSchool(School school) {
		try {
			int id = (Integer)schoolDao.save(school);
			return school;
		} catch (Exception e) {
			log.error("添加失败", e);
			return null;
		}
	}

	@Override
	public School updateSchool(School school) {
		try {
			schoolDao.update(school);
		} catch (Exception e) {
			log.error("更新"+school.getName()+"失败", e);
			return null;
		}
		return school;
	}
}
