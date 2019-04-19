package cn.demo.controller;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.math.RandomUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


import cn.demo.dao.version.VersionMapper;
import cn.demo.pojo.App_info;
import cn.demo.pojo.Version;
import cn.demo.service.App_infoService;
import cn.demo.service.version.VersionService;
import cn.demo.tools.PageUtil;

@Controller
@RequestMapping("/version")
public class VersionController extends BaseController{
	
	private Logger log=Logger.getLogger(VersionController.class);
	@Resource
	private App_infoService App_infoservice;
	@Resource
	private VersionService versionService;
	//进入新增app版本页面
	
	@RequestMapping("/add")
	public String add(@ModelAttribute("version") Version version,
				@RequestParam(value="id",required=false,defaultValue="0") int id,
				@RequestParam(value="totalPageNo",required=false,defaultValue="1") int totalPageNo
				,Model model)throws Exception{
		int totalCount=versionService.count(id);
		PageUtil pageUtil=new PageUtil();
		pageUtil.setPageSize(5);
		pageUtil.setTotalCount(totalCount);
		if(totalPageNo>pageUtil.getTotalPageCount()){
			totalPageNo=pageUtil.getTotalPageCount();
		}else if(totalPageNo<1){
			totalPageNo=1;
		}
		pageUtil.setTotalPageNo(totalPageNo);
		App_info app_info=App_infoservice.getApp_infoById(id);
		model.addAttribute("app_info", app_info);
		List<Version> versionList=versionService.getVersionListByPageUtil(id, pageUtil);
		model.addAttribute("pageUtil", pageUtil);
		model.addAttribute("versionList",versionList);
		model.addAttribute("appId", id);
		return "versionadd";
	}
	//新增处理页面
	@RequestMapping("doadd")
	public String doadd(@RequestParam(value="a-apkLocPath",required=false) MultipartFile apkLocPath,
			Version version,HttpSession session,HttpServletRequest request) throws Exception{
			if(!apkLocPath.isEmpty()){
					String path=session.getServletContext().getRealPath("statics"+File.separator+"uploadfiles");
					String path1="statics"+File.separator+"uploadfiles";
					File pathFile=new File(path);
					if(!pathFile.exists()){
						pathFile.mkdirs();
					}
					String oldFileName=apkLocPath.getOriginalFilename();
					//获取后缀
					String suffix=FilenameUtils.getExtension(oldFileName);
					int fileSize=500000;
					if(apkLocPath.getSize()>fileSize){
						request.setAttribute("uploadFileError", "文件大小不得超过500MB");
						return "versionadd";
					}else{
						if(suffix.equalsIgnoreCase("jpg")){
							String fileName=System.currentTimeMillis()+RandomUtils.nextInt(1000000)+"_Person."+suffix;
							File targetFile=new File(path,fileName);
							if(targetFile.exists()){
								targetFile.mkdirs();
							}
							try{
								apkLocPath.transferTo(targetFile);
							}catch (Exception e) {
								// TODO: handle exception
								e.printStackTrace();
								request.setAttribute("uploadFileError", "上传失败");
								return "versionadd";
							}
							version.setDownloadLink(path1+File.separator+fileName);
							version.setApkFileName(fileName);
							version.setApkLocPath(path+File.separator+fileName);
						}else{
							request.setAttribute("uploadFileError", "文件格式不正确");
							return "versionadd";
					
						}
					}
				}
			/*version.setCreatedBy(session.getAttribute(""));*/
		version.setPublishStatus(3);
		version.setCreatedBy(1);
		version.setCreationDate(new Date());
		int result=versionService.add(version);
		App_info app_info=App_infoservice.getApp_infoById(version.getAppId());
		app_info.setVersionId(version.getId());
		return "success";
	}
	
	//进入修改版本界面
	@RequestMapping("/modify")
	public String modify(Model model,
					@RequestParam(value="id",required=false,defaultValue="0") int id,
					@RequestParam(value="totalPageNo",required=false,defaultValue="1") int totalPageNo
						,@ModelAttribute("version2") Version version2){
		int totalCount=versionService.count(id);
		PageUtil pageUtil=new PageUtil();
		pageUtil.setPageSize(5);
		pageUtil.setTotalCount(totalCount);
		if(totalPageNo>pageUtil.getTotalPageCount()){
			totalPageNo=pageUtil.getTotalPageCount();
		}else if(totalPageNo<1){
			totalPageNo=1;
		}
		pageUtil.setTotalPageNo(totalPageNo);
		List<Version> versionList=versionService.getVersionListByPageUtil(id, pageUtil);
		model.addAttribute("versionList",versionList);
		Version version=versionService.getVersionByAppId(id);
		model.addAttribute("version", version);
		model.addAttribute("appId", id);
		model.addAttribute("pageUtil", pageUtil);
		return "versionmodify";
	}
	
	//修改处理页面
	@RequestMapping("/domodify")
	public String domodify(Version version2){
		int result=versionService.modify(version2);
		return "success";
	}
}  
