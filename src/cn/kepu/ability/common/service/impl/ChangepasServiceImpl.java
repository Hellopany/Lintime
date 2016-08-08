package cn.kepu.ability.common.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import cn.kepu.ability.common.bean.Changepas;
import cn.kepu.ability.common.dao.ChangepasDao;
import cn.kepu.ability.common.service.ChangepasService;
import cn.kepu.utils.DateTimeUtils;
import cn.kepu.utils.StringUtils;


/**
 * @author caisl
 *
 * 2015-1-15 下午04:04:36
 */
@Repository("changepasService")
public class ChangepasServiceImpl implements ChangepasService {

	@Autowired
	public ChangepasDao changepasDao;

	@Override
	public Changepas saversp(int uid, String code) {
		// TODO Auto-generated method stub
		if(StringUtils.isEmpty(uid)||StringUtils.isEmpty(code)){
			return null;
		}
		Changepas resetpassword = new Changepas();

		try{
			resetpassword.setCode(code);
			resetpassword.setUid(uid);
			resetpassword.setCreatetime(DateTimeUtils.GetTimeNowTS());
			resetpassword.setStatus("N");
			changepasDao.save(resetpassword);
		}catch(Exception e){
			return null;
		}
		return resetpassword;
	}

	@Override
	public Changepas getBycode(String code) {
		String sql =" from Changepas where code = ?";
		Object[] params = {code};
		return (Changepas) changepasDao.uniqueResult(sql, params);
	}

	@Override
	public void update(Changepas changepas) {
		Changepas dbchange = changepasDao.get(changepas.getId());
		dbchange.setStatus("Y");
		changepasDao.update(dbchange);
		
	}

	
}
