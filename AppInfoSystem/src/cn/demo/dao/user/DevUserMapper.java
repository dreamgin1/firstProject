package cn.demo.dao.user;

import java.sql.Connection;
import java.util.List;
import cn.demo.pojo.DevUser;
import cn.demo.tools.PageUtil;

/**
 *
 * @author Administrator
 *
 */
public interface DevUserMapper {
	
	public DevUser login(String devCode)throws Exception;
	/**
	 * 增加用户信息
	 */
	public int add(DevUser devUser)throws Exception;
	/**
	 * 查询用户列表
	 */
	public List<DevUser> getUserList(String devCode,String devName,PageUtil pageUtil)throws Exception;
	/**
	 * 通过条件查询-用户表记录数
	 */
	public int getUserCount(String devName)throws Exception;
	
	/**
	 * 通过userId删除user
	 */
	public int deleteUserById(Integer id)throws Exception; 
	
	/**
	 * 通过userId获取user
	 */
	public DevUser getUserById(String id)throws Exception; 
	
	/**
	 * 修改用户信息
	 */
	public int modify(DevUser devUser)throws Exception;
	
	
}