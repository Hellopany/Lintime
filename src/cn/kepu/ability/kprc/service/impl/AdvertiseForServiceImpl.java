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
import cn.kepu.ability.kprc.dao.AdvertiseForDao;
import cn.kepu.ability.kprc.service.AdvertiseForService;
import cn.kepu.utils.PageModel;
import cn.kepu.utils.StringUtils;
@Repository("advertiseForService")
public class AdvertiseForServiceImpl implements AdvertiseForService {

	private static final Log log = LogFactory.getLog(AdvertiseForServiceImpl.class);
	@Autowired
	private AdvertiseForDao advertiseForDao;
	
	@Override
	public PageModel<AdvertiseFor> getAdvertiseFor(AdvertiseFor advertiseFor,
			int pageNo, int pageSize) {
		String where = "where 1=1";
		List<Object> queryParamList = new ArrayList<Object>();
		if(advertiseFor != null) {
			if (!StringUtils.isEmpty(advertiseFor.getMemberid())) {
				where += " and memberid =?";
				queryParamList.add(advertiseFor.getMemberid());
			}
			if (!StringUtils.isEmpty(advertiseFor.getDescribe())) {
				where += " and describe like ?";
				queryParamList.add("%" + advertiseFor.getDescribe() + "%");
			}
			if (!StringUtils.isEmpty(advertiseFor.getPost())) {
				where += " and post like ?";
				queryParamList.add("%"+advertiseFor.getPost()+"%");
			}
			if (!StringUtils.isEmpty(advertiseFor.getContent())) {
				where += " and content like ?";
				queryParamList.add("%" + advertiseFor.getContent() + "%");
			}
			if (!StringUtils.isEmpty(advertiseFor.getRequeire())) {
				where += " and requeire like ?";
				queryParamList.add("%" + advertiseFor.getRequeire() + "%");
			}
			if (advertiseFor.getPublishdate()!=null) {
				where += " and publishdate >= ?";
				queryParamList.add(advertiseFor.getPublishdate());
			}
			if (!StringUtils.isEmpty(advertiseFor.getStatus())) {
				where += " and status = ?";
				queryParamList.add(advertiseFor.getStatus());
			}
		}
		Map<String, String> orderby = new LinkedHashMap<String, String>();
		orderby.put("id", "desc");
		PageModel<AdvertiseFor> page = advertiseForDao.find(where, queryParamList.toArray(new Object[0]), orderby, pageNo, pageSize);
		return page;
	}

	@Override
	public AdvertiseFor getAdvertiseFor(int id) {
		return advertiseForDao.get(id);
	}

	@Override
	public boolean removeAdvertiseFor(int id) {
		try {
			advertiseForDao.delete(id);
			return true;
		} catch (Exception e) {
			log.error("删除"+id+"失败", e);
			return false;
		}
	}

	@Override
	public boolean removeAdvertiseFors(int[] ids) {
		for(int id : ids) {
			removeAdvertiseFor(id);
		}
		return true;
	}

	@Override
	public AdvertiseFor addAdvertiseFor(AdvertiseFor advertiseFor) {
		try {
			int id = (Integer)advertiseForDao.save(advertiseFor);
			return advertiseFor;
		} catch (Exception e) {
			log.error("添加失败", e);
			return null;
		}
	}

	@Override
	public AdvertiseFor updateAdvertiseFor(AdvertiseFor advertiseFor) {
		try {
			advertiseForDao.update(advertiseFor);
		} catch (Exception e) {
			log.error("更新"+advertiseFor.getContent()+"失败", e);
			return null;
		}
		return advertiseFor;
	}

}
