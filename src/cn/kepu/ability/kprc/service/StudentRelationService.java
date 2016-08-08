package cn.kepu.ability.kprc.service;

import cn.kepu.ability.kprc.bean.StudentRelation;
import cn.kepu.utils.PageModel;

public interface StudentRelationService {
	/**
	 * 分页查询的方法实现
	 * @param example
	 * @param pageNo
	 * @param pageSize
	 * @return 分页对象
	 */
	public PageModel<StudentRelation> getStudentRelation(StudentRelation studentRelation, int pageNo, int pageSize);
	/**
	 * 获取数据的方法
	 * @param id
	 * @return
	 */
	public StudentRelation getStudentRelation(int id);
	/**
	 * 删除数据的方法实现
	 * @param id
	 * @return
	 */
	public boolean removeStudentRelation(int id);
	/**
	 * 批量删除数据的方法实现
	 * @param id
	 * @return
	 */
	public boolean removeStudentRelations(int[] id);
	/**
	 * 插入新数据的方法实现
	 * @param example
	 * @return
	 */
	public StudentRelation addStudentRelation(StudentRelation studentRelation);
	
	/**
	 * 更新数据的方法实现
	 * @param example
	 * @return
	 */
	public StudentRelation updateStudentRelation(StudentRelation studentRelation);
}
