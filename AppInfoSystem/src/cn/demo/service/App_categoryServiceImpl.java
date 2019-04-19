package cn.demo.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.demo.dao.zengqi.App_categoryMapper;
import cn.demo.pojo.App_category;
@Service("app_categoryService")
public class App_categoryServiceImpl implements App_categoryService {
	@Resource
	private App_categoryMapper app_categoryMapper;
	@Override
	public List<App_category> getApp_categoryList() throws Exception {
		// TODO Auto-generated method stub
		return app_categoryMapper.getApp_categoryList();
	}
	@Override
	public List<App_category> getcategoryLevel1() throws Exception {
		// TODO Auto-generated method stub
		return app_categoryMapper.getcategoryLevel1();
	}
	@Override
	public List<App_category> getcategoryLevel2() throws Exception {
		// TODO Auto-generated method stub
		return app_categoryMapper.getcategoryLevel2();
	}
	@Override
	public List<App_category> getcategoryLevel3() throws Exception {
		// TODO Auto-generated method stub
		return app_categoryMapper.getcategoryLevel3();
	}
	@Override
	public String getNameById(int id) throws Exception {
		// TODO Auto-generated method stub
		return app_categoryMapper.getNameById(id);
	}
	
}
