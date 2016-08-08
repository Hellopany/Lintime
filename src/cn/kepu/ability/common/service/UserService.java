package cn.kepu.ability.common.service;

import cn.kepu.ability.common.bean.User;
import cn.kepu.utils.PageModel;

/**
 * 用户相关业务处理
 * @author zhangzl
 */
public interface UserService {

	public User getUser(int userId);

	public User getUserByEmail(String email);

	public User getUserByName(String name);

	public User checkUser(User user);

	public User updateLoginInfo(User dbuser, String newip);

	public User updateSecurity(User user, String password);

	public User updateInfo(User user);
	
	public PageModel<User> getUsers(String keywords,String institute,  int pageNo,int pageSize);
	public boolean remove(int uid);
	public boolean remove(int[] ids);


	/**
	 * 重置密码
	 * @param user
	 * @param newpassword
	 * @return
	 */
	public User resetPassword(int uid, String newpassword);

	public boolean sendEmail(int uid, String code);

	/**
	 * 创建新用户
	 * @param user
	 * @param business 
	 * @param types 
	 * @return
	 */
	public User save(User user, String[] types, String[] business);
	
	
}
