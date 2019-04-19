package cn.demo.dao.version;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.demo.pojo.Version;
import cn.demo.tools.PageUtil;

public interface VersionMapper {
	//添加版本
	public int add(Version version)throws Exception;
	//根据appid获取历史版本列表
	public List<Version> getVersionListByAppId(int id)throws Exception;
	//修改版本
	public int modify(Version version)throws Exception;
	//根据appid获取最新版本
	public Version getVersionByAppId(int id)throws Exception;
	//根据appid删除所有版本信息
	public int del(int id)throws Exception;
	//根据pageutil查询当前页面的版本列表
	public List<Version> getVersionListByPageUtil(@Param("id") int id,
												@Param("pageUtil") PageUtil pageUtil)throws Exception;
	//根据appid获取对应的版本数量
	public int count(int id)throws Exception;
}
