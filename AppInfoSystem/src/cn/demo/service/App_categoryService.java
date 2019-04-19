package cn.demo.service;

import java.util.List;

import cn.demo.pojo.App_category;

public interface App_categoryService {
	public List<App_category> getApp_categoryList()throws Exception;
	//查询一级分类列表
	public List<App_category> getcategoryLevel1()throws Exception;
	//查询一级分类列表
	public List<App_category> getcategoryLevel2()throws Exception;
	//查询一级分类列表
	public List<App_category> getcategoryLevel3()throws Exception;
	//根据id获取分类名称
	public String getNameById(int id)throws Exception;
}
