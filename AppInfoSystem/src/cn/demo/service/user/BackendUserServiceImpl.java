package cn.demo.service.user;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.demo.dao.user.BackendUserMapper;
import cn.demo.pojo.BackEndUser;




/**
 * service层捕获异常，进行事务处理
 */
@Service("backendUserService")
public class BackendUserServiceImpl implements BackendUserService{
	@Resource
	private BackendUserMapper backendUserMapper;

	@Override
	public BackEndUser getLoginUser(String userCode, String userPassword) {
		// TODO Auto-generated method stub
		BackEndUser user = null;
		
		try {
			user = backendUserMapper.getLoginUser(userCode);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	//匹配密码
	if(null != user){
		if(!user.getUserPassword().equals(userPassword))
			user = null;
	}
		return user;
	
	}

}
