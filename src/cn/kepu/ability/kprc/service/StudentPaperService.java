package cn.kepu.ability.kprc.service;

import cn.kepu.ability.kprc.bean.StudentPaper;
import cn.kepu.utils.PageModel;

public interface StudentPaperService {
	/**
	 * 分页查询的方法实现
	 * @param example
	 * @param pageNo
	 * @param pageSize
	 * @return 分页对象
	 */
	public PageModel<StudentPaper> getStudentPaper(StudentPaper studentPaper, int pageNo, int pageSize);
	/**
	 * 获取数据的方法
	 * @param id
	 * @return
	 */
	public StudentPaper getStudentPaper(int id);
	/**
	 * 删除数据的方法实现
	 * @param id
	 * @return
	 */
	public boolean removeStudentPaper(int id);
	/**
	 * 批量删除数据的方法实现
	 * @param id
	 * @return
	 */
	public boolean removeStudentPapers(int[] id);
	/**
	 * 插入新数据的方法实现
	 * @param example
	 * @return
	 */
	public StudentPaper addStudentPaper(StudentPaper studentPaper);
	
	/**
	 * 更新数据的方法实现
	 * @param example
	 * @return
	 */
	public StudentPaper updateStudentPaper(StudentPaper studentPaper);
}
