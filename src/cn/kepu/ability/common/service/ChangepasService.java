package cn.kepu.ability.common.service;

import cn.kepu.ability.common.bean.Changepas;


/**
 * @author caisl
 *
 * 2015-1-15 下午04:02:55
 */
public interface ChangepasService {

	public Changepas saversp(int uid, String code);

	public Changepas getBycode(String code);

	public void update(Changepas changepas);


}
