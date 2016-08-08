package cn.kepu.ability.kprc.service;

import cn.kepu.ability.kprc.bean.StudentResearch;
import cn.kepu.utils.PageModel;

public interface StudentResearchService {
	/**
	 * 分页查询的方法实现
	 * @param example
	 * @param pageNo
	 * @param pageSize
	 * @return 分页对象
	 */
	public PageModel<StudentResearch> getStudentResearch(StudentResearch studentResearch, int pageNo, int pageSize);
	/**
	 * 获取数据的方法
	 * @param id
	 * @return
	 */
	public StudentResearch getStudentResearch(int id);
	/**
	 * 删除数据的方法实现
	 * @param id
	 * @return
	 */
	public boolean removeStudentResearch(int id);
	/**
	 * 批量删除数据的方法实现
	 * @param id
	 * @return
	 */
	public boolean removeStudentResearchs(int[] id);
	/**
	 * 插入新数据的方法实现
	 * @param example
	 * @return
	 */
	public StudentResearch addStudentResearch(StudentResearch studentResearch);
	
	/**
	 * 更新数据的方法实现
	 * @param example
	 * @return
	 */
	public StudentResearch updateStudentResearch(StudentResearch studentResearch);
}
