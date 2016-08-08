package cn.kepu.ability.kprc.service;

import cn.kepu.ability.kprc.bean.StudentEducation;
import cn.kepu.utils.PageModel;

public interface StudentEducationService {
	/**
	 * 分页查询的方法实现
	 * @param example
	 * @param pageNo
	 * @param pageSize
	 * @return 分页对象
	 */
	public PageModel<StudentEducation> getStudentEducation(StudentEducation studentEducation, int pageNo, int pageSize);
	/**
	 * 获取数据的方法
	 * @param id
	 * @return
	 */
	public StudentEducation getStudentEducation(int id);
	/**
	 * 删除数据的方法实现
	 * @param id
	 * @return
	 */
	public boolean removeStudentEducation(int id);
	/**
	 * 批量删除数据的方法实现
	 * @param id
	 * @return
	 */
	public boolean removeStudentEducations(int[] id);
	/**
	 * 插入新数据的方法实现
	 * @param example
	 * @return
	 */
	public StudentEducation addStudentEducation(StudentEducation studentEducation);
	
	/**
	 * 更新数据的方法实现
	 * @param example
	 * @return
	 */
	public StudentEducation updateStudentEducation(StudentEducation studentEducation);
}
