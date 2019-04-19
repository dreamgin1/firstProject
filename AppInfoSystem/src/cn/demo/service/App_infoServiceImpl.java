package cn.demo.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import cn.demo.dao.zengqi.App_infoMapper;
import cn.demo.pojo.App_info;

@Service("app_infoService")
public class App_infoServiceImpl implements App_infoService{
	@Resource
	private App_infoMapper app_infoMapper;
	
	@Override
	public boolean addInfo(App_info app_info) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;			
			int updateRows = app_infoMapper.addInfo(app_info);
			if(updateRows > 0){
				flag = true;
				System.out.println("add success!");
			}else{
				System.out.println("add failed!");
			}					
		return flag;
	}



	@Override
	public List<App_info> getApp_infoList(String softwareName, String statusName, String flatformName, String categoryLevel1Name,
			String categoryLevel2Name, String categoryLevel3Name) throws Exception {
		// TODO Auto-generated method stub
		return app_infoMapper.getApp_infoList(softwareName, statusName, flatformName, categoryLevel1Name, categoryLevel2Name, categoryLevel3Name);
	}



	@Override
	public int deleteApp(int id) throws Exception {
		// TODO Auto-generated method stub
		return app_infoMapper.deleteApp(id);
	}


	//以id查询app列表
	@Override
	public App_info AppViewList(int id) throws Exception {
		// TODO Auto-generated method stub
		return app_infoMapper.AppViewList(id);
	}	
	
	@Override
	public App_info getApp_infoById(int id) {
		// TODO Auto-generated method stub
		App_info ai=null;
		try {
			ai=app_infoMapper.getApp_infoById(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ai;
	}
}
