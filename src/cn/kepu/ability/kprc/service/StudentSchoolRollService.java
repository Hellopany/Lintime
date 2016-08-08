package cn.kepu.ability.kprc.service;

import cn.kepu.ability.kprc.bean.StudentSchoolRoll;
import cn.kepu.utils.PageModel;

public interface StudentSchoolRollService {
	/**
	 * 分页查询的方法实现
	 * @param example
	 * @param pageNo
	 * @param pageSize
	 * @return 分页对象
	 */
	public PageModel<StudentSchoolRoll> getStudentSchoolRoll(StudentSchoolRoll studentSchoolRoll, int pageNo, int pageSize);
	/**
	 * 获取数据的方法
	 * @param id
	 * @return
	 */
	public StudentSchoolRoll getStudentSchoolRoll(int id);
	/**
	 * 删除数据的方法实现
	 * @param id
	 * @return
	 */
	public boolean removeStudentSchoolRoll(int id);
	/**
	 * 批量删除数据的方法实现
	 * @param id
	 * @return
	 */
	public boolean removeStudentSchoolRolls(int[] id);
	/**
	 * 插入新数据的方法实现
	 * @param example
	 * @return
	 */
	public StudentSchoolRoll addStudentSchoolRoll(StudentSchoolRoll studentSchoolRoll);
	
	/**
	 * 更新数据的方法实现
	 * @param example
	 * @return
	 */
	public StudentSchoolRoll updateStudentSchoolRoll(StudentSchoolRoll studentSchoolRoll);
}
