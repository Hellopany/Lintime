package cn.kepu.ability.kprc.service.impl;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cn.kepu.ability.kprc.bean.Tcu;
import cn.kepu.ability.kprc.dao.TcuDao;
import cn.kepu.ability.kprc.service.TcuService;
import cn.kepu.utils.PageModel;
import cn.kepu.utils.StringUtils;
@Repository("tcuService")
public class TcuServiceImpl implements TcuService {
	private static final Log log = LogFactory.getLog(StudentPaperServiceImpl.class);
    @Autowired
    private TcuDao tcuDao;
	@Override
	public PageModel<Tcu> getTcus(Tcu tcu, int pageNo, int pageSize) {
		String where ="where 1=1";
		List<Object> queryParamList=new ArrayList<Object>();
		if(tcu!=null){
			if(!StringUtils.isEmpty(tcu.getTel())){
				where +="and tel =?";
				queryParamList.add(tcu.getTel());
			}
			if(!StringUtils.isEmpty(tcu.getCompany())){
				where +="and comoany like?";
				queryParamList.add("%"+tcu.getCompany()+"%");
			}
			if(!StringUtils.isEmpty(tcu.getName())){
				where +="and name like?";
				queryParamList.add("%"+tcu.getName()+"%");
			}
			if(!StringUtils.isEmpty(tcu.getEmail())){
				where +="and email =?";
				queryParamList.add(tcu.getEmail());
			}
			if(!StringUtils.isEmpty(tcu.getPost())){
				where +="and post like?";
				queryParamList.add("%"+tcu.getPost()+"%");
			}
		}
		    Map<String,String> orderby=new LinkedHashMap<String,String>();
			orderby.put("id", "desc");
			PageModel<Tcu> page=tcuDao.find(where, queryParamList.toArray(new Object[0]), orderby, pageNo, pageSize);
		    return page;    		
	}

	@Override
	public Tcu getTcu(int id) {
		return  tcuDao.get(id);
	}

	@Override
	public boolean removeTcu(int id) {
		try {
			tcuDao.delete(id);
			return true;
		} catch (Exception e) {
			log.error("删除失败"+e);
			return false;
		}
	}

	@Override
	public boolean removeTcus(int[] ids) {
		for(int id : ids) {
			removeTcu(id);
		}
		return true;
	}

	@Override
	public Tcu addTcu(Tcu tcu) {
		try {
			int id = (Integer)tcuDao.save(tcu);
			return tcu;
		} catch (Exception e) {
			log.error("添加失败", e);
			return null;
		}
	}

	@Override
	public Tcu updateTcu(Tcu tcu) {
		try {
			tcuDao.update(tcu);
		} catch (Exception e) {
			log.error("更新"+tcu.getName()+"失败", e);
			return null;
		}
		return tcu;
	}
}
