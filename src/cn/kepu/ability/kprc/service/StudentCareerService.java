package cn.kepu.ability.kprc.service;

import cn.kepu.ability.kprc.bean.StudentCareer;
import cn.kepu.utils.PageModel;

public interface StudentCareerService {
	/**
	 * 分页查询的方法实现
	 * @param example
	 * @param pageNo
	 * @param pageSize
	 * @return 分页对象
	 */
	public PageModel<StudentCareer> getStudentCareer(StudentCareer studentCareer, int pageNo, int pageSize);
	/**
	 * 获取数据的方法
	 * @param id
	 * @return
	 */
	public StudentCareer getStudentCareer(int id);
	/**
	 * 删除数据的方法实现
	 * @param id
	 * @return
	 */
	public boolean removeStudentCareer(int id);
	/**
	 * 批量删除数据的方法实现
	 * @param id
	 * @return
	 */
	public boolean removeStudentCareers(int[] id);
	/**
	 * 插入新数据的方法实现
	 * @param example
	 * @return
	 */
	public StudentCareer addStudentCareer(StudentCareer studentCareer);
	
	/**
	 * 更新数据的方法实现
	 * @param example
	 * @return
	 */
	public StudentCareer updateStudentCareer(StudentCareer studentCareer);
}
