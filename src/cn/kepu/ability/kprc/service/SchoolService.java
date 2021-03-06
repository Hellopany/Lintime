package cn.kepu.ability.kprc.service;

import cn.kepu.ability.kprc.bean.School;
import cn.kepu.utils.PageModel;

public interface SchoolService {
	/**
	 * 分页查询的方法实现
	 * @param example
	 * @param pageNo
	 * @param pageSize
	 * @return 分页对象
	 */
	public PageModel<School> getSchool(School school, int pageNo, int pageSize);
	/**
	 * 获取数据的方法
	 * @param id
	 * @return
	 */
	public School getSchool(int id);
	/**
	 * 删除数据的方法实现
	 * @param id
	 * @return
	 */
	public boolean removeSchool(int id);
	/**
	 * 批量删除数据的方法实现
	 * @param id
	 * @return
	 */
	public boolean removeSchools(int[] id);
	/**
	 * 插入新数据的方法实现
	 * @param example
	 * @return
	 */
	public School addSchool(School school);
	
	/**
	 * 更新数据的方法实现
	 * @param example
	 * @return
	 */
	public School updateSchool(School school);
}
