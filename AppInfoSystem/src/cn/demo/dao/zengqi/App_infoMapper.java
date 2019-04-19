package cn.demo.dao.zengqi;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.demo.pojo.App_info;


public interface App_infoMapper {
	//查询app列表
	/*public List<App_info> getApp_infoList(@Param("softwareName")String softwareName,
			@Param("status")String status,
			@Param("flatformId")String flatformId,
			@Param("categoryLevel1")String categoryLevel1,
			@Param("categoryLevel2")String categoryLevel2,
			@Param("categoryLevel3")String categoryLevel3,
			@Param("versionNo")String versionNo)throws Exception;*/
	public List<App_info> getApp_infoList(@Param("softwareName")String softwareName,
			@Param("status")String status,
			@Param("flatformId")String flatformId,
			@Param("categoryLevel1")String categoryLevel1,
			@Param("categoryLevel2")String categoryLevel2,
			@Param("categoryLevel3")String categoryLevel3)throws Exception;
	//增加app基础信息
	public int addInfo(App_info app_info)throws Exception;
	//删除app
	public int deleteApp(int id)throws Exception;
	//以id查询app详情
	public App_info AppViewList(int id)throws Exception;
	//根据版本id查询App信息
	public App_info getApp_infoById(int id)throws Exception;

}
