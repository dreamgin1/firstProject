package cn.demo.service.user;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.demo.dao.user.DevUserMapper;
import cn.demo.pojo.DevUser;
import cn.demo.tools.PageUtil;



/**
 * service层捕获异常，进行事务处理
 */@Transactional
@Service("devUserService")
public class DevUserServiceImpl implements DevUserService{
	@Resource
	private DevUserMapper devUserMapper;
	
	@Override
	public DevUser login(String devCode, String devPassword) {
		// TODO Auto-generated method stub
		DevUser user = null;
		
		try {
			user =devUserMapper.login(devCode);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	//匹配密码
		if(null != user){
		if(!user.getDevPassword().equals(devPassword))
			 return null;
	}
	return user;
}

	@Override
	public int add(DevUser devUser) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<DevUser> getUserList(String devCode, String devName, PageUtil pageUtil) throws Exception {
		// TODO Auto-generated method stub
		DevUser user = null;
		List<DevUser> userList = null;
		System.out.println("querydevCode ---- > " + devCode);
		System.out.println("querydevName ---- > " + devName);
		System.out.println("currentPageNo ---- > " + pageUtil.getTotalPageNo());
		System.out.println("pageSize ---- > " + pageUtil.getPageSize());
		
			
			try {
				userList = devUserMapper.getUserList(devCode, devName, pageUtil);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
			return userList;
	
	}

	@Override
	public int getUserCount(String devName) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteUserById(Integer id) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public DevUser getUserById(String id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int modify(DevUser devUser) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
}
