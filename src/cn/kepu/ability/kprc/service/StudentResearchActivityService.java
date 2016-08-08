package cn.kepu.ability.kprc.service;

import java.util.List;

import cn.kepu.ability.kprc.bean.Student;
import cn.kepu.ability.kprc.bean.StudentResearchActivity;
import cn.kepu.utils.PageModel;
import cn.kepu.utils.StringUtils;

public interface StudentResearchActivityService {
	/**
	 * 分页查询的方法实现
	 * @param example
	 * @param pageNo
	 * @param pageSize
	 * @return 分页对象
	 */
	public PageModel<StudentResearchActivity> getStudentResearchActivity(StudentResearchActivity studentResearchActivity, int pageNo, int pageSize);
	/**
	 * 获取数据的方法
	 * @param id
	 * @return
	 */
	public StudentResearchActivity getStudentResearchActivity(int id);
	/**
	 * 删除数据的方法实现
	 * @param id
	 * @return
	 */
	public boolean removeStudentResearchActivity(int id);
	/**
	 * 批量删除数据的方法实现
	 * @param id
	 * @return
	 */
	public boolean removeStudentResearchActivitys(int[] id);
	/**
	 * 插入新数据的方法实现
	 * @param example
	 * @return
	 */
	public StudentResearchActivity addStudentResearchActivity(StudentResearchActivity studentResearchActivity);
	
	/**
	 * 更新数据的方法实现
	 * @param example
	 * @return
	 */
	public StudentResearchActivity updateStudentResearchActivity(StudentResearchActivity studentResearchActivity);
	

	public List<StudentResearchActivity> getStudentResearchActivity(String researchids);
}
