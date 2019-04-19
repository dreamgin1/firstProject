package cn.demo.dao.version;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.demo.pojo.Version;
import cn.demo.tools.PageUtil;

public interface VersionMapper {
	//��Ӱ汾
	public int add(Version version)throws Exception;
	//����appid��ȡ��ʷ�汾�б�
	public List<Version> getVersionListByAppId(int id)throws Exception;
	//�޸İ汾
	public int modify(Version version)throws Exception;
	//����appid��ȡ���°汾
	public Version getVersionByAppId(int id)throws Exception;
	//����appidɾ�����а汾��Ϣ
	public int del(int id)throws Exception;
	//����pageutil��ѯ��ǰҳ��İ汾�б�
	public List<Version> getVersionListByPageUtil(@Param("id") int id,
												@Param("pageUtil") PageUtil pageUtil)throws Exception;
	//����appid��ȡ��Ӧ�İ汾����
	public int count(int id)throws Exception;
}
