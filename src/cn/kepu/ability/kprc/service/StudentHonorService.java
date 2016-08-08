package cn.kepu.ability.kprc.service;

import cn.kepu.ability.kprc.bean.StudentHonor;
import cn.kepu.utils.PageModel;

public interface StudentHonorService {
	/**
	 * 分页查询的方法实现
	 * @param example
	 * @param pageNo
	 * @param pageSize
	 * @return 分页对象
	 */
	public PageModel<StudentHonor> getStudentHonor(StudentHonor studentHonor, int pageNo, int pageSize);
	/**
	 * 获取数据的方法
	 * @param id
	 * @return
	 */
	public StudentHonor getStudentHonor(int id);
	/**
	 * 删除数据的方法实现
	 * @param id
	 * @return
	 */
	public boolean removeStudentHonor(int id);
	/**
	 * 批量删除数据的方法实现
	 * @param id
	 * @return
	 */
	public boolean removeStudentHonors(int[] id);
	/**
	 * 插入新数据的方法实现
	 * @param example
	 * @return
	 */
	public StudentHonor addStudentHonor(StudentHonor studentHonor);
	
	/**
	 * 更新数据的方法实现
	 * @param example
	 * @return
	 */
	public StudentHonor updateStudentHonor(StudentHonor studentHonor);
}
