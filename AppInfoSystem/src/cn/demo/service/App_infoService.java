package cn.demo.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.demo.pojo.App_info;

public interface App_infoService {
		
	public List<App_info> getApp_infoList(@Param("softwareName")String softwareName,
			@Param("statusName")String statusName,
			@Param("flatformName")String flatformName,
			@Param("categoryLevel1Name")String categoryLevel1Name,
			@Param("categoryLevel2Name")String categoryLevel2Name,
			@Param("categoryLevel3Name")String categoryLevel3Name)throws Exception;
	//添加app
	public boolean addInfo(App_info app_info)throws Exception;
	//删除app
	public int deleteApp(int id)throws Exception;
	//查询app列表
	public App_info AppViewList(int id)throws Exception;
	//根据版本id查询App信息
		public App_info getApp_infoById(int id);
}
