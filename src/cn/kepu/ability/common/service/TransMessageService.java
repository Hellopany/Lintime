package cn.kepu.ability.common.service;

import java.util.List;

import cn.kepu.ability.common.bean.TransMessage;
import cn.kepu.ability.common.bean.User;
import cn.kepu.ability.kprc.bean.AdvertiseFor;
import cn.kepu.ability.kprc.bean.SPMember;
import cn.kepu.utils.PageModel;

public interface TransMessageService {
	public PageModel<TransMessage> getTransMessages(TransMessage transMessage,int pageNo, int pageSize );
	
	public List<SPMember> getAllReceivers(String receivers);
	
	/**
	 * 获取数据的方法
	 * @param id
	 * @return
	 */
	public TransMessage getTransMessage(int id);
	/**
	 * 删除数据的方法实现
	 * @param id
	 * @return
	 */
	public boolean removeTransMessage(int id);
	/**
	 * 批量删除数据的方法实现
	 * @param id
	 * @return
	 */
	public boolean removeTransMessages(int[] id);
	/**
	 * 插入新数据的方法实现
	 * @param example
	 * @return
	 */
	public TransMessage addTransMessage(TransMessage transMessage);
	
	/**
	 * 更新数据的方法实现
	 * @param example
	 * @return
	 */
	public TransMessage updateTransMessage(TransMessage transMessage);
	
	public boolean isExists(int id);
}
