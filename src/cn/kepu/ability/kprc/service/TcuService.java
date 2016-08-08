package cn.kepu.ability.kprc.service;

import cn.kepu.ability.kprc.bean.Tcu;
import cn.kepu.utils.PageModel;

public interface TcuService {
	/**
	 * 分页查询的方法实现
	 * @param example
	 * @param pageNo
	 * @param pageSize
	 * @return 分页对象
	 */
	public PageModel<Tcu> getTcus(Tcu tcu, int pageNo, int pageSize);
	/**
	 * 获取数据的方法
	 * @param id
	 * @return
	 */
	public Tcu getTcu(int id);
	/**
	 * 删除数据的方法实现
	 * @param id
	 * @return
	 */
	public boolean removeTcu(int id);
	/**
	 * 批量删除数据的方法实现
	 * @param id
	 * @return
	 */
	public boolean removeTcus(int[] id);
	/**
	 * 插入新数据的方法实现
	 * @param example
	 * @return
	 */
	public Tcu addTcu(Tcu tcu);
	
	/**
	 * 更新数据的方法实现
	 * @param example
	 * @return
	 */
	public  Tcu updateTcu(Tcu tcu);
}


