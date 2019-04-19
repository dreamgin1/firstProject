package cn.demo.service.version;

import java.util.List;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.demo.dao.version.VersionMapper;
import cn.demo.dao.zengqi.App_infoMapper;
import cn.demo.pojo.Version;
import cn.demo.tools.PageUtil;
@Transactional
@Service("/versionService")
public class VersionServiceImpl implements VersionService{
	@Resource
	private VersionMapper versionDao;
	@Resource
	private App_infoMapper App_infoDao;
	@Override
	public int add(Version version) {
		// TODO Auto-generated method stub
		int result=0;
		try {
			result=versionDao.add(version);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public List<Version> getVersionListByAppId(int id) {
		// TODO Auto-generated method stub
		List<Version> list=null;
		try {
			list=versionDao.getVersionListByAppId(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public int modify(Version version) {
		// TODO Auto-generated method stub
		int result=0;
		try {
			result=versionDao.modify(version);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	@Override
	public Version getVersionByAppId(int id) {
		// TODO Auto-generated method stub
		Version version=null;
		try {
			version=versionDao.getVersionByAppId(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return version;
	}
	@Override
	public int del(int id) {
		// TODO Auto-generated method stub
		int result=0;
		try {
			result=versionDao.del(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public List<Version> getVersionListByPageUtil(int id, PageUtil pageUtil) {
		// TODO Auto-generated method stub
		List<Version> list=null;
		try {
			list=versionDao.getVersionListByPageUtil(id, pageUtil);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public int count(int id) {
		// TODO Auto-generated method stub
		int count=0;
		try {
			count=versionDao.count(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}

}
