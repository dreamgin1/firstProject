package cn.demo.service.version;

import java.util.List;

import cn.demo.pojo.Version;
import cn.demo.tools.PageUtil;

public interface VersionService {
	//添加版本
	public int add(Version version);
	//根据appid获取历史版本列表
	public List<Version> getVersionListByAppId(int id);
	//修改版本
	public int modify(Version version);
	//根据appid获取最新版本
	public Version getVersionByAppId(int id);
	//根据appid删除所有版本信息
	public int del(int id);
	//根据pageutil查询当前页面的版本列表
	public List<Version> getVersionListByPageUtil(int id,PageUtil pageUtil);
	//根据appid获取对应的版本数量
	public int count(int id);
}
