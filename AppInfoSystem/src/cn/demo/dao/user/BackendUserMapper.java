package cn.demo.dao.user;

import org.apache.ibatis.annotations.Param;

import cn.demo.pojo.BackEndUser;


/**
 *
 * @author Administrator
 *
 */
public interface BackendUserMapper {
	 //
	public BackEndUser getLoginUser(@Param("userCode")String userCode)throws Exception;
	
}