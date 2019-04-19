package cn.demo.service.user;

import cn.demo.pojo.BackEndUser;

public interface BackendUserService {

	/**
	 * 用户登录
	 * @param userCode
	 * @param userPassword
	 * @return
	 */
	public BackEndUser getLoginUser(String userCode,String userPassword);

}
