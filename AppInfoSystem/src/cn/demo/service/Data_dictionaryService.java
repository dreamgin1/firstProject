package cn.demo.service;

import java.util.List;
import cn.demo.pojo.Data_dictionary;

public interface Data_dictionaryService {
	public List<Data_dictionary> getData_dictionaryList()throws Exception;
	//根据valueid获取对应的所属平台valuename
	public String getFNameById(int id)throws Exception;
	//根据valueid获取对应的APP状态valuename
	public String getSNameById(int id)throws Exception;
}
