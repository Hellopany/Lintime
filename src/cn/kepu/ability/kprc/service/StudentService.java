package cn.kepu.ability.kprc.service;

import cn.kepu.ability.kprc.bean.Student;
import cn.kepu.utils.PageModel;

public interface StudentService {
	/**
	 * 分页查询的方法实现
	 * @param example
	 * @param pageNo
	 * @param pageSize
	 * @return 分页对象
	 */
	public PageModel<Student> getStudent(Student student, int pageNo, int pageSize);
	/**
	 * 获取数据的方法
	 * @param id
	 * @return
	 */
	public Student getStudent(int id);
	
	public Student getStudentByIdcard(String idcard);
	/**
	 * 删除数据的方法实现
	 * @param id
	 * @return
	 */
	public boolean removeStudent(int id);
	/**
	 * 批量删除数据的方法实现
	 * @param id
	 * @return
	 */
	public boolean removeStudents(int[] id);
	/**
	 * 插入新数据的方法实现
	 * @param example
	 * @return
	 */
	public Student addStudent(Student student);
	
	/**
	 * 更新数据的方法实现
	 * @param example
	 * @return
	 */
	public Student updateStudent(Student student);
}
