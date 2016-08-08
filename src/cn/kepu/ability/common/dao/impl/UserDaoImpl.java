package cn.kepu.ability.common.dao.impl;

import org.springframework.stereotype.Repository;

import cn.kepu.ability.common.bean.User;
import cn.kepu.ability.common.dao.UserDao;
import cn.kepu.base.dao.DaoSupport;

/**
 * 用户信息表
 * @author zhangzl
 */
@Repository("userDao")
public class UserDaoImpl extends DaoSupport<User> implements UserDao {

}
