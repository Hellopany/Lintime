package cn.kepu.ability.kprc.service;

import cn.kepu.ability.kprc.bean.AdvertiseForApply;
import cn.kepu.utils.PageModel;

public interface AdvertiseForApplyService {
	/**
	 * 分页查询的方法实现
	 * @param example
	 * @param pageNo
	 * @param pageSize
	 * @return 分页对象
	 */
	public PageModel<AdvertiseForApply> getAdvertiseForApply(AdvertiseForApply advertiseForApply, int pageNo, int pageSize);
	/**
	 * 获取数据的方法
	 * @param id
	 * @return
	 */
	public AdvertiseForApply getAdvertiseForApply(int id);
	/**
	 * 删除数据的方法实现
	 * @param id
	 * @return
	 */
	public boolean removeAdvertiseForApply(int id);
	/**
	 * 批量删除数据的方法实现
	 * @param id
	 * @return
	 */
	public boolean removeAdvertiseForApplys(int[] id);
	/**
	 * 插入新数据的方法实现
	 * @param example
	 * @return
	 */
	public AdvertiseForApply addAdvertiseForApply(AdvertiseForApply advertiseForApply);
	
	/**
	 * 更新数据的方法实现
	 * @param example
	 * @return
	 */
	public AdvertiseForApply updateAdvertiseForApply(AdvertiseForApply advertiseForApply);
}
