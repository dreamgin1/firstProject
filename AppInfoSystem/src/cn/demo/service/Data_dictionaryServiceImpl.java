package cn.demo.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.demo.dao.zengqi.Data_dictionaryMapper;
import cn.demo.pojo.Data_dictionary;
@Service("data_dictionaryService")
public class Data_dictionaryServiceImpl implements Data_dictionaryService{
	@Resource
	private Data_dictionaryMapper data_dictionaryMapper;
	@Override
	public List<Data_dictionary> getData_dictionaryList() throws Exception {
		// TODO Auto-generated method stub
		return data_dictionaryMapper.getData_dictionaryList();
	}
	@Override
	public String getFNameById(int id) throws Exception {
		// TODO Auto-generated method stub
		String result=null;
		result=data_dictionaryMapper.getFNameById(id);
		return result;
	}
	@Override
	public String getSNameById(int id) throws Exception {
		// TODO Auto-generated method stub
		return data_dictionaryMapper.getSNameById(id);
	}

}
