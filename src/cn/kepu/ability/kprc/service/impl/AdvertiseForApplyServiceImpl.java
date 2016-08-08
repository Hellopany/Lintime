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
import cn.kepu.ability.kprc.bean.AdvertiseForApply;
import cn.kepu.ability.kprc.dao.AdvertiseForApplyDao;
import cn.kepu.ability.kprc.dao.AdvertiseForDao;
import cn.kepu.ability.kprc.service.AdvertiseForApplyService;
import cn.kepu.utils.PageModel;
import cn.kepu.utils.StringUtils;
@Repository("advertiseForApplyService")
public class AdvertiseForApplyServiceImpl implements AdvertiseForApplyService {
	private static final Log log = LogFactory.getLog(AdvertiseForApplyServiceImpl.class);
	@Autowired
	private AdvertiseForApplyDao advertiseForApplyDao;
	
	@Override
	public PageModel<AdvertiseForApply> getAdvertiseForApply(AdvertiseForApply advertiseForApply,
			int pageNo, int pageSize) {
		String where = "where 1=1";
		List<Object> queryParamList = new ArrayList<Object>();
		if(advertiseForApply != null) {
			if (!StringUtils.isEmpty(advertiseForApply.getMemberid())) {
				where += " and memberid =?";
				queryParamList.add(advertiseForApply.getMemberid());
			}
			if (!StringUtils.isEmpty(advertiseForApply.getResume())) {
				where += " and resume like ?";
				queryParamList.add("%" + advertiseForApply.getResume() + "%");
			}
			if (!StringUtils.isEmpty(advertiseForApply.getPost())) {
				where += " and post like ?";
				queryParamList.add("%"+advertiseForApply.getPost()+"%");
			}
			if (advertiseForApply.getApplydate()!=null) {
				where += " and publishdate >= ?";
				queryParamList.add(advertiseForApply.getApplydate());
			}
		}
		Map<String, String> orderby = new LinkedHashMap<String, String>();
		orderby.put("id", "desc");
		PageModel<AdvertiseForApply> page = advertiseForApplyDao.find(where, queryParamList.toArray(new Object[0]), orderby, pageNo, pageSize);
		return page;
	}

	@Override
	public AdvertiseForApply getAdvertiseForApply(int id) {
		return advertiseForApplyDao.get(id);
	}

	@Override
	public boolean removeAdvertiseForApply(int id) {
		try {
			advertiseForApplyDao.delete(id);
			return true;
		} catch (Exception e) {
			log.error("删除"+id+"失败", e);
			return false;
		}
	}

	@Override
	public boolean removeAdvertiseForApplys(int[] ids) {
		for(int id : ids) {
			removeAdvertiseForApply(id);
		}
		return true;
	}

	@Override
	public AdvertiseForApply addAdvertiseForApply(AdvertiseForApply advertiseForApply) {
		try {
			int id = (Integer)advertiseForApplyDao.save(advertiseForApply);
			return advertiseForApply;
		} catch (Exception e) {
			log.error("添加失败", e);
			return null;
		}
	}

	@Override
	public AdvertiseForApply updateAdvertiseForApply(AdvertiseForApply advertiseForApply) {
		try {
			advertiseForApplyDao.update(advertiseForApply);
		} catch (Exception e) {
			log.error("更新"+advertiseForApply.getPost()+"失败", e);
			return null;
		}
		return advertiseForApply;
	}

}
