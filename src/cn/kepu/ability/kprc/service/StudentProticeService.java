package cn.kepu.ability.kprc.service;

import cn.kepu.ability.kprc.bean.StudentPractice;
import cn.kepu.utils.PageModel;

public interface StudentProticeService {
	/**
	 * 分页查询的方法实现
	 * @param example
	 * @param pageNo
	 * @param pageSize
	 * @return 分页对象
	 */
	public PageModel<StudentPractice> getStudentProtice(StudentPractice studentProtice, int pageNo, int pageSize);
	/**
	 * 获取数据的方法
	 * @param id
	 * @return
	 */
	public StudentPractice getStudentProtice(int id);
	/**
	 * 删除数据的方法实现
	 * @param id
	 * @return
	 */
	public boolean removeStudentProtice(int id);
	/**
	 * 批量删除数据的方法实现
	 * @param id
	 * @return
	 */
	public boolean removeStudentProtices(int[] id);
	/**
	 * 插入新数据的方法实现
	 * @param example
	 * @return
	 */
	public StudentPractice addStudentProtice(StudentPractice studentProtice);
	
	/**
	 * 更新数据的方法实现
	 * @param example
	 * @return
	 */
	public StudentPractice updateStudentProtice(StudentPractice studentProtice);
}
