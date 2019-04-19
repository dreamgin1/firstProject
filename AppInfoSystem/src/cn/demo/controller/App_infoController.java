package cn.demo.controller;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.math.RandomUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.alibaba.fastjson.JSONArray;
import cn.demo.dao.a;
import cn.demo.pojo.App_category;
import cn.demo.pojo.App_info;
import cn.demo.pojo.DataDictionary;
import cn.demo.pojo.Data_dictionary;
import cn.demo.service.App_categoryService;
import cn.demo.service.App_infoService;

import cn.demo.service.Data_dictionaryService;
import cn.demo.tools.Constants;



@Controller
@RequestMapping("/zengqi")
public class App_infoController  extends BaseController{
	private Logger log = Logger.getLogger(App_infoController.class);
	@Resource 
	private App_infoService app_infoService;
	@Resource 
	private Data_dictionaryService data_dictionaryService;
	@Resource 
	private App_categoryService app_categoryService;

	
	@RequestMapping("/getApp_info")
	public String getApp_info(@RequestParam (value="softwareName",required=false,defaultValue="") String softwareName,
			@RequestParam (value="statusName",required=false,defaultValue="") String statusName,
			@RequestParam (value="flatformName",required=false,defaultValue="") String flatformName,
			@RequestParam (value="categoryLevel1Name",required=false,defaultValue="") String categoryLevel1Name,
			@RequestParam (value="categoryLevel2Name",required=false,defaultValue="") String categoryLevel2Name,
			@RequestParam (value="categoryLevel3Name",required=false,defaultValue="") String categoryLevel3Name,
			@RequestParam (value="versionNo",required=false,defaultValue="") String versionNo,Model model)throws Exception{
		log.debug("app列表处理器启动了====================================");
		
		
		log.debug("============================"+statusName);
		List<App_info> app_infosList = app_infoService.getApp_infoList(softwareName,statusName,flatformName,
				categoryLevel1Name,categoryLevel2Name,categoryLevel3Name);
		List<Data_dictionary> data_dictionariesList = data_dictionaryService.getData_dictionaryList();
		List<App_category> app_categoryList1 = app_categoryService.getcategoryLevel1();
		List<App_category> app_categoryList2 = app_categoryService.getcategoryLevel2();
		List<App_category> app_categoryList3 = app_categoryService.getcategoryLevel3();

		
		model.addAttribute("app_infosList",app_infosList);
		model.addAttribute("data_dictionariesList",data_dictionariesList);
		model.addAttribute("app_categoryList1",app_categoryList1);
		model.addAttribute("app_categoryList2",app_categoryList2);
		model.addAttribute("app_categoryList3",app_categoryList3);
			
		model.addAttribute("softwareName",softwareName);
		model.addAttribute("statusName",statusName);
		model.addAttribute("flatformName",flatformName);
		model.addAttribute("categoryLevel1Name",categoryLevel1Name);
		model.addAttribute("categoryLevel2Name",categoryLevel2Name);
		model.addAttribute("categoryLevel3Name",categoryLevel3Name);
		model.addAttribute("versionNo",versionNo);
		System.out.println("categoryLevel1Name=============================="+categoryLevel1Name);
		return "basics";		
	}
	
	
	
	@RequestMapping("/save")
	public String prosave(@Valid App_info app_info, BindingResult bindingResult ,Model model,HttpSession session,HttpServletRequest request,
			@RequestParam(value="app_infos",required=false)MultipartFile[] app_infos) throws Exception{	
		String errorInfo="";
		System.out.println("添加处理器启动了-------------------------------------------");
		for(int i=0;i<app_infos.length;i++){
			//判断文件是否为空
			if(!app_infos[i].isEmpty()){
				String path = session.getServletContext().getRealPath("statics"+File.separator+"uploadfiles");
				File pathFile = new File(path);
				if(!pathFile.exists()){
					pathFile.mkdirs();
				}
				if(i==0){
					errorInfo = "uploadIdFileError";
				}else if(i==1){
					errorInfo = "uploadWorkFileError";
				}
				String oldFileName = app_infos[i].getOriginalFilename();
				//获取后缀
				String suffix = FilenameUtils.getExtension(oldFileName);
				int fileSize = 5000000;
				if(app_infos[i].getSize() > fileSize){
					request.setAttribute("uploadFileError", "文件大小不能超过500KB;");
					return "App_infoadd";
				}else {
					if(suffix.equalsIgnoreCase("jpg")
							||suffix.equalsIgnoreCase("png")
							||suffix.equalsIgnoreCase("pneg")
							||suffix.equalsIgnoreCase("jpeg")){
						String fileName = System.currentTimeMillis() +RandomUtils.nextInt(1000000)+"_Person."+suffix;
						File targetFile = new File(path,fileName);
						if(!targetFile.exists()){
							targetFile.mkdirs();
						}
						//保存
						try{
							app_infos[i].transferTo(targetFile);
						}catch (Exception e) {
							// TODO: handle exception
							e.printStackTrace();
							request.setAttribute("uploadFileError", "*上传失败");
							return "App_infoadd";
						}
						if(i == 0){
							app_info.setLogoPicPath(path+File.separator+fileName);							
						}else if(i ==1){
							app_info.setLogoPicPath(path+File.separator+fileName);	
							
						}						
					}else{
						request.setAttribute("uploadFileError","文件格式必须为:jpg,png,pneg,jpeg");
						return "App_infoadd";
					}
				}
			}
		}
		
		//app_info.setCreatedBy(((App_info)session.getAttribute(Constants.USER_SESSION)).getId());
		app_info.setCreationDate(new Date());
		if(app_infoService.addInfo(app_info)){																
			return "redirect:/zengqi/getApp_info";
		}else{						
			return "basics";
		}
	}
	
	@RequestMapping("/addApp_info")
	public String addApp_info(Model model,@ModelAttribute("app_info") App_info app_info)throws Exception{
		List<App_category> app_categoryList1 = app_categoryService.getcategoryLevel1();
		List<App_category> app_categoryList2 = app_categoryService.getcategoryLevel2();
		List<App_category> app_categoryList3 = app_categoryService.getcategoryLevel3();
		List<Data_dictionary> data_dictionariesList = data_dictionaryService.getData_dictionaryList();
		int flatformId = 14;
		model.addAttribute("flatformId",flatformId);
		model.addAttribute("app_info",app_info);
		model.addAttribute("app_categoryList1",app_categoryList1);
		model.addAttribute("app_categoryList2",app_categoryList2);
		model.addAttribute("app_categoryList3",app_categoryList3);
		model.addAttribute("data_dictionariesList",data_dictionariesList);
		
		return "App_infoadd";
	}
	@RequestMapping("/CategoryLevels")	
	public String CategoryLevels(Model model)throws Exception{
		List<Data_dictionary> data_dictionariesList = data_dictionaryService.getData_dictionaryList();
		List<App_category> app_categoryList1 = app_categoryService.getcategoryLevel1();
		List<App_category> app_categoryList2 = app_categoryService.getcategoryLevel2();
		List<App_category> app_categoryList3 = app_categoryService.getcategoryLevel3();
		model.addAttribute("data_dictionariesList",data_dictionariesList);
		model.addAttribute("app_categoryList1",app_categoryList1);
		model.addAttribute("app_categoryList2",app_categoryList2);
		model.addAttribute("app_categoryList3",app_categoryList3);
		return "categoryLevels";
	}
	@RequestMapping("/delete/{id}")	
	public int delete(Model model,@PathVariable int id)throws Exception{
		System.out.println("delete==========================="+id);
		int request = app_infoService.deleteApp(id);
		return request;		
	}
	
	@RequestMapping("/AppviewList/{id}")
	public String AppviewList(Model model,@PathVariable int id)throws Exception{
		App_info app_info = app_infoService.AppViewList(id);
		System.out.println("Appview方法启动了---------------"+id);
		model.addAttribute("app_info",app_info);
		return "AppView";		
	}
	
	/*@ResponseBody//将请求返回到页面
	public Object checkUserCode(@RequestParam String userCode){
		User user = userService.selectUserCodeExist(userCode);
		Map<String, Object> resultMap = new HashMap<String,Object>();
		if(user == null){
			resultMap.put("userCode", "noexist");
		}else{
			resultMap.put("userCode", "exist");
		}
		return JSONArray.toJSONString(resultMap);
	}*/
}

