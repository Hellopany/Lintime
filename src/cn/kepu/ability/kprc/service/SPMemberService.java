package cn.kepu.ability.kprc.service;

import cn.kepu.ability.kprc.bean.SPMember;
import cn.kepu.utils.PageModel;

public interface SPMemberService {
	/**
	 * 分页查询的方法实现
	 * @param example
	 * @param pageNo
	 * @param pageSize
	 * @return 分页对象
	 */
	public PageModel<SPMember> getSPMember(SPMember spmember, int pageNo, int pageSize);
	/**
	 * 获取数据的方法
	 * @param id
	 * @return
	 */
	public SPMember getSPMember(int id);
	/**
	 * 删除数据的方法实现
	 * @param id
	 * @return
	 */
	public boolean removeSPMember(int id);
	/**
	 * 批量删除数据的方法实现
	 * @param id
	 * @return
	 */
	public boolean removeSPMembers(int[] id);
	/**
	 * 插入新数据的方法实现
	 * @param example
	 * @return
	 */
	public SPMember addSPMember(SPMember spmember);
	
	/**
	 * 更新数据的方法实现
	 * @param example
	 * @return
	 */
	public SPMember updateSPMember(SPMember spmember);
	
	public SPMember checkSPMember(SPMember spmember);

	public SPMember updateLoginInfo(SPMember spmember, String newip);
	
	public SPMember getSPMemberByName(String name);
	
	public PageModel<SPMember> getSPMembersByNames(String names);
	
	public PageModel<SPMember> getSPMembersByBelongto(String usertype,String belongto);
	
	public boolean sendEmail(int uid, String code);
}
