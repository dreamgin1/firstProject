package cn.demo.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cn.demo.pojo.BackEndUser;
import cn.demo.service.user.BackendUserService;
import cn.demo.tools.Constants;



@Controller
@RequestMapping(value="/backend")
public class BackendUserController extends BaseController {
	private Logger log = Logger.getLogger(BackendUserController.class);
	
	@Resource
	private BackendUserService backendUserService;

	@RequestMapping("/login")
	public String login(){
		log.debug("UserController welcome SMBMS ================ ");
		return "backendlogin";
	}
	
	@RequestMapping(value="/dologin",method=RequestMethod.POST)
	public String doLogin(@RequestParam String userCode,
						@RequestParam String userPassword,
						HttpSession session,
						HttpServletRequest request){
		log.debug("doLogin ================ ");
		BackEndUser user = backendUserService.getLoginUser(userCode, userPassword);
		if(null != user){
			session.setAttribute(Constants.USER_SESSION, user);
			log.debug("登录成功！ ");
			return "redirect:/backend/main";
			
		}else{
			request.setAttribute("error", "用户名和密码错误!");
			log.debug("登录失败！ ");
			return "backendlogin";
			
		}
	}
	
	@RequestMapping(value="logout")
	public String logout(HttpSession session){
		session.removeAttribute(Constants.USER_SESSION);
		return "backendlogin";
		
	}
	
	@RequestMapping("main")
	public String main(HttpSession session){
		return "backendmain";
	}
	
	@RequestMapping(value="appCheckList")
	public String appCheck(HttpSession session){
		return "appCheckList";
	}
	
	
}
